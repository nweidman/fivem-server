CreateThread(function()
    while true do
        Wait(500)

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false)
            and IsControlPressed(2, 75)
            and not IsEntityDead(ped)
            and not IsPauseMenuActive()
        then
            Wait(150)

            if IsPedInAnyVehicle(ped, false)
                and IsControlPressed(2, 75)
                and not IsEntityDead(ped)
                and not IsPauseMenuActive()
            then
                local veh = LocalPlayer.state.vehicle or GetVehiclePedIsIn(ped, false)
                if veh and veh ~= 0 then
                    TaskLeaveVehicle(ped, veh, 256)
                end
            end
        end
    end
end)
