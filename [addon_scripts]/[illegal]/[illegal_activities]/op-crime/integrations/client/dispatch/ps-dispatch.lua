if Config.dispatchScript == "ps-dispatch" then

    function sendDispatchAlert(title, message, blipData, coordsData, Type)
        local coords = GetEntityCoords(cache.ped)
        local vehicle = GetVehicleData(cache.vehicle)

        local dispatchData = {
            message = message, -- add this into your locale
            codeName = Type, -- this should be the same as in config.lua
            code = Type,
            icon = 'fas fa-car-burst',
            priority = 2,
            coords = coords,
            street = GetStreetAndZone(coords),
            heading = GetPlayerHeading(),
            vehicle = vehicle.name,
            plate = vehicle.plate,
            color = vehicle.color,
            class = vehicle.class,
            doors = vehicle.doors,
            jobs = { 'leo' }
        }

        TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
    end
end