-- This config is made to AS MLO Rex's Diner MLO - https://as-mlo.tebex.io/package/5885870

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Rex Diner',
    job = 'rexdiner',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(2543.61, 2594.64, 38.1), sprite = 739, color = 15, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(2558.54, 2612.07, 37.0),
            vec3(2516.34, 2610.95, 37.0),
            vec3(2517.65, 2574.08, 37.0),
            vec3(2571.68, 2577.11, 37.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(2537.6, 2587.05, 38.9), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(2536.0, 2583.0, 38.7), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(2541.6, 2584.8, 38.2), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(2532.6, 2587.0, 38.7), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(2535.0, 2587.0, 38.8), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(2545.1, 2586.2, 38.8), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(2537.5, 2580.7, 38.6), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(2536.1, 2585.0, 39.3), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(2539.7, 2578.8, 38.4), radius = 1.0, label = 'Stove', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(2540.9, 2581.3, 38.4), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
        { coords = vec3(2537.7, 2578.8, 38.4), radius = 1.0, label = 'Frier', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_cs_fork', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
    },
    registers = {
        { coords = vec3(2536.8, 2587.0, 38.9), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(2535.53, 2586.38, 37.66, 14.18), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(2526.5, 2593.0, 38.7), radius = 1.05, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    boxes = {
        { coords = vec3(2535.7, 2586.9, 38.05), radius = 1.05 },
    },
    delivery = {
        { coords = vec3(2530.9, 2580.4, 39.2), radius = 1.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    menus = {
        { coords = vec3(2536.5, 2586.6, 38.2), radius = 1.05, label = 'Rex Diner Menu' },
    },
    chairs = {
        vec4(2549.7, 2581.2, 38.1, 3.03),
        vec4(2549.7, 2582.8, 38.1, 183.25),

        vec4(2549.7, 2583.8, 38.1, 3.03),
        vec4(2549.8, 2585.4, 38.1, 183.25),

        vec4(2549.7, 2586.5, 38.1, 3.03),
        vec4(2549.7, 2588.1, 38.1, 183.25),

        vec4(2534.4, 2593.3, 38.1, 99.49),
        vec4(2532.8, 2593.4, 38.1, 274.85),

        vec4(2531.9, 2593.4, 38.1, 99.49),
        vec4(2530.2, 2593.3, 38.1, 274.85),

        vec4(2529.2, 2593.4, 38.1, 99.49),
        vec4(2527.5, 2593.4, 38.1, 274.85),
    },
}

AddRestaurant(restaurantConfig)
