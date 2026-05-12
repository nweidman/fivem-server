Webhook = ""

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function ItemBox(source, item, addRemove, amount)
        if Config.Inventory ~= "ox" then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], addRemove, amount)
        end
    end

    function AddMoney(source, cash, amount)
        -- if Config.Inventory == "ox" then
        --     exports.ox_inventory:AddItem(source, "money", amount)
        -- else
            QBCore.Functions.GetPlayer(source).Functions.AddMoney(cash, amount)
        -- end
    end

    function NotificationServer(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('QBCore:Notify', source, notification, notificationType, duration)
        end
    end

    lib.callback.register("projectx-cashexchange2robbery-k4mb1:getOnlinePoliceCountQB", function(source)
        if Config.MinimumPolice == 0 then return true end
        local CurrentCops = 0
        if Config.Framework == "qbox" then
            for k, _ in pairs(Config.PoliceJobs) do
                local Count, Players = exports.qbx_core:GetDutyCountJob(k)
                CurrentCops = CurrentCops + Count
            end
        else
            for k, _ in pairs(Config.PoliceJobs) do
                local Players, Count = QBCore.Functions.GetPlayersOnDuty(k)
                CurrentCops = CurrentCops + Count
            end
        end
        return CurrentCops >= Config.MinimumPolice
    end)

    function DiscordLogCash(source, amount, gainedfrom)
        exports['drool_skills']:addXP(source, math.random(1, 5))
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            local discord = QBCore.Functions.GetIdentifier(source, 'discord') or 'N/A'
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            DiscordLog("K4MB1 Cash Exchange 2 Robbery - Cash Gained.","**- Info:\n> Name: " ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> ID: " ..player.PlayerData.cid.. "\n> Citizen ID: " ..player.PlayerData.citizenid.. "\n> Money Gained: $" ..amount.. "\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..player.PlayerData.license.."**")
        end
    end

    function DiscordLogItem(source, item, amount, gainedfrom, info)
        exports['drool_skills']:addXP(source, math.random(1, 5))
        if Config.DiscordLogStatus then
            local player = QBCore.Functions.GetPlayer(source)
            local discord = QBCore.Functions.GetIdentifier(source, 'discord') or 'N/A'
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            if not info then
                DiscordLog("K4MB1 Cash Exchange 2 Robbery - Item Gained.","**- Info:\n> Name: " ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> ID: " ..player.PlayerData.cid.. "\n> Citizen ID: " ..player.PlayerData.citizenid.. "\n> Item Gained: x" ..amount.. " " ..item.. "\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..player.PlayerData.license.. "**")
            else
                DiscordLog("K4MB1 Cash Exchange 2 Robbery - Item Gained.","**- Info:\n> Name: " ..player.PlayerData.charinfo.firstname.. " " ..player.PlayerData.charinfo.lastname.. "\n> ID: " ..player.PlayerData.cid.. "\n> Citizen ID: " ..player.PlayerData.citizenid.. "\n> Item Gained: x" ..amount.. " " ..item.. " ($" ..info.. ")\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..player.PlayerData.license.. "**") 
            end
        end
    end

    function CheckPerms(source)
        return QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin')
    end
elseif Config.Framework == "esx" then -- ESX

    CreateThread(function()
        while ESX == nil do Wait(1000) end
    end)

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

    lib.callback.register('projectx-cashexchange2robbery-k4mb1:server:hasitem', function(source, item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(source, item) >= 1

        elseif Config.Inventory == "codem" then
            return exports['codem-inventory']:HasItem(source, item, 1)
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(source, item, 1)
        elseif Config.Inventory == "tgiann" then
            return exports["tgiann-inventory"]:HasItem(source, item, 1)
        else
            return ESX.GetPlayerFromId(source).hasItem(item).count >= 1
        end
    end)

    lib.callback.register("projectx-cashexchange2robbery-k4mb1:getOnlinePoliceCount", function(source)
        if Config.ESX == "old" then
            local Players = ESX.GetPlayers()
            local policeOnline = 0
            for i = 1, #Players do
                local xPlayer = ESX.GetPlayerFromId(Players[i])
                if Config.PoliceJobs[xPlayer.job.name] then
                    policeOnline = policeOnline + 1
                end
            end
            return (policeOnline >= Config.MinimumPolice)
        else
            local PoliceJobs = {}
            for k, v in pairs(Config.PoliceJobs) do table.insert(PoliceJobs, k) end

            local policeOnline = 0
            for i = 1, #PoliceJobs do
                local xPlayers = ESX.GetExtendedPlayers('job', PoliceJobs[i])
                for p = 1, #xPlayers do policeOnline = policeOnline + 1 end
            end
            return policeOnline >= Config.MinimumPolice
        end
    end)

    RegisterServerEvent('projectx-cashexchange2robbery-k4mb1:server:PdNotify', function()
        local Criminal = ESX.GetPlayerFromId(source)
        local Players = ESX.GetPlayers()
        for i = 1, #Players do
            local xPlayer = ESX.GetPlayerFromId(Players[i])
            if Config.PoliceJobs[xPlayer.job.name] then
                if Config.Notification == "ox" then
                    TriggerClientEvent('ox_lib:notify', xPlayer.source, {description = 'Cash Exchange is being robbed!', type = 'error', duration = 10000, position = 'center-right'})
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Cash Exchange is being robbed!')
                end
            end
        end
        local coords = Criminal.getCoords(true)
        TriggerClientEvent('projectx-cashexchange2robbery-k4mb1:client:PdNotify', coords)
    end)

    function DiscordLogCash(source, amount, gainedfrom)
        if Config.DiscordLogStatus then
            local xPlayer = ESX.GetPlayerFromId(source)
            local discord = GetPlayerIdentifierByType(source, 'discord') or 'N/A'
            local license = GetPlayerIdentifierByType(source, 'license')
            DiscordLog("K4MB1 Cash Exchange 2 Robbery - Money Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Money Gained: $" ..amount.. "\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.."**")
        end
    end

    function DiscordLogItem(source, item, amount, gainedfrom, info)
        if Config.DiscordLogStatus then
            local xPlayer = ESX.GetPlayerFromId(source)
            local discord = GetPlayerIdentifierByType(source, 'discord') or 'N/A'
            local license = GetPlayerIdentifierByType(source, 'license')
            if discord ~= 'N/A' then discord = discord:gsub("discord:", "") end
            if not info then
                DiscordLog("K4MB1 Cash Exchange 2 Robbery - Item Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Item Gained: x" ..amount.. " " ..item.. "\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.. "**")
            else
                DiscordLog("K4MB1 Cash Exchange 2 Robbery - Item Gained.","**- Info:\n> Name: " ..xPlayer.getName().. "\n> ID: " ..source.. "\n> Item Gained: x" ..amount.. " " ..item.. " ($" ..info.. ")\n> Gained From: " ..gainedfrom.. "\n>".."\n\n- Identifiers: \n> Discord: " ..discord.. " (<@" ..discord.. ">)\n> License: " ..license.. "**")
            end
        end
    end

    function CheckPerms(source)
        return IsPlayerAceAllowed(source, "group.admin") or IsPlayerAceAllowed(source, "group.god")
    end
else -- Custom Framework

end

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
        exports.ox_inventory:AddItem(source, item, amount, info)

    elseif Config.Inventory == "origen" then
        exports.origen_inventory:AddItem(source, item, amount, nil, nil, info)
    elseif Config.Inventory == "codem" then
        exports['codem-inventory']:AddItem(source, item, amount, nil, info)
    elseif Config.Inventory == "tgiann" then
        exports["tgiann-inventory"]:AddItem(source, item, amount, nil, info, false)
    elseif Config.Framework == "esx" then
        CreateThread(function() while ESX == nil do Wait(1000) end end)
        ESX.GetPlayerFromId(source).addInventoryItem(item, amount)
    elseif Config.Framework == "qb-core" or Config.Framework == "qbox" then
        local QBCore = exports[Config.Core.resource]:GetCoreObject()
        QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount, false, info)
    else
        -- Custom Framework
    end
end


function RemoveItem(source, item, amount)
    if Config.Inventory == "ox" then
        exports.ox_inventory:RemoveItem(source, item, amount)

    elseif Config.Inventory == "origen" then
        exports.origen_inventory:RemoveItem(source, item, amount)
    elseif Config.Inventory == "codem" then
        exports['codem-inventory']:RemoveItem(source, item, amount)
    elseif Config.Inventory == "tgiann" then
        exports["tgiann-inventory"]:RemoveItem(source, item, amount)
    elseif Config.Framework == "esx" then
        CreateThread(function() while ESX == nil do Wait(1000) end end)
        ESX.GetPlayerFromId(source).removeInventoryItem(item, amount)
    elseif Config.Framework == "qb-core" or Config.Framework == "qbox" then
        local QBCore = exports[Config.Core.resource]:GetCoreObject()
        QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item, amount)
    else
        -- Custom Framework
    end
end

RegisterNetEvent('projectx-cashexchange2robbery-k4mb1:server:AddExperience', function(exp)
    if Config.ServerSideEvents then
        exports["pickle_xp"]:AddPlayerXP(source, "criminal", exp)
    else
        TriggerClientEvent("projectx-cashexchange2robbery-k4mb1:client:AddExperience", source, exp)
    end
end)

function CheckExpLevel(source)
    local level = exports["pickle_xp"]:GetPlayerLevel(source, 'criminal')
    return level
end

RegisterCommand('projectxk4mb1cashexchange2', function(source)
    if not CheckPerms(source) then return NotificationServer(source, Loc[Config.Lan].error["permission"], 'error', Config.NotificationDuration) end
    ResetHeist()
end, false)

RegisterNetEvent('projectx-cashexchange2robbery-k4mb1:server:Sonoran', function(street, zone)
    exports["sonorancad"]:performApiRequest({{
        ["serverId"] = GetConvar("sonoran_serverId", 1),
        ["isEmergency"] = true,
        ["caller"] = 'Security Camera',
        ["location"] = street..", "..zone,
        ["description"] = 'Laudromat is being robbed',
        ["metaData"] = {
            ["useCallLocation"] = true,
        }
    }}, "CALL_911")
end)