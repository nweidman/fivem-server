-- This config is made to G&N's Studios MLO - https://fivem.gnstud.io/package/5029845

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Black Wood Saloon',
    job = 'bwsaloon',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-299.55, 6255.84, 31.53), sprite = 293, color = 40, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-305.58, 6249.13, 31.0),
            vec3(-326.3, 6270.04, 31.0),
            vec3(-306.66, 6288.65, 31.0),
            vec3(-286.46, 6268.44, 31.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(-307.7, 6268.5, 31.7), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-305.9, 6269.2, 31.0), radius = 1.05, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-307.6, 6267.7, 31.1), radius = 1.05, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-304.3, 6267.9, 31.7), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(-302.3, 6269.8, 31.7), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(-305.9, 6266.4, 31.7), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-305.0, 6270.3, 31.7), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-303.5, 6272.3, 31.9), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-303.1, 6268.8, 31.9), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-305.0, 6267.2, 31.9), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-302.7, 6272.4, 31.7), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(-304.97, 6268.55, 30.53, 225.59), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-303.3, 6255.5, 31.7), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    menus = {
        { coords = vec3(-305.6, 6267.7, 31.1), radius = 1.05, label = 'Black Wood Saloon Menu' },
    },
    delivery = {
        { coords = vec3(-306.1, 6269.2, 31.6), prop = 'hei_prop_hei_bank_phone_01', propHeading = 50.0, radius = 1.05, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {
        vec4(-301.662482, 6264.0, 31.323549, 175.976593),
        vec4(-300.929352, 6263.235840, 31.323549, 100.594910),
        vec4(-301.794495, 6262.360352, 31.323549, 6.312454),
        vec4(-299.612671, 6261.515625, 31.326925, 169.673553),
        vec4(-302.665771, 6263.295898, 31.326962, 274.304260),
        vec4(-300.369415, 6260.665527, 31.326977, 279.315887),
        vec4(-299.553375, 6260.042969, 31.327021, 350.925446),
        vec4(-298.685333, 6260.809570, 31.326954, 75.937218),
        vec4(-296.935822, 6263.035645, 31.326826, 329.207031),
        vec4(-295.712860, 6263.093262, 31.326826, 35.422874),
        vec4(-295.840271, 6264.228516, 31.326826, 131.482681),
        vec4(-296.891205, 6264.310059, 31.326853, 220.992126),
        vec4(-298.166138, 6265.576172, 31.326853, 33.656170),
        vec4(-299.227356, 6266.679199, 31.326874, 233.159271),
        vec4(-299.231903, 6265.568359, 31.326908, 310.243042),
        vec4(-298.111359, 6266.526367, 31.326836, 140.760620),

        vec4(-307.009155, 6265.588867, 31.323246, 321.078400),
        vec4(-305.961945, 6265.372070, 31.326830, 28.735247),
        vec4(-304.477173, 6265.984863, 31.326845, 42.309059),
        vec4(-303.574707, 6267.538086, 31.326885, 51.778164),
        vec4(-303.064636, 6268.019531, 31.326885, 44.334064),
        vec4(-302.121063, 6268.260254, 31.326891, 41.898235),
        vec4(-301.836761, 6269.091309, 31.326878, 57.193375),
        vec4(-301.263397, 6269.758789, 31.326880, 39.900990),
        vec4(-300.638763, 6270.251465, 31.326828, 53.726013),

        vec4(-310.997192, 6262.044434, 31.122713, 275.665894),
        vec4(-309.410614, 6263.721191, 31.123249, 54.093021),

        vec4(-304.560089, 6269.905273, 34.694785, 315.597412),
        vec4(-303.210419, 6270.074707, 34.694748, 42.583672),
        vec4(-303.224487, 6271.328125, 34.694748, 140.274277),
        vec4(-304.477234, 6271.277832, 34.694748, 239.887573),

        vec4(-300.900970, 6267.572754, 34.394749, 254.168945),
        vec4(-300.026215, 6268.186035, 34.394747, 185.318619),
        vec4(-301.212585, 6266.251465, 34.394753, 291.546265),
        vec4(-299.854340, 6265.596680, 34.394753, 26.450794),
        vec4(-298.940216, 6266.211426, 34.394753, 61.651451),
        vec4(-298.981201, 6267.504883, 34.394751, 124.978546),

        vec4(-298.502289, 6263.358398, 34.394751, 329.184143),
        vec4(-298.274414, 6264.671875, 34.394751, 260.005157),
        vec4(-297.282532, 6265.177246, 34.394751, 180.718246),
        vec4(-296.330811, 6264.646484, 34.394749, 122.628830),
        vec4(-295.955963, 6263.456055, 34.394749, 111.137047),
        vec4(-297.155945, 6262.723633, 34.394749, 29.962379),

        vec4(-298.887207, 6261.291504, 34.394760, 124.018906),
        vec4(-298.837830, 6259.873535, 34.394760, 56.340572),
        vec4(-300.049927, 6258.992676, 34.394760, 28.288733),
        vec4(-301.471130, 6259.916504, 34.394760, 291.203247),
        vec4(-301.356018, 6261.181152, 34.394753, 259.928497),
        vec4(-300.059174, 6261.890625, 34.394753, 184.176147),

        vec4(-304.446625, 6263.108887, 34.394794, 284.315430),
        vec4(-303.306793, 6262.355469, 34.394794, 21.584183),
        vec4(-302.385529, 6263.047852, 34.394758, 62.107056),
        vec4(-302.023621, 6264.082520, 34.394756, 104.484245),
        vec4(-303.301147, 6264.829590, 34.394756, 185.531891),
        vec4(-304.362976, 6264.194336, 34.394756, 251.874664)
    },
}

AddRestaurant(restaurantConfig)
