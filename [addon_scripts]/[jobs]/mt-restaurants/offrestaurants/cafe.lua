-- This config is made to Marcinhu Scripts Café MLO - https://marcinhu.tebex.io/package/6303534

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Café',
    job = 'cafe',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-1395.19, -229.73, 44.33), sprite = 106, color = 17, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-1385.03, -234.32, 43.50),
            vec3(-1395.03, -219.31, 43.50),
            vec3(-1422.66, -238.77, 43.50),
            vec3(-1408.8, -254.85, 43.50)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(-1409.55, -243.75, 44.55), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-1406.6, -231.1, 44.7), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-1401.25, -230.95, 44.6), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(-1403.65, -232.6, 44.55), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-1401.25, -228.3, 44.5), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-1404.4, -229.2, 44.8), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1400.65, -229.3, 44.5), radius = 1.0, label = 'Stove', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) } },
    },
    registers = {
        { coords = vec3(-1400.75, -230.65, 44.65), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(-1403.15, -232.2, 44.6), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(-1401.85, -230.36, 43.47, 215.28), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    boxes = {
        { coords = vec3(-1402.5, -231.25, 44.0), radius = 1.0 },
    },
    chairs = {},
}

AddRestaurant(restaurantConfig)
