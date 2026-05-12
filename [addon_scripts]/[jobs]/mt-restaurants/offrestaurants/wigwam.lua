-- This config is made to Kiiya Wigwam Burgers MLO - https://kiiya.tebex.io/package/6300825

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Wigwam Burger',
    job = 'wigwam',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-853.36, -1140.7, 6.27), sprite = 106, color = 17, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-830.6, -1137.47, 7.70),
            vec3(-865.01, -1157.13, 7.70),
            vec3(-881.07, -1128.27, 7.70),
            vec3(-846.61, -1109.27, 7.70)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(-865.4, -1126.7, 7.05), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-853.2, -1119.85, 7.0), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-854.8, -1128.45, 7.8), radius = 1.0, label = 'Pass', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-854.95, -1131.5, 7.3), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(-854.8, -1126.5, 7.1), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-853.75, -1122.85, 7.0), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-853.2, -1127.2, 7.3), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-857.95, -1125.95, 7.2), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) } },
    },
    registers = {
        { coords = vec3(-855.6, -1131.5, 7.25), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(-855.15, -1125.85, 7.1), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-853.6, -1130.85, 7.35), radius = 1.05, label = 'Beanmachine Menu' },
    },
    offlineShop = {
        { coords = vec4(-855.45, -1130.66, 6.0, 216.22), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    boxes = {
        { coords = vec3(-854.45, -1130.5, 6.75), radius = 1.0 },
    },
    delivery = {
        { coords = vec3(-855.2, -1125.85, 7.2), radius = 1.05, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {},
}

AddRestaurant(restaurantConfig)
