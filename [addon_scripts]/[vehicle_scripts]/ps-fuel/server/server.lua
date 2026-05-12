local USE_QBOX   = GetResourceState('qbx_core') == 'started'
local USE_QBCORE = GetResourceState('qb-core') == 'started'
local USE_OXINV  = GetResourceState('ox_inventory') == 'started'

local Framework = {}

if USE_QBOX then
    Framework.GetPlayer = function(src) return exports.qbx_core:GetPlayer(src) end
elseif USE_QBCORE then
    local QBCore = exports['qb-core']:GetCoreObject()
    Framework.QBCore = QBCore
    Framework.GetPlayer = function(src) return QBCore.Functions.GetPlayer(src) end
else
    error('[ps-fuel] Neither qbx_core nor qb-core is running.')
end

-- ======== Config / Utils ========

local function GlobalTax(value)
    local tax = (value / 100 * Config.GlobalTax)
    return tax
end

local function removeMoney(player, account, amount, reason)
    if not player or not player.Functions or not player.Functions.RemoveMoney then return false end
    return player.Functions.RemoveMoney(account, amount, reason or 'fuel')
end

local function giveJerryCan(src)
    if USE_OXINV then
        return exports.ox_inventory:AddItem(src, 'WEAPON_PETROLCAN', 1, { ammo = 100, durability = 100 })
    else
        local Player = Framework.GetPlayer(src)
        if not Player then return false end
        return Player.Functions.AddItem('weapon_petrolcan', 1)
    end
end

-- ======== Events / Callbacks ========

RegisterNetEvent("ps-fuel:server:OpenMenu", function(amount, inGasStation, hasWeapon)
    local src = source
    if not src then return end
    local player = Framework.GetPlayer(src)
    if not player then return end

    local tax = GlobalTax(amount or 0)
    local total = math.ceil((amount or 0) + tax)

    TriggerClientEvent('ps-fuel:client:ShowInput', src, total)
end)

if USE_QBCORE and Framework.QBCore then
    Framework.QBCore.Functions.CreateCallback('ps-fuel:server:fuelCan', function(source, cb)
        local src = source
        if USE_OXINV then
            local items = exports.ox_inventory:Search(src, 'slots', 'WEAPON_PETROLCAN')
            cb(items and items[1] or false)
        else
            local Player = Framework.GetPlayer(src)
            if not Player then return cb(false) end
            local itemData = Player.Functions.GetItemByName("weapon_petrolcan")
            cb(itemData or false)
        end
    end)
elseif lib and lib.callback then
    lib.callback.register('ps-fuel:server:fuelCan', function(source)
        local src = source
        if USE_OXINV then
            local items = exports.ox_inventory:Search(src, 'slots', 'WEAPON_PETROLCAN')
            return (items and items[1]) or false
        else
            local Player = Framework.GetPlayer(src)
            if not Player then return false end
            return Player.Functions.GetItemByName("weapon_petrolcan") or false
        end
    end)
end

RegisterNetEvent("ps-fuel:server:PayForFuel", function(amount, paymentMethod)
    local src = source
    if not src then return end
    local player = Framework.GetPlayer(src)
    if not player then return end
    amount = tonumber(amount or 0) or 0
    if amount <= 0 then return end
    removeMoney(player, paymentMethod or 'cash', amount, 'fuel')
end)

RegisterNetEvent('ps-fuel:server:BuyCan', function(paymentMethod)
    local src = source
    if not src or not paymentMethod then return end
    local Player = Framework.GetPlayer(src)
    if not Player then return end

    local given = giveJerryCan(src)
    if not given then return end

    removeMoney(Player, paymentMethod, Config.canCost, 'purchased jerry can')

    TriggerClientEvent('ps-fuel:client:notify', src, Lang:t('info.purchased_jerry_can', { value = Config.canCost }), 'success')
end)

RegisterNetEvent('ps-fuel:server:UpdateDurability', function(weaponData, weaponDurability)
    local src = source
    if not USE_OXINV then return end
    if not weaponData or weaponData.name ~= "WEAPON_PETROLCAN" then return end

    local slot = weaponData.slot
    if not slot then return end

    local dur = tonumber(weaponDurability) or 100
    if dur < 0 then dur = 0 end
    if dur > 100 then dur = 100 end

    exports.ox_inventory:SetMetadata(src, slot, { ammo = dur, durability = dur })
end)
