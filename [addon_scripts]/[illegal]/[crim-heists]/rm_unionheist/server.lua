local lastRob = 0
local handler = nil
local cutter
ESX, QBCore = nil
Citizen.CreateThread(function()
    if Config['UnionHeist']['framework']['name'] == 'ESX' then
        pcall(function() ESX = exports[Config['UnionHeist']['framework']['scriptName']]:getSharedObject() end)
        if not ESX then
            TriggerEvent(Config['UnionHeist']['framework']['eventName'], function(library) 
                ESX = library 
            end)
        end
        ESX.RegisterServerCallback('unionheist:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = ESX.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = ESX.GetPlayerFromId(players[i])
                for k, v in pairs(Config['UnionHeist']['dispatchJobs']) do
                    if player['job']['name'] == v then
                        policeCount = policeCount + 1
                    end
                end
            end
        
            if policeCount >= Config['UnionHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('unionheist:client:showNotification', src, Strings['need_police'])
            end
        end)
        ESX.RegisterServerCallback('unionheist:server:checkTime', function(source, cb, index)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            
            if (os.time() - lastRob) < Config['UnionHeist']['nextRob'] and lastRob ~= 0 then
                local seconds = Config['UnionHeist']['nextRob'] - (os.time() - lastRob)
                TriggerClientEvent('unionheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                cb({status = false})
            else
                lastRob = os.time()
                discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' started the Union Heist!')
                cb({status = true})
            end
        end)
        ESX.RegisterServerCallback('unionheist:server:hasItem', function(source, cb, data)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            local playerItem = player.getInventoryItem(data.itemName)
        
            if player and playerItem ~= nil then
                if playerItem.count >= 1 then
                    cb({status = true, label = playerItem.label})
                else
                    cb({status = false, label = playerItem.label})
                end
            else
                print('[rm_unionheist] you need add required items to server database')
            end
        end)
        ESX.RegisterServerCallback('unionheist:server:hasMoney', function(source, cb, data)
            local src = source
            local player = ESX.GetPlayerFromId(src)
            local playerMoney = player.getMoney()
        
            if player then 
                if playerMoney >= data.count then
                    player.removeMoney(data.count)
                    cb({status = true})
                else
                    TriggerClientEvent('unionheist:client:showNotification', src, Strings['need_this'] ..  ' ' .. data.count .. '$')
                    cb({status = false})
                end
            end
        end)
    elseif Config['UnionHeist']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['UnionHeist']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['UnionHeist']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent(Config['UnionHeist']['framework']['eventName'], function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
        QBCore.Functions.CreateCallback('unionheist:server:checkPoliceCount', function(source, cb)
            local src = source
            local players = QBCore.Functions.GetPlayers()
            local policeCount = 0
        
            for i = 1, #players do
                local player = QBCore.Functions.GetPlayer(players[i])
                if player then
                    for k, v in pairs(Config['UnionHeist']['dispatchJobs']) do
                        if player.PlayerData.job.name == v then
                            policeCount = policeCount + 1
                        end
                    end
                end
            end
        
            if policeCount >= Config['UnionHeist']['requiredPoliceCount'] then
                cb({status = true})
            else
                cb({status = false})
                TriggerClientEvent('unionheist:client:showNotification', src, Strings['need_police'])
            end
        end)
        QBCore.Functions.CreateCallback('unionheist:server:checkTime', function(source, cb, index)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)

            if (os.time() - lastRob) < Config['UnionHeist']['nextRob'] and lastRob ~= 0 then
                local seconds = Config['UnionHeist']['nextRob'] - (os.time() - lastRob)
                TriggerClientEvent('unionheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
                cb({status = false})
            else
                local item = exports.ox_inventory:GetItem(src, 'uhc', nil, true)
                if not item or item <=0 then
                    exports.qbx_core:Notify(src, "You do not have the proper crendentials to start this heist.", 'error')
                    return
                end
                exports.ox_inventory:RemoveItem(src, 'uhc', 1)
                lastRob = os.time()
                discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' started the Union Heist!')
                cb({status = true})
            end
        end)
        QBCore.Functions.CreateCallback('unionheist:server:hasItem', function(source, cb, data)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            local playerItem = player.Functions.GetItemByName(data.itemName)
        
            if player then 
                if playerItem ~= nil then
                    if playerItem.amount >= 1 then
                        cb({status = true, label = data.itemName})
                    end
                else
                    cb({status = false, label = data.itemName})
                end
            end
        end)
        QBCore.Functions.CreateCallback('unionheist:server:hasMoney', function(source, cb, data)
            local src = source
            local player = QBCore.Functions.GetPlayer(src)
            local playerMoney = player.Functions.GetMoney('cash')
        
            if player then 
                if playerMoney >= data.count then
                    player.Functions.RemoveMoney('cash', data.count, 'union bank equipment purchase')
                    cb({status = true})
                else
                    TriggerClientEvent('unionheist:client:showNotification', src, Strings['need_this'] ..  ' ' .. data.count .. '$')
                    cb({status = false})
                end
            end
        end)
    end
end)

RegisterServerEvent('unionheist:server:removeItem')
AddEventHandler('unionheist:server:removeItem', function(item)
    local src = source
    if Config['UnionHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        if player then
            player.removeInventoryItem(item, 1)
        end
    elseif Config['UnionHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        if player then
            player.Functions.RemoveItem(item, 1)
        end 
    end
end)

RegisterServerEvent('unionheist:server:rewardItem')
AddEventHandler('unionheist:server:rewardItem', function(item, count, type)
    local src = source

    if Config['UnionHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local whitelistItems = {}

        if player then
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - vector3(-7.1368, -677.92, 15.1306))
                if dist > 100.0 then
                    print('[rm_unionheist] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['UnionHeist']['black_money'] then
                        player.addAccountMoney('black_money', count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. count .. '$ on Union Heist!')
                    else
                        player.addMoney(count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. count .. '$ on Union Heist!')
                    end
                end
            else
                for k, v in pairs(Config['UnionHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.addInventoryItem(item, count)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. item .. ' x' .. count .. ' on Union Heist!')
                    else
                        player.addInventoryItem(item, 1)
                        discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain ' .. item .. ' x' .. 1 .. ' on Union Heist!')
                    end
                else
                    print('[rm_unionheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    elseif Config['UnionHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local whitelistItems = {}

        if player then
            exports['drool_skills']:addXP(src, math.random(1, 5))
            if type == 'money' then
                local sourcePed = GetPlayerPed(src)
                local sourceCoords = GetEntityCoords(sourcePed)
                local dist = #(sourceCoords - vector3(-7.1368, -677.92, 15.1306))
                if dist > 30.0 then
                    print('[rm_unionheist] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                else
                    if Config['UnionHeist']['black_money'] then
                        local info = {
                            worth = count
                        }
                        local HeistLevel = player and player.PlayerData.metadata.skills.levels.heists.tier
                        if info and info.worth then 
                            if HeistLevel and HeistLevel == 1 then
                                info.worth = math.floor(info.worth * 1.02)
                                exports.qbx_core:Notify(src, "You received an extra 2% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 2 then
                                info.worth = math.floor(info.worth * 1.03)
                                exports.qbx_core:Notify(src, "You received an extra 3% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 3 then
                                info.worth = math.floor(info.worth * 1.05)
                                exports.qbx_core:Notify(src, "You received an extra 5% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 4 then
                                info.worth = math.floor(info.worth * 1.08)
                                exports.qbx_core:Notify(src, "You received an extra 8% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 5 then
                                info.worth = math.floor(info.worth * 1.10)
                                exports.qbx_core:Notify(src, "You received an extra 10% to your marked money from your heist skills.", 'success')
                            end
                        end
                        player.Functions.AddItem('markedbills', 1, false, info)
                        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add") 
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Union Heist!')
                    else
                        player.Functions.AddMoney('cash', count, 'Union Bank')
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Union Heist!')
                    end
                end
            else
                for k, v in pairs(Config['UnionHeist']['rewardItems']) do
                    whitelistItems[v['itemName']] = true
                end

                if whitelistItems[item] then
                    if count then 
                        player.Functions.AddItem(item, count)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. count .. ' on Union Heist!')
                    else
                        player.Functions.AddItem(item, 1)
                        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. 1 .. ' on Union Heist!')
                    end
                else
                    print('[rm_unionheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
                end
            end
        end
    end
end)

RegisterServerEvent('unionheist:server:sellRewardItems')
AddEventHandler('unionheist:server:sellRewardItems', function()
    local src = source

    if Config['UnionHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['UnionHeist']['rewardItems']) do
                local playerItem = player.getInventoryItem(v['itemName'])
                if playerItem.count >= 1 then
                    player.removeInventoryItem(v['itemName'], playerItem.count)
                    if Config['UnionHeist']['black_money'] then
                        player.addAccountMoney('black_money', playerItem.count * v['sellPrice'])
                    else
                        player.addMoney(playerItem.count * v['sellPrice'])
                    end
                    totalMoney = totalMoney + (playerItem.count * v['sellPrice'])
                end
            end

            discordLog(player.getName() ..  ' - ' .. player.getIdentifier(), ' Gain $' .. math.floor(totalMoney) .. ' on the Union Heist Buyer!')
            TriggerClientEvent('unionheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    elseif Config['UnionHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
        local totalMoney = 0

        if player then
            for k, v in pairs(Config['UnionHeist']['rewardItems']) do
                local playerItem = player.Functions.GetItemByName(v['itemName'])
                if playerItem ~= nil and playerItem.amount > 0 then
                    player.Functions.RemoveItem(v['itemName'], playerItem.amount)
                    if Config['UnionHeist']['black_money'] then
                        local info = {
                            worth = playerItem.amount * v['sellPrice']
                        }
                        local HeistLevel = player and player.PlayerData.metadata.skills.levels.heists.tier
                        if info and info.worth then 
                            if HeistLevel and HeistLevel == 1 then
                                info.worth = math.floor(info.worth * 1.02)
                                exports.qbx_core:Notify(src, "You received an extra 2% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 2 then
                                info.worth = math.floor(info.worth * 1.03)
                                exports.qbx_core:Notify(src, "You received an extra 3% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 3 then
                                info.worth = math.floor(info.worth * 1.05)
                                exports.qbx_core:Notify(src, "You received an extra 5% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 4 then
                                info.worth = math.floor(info.worth * 1.08)
                                exports.qbx_core:Notify(src, "You received an extra 8% to your marked money from your heist skills.", 'success')
                            elseif HeistLevel and HeistLevel == 5 then
                                info.worth = math.floor(info.worth * 1.10)
                                exports.qbx_core:Notify(src, "You received an extra 10% to your marked money from your heist skills.", 'success')
                            end
                        end
                        player.Functions.AddItem('markedbills', 1, false, info)
                        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add") 
                    else
                        player.Functions.AddMoney('cash', playerItem.amount * v['sellPrice'], 'Union Bank')
                    end
                    totalMoney = totalMoney + (playerItem.amount * v['sellPrice'])
                end
            end

            discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain $' .. math.floor(totalMoney) .. ' on the Union Heist Buyer!')
            TriggerClientEvent('unionheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
        end
    end
end)

RegisterServerEvent("unionheist:server:remoteSync", function()
    if SetEntityRemoteSyncedScenesAllowed then 
        handler = AddEventHandler('entityCreated', function(entity)
            if not DoesEntityExist(entity) then return end
            if NetworkGetEntityOwner(entity) ~= source then return end
            SetEntityRemoteSyncedScenesAllowed(entity, true)
        end)
    end
end)

RegisterCommand('pdunion', function(source, args)
    local src = source

    if Config['UnionHeist']['framework']['name'] == 'ESX' then
        local player = ESX.GetPlayerFromId(src)
        
        if player then
            for k, v in pairs(Config['UnionHeist']['dispatchJobs']) do
                if player['job']['name'] == v then
                    DeleteEntity(cutter)
                    if handler then
                        RemoveEventHandler(handler)
                    end
                    return TriggerClientEvent('unionheist:client:sync', -1, 'resetHeist')
                end
            end

            TriggerClientEvent('unionheist:client:showNotification', src, Strings['not_cop'])
        end
    elseif Config['UnionHeist']['framework']['name'] == 'QB' then
        local player = QBCore.Functions.GetPlayer(src)
    
        if player then
            for k, v in pairs(Config['UnionHeist']['dispatchJobs']) do
                if player.PlayerData.job.name == v then
                    DeleteEntity(cutter)
                    if handler then
                        RemoveEventHandler(handler)
                    end
                    return TriggerClientEvent('unionheist:client:sync', -1, 'resetHeist')
                end
            end

            TriggerClientEvent('unionheist:client:showNotification', src, Strings['not_cop'])
        end
    end
end)

RegisterServerEvent('unionheist:server:spawnCutter')
AddEventHandler('unionheist:server:spawnCutter', function()
    local src = source
    cutter = CreateVehicle(GetHashKey('cutter'), Config['UnionSetup']['cutter']['coords'], Config['UnionSetup']['cutter']['heading'], 1, 0)
    while not DoesEntityExist(cutter) do
        Citizen.Wait(1)
    end
    TriggerClientEvent('unionheist:client:giveVehicleKey', src, GetVehicleNumberPlateText(cutter))
end)

RegisterServerEvent('unionheist:server:sync')
AddEventHandler('unionheist:server:sync', function(type, index, index2)
    TriggerClientEvent('unionheist:client:sync', -1, type, index, index2)
end)