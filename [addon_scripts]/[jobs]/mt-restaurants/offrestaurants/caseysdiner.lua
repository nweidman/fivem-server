-- This config is made to Kiiya Casey's Diner MLO - https://kiiya.tebex.io/package/6629013

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = "Casey's Diner",
    job = 'caseysdiner',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-853.36, -1140.7, 6.27), sprite = 106, color = 17, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(1069.0, 2647.0, 40.0),
            vec3(1017.0, 2647.0, 40.0),
            vec3(1018.0, 2678.0, 40.0),
            vec3(1068.0, 2677.0, 40.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(1039.25, 2652.0, 40.0), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(1036.4, 2662.9, 39.3), radius = 1.05, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(1037.65, 2663.55, 40.0), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(1035.7, 2657.0, 40.0), radius = 1.05, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(1039.5, 2660.35, 40.0), radius = 1.0, label = 'Cofee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(1035.3, 2662.1, 40.15), radius = 1.0, label = 'Slurpies Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(1035.5, 2655.3, 39.9), radius = 1.05, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) } },
        { coords = vec3(1036.35, 2655.3, 40.0), radius = 1.05, label = 'Frier', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) } },
    },
    registers = {
        { coords = vec3(1039.6, 2662.15, 40.0), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(1039.05, 2663.3, 40.0), radius = 1.05, label = 'Beanmachine Menu' },
    },
    offlineShop = {
        { coords = vec4(1037.57, 2662.54, 38.92, 8.63), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    boxes = {
        { coords = vec3(1038.0, 2663.0, 39.2), radius = 1.0 },
    },
}

AddRestaurant(restaurantConfig)
