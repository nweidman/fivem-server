-- This config is made to Xtxvxtx Cafe Day MLO - https://xtxvxtx-mods.tebex.io/package/5363733

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Cafe Day',
    job = 'cafeday',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-509.35, -22.03, 45.61), sprite = 621, color = 41, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-492.75, -9.86, 45.0),
            vec3(-519.18, -12.24, 45.0),
            vec3(-532.66, -18.01, 45.0),
            vec3(-546.3, -31.01, 45.0),
            vec3(-512.62, -47.1, 45.0),
            vec3(-478.42, -47.96, 45.0)
        },
        thickness = 20,
    },
    management = {
        { coords = vec3(-512.35, -32.1, 46.1), radius = 1.05 },
    },
    stashes = {
        { coords = vec3(-512.9, -33.0, 45.85), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-511.3, -35.65, 45.95), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-510.1, -33.9, 45.75), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-512.85, -35.45, 45.75), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-514.7, -37.55, 45.65), radius = 1.05, label = 'Stove', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-508.15, -36.4, 45.95), radius = 1.05, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-514.85, -32.85, 45.85), radius = 1.05, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-508.75, -34.15, 45.85), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-511.3, -34.0, 45.8), radius = 1.0, label = 'Cafe Day Menu' },
    },
    offlineShop = {
        { coords = vec4(-509.75, -34.68, 44.73, 0.7), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-508.05, -35.0, 45.7), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 90.07+180 },
    },
    boxes = {
        { coords = vec3(-513.05, -34.25, 45.3), radius = 1.05 },
    },
    peds = {
        { coords = vec4(-505.25, -38.2, 44.94, 4.7), model = 'a_c_cat_01', anim = { dict = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', clip = 'idle_a' } },
        { coords = vec4(-504.4, -35.08, 45.33, 46.33), model = 'a_c_cat_01', anim = { dict = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', clip = 'idle_a' } },
        { coords = vec4(-503.99, -32.27, 45.1, 80.8), model = 'a_c_cat_01', anim = { dict = 'amb@lo_res_idles@', clip = 'creatures_world_cat_ledge_sleep_lo_res_base' } },
        { coords = vec4(-504.2, -29.20, 46.23, 90.83-90), model = 'a_c_cat_01', anim = { dict = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', clip = 'idle_a' } },
        { coords = vec4(-511.5, -31.71, 44.50, 307.3), model = 'a_c_cat_01', anim = { dict = 'amb@lo_res_idles@', clip = 'creatures_world_cat_ledge_sleep_lo_res_base' } },
    },
    delivery = {
        { coords = vec3(-511.9, -34.6, 46.3), radius = 1.05, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(-504.1, -34.3, 45.4, 95.23),
        vec4(-504.1, -33.35, 45.4, 95.23),
        vec4(-504.0, -32.3, 45.4, 95.23),
        vec4(-504.0, -31.25, 45.4, 95.23),

        vec4(-506.5, -26.3, 45.25, 276.29),
        vec4(-506.45, -25.45, 45.25, 276.29),
        vec4(-506.4, -24.65, 45.25, 276.29),

        vec4(-505.7, -20.5, 45.25, 273.21),
        vec4(-503.95, -20.5, 45.25, 91.27),

        vec4(-513.25, -27.95, 45.25, 184.13),
        vec4(-515.05, -27.8, 45.25, 264.15),

        vec4(-512.45, -31.25, 45.5, 180.32),
        vec4(-513.45, -31.15, 45.5, 180.32),
        vec4(-514.4, -31.1, 45.5, 180.32),
        vec4(-515.4, -31.05, 45.5, 180.32)
    },
}

AddRestaurant(restaurantConfig)
