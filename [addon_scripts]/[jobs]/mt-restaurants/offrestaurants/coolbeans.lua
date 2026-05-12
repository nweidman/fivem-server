-- This config is made to Hane Studios Coolbeans MLO - https://hanestudios.tebex.io/package/4561289

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Coolbeans',
    job = 'coolbeans',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-1208.488770, -1134.933838, 7.709276), sprite = 106, color = 41, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-1203.380981, -1157.074341, 7.0),
            vec3(-1215.102051, -1122.462769, 7.0),
            vec3(-1180.454590, -1106.599487, 7.0),
            vec3(-1153.449097, -1155.822510, 7.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(-1183.9, -1138.2, 7.9), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-1196.7, -1141.7, 8.0), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-1201.7, -1144.2, 7.5), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-1200.2, -1136.6, 8.0), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-1199.9, -1140.4, 7.9), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-1197.65, -1145.65, 7.8), radius = 1.0, label = 'Stove', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-1196.15, -1143.0, 8.0), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1201.35, -1146.4, 8.15), radius = 1.0, label = 'Slurpee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-1201.45, -1137.15, 8.1), radius = 1.0, label = 'Resgister', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-1197.4, -1138.2, 7.3), radius = 1.0, label = 'Coolbeans Menu' },
    },
    offlineShop = {
        { coords = vec4(-1199.667969, -1137.305298, 6.833269, 16.662355), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-1201.0, -1137.0, 8.1), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    delivery = {
        { coords = vec3(-1198.1, -1138.8, 7.75), radius = 1.05, prop = 'hei_prop_hei_bank_phone_01', propHeading = 200.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(-1201.8, -1133.45, 7.40, 285.38),
        vec4(-1199.55, -1132.55, 7.40, 109.55),

        vec4(-1199.6, -1130.1, 7.40, 109.55),
        vec4(-1201.9, -1130.9, 7.40, 285.38),

        vec4(-1202.6, -1131.1, 7.40, 109.55),
        vec4(-1204.95, -1132.05, 7.40, 285.38),

        vec4(-1208.8, -1127.55, 7.40, 285.38),
        vec4(-1207.0, -1126.9, 7.40, 109.55),

        vec4(-1206.5, -1126.7, 7.40, 285.38),
        vec4(-1204.65, -1126.0, 7.40, 109.55),

        vec4(-1205.2, -1130.35, 7.40, 20.09),
        vec4(-1204.25, -1130.0, 7.40, 20.09),
        vec4(-1203.35, -1129.65, 7.40, 20.09),

        vec4(-1204.0, -1127.7, 7.40, 198.38),
        vec4(-1204.95, -1128.05, 7.40, 198.38),
        vec4(-1205.85, -1128.45, 7.40, 198.38),

        vec4(-1201.05, -1127.65, 7.40, 285.38),
        vec4(-1202.45, -1126.9, 7.40, 20.09),
        vec4(-1203.0, -1124.3, 7.40, 198.38),
        vec4(-1201.55, -1123.8, 7.40, 198.38),
        vec4(-1199.4, -1125.05, 7.40, 109.55),
        vec4(-1198.95, -1126.45, 7.40, 109.55),

        vec4(-1186.4, -1136.4, 7.40, 199.75),
        vec4(-1185.6, -1136.1, 7.40, 199.75),
        vec4(-1184.8, -1135.75, 7.40, 199.75),

        vec4(-1183.85, -1137.25, 7.40, 107.62),
        vec4(-1186.5, -1138.25, 7.40, 294.06),

        vec4(-1184.35, -1139.75, 7.40, 29.87),
    },
}

AddRestaurant(restaurantConfig)
