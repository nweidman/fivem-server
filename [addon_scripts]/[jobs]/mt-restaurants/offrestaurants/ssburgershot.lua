-- This config is made to G&N's Studios Sandy Shores Burgershot MLO - https://fivem.gnstud.io/package/5414041

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Burgershot',
    job = 'ssburgershot',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(1577.48, 3746.3, 34.43), sprite = 106, color = 1, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(1576.78, 3723.9, 34.0),
            vec3(1614.62, 3752.08, 34.0),
            vec3(1592.24, 3783.58, 34.0),
            vec3(1552.95, 3753.9, 34.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(1597.9, 3758.05, 34.35), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(1600.5, 3754.45, 34.55), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
        { coords = vec3(1591.6, 3752.6, 34.75), radius = 1.0, label = 'Pass', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(1588.9, 3752.65, 34.6), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(1590.05, 3751.0, 34.65), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(1593.65, 3753.4, 34.5), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(1589.35, 3755.4, 34.9), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(1595.0, 3748.35, 34.35), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
        { coords = vec3(1597.55, 3750.2, 34.3), radius = 1.0, label = 'Frier', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_cs_fork', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
    },
    registers = {
        { coords = vec3(1590.5, 3750.4, 34.75), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(1589.35, 3752.15, 34.85), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(1588.2, 3753.55, 34.7), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(1590.12, 3752.09, 33.43, 128.72), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(1590.95, 3749.9, 34.55), radius = 1.05, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 316.83+180 },
    },
    boxes = {
        { coords = vec3(1588.1, 3753.85, 33.9), radius = 1.0 },
    },
}

AddRestaurant(restaurantConfig)
