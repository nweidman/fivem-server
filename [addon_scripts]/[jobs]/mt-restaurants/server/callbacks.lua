if Config.inventory == 'ox_inventory' then
    lib.callback.register('mt-restaurants:server:registerCraft', function(source, id, items, label)
        return exports.ox_inventory:RegisterCraftStation(id, { items = items, label = label })
    end)
end

if Config.inventory ~= 'ox_inventory' and Config.framework == 'qb' then
    lib.callback.register('mt-restaurants:server:GetItemCount', function(source, item)
        local src = source
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        if Player.Functions.GetItemByName(item) then
            return Player.Functions.GetItemByName(item).amount
        end
        return 0
    end)

    lib.callback.register('mt-restaurants:server:openShop', function(source, id, label)
        local src = source
        exports[Config.inventory]:OpenShop(src, id)
        return true
    end)

    lib.callback.register('mt-restaurants:server:openStash', function(source, id, data)
        local src = source
        exports[Config.inventory]:OpenInventory(src, id, data)
        return true
    end)
end

lib.callback.register('mt-restaurants:server:addNeeds', function(source, thirst, hunger)
    return addNeeds(thirst, hunger)
end)

lib.callback.register('mt-restaurants:server:removeFoodItem', function(source, metadata, slot)
    local src = source
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:RemoveItem(src, 'restaurant_food', 1, metadata, slot)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.RemoveItem('restaurant_food', 1, slot)
    end
    return true
end)

if Config.inventory == 'ox_inventory' then
    lib.callback.register('mt-restaurants:server:getInventoryItems', function(source, invId)
        return exports.ox_inventory:GetInventoryItems(invId)
    end)

    lib.callback.register('mt-restaurants:server:openOfflineStash', function(_, invId, shopId, label)
        local shopStashItems = exports.ox_inventory:GetInventoryItems(invId)
        if not shopStashItems then return end
        local filteredItems = {}

        for _, v in pairs(shopStashItems) do
            filteredItems[#filteredItems + 1] = { name = v.name, count = v.count, price = v.metadata.price, slot = v.slot, metadata = v.metadata }
        end

        registerShop(shopId, label, filteredItems)

        return true
    end)
end

lib.callback.register('mt-restaurants:server:addRestaurantBox', function(source, job)
    local src = source
    local info = { id = 'restaurants_food_box_'..job..'_'..math.random(1, 999999) }
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(src, 'restaurant_box', 1, info)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.AddItem('restaurant_box', 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', src, Config.core.Shared.Items['restaurant_box'], "add", 1)
    end
    return true
end)

lib.callback.register('mt-restaurants:server:addRestaurantMenu', function(source, job)
    local src = source
    local menus = MySQL.query.await('SELECT * FROM `restaurants_menus` WHERE job = ?', { job })
    if not menus[1] or not menus[1].image_url then return end
    local info = { job = job, imageurl = menus[1].image_url, images = menus[1].image_url, image_url = menus[1].image_url, label = Config.restaurants[job].menus[1].label }
    if Config.inventory == 'ox_inventory' then
        exports.ox_inventory:AddItem(src, 'restaurant_menu', 1, info)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        Player.Functions.AddItem('restaurant_menu', 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', src, Config.core.Shared.Items['restaurant_menu'], "add", 1)
    end
    return true
end)

if Config.framework == 'esx' then
    lib.callback.register('mt-restaurants:server:getPlayerJobESX', function(source)
        local src = source
        local Player = Config.core.GetPlayerFromId(src)
        if not Player then return end
        return Player.getJob().name
    end)

    lib.callback.register('mt-restaurants:server:getPlayerJobIsBossESX', function(source)
        local src = source
        local Player = Config.core.GetPlayerFromId(src)
        if not Player then return end
        return (Player.getJob().grade_name == 'boss')
    end)
end

local canCraftItem = function(src, nItems)
    local items = 0
    local neededItems = {}

    for k, v in pairs(nItems) do
        neededItems[#neededItems+1] = { item = tostring(k), count = tonumber(v) }
    end

    if Config.inventory == 'ox_inventory' then
        for k, v in pairs(neededItems) do
            if exports.ox_inventory:GetItemCount(src, v.item) >= v.count then items += 1 else break end
        end
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        for k, v in pairs(neededItems) do
            if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.count then items += 1 else break end
        end
    end

    if items == #neededItems then return true end
    return false
end
lib.callback.register('mt-restaurants:server:canCraftItem', canCraftItem)

local validItem = function(src, item)
    if item == 'restaurant_food' then return true end

    for _, category in pairs(Config.ingredients) do
        for _, ing in pairs(category) do
            if ing.item == item then
                return true
            end

            if ing.neededItems then
                for neededItem, _ in pairs(ing.neededItems) do
                    if neededItem == item then
                        return true
                    end
                end
            end
        end
    end

    return false
end

lib.callback.register('mt-restaurants:server:craftItem', function(source, item, count, neededItems, metadata)
    local src = source
    
    if not canCraftItem(src, neededItems) then return end

    -- if not validItem(src, item) then
    --     return false
    -- end

    for k, _ in pairs(neededItems) do
        if not validItem(src, tostring(k)) then
            return false
        end
    end
    
    if Config.inventory == 'ox_inventory' then
        for k, v in pairs(neededItems) do
            exports.ox_inventory:RemoveItem(src, tostring(k), tonumber(v))
        end
        exports.ox_inventory:AddItem(src, item, count)
    else
        local Player = Config.core.Functions.GetPlayer(src)
        if not Player then return end
        for k, v in pairs(neededItems) do
            Player.Functions.RemoveItem(tostring(k), tonumber(v))
        end
        Player.Functions.AddItem(item, count, nil, metadata or {})
    end
    createLog(LogsConfig.craftItem, locale('logs_item_crafted'), locale('logs_item_crafted_desc', GetPlayerName(src), src, item, count))
    return true
end)

if Config.inventory == 'ox_inventory' then
    exports.ox_inventory:registerHook('swapItems', function(payload)
        if (type(payload.fromInventory) == 'string' and payload.fromInventory:match('^restaurants_food_box')) or (type(payload.toInventory) == 'string' and payload.toInventory:match('^restaurants_food_box')) then
            return (payload.fromSlot.name == 'restaurant_food')
        end
    end)
end