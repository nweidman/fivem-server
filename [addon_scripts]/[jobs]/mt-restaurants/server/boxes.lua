local registeredBoxes = {}

lib.callback.register('mt-restaurants:server:checkBox', function(source, id)
    if Config.inventory ~= 'ox_inventory' then return true end
    if registeredBoxes[id] then return true end

    exports.ox_inventory:RegisterStash(id, locale('inventory_stash_restaurant_box'), Config.boxes.slots, Config.boxes.weigth)
    registeredBoxes[id] = true

    return true
end)