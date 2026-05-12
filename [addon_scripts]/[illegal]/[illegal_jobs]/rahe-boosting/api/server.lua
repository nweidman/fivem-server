--
--[[ Framework specific functions ]]--
--

local framework = shConfig.framework
local supportedFrameworks = { ESX = true, QB = true, CUSTOM = true }

if not supportedFrameworks[framework] then
    print("[^1ERROR^7] Invalid framework used in '/config/shared.lua' - please choose a supported value (ESX / QB / CUSTOM).")
end

local ESX, QBCore
if framework == 'ESX' then
    ESX = exports["es_extended"]:getSharedObject()
elseif framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

function getPlayerIdentifier(playerId)
    if framework == 'ESX' then
        return tostring(ESX.GetPlayerFromId(playerId).identifier)
    elseif framework == 'QB' then
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player then
            return tostring(Player.PlayerData.citizenid)
        end
        return -1
    else
        -- CUSTOM
    end
end

function getPlayerMoney(playerId)
    if framework == 'ESX' then
        return ESX.GetPlayerFromId(playerId).getMoney()
    elseif framework == 'QB' then
        return QBCore.Functions.GetPlayer(playerId).PlayerData.money.bank
    else
        -- CUSTOM
        return 0
    end
end

function removePlayerMoney(playerId, amount)
    if framework == 'ESX' then
        ESX.GetPlayerFromId(playerId).removeMoney(amount)
    elseif framework == 'QB' then
        local Player = QBCore.Functions.GetPlayer(playerId)
        Player.Functions.RemoveMoney('bank', amount, 'boosting purchase')
        if GetResourceState('qb-log') ~= 'missing' then
            TriggerEvent("qb-log:server:CreateLog", "carboosting", "Shop Item Purchased", "red",
                "**PLAYER**\n**Name: **".. Player.PlayerData.name ..
                "\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname..
                "\n**Citizen ID: **"..Player.PlayerData.citizenid..
                "\n**License: **"..Player.PlayerData.license..
                "\n\n**PURCHASE**\n**Cost:** "..amount..""
            )
        end
    else
        -- CUSTOM
    end
end

function givePlayerMoney(playerId, amount)
    if framework == 'ESX' then
        ESX.GetPlayerFromId(playerId).addMoney(amount)
    elseif framework == 'QB' then
        local Player = QBCore.Functions.GetPlayer(playerId)
        Player.Functions.AddMoney('cash', amount, 'boosting')
        -- if GetResourceState('trumpoi-skills') ~= 'missing' then
        --     exports['trumpoi-skills']:addXP(playerId, math.random(7, 14))
        -- end
        if GetResourceState('qb-log') ~= 'missing' then
            TriggerEvent("qb-log:server:CreateLog", "carboosting", "Boost Cash Reward", "green",
                "**PLAYER**\n**Name: **".. Player.PlayerData.name ..
                "\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname..
                "\n**Citizen ID: **"..Player.PlayerData.citizenid..
                "\n**License: **"..Player.PlayerData.license..
                "\n\n**REWARD**\n**Amount:** $"..amount..""
            )
        end
    else
        -- CUSTOM
    end
end

function giveItem(playerId, itemId, amount)
    if framework == 'ESX' then
        local xP = ESX.GetPlayerFromId(playerId)
        if xP and xP.addInventoryItem then xP.addInventoryItem(itemId, amount or 1) end
    elseif framework == 'QB' then
        local Player = QBCore.Functions.GetPlayer(playerId)
        Player.Functions.AddItem(itemId, amount or 1, false)
        if GetResourceState('qb-log') ~= 'missing' then
            TriggerEvent("qb-log:server:CreateLog", "carboosting", "Shop Item Picked Up", "green",
                "**PLAYER**\n**Name: **".. Player.PlayerData.name ..
                "\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname..
                "\n**Citizen ID: **"..Player.PlayerData.citizenid..
                "\n**License: **"..Player.PlayerData.license..
                "\n\n**PURCHASE**\n**Item:** "..itemId.."\n**Amount:** "..(amount or 1)..""
            )
        end
    else
       -- CUSTOM
    end
end

function getOnDutyPoliceAmount()
    local count = 0

    for _, playerId in ipairs(GetPlayers()) do
        playerId = tonumber(playerId)
        local player = exports.qbx_core:GetPlayer(playerId)

        if player then
            local data = player.PlayerData
            if data and data.job then
                if data.job.name == "police" and data.job.onduty then
                    count = count + 1
                end
            end
        end
    end

    return count
end

local framework = 'QBOX'

function getPoliceCount()
    return getOnDutyPoliceAmount()
end

-- AddEventHandler("police:SetCopCount", function(amount)
--     policeCount = amount
-- end)

--
--[[ General]]--
--

function notifyPlayer(playerId, message, type)
    TriggerClientEvent('rahe-boosting:client:notify', playerId, message, type)
end

-- VIN scratch -> give vehicle to player
AddEventHandler('rahe-boosting:server:vinScratchSuccessful', function(playerId, vehicleModel, vehicleModelName, licensePlate, vehicleProperties, contractOwnerIdentifier)
    exports['drool_skills']:addXP(playerId, math.random(1, 20))
    local Player = QBCore.Functions.GetPlayer(playerId)
    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state, vinscratched) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        vehicleModel,
        GetHashKey(vehicleModel),
        json.encode(vehicleProperties),
        licensePlate,
        'Legion Square',
        1,
        1
    })
    if GetResourceState('qb-log') ~= 'missing' then
        TriggerEvent("qb-log:server:CreateLog", "carboosting", "VIN Scratch Successful", "green",
            "**PLAYER**\n**Name: **".. Player.PlayerData.name ..
            "\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname..
            "\n**Citizen ID: **"..Player.PlayerData.citizenid..
            "\n**License: **"..Player.PlayerData.license..
            "\n\n**VEHICLE**\n**Model:** "..vehicleModel.."\n**Plate: **"..licensePlate..""
        )
    end
end)

-- Superuser check (admin panel)
function isPlayerSuperUser(playerIdentifier, playerId)
    if svConfig.adminPrincipal and IsPlayerAceAllowed(playerId, 'boosting.admin') then
        return true
    end
    for _, v in ipairs(svConfig.adminIdentifiers) do
        if v == playerIdentifier then
            return true
        end
    end
    return false
end

-- Usables (QB-Core style; works on many QBox setups too)
QBCore.Functions.CreateUseableItem("boostingtablet", function(source, item)
    TriggerClientEvent("rahe-boosting:client:openTablet", source)
end)

QBCore.Functions.CreateUseableItem("hackingdevice", function(source, item)
    TriggerClientEvent("rahe-boosting:client:hackingDeviceUsed", source)
end)

QBCore.Functions.CreateUseableItem("gpshackingdevice", function(source, item)
    TriggerClientEvent("rahe-boosting:client:gpsHackingDeviceUsed", source)
end)
