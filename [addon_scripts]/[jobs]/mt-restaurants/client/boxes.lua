---@param job string
takeBox = function(job)
    lib.callback.await('mt-restaurants:server:addRestaurantBox', false, job)
end

---@param data table
---@param item table
useBoxItem = function(data, item)
    local metadata = item.metadata or item.info
    local success = lib.callback.await('mt-restaurants:server:checkBox', false, metadata.id)
    if success then
        openStash(metadata.id, locale('inventory_stash_restaurant_box'), Config.boxes.slots, Config.boxes.weigth)
    end
end
exports("useBoxItem", useBoxItem)
RegisterNetEvent('mt-restaurants:client:useBoxItem', useBoxItem)