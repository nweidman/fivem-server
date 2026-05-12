local ESX, QBCore = nil, nil

if wsb.framework == 'esx' then ESX = exports['es_extended']:getSharedObject() end
if wsb.framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end


if wsb.framework == 'esx' then
    ESX.RegisterCommand('givecrutch', 'admin', function(xPlayer, args, showError)
        GiveCrutchTarget(args.playerId.source, args.time)
    end, false, {help = 'Give crutch', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
        {name = 'time', help = 'Time in minutes', type = 'number'},
    }})

    ESX.RegisterCommand('givechair', 'admin', function(xPlayer, args, showError)
        GiveWheelchairTarget(args.playerId.source, args.time)
    end, false, {help = 'Give wheelchair', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
        {name = 'time', help = 'Time in minutes', type = 'number'},
    }})

    ESX.RegisterCommand('resetcrutch', 'admin', function(xPlayer, args, showError)
        local identifier = wsb.getIdentifier(args.playerId.source)

        activeCrutch[identifier] = nil
        TriggerClientEvent('wasabi_crutch:breakLoop', args.playerId.source)
    end, false, {help = 'Reset crutch time', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
    }})

    ESX.RegisterCommand('resetchair', 'admin', function(xPlayer, args, showError)
        local identifier = wsb.getIdentifier(args.playerId.source)

        activeChair[identifier] = nil
        TriggerClientEvent('wasabi_crutch:breakLoop', args.playerId.source)
    end, false, {help = 'Reset wheelchair time', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
    }})
elseif wsb.framework == 'qb' then
    lib.addCommand('givecrutch', {
    help = 'Give crutch',
    params = {
        { name = 'id', help = 'The target', type = 'number' },
        { name = 'time', help = 'Time in minutes', type = 'number' }
    },
    restricted = 'admin'
}, function(source, args)
    if args.id then
        GiveCrutchTarget(args.id, args.time)
    end
end)

    lib.addCommand('givechair', {
        help = 'Give wheelchair',
        params = {
            { name = 'id', help = 'The target', type = 'number' },
            { name = 'time', help = 'Time in minutes', type = 'number' }
        },
        restricted = 'admin'
    }, function(source, args)
        if args.id then
            GiveWheelchairTarget(args.id, args.time)
        end
    end)

    lib.addCommand('resetcrutch', {
        help = 'Reset crutch time',
        params = {
            { name = 'id', help = 'The target', type = 'number' }
        },
        restricted = 'admin'
    }, function(source, args)
        if args.id then
            local identifier = wsb.getIdentifier(args.id)
            activeCrutch[identifier] = nil
            TriggerClientEvent('wasabi_crutch:breakLoop', args.id)
        end
    end)

    lib.addCommand('resetchair', {
        help = 'Reset wheelchair time',
        params = {
            { name = 'id', help = 'The target', type = 'number' }
        },
        restricted = 'admin'
    }, function(source, args)
        if args.id then
            local identifier = wsb.getIdentifier(args.id)
            activeChair[identifier] = nil
            TriggerClientEvent('wasabi_crutch:breakLoop', args.id)
        end
    end)

end