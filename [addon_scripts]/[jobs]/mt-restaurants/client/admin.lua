RegisterNetEvent('mt-restaurants:client:adminFoodMenu', function(restaurantId, quantity)
    print(quantity)
    local src = source
    local recipes = lib.callback.await('mt-restaurants:server:getRecipes', false, restaurantId)
    local menu = {
        title = locale('menu_admin_givefood'),
        id = 'restaurant_admin_givefood',
        options = {}
    }

    if not recipes then return end

    for _, recipe in pairs(recipes) do
        local calories = 0
        local customBuffs = {}

        for a, b in pairs(json.decode(recipe.ingredients)) do
            if a ~= 'no_ingredient' then
                for x, y in pairs(Config.restaurants[restaurantId].ingredients) do
                    if y.item == a then
                        calories += (y.calories * b)

                        if y.customBuffs then
                            for o, p in pairs(y.customBuffs) do
                                if customBuffs[o] ~= nil then
                                    customBuffs[o] += (p * b)
                                else
                                    customBuffs[o] = (p * b)
                                end
                            end
                        end
                    end
                end
            end
        end
        
        menu.options[#menu.options + 1] = {
            title = recipe.label,
            description = recipe.description,
            icon = recipe.image_url,
            onSelect = function()
                TriggerServerEvent('mt-restaurants:server:admin', { imageurl = recipe.image_url, label = recipe.label, description = recipe.description, calories = calories, restaurant = Config.restaurants[restaurantId].label, animation = recipe.animation, type = recipe.type, price = recipe.price, customBuffs = customBuffs }, quantity)
            end
        }
    end

    lib.registerContext(menu)
    lib.showContext(menu.id)
end)