---@param data table
---@param item table
useFoodItem = function(data, item)
    local metadata = item.metadata or item.info
    local percent = tonumber(metadata.calories/10)
    if progressBar(locale(metadata.type == 'food' and 'progress_eating_food' or 'progress_drinking_drink', metadata.label), Config.times.eatFood, { car = false, move = false }, Config.foodAnimations[metadata.animation].anim, Config.foodAnimations[metadata.animation].prop) then
        addNeeds(metadata.type, percent)
        lib.callback.await('mt-restaurants:server:removeFoodItem', false, metadata, item.slot)
        giveCustomBuffs(metadata.type, metadata.customBuffs)
    end
end
exports("useFoodItem", useFoodItem)
RegisterNetEvent('mt-restaurants:client:useFoodItem', useFoodItem)