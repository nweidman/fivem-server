-- This config is made to FM Shop Comedy Club MLO - https://store.fm-shop.it/category/2175260

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Comedy Club',
    job = 'comedyclub',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-430.03, 260.49, 83.01), sprite = 102, color = 61, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-410.2, 251.88, 83.0),
            vec3(-405.72, 301.11, 83.0),
            vec3(-460.83, 305.92, 83.0),
            vec3(-466.96, 259.64, 83.0),
        },
        thickness = 15,
    },
    management = {
        { coords = vec3(-446.2, 275.3, 83.0), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-443.3, 275.7, 82.5), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-441.55, 275.85, 83.35), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-443.0, 275.1, 83.1), radius = 1.05, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-442.55, 277.0, 83.4), radius = 1.0, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-431.95, 264.05, 83.1), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(-442.8, 276.95, 83.1), radius = 0.15, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-441.9, 275.6, 82.6), radius = 1.0, label = 'Comedy Club Menu' },
    },
    offlineShop = {
        { coords = vec4(-432.45, 264.63, 82.0, 270.63), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-436.3, 272.7, 82.7), radius = 1.05, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    chairs = {
        vec4(-434.48, 277.91, 82.50, 485.38),
        vec4(-435.80, 278.43, 82.50, 198.33),

        vec4(-436.49, 276.49, 82.50, 504.79),
        vec4(-437.74, 276.83, 82.50, 189.79),

        vec4(-438.90, 278.07, 82.50, 524.79),
        vec4(-440.08, 277.80, 82.48, 235.00),

        vec4(-439.41, 280.66, 82.14, 515.38),
        vec4(-440.82, 280.22, 82.14, 240.38),

        vec4(-437.98, 281.72, 82.14, 225.38),
        vec4(-436.34, 281.72, 82.14, 500.38),

        vec4(-436.91, 279.66, 82.50, 509.79),
        vec4(-438.06, 279.62, 82.50, 210.86),

        vec4(-435.14, 280.30, 82.14, 200.38),
        vec4(-433.89, 279.57, 82.14, 475.38),
    },
}

AddRestaurant(restaurantConfig)
