if not Config.inventory == 'ox_inventory' then return end
local offlineShopPed = {}

openOfflineShop = function(id, label, job)
    lib.callback.await('mt-restaurants:server:openOfflineStash', false, 'restaurants_offline_shop_stash_'..job, id, label)
    openShop(id, label, job)
end

updateOfflineShop = function(id, action)
    if not Config.restaurants[id] or not Config.restaurants[id].offlineShop then return end

    if action == 'spawn' then
        if not playerInsideRestaurant then return end
        local online = lib.callback.await('mt-restaurants:server:checkRestaurantOnline', false, id)
        for a, b in pairs(Config.restaurants[id].offlineShop) do
            if (not online) and (not offlineShopPed[a]) then
                offlineShopPed[a] = createPed(b.coords, b.model, { scenario = b.scenario })
                local options = {
                    {
                        distance = 2.5,
                        label = locale('target_shop', b.label),
                        icon = locale('target_shop_icon'),
                        onSelect = function() openOfflineShop('restaurants_offline_shop_'..id, b.label, id) end,
                        action = function() openOfflineShop('restaurants_offline_shop_'..id, b.label, id) end,
                    }
                }
                createEntityTarget(offlineShopPed[a], options, 2.5, 'restaurants_offline_shop_'..a)
            end
        end
    else
        for a, b in pairs(Config.restaurants[id].offlineShop) do
            if offlineShopPed[a] then
                DeletePed(offlineShopPed[a])
                DeleteEntity(offlineShopPed[a])
                offlineShopPed[a] = nil
            end
        end
    end
end

RegisterNetEvent('mt-restaurants:client:updateSpawnedShopPeds', function(id, action)
    updateOfflineShop(id, action)
end)