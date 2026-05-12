-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'The Lily Pad', -- The display name of the restaurant
    job = 'lilypad', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 6, -- Limit of ingredients per recipe
    maxRecipes = 30, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 1000, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = true, coords = vec3(1118.96, -641.73, 59.89), sprite = 266, color = 26, scale = 1.0, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(1175.4, -666.05, 57.07),
            vec3(1165.02, -610.56, 57.07),
            vec3(1084.27, -628.09, 57.07),
            vec3(1099.52, -682.03, 57.07),
        },
        thickness = 15,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(1118.96, -641.73, 59.89), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(1108.92, -640.38, 56.7), radius = 1.0, label = 'Ingredients Fridge', slots = 500, weight = 1000000 },
        { coords = vec3(1108.42, -636.73, 56.7), radius = 1.0, label = 'Food Storage', slots = 500, weight = 1000000 },
    },
    trays = { -- The retaurant tray stashes (not blocked to any job)
        { coords = vec3(1116.47, -639.99, 56.7), radius = 0.5, label = 'Food Tray', slots = 10, weight = 100000 },
    },
    prepare = { -- The restaurant prepare stations to prepare the ingredients
        -- { coords = vec3(84.57, 7.8, 68.58), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        -- { coords = vec3(84.9, 8.73, 68.56), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(1112.79, -635.03, 56.6), radius = 1.0, label = 'Microwave Oven', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1115.98, -634.67, 56.6), radius = 1.0, label = 'Food Assembly', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1118.1, -634.8, 56.6), radius = 1.0, label = 'Prepare Drinks', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = { -- The restaurant registers to charge the customers
        { coords = vec3(1114.86, -639.68, 56.7), radius = 0.5, label = 'Register', playersRadius = 5.0, comission = 70 },
    },
    menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
        { coords = vec3(1114.86, -639.68, 56.7), radius = 0.5, label = 'Menu' },
    },
    offlineShop = { -- The restaurant shop to players be able to buy added items when restaurants offline
       -- { coords = vec4(-1199.667969, -1137.305298, 6.833269, 16.662355), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = { -- The restaurant music laptop/dj table (to use prop just add the prop and propHeading fields)
       -- { coords = vec3(-1201.0, -1137.0, 8.1), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = -20.0 },
    },
    garage = { -- The restaurant garage
       --[[ {
            coords = vec4(-1188.096802, -1117.598877, 4.705121, 294.55+180), -- Garage prop spawn coords
            spawnCoords = vec4(-1183.451050, -1116.402954, 5.700829, 194.160385), -- Vehicle spawn coords
            vehicles = {
                { icon = 'fas fa-car', label = 'Panto', id = 'panto' },
                { icon = 'fas fa-car', label = 'Speedo Express', id = 'nspeedo' },
            },
        },]]
    },
    delivery = { -- The restaurant location to start the delivery mission
       -- { coords = vec3(-152.4, -266.5, 43.65), radius = 1.0, prop = 'hei_prop_hei_bank_phone_01', propHeading = -20.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    drivethru = { -- The restaurant drive thru locations where players inside the restaurant will receive a notify, it'll give a sound and then at the location they can communicate via a private channel only for that locations
      -- { inCoords = vec3(1803.2, 4602.03, 37.33), inRadius = 2.0, outCoords = vec3(1807.88, 4602.63, 37.24), outRadius = 3.0, driveThruId = 123 },
    },
    peds = { -- The restaurant spawned peds
       -- { coords = vec4(142.49, -651.71, 27.74, 70.29), model = 'ig_djsoljakob', anim = { dict = 'anim@amb@nightclub@djs@dixon@', clip = 'dixn_dance_cntr_open_dix' } },
       -- { coords = vec4(127.07, -652.13, 28.01, 211.67), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
       -- { coords = vec4(131.29, -641.6, 28.01, 135.97), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
    },
    chairs = { -- All the restaurant chairs (Can be used by all players)
        --[[vec4(-1201.8, -1133.45, 7.40, 285.38),
        vec4(-1199.55, -1132.55, 7.40, 109.55),]]
    },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)
