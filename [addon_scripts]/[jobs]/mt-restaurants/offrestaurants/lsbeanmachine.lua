-- This config is made to FM Shop Legion Square Beanmachine - https://store.fm-shop.it/category/2175260

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Beanmachine',
    job = 'lsbeanmachine',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(112.33, -1037.91, 29.42), sprite = 106, color = 10, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(113.35, -1021.47, 29.0),
            vec3(103.52, -1046.47, 29.0),
            vec3(125.9, -1054.13, 29.0),
            vec3(136.14, -1027.2, 29.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(118.7, -1046.25, 29.4), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(127.6, -1033.45, 28.75), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(125.4, -1033.8, 29.35), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(126.9, -1035.8, 29.5), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(128.1, -1032.2, 29.7), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(126.15, -1037.4, 29.75), radius = 1.0, label = 'Slurpy Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(127.75, -1033.25, 29.6), radius = 1.0, label = 'Microwave', type = 'food', anim = { dict = 'random@shop_tattoo', clip = '_idle_a' } },
    },
    registers = {
        { coords = vec3(124.7, -1035.8, 29.45), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(124.85, -1035.15, 29.4), radius = 1.05, label = 'Beanmachine Menu' },
    },
    offlineShop = {
        { coords = vec4(125.95, -1034.54, 28.31, 68.79), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(116.35, -1036.9, 29.35), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    boxes = {
        { coords = vec3(125.7, -1038.55, 28.6), radius = 1.0 },
    },
    delivery = {
        { coords = vec3(126.1, -1032.4, 29.3), radius = 1.05, prop = 'hei_prop_hei_bank_phone_01', propHeading = 60.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(117.48, -1035.91, 28.83, 340.00),
        vec4(116.37, -1035.50, 28.83, 340.00),
        vec4(118.25, -1033.78, 28.83, 520.00),
        vec4(117.11, -1033.36, 28.83, 520.00),

        vec4(118.67, -1032.67, 28.83, 340.00),
        vec4(117.52, -1032.24, 28.83, 340.00),
        vec4(119.44, -1030.57, 28.83, 520.00),
        vec4(118.30, -1030.16, 28.83, 520.00),

        vec4(119.87, -1029.42, 28.83, 340.00),
        vec4(118.72, -1029.00, 28.83, 340.00),
        vec4(120.64, -1027.29, 28.83, 520.00),
        vec4(119.40, -1026.84, 28.83, 520.00),

        vec4(114.62, -1034.11, 29.00, 395.00),
        vec4(115.65, -1032.41, 29.00, 435.00),

        vec4(115.76, -1029.40, 29.00, 375.00),
        vec4(117.39, -1027.90, 29.00, 430.00),
        vec4(116.38, -1025.88, 29.00, 520.00),

        vec4(111.97, -1042.64, 29.00, 455.00),
        vec4(111.29, -1044.46, 29.00, 400.00),
        vec4(109.19, -1044.40, 29.00, 330.00)
    },
}

AddRestaurant(restaurantConfig)
