-- This config is made to BadBoss Kebab King MLO - https://badboss-mapping.tebex.io/package/5862781

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Kebab King',
    job = 'kebabking',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(326.49, -806.33, 29.27), sprite = 674, color = 5, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(318.55, -815.48, 29.0),
            vec3(325.32, -792.96, 29.0),
            vec3(359.99, -805.62, 29.0),
            vec3(363.55, -822.6, 29.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(336.4, -811.5, 29.3), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(339.5, -804.3, 29.4), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(335.1, -805.5, 29.4), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(336.5, -803.6, 29.3), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(337.8, -803.2, 29.4), radius = 1.0, label = 'Drinks', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(338.1, -806.2, 29.1), radius = 1.0, label = 'Oven', type = 'food', anim = { dict = 'random@shop_tattoo', clip = '_idle_a' } },
        { coords = vec3(337.1, -803.0, 29.6), radius = 1.0, label = 'Kebab Maker', type = 'food', anim = { dict = 'random@shop_tattoo', clip = '_idle_a' } },
    },
    registers = {
        { coords = vec3(335.2, -806.6, 29.3), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(336.24, -806.03, 28.27, 72.66), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(335.7, -805.6, 29.2), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 69.17 },
    },
    delivery = {
        { coords = vec3(335.97, -811.18, 29.21), radius = 1.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    menus = {
        { coords = vec3(335.7, -806.6, 28.7), radius = 1.05, label = 'Kebab King Menu' },
    },
    chairs = {
        vec4(331.91, -805.96, 28.80, 320.48),
        vec4(332.52, -804.40, 28.80, 531.43),

        vec4(334.18, -803.23, 28.77, 416.28),
        vec4(333.14, -802.44, 28.77, 230.84),

        vec4(332.06, -802.26, 28.80, 440.07),
        vec4(331.34, -801.00, 28.80, 520.38),
        vec4(330.48, -803.00, 28.80, 330.38),

        vec4(330.57, -804.21, 28.80, 502.32),
        vec4(330.60, -805.39, 28.80, 418.71),
        vec4(329.45, -806.05, 28.80, 314.24),

        vec4(329.17, -808.60, 28.80, 260.48),
        vec4(331.90, -809.68, 28.80, 420.48),

        vec4(327.17, -805.45, 28.79, 330.00),
        vec4(328.28, -805.59, 28.79, 360.00),
        vec4(327.88, -802.96, 28.79, 535.00),
        vec4(328.83, -803.52, 28.79, 495.00),

        vec4(328.40, -802.17, 28.72, 325.00),
        vec4(329.32, -802.46, 28.72, 360.00),
        vec4(329.08, -799.89, 28.79, 190.00),
        vec4(330.20, -800.25, 28.79, 505.00)
    },
}

AddRestaurant(restaurantConfig)
