lib.locale()
-- lib.addCommand('givefood', {
--     help = locale('command_give_food'),
--     params = {
--         {
--             name = 'target',
--             type = 'playerId',
--             help = locale('command_target')
--         },
--         {
--             name = 'restaurantId',
--             type = 'string',
--             help = locale('command_restaurant_id')
--         },
--         {
--             name = 'quantity',
--             type = 'number',
--             help = locale('command_quantity')
--         }
--     },
--     restricted = 'group.admin'
-- }, function(source, args, raw)
--     local src = source
--     local target = args['target']
--     local restaurantId = args['restaurantId']
--     local quantity = args['quantity']

--     if not target or not restaurantId then return end

--     TriggerClientEvent('mt-restaurants:client:adminFoodMenu', src, restaurantId, quantity)
-- end)

RegisterNetEvent('mt-restaurants:server:admin', function(metadata, count)
    local src = source

    if not IsPlayerAceAllowed(src, 'admin') then return end

    if not metadata then return end

    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(src, 'restaurant_food', count, metadata or {})
    else
        local Player = Config.core.Functions.GetPlayer(src)
        Player.Functions.AddItem('restaurant_food', count, nil, metadata or {})
    end
end)