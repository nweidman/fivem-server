QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('hathair:toggle2')
AddEventHandler('hathair:toggle2', function()
    local source = source
    if IsPlayerAceAllowed(source, "command.damon") then
        -- Allow the player to trigger the event if they have permission
        TriggerClientEvent('hathair:toggleHair2', source)
else
        -- Notify the player if they don't have permission
        TriggerEvent('QBCore:Notify', source, "You don't have permission to use this command.", "error")
    end
end)

RegisterServerEvent('hathair:toggle')
AddEventHandler('hathair:toggle', function()
    local source = source
    TriggerClientEvent('hathair:toggleHair', source)
end)

RegisterServerEvent('tarantula:hitPlayer', function(targetId)
    TriggerClientEvent('tarantula:ragdollMe', targetId)
end)

-- Flip Vehicle
RegisterCommand("flipvehicle", function(source, args, rawCommand)
    if not IsPlayerAceAllowed(source, "command") then
        TriggerClientEvent("os-quality:notify", source, "~r~You do not have permission to use this command.")
        return
    end

    TriggerClientEvent("os-quality:flipvehicle", source)
end, false)

-- Door Command
RegisterCommand("door", function(source, args)
    local door = tonumber(args[1])

    if not door then
        TriggerClientEvent("os-quality:notify", source, "~r~Usage: /door [0-5]")
        return
    end

    if door < 0 or door > 5 then
        TriggerClientEvent("os-quality:notify", source, "~r~Invalid door number. Use 0-5.")
        return
    end

    TriggerClientEvent("os-quality:opendoor", source, door)
end, false)

-- Seat Command
RegisterCommand("seat", function(source, args)
    local seat = tonumber(args[1])

    if not seat then
        TriggerClientEvent("os-quality:notify", source, "~r~Usage: /seat [seat number]")
        return
    end

    TriggerClientEvent("os-quality:seat", source, seat)
end, false)

--CheckVeh
RegisterCommand("checkveh", function(source, args)
    TriggerClientEvent("jim-mechanic:client:Menu", source, false)
end,false)

    -- Piggyback
    
local piggybacking = {}  
local beingPiggybacked = {} 

local function isPlayer(id)
    id = tonumber(id)
    if not id then return false end
    for _, p in ipairs(GetPlayers()) do
        if tonumber(p) == id then return true end
    end
    return false
end

RegisterServerEvent("Piggyback:sync")
AddEventHandler("Piggyback:sync", function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)

    if not isPlayer(src) or not isPlayer(targetSrc) then return end

    local srcPed = GetPlayerPed(src)
    local tgtPed = GetPlayerPed(targetSrc)
    if not DoesEntityExist(srcPed) or not DoesEntityExist(tgtPed) then return end

    local srcCoords = GetEntityCoords(srcPed)
    local tgtCoords = GetEntityCoords(tgtPed)

    if #(srcCoords - tgtCoords) <= 3.0 then
        TriggerClientEvent("Piggyback:syncTarget", targetSrc, src)
        piggybacking[src] = targetSrc
        beingPiggybacked[targetSrc] = src
    end
end)

RegisterServerEvent("Piggyback:stop")
AddEventHandler("Piggyback:stop", function(targetSrc)
    local src = source

    if piggybacking[src] then
        local partner = piggybacking[src]
        TriggerClientEvent("Piggyback:cl_stop", partner)
        piggybacking[src] = nil
        if partner then beingPiggybacked[partner] = nil end
        return
    end

    if beingPiggybacked[src] then
        local partner = beingPiggybacked[src]
        TriggerClientEvent("Piggyback:cl_stop", partner)
        beingPiggybacked[src] = nil
        if partner then piggybacking[partner] = nil end
        return
    end

    targetSrc = tonumber(targetSrc)
    if targetSrc then
        piggybacking[src] = nil
        beingPiggybacked[src] = nil
        piggybacking[targetSrc] = nil
        beingPiggybacked[targetSrc] = nil
    end
end)

AddEventHandler("playerDropped", function()
    local src = source

    if piggybacking[src] then
        local partner = piggybacking[src]
        TriggerClientEvent("Piggyback:cl_stop", partner)
        piggybacking[src] = nil
        if partner then beingPiggybacked[partner] = nil end
    end

    if beingPiggybacked[src] then
        local partner = beingPiggybacked[src]
        TriggerClientEvent("Piggyback:cl_stop", partner)
        beingPiggybacked[src] = nil
        if partner then piggybacking[partner] = nil end
    end
end)
