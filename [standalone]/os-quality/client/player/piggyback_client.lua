local RADIUS = 0.8
local ROT_Z = 0.0 

local piggyback = {
    InProgress = false,
    targetSrc = -1,
    type = "",
    personPiggybacking = {
        animDict = "custom@piggyback_1",
        anim = "piggyback_1",
        flag = 49,
    },
    personBeingPiggybacked = {
        animDict = "custom@piggyback_2",
        anim = "piggyback_2",
        attachX = 0.0,
        attachY = -0.40,
        attachZ = 0.10,
        flag = 33,
    }
}

local PlayerPedId           = PlayerPedId
local GetEntityCoords        = GetEntityCoords
local GetPlayerPed           = GetPlayerPed
local GetActivePlayers       = GetActivePlayers
local GetPlayerServerId      = GetPlayerServerId
local GetPlayerFromServerId  = GetPlayerFromServerId
local IsEntityPlayingAnim    = IsEntityPlayingAnim
local TaskPlayAnim           = TaskPlayAnim
local ClearPedSecondaryTask  = ClearPedSecondaryTask
local DetachEntity           = DetachEntity
local AttachEntityToEntity   = AttachEntityToEntity
local HasAnimDictLoaded      = HasAnimDictLoaded
local RequestAnimDict        = RequestAnimDict
local IsPedInAnyVehicle      = IsPedInAnyVehicle
local IsPedRagdoll           = IsPedRagdoll
local Wait                   = Wait

local function ensureAnimDict(dict)
    if not dict then return end
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        local tries = 0
        while not HasAnimDictLoaded(dict) and tries < 500 do
            Wait(10)
            tries = tries + 1
        end
        if not HasAnimDictLoaded(dict) then
        end
    end
end

local function playIfNotPlaying(ped, dict, anim, flag)
    if ped == 0 or not dict or not anim then return end
    if not IsEntityPlayingAnim(ped, dict, anim, 3) then
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, flag or 0, 0.0, false, false, false)
    end
end

local function getClosestPlayer(radius)
    local me = PlayerPedId()
    local myCoords = GetEntityCoords(me)
    local closest, closestDist = -1, -1
    local players = GetActivePlayers()
    if type(players) ~= "table" then return nil end

    for i = 1, #players do
        local pid = players[i]
        local ped = GetPlayerPed(pid)
        if ped ~= me and ped ~= 0 then
            local dist = #(GetEntityCoords(ped) - myCoords)
            if closestDist == -1 or dist < closestDist then
                closest, closestDist = pid, dist
            end
        end
    end

    if closest ~= -1 and closestDist <= (radius or RADIUS) then
        return closest
    end
    return nil
end

local function canStartPiggyback()
    local ped = PlayerPedId()
    if ped == 0 then return false end
    if IsPedInAnyVehicle(ped, false) then return false end
    if IsPedRagdoll(ped) then return false end
    return true
end

local function stopPiggyback(localOnly)
    local ped = PlayerPedId()
    piggyback.InProgress = false
    piggyback.type = ""
    ClearPedSecondaryTask(ped)
    DetachEntity(ped, true, false)
    if not localOnly and piggyback.targetSrc and piggyback.targetSrc ~= -1 then
        TriggerServerEvent("Piggyback:stop", piggyback.targetSrc)
    end
    piggyback.targetSrc = -1
end

RegisterCommand("piggyback", function()
    if not piggyback.InProgress then
        if not canStartPiggyback() then return end

        local closest = getClosestPlayer(RADIUS)
        if not closest then return end

        local targetSrc = GetPlayerServerId(closest)
        if not targetSrc or targetSrc <= 0 then return end

        piggyback.InProgress = true
        piggyback.targetSrc = targetSrc
        piggyback.type = "piggybacking"

        ensureAnimDict(piggyback.personPiggybacking.animDict)
        TriggerServerEvent("Piggyback:sync", targetSrc)
    else
        stopPiggyback(false)
    end
end, false)

RegisterNetEvent("Piggyback:syncTarget", function(targetSrc)
    if not targetSrc then
        return
    end
    local targetPlayer = GetPlayerFromServerId(targetSrc)
    if not targetPlayer or targetPlayer == -1 then
        return
    end
    local targetPed = GetPlayerPed(targetPlayer)
    if targetPed == 0 then
        return
    end

    piggyback.InProgress = true
    piggyback.type = "beingPiggybacked"
    piggyback.targetSrc = targetSrc

    local d = piggyback.personBeingPiggybacked
    ensureAnimDict(d.animDict)

    AttachEntityToEntity(
        PlayerPedId(), targetPed, 0,
        d.attachX, d.attachY, d.attachZ,
        0.0, 0.0, ROT_Z,
        false, false, false, false, 2, false
    )
end)

RegisterNetEvent("Piggyback:cl_stop", function()
    stopPiggyback(true)
end)

CreateThread(function()
    while true do
        if not piggyback.InProgress then
            Wait(250)
        else
            local ped = PlayerPedId()
            if ped ~= 0 then
                if IsPedInAnyVehicle(ped, false) then
                    stopPiggyback(false)
                else
                    if piggyback.type == "beingPiggybacked" then
                        local d = piggyback.personBeingPiggybacked
                        ensureAnimDict(d.animDict)
                        playIfNotPlaying(ped, d.animDict, d.anim, d.flag)
                    elseif piggyback.type == "piggybacking" then
                        local d = piggyback.personPiggybacking
                        ensureAnimDict(d.animDict)
                        playIfNotPlaying(ped, d.animDict, d.anim, d.flag)
                    end
                end
            end
            Wait(0)
        end
    end
end)
