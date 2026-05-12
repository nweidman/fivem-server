-- This config is made to G&N's Studios Mirror Burgershot MLO - https://fivem.gnstud.io/package/5414040

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Burgershot',
    job = 'mpburgershot',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(1241.0842, -367.8490, 69.0822), sprite = 106, color = 1, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(1224.916992, -366.008911, 68.0),
            vec3(1226.076294, -328.189056, 68.0),
            vec3(1271.323486, -332.793549, 68.0),
            vec3(1286.547119, -365.455200, 68.0),
            vec3(1268.317261, -386.026489, 68.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(1249.85, -345.9, 69.35), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(1254.0, -346.95, 69.15), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
        { coords = vec3(1248.3, -353.95, 69.35), radius = 1.0, label = 'Pass', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(1246.2, -355.65, 69.4), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(1248.1, -356.2, 69.45), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(1253.8, -358.0, 69.3), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(1249.4, -352.1, 69.2), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(1244.75, -353.2, 69.6), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(1253.55, -355.15, 69.0), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
        { coords = vec3(1254.4, -352.15, 69.05), radius = 1.0, label = 'Frier', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_cs_fork', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
    },
    registers = {
        { coords = vec3(1246.85, -355.95, 69.5), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(1248.85, -356.45, 69.55), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(1245.05, -355.4, 69.45), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(1248.9, -356.2, 68.8), radius = 1.0, label = 'Burgershot Menu' },
    },
    offlineShop = {
        { coords = vec4(1245.96, -354.98, 68.21, 164.29), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(1249.45, -356.55, 69.35), radius = 1.05, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 175.76 },
    },
    boxes = {
        { coords = vec3(1244.9, -355.25, 68.8), radius = 1.0 },
    },
    drivethru = {
        { inCoords = vec3(1253.17, -357.79, 69.21), inRadius = 2.0, outCoords = vec3(1255.79, -358.67, 69.08), outRadius = 3.0, driveThruId = 123 },
    },
    delivery = {
        { coords = vec3(1252.7, -358.9, 69.1), radius = 1.05, prop = 'hei_prop_hei_bank_phone_01', propHeading = 180.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(1234.5, -363.7, 68.7, 344.77),
        vec4(1233.8, -362.5, 68.7, 256.28),

        vec4(1234.6, -361.0, 68.7, 346.54),
        vec4(1235.1, -359.5, 68.7, 168.15),

        vec4(1235.2, -358.9, 68.7, 336.77),
        vec4(1235.6, -357.4, 68.7, 165.77),

        vec4(1240.1, -359.1, 68.7, 169.34),
        vec4(1239.7, -360.6, 68.7, 352.16),

        vec4(1239.6, -361.2, 68.7, 173.21),
        vec4(1239.2, -362.7, 68.7, 343.81),

        vec4(1245.6, -364.4, 68.7, 350.55),
        vec4(1246.0, -362.9, 68.7, 166.9),

        vec4(1246.2, -362.3, 68.7, 350.55),
        vec4(1246.6, -360.9, 68.7, 166.9),

        vec4(1250.4, -365.7, 68.7, 350.55),
        vec4(1250.8, -364.2, 68.7, 166.9),

        vec4(1251.0, -363.6, 68.7, 350.55),
        vec4(1251.3, -362.2, 68.7, 166.9),

        vec4(1251.5, -361.5, 68.7, 350.55),
        vec4(1251.9, -360.1, 68.7, 166.9),
    },
}

AddRestaurant(restaurantConfig)
