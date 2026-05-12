wheels = {
    ["wheel_lf"] = 0,
    ["wheel_rf"] = 1,
    ["wheel_rr"] = 5,
    ["wheel_lr"] = 4,
}

-- Global table for tracking deployed spike strips
-- deployedSpikeStrips = {}

local SPIKE_MODEL = `p_ld_stinger_s`

local function setupNetworkedSpike(ent)
    if not ent or ent == 0 or not DoesEntityExist(ent) then return end

    local netId = NetworkGetNetworkIdFromEntity(ent)
    if netId and netId ~= 0 then
        SetNetworkIdCanMigrate(netId, true)
        SetNetworkIdExistsOnAllMachines(netId, true)
    end
end

function DeployStinger()
    -- FIRST STINGER
    local coords1 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.2, 2.0, 0.0)
    local stinger = CreateObjectNoOffset(LoadModel("p_ld_stinger_s").model, coords1.x, coords1.y, coords1.z, true, true, false)

    SetEntityAsMissionEntity(stinger, true, true)
    SetEntityHeading(stinger, GetEntityHeading(PlayerPedId()))
    FreezeEntityPosition(stinger, true)
    PlaceObjectOnGroundProperly(stinger)
    SetEntityVisible(stinger, false)

    -- SECOND STINGER (6.2 forward)
    local coords2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.2, 6.2, 0.0)
    local stinger2 = CreateObjectNoOffset(LoadModel("p_ld_stinger_s").model, coords2.x, coords2.y, coords2.z, true, true, false)

    SetEntityAsMissionEntity(stinger2, true, true)
    SetEntityHeading(stinger2, GetEntityHeading(PlayerPedId()))
    FreezeEntityPosition(stinger2, true)
    PlaceObjectOnGroundProperly(stinger2)
    SetEntityVisible(stinger2, false)

    -- Add this pair to the global list
    -- table.insert(deployedSpikeStrips, {stinger, stinger2})

    -- PLAYER ANIMATION
    local scene = NetworkCreateSynchronisedScene(
        GetEntityCoords(PlayerPedId()),
        GetEntityRotation(PlayerPedId(), 2),
        2, false, false,
        1065353216, 0, 1.0
    )
    NetworkAddPedToSynchronisedScene(
        PlayerPedId(), scene,
        LoadDict("amb@medic@standing@kneel@enter"),
        "enter",
        8.0, -8.0, 3341, 16, 1148846080, 0
    )
    NetworkStartSynchronisedScene(scene)
    while not IsSynchronizedSceneRunning(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) do Wait(0) end
    SetSynchronizedSceneRate(NetworkConvertSynchronisedSceneToSynchronizedScene(scene), 3.0)
    while GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) < 0.14 do Wait(0) end
    NetworkStopSynchronisedScene(scene)

    -- DEPLOY FIRST STINGER
    PlayEntityAnim(stinger, "P_Stinger_S_Deploy", LoadDict("p_ld_stinger_s"), 1000.0, false, true, 0, 0.0, 0)
    while not IsEntityPlayingAnim(stinger, "p_ld_stinger_s", "P_Stinger_S_Deploy", 3) do Wait(0) end
    SetEntityVisible(stinger, true)

    -- DELAY BEFORE SECOND STINGER
    Wait(800)

    -- DEPLOY SECOND STINGER
    PlayEntityAnim(stinger2, "P_Stinger_S_Deploy", LoadDict("p_ld_stinger_s"), 1000.0, false, true, 0, 0.0, 0)
    while not IsEntityPlayingAnim(stinger2, "p_ld_stinger_s", "P_Stinger_S_Deploy", 3) do Wait(0) end
    SetEntityVisible(stinger2, true)

    -- Wait for both animations
    while IsEntityPlayingAnim(stinger, "p_ld_stinger_s", "P_Stinger_S_Deploy", 3)
       and GetEntityAnimCurrentTime(stinger, "p_ld_stinger_s", "P_Stinger_S_Deploy") <= 0.99 do Wait(0) end
    while IsEntityPlayingAnim(stinger2, "p_ld_stinger_s", "P_Stinger_S_Deploy", 3)
       and GetEntityAnimCurrentTime(stinger2, "p_ld_stinger_s", "P_Stinger_S_Deploy") <= 0.99 do Wait(0) end

    -- Idle animations
    PlayEntityAnim(stinger,  "p_stinger_s_idle_deployed", LoadDict("p_ld_stinger_s"), 1000.0, false, true, 0, 0.99, 0)
    PlayEntityAnim(stinger2, "p_stinger_s_idle_deployed", LoadDict("p_ld_stinger_s"), 1000.0, false, true, 0, 0.99, 0)

    setupNetworkedSpike(stinger)
    setupNetworkedSpike(stinger2)

    local netId1 = NetworkGetNetworkIdFromEntity(stinger)
    local netId2 = NetworkGetNetworkIdFromEntity(stinger2)

    TriggerServerEvent("loaf_spikestrips:registerSpikePair", netId1, netId2)

    return stinger, stinger2
end



RegisterNetEvent("loaf_spikestrips:placeSpikestrip")
AddEventHandler("loaf_spikestrips:placeSpikestrip", function()
    DeployStinger()
end)

function RemoveStinger()
    local modelHash = `p_ld_stinger_s`
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- First: find closest spike strip piece
    local handle, entity = FindFirstObject()
    local success = true

    local closestStrip = nil
    local closestDist = 10.0

    repeat
        if DoesEntityExist(entity) and GetEntityModel(entity) == modelHash then
            local objCoords = GetEntityCoords(entity)
            local dist = #(playerCoords - objCoords)

            if dist < closestDist then
                closestDist = dist
                closestStrip = entity
            end
        end

        success, entity = FindNextObject(handle)
    until not success

    EndFindObject(handle)

    if not closestStrip then return end

    -- Second: find the paired stinger (the one spawned with it)
    local pairedStrip = nil
    local pairSearchRadius = 10.0 -- usually the two stingers are very close to each other

    local handle2, entity2 = FindFirstObject()
    local success2 = true


    repeat
        if DoesEntityExist(entity2) and GetEntityModel(entity2) == modelHash and entity2 ~= closestStrip then
            local dist2 = #(GetEntityCoords(closestStrip) - GetEntityCoords(entity2))
            if dist2 < pairSearchRadius then
                pairedStrip = entity2
            end
        end

        success2, entity2 = FindNextObject(handle2)
    until not success2

    EndFindObject(handle2)

    TriggerServerEvent("loaf_spikestrips:deleteSpike", closestStrip, pairedStrip)

    -- Give back one item
    TriggerServerEvent("loaf_spikestrips:removedSpike")
end



RegisterNetEvent("loaf_spikestrips:removeSpikestrip")
AddEventHandler("loaf_spikestrips:removeSpikestrip", function()
    RemoveStinger()
end)

function TouchingStinger(coords, stinger)
    local min, max = GetModelDimensions(GetEntityModel(stinger))
    local size = max - min
    local w, l, h = size.x, size.y, size.z

    local offset1 = GetOffsetFromEntityInWorldCoords(stinger, 0.0, l/2, h*-1)
    local offset2 = GetOffsetFromEntityInWorldCoords(stinger, 0.0, l/2 * -1, h)

    return IsPointInAngledArea(coords, offset1, offset2, w*2, 0, false)
end

function LoadDict(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end

    return Dict
end

function LoadModel(model)
    model = type(model) == "string" and GetHashKey(model) or model

    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        local timer = GetGameTimer() + 20000 -- 20 seconds to load
        RequestModel(model)
        while not HasModelLoaded(model) and timer >= GetGameTimer() do -- wait for the model to load
            Wait(50)
        end
    end

    return {loaded = HasModelLoaded(model), model = model}
end

-- removed UI
-- function HelpText(text, sound)
--     AddTextEntry(GetCurrentResourceName(), text)
--     BeginTextCommandDisplayHelp(GetCurrentResourceName())
--     EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
-- end

-- ox_target

function RemoveStingerEntity(entity)
    if not entity or entity == 0 or not DoesEntityExist(entity) then return end
    if GetEntityModel(entity) ~= SPIKE_MODEL then return end

    local netId = NetworkGetNetworkIdFromEntity(entity)
    if not netId or netId == 0 then return end

    TriggerServerEvent("loaf_spikestrips:removeSpikePair", netId)
end

RegisterNetEvent("loaf_spikestrips:clientDeletePair", function(netId1, netId2)
    local function deleteByNetId(netId)
        if not netId then return end
        local ent = NetworkGetEntityFromNetworkId(netId)
        if not ent or ent == 0 or not DoesEntityExist(ent) then return end

        local timeout = GetGameTimer() + 2000
        while not NetworkHasControlOfEntity(ent) and GetGameTimer() < timeout do
            NetworkRequestControlOfEntity(ent)
            Wait(0)
        end

        SetEntityAsMissionEntity(ent, true, true)
        DeleteEntity(ent)
    end

    deleteByNetId(netId1)
    deleteByNetId(netId2)
end)