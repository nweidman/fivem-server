-- This config is made to Kiiya The Lust Resort MLO - https://kiiya.tebex.io/package/5680100

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'The Lust Resort',
    job = 'lustresort',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 30,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-576.92, 241.28, 82.7), sprite = 279, color = 1, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-558.9, 241.95, 82.0),
            vec3(-612.79, 251.41, 82.0),
            vec3(-612.13, 174.23, 82.0),
            vec3(-553.53, 171.35, 82.0),
        },
        thickness = 25,
    },
    management = {
        { coords = vec3(-566.95, 206.5, 82.4), radius = 1.0 },
    },
    stashes = {
        { coords = vec3(-565.65, 215.6, 81.85), radius = 1.0, label = 'Fridge', slots = 50, weight = 100 },
        { coords = vec3(-560.9, 213.0, 82.4), radius = 1.0, label = 'Storage', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-569.7, 220.15, 82.5), radius = 1.0, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-566.25, 218.8, 82.4), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-567.9, 220.0, 82.7), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-572.65, 220.4, 82.65), radius = 1.0, label = 'Beer Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = {
        { coords = vec3(-575.25, 234.15, 82.85), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(-573.75, 219.9, 82.6), radius = 1.05, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-571.5, 220.55, 82.65), radius = 1.05, label = 'Lust Resort Menu' },
    },
    offlineShop = {
        { coords = vec4(-574.44, 235.78, 81.65, 92.08), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = {
        { coords = vec3(-563.65, 219.75, 86.2), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50 },
    },
    garage = {
        {
            coords = vec4(-592.25, 203.18, 70.54, 0.0),
            spawnCoords = vector4(-595.01, 201.21, 71.47, 174.86),
            vehicles = {
                { icon = 'fas fa-car', label = 'Stretch', id = 'stretch' },
            },
        },
    },
    peds = {
        { coords = vec4(-563.11, 219.66, 85.24, 90.98), model = 'ig_djsoljakob', anim = { dict = 'anim@amb@nightclub@djs@dixon@', clip = 'dixn_dance_cntr_open_dix' } },
        { coords = vec4(-569.64, 215.11, 82.7, 355.18), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
        { coords = vec4(-571.72, 215.11, 82.7, 350.77), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
        { coords = vec4(-570.35, 217.01, 82.7, 357.58), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
    },
    chairs = {
        vec4(-571.94, 224.0, 81.80, 186.00),
        vec4(-573.90, 223.46, 81.80, 536.00),
        vec4(-571.99, 226.86, 81.79, 536.00),
        vec4(-574.95, 227.96, 81.81, 196.00),
        vec4(-574.03, 226.02, 81.80, 261.00),
        vec4(-575.98, 222.74, 81.80, 261.00),
        vec4(-576.69, 226.61, 81.81, 281.00)
    },
}

AddRestaurant(restaurantConfig)
