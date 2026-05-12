-- This config is made to FM Shop Malibu Club MLO - https://store.fm-shop.it/category/2175260

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Malibu Club',
    job = 'malibuclub',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(104.88, -637.83, 31.64), sprite = 590, color = 7, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(110.73, -601.59, 31.0),
            vec3(85.71, -670.85, 31.0),
            vec3(144.33, -690.99, 31.0),
            vec3(220.06, -639.78, 31.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(138.7, -636.6, 33.9), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(129.2, -666.4, 29.25), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(130.65, -662.6, 29.8), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(126.9, -662.0, 29.8), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(132.1, -663.9, 29.8), radius = 1.05, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(133.2, -664.3, 30.0), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(129.0, -662.8, 29.9), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(130.8, -663.5, 29.9), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(129.7, -663.6, 29.3), radius = 1.0, label = 'Malibu Club Menu' },
    },
    offlineShop = {
        { coords = vec4(129.48, -663.79, 28.71, 339.98), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(141.8, -651.5, 28.8), radius = 1.05, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    peds = {
        { coords = vec4(142.49, -651.71, 27.74, 70.29), model = 'ig_djsoljakob', anim = { dict = 'anim@amb@nightclub@djs@dixon@', clip = 'dixn_dance_cntr_open_dix' } },
        { coords = vec4(127.07, -652.13, 28.01, 211.67), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
        { coords = vec4(131.29, -641.6, 28.01, 135.97), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
    },
    garage = {
        {
            coords = vec4(101.63, -641.49, 30.68, 64.98+180),
            spawnCoords = vec4(92.6, -645.05, 31.57, 166.15),
            vehicles = {
                { icon = 'fas fa-car', label = 'Stretch', id = 'stretch' },
            },
        },
    },
}

AddRestaurant(restaurantConfig)
