local Ev = {}
do
    local sdEv = SD and SD.Events or nil
    function Ev.on(name, handler)
        if sdEv and type(sdEv) == 'table' and type(sdEv.Register) == 'function' then
            return sdEv.Register(name, handler)
        elseif sdEv and type(sdEv) == 'table' and type(sdEv.on) == 'function' then
            return sdEv.on(name, handler)
        else
            RegisterNetEvent(name)
            return AddEventHandler(name, handler)
        end
    end
    function Ev.emit(name, ...)
        if sdEv and type(sdEv) == 'table' and type(sdEv.Trigger) == 'function' then
            return sdEv.Trigger(name, ...)
        elseif sdEv and type(sdEv) == 'table' and type(sdEv.emit) == 'function' then
            return sdEv.emit(name, ...)
        else
            return TriggerEvent(name, ...)
        end
    end
    function Ev.emitClient(target, name, ...)
        if sdEv and type(sdEv) == 'table' and type(sdEv.TriggerClient) == 'function' then
            return sdEv.TriggerClient(target, name, ...)
        elseif sdEv and type(sdEv) == 'table' and type(sdEv.emitClient) == 'function' then
            return sdEv.emitClient(target, name, ...)
        else
            return TriggerClientEvent(name, target, ...)
        end
    end
end

local function _getPlayerFromSD(source)
    local P = SD and SD.Players or nil
    if P then
        if type(P) == 'function' then
            local ok, ply = pcall(P, source)
            if ok and ply then return ply end
        elseif type(P) == 'table' then
            if type(P.Get) == 'function' then return P.Get(source) end
            if type(P.get) == 'function' then return P.get(source) end
            if type(P.BySource) == 'function' then return P.BySource(source) end
            if type(P.fromSource) == 'function' then return P.fromSource(source) end
        end
    end
    if SD and type(SD.GetPlayer) == 'function' then
        return SD.GetPlayer(source)
    end
    return nil
end

local function _invGetCount(source, item)
    local Inv = SD and SD.Inventory or nil
    if not Inv then return 0 end
    if type(Inv.HasItem) == 'function' then
        local ok, val = pcall(Inv.HasItem, source, item)
        if ok then
            if type(val) == 'number' then return val end
            if val == true then return 1 end
        end
    end
    if type(Inv.GetItemCount) == 'function' then
        local ok, cnt = pcall(Inv.GetItemCount, source, item)
        if ok and type(cnt) == 'number' then return cnt end
    end
    return 0
end

local function _invRemove(source, item, amount)
    local Inv = SD and SD.Inventory or nil
    amount = amount or 1
    if not Inv then return false end
    if type(Inv.RemoveItem) == 'function' then
        return Inv.RemoveItem(source, item, amount) ~= false
    end
    if type(Inv.TakeItem) == 'function' then
        return Inv.TakeItem(source, item, amount) ~= false
    end
    return false
end

local function _invAdd(source, item, amount, metadata, slot)
    local Inv = SD and SD.Inventory or nil
    amount = amount or 1
    if not Inv then return false end
    if type(Inv.AddItem) == 'function' then
        return Inv.AddItem(source, item, amount, metadata, slot) ~= false
    end
    if type(Inv.GiveItem) == 'function' then
        return Inv.GiveItem(source, item, amount, metadata, slot) ~= false
    end
    return false
end

local function _invCanCarry(source, item, amount)
    local Inv = SD and SD.Inventory or nil
    if not Inv then return true end
    if type(Inv.CanCarry) == 'function' then
        local ok, can = pcall(Inv.CanCarry, source, item, amount)
        if ok and can ~= nil then return can end
    end
    return true
end

local function _moneyGet(source, account)
    local Money = SD and SD.Money or nil
    if Money and type(Money.GetPlayerAccountFunds) == 'function' then
        local ok, bal = pcall(Money.GetPlayerAccountFunds, source, account)
        if ok and type(bal) == 'number' then return bal end
    end
    if Money and type(Money.Get) == 'function' then
        local ok, bal = pcall(Money.Get, source, account)
        if ok and type(bal) == 'number' then return bal end
    end
    local ply = _getPlayerFromSD(source)
    if ply then
        if type(ply.GetMoney) == 'function' then
            local bal = ply.GetMoney(account)
            if type(bal) == 'number' then return bal end
        end
        if ply.Functions and type(ply.Functions.GetMoney) == 'function' then
            local bal = ply.Functions.GetMoney(account)
            if type(bal) == 'number' then return bal end
        end
    end
    return 0
end

local function _moneyHas(source, account, amount)
    return _moneyGet(source, account) >= (amount or 0)
end

local function _moneyRemove(source, account, amount)
    amount = math.floor(tonumber(amount) or 0)
    if amount <= 0 then return true end
    local Money = SD and SD.Money or nil
    if Money and type(Money.RemoveMoney) == 'function' then
        local ok, res = pcall(Money.RemoveMoney, source, account, amount)
        if ok then return res ~= false end
    end
    if Money and type(Money.Remove) == 'function' then
        local ok, res = pcall(Money.Remove, source, account, amount)
        if ok then return res ~= false end
    end
    if Money and type(Money.Add) == 'function' then
        local ok, res = pcall(Money.Add, source, account, -amount)
        if ok then return res ~= false end
    end
    local ply = _getPlayerFromSD(source)
    if ply then
        if type(ply.RemoveMoney) == 'function' then
            return ply.RemoveMoney(account, amount) ~= false
        end
        if ply.Functions and type(ply.Functions.RemoveMoney) == 'function' then
            return ply.Functions.RemoveMoney(account, amount) ~= false
        end
        if type(ply.SetMoney) == 'function' then
            local cur = _moneyGet(source, account)
            if cur >= amount then
                local ok = pcall(ply.SetMoney, account, cur - amount)
                if ok then return true end
            end
        end
    end
    return false
end

local function _notify(src, title, message, notifyType)
    notifyType = notifyType or 'inform'
    Ev.emitClient(src, 'd,-blackmarket:notify', title, message, notifyType)
end

local function getPlayerAdapter(source)
    local ply = _getPlayerFromSD(source)
    if not ply then return nil end
    if not ply.Items then ply.Items = {} end
    if type(ply.Items.Has) ~= 'function' then
        function ply.Items:Has(item, amount)
            return _invGetCount(source, item) >= (amount or 1)
        end
    end
    if type(ply.Items.Remove) ~= 'function' then
        function ply.Items:Remove(item, amount)
            return _invRemove(source, item, amount or 1)
        end
    end
    if type(ply.Items.Add) ~= 'function' then
        function ply.Items:Add(item, amount, metadata, slot)
            return _invAdd(source, item, amount or 1, metadata, slot)
        end
    end
    if type(ply.Notify) ~= 'function' then
        function ply:Notify(title, message, notifyType)
            _notify(source, title, message, notifyType)
        end
    end
    if type(ply.CanCarry) ~= 'function' then
        function ply:CanCarry(item, amount)
            return _invCanCarry(source, item, amount or 1)
        end
    end
    return ply
end

local function _getCurrencyConfig()
    if Config.Currency and type(Config.Currency) == 'table' then
        local mode = Config.Currency.mode

        if mode == 'cash' then
            local acc = Config.Currency.money or 'cash'
            return { mode = 'cash', money = acc, label = (acc:gsub("^%l", string.upper)) }

        elseif mode == 'crypto' then
            local acc = Config.Currency.crypto or 'crypto'
            return { mode = 'crypto', crypto = acc, label = 'Crypto' }

        else
            local item = Config.Currency.item or { name = 'market_bills', label = 'Market Bills' }
            item.name  = item.name or 'market_bills'
            item.label = item.label or (item.name:gsub("^%l", string.upper))
            return { mode = 'item', item = item, label = item.label, name = item.name }
        end
    end

    local cur = Config.CurrencyItem or { name = 'blackmoney', label = 'Dirty Money' }
    cur.name  = cur.name  or 'blackmoney'
    cur.label = cur.label or (cur.name:gsub("^%l", string.upper))
    return { mode = 'item', item = cur, label = cur.label, name = cur.name }
end

local function _hasCurrency(src, amount)
    local cfg = _getCurrencyConfig()

    if cfg.mode == 'cash' then
        return _moneyHas(src, cfg.money, amount)

    elseif cfg.mode == 'crypto' then
        return _moneyHas(src, cfg.crypto, amount)

    else
        return _invGetCount(src, cfg.item.name) >= amount
    end
end

local function _takeCurrency(src, amount)
    local cfg = _getCurrencyConfig()

    if cfg.mode == 'cash' then
        return _moneyRemove(src, cfg.money, amount)

    elseif cfg.mode == 'crypto' then
        return _moneyRemove(src, cfg.crypto, amount)

    else
        return _invRemove(src, cfg.item.name, amount)
    end
end

local function calculateLocationIndex()
    local spots = Config.SpawnLocations or {}
    local count = #spots
    if count == 0 then return 1 end
    local wday = os.date('*t').wday
    if count >= 7 then
        return wday
    else
        return ((wday - 1) % count) + 1
    end
end



local locationIndex, locationData
local function refreshLocation()
    local spots = Config.SpawnLocations or {}
    if #spots == 0 then
        locationIndex, locationData = 1, { coords = vec3(0,0,0), heading = 0.0 }
        return
    end
    locationIndex = calculateLocationIndex()
    -- print(('[d,-blackmarket] Location index for today is %d'):format(locationIndex))
    locationData  = spots[locationIndex]
end
refreshLocation()

Ev.on('d,-blackmarket:requestLocation', function()
    local src = source
    refreshLocation()
    local cur = _getCurrencyConfig()
    Ev.emitClient(src, 'd,-blackmarket:syncLocation', {
        coords   = { x = locationData.coords.x, y = locationData.coords.y, z = locationData.coords.z },
        heading  = locationData.heading,
        items    = Config.Items or {},
        currency = (cur.mode == 'cash')
            and { name = cur.money,  label = cur.label, mode = 'cash' }
            or (cur.mode == 'crypto')
            and { name = cur.crypto, label = cur.label, mode = 'crypto' }
            or  { name = cur.item.name, label = cur.item.label, mode = 'item' },
        previewModel = (Config.DefaultPreviewWeapon or 'w_ar_assaultrifle')
    })
end)

Ev.on('d,-blackmarket:purchase', function(payload)
    local src = source
    if type(payload) ~= 'table' then return end
    local xPlayer = getPlayerAdapter(src)
    if not xPlayer then return end
    local basket = payload.items
    if type(basket) ~= 'table' or next(basket) == nil then
        xPlayer:Notify('Black Market', 'Your basket is empty.', 'error')
        return
    end
    local total = 0
    local sanitized = {}
    local itemsCfg = Config.Items or {}
    for _, entry in pairs(basket) do
        local name   = entry and entry.name
        local amount = tonumber(entry and entry.amount) or 0
        if name and amount > 0 then
            for _, cfg in ipairs(itemsCfg) do
                if cfg.name == name then
                    total = total + (math.floor(cfg.price or 0) * amount)
                    sanitized[#sanitized+1] = {
                        name   = cfg.name,
                        label  = cfg.label or cfg.name,
                        amount = amount,
                        type   = cfg.type or 'item',
                    }
                    break
                end
            end
        end
    end

    if total <= 0 or #sanitized == 0 then
        xPlayer:Notify('Black Market', 'Failed to validate your basket.', 'error')
        return
    end
    if not _hasCurrency(src, total) then
        local cur = _getCurrencyConfig()
        local needLabel = ((cur.mode == 'cash') or (cur.mode == 'crypto')) and cur.label or cur.item.label
        xPlayer:Notify('Black Market', ('You need %s x%d.'):format(needLabel, total), 'error')
        return
    end
        for _, it in ipairs(sanitized) do
            if (it.type == 'weapon') then
                for i = 1, it.amount do
                    if not xPlayer:CanCarry(it.name, 1) then
                        xPlayer:Notify('Black Market', ('Not enough space for %s x%d.'):format(it.label, it.amount), 'error')
                        return
                    end
                end
            else
                if not xPlayer:CanCarry(it.name, it.amount) then
                    xPlayer:Notify('Black Market', ('Not enough space for %s x%d.'):format(it.label, it.amount), 'error')
                    return
                end
            end
        end

    if not _takeCurrency(src, total) then
        xPlayer:Notify('Black Market', 'Payment failed.', 'error')
        return
    end
        local function _mkSerial()
            return ('BLM-%04X-%04X'):format(math.random(0, 0xFFFF), math.random(0, 0xFFFF))
        end

        for _, it in ipairs(sanitized) do
            if it.type == 'weapon' then
                for i = 1, it.amount do
                    local meta = { unique = true, serial = _mkSerial() }
                    _invAdd(src, it.name, 1, meta)
                end
            else
                _invAdd(src, it.name, it.amount)
            end
        end

    xPlayer:Notify('Black Market', 'Enjoy your new gear.', 'success')
    Ev.emitClient(src, 'd,-blackmarket:purchaseSuccess')
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    refreshLocation()
end)


local function _mkRelocatePayload()
    local cur = _getCurrencyConfig()
    return {
        to = {
            coords  = { x = locationData.coords.x, y = locationData.coords.y, z = locationData.coords.z },
            heading = locationData.heading
        },
        items    = Config.Items or {},
        currency = (cur.mode == 'cash')
            and { name = cur.money,  label = cur.label, mode = 'cash' }
            or (cur.mode == 'crypto')
            and { name = cur.crypto, label = cur.label, mode = 'crypto' }
            or  { name = cur.item.name, label = cur.item.label, mode = 'item' },
        previewModel = (Config.DefaultPreviewWeapon or 'w_ar_assaultrifle')
    }
end

CreateThread(function()
    local lastIdx = calculateLocationIndex()
    while true do
        Wait(60000)
        local idx = calculateLocationIndex()
        if idx ~= lastIdx then
            lastIdx = idx
            refreshLocation()
            Ev.emitClient(-1, 'd,-blackmarket:relocate', _mkRelocatePayload())
        end
    end
end)

-- Optional: manual test command to force relocate now
-- RegisterCommand('blm_relocate', function(src)
--     refreshLocation()
--     Ev.emitClient(-1, 'd,-blackmarket:relocate', _mkRelocatePayload())
-- end, true)
