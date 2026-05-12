-- This config is made to G&N's Studios Grapeseed Up-N-Atom MLO - https://fivem.gnstud.io/package/6128760

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Up-N-Atom',
    job = 'gsupnatom',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(1801.43, 4589.51, 37.14), sprite = 76, color = 1, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(1826.72, 4582.14, 36.0),
            vec3(1765.07, 4579.27, 36.0),
            vec3(1775.07, 4616.36, 36.0),
            vec3(1808.49, 4619.15, 36.0)
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(1789.55, 4604.05, 37.35), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(791.2, 4598.6, 37.3), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
        { coords = vec3(1796.1, 4604.9, 37.55), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(1802.2, 4599.5, 37.7), radius = 1.0, label = 'Pass', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(1800.6, 4595.5, 37.5), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
        { coords = vec3(1804.9, 4602.3, 37.3), radius = 1.0, label = 'Drive Thru', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(1798.9, 4603.0, 37.35), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(1802.1, 4604.25, 37.5), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(1801.95, 4605.1, 37.6), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(1800.95, 4605.6, 37.4), radius = 1.0, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
        { coords = vec3(1797.85, 4605.35, 37.2), radius = 1.0, label = 'Frier', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_cs_fork', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) }  },
    },
    registers = {
        { coords = vec3(1801.4, 4595.75, 37.6), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(1799.3, 4596.0, 37.5), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    offlineShop = {
        { coords = vec4(1800.49, 4596.42, 36.33, 155.64), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(1796.8, 4598.9, 37.2), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = 349.91+180 },
    },
    boxes = {
        { coords = vec3(1799.35, 4596.35, 36.95), radius = 1.0 },
    },
    drivethru = {
        { inCoords = vec3(1803.32, 4601.88, 37.33), inRadius = 2.0, outCoords = vec3(1807.2, 4602.5, 37.24), outRadius = 3.0, driveThruId = 234 },
    },
    delivery = {
        { coords = vec3(1803.4, 4602.8, 37.4), radius = 1.05, prop = 'hei_prop_hei_bank_phone_01', propHeading = 0.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    menus = {
        { coords = vec3(1800.4, 4596.1, 37.2), radius = 1.05, label = 'Up-N-Atom Menu' },
    },
    chairs = {
        vec4(1800.53, 4591.89, 36.82, 95.00),
        vec4(1798.80, 4591.74, 36.82, 275.00),

        vec4(1798.07, 4591.68, 36.82, 95.00),
        vec4(1796.35, 4591.53, 36.82, 275.00),

        vec4(1795.62, 4591.46, 36.82, 95.00),
        vec4(1793.89, 4591.31, 36.82, 275.00),

        vec4(1793.17, 4591.25, 36.82, 95.00),
        vec4(1791.44, 4591.10, 36.82, 275.00),

        vec4(1790.71, 4591.03, 36.82, 95.00),
        vec4(1788.98, 4590.88, 36.82, 275.00),

        vec4(1788.25, 4590.82, 36.82, 95.00),
        vec4(1786.52, 4590.67, 36.82, 275.00),

        vec4(1784.62, 4592.34, 36.82, 5.00),
        vec4(1784.47, 4594.06, 36.82, 185.00),

        vec4(1789.20, 4596.68, 36.82, 275.00),
        vec4(1790.93, 4596.84, 36.82, 95.00),

        vec4(1791.66, 4596.90, 36.82, 275.00),
        vec4(1793.39, 4597.05, 36.82, 95.00),

        vec4(1794.12, 4597.11, 36.82, 275.00),
        vec4(1795.84, 4597.27, 36.82, 95.00)
    },
}

AddRestaurant(restaurantConfig)
