--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local ox = exports.ox_inventory

--<!>-- ADD/REMOVE ITEM EVENTS START --<!>--
-- Remove item event; Added due to recent qb-core update.
RegisterServerEvent('boii-whitewidow:server:RemoveItem', function(itemremove, amount, smoker)
    local src = source
    exports.ox_inventory:RemoveItem(src, itemremove, tonumber(amount))
    if smoker == 'lighter' then
        local lighter = exports.ox_inventory:Search(src, 'slots', 'lighter')[1]
        local durability = lighter.metadata?.durability or 100
        durability = durability - 2
        if durability <= 0 then
            exports.ox_inventory:RemoveItem(src, "lighter", 1, nil, lighter.slot)
            TriggerClientEvent('QBCore:Notify', src, "Your lighter ran out of fuel and broke.")
        else
            exports.ox_inventory:SetMetadata(src, lighter.slot, {
                durability = durability
            })
        end
    elseif smoker == 'vape' then
        local vape = exports.ox_inventory:Search(src, 'slots', 'redvape')
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'orangevape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'yellowvape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'greenvape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'bluevape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'purplevape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'pinkvape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'tealvape') end
        if not vape[1] then vape = exports.ox_inventory:Search(src, 'slots', 'blackvape') end
        vape = vape[1]
        local durability = vape.metadata?.durability or 100
        durability = durability - 2
        if durability <= 0 then
            exports.ox_inventory:RemoveItem(src, vape.name, 1, nil, vape.slot)
            TriggerClientEvent('QBCore:Notify', src, "Your vape ran out of power and broke.")
        else
            exports.ox_inventory:SetMetadata(src, vape.slot, {
                durability = durability
            })
        end
    end
end)
-- Add item event; Added due to recent qb-core update.
RegisterServerEvent('boii-whitewidow:server:AddItem', function(itemadd, amount)
    local source = source
    ox:AddItem(source, itemadd, tonumber(amount))
end)
--<!>-- ADD/REMOVE ITEM EVENTS END --<!>--

--<!>-- ROLL JOINTS START --<!>--
RegisterServerEvent('boii-whitewidow:server:RollJoints', function(args)
    local pData = Core.Functions.GetPlayer(source)
    local source = source
    args = tonumber(args)
    strain = '' -- Weed strain
    bagmount = ''
    grinderitem = ''
    papersitem = ''
    papersamount = ''
    clientarg = '' -- Client side argument
    if args == 1 then
        strain = Config.JobSettings.Trimming.Strain1.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain1.RemoveAmount
        grinderitem = Config.JobSettings.JointRolling.Strain1.RequiredItems['1'].name
        papersitem = Config.JobSettings.JointRolling.Strain1.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain1.RequiredItems['2'].amount 
        clientarg = 1
    elseif args == 2 then
        strain = Config.JobSettings.Trimming.Strain2.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain2.RemoveAmount
        grinderitem = Config.JobSettings.JointRolling.Strain2.RequiredItems['1'].name
        papersitem = Config.JobSettings.JointRolling.Strain2.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain2.RequiredItems['2'].amount 
        clientarg = 2
    elseif args == 3 then
        strain = Config.JobSettings.Trimming.Strain3.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain3.RemoveAmount
        grinderitem = Config.JobSettings.JointRolling.Strain3.RequiredItems['1'].name
        papersitem = Config.JobSettings.JointRolling.Strain3.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain3.RequiredItems['2'].amount 
        clientarg = 3
    elseif args == 4 then
        strain = Config.JobSettings.Trimming.Strain4.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain4.RemoveAmount
        grinderitem = Config.JobSettings.JointRolling.Strain4.RequiredItems['1'].name
        papersitem = Config.JobSettings.JointRolling.Strain4.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain4.RequiredItems['2'].amount 
        clientarg = 4
    elseif args == 5 then
        strain = Config.JobSettings.Trimming.Strain5.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain5.RemoveAmount
        grinderitem = Config.JobSettings.JointRolling.Strain5.RequiredItems['1'].name
        papersitem = Config.JobSettings.JointRolling.Strain5.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain5.RequiredItems['2'].amount 
        clientarg = 5
    end
    if pData.Functions.GetItemByName(strain) ~= nil then
        if pData.Functions.GetItemByName(strain).amount >= bagamount then
            if pData.Functions.GetItemByName(grinderitem) ~= nil then
                if pData.Functions.GetItemByName(papersitem) ~= nil then
                    if pData.Functions.GetItemByName(papersitem) .amount >= papersamount then
                        TriggerClientEvent('boii-whitewidow:client:RollJoints', source, clientarg)
                    else
                        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.JointRolling['enoughpapers'], 'error')
                        TriggerClientEvent('boii-whitewidow:client:RollJointsMenu', source)
                    end
                else
                    TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.JointRolling['nopapers'], 'error')
                    TriggerClientEvent('boii-whitewidow:client:RollJointsMenu', source)
                end
            else
                TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.JointRolling['nogrinder'], 'error')
                TriggerClientEvent('boii-whitewidow:client:RollJointsMenu', source)
            end
        else
            TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.JointRolling['enoughweed'], 'error')
            TriggerClientEvent('boii-whitewidow:client:RollJointsMenu', source)
        end	
    else
        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.JointRolling['noweed'], 'error')
        TriggerClientEvent('boii-whitewidow:client:RollJointsMenu', source)
    end
end)
--<!>-- ROLL JOINTS END --<!>--

--<!>-- TRIMMING START --<!>--
RegisterServerEvent('boii-whitewidow:server:TrimWeed', function(args)
    local pData = Core.Functions.GetPlayer(source)
    local source = source
    args = tonumber(args)
    weedcrop = '' -- Weed strain
    bagitem = '' -- Name of weed bag
    bagamount = '' -- Amount of bags to remove
    shearsitem = '' -- Shears item
    clientarg = '' -- Client side argument
    if args == 1 then
        weedcrop = Config.JobSettings.Trimming.Strain1.RequiredItems['2'].name
        cropamount = Config.JobSettings.Trimming.Strain1.RequiredItems['2'].amount
        bagitem = Config.JobSettings.Trimming.Strain1.RequiredItems['3'].name
        bagamount = Config.JobSettings.Trimming.Strain1.RequiredItems['3'].amount
        shearsitem = Config.JobSettings.Trimming.Strain1.RequiredItems['1'].name
        clientarg = 1
    elseif args == 2 then
        weedcrop = Config.JobSettings.Trimming.Strain2.RequiredItems['2'].name
        cropamount = Config.JobSettings.Trimming.Strain2.RequiredItems['2'].amount
        bagitem = Config.JobSettings.Trimming.Strain2.RequiredItems['3'].name
        bagamount = Config.JobSettings.Trimming.Strain2.RequiredItems['3'].amount
        shearsitem = Config.JobSettings.Trimming.Strain2.RequiredItems['1'].name
        clientarg = 2
    elseif args == 3 then
        weedcrop = Config.JobSettings.Trimming.Strain3.RequiredItems['2'].name
        cropamount = Config.JobSettings.Trimming.Strain3.RequiredItems['2'].amount
        bagitem = Config.JobSettings.Trimming.Strain3.RequiredItems['3'].name
        bagamount = Config.JobSettings.Trimming.Strain3.RequiredItems['3'].amount
        shearsitem = Config.JobSettings.Trimming.Strain3.RequiredItems['1'].name
        clientarg = 3
    elseif args == 4 then
        weedcrop = Config.JobSettings.Trimming.Strain4.RequiredItems['2'].name
        cropamount = Config.JobSettings.Trimming.Strain4.RequiredItems['2'].amount
        bagitem = Config.JobSettings.Trimming.Strain4.RequiredItems['3'].name
        bagamount = Config.JobSettings.Trimming.Strain4.RequiredItems['3'].amount
        shearsitem = Config.JobSettings.Trimming.Strain4.RequiredItems['1'].name
        clientarg = 4
    elseif args == 5 then
        weedcrop = Config.JobSettings.Trimming.Strain5.RequiredItems['2'].name
        cropamount = Config.JobSettings.Trimming.Strain5.RequiredItems['2'].amount
        bagitem = Config.JobSettings.Trimming.Strain5.RequiredItems['3'].name
        bagamount = Config.JobSettings.Trimming.Strain5.RequiredItems['3'].amount
        shearsitem = Config.JobSettings.Trimming.Strain5.RequiredItems['1'].name
        clientarg = 5
    end
    if pData.Functions.GetItemByName(shearsitem) ~= nil then
        if pData.Functions.GetItemByName(weedcrop) ~= nil then
            if pData.Functions.GetItemByName(weedcrop).amount >= cropamount then
                if pData.Functions.GetItemByName(bagitem) ~= nil then
                    if pData.Functions.GetItemByName(bagitem).amount >= bagamount then
                        pData.Functions.RemoveItem(weedcrop, cropamount)
                        TriggerClientEvent('boii-whitewidow:client:TrimWeed', source, clientarg)
                        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[weedcrop], 'remove', cropamount)
                    else
                        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Trimming['enoughbags'], 'error')
                        TriggerClientEvent('boii-whitewidow:client:TrimmingMenu', source)
                    end
                else
                    TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Trimming['nobags'], 'error')
                    TriggerClientEvent('boii-whitewidow:client:TrimmingMenu', source)
                end
            else
                TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Trimming['enoughweed'], 'error')
                TriggerClientEvent('boii-whitewidow:client:TrimmingMenu', source)
            end
        else
            TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Trimming['noweed'], 'error')
            TriggerClientEvent('boii-whitewidow:client:TrimmingMenu', source)
        end	
    else
        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Trimming['noshears'], 'error')
        TriggerClientEvent('boii-whitewidow:client:TrimmingMenu', source)
    end
end)
--<!>-- TRIMMING END --<!>--

--<!>-- BONGS START --<!>--
RegisterServerEvent('boii-whitewidow:server:UseBong', function(args)
    local pData = Core.Functions.GetPlayer(source)
    local source = source
    args = tonumber(args)
    weedbag = '' -- Weed strain
    clientarg = '' -- Client side argument
    if args == 1 then
        weedbag = Config.JobSettings.Trimming.Strain1.ReturnItem['1'].name
        clientarg = 1
    elseif args == 2 then
        weedbag = Config.JobSettings.Trimming.Strain2.ReturnItem['1'].name
        clientarg = 2
    elseif args == 3 then
        weedbag = Config.JobSettings.Trimming.Strain3.ReturnItem['1'].name
        clientarg = 3
    elseif args == 4 then
        weedbag = Config.JobSettings.Trimming.Strain4.ReturnItem['1'].name
        clientarg = 4
    elseif args == 5 then
        weedbag = Config.JobSettings.Trimming.Strain5.ReturnItem['1'].name
        clientarg = 5
    end
    if pData.Functions.GetItemByName(weedbag) ~= nil then 
        if pData.Functions.GetItemByName(Config.DrugSettings.BongTables.SmokeItem) ~= nil then
            pData.Functions.RemoveItem(weedbag, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[weedbag], 'remove', 1)
            TriggerClientEvent('boii-whitewidow:client:UseBong', source, clientarg)
        else
            TriggerClientEvent('boii-whitewidow:notifications', source, Language.Shared['nolighter'], 'error')
            TriggerClientEvent('boii-whitewidow:client:BongMenu', source)
        end	
    else
        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.BongTables['noweed'], 'error')
        TriggerClientEvent('boii-whitewidow:client:BongMenu', source)
    end
end)
--<!>-- BONGS END --<!>--

--<!>-- GARAGE MONEY CHECK START --<!>--
RegisterNetEvent('boii-whitewidow:server:ReturnDeposit', function()
	local source = source
    local pData = Core.Functions.GetPlayer(source)
    local MoneyType = Config.JobSettings.Garage.MoneyType
	local price = math.floor(Config.JobSettings.Garage.Deposit/2)
	pData.Functions.AddMoney(MoneyType, price, 'white-widow')
	TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Garage['returnedvan'], 'success')
end) 
Core.Functions.CreateCallback('boii-whitewidow:server:MoneyCheck', function(source, cb)
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local MoneyType = Config.JobSettings.Garage.MoneyType
    local balance = pData.PlayerData.money[MoneyType]
	local price = Config.JobSettings.Garage.Deposit
    if balance >= price then
        pData.Functions.RemoveMoney(MoneyType, Config.JobSettings.Garage.Deposit, 'white-widow')
        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Garage['rentedvan'], 'success')
        cb(true)
    else
        TriggerClientEvent('boii-whitewidow:notifications', source, Language.Locations.Garage['nomoney'], 'error')
        cb(false)
    end
end)
--<!>-- GARAGE MONEY CHECK END --<!>--