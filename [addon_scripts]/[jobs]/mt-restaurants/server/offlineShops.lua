if Config.inventory == 'ox_inventory' then
    lib.locale()
    local onlineJobPlayers = {}
    local isPlayerJobOnline = {}

    for k, v in pairs(Config.restaurants) do
        exports.ox_inventory:RegisterStash('restaurants_offline_shop_stash_'..k, locale('inventory_stash_offline_shop'), 50, 10000)

        exports.ox_inventory:registerHook('swapItems', function(payload)
            if payload.fromSlot.name == 'restaurant_food' then return true end
            return false
        end, { inventoryFilter = { 'restaurants_offline_shop_stash_'..k } })
    end

    exports.ox_inventory:registerHook('buyItem', function(payload)
        for k, v in pairs(Config.restaurants) do
            local expectedShopType = 'restaurants_offline_shop_' .. k
            if payload.shopType == expectedShopType then
                local total = payload.price * payload.count
                addAccountMoney(k, total)
                exports.ox_inventory:RemoveItem('restaurants_offline_shop_stash_' .. k, payload.itemName, payload.count, payload.metadata)
                break
            end
        end
    end)

    lib.callback.register('mt-restaurants:server:setOnlineJobPlayers', function(source, job, action)
        if action == 'add' then
            if not isPlayerJobOnline[job] then isPlayerJobOnline[job] = {} end
            table.insert(isPlayerJobOnline[job], source)
            onlineJobPlayers[job] = (onlineJobPlayers[job] or 0) + 1
        elseif onlineJobPlayers[job] ~= nil then
            for job, players in pairs(isPlayerJobOnline) do
                for i = #players, 1, -1 do
                    if players[i] == source then table.remove(players, i) break end
                end
            end
            onlineJobPlayers[job] -= 1
        end
        return onlineJobPlayers
    end)

    AddEventHandler('playerDropped', function(reason)
        for job, players in pairs(isPlayerJobOnline) do
            for i = #players, 1, -1 do
                if players[i] == source then
                    onlineJobPlayers[job] -= 1
                    table.remove(players, i)
                    if onlineJobPlayers[job] <= 0 then
                        TriggerClientEvent('mt-restaurants:client:updateSpawnedShopPeds', -1, job, 'spawn')
                    end
                    break
                end
            end
        end
    end)

    lib.callback.register('mt-restaurants:server:checkRestaurantOnline', function(source, job)
        return onlineJobPlayers[job] ~= nil and onlineJobPlayers[job] > 0
    end)

    lib.callback.register('mt-restaurants:server:getStashItems', function(source, stashId)
        local items = MySQL.query.await('SELECT * FROM `'..Config.inventoriesDatabase..'` WHERE '..Config.itemsDatabaseColumn..' = ?', { stashId })
        return json.decode(items[1].items)
    end)

    RegisterNetEvent('mt-restaurants:server:updateSpawnedShopPeds', function(id, action)
        if onlineJobPlayers[id] ~= nil and onlineJobPlayers[id] > 0 then
            TriggerClientEvent('mt-restaurants:client:updateSpawnedShopPeds', -1, id, action)
        end
    end)
end