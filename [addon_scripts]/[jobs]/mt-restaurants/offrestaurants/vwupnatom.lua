-- This config is made to G&N's Studios Vinewood Up-N-Atom MLO - https://fivem.gnstud.io/package/5131483

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Up-N-Atom',
    job = 'vwupnatom',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(81.08, 274.02, 110.21), sprite = 76, color = 1, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(55.21, 271.77, 109.0),
            vec3(94.72, 257.56, 109.0),
            vec3(108.69, 306.02, 109.0),
            vec3(83.97, 315.94, 109.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(94.45, 292.55, 110.25), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(83.2, 290.6, 110.4), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(86.05, 284.55, 110.25), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(90.1, 288.5, 110.35), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(93.5, 288.55, 110.45), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(93.25, 287.75, 110.4), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(92.95, 290.0, 110.1), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
        { coords = vec3(90.0, 291.05, 110.15), radius = 1.0, label = 'Frier', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_cs_fork', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
    },
    registers = {
        { coords = vec3(86.85, 284.45, 110.3), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(85.05, 285.6, 110.25), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(85.9, 285.61, 109.22, 141.86), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(83.65, 289.45, 110.1), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 179.86+160 },
    },
    boxes = {
        { coords = vec3(85.15, 286.0, 109.8), radius = 1.0 },
    },
}

AddRestaurant(restaurantConfig)
