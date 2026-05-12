-- This config is made to Ajaxon Coffee Shop - https://ajaxon.tebex.io/package/6006348

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Coffee Shop',
    job = 'coffeeshop',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(182.58, -228.34, 54.13), sprite = 89, color = 25, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(193.67, -228.94, 53.0),
            vec3(178.22, -225.34, 53.0),
            vec3(158.42, -258.6, 53.0),
            vec3(181.45, -267.7, 53.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(179.25, -242.15, 54.1), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(177.8, -236.9, 53.5), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(180.2, -235.6, 54.0), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(181.5, -238.5, 54.0), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(177.5, -237.3, 54.2), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(180.4, -238.3, 54.0), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
    },
    registers = {
        { coords = vec3(178.4, -235.0, 54.1), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(179.61, -236.31, 53.05, 344.88), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(182.3, -236.5, 53.96), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 90.07-120 },
    },
    boxes = {
        { coords = vec3(181.0, -236.5, 53.5), radius = 1.0 },
    },
    menus = {
        { coords = vec3(178.2, -235.6, 53.6), radius = 1.0, label = 'Coffee Shop Menu' },
    },
    delivery = {
        { coords = vec3(177.5, -234.7, 54.1), radius = 1.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(183.01, -230.64, 53.50, 180.76),
        vec4(182.04, -232.87, 53.50, -73.27),
        vec4(184.94, -232.26, 53.57, 242.00),

        vec4(184.69, -237.02, 53.50, 152.00),
        vec4(186.09, -237.53, 53.50, 152.00),
        vec4(184.51, -239.74, 53.57, 242.00),

        vec4(184.94, -232.26, 53.57, 242.00),
        vec4(187.54, -234.03, 53.50, 59.24),
        vec4(188.08, -232.53, 53.50, 63.46),

        vec4(189.86, -233.51, 53.93, -29.09),
        vec4(183.56, -234.35, 57.52, 242.00)
    },
}

AddRestaurant(restaurantConfig)
