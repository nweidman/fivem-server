RegisterCommand("flipvehicle", function()
    TriggerEvent("os-quality:flipvehicle")
end, false)

RegisterNetEvent("os-quality:flipvehicle", function()
    local QBCore = exports['qb-core']:GetCoreObject()

    local Ped = PlayerPedId()
    local coords = GetEntityCoords(Ped)

    if IsPedInAnyVehicle(Ped, false) then
        QBCore.Functions.Notify("Exit the vehicle to use this command.", "error")
        return
    end

    -- Find closest vehicle (all types, including emergency)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 127)

    -- Fallback: shape test if no nearby vehicle found
    if not DoesEntityExist(vehicle) then
        local rayHandle = StartShapeTestCapsule(coords.x, coords.y, coords.z + 1.0, coords.x, coords.y, coords.z - 1.0, 2.5, 10, Ped, 0)
        local _, _, _, _, entityHit = GetShapeTestResult(rayHandle)
        if DoesEntityExist(entityHit) and IsEntityAVehicle(entityHit) then
            vehicle = entityHit
        end
    end

    if not DoesEntityExist(vehicle) then
        QBCore.Functions.Notify("No vehicle nearby.", "error")
        return
    end

    -- Force network control of vehicle
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    NetworkRequestControlOfNetworkId(netId)
    local attempts = 0
    while not NetworkHasControlOfNetworkId(netId) and attempts < 50 do
        Wait(100)
        NetworkRequestControlOfNetworkId(netId)
        attempts = attempts + 1
    end

    if not NetworkHasControlOfNetworkId(netId) then
        QBCore.Functions.Notify("Cannot gain control of the vehicle.", "error")
        return
    end

    -- Turn to face the vehicle
    TaskTurnPedToFaceEntity(Ped, vehicle, 1000)
    Wait(1000)

    -- Animation
    local dict = "missfinale_c2ig_11"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
    TaskPlayAnim(Ped, dict, "pushcar_offcliff_f", 8.0, -8.0, 10000, 49, 0, false, false, false)

    -- QBCore progress bar
    QBCore.Functions.Progressbar("flip_vehicle", "Flipping vehicle...", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        -- Success
        ClearPedTasks(Ped)

        local vehicleCoords = GetEntityCoords(vehicle)
        SetEntityCoords(vehicle, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1.0, true, true, true, false)
        Wait(100)
        SetEntityRotation(vehicle, 0.0, 0.0, GetEntityHeading(Ped), 2)
        Wait(200)
        PlaceObjectOnGroundProperly(vehicle)
        SetVehicleOnGroundProperly(vehicle)

        QBCore.Functions.Notify("Vehicle flipped successfully.", "success")
    end, function()
        -- Cancelled
        ClearPedTasks(Ped)
        QBCore.Functions.Notify("Flip cancelled.", "error")
    end)
end)
