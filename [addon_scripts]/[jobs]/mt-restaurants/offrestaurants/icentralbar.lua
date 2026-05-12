-- This config is made to JR Shop Italian Central Bar MLO - https://jrshop.tebex.io/

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Italian Central Bar',
    job = 'icentralbar',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(248.13, -791.3, 30.52), sprite = 89, color = 11, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(237.5, -799.0, 30.0),
            vec3(245.0, -779.0, 30.0),
            vec3(292.5, -796.5, 30.0),
            vec3(260.0, -814.0, 30.0),
        },
        thickness = 20,
    },
    management = {
        { coords = vec3(260.95, -790.5, 30.75), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(257.25, -790.35, 30.55), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(258.5, -792.2, 30.8), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(258.4, -789.5, 30.7), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(259.55, -790.05, 30.8), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(259.55, -792.6, 30.8), radius = 1.0, label = 'Cupcakes Pot', type = 'food', anim = { dict = 'anim@amb@clubhouse@boardroom@crew@male@var_a@base@', clip = 'idle_c' } },
        { coords = vec3(256.65, -791.7, 30.6), radius = 1.0, label = 'Slurpy Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(258.0, -791.8, 30.6), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10, prop = 'v_ret_gc_cashreg', propHeading = 342.0+180 },
    },
    menus = {
        { coords = vec3(260.35, -793.0, 30.7), radius = 1.0, label = 'Italian Central Bar Menu' },
    },
    offlineShop = {
        { coords = vec4(259.35, -791.57, 29.47, 166.02), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(264.65, -796.9, 35.0), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    boxes = {
        { coords = vec3(261.0, -790.7, 30.1), radius = 1.0 },
    },
    chairs = {
        vec4(263.6, -791.45, 29.95, 162.63),
        vec4(265.0, -792.05, 29.95, 162.63),

        vec4(264.85, -795.9, 29.95, 124.85),
        vec4(264.15, -797.4, 29.95, 336.54),

        vec4(262.45, -799.25, 29.95, 71.51),
        vec4(262.25, -799.85, 29.95, 71.51),
        vec4(262.05, -798.2, 29.95, 156.51),
        vec4(260.95, -798.7, 29.95, 249.16),
        vec4(260.7, -799.45, 29.95, 249.16),

        vec4(261.75, -796.2, 29.95, 16.6),
        vec4(260.9, -795.5, 29.95, 256.94),
        vec4(261.95, -795.25, 29.95, 142.15),

        vec4(256.95, -798.8, 29.95, 340.05),
        vec4(255.8, -798.35, 29.95, 340.05),
        vec4(256.55, -796.2, 29.95, 158.62),
        vec4(257.8, -796.7, 29.95, 158.62),

        vec4(256.9, -794.0, 29.95, 159.13),
        vec4(257.85, -794.35, 29.95, 159.13),

        vec4(254.25, -793.7, 29.95, 343.45),
        vec4(253.8, -792.9, 29.95, 266.66),
        vec4(254.65, -792.55, 29.95, 160.37),
        vec4(255.1, -793.4, 29.95, 62.64),

        vec4(254.6, -788.5, 29.95, 200.22),
        vec4(254.75, -789.85, 29.95, 74.63),
        vec4(253.65, -789.45, 29.95, 247.86),

        vec4(252.35, -792.35, 29.95, 72.37),
        vec4(252.0, -791.6, 29.95, 154.79),
        vec4(251.6, -792.7, 29.95, 343.65),
        vec4(251.1, -791.9, 29.95, 255.7),

        vec4(257.5, -792.85, 30.3, 344.88),
        vec4(258.45, -793.25, 30.3, 344.88),
        vec4(259.55, -793.6, 30.3, 344.88),
        vec4(261.2, -793.6, 30.3, 17.38),

        vec4(256.6, -793.2, 34.75, 70.18),
        vec4(256.75, -792.05, 34.75, 70.18),
        vec4(257.35, -791.1, 34.75, 70.18),
        vec4(258.05, -789.6, 34.75, 144.72),
    },
}

AddRestaurant(restaurantConfig)
