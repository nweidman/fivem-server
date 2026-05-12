----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local CoreAlias   = Config.CoreSettings.Core            -- kept for compatibility (unused here)
local CoreFolder  = Config.CoreSettings.CoreFolder
local Core        = exports[CoreFolder]:GetCoreObject()
local PhoneEvent  = Config.CoreSettings.PhoneEvent
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- ox_inventory handle
local ox = exports.ox_inventory

-- helpers
local function hasLighter(src)
    return (ox:Search(src, 'count', 'lighter') or 0) > 0
end

local function hasVape(src)
    return (ox:Search(src, 'count', 'redvape') or 0) > 0 or (ox:Search(src, 'count', 'orangevape') or 0) > 0 or
    (ox:Search(src, 'count', 'yellowvape') or 0) > 0 or (ox:Search(src, 'count', 'greenvape') or 0) > 0 or
    (ox:Search(src, 'count', 'bluevape') or 0) > 0 or (ox:Search(src, 'count', 'purplevape') or 0) > 0 or
    (ox:Search(src, 'count', 'pinkvape') or 0) > 0 or (ox:Search(src, 'count', 'tealvape') or 0) > 0 or
    (ox:Search(src, 'count', 'blackvape') or 0) > 0
end

-- Remove exactly the used slot when possible (safe vs boolean)
-- ox_inventory handle up top:
-- local ox = exports.ox_inventory

local function consumeUsed(src, item)
    if not item or not item.name then return end
    local slot = item.slot

    -- RemoveItem returns TRUE/FALSE (not a number)
    local ok = ox:RemoveItem(src, item.name, 1, nil, slot)
    if not ok then
        -- fallback if the exact slot changed mid-use
        ok = ox:RemoveItem(src, item.name, 1)
    end

    if not ok then
        print(('[whitewidow] WARN: failed to remove %s from %s (slot=%s)'):format(item.name, src, tostring(slot)))
    end
end

--<!>-- PREPARE EDIBLES START --<!>--
RegisterServerEvent('boii-whitewidow:server:PrepareEdibles', function(args)
    local src   = source
    local pData = Core.Functions.GetPlayer(src)
    if not pData then return end

    local idx = tonumber(args)
    if not idx or idx < 1 or idx > 8 then
        TriggerClientEvent('boii-whitewidow:notifications', src, 'Invalid strain.', 'error')
        return
    end

    -- Resolve config for the selected strain
    local harvestCfg = Config.JobSettings.Harvest['Strain'..idx]
    local ediblesCfg = Config.JobSettings.Edibles['Strain'..idx]

    if not harvestCfg or not ediblesCfg then
        TriggerClientEvent('boii-whitewidow:notifications', src, 'Strain config missing.', 'error')
        return
    end

    -- Weed crop item name (ReturnItem can be array or map indexed by '1')
    local ret      = harvestCfg.ReturnItem and (harvestCfg.ReturnItem[1] or harvestCfg.ReturnItem['1'])
    local weedcrop = (type(ret) == 'table' and ret.name) or ret
    local cropremove = tonumber(ediblesCfg.RemoveAmount) or 0

    -- Required items
    local req1 = ediblesCfg.RequiredItems and ediblesCfg.RequiredItems['1']
    local req2 = ediblesCfg.RequiredItems and ediblesCfg.RequiredItems['2']
    local req3 = ediblesCfg.RequiredItems and ediblesCfg.RequiredItems['3']

    local item1name = req1 and req1.name or nil
    local item2name = req2 and req2.name or nil
    local item3name = req3 and req3.name or nil

    local item2amount = tonumber(req2 and req2.amount) or 0
    local item3amount = tonumber(req3 and req3.amount) or 0

    -- Validate config presence
    if not weedcrop or weedcrop == '' then
        TriggerClientEvent('boii-whitewidow:notifications', src, 'Missing crop item for this strain.', 'error')
        return
    end
    if not item1name or not item2name or not item3name then
        TriggerClientEvent('boii-whitewidow:notifications', src, 'Required items are not configured correctly.', 'error')
        return
    end

    -- Pull counts once
    local weedItem = pData.Functions.GetItemByName(weedcrop)
    local it1      = pData.Functions.GetItemByName(item1name)
    local it2      = pData.Functions.GetItemByName(item2name)
    local it3      = pData.Functions.GetItemByName(item3name)

    local weedCount = (weedItem and weedItem.amount) or 0
    local it1Count  = (it1 and it1.amount) or 0
    local it2Count  = (it2 and it2.amount) or 0
    local it3Count  = (it3 and it3.amount) or 0

    -- Checks (mirror original flow, but nil/number safe)
    if weedCount <= 0 then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['noweed'] or 'You have no weed crop.', 'error')
    end
    if weedCount < cropremove then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['enoughweed'] or 'Not enough weed crop.', 'error')
    end
    if it1Count <= 0 then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['noitem1'] or 'Missing required item 1.', 'error')
    end
    if it2Count <= 0 then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['noitem2'] or 'Missing required item 2.', 'error')
    end
    if it2Count < item2amount then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['enoughitem2'] or 'Not enough of item 2.', 'error')
    end
    if it3Count <= 0 then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['noitem3'] or 'Missing required item 3.', 'error')
    end
    if it3Count < item3amount then
        return TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Edibles['enoughitem3'] or 'Not enough of item 3.', 'error')
    end

    -- All good → tell client which strain to craft
    TriggerClientEvent('boii-whitewidow:client:PrepareEdibles', src, idx)
end)
--<!>-- PREPARE EDIBLES END --<!>--

--<!>-- BILLING EVENT CODE START --<!>--
RegisterServerEvent('boii-whitewidow:server:WhiteWidowPay')
AddEventHandler('boii-whitewidow:server:WhiteWidowPay', function(playerId, amount)
    local src   = source
    local payee = Core.Functions.GetPlayer(src)
    local payer = Core.Functions.GetPlayer(tonumber(playerId))
    local amt   = tonumber(amount)

    if not payee then return end

    if (payee.PlayerData.job and payee.PlayerData.job.name) == Config.JobSettings.JobName then
        if payer ~= nil then
            if payee.PlayerData.citizenid ~= payer.PlayerData.citizenid then
                if amt and amt > 0 then
                    exports.oxmysql:insert(
                        'INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)',
                        {
                            ['@citizenid']       = payer.PlayerData.citizenid,
                            ['@amount']          = amt,
                            ['@society']         = payee.PlayerData.job.name,
                            ['@sender']          = payee.PlayerData.charinfo.firstname,
                            ['@sendercitizenid'] = payee.PlayerData.citizenid
                        }
                    )
                    TriggerClientEvent(PhoneEvent, payer.PlayerData.source)
                    TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Billing['invoicesent'] or 'Invoice sent.', 'success')
                    TriggerClientEvent('boii-whitewidow:notifications', payer.PlayerData.source, Language['invoicereceived'] or 'You received an invoice.')
                else
                    TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Billing['minamount'] or 'Minimum amount not met.', 'error')
                end
            else
                TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Billing['billself'] or 'You cannot bill yourself.', 'error')
            end
        else
            TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Billing['billoffline'] or 'Player is offline.', 'error')
        end
    else
        TriggerClientEvent('boii-whitewidow:notifications', src, Language.Locations.Billing['noaccess'] or 'No access to billing.', 'error')
    end
end)
--<!>-- BILLING EVENT CODE END --<!>--

--<!>-- JOINTS START (Qbox useable + ox remove) --<!>--
for i = 1, 5 do
    local cfg = Config.JobSettings.JointRolling['Strain'..i]
    local ret = cfg and cfg.ReturnItem and (cfg.ReturnItem[1] or cfg.ReturnItem['1'])
    local name = (type(ret) == 'table') and ret.name or ret
    if name and name ~= '' then
        Core.Functions.CreateUseableItem(name, function(source, item)
            if not hasLighter(source) then
                TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations and Language.Locations.Joints and Language.Locations.Joints['lighter'] or 'You need a lighter.', 'error')
                return
            end
            local potency = (i <= 5) and i or 5
            TriggerClientEvent('boii-whitewidow:client:SmokeJoint', source, potency)
            -- consumeUsed(source, item)
        end)
        -- print(('[whitewidow] Qbox-usable registered (joint): %s'):format(name))
    else
        print(('[whitewidow] WARN: Joint Strain%s missing ReturnItem name'):format(i))
    end
end
--<!>-- JOINTS END --<!>--

--<!>-- EDIBLES START (Qbox useable + ox remove) --<!>--
for i = 1, 5 do
    local cfg = Config.JobSettings.Edibles['Strain'..i]
    local ret = cfg and cfg.ReturnItem and (cfg.ReturnItem[1] or cfg.ReturnItem['1'])
    local name = (type(ret) == 'table') and ret.name or ret
    if name and name ~= '' then
        Core.Functions.CreateUseableItem(name, function(source, item)
            local potency = (i <= 5) and i or 5
            TriggerClientEvent('boii-whitewidow:client:EatEdibles', source, potency)
            -- consumeUsed(source, item)
        end)
        print(('[whitewidow] Qbox-usable registered (gummy): %s'):format(name))
    else
        print(('[whitewidow] WARN: Gummy Strain%s missing ReturnItem name'):format(i))
    end
end
--<!>-- EDIBLES END --<!>--

Core.Functions.CreateUseableItem('cosmicbrownie', function(source, item)
    TriggerClientEvent('boii-whitewidow:client:EatCustomEdibles', source, 'cosmicbrownie')
    -- consumeUsed(source, item)
end)

Core.Functions.CreateUseableItem('weedcakepop', function(source, item)
    TriggerClientEvent('boii-whitewidow:client:EatCustomEdibles', source, 'weedcakepop')
    -- consumeUsed(source, item)
end)

Core.Functions.CreateUseableItem('tripsitters', function(source, item)
    if not hasVape(source) then
        TriggerClientEvent('boii-whitewidow:notifications', source, 'You need a vape.', 'error')
        return
    end
    TriggerClientEvent('boii-whitewidow:client:SmokeVape', source, 'tripsitters')
    -- consumeUsed(source, item)
end)
Core.Functions.CreateUseableItem('blueberrydream', function(source, item)
    if not hasVape(source) then
        TriggerClientEvent('boii-whitewidow:notifications', source, 'You need a vape.', 'error')
        return
    end
    TriggerClientEvent('boii-whitewidow:client:SmokeVape', source, 'blueberrydream')
    -- consumeUsed(source, item)
end)
Core.Functions.CreateUseableItem('sweettits', function(source, item)
    if not hasVape(source) then
        TriggerClientEvent('boii-whitewidow:notifications', source, 'You need a vape.', 'error')
        return
    end
    TriggerClientEvent('boii-whitewidow:client:SmokeVape', source, 'sweettits')
    -- consumeUsed(source, item)
end)
Core.Functions.CreateUseableItem('candybomb', function(source, item)
    if not hasVape(source) then
        TriggerClientEvent('boii-whitewidow:notifications', source, 'You need a vape.', 'error')
        return
    end
    TriggerClientEvent('boii-whitewidow:client:SmokeVape', source, 'candybomb')
    -- consumeUsed(source, item)
end)
Core.Functions.CreateUseableItem('skintback', function(source, item)
    if not hasVape(source) then
        TriggerClientEvent('boii-whitewidow:notifications', source, 'You need a vape.', 'error')
        return
    end
    TriggerClientEvent('boii-whitewidow:client:SmokeVape', source, 'skintback')
    -- consumeUsed(source, item)
end)

--<!>-- WW MENU START --<!>--
MenuItem = Config.JobSettings.MenuItem
if MenuItem and MenuItem ~= '' then
    Core.Functions.CreateUseableItem(MenuItem, function(source, item)
        TriggerClientEvent('boii-whitewidow:client:DisplayMenu', source)
    end)
end
--<!>-- WW MENU END --<!>--
