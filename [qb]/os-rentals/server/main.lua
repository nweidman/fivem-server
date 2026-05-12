-- server.lua
-- deps: qbx_core (bank money), okokBanking (optional transaction log), ox_inventory (optional papers item)

local ActiveRentals = {} -- [src] = { plate, model, label, price, at }

-- ======================
-- Config
-- ======================
local Config = {
    OneActiveRental  = true,
    RefundRate       = 0.75,              -- 75% refund on return
    GivePapersItem   = true,              -- set false to disable papers entirely
    PapersItemName   = 'rentalpapers',

    Prices = {
        -- cars
        asterope = 1000,
        bison    = 1000,
        glendale = 1000,
        futo     = 1000,
        sultan   = 1000,
        -- boats
        jetmax   = 2500,
        seashark = 1500,
        -- accept by label too (optional)
        ['Asterope'] = 1000,
        ['Bison']    = 1000,
        ['Glendale'] = 1000,
        ['Futo']     = 1000,
        ['Sultan']   = 1000,
        ['Jetmax']   = 2500,
        ['Seashark'] = 1500,
    }
}

-- ======================
-- Utils
-- ======================
local function notify(src, msg, typ)
    TriggerClientEvent('qbx_core:notify', src, msg, typ or 'inform')
end

local function normalizeLabel(label)
    if type(label) ~= 'string' then return nil end
    label = label:gsub('%s+', ' '):gsub('^%s+', ''):gsub('%s+$', '')
    return label
end

local function getConfigPrice(model, label)
    if model and type(model) == 'string' then
        local m = model:lower()
        if Config.Prices[m] then return Config.Prices[m], m end
    end
    label = normalizeLabel(label)
    if label and Config.Prices[label] then
        return Config.Prices[label], model and model:lower() or nil
    end
    return nil, model and model:lower() or nil
end

local function okokStarted()
    return GetResourceState('okokBanking') == 'started'
end

local function oxInvStarted()
    return GetResourceState('ox_inventory') == 'started'
end

-- Create an okokBanking transaction log (purely cosmetic/history)
local function logTransaction(src, value, reason, receiver_name, receiver_identifier)
    if not okokStarted() then return end
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    local name = (Player.PlayerData.charinfo and (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname)) or ('Player '..tostring(src))
    local identifier = Player.PlayerData.citizenid or tostring(src)

    -- For rental charge: receiver_name='Rental Service', receiver_identifier='rental'
    -- For refund: you can flip sender/receiver labels if you prefer
    TriggerEvent('okokBanking:AddNewTransaction',
        receiver_name or 'Rental Service', receiver_identifier or 'rental',
        name, identifier,
        math.floor(tonumber(value) or 0),
        reason or 'Vehicle Rental'
    )
end

-- BANK ONLY: take money from player's bank
local function chargeBank(src, amount, reason)
    amount = math.floor(tonumber(amount) or 0)
    if amount <= 0 then return true end
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return false end
    local ok = false
    if Player.Functions and Player.Functions.RemoveMoney then
        ok = Player.Functions.RemoveMoney('bank', amount, reason or 'rental charge') == true
    elseif Player.removeMoney then
        ok = Player.removeMoney('bank', amount, reason or 'rental charge') == true
    end
    if ok then logTransaction(src, -amount, reason or 'Rental Charge') end
    return ok
end

-- BANK ONLY: give money to player's bank
local function creditBank(src, amount, reason)
    amount = math.floor(tonumber(amount) or 0)
    if amount <= 0 then return true end
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return false end
    local ok = false
    if Player.Functions and Player.Functions.AddMoney then
        ok = Player.Functions.AddMoney('bank', amount, reason or 'rental refund') == true
    elseif Player.addMoney then
        ok = Player.addMoney('bank', amount, reason or 'rental refund') == true
    end
    if ok then logTransaction(src, amount, reason or 'Rental Refund') end
    return ok
end

-- Optional papers item via ox_inventory (safe if ox not running)
local function givePapers(src, plate, vehicleLabel, price, model)
    if not Config.GivePapersItem or not oxInvStarted() then return end
    local meta = {
        plate = plate,
        vehicle = vehicleLabel,
        price = tonumber(price) or 0,
        model = model,
        rentedAt = os.time()
    }
    exports.ox_inventory:AddItem(src, Config.PapersItemName, 1, meta)
end

local function takeAnyPapers(src)
    if not Config.GivePapersItem or not oxInvStarted() then return end
    local inv = exports.ox_inventory
    local slots = inv:Search(src, 'slots', Config.PapersItemName)
    if type(slots) == 'table' then
        -- remove just one (first found)
        for _, item in ipairs(slots) do
            if item and item.slot then
                inv:RemoveItem(src, Config.PapersItemName, 1, nil, item.slot)
                break
            end
        end
    end
end

local function canStartRental(src)
    return (not Config.OneActiveRental) or (ActiveRentals[src] == nil)
end

AddEventHandler('playerDropped', function() ActiveRentals[source] = nil end)

-- Optional: precheck callback if you want to call this BEFORE spawn (not required)
lib.callback.register('qb-rental:precheck', function(src, modelOrLabel)
    local price = getConfigPrice(modelOrLabel, modelOrLabel)
    if not price then
        return false, 'Invalid vehicle', 0
    end
    if not canStartRental(src) then
        return false, 'You already have an active rental.', price
    end
    return true, 'OK', price
end)

-- ======================
-- Start rental (charge + track)
-- ======================
RegisterNetEvent('qb-rental:rentalpapers', function(plate, vehicleLabel, clientMoney, model)
    local src = source
    plate = tostring(plate or '')
    vehicleLabel = normalizeLabel(vehicleLabel or '')

    local price, normalizedModel = getConfigPrice(model, vehicleLabel)
    if not price then
        print(('[rental] reject %d - unknown vehicle label=%s model=%s'):format(src, tostring(vehicleLabel), tostring(model)))
        notify(src, 'Invalid rental vehicle.', 'error')
        return
    end

    if not canStartRental(src) then
        notify(src, 'You already have an active rental. Return it first.', 'error')
        return
    end

    -- Anti-tamper log only (we use server price regardless)
    if tonumber(clientMoney) ~= tonumber(price) then
        print(('[rental] price mismatch %d: client=%s server=%s label=%s model=%s')
            :format(src, tostring(clientMoney), tostring(price), tostring(vehicleLabel), tostring(model)))
    end

    if not chargeBank(src, price, 'Rental Charge') then
        notify(src, 'Not enough bank funds.', 'error')
        return
    end

    givePapers(src, plate, vehicleLabel, price, normalizedModel)
    ActiveRentals[src] = {
        plate = plate,
        model = normalizedModel,
        label = vehicleLabel,
        price = tonumber(price) or 0,
        at = os.time()
    }

    notify(src, ('Rental started: %s (%s).'):format(vehicleLabel or (normalizedModel or 'vehicle'), plate), 'success')
end)

-- ======================
-- Return rental (refund 75%)
-- ======================
RegisterNetEvent('qb-rental:removepapers', function()
    local src = source
    local record = ActiveRentals[src]

    if not record then
        -- Still clear papers if present; no refund without a record
        takeAnyPapers(src)
        notify(src, 'No active rental found. Papers cleared (if any).', 'inform')
        return
    end

    local rate = tonumber(Config.RefundRate) or 0
    if rate < 0 then rate = 0 end
    if rate > 1 then rate = 1 end

    local refund = math.floor((tonumber(record.price) or 0) * rate + 0.5)

    if refund > 0 then
        local ok = creditBank(src, refund, 'Rental Refund')
        if ok then
            notify(src, ('Rental returned. Refunded $%d.'):format(refund), 'success')
        else
            notify(src, ('Rental returned. Refund failed (amount $%d).'):format(refund), 'error')
        end
    else
        notify(src, 'Rental returned.', 'success')
    end

    takeAnyPapers(src)
    ActiveRentals[src] = nil
end)
