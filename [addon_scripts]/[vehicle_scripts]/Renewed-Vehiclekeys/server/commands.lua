local utils = require 'utils.server'
local Config = require 'data'

lib.addCommand('addkey', {
    help = 'Give a vehicle key to a player',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
            optional = true,
        },
        {
            name = 'plate',
            type = 'string',
            help = 'Plate of the vehicle (Case sensitive)',
            optional = true,
        },
    },
    restricted = 'group.mod'
}, function(source, args)

    if args.target and args.plate then
        utils.addKey(args.target, args.plate)
    elseif not args.target and not args.plate then
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)

        if vehicle > 0 then
            utils.addKey(source, GetVehicleNumberPlateText(vehicle))
        end
    end
end)

if not Config.useKeyItem then
    lib.addCommand('givekeys', {
        help = 'Give keys to nearby or a specific player',
        params = {
            {
                name = 'target',
                type = 'playerId',
                help = 'Target player\'s server id',
                optional = true
            },
        },
    }, function(source, args)
        local netId = lib.callback.await('Renewed-Vehiclekeys:client:getVehicle', source)

        local vehicle = netId and utils.getEntityFromNetId(netId)

        if vehicle and vehicle > 0 then
            local plate = GetVehicleNumberPlateText(vehicle)
            if utils.hasKey(source, plate) then

                if args.target then
                    utils.addKey(args.target, plate)
                else
                    local players = lib.callback.await('Renewed-Vehiclekeys:client:getPlayers', source)

                    for i = 1, #players do
                        utils.addKey(players[i], plate)
                    end
                end
                TriggerClientEvent('QBCore:Notify', source, "You have given the keys.", 'success')
            end
        end
    end)
end