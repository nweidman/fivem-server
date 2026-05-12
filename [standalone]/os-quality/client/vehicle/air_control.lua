local vehicleClassDisableControl = {
    [0] = true,     --compacts
    [1] = true,     --sedans
    [2] = true,     --SUV's
    [3] = true,     --coupes
    [4] = true,     --muscle
    [5] = true,     --sport classic
    [6] = true,     --sport
    [7] = true,     --super
    [8] = false,    --motorcycle
    [9] = true,     --offroad
    [10] = true,    --industrial
    [11] = true,    --utility
    [12] = true,    --vans
    [13] = false,   --bicycles
    [14] = false,   --boats
    [15] = false,   --helicopter
    [16] = false,   --plane
    [17] = true,    --service
    [18] = true,    --emergency
    [19] = false    --military
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, true)
        local vehicleClass = GetVehicleClass(vehicle)

        if ((GetPedInVehicleSeat(vehicle, -1) == player) and vehicleClassDisableControl[vehicleClass]) then
            if IsEntityInAir(vehicle) then
                DisableControlAction(2, 59)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)

            if IsEntityUpsidedown(veh) then
                DisableControlAction(0, 59, true) -- A/D or LEFT/RIGHT (vehicle turn)
                DisableControlAction(0, 60, true) -- W/S or UP/DOWN (vehicle tilt)
            end
        end
    end
end)
