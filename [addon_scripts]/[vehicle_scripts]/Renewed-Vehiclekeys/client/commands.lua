local utils = require 'utils.client'
local Config = require 'data'

if not Config.useKeyItem then
    lib.callback.register('Renewed-Vehiclekeys:client:getVehicle', function()
        local vehicle = cache.vehicle or utils.getClosestKeyCar()

        return utils.hasKey(GetVehicleNumberPlateText(vehicle)) and VehToNet(vehicle) or false
    end)

    lib.callback.register('Renewed-Vehiclekeys:client:getPlayers', function()
        local players = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 5.0)

        for i = 1, #players do
            players[i] = GetPlayerServerId(players[i].id)
        end

        return players
    end)
end