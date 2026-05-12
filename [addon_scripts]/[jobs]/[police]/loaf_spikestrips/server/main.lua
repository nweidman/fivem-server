local QBCore, ESX
if Config.Framework == "esx" then
    TriggerEvent("esx:getSharedObject", function(object)
        ESX = object
    end)
elseif Config.Framework == "qb" then
    QBCore = exports["qb-core"]:GetCoreObject()
end

local police = {
    "steam:11000010ded0daa"
}

local spikePairs = {}

local function IsPolice(identifier)
    for _, policeIdent in pairs(police) do
        if policeIdent == identifier then
            return true
        end
    end
    return false
end

local function canRemoveSpike(src)
    if not Config.RequireJobRemove then
        return true
    end

    if Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer or not xPlayer.job then return false end

        for _, job in pairs(Config.FrameworkFeatures.PoliceJobs) do
            if xPlayer.job.name == job then
                return true
            end
        end
    elseif Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if not xPlayer or not xPlayer.PlayerData or not xPlayer.PlayerData.job then return false end

        for _, job in pairs(Config.FrameworkFeatures.PoliceJobs) do
            if xPlayer.PlayerData.job.name == job then
                return true
            end
        end
    else
        return true
    end

    return false
end

local function giveSpikeBack(src)
    if not Config.FrameworkFeatures.ReceiveRemove then return end
    if not Config.FrameworkFeatures.Item then return end

    if Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then return end

        local isPolice = false
        if xPlayer.job then
            for _, job in pairs(Config.FrameworkFeatures.PoliceJobs) do
                if xPlayer.job.name == job then
                    isPolice = true
                    break
                end
            end
        end

        if (not Config.RequireJobRemove or isPolice) and (not isPolice or Config.FrameworkFeatures.ReceiveJob) then
            local itemdata = xPlayer.getInventoryItem(Config.FrameworkFeatures.Item)

            if xPlayer.canCarryItem then
                if xPlayer.canCarryItem(Config.FrameworkFeatures.Item, 1) then
                    xPlayer.addInventoryItem(Config.FrameworkFeatures.Item, 1)
                else
                    TriggerClientEvent("esx:showNotification", src, Strings["cant_carry"])
                end
            else
                if itemdata and (itemdata.limit == -1 or (itemdata.count + 1) <= itemdata.limit) then
                    xPlayer.addInventoryItem(Config.FrameworkFeatures.Item, 1)
                else
                    TriggerClientEvent("esx:showNotification", src, Strings["cant_carry"])
                end
            end
        end

    elseif Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if not xPlayer then return end

        local isPolice = false
        if xPlayer.PlayerData and xPlayer.PlayerData.job then
            for _, job in pairs(Config.FrameworkFeatures.PoliceJobs) do
                if xPlayer.PlayerData.job.name == job then
                    isPolice = true
                    break
                end
            end
        end

        if (not Config.RequireJobRemove or isPolice) and (not isPolice or Config.FrameworkFeatures.ReceiveJob) then
            local added = xPlayer.Functions.AddItem(Config.FrameworkFeatures.Item, 1)
            if added then
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.FrameworkFeatures.Item], "add")
            end
        end
    end
end

RegisterNetEvent("loaf_spikestrips:checkPolice")
AddEventHandler("loaf_spikestrips:checkPolice", function()
    local src = source

    for _, v in pairs(GetPlayerIdentifiers(src)) do
        if IsPolice(v) then
            TriggerClientEvent("loaf_spikestrips:setPolice", src)
            break
        end
    end
end)

if Config.Framework == "esx" or Config.Framework == "qb" then
    if Config.FrameworkFeatures.Item then
        if Config.Framework == "esx" then
            ESX.RegisterUsableItem(Config.FrameworkFeatures.Item, function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                xPlayer.removeInventoryItem(Config.FrameworkFeatures.Item, 1)
                TriggerClientEvent("loaf_spikestrips:placeSpikestrip", src)
            end)
        elseif Config.Framework == "qb" then
            QBCore.Functions.CreateUseableItem(Config.FrameworkFeatures.Item, function(src)
                local xPlayer = QBCore.Functions.GetPlayer(src)
                xPlayer.Functions.RemoveItem(Config.FrameworkFeatures.Item, 1)
                TriggerClientEvent("loaf_spikestrips:placeSpikestrip", src)
            end)
        end
    end
end

RegisterNetEvent("loaf_spikestrips:registerSpikePair", function(netId1, netId2)
    local src = source
    if not netId1 or not netId2 then return end

    spikePairs[netId1] = {
        pair = netId2,
        owner = src
    }

    spikePairs[netId2] = {
        pair = netId1,
        owner = src
    }
end)

RegisterNetEvent("loaf_spikestrips:removeSpikePair", function(netId)
    local src = source
    if not netId then return end
    if not canRemoveSpike(src) then return end

    local data = spikePairs[netId]
    if not data then return end

    local pairNetId = data.pair

    TriggerClientEvent("loaf_spikestrips:clientDeletePair", -1, netId, pairNetId)

    spikePairs[netId] = nil
    if pairNetId then
        spikePairs[pairNetId] = nil
    end

    giveSpikeBack(src)
end)

AddEventHandler("playerDropped", function()
    local src = source

    for netId, data in pairs(spikePairs) do
        if data.owner == src then
            local ent = NetworkGetEntityFromNetworkId(netId)
            if ent and ent ~= 0 and DoesEntityExist(ent) then
                DeleteEntity(ent)
            end

            local pairNetId = data.pair
            if pairNetId then
                local pairEnt = NetworkGetEntityFromNetworkId(pairNetId)
                if pairEnt and pairEnt ~= 0 and DoesEntityExist(pairEnt) then
                    DeleteEntity(pairEnt)
                end
                spikePairs[pairNetId] = nil
            end

            spikePairs[netId] = nil
        end
    end
end)