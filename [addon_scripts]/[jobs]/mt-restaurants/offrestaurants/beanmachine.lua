-- This config is made to Brambi Shop Beanmachine MLO - https://brambi-shop.tebex.io/package/6196693

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Beanmachine',
    job = 'beanmachine',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(336.997070, -776.170959, 29.266912), sprite = 106, color = 10, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(343.247040, -739.652161, 29.0),
            vec3(326.845337, -789.046875, 29.0),
            vec3(357.863831, -799.250122, 29.0),
            vec3(371.547821, -750.735046, 29.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(351.25, -762.15, 29.35), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(344.2, -777.8, 28.6), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(342.7, -776.6, 29.25), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(343.95, -778.85, 29.1), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(343.9, -779.5, 29.25), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(344.75, -776.6, 29.4), radius = 1.0, label = 'Cupcakes Pot', type = 'food', anim = { dict = 'anim@amb@clubhouse@boardroom@crew@male@var_a@base@', clip = 'idle_c' } },
    },
    registers = {
        { coords = vec3(341.95, -778.65, 29.4), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(342.3, -778.7, 28.8), radius = 1.05, label = 'Beanmachine Menu' },
    },
    offlineShop = {
        { coords = vec4(342.870728, -777.811646, 28.261986, 70.387817), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(343.05, -775.95, 29.2), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 249.04+160 },
    },
    boxes = {
        { coords = vec3(342.9, -776.7, 28.7), radius = 1.0 },
    },
    delivery = {
        { coords = vec3(343.6, -780.6, 29.3), radius = 1.05, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(343.05, -770.85, 28.50, 158.365112),
        vec4(342.2, -770.65, 28.50, 158.365112),
        vec4(341.45, -770.3, 28.50, 158.365112),

        vec4(345.35, -773.05, 29.10, 250.243347),
        vec4(345.0, -774.0, 29.10, 250.243347),

        vec4(341.85, -775.85, 29.10, 250.243347),
        vec4(341.5, -776.9, 29.10, 250.243347),
        vec4(341.1, -777.9, 29.10, 250.243347),
        vec4(340.75, -778.95, 29.10, 250.243347),
        vec4(341.7, -780.8, 29.10, 346.886322),
        vec4(342.45, -781.05, 29.10, 346.886322),

        vec4(343.7, -782.8, 28.8, 165.020706),
        vec4(344.6, -783.15, 28.8, 165.020706),
        vec4(343.15, -784.5, 28.8, 347.323456),
        vec4(343.95, -784.9, 28.8, 347.323456),

        vec4(342.5, -785.75, 28.8, 165.020706),
        vec4(343.55, -786.1, 28.8, 165.020706),
        vec4(342.05, -787.55, 28.8, 347.323456),
        vec4(343.1, -787.85, 28.8, 347.323456),

        vec4(340.5, -782.05, 28.8, 151.813080),
        vec4(339.6, -782.15, 28.8, 239.321716),
        vec4(339.75, -783.15, 28.8, 325.148499),
        vec4(340.65, -783.05, 28.8, 53.237495),

        vec4(339.05, -784.45, 28.8, 188.4),
        vec4(339.85, -784.9, 28.8, 123.1),
        vec4(339.35, -785.9, 28.8, 25.33),
        vec4(338.4, -785.3, 28.8, 298.9),

        vec4(336.85, -784.95, 28.8, 31.2),
        vec4(337.2, -784.0, 28.8, 116.03),
        vec4(335.85, -784.65, 28.8, 304.94),
        vec4(336.3, -783.6, 28.8, 209.16),

        vec4(337.45, -782.8, 28.8, 22.64),
        vec4(338.05, -781.9, 28.8, 109.85),
        vec4(337.15, -781.35, 28.8, 202.24),
        vec4(336.6, -782.2, 28.8, 280.14),

        vec4(333.77, -779.19, 28.8, 163.52),
        vec4(334.27, -780.21, 28.8, 74.86),
        vec4(333.24, -780.63, 28.8, 341.16),

        vec4(332.66, -782.17, 28.8, 166.88),
        vec4(333.16, -783.19, 28.8, 74.82),
        vec4(332.14, -783.61, 28.8, 342.58),

        vec4(331.53, -785.21, 28.8, 520.00),
        vec4(332.03, -786.22, 28.80, 430.00),
        vec4(331.01, -786.65, 28.80, 340.00),

        vec4(336.42, -772.03, 28.80, 340.00),
        vec4(337.45, -771.61, 28.80, 430.00),
        vec4(336.95, -770.59, 28.80, 520.00),

        vec4(337.56, -769.00, 28.80, 340.00),
        vec4(338.58, -768.57, 28.80, 430.00),
        vec4(338.08, -767.56, 28.80, 520.00),

        vec4(338.66, -766.02, 28.80, 340.00),
        vec4(339.69, -765.60, 28.80, 430.00),
        vec4(339.19, -764.59, 28.80, 520.00)
    },
}

AddRestaurant(restaurantConfig)
