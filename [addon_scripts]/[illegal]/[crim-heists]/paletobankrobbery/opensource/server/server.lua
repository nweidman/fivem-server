Webhook = ""

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function AddItem(source, item, amount, info)
        local Player = exports.qbx_core:GetPlayer(source)
        local HeistLevel = Player and Player.PlayerData.metadata.skills.levels.heists.tier
        if info and info.worth then 
            if HeistLevel and HeistLevel == 1 then
                info.worth = math.floor(info.worth * 1.02)
                exports.qbx_core:Notify(source, "You received an extra 2% to your marked money from your heist skills.", 'success')
            elseif HeistLevel and HeistLevel == 2 then
                info.worth = math.floor(info.worth * 1.03)
                exports.qbx_core:Notify(source, "You received an extra 3% to your marked money from your heist skills.", 'success')
            elseif HeistLevel and HeistLevel == 3 then
                info.worth = math.floor(info.worth * 1.05)
                exports.qbx_core:Notify(source, "You received an extra 5% to your marked money from your heist skills.", 'success')
            elseif HeistLevel and HeistLevel == 4 then
                info.worth = math.floor(info.worth * 1.08)
                exports.qbx_core:Notify(source, "You received an extra 8% to your marked money from your heist skills.", 'success')
            elseif HeistLevel and HeistLevel == 5 then
                info.worth = math.floor(info.worth * 1.10)
                exports.qbx_core:Notify(source, "You received an extra 10% to your marked money from your heist skills.", 'success')
            end
        end
        if Config.Inventory == "ox" then
            if info == nil then
                exports.ox_inventory:AddItem(source, item, amount)
            else
                exports.ox_inventory:AddItem(source, item, amount, info)
            end
        else
            if info == nil then
                QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount)
            else
                QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount, false, info)
            end
        end
    end

    function RemoveItem(source, item, amount)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:RemoveItem(source, item, amount)
        else
            return QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item, amount)
        end
    end

    function ItemBox(source, item, addRemove, amount)
        if Config.Inventory ~= "ox" then
            TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], addRemove, amount)
        end
    end

    function AddMoney(source, cash, amount)
        if Config.Inventory == "ox" then
            exports.ox_inventory:AddItem(source, "money", amount)
        else
            QBCore.Functions.GetPlayer(source).Functions.AddMoney(cash, amount, 'Paleto Bank')
        end
    end

    function NotificationServer(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('QBCore:Notify', source, notification, notificationType, duration)
        end
    end

    lib.callback.register("projectx-paletobankrobbery-k4mb1:getOnlinePoliceCountQB", function(source)
        local jobs = {"police", "sheriff"}
        local CurrentCops = 0
        for k, v in pairs(jobs) do
            local players = QBCore.Functions.GetPlayers()
            for i = 1, #players do
                local Player = QBCore.Functions.GetPlayer(players[i])
                if Player ~= nil then
                    if Player.PlayerData.job.name == v then
                        CurrentCops = CurrentCops + 1
                    end
                end
            end
        end
        return (CurrentCops >= Config.MinimumRequiredPolice)
    end)

    function DiscordLogCash(source, amount, gainedfrom)
        exports['drool_skills']:addXP(source, math.random(1, 5))
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            local discord = QBCore.Functions.GetIdentifier(source, 'discord') or 'N/A'
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            DiscordLog("Paleto Bank Robbery - Cash Gained.","**- PLAYER**\n> **Name: **"..player.PlayerData.name.."\n> **Character Name: **" ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> **Citizen ID: **" ..player.PlayerData.citizenid.. "\n> **License** " ..player.PlayerData.license.. "\n> **Money Gained: **$" ..amount.. "\n> **From: **" ..gainedfrom.. "\n> **Location: **" ..location.. "\n\n- **Discord:**\n> (<@" ..discord.. ">)")     
        end
    end

    function DiscordLogItem(source, item, amount, gainedfrom, info)
        exports['drool_skills']:addXP(source, math.random(1, 5))
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            local discord = QBCore.Functions.GetIdentifier(source, 'discord') or 'N/A'
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            if not info then
                DiscordLog("Paleto Bank Robbery - Item Gained.","**- PLAYER**\n> **Name: **"..player.PlayerData.name.."\n> **Character Name: **" ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> **Citizen ID: **" ..player.PlayerData.citizenid.. "\n> **License** " ..player.PlayerData.license.. "\n> **Item Gained: **x" ..amount.. " " ..item.. "\n> **From: **" ..gainedfrom.. "\n> **Location: **" ..location.. "\n\n- **Discord:**\n> (<@" ..discord.. ">)")
            else
                DiscordLog("Paleto Bank Robbery - Item Gained.","**- PLAYER**\n> **Name: **"..player.PlayerData.name.."\n> **Character Name: **" ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> **Citizen ID: **" ..player.PlayerData.citizenid.. "\n> **License** " ..player.PlayerData.license.. "\n> **Item Gained: **x" ..amount.. " " ..item.. " ($" ..info.. ")\n> **From: **" ..gainedfrom.. "\n> **Location: **" ..location.. "\n\n- **Discord:**\n> (<@" ..discord.. ">)")
            end
        end
    end

    function checkPerms(source)
        return QBCore.Functions.HasPermission(source, 'god')
    end
elseif Config.Framework == "esx" then
    
    CreateThread(function()
        while ESX == nil do Wait(1000) end
    end)

    function AddItem(source, item, amount, info)
        if Config.Inventory == "ox" then
            exports.ox_inventory:AddItem(source, item, amount)
        else
            ESX.GetPlayerFromId(source).addInventoryItem(item, amount)
        end
    end

    function RemoveItem(source, item, amount)
        if Config.Inventory == "ox" then
            exports.ox_inventory:RemoveItem(source, item, amount)
        else
            ESX.GetPlayerFromId(source).removeInventoryItem(item, amount)
        end
    end

    function ItemBox(source, item, addRemove, amount)

    end

    function AddMoney(source, amount)
        if Config.Inventory == "ox" then
            exports.ox_inventory:AddItem(source, "money", amount)
        else
            ESX.GetPlayerFromId(source).addMoney(amount)
        end
    end

    function NotificationServer(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('esx:showNotification', source, notification, notificationType, duration)
        end
    end

    lib.callback.register('projectx-paletobankrobbery-k4mb1:server:hasitem', function(source, item)
        if Config.Inventory == "ox" then
            local check = exports.ox_inventory:GetItemCount(source, item)
            return check >= 1
        elseif Config.Inventory == "qs" then
            local check = exports['qs-inventory']:GetItemTotalAmount(source, item)
            return check >= 1 
        else
            check = ESX.GetPlayerFromId(source).hasItem(item)
            return check.count >= 1
        end
    end)

    lib.callback.register("projectx-paletobankrobbery-k4mb1:getOnlinePoliceCount", function(source)
        if Config.ESX == "old" then 
            local Players = ESX.GetPlayers()
            local policeOnline = 0
            for i = 1, #Players do
                local xPlayer = ESX.GetPlayerFromId(Players[i])
                if xPlayer["job"]["name"] == "police" then
                    policeOnline = policeOnline + 1
                end
            end
            return (policeOnline >= Config.MinimumRequiredPolice)
        else
            local policeOnline = 0
            local xPlayers = ESX.GetExtendedPlayers()
            for _, xPlayer in ipairs(xPlayers) do
                if xPlayer.job.name == "police" then
                    policeOnline = policeOnline + 1
                end
            end
            local isEnoughPolice = (policeOnline >= Config.MinimumRequiredPolice)
            return isEnoughPolice
        end
    end)

    RegisterServerEvent('projectx-paletobankrobbery-k4mb1:server:PdNotify', function()
        local xPlayer = ESX.GetPlayerFromId(source)
        local Players = ESX.GetPlayers()
        for i = 1, #Players do
            local xPlayer = ESX.GetPlayerFromId(Players[i])
            if xPlayer["job"]["name"] == "police" then
                if Config.Notification == "ox" then
                    TriggerClientEvent('ox_lib:notify', xPlayer.source, {description = 'Paleto bank is being robbed!', type = 'error', duration = 10000, position = 'center-right'})
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Paleto bank is being robbed!')
                end
            end
        end
        local coords = xPlayer.getCoords(true)
        TriggerClientEvent('projectx-paletobankrobbery-k4mb1:client:PdNotify', coords)
    end)

    function DiscordLogCash(source, amount, gainedfrom)
        if Config.DiscordLogStatus then
            local xPlayer = ESX.GetPlayerFromId(source)
            local discord = GetPlayerIdentifierByType(source, 'discord') or 'N/A'
            local license = GetPlayerIdentifierByType(source, 'license')
            DiscordLog("Paleto Bank Robbery - Money Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Money Gained: $" ..amount.. "\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.."**")
        end
    end

    function DiscordLogItem(source, item, amount, gainedfrom, info)
        if Config.DiscordLogStatus then
            local xPlayer = ESX.GetPlayerFromId(source)
            local discord = GetPlayerIdentifierByType(source, 'discord') or 'N/A'
            local license = GetPlayerIdentifierByType(source, 'license')
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            if not info then
                DiscordLog("Paleto Bank Robbery - Item Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Item Gained: x" ..amount.. " " ..item.. "\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.. "**")
            else
                DiscordLog("Paleto Bank Robbery - Item Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Item Gained: x" ..amount.. " " ..item.. " ($" ..info.. ")\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.. "**")
            end
        end
    end

    function checkPerms(source)
        return IsPlayerAceAllowed(source, "group.admin") or IsPlayerAceAllowed(source, "group.god")
    end
else

end

RegisterServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', function(exp)
    if Config.ServerSideEvents then
        exports["pickle_xp"]:AddPlayerXP(source, "criminal", exp)
    else
        TriggerClientEvent("projectx-paletobankrobbery-k4mb1:client:AddExperience", source, exp)
    end
end)

function CheckExpLevel(source)
    local level = exports["pickle_xp"]:GetPlayerLevel(source, 'criminal')
    return level
end

RegisterCommand('projectxpaleto', function(source)
	if not checkPerms(source) then return NotificationServer(source, Loc[Config.Lan].error["permission"], 'error', Config.NotificationDuration) end
    ResetHeist()
end, false)