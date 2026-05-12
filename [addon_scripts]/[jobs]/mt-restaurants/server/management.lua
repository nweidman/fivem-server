lib.callback.register('mt-restaurants:server:getRecipes', function(source, job)
    return MySQL.query.await('SELECT * FROM `restaurants_recipes` WHERE job = ?', { job })
end)

lib.callback.register('mt-restaurants:server:createNewRecipe', function(source, recipeData)
    local success = MySQL.insert.await('INSERT INTO `restaurants_recipes` (label, description, image_url, ingredients, animation, type, stations, active, price, job, item) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', { recipeData.label, recipeData.description or '', recipeData.image_url, json.encode(recipeData.ingredients), recipeData.animation, recipeData.type, json.encode(recipeData.station), recipeData.active, recipeData.price, recipeData.job, recipeData.item })
    if success then
        createLog(LogsConfig.createRecipe, locale('logs_created_new_recipe'), locale('logs_created_new_recipe_desc', GetPlayerName(source), source, recipeData.label, recipeData.type, recipeData.price, recipeData.job, recipeData.image_url), recipeData.image_url)
        registerStation(recipeData.job)
        return true
    else
        return false
    end
end)

lib.callback.register('mt-restaurants:server:editRecipe', function(source, recipeData)
    local success = MySQL.update.await('UPDATE `restaurants_recipes` SET label = ?, description = ?, image_url = ?, ingredients = ?, animation = ?, type = ?, stations = ?, active = ?, price = ?, job = ?, item = ? WHERE id LIKE ?', { recipeData.label, recipeData.description or '', recipeData.image_url, json.encode(recipeData.ingredients), recipeData.animation, recipeData.type, json.encode(recipeData.station), recipeData.active, recipeData.price, recipeData.job, recipeData.item, recipeData.recipeId, })
    if success then
        createLog(LogsConfig.editRecipe, locale('logs_recipe_edited'), locale('logs_recipe_edited_desc', GetPlayerName(source), source, recipeData.label, recipeData.type, recipeData.price, recipeData.job, recipeData.recipeId, recipeData.image_url), recipeData.image_url)
        registerStation(recipeData.job)
        return true
    else
        return false
    end
end)

lib.callback.register('mt-restaurants:server:deleteRecipe', function(source, recipeId, job)
    local success = MySQL.query.await('DELETE FROM `restaurants_recipes` WHERE id LIKE ?', { recipeId })
    if success then
        createLog(LogsConfig.deleteRecipe, locale('logs_recipe_deleted'), locale('logs_recipe_deleted_desc', GetPlayerName(source), source, recipeId))
        registerStation(job)
        return true
    else
        return false
    end
end)

lib.callback.register('mt-restaurants:server:getMenus', function(source, job)
    return MySQL.query.await('SELECT * FROM `restaurants_menus` WHERE job = ?', { job })
end)

lib.callback.register('mt-restaurants:server:editMenuImage', function(source, image_url, job)
    local menus = MySQL.query.await('SELECT * FROM `restaurants_menus` WHERE job = ?', { job })
    createLog(LogsConfig.menuImageEdited, locale('logs_menu_image_edited'), locale('logs_menu_image_edited_desc', GetPlayerName(source), source, job, image_url), image_url)
    if menus and #menus >= 1 then
        return MySQL.update.await('UPDATE `restaurants_menus` SET image_url = ? WHERE id LIKE ?', { image_url, menus[1].id })
    else
        return MySQL.insert.await('INSERT INTO `restaurants_menus` (image_url, job) VALUES (?, ?)', { image_url, job })
    end
end)

CreateThread(function()
    for k, v in pairs(Config.restaurants) do
        TriggerEvent('esx_society:registerSociety', v.job, v.job, 'society_'..v.job, 'society_'..v.job, 'society_'..v.job, { type = 'public' })
    end
end)