-- This config is made to Kiiya The Hawker Boys MLO - https://kiiya.tebex.io/package/5251517

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Three Hawker Boys',
    job = 'cardealer',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-1390.06, -697.49, 24.53), sprite = 96, color = 6, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-1358.71, -682.1, 25.0),
            vec3(-1396.27, -634.28, 25.0),
            vec3(-1481.64, -696.05, 25.0),
            vec3(-1414.85, -721.07, 25.0)
        },
        thickness = 20,
    },
    management = {
        { coords = vec3(-1382.15, -662.1, 24.75), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-1396.0, -679.6, 24.25), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-1386.45, -672.8, 24.95), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-1387.55, -683.55, 25.0), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-1384.9, -674.75, 24.9), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-1384.1, -675.75, 24.85), radius = 1.0, label = 'Stove', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-1394.75, -675.25, 25.2), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1395.75, -680.25, 25.3), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1396.45, -679.4, 25.3), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1391.9, -680.75, 25.15), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1386.6, -682.95, 25.2), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-1394.9, -681.15, 25.1), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-1387.4, -679.8, 24.4), radius = 1.0, label = 'Hawker Boys Menu' },
    },
    offlineShop = {
        { coords = vec4(-1393.6, -680.62, 23.79, 181.8), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-1397.25, -677.9, 24.85), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 90.07 },
    },
    boxes = {
        { coords = vec3(-1387.9, -678.95, 24.2), radius = 1.0 },
        { coords = vec3(-1392.5, -676.2, 24.3), radius = 1.0 },
    },
    delivery = {
        { coords = vec3(-1384.8, -681.9, 24.85), radius = 1.05, prop = 'hei_prop_hei_bank_phone_01', propHeading = 200.0, priceLost = 10, comission = 10, cooldown = 0 },
    },
    chairs = {
        vec4(-1382.35, -683.85, 24.3, 134.17),
        vec4(-1383.4, -683.65, 24.3, 220.26),
        vec4(-1383.7, -684.65, 24.3, 277.14),
        vec4(-1382.5, -685.0, 24.3, 41.54),

        vec4(-1379.1, -685.9, 24.5, 110.81),
        vec4(-1379.7, -685.05, 24.5, 138.1),
        vec4(-1381.1, -686.1, 24.5, 291.02),
        vec4(-1380.55, -686.9, 24.5, 305.53),

        vec4(-1381.3, -687.5, 24.5, 114.04),
        vec4(-1382.6, -688.4, 24.5, 309.22),

        vec4(-1383.35, -688.95, 24.5, 118.26),
        vec4(-1383.95, -688.1, 24.5, 146.68),
        vec4(-1385.4, -689.15, 24.5, 296.48),
        vec4(-1384.8, -690.0, 24.5, 309.22),

        vec4(-1385.6, -690.4, 24.3, 130.63),
        vec4(-1386.2, -689.5, 24.3, 130.63),
        vec4(-1387.55, -690.6, 24.3, 300.1),
        vec4(-1386.95, -691.45, 24.3, 300.1),

        vec4(-1388.1, -692.35, 24.3, 36.57),
        vec4(-1388.8, -692.85, 24.3, 36.57),

        vec4(-1389.9, -687.4, 24.3, 311.97),
        vec4(-1388.7, -687.6, 24.3, 46.85),
        vec4(-1388.55, -686.5, 24.3, 128.09),
        vec4(-1389.75, -686.15, 24.3, 217.46),

        vec4(-1390.25, -682.95, 24.55, 316.74),
        vec4(-1391.8, -681.9, 24.55, 12.42),
        vec4(-1393.2, -682.45, 24.55, 32.53),
        vec4(-1395.45, -682.0, 24.55, 326.88),
        vec4(-1396.95, -680.45, 24.55, 313.82),
        vec4(-1398.0, -678.6, 24.55, 280.8),
        vec4(-1396.5, -675.3, 24.55, 215.37),
        vec4(-1395.1, -674.3, 24.55, 219.34),
        vec4(-1393.95, -673.45, 24.55, 217.51),
        vec4(-1392.7, -672.55, 24.55, 215.61),

        vec4(-1396.35, -684.6, 24.3, 14.6),
        vec4(-1397.65, -682.9, 24.3, 255.57),

        vec4(-1404.4, -678.55, 24.3, 359.32),
        vec4(-1402.75, -678.35, 24.3, 41.96),
        vec4(-1402.5, -676.0, 24.3, 135.72),
        vec4(-1402.95, -675.35, 24.3, 135.72),

        vec4(-1401.65, -674.65, 24.3, 314.07),
        vec4(-1402.1, -674.0, 24.3, 314.07),
        vec4(-1400.5, -672.65, 24.3, 153.86),
        vec4(-1399.45, -674.15, 24.3, 102.16),

        vec4(-1398.75, -670.85, 24.3, 214.99),
        vec4(-1397.8, -670.15, 24.3, 214.99),
        vec4(-1396.5, -671.75, 24.3, 55.7),
        vec4(-1397.5, -672.5, 24.3, 32.91),

        vec4(-1394.85, -668.05, 24.3, 214.99),
        vec4(-1394.1, -667.55, 24.3, 214.99),
        vec4(-1392.95, -669.05, 24.3, 55.7),
        vec4(-1394.1, -669.8, 24.3, 32.91),
        
        vec4(-1403.85, -679.7, 28.35, 316.92),
        vec4(-1404.3, -679.0, 28.35, 316.92),

        vec4(-1403.95, -677.25, 28.35, 216.7),
        vec4(-1403.3, -676.8, 28.35, 216.7),

        vec4(-1401.25, -675.4, 28.35, 314.01),
        vec4(-1400.45, -676.1, 28.35, 314.01),
        vec4(-1399.7, -674.15, 28.35, 128.44),
        vec4(-1399.15, -675.1, 28.35, 128.44),

        vec4(-1397.15, -672.1, 28.35, 214.68),
        vec4(-1396.35, -671.55, 28.35, 214.68),
        vec4(-1396.25, -673.9, 28.35, 33.79),
        vec4(-1394.95, -673.0, 28.35, 41.82),

        vec4(-1392.55, -671.1, 28.35, 24.67),
        vec4(-1391.3, -670.2, 28.35, 38.37),
        vec4(-1392.5, -668.8, 28.35, 214.68),
        vec4(-1393.35, -669.4, 28.35, 214.68),

        vec4(-1390.6, -674.35, 28.35, 254.3),
        vec4(-1389.65, -672.9, 28.35, 203.83),
        vec4(-1388.15, -675.45, 28.35, 17.75),

        vec4(-1386.25, -675.25, 28.35, 195.71),
        vec4(-1385.15, -676.85, 28.35, 38.92),

        vec4(-1383.9, -678.75, 28.35, 121.43),
        vec4(-1383.45, -679.35, 28.35, 121.43),
        vec4(-1386.65, -680.2, 28.35, 318.1),
        vec4(-1385.2, -681.7, 28.35, 331.41),
        vec4(-1383.45, -681.55, 28.35, 34.67),
    },
}

AddRestaurant(restaurantConfig)
