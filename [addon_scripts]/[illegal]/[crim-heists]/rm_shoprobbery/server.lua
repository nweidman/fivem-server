local lastrob = {}
local QBCore = nil

Citizen.CreateThread(function()
    -- init per-shop cooldown table
    for i = 1, #Config['ShopRobberySetup'] do
        lastrob[i] = 0
    end

    -- init QBCore
    while not QBCore do
        pcall(function() QBCore = exports[Config['ShopRobbery']['framework']['scriptName']]:GetCoreObject() end)
        if not QBCore then
            pcall(function() QBCore = exports[Config['ShopRobbery']['framework']['scriptName']]:GetSharedObject() end)
        end
        if not QBCore then
            TriggerEvent(Config['ShopRobbery']['framework']['eventName'], function(obj) QBCore = obj end)
        end
        Citizen.Wait(1)
    end

    -- POLICE COUNT (QB)
    QBCore.Functions.CreateCallback('shoprobbery:server:checkPoliceCount', function(source, cb)
        local src = source
        local players = QBCore.Functions.GetPlayers()
        local policeCount = 0

        for i = 1, #players do
            local player = QBCore.Functions.GetPlayer(players[i])
            if player then
                for k, v in pairs(Config['ShopRobbery']['dispatchJobs']) do
                    if player.PlayerData.job.name == v and player.PlayerData.job.onduty then
                        policeCount = policeCount + 1
                    end
                end
            end
        end

        if policeCount >= Config['ShopRobbery']['requiredPoliceCount'] then
            cb({status = true})
        else
            cb({status = false})
            TriggerClientEvent('shoprobbery:client:showNotification', src, Strings['need_police'])
        end
    end)

    -- COOLDOWN CHECK (QB, per-shop only)
    QBCore.Functions.CreateCallback('shoprobbery:server:checkTime', function(source, cb, index)
        local src = source
        local player = QBCore.Functions.GetPlayer(src)
        local cd = Config['ShopRobbery']['cooldown']['time'] or 0

        if lastrob[index] ~= 0 and (os.time() - lastrob[index]) < cd then
            local seconds = cd - (os.time() - lastrob[index])
            TriggerClientEvent('shoprobbery:client:showNotification',
                src,
                Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute']
            )
            cb({status = false})
            return
        end

        lastrob[index] = os.time()
        discordLog('Store Robbery Started', "**PLAYER**\n**Name:** ".. player.PlayerData.name .."\n**Character Name:** " .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **"..player.PlayerData.citizenid.."\n**License: **"..player.PlayerData.license)
        cb({status = true})
    end)

    -- HAS ITEM (QB)
    QBCore.Functions.CreateCallback('shoprobbery:server:hasItem', function(source, cb, data)
        local src = source
        local player = QBCore.Functions.GetPlayer(src)
        local playerItem = player and player.Functions.GetItemByName(data.itemName)

        if player then 
            if playerItem ~= nil and playerItem.amount >= 1 then
                cb({status = true, label = data.itemName})
            else
                cb({status = false, label = data.itemName})
            end
        end
    end)

    -- OWNER ONLINE (QB)
    QBCore.Functions.CreateCallback('shoprobbery:server:isOwnerOnline', function(source, cb, index)
        local src = source
        if Config['enableLixeiroCharmosoMarkets'] and Config['LixeiroCharmosoMarketsSettings']['require_owner_be_online'] then
            local charmosoMarket = Config['ShopRobberySetup'][index]['lixeiroCharmoso']['marketId']
            local sql = "SELECT user_id FROM store_business WHERE market_id = @market_id";
            local query = MySQL.Sync.fetchAll(sql, {['@market_id'] = charmosoMarket});
            if query and query[1] then
                local owner = QBCore.Functions.GetPlayerByCitizenId(query[1].user_id)
                if owner and owner.PlayerData and owner.PlayerData.source then
                    cb({status = true})
                else
                    TriggerClientEvent('shoprobbery:client:showNotification', src, Strings['charmoso_no_owner_online'])
                    cb({status = false})
                end
            else
                cb({status = true})
            end
        else
            cb({status = true})
        end
    end)
end)

local function ResetShop(index)
    local shop = Config['ShopRobberySetup'][index]
    if not shop then return end

    if shop['lixeiroCharmoso'] then
        shop['lixeiroCharmoso']['remainingTill'] = shop['lixeiroCharmoso']['tillAmount']
    end

    lastrob[index] = 0

    TriggerClientEvent('shoprobbery:client:resetHeist', -1, index)
end

-- AUTO RESET
Citizen.CreateThread(function()
    local resetTime = 7200

    while true do
        Citizen.Wait(60 * 1000)

        for i = 1, #Config['ShopRobberySetup'] do
            local t = lastrob[i]
            if t ~= 0 and (os.time() - t) >= resetTime then
                ResetShop(i)
            end
        end
    end
end)

RegisterServerEvent('shoprobbery:server:rewardItem')
AddEventHandler('shoprobbery:server:rewardItem', function(item, count, type, index)
    local src = source

    local player = QBCore.Functions.GetPlayer(src)
    local whitelistItems = {}

    if player then
        exports['drool_skills']:addXP(src, math.random(1, 5))
        if type == 'money' then
            local sourcePed = GetPlayerPed(src)
            local sourceCoords = GetEntityCoords(sourcePed)
            local dist = #(sourceCoords - Config['ShopRobberySetup'][index]['pedSetup']['coords'])
            if dist > 30.0 then
                print('[rm_shoprobbery] add money exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
            else
                local charmosoMarket = Config['ShopRobberySetup'][index]['lixeiroCharmoso']['marketId']
                if item == 'safecrack' then
                    --This is safecrack money
                    if Config['enableLixeiroCharmosoMarkets'] then
                        local sql = "SELECT user_id, stock, stock_prices FROM `store_business` WHERE market_id = @market_id";
                        local query = MySQL.Sync.fetchAll(sql,{['@market_id'] = charmosoMarket})[1];
                        if query then
                            local arr_stock = json.decode(query.stock)
                            for k, v in pairs(arr_stock) do
                                local robbedAmount = math.floor(v*Config['LixeiroCharmosoMarketsSettings']['items_percentage_earned'])
                                arr_stock[k] = arr_stock[k] - robbedAmount
                                if arr_stock[k] == 0 then
                                    arr_stock[k] = nil
                                end
                                player.Functions.AddItem(k, robbedAmount)
                                discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. k .. ' x' .. robbedAmount .. ' on Shop Robbery!')
                            end
                            local sql2 = "UPDATE `store_business` SET stock = @stock WHERE market_id = @market_id";
                            MySQL.Sync.execute(sql2, {['@market_id'] = charmosoMarket, ['@stock'] = json.encode(arr_stock)});
                            
                            local owner = QBCore.Functions.GetPlayerByCitizenId(query.user_id)
                            if owner and owner.PlayerData and owner.PlayerData.source then
                                TriggerClientEvent('shoprobbery:client:showNotification', owner.PlayerData.source, Strings['charmoso_store_being_robbed'])
                            end
                        else
                            if Config['ShopRobbery']['black_money'] then
                                local info = {
                                    worth = count
                                }
                                player.Functions.AddItem('markedbills', 1, false, info)
                                TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add") 
                                discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Shop Robbery!')
                            else
                                player.Functions.AddMoney('cash', count, 'store robbery')
                                discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Shop Robbery!')
                            end
                        end
                    else
                        if Config['ShopRobbery']['black_money'] then
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
                            discordLog('Player Received Money', "**PLAYER**\n**Name: **"..player.PlayerData.name.. "\n**Character Name: **" .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **".. player.PlayerData.citizenid .. "\n**License: **" .. player.PlayerData.license .. "\n\n**MONEY**\n**Amount: **$" .. count .. '')
                            -- discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Shop Robbery!')
                        else
                            player.Functions.AddMoney('cash', count, 'store robbery')
                            discordLog('Player Received Money', "**PLAYER**\n**Name: **"..player.PlayerData.name.. "\n**Character Name: **" .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **".. player.PlayerData.citizenid .. "\n**License: **" .. player.PlayerData.license .. "\n\n**MONEY**\n**Amount: **$" .. count .. '')
                            -- discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Shop Robbery!')
                        end
                    end
                else
                    --This is grab till money
                    if Config['enableLixeiroCharmosoMarkets'] then
                        local sql = "SELECT user_id, money, stock_prices FROM store_business WHERE market_id = @market_id";
                        local query = MySQL.Sync.fetchAll(sql, {['@market_id'] = charmosoMarket});
                        if query and query[1] then
                            if Config['ShopRobberySetup'][index]['lixeiroCharmoso']['remainingTill'] > 0 then
                                count = query[1].money / Config['ShopRobberySetup'][index]['lixeiroCharmoso']['remainingTill']
                                count = math.floor(count * Config['LixeiroCharmosoMarketsSettings']['money_percentage_earned'])
                            else
                                count = 0
                            end

                            local sql2 = "UPDATE `store_business` SET money = money - @count WHERE market_id = @market_id";
                            MySQL.Sync.execute(sql2, {['@market_id'] = charmosoMarket, ['@count'] = count});
                            Config['ShopRobberySetup'][index]['lixeiroCharmoso']['remainingTill'] = Config['ShopRobberySetup'][index]['lixeiroCharmoso']['remainingTill'] - 1

                            local sql3 = "INSERT INTO `store_balance` (market_id,income,title,amount,date) VALUES (@market_id,@income,@title,@amount,@date)";
                            MySQL.Sync.execute(sql3, {['@market_id'] = charmosoMarket, ['@income'] = 1, ['@title'] = Strings['charmoso_log_title'], ['@amount'] = count, ['@date'] = os.time()});

                            local owner = QBCore.Functions.GetPlayerByCitizenId(query[1].user_id)
                            if owner and owner.PlayerData and owner.PlayerData.source then
                                TriggerClientEvent('shoprobbery:client:showNotification', owner.PlayerData.source, Strings['charmoso_store_being_robbed'])
                            end
                        end
                    end
                    
                    if Config['ShopRobbery']['black_money'] then
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
                        discordLog('Player Received Money', "**PLAYER**\n**Name: **"..player.PlayerData.name.. "\n**Character Name: **" .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **".. player.PlayerData.citizenid .. "\n**License: **" .. player.PlayerData.license .. "\n\n**MONEY**\n**Amount: **$" .. count .. " in marked bills")
                        -- discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Shop Robbery!')
                    else
                        player.Functions.AddMoney('cash', count, 'store robbery')
                        -- discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. count .. '$ on Shop Robbery!')
                        discordLog('Player Received Money', "**PLAYER**\n**Name: **"..player.PlayerData.name.. "\n**Character Name: **" .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **".. player.PlayerData.citizenid .. "\n**License: **" .. player.PlayerData.license .. "\n\n**MONEY**\n**Amount: **$" .. count .. '')
                    end
                end
            end
        else
            for k, v in pairs(Config['ShopRobbery']['rewardItems']) do
                whitelistItems[v['itemName']] = true
            end

            if whitelistItems[item] then
                local rand = math.random(0,100)
                if item ~='mazecard' or (item=='mazecard' and rand<30) then
                    if count then 
                        player.Functions.AddItem(item, count)
                        TriggerClientEvent('qb-inventory:client:ItemBox',src, QBCore.Shared.Items[item], 'add', count)
                        discordLog('Player Received Item', "**PLAYER**\n**Name: **"..player.PlayerData.name.. "\n**Character Name: **" .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **".. player.PlayerData.citizenid .. "\n**License: **" .. player.PlayerData.license .. "\n\n**ITEM**\n**Item: **".. item .."\n**Amount: **" .. count .. "")
                        -- discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. count .. ' on Shop Robbery!')
                    else
                        player.Functions.AddItem(item, 1)
                        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', 1)
                        discordLog('Player Received Item', "**PLAYER**\n**Name: **"..player.PlayerData.name.. "\n**Character Name: **" .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. "\n**Citizen ID: **".. player.PlayerData.citizenid .. "\n**License: **" .. player.PlayerData.license .. "\n\n**ITEM**\n**Item: **".. item .."\n**Amount: **1")
                        -- discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain ' .. item .. ' x' .. 1 .. ' on Shop Robbery!')
                    end
                end
            else
                print('[rm_shoprobbery] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
            end
        end
    end
end)

-----------------------------------------------------------------
-- PD RESET COMMAND (QB only) – uses ResetShop so it also clears cooldown
-----------------------------------------------------------------

RegisterCommand('pdshoprobbery', function(source, args)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    if player then
        local isDispatchJob = false
        for k, v in pairs(Config['ShopRobbery']['dispatchJobs']) do
            if player.PlayerData.job.name == v then
                isDispatchJob = true
                break
            end
        end

        if not isDispatchJob then
            TriggerClientEvent('shoprobbery:client:showNotification', src, Strings['not_cop'])
            return
        end

        local sourcePed = GetPlayerPed(src)
        local sourceCoords = GetEntityCoords(sourcePed)
        local near = false
        local index

        for i = 1, #Config['ShopRobberySetup'] do
            local dist = #(sourceCoords - Config['ShopRobberySetup'][i]['pedSetup']['coords'])
            if dist <= 10.0 then
                near = true
                index = i
                break
            end
        end

        if near and index then
            ResetShop(index)
        else
            TriggerClientEvent('shoprobbery:client:showNotification', src, Strings['not_near'])
        end
    end
end)

-----------------------------------------------------------------
-- SYNC EVENT
-----------------------------------------------------------------

RegisterServerEvent('shoprobbery:server:sync')
AddEventHandler('shoprobbery:server:sync', function(type, index, index2)
    if type ~= 'startRobbery' then
        TriggerClientEvent('shoprobbery:client:sync', -1, type, index, index2)
    else
        local chance = math.random(1, 100)
        TriggerClientEvent('shoprobbery:client:sync', -1, type, index, index2, chance)
    end
end)
