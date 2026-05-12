local MS = MissionShared

local isMultiCheckpointMission = false
local multiCheckpointVehicle = nil
local multiCheckpointVehNetId = nil
local multiCheckpointVehPlate = nil
local multiCheckpointCurrentMark = nil
local multiCheckpointCurrentBlip = nil
local multiCheckpointStartBlip = nil
local multiCheckpointRoute = {}
local multiCheckpointRouteIndex = 0
local multiCheckpointDeadline = 0

local multiCheckpointSpawnCoords = {
    vec4(132.13, -2994.07, 6.03, 357),
    vec4(913.30, -1262.72, 24.57, 32),
    vec4(-425.14, -1688.28, 18.03, 155),
}

local multiCheckpointCoordsPool = {
    vec4(1374.55, 2171.89, 96.73, 355),
    vec4(2504.43, 4196.92, 38.95, 229),
    vec4(1660.81, 4950.50, 41.09, 245),
    vec4(384.70, 3587.16, 32.29, 356),
    vec4(-1158.24, 2677.09, 17.09, 223),
    vec4(-190.58, 6287.09, 30.49, 343),
}

local function clearMultiCheckpointMissionState()
    if multiCheckpointStartBlip then RemoveBlip(multiCheckpointStartBlip) end
    if multiCheckpointCurrentBlip then RemoveBlip(multiCheckpointCurrentBlip) end
    if multiCheckpointCurrentMark then SH.RemoveMarkedCoords(multiCheckpointCurrentMark) end

    multiCheckpointStartBlip = nil
    multiCheckpointCurrentBlip = nil
    multiCheckpointCurrentMark = nil
    multiCheckpointRoute = {}
    multiCheckpointRouteIndex = 0
    multiCheckpointDeadline = 0
    multiCheckpointVehicle = nil
    multiCheckpointVehNetId = nil
    multiCheckpointVehPlate = nil
    isMultiCheckpointMission = false
end

local function setupMultiCheckpointStep()
    if not isMultiCheckpointMission then return end
    if multiCheckpointCurrentMark then SH.RemoveMarkedCoords(multiCheckpointCurrentMark) end
    if multiCheckpointCurrentBlip then RemoveBlip(multiCheckpointCurrentBlip) end
    multiCheckpointCurrentMark = nil
    multiCheckpointCurrentBlip = nil

    if multiCheckpointRouteIndex > #multiCheckpointRoute then
        if multiCheckpointVehicle and DoesEntityExist(multiCheckpointVehicle) then
            Fr.DeleteVehicle(multiCheckpointVehicle)
        end
        clearMultiCheckpointMissionState()
        sendNotify("Route completed in time. Multi delivery finished.", "success", 8)
        TriggerServerEvent('op-crime:endMission', "multi_checkpoint_delivery")
        return
    end

    local target = multiCheckpointRoute[multiCheckpointRouteIndex]
    multiCheckpointCurrentBlip = SH.addBlip(target.xyz, 1, 2, ("Checkpoint %s/3"):format(multiCheckpointRouteIndex))
    SetBlipAsShortRange(multiCheckpointCurrentBlip, false)
    SetNewWaypoint(target.x, target.y)

    local ped = {
        heading = target.w,
        model = "s_m_m_ups_02",
        gender = "male",
    }

    multiCheckpointCurrentMark = SH.MarkNewCoords(target, {type = 6, size = vec3(Config.Misc.zoneSize, Config.Misc.zoneSize, Config.Misc.zoneSize), color = Config.Misc.zoneColor}, false, ped, function()
    end, function()
        local playerVeh = MS.findNearbyMissionVehicle(PlayerPedId(), multiCheckpointVehicle, multiCheckpointVehNetId, multiCheckpointVehPlate, "burrito3", 20.0)
        if not MS.vehicleMatchesMission(playerVeh, multiCheckpointVehicle, multiCheckpointVehNetId, multiCheckpointVehPlate, "burrito3") then
            sendNotify("You must arrive with the delivery van.", "error", 7)
            return
        end

        multiCheckpointRouteIndex = multiCheckpointRouteIndex + 1
        setupMultiCheckpointStep()
    end, {
        name = "mission_multi_checkpoint_step",
        label = ("Complete checkpoint %s/3"):format(multiCheckpointRouteIndex),
        icon = "fa-solid fa-route"
    })
end

function startMultiCheckpointDeliveryMission()
    if isMultiCheckpointMission then return end

    lib.alertDialog({
        header = "Multi Delivery",
        content = "Complete 3 checkpoints with the cargo before time runs out.",
        centered = true,
        cancel = false,
        labels = { confirm = "Understood" }
    })

    isMultiCheckpointMission = true
    multiCheckpointDeadline = GetGameTimer() + (30 * 60 * 1000)

    local startCoords = multiCheckpointSpawnCoords[math.random(1, #multiCheckpointSpawnCoords)]
    local shuffled = {}
    for i = 1, #multiCheckpointCoordsPool do shuffled[i] = multiCheckpointCoordsPool[i] end
    for i = #shuffled, 2, -1 do
        local j = math.random(i)
        shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
    end
    multiCheckpointRoute = {shuffled[1], shuffled[2], shuffled[3]}
    multiCheckpointRouteIndex = 1

    multiCheckpointStartBlip = SH.addBlip(startCoords.xyz, 478, 3, "Collect delivery van")
    SetBlipAsShortRange(multiCheckpointStartBlip, false)
    SetNewWaypoint(startCoords.x, startCoords.y)

    Fr.SpawnVehicle("burrito3", startCoords.xyz, startCoords.w, true, function(vehicle)
        multiCheckpointVehicle = vehicle
        multiCheckpointVehNetId = VehToNet(vehicle)
        multiCheckpointVehPlate = MS.normalizePlate(GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true, false)
    end)

    Citizen.CreateThread(function()
        local warned5 = false
        while isMultiCheckpointMission do
            local remaining = multiCheckpointDeadline - GetGameTimer()
            if remaining <= 0 then
                sendNotify("Delivery route timer ended.", "error", 8)
                if multiCheckpointVehicle and DoesEntityExist(multiCheckpointVehicle) then
                    Fr.DeleteVehicle(multiCheckpointVehicle)
                end
                clearMultiCheckpointMissionState()
                break
            end

            if not warned5 and remaining <= (5 * 60 * 1000) then
                warned5 = true
                sendNotify("5 minutes left to complete the route.", "warning", 7)
            end
            Wait(1000)
        end
    end)

    Citizen.CreateThread(function()
        while isMultiCheckpointMission do
            local playerVeh = GetVehiclePedIsIn(PlayerPedId(), false)
            if MS.vehicleMatchesMission(playerVeh, multiCheckpointVehicle, multiCheckpointVehNetId, multiCheckpointVehPlate, "burrito3") then
                if multiCheckpointStartBlip then
                    RemoveBlip(multiCheckpointStartBlip)
                    multiCheckpointStartBlip = nil
                end
                setupMultiCheckpointStep()
                break
            end
            Wait(500)
        end
    end)
end

