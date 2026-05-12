local function typeLabel(t)
    local k = (type(t) == 'string' and t:lower()) or t
    if k == 'food'  then return locale('input_recipe_type_food')  end
    if k == 'drink' then return locale('input_recipe_type_drink') end
    if k == 'item'  then return locale('input_recipe_type_item')  end
    return tostring(t or '')
end

local function clamp(n, lo, hi)
    n = tonumber(n) or 0
    if lo and n < lo then n = lo end
    if hi and n > hi then n = hi end
    return n
end

function isPlayerAdmin()
    local isAdmin = lib.callback.await('drool:server:isAdmin', false)
    return isAdmin
end

openManagement = function(job)
    local menu = { title = locale('menu_management_title'), id = 'restaurant_boss_menu_'..job, options = {} }

    if isPlayerJobBoss() then
        menu.options[#menu.options+1] = {
            title = locale('menu_management_management_title'),
            description = locale('menu_management_management_description'),
            icon = locale('menu_management_management_icon'),
            arrow = true,
            onSelect = managementMenu
        }
    end

    if Config.restaurants[job].stations and isPlayerJobBoss() and isPlayerAdmin() then
        menu.options[#menu.options+1] = {
            title = locale('menu_management_recipes_title'),
            description = locale('menu_management_recipes_description'),
            icon = locale('menu_management_recipes_icon'),
            arrow = true,
            onSelect = function() recipesMenu(job) end
        }
    end

    if Config.restaurants[job].menus then
        local menus = lib.callback.await('mt-restaurants:server:getMenus', false, job)
        menu.options[#menu.options+1] = {
            title = locale('menu_management_menus_title'),
            image = (menus[1] and menus[1].image_url) or '',
            description = locale('menu_management_menus_description'),
            icon = locale('menu_management_menus_icon'),
            arrow = true,
            onSelect = function() editMenu(job) end
        }
    end

    if Config.restaurants[job].offlineShop and Config.inventory == 'ox_inventory' then
        menu.options[#menu.options+1] = {
            title = locale('menu_management_offline_shop_title'),
            description = locale('menu_management_offline_shop_description'),
            icon = locale('menu_management_offline_shop_icon'),
            arrow = true,
            onSelect = function()
                openStash(
                    ('restaurants_offline_shop_stash_%s'):format(job),
                    locale('inventory_stash_offline_shop'),
                    50, 100
                )
            end
        }
    end

    lib.registerContext(menu)
    lib.showContext(menu.id)
end

recipesMenu = function(job)
    local recipes = lib.callback.await('mt-restaurants:server:getRecipes', false, job)
    local menu = {
        title = locale('menu_management_recipes_title'),
        id = 'restaurant_recipes_menu_'..job,
        options = {},
        menu = 'restaurant_boss_menu_'..job
    }

    local disabled = false
    if Config.restaurants[job].maxRecipes and (Config.restaurants[job].maxRecipes <= #recipes) then
        disabled = true
    end
    menu.options[#menu.options+1] = {
        disabled = disabled,
        title = locale('menu_recipes_create_title'),
        icon = locale('menu_recipes_create_icon'),
        onSelect = function() createNewRecipe(job, 'create') end
    }

    if recipes and #recipes >= 1 then
        for _, v in pairs(recipes) do
            local types = typeLabel(v.type)

            local stations = ''
            local stationsArray = json.decode(v.stations)
            for x, y in pairs(stationsArray) do
                local space = (x == #stationsArray) and '' or ', '
                for a, b in pairs(Config.restaurants[job].stations) do
                    if 'station_'..job..'_'..a == y then
                        stations = stations..b.label..space
                    end
                end
            end

            local active = (tonumber(v.active) == 1) and locale('menu_recipe_active_true') or locale('menu_recipe_active_false')
            local animLabel = (Config.foodAnimations and Config.foodAnimations[v.animation] and Config.foodAnimations[v.animation].label) or ''

            menu.options[#menu.options+1] = {
                title = v.label,
                arrow = true,
                description = locale('menu_recipes_recipe_description'),
                icon = v.image_url,
                metadata = {
                    { label = locale('menu_recipe_label'),       value = v.label or '' },
                    { label = locale('menu_recipe_description'), value = v.description or '' },
                    { label = locale('menu_recipe_type'),        value = types },
                    { label = locale('menu_recipe_stations'),    value = stations },
                    { label = locale('menu_recipe_animation'),   value = animLabel },
                    { label = locale('menu_recipe_price'),       value = v.price or 0 },
                    { label = locale('menu_recipe_active'),      value = active },
                },
                onSelect = function() editRecipeMenu(job, v.id) end
            }
        end
    else
        menu.options[#menu.options+1] = {
            title = locale('menu_recipes_no_recipes_title'),
            description = locale('menu_recipes_no_recipes_description'),
            icon = locale('menu_recipes_no_recipes_icon')
        }
    end

    lib.registerContext(menu)
    lib.showContext(menu.id)
end

isValidStation = function(job, stations, type)
    for _, v in pairs(stations or {}) do
        for a, b in pairs(Config.restaurants[job].stations) do
            if 'station_'..job..'_'..a == v then
                if not (b.type == type) then return false end
            end
        end
    end
    return true
end

isValidIngredient = function(job, ingredients, type)
    for k, _ in pairs(ingredients or {}) do
        for _, b in pairs(Config.restaurants[job].ingredients) do
            if (b.item == k) and k ~= 'no_ingredient' then
                local haveType = false
                for _, y in pairs(b.type) do
                    if (y == type) then haveType = true end
                end
                return haveType
            elseif k == 'no_ingredient' then
                return true
            end
        end
    end
    return false
end

createNewRecipe = function(job, action, beforeValues)
    local stations = {}
    for k, v in pairs(Config.restaurants[job].stations) do
        stations[#stations+1] = { value = 'station_'..job..'_'..k, label = ('%s (%s)'):format(v.label, typeLabel(v.type)) }
    end

    local ingredients = {}
    ingredients[#ingredients+1] = { value = 'no_ingredient', label = locale('input_recipe_no_ingredient') }
    for _, v in pairs(Config.restaurants[job].ingredients) do
        local label = (itemData(v.item) and itemData(v.item).label) or v.item
        local typesStr, lastKey = '', 0
        for tk, _ in pairs(v.type) do lastKey = tk end
        for tk, tv in pairs(v.type) do
            local space = (tk == lastKey) and '' or ', '
            typesStr = typesStr .. typeLabel(tv) .. space
        end
        ingredients[#ingredients+1] = { value = v.item, label = ('%s (%s)'):format(label, typesStr) }
    end

    local animations = {}
    for k, v in pairs(Config.foodAnimations) do
        animations[#animations+1] = { value = k, label = v.label }
    end

    local types = {
        { value = 'food',  label = locale('input_recipe_type_food')  },
        { value = 'drink', label = locale('input_recipe_type_drink') },
        { value = 'weed',  label = 'Weed'  },
        { value = 'item',  label = 'Item'  },
    }

    local defaultValues = {
        label       = (beforeValues and beforeValues.label)       or '',
        description = (beforeValues and beforeValues.description) or '',
        image_url   = (beforeValues and beforeValues.image_url)   or '',
        price       = (beforeValues and beforeValues.price)       or 0,
        animation   = (beforeValues and beforeValues.animation)   or (animations[1] and animations[1].value),
        type        = (beforeValues and beforeValues.type)        or (types[1] and types[1].value),
        station     = (beforeValues and beforeValues.station)     or nil, -- array
        ingredients = (beforeValues and beforeValues.ingredients) or {},  -- map item->count
        active      = (beforeValues and beforeValues.active)      or true,
        recipeId    = (beforeValues and beforeValues.recipeId)    or nil,
        item        = (beforeValues and beforeValues.item)        or '',
    }

    local options = {
        { type = 'input',        label = locale('input_recipe_label'),        default = defaultValues.label,       placeholder = locale('input_recipe_label_placeholder'), required = true },
        { type = 'input',        label = 'Item Spawncode',                    default = defaultValues.item,         placeholder = 'soda', required = true },
        { type = 'input',        label = locale('input_recipe_description'),  default = defaultValues.description, placeholder = locale('input_recipe_description_placeholder') },
        { type = 'input',        label = locale('input_recipe_url'),          default = defaultValues.image_url,   placeholder = locale('input_recipe_url_placeholder'), required = true },
        { type = 'select',       label = locale('input_recipe_animation'),    searchable = true, default = defaultValues.animation, required = false, options = animations },
        { type = 'select',       label = locale('input_recipe_type'),         default = defaultValues.type,        required = true,  options = types },
        { type = 'multi-select', label = locale('input_recipe_station'),      searchable = true, default = defaultValues.station, clearable = true, required = true, options = stations },
        { type = 'checkbox',     label = locale('input_recipe_active'),       checked = defaultValues.active },
        { type = 'number',       label = locale('input_recipe_price'),        default = defaultValues.price,       required = true, max = Config.restaurants[job].maxRecipePrice },
    }

    local maxSlots = Config.restaurants[job].maxIngredients or 3
    local defaultsArr = {}
    for item, cnt in pairs(defaultValues.ingredients) do
        defaultsArr[#defaultsArr+1] = { item = item, count = tonumber(cnt) or 1 }
    end
    while #defaultsArr > maxSlots do table.remove(defaultsArr) end

    local qtyLabel = locale('input_recipe_ingredient_qty') or 'Quantity'
    for i = 1, maxSlots do
        local d = defaultsArr[i]
        options[#options+1] = {
            type = 'select',
            label = string.format('%s #%d', locale('input_recipe_ingredients'), i),
            searchable = true,
            default = (d and d.item) or 'no_ingredient',
            clearable = true,
            required = false,
            options = ingredients
        }
        options[#options+1] = {
            type = 'number',
            label = qtyLabel,
            default = (d and d.count) or 1,
            required = false,
            min = 1,
            max = 999
        }
    end

    local input = lib.inputDialog(locale('menu_recipes_create_title'), options)
    if not input then return recipesMenu(job) end

    local label         = input[1]
    local spawnItem     = input[2]
    local description   = input[3]
    local image_url     = input[4]
    local animation     = input[5]
    local rtype         = input[6]
    local stationSel    = input[7]
    local active        = input[8]
    local price         = input[9]

    if not tostring(image_url):match(locale('input_recipe_url_match')) then
        notify(locale('notify_error_invalid_url'), 'error')
        return createNewRecipe(job, action, beforeValues)
    end
    if not isValidStation(job, stationSel, rtype) then
        notify(locale('notify_error_invalid_station'), 'error')
        return createNewRecipe(job, action, beforeValues)
    end

    local BASE_FIELDS = 9
    local ingredientsMap = {}
    for slot = 1, maxSlots do
        local idxItem = BASE_FIELDS + (slot - 1) * 2 + 1
        local idxQty  = BASE_FIELDS + (slot - 1) * 2 + 2
        local selItem = input[idxItem]
        local selQty  = tonumber(input[idxQty]) or 0

        if selItem and selItem ~= 'no_ingredient' and selQty > 0 then
            ingredientsMap[selItem] = (ingredientsMap[selItem] or 0) + clamp(selQty, 1, 999)
        end
    end

    local distinct = 0 for _ in pairs(ingredientsMap) do distinct = distinct + 1 end
    if Config.restaurants[job].maxIngredients and distinct > Config.restaurants[job].maxIngredients then
        notify(locale('notify_error_invalid_ingredient_amount', Config.restaurants[job].maxIngredients), 'error')
        return createNewRecipe(job, action, beforeValues)
    end

    if not isValidIngredient(job, ingredientsMap, rtype) then
        notify(locale('notify_error_invalid_ingredient'), 'error')
        return createNewRecipe(job, action, beforeValues)
    end

    local recipeData = {
        label       = label,
        item        = spawnItem,
        description = description,
        image_url   = image_url,
        animation   = animation,
        type        = rtype,
        station     = stationSel,
        ingredients = ingredientsMap,
        active      = active,
        price       = price,
        job         = job,
        recipeId    = (beforeValues and beforeValues.recipeId) or nil
    }

    if not itemData(tostring(recipeData.item)) then
        notify('Invalid Recipe Item.', 'error')
        return createNewRecipe(job, action, beforeValues)
    end

    if action == 'create' then
        local created = lib.callback.await('mt-restaurants:server:createNewRecipe', false, recipeData)
        if created then notify(locale('notify_success_recipe_created'), 'success')
        else notify(locale('notify_success_recipe_not_created'), 'error') end
    else
        local edited = lib.callback.await('mt-restaurants:server:editRecipe', false, recipeData)
        if edited then notify(locale('notify_success_recipe_edited'), 'success')
        else notify(locale('notify_success_recipe_not_edited'), 'error') end
    end

    return recipesMenu(job)
end

-- ========= Edit / Delete / Menu Image =========

editRecipeMenu = function(job, recipeId)
    local recipes = lib.callback.await('mt-restaurants:server:getRecipes', false, job)
    if recipes and #recipes >= 1 then
        for _, v in pairs(recipes) do
            if v.id == recipeId then
                local recipeData = {
                    label = v.label,
                    item = v.item,
                    description = v.description,
                    image_url = v.image_url,
                    animation = v.animation,
                    type = v.type,
                    station = json.decode(v.stations),
                    ingredients = json.decode(v.ingredients),
                    active = v.active,
                    job = v.job,
                    price = v.price,
                    recipeId = recipeId
                }
                lib.registerContext({
                    id = 'restaurant_edit_recipe_menu_'..job..recipeId,
                    menu = 'restaurant_recipes_menu_'..job,
                    title = v.label,
                    options = {
                        {
                            title = locale('menu_edit_recipe_title'),
                            description = locale('menu_edit_recipe_description'),
                            icon = locale('menu_edit_recipe_icon'),
                            onSelect = function() createNewRecipe(job, 'edit', recipeData) end
                        },
                        {
                            title = locale('menu_delete_recipe_title'),
                            description = locale('menu_delete_recipe_description'),
                            icon = locale('menu_delete_recipe_icon'),
                            onSelect = function() deleteRecipe(job, recipeId) end
                        },
                    }
                })
                lib.showContext('restaurant_edit_recipe_menu_'..job..recipeId)
            end
        end
    end
end

deleteRecipe = function(job, recipeId)
    local alert = lib.alertDialog({
        header = locale('alert_delete_recipe_title'),
        content = locale('alert_delete_recipe_description'),
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        local deleted = lib.callback.await('mt-restaurants:server:deleteRecipe', false, recipeId, job)
        if deleted then
            notify(locale('notify_success_recipe_deleted'), 'success')
        else
            notify(locale('notify_success_recipe_not_deleted'), 'error')
        end
    end
    recipesMenu(job)
end

editMenu = function(job)
    local menus = lib.callback.await('mt-restaurants:server:getMenus', false, job)
    local input = lib.inputDialog(locale('input_edit_menu'), {
        { type = 'input', label = locale('input_menu_url'), default = (menus[1] and menus[1].image_url) or '', placeholder = locale('input_menu_url_placeholder'), required = true },
    })
    if input then
        local edited = lib.callback.await('mt-restaurants:server:editMenuImage', false, input[1], job)
        if edited then
            notify(locale('notify_success_menu_edited'), 'success')
        else
            notify(locale('notify_error_menu_not_edited'), 'error')
        end
    end
    openManagement(job)
end
