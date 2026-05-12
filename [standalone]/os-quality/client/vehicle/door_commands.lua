RegisterCommand("door", function(_, args)
    local door = tonumber(args[1])
    if not door or door < 0 or door > 3 then
        return
    end
    TriggerEvent("os-quality:opendoor", door)
end, false)

-- /hood command (door 4)
RegisterCommand("hood", function()
    TriggerEvent("os-quality:opendoor", 4)
end, false)

-- /trunk command (door 5)
RegisterCommand("trunk", function()
    TriggerEvent("os-quality:opendoor", 5)
end, false)

-- Shared event to toggle door state
RegisterNetEvent("os-quality:opendoor", function(door)
    local ped = PlayerPedId()
    local doornum = tonumber(door)
    if not doornum or doornum < 0 or doornum > 5 then return end

    local vehicle = 0

    -- If player is in a vehicle, use it
    if IsPedInAnyVehicle(ped, false) then
        vehicle = GetVehiclePedIsIn(ped, false)
    else
        -- Try to use last vehicle the player was in
        local lastVehicle = GetPlayersLastVehicle()
        if DoesEntityExist(lastVehicle) and #(GetEntityCoords(ped) - GetEntityCoords(lastVehicle)) < 10.0 then
            vehicle = lastVehicle
        else
            -- Find a nearby vehicle that is occupied (e.g. another player inside)
            local coords = GetEntityCoords(ped)
            local nearbyVeh = GetClosestVehicle(coords.x, coords.y, coords.z, 7.5, 0, 70)
            if DoesEntityExist(nearbyVeh) then
                -- Check if any seat is occupied
                for seat = -1, GetVehicleMaxNumberOfPassengers(nearbyVeh) - 1 do
                    if GetPedInVehicleSeat(nearbyVeh, seat) ~= 0 then
                        vehicle = nearbyVeh
                        break
                    end
                end
            end
        end
    end

    if vehicle == 0 or not DoesEntityExist(vehicle) then return end
    if GetVehicleDoorLockStatus(vehicle) == 2 then return end -- Locked

    -- Request control of vehicle
    if not NetworkHasControlOfEntity(vehicle) then
        NetworkRequestControlOfEntity(vehicle)
        local timeout = GetGameTimer() + 1000
        while not NetworkHasControlOfEntity(vehicle) and GetGameTimer() < timeout do
            Wait(0)
        end
    end

    -- Toggle door
    if GetVehicleDoorAngleRatio(vehicle, doornum) > 0.0 then
        SetVehicleDoorShut(vehicle, doornum, false)
    else
        SetVehicleDoorOpen(vehicle, doornum, false, false)
    end
end)
