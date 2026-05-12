-- This config is made to Hane Studios Centrel Perk MLO - https://hanestudios.tebex.io/package/6212956

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Centrel Perk',
    job = 'centrelperk',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-1192.2, -1197.82, 7.63), sprite = 267, color = 11, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-1195.89, -1201.75, 7.0),
            vec3(-1169.47, -1198.1, 7.0),
            vec3(-1172.04, -1150.46, 7.0),
            vec3(-1202.98, -1175.03, 7.0)
        },
        thickness = 20,
    },
    management = {
        { coords = vec3(-1179.25, -1192.1, 12.45), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-1178.6, -1190.1, 8.0), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-1182.0, -1191.0, 8.25), radius = 1.05, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-1185.7, -1190.0, 7.7), radius = 1.05, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-1180.6, -1195.6, 7.7), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-1177.7, -1193.4, 7.7), radius = 1.0, label = 'Stove', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-1183.6, -1188.6, 8.0), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-1185.7, -1189.0, 7.8), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(-1184.85, -1189.62, 6.7, 103.81), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-1183.3, -1191.2, 7.7), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    boxes = {
        { coords = vec3(-1185.4, -1188.1, 7.2), radius = 1.05 },
    },
    peds = {
        { coords = vec4(-1185.94, -1196.25, 7.2, 359.63-80), model = 'a_c_cat_01', anim = { dict = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', clip = 'idle_a' } },
        { coords = vec4(-1187.77, -1179.32, 7.56, 187.44+80), model = 'a_c_cat_01', anim = { dict = 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', clip = 'idle_a' } },
    },
}

AddRestaurant(restaurantConfig)
