----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- qb-core + ox_lib + ox_inventory rewrite

local QBCore = exports['qb-core']:GetCoreObject()
local boii = {}

-- ===== SERVER BANNER =====
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print('^5--<^3!^5>-- ^7BOII ^5| ^7DEVELOPMENT ^5--<^3!^5>-- ^7ACTIVITY: PAWNSHOP (ox rewrite) ^5--<^3!^5>--^7')
end)

-- ===== DEBUG PRINT =====
function boii.debug(colour, typ, msg)
    print(('^%s[%s] ^7- %s'):format(colour, typ, msg))
end

RegisterServerEvent('boii:debug', function(colour, typ, msg)
    boii.debug(colour or 1, typ or 'DEBUG', msg or '')
end)

-- ===== ADD/REMOVE ITEM EVENTS (compat) =====
RegisterServerEvent('boii-pawnshop:sv:RemoveItem', function(item, amount)
    local src = source
    amount = tonumber(amount) or 1
    exports.ox_inventory:RemoveItem(src, item, amount)
end)

RegisterServerEvent('boii-pawnshop:sv:AddItem', function(item, amount)
    local src = source
    amount = tonumber(amount) or 1
    exports.ox_inventory:AddItem(src, item, amount)
end)

-- ===== HELPERS =====
local function getStoreCfg(store)
    -- store is one of: 'Pawnshop', 'Techshop', 'Fence', etc.
    return Config[store] or Config.Pawnshop
end

local function getAccount(storeCfg, kind) -- kind: 'Buy'|'Sell'
    local acct = (storeCfg.Money and storeCfg.Money[kind]) or 'cash'
    return acct
end

local function getPlayer(src)
    return QBCore.Functions.GetPlayer(src)
end

-- Inclusive, GTA-time-friendly hours check (supports overnight windows)
local function isWithinHours(openH, closeH, hourNow)
    local h = tonumber(hourNow) or 0
    local open  = tonumber(openH)  or 0
    local close = tonumber(closeH) or 24
    if open == close then return true end                        -- 24/7
    if open < close then return h >= open and h <= close end     -- inclusive end
    return (h >= open) or (h <= close)                           -- overnight inclusive
end

-- ===== SELL ITEMS (player -> shop) =====
RegisterServerEvent('boii-pawnshop:sv:SellItems', function(args)
    local src = source
    local name = GetPlayerName(src)
    local pData = getPlayer(src)

    local box = (args and args.args) or args or {}
    local item  = box.item
    local price = tonumber(box.price) or 0
    local store = box.store or 'Pawnshop'

    if not item or price <= 0 then
        TriggerClientEvent('boii-pawnshop:notify', src, 'Invalid sell request', 'error')
        return
    end

    local storeCfg   = getStoreCfg(store)
    local account    = getAccount(storeCfg, 'Sell')
    local count      = exports.ox_inventory:GetItemCount(src, item)

    if (count or 0) <= 0 then
        TriggerClientEvent('boii-pawnshop:notify', src, Language.Pawnshop.Sell['nosell'], 'error')
        return
    end

    local pay = math.ceil(count * price)

    if not exports.ox_inventory:RemoveItem(src, item, count) then
        TriggerClientEvent('boii-pawnshop:notify', src, 'Failed to remove items', 'error')
        return
    end

    pData.Functions.AddMoney(account, pay, ('Sell %s to %s'):format(item, store))
    TriggerClientEvent('boii-pawnshop:notify', src, (Language.Pawnshop.Sell['sold'] .. pay), 'success')

    if Config.UseSQL then
        local result = MySQL.query.await('SELECT amount FROM pawnshop_items WHERE store = ? AND item = ?', { store, item })
        if not (result and result[1]) then
            MySQL.update.await('INSERT INTO pawnshop_items (store, item, amount) VALUES (?, ?, ?)', { store, item, count })
            if Config.Debug then
                boii.debug(1, 'PAWNSHOP', ('%s sold new item to %s. {item:%s, amount:%d, pay:$%d, stock:%d}')
                    :format(name, store, item, count, pay, count))
            end
        else
            local current = tonumber(result[1].amount) or 0
            local newamt  = current + count
            MySQL.update.await('UPDATE pawnshop_items SET amount = ? WHERE store = ? AND item = ?', { newamt, store, item })
            if Config.Debug then
                boii.debug(1, 'PAWNSHOP', ('%s sold to %s. {item:%s, amount:%d, pay:$%d, stock:%d}')
                    :format(name, store, item, count, pay, newamt))
            end
        end
    else
        if Config.Debug then
            boii.debug(1, 'PAWNSHOP', ('%s sold to %s. {item:%s, amount:%d, pay:$%d}')
                :format(name, store, item, count, pay))
        end
    end
end)

-- ===== BUY ITEMS (shop -> player) =====
RegisterServerEvent('boii-pawnshop:sv:BuyItems', function(store, item, price, buymultiplier, amount)
    local src   = source
    local name  = GetPlayerName(src)
    local pData = getPlayer(src)

    store         = store or 'Pawnshop'
    item          = item
    price         = tonumber(price) or 0
    buymultiplier = tonumber(buymultiplier) or 1
    amount        = math.max(1, tonumber(amount) or 1)

    if not item or price <= 0 then
        TriggerClientEvent('boii-pawnshop:notify', src, 'Invalid purchase request', 'error')
        return
    end

    local storeCfg = getStoreCfg(store)
    local account  = getAccount(storeCfg, 'Buy')
    local cost     = math.ceil(price * buymultiplier * amount)

    local hasEnough = (pData.Functions.GetMoney(account) or 0) >= cost
    if not hasEnough then
        TriggerClientEvent('boii-pawnshop:notify', src, Language.Pawnshop.Buy['enoughmoney'], 'error')
        return
    end

    local fromStock = false
    local currentStock = 0
    if Config.UseSQL then
        local row = MySQL.single.await('SELECT amount FROM pawnshop_items WHERE store = ? AND item = ?', { store, item })
        if row and row.amount and row.amount > 0 then
            fromStock = true
            currentStock = tonumber(row.amount) or 0
            if currentStock < amount then
                TriggerClientEvent('boii-pawnshop:notify', src, (Language.Pawnshop.Buy['nostock'] .. ' {' .. currentStock .. '}'), 'error')
                return
            end
        end
    end

    if not pData.Functions.RemoveMoney(account, cost, ('Buy %s from %s'):format(item, store)) then
        TriggerClientEvent('boii-pawnshop:notify', src, Language.Pawnshop.Buy['enoughmoney'], 'error')
        return
    end

    if not exports.ox_inventory:AddItem(src, item, amount) then
        pData.Functions.AddMoney(account, cost, 'Refund: inventory full')
        TriggerClientEvent('boii-pawnshop:notify', src, 'Inventory full', 'error')
        return
    end

    if Config.UseSQL and fromStock then
        local newamt = currentStock - amount
        MySQL.update.await('UPDATE pawnshop_items SET amount = ? WHERE store = ? AND item = ?', { newamt, store, item })
        if Config.Debug then
            boii.debug(1, 'PAWNSHOP', ('%s bought from %s stock. {item:%s, amount:%d, cost:$%d, stock:%d}')
                :format(name, store, item, amount, cost, newamt))
        end
    else
        if Config.Debug then
            boii.debug(1, 'PAWNSHOP', ('%s bought fixed item from %s. {item:%s, amount:%d, cost:$%d}')
                :format(name, store, item, amount, cost))
        end
    end
end)

-- ===== SMELT ITEMS (uses GTA hour if provided; inclusive close) =====
RegisterServerEvent('boii-pawnshop:sv:SmeltItems', function(args)
    local src   = source
    local pData = getPlayer(src)

    local box = (args and args.args) or args or {}
    local item          = box.item
    local amount        = tonumber(box.amount) or 0
    local time          = tonumber(box.time) or 0
    local return_item   = box.returnitem
    local return_amount = tonumber(box.returnamount) or 0
    local gameHour      = tonumber(box.gameHour)   -- <-- GTA hour from client (optional)

    if not item or amount <= 0 or not return_item or return_amount <= 0 then
        TriggerClientEvent('boii-pawnshop:notify', src, 'Invalid smelt request', 'error')
        return
    end

    -- Time gate (server-side): prefer GTA hour if sent, else fall back to system hour
    if Config.Smelting and Config.Smelting.Times and Config.Smelting.Times.Use then
        local hour = gameHour
        if hour == nil then
            hour = tonumber(os.date('%H')) or 0
        end
        local open  = Config.Smelting.Times.Open
        local close = Config.Smelting.Times.Close

        if not isWithinHours(open, close, hour) then
            TriggerClientEvent('boii-pawnshop:notify', src, (Language.Smelting and Language.Smelting['timer']) or 'Smelter is closed right now', 'error')
            return
        end
    end

    local have = exports.ox_inventory:GetItemCount(src, item)
    if (have or 0) < amount then
        TriggerClientEvent('boii-pawnshop:notify', src, (Language.Smelting and Language.Smelting['enoughitems']) or 'Not enough items', 'error')
        return
    end

    -- Start client animation/progress; the client will remove/add items (or you can move that here if you prefer atomic server ops)
    TriggerClientEvent('boii-pawnshop:cl:SmeltItems', src, time, item, amount, return_item, return_amount)
end)
