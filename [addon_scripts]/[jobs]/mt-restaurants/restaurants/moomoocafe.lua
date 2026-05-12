-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'Moo Moo Cafe', -- The display name of the restaurant
    job = 'moo', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 6, -- Limit of ingredients per recipe
    maxRecipes = 30, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 1000, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = true, coords = vec3(-581.06, -1066.22, 22.34), sprite = 176, color = 32, scale = 0.8, display = 6 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(-569.6913, -1168.9326, 21.0),
            vec3(-557.2254, -1122.5416, 21.0),
            vec3(-556.9571, -1042.5731, 21.0),
            vec3(-625.7817, -1041.6096, 21.0),
            vec3(-623.9863, -1168.4564, 21.0),
        },
        thickness = 15,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(-584.59, -1063.66, 22.33), radius = 1.0 },
        { coords = vec3(-589.07, -1061.78, 26.39), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(-587.77, -1066.56, 22.3), radius = 1.0, label = 'Ingredients Storage', slots = 50, weight = 2000000 },
        -- { coords = vec3(-590.67, -1068.1, 21.45), radius = 1.0, label = 'Ingredients Storage', slots = 50, weight = 100 },
        { coords = vec3(-587.95, -1062.82, 22.3), radius = 1.0, label = 'Prepared Food', slots = 50, weight = 1000000 },

    },
    trays = { -- The retaurant tray stashes (not blocked to any job)
        { coords = vec3(-586.77, -1060.95, 22.3), radius = 0.5, label = 'Moo Moo Cafe Counter 1', slots = 10, weight = 100000},
        { coords = vec3(-584.64, -1062.86, 22.3), radius = 0.5, label = 'Moo Moo Cafe Counter 2', slots = 10, weight = 100000},
        { coords = vec3(-571.68, -1068.74, 22.3), radius = 1.0, label = 'Moo Moo Cafe Table 1', slots = 10, weight = 100000},
        { coords = vec3(-571.72, -1065.99, 22.3), radius = 1.0, label = 'Moo Moo Cafe Table 2', slots = 10, weight = 100000},
        { coords = vec3(-571.7, -1063.2, 22.3), radius = 1.0, label = 'Moo Moo Cafe Table 3', slots = 10, weight = 100000},
        { coords = vec3(-574.31, -1049.61, 22.3), radius = 1.0, label = 'Moo Moo Cafe Table 4', slots = 10, weight = 100000},
        { coords = vec3(-583.85, -1049.67, 22.3), radius = 1.0, label = 'Moo Moo Cafe Table 5', slots = 10, weight = 100000},
        { coords = vec3(-583.89, -1056.16, 22.3), radius = 1.0, label = 'Moo Moo Cafe Table 6', slots = 10, weight = 100000},

    },
    prepare = { -- The restaurant prepare stations to prepare the ingredients
        --{ coords = vec3(-590.94, -1063.16, 21.36), radius = 1.0, label = 'Chopping', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(-591.33, -1069.97, 22.32), radius = 1.0, label = 'Oven', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@base', clip = 'base' } },
        -- { coords = vec3(-587.91, -1060.14, 22.34), radius = 1.0, label = 'Hob', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@base', clip = 'base' } },
        { coords = vec3(-592.13, -1059.62, 22.34), radius = 1.0, label = 'Drinks', type = 'drink', anim = { dict = 'mp_ped_interaction', clip = 'handshake_guy_a' } },
        { coords = vec3(-592.11, -1062.87, 22.26), radius = 1.0, label = 'Chopping', type = 'food', anim = { dict = 'anim@heists@prison_heiststation@cop_reactions', clip = 'cop_b_idle' } },
    },
    registers = { -- The restaurant registers to charge the customers
        { coords = vec3(-584.59, -1063.66, 22.33), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 70 },

    },
    menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
        { coords = vec3(-584.64, -1066.4, 22.33), radius = 1.0, label = 'Menu' },
    },
    offlineShop = { -- The restaurant shop to players be able to buy added items when restaurants offline
        --{ coords = vec4(-1199.667969, -1137.305298, 6.833269, 16.662355), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = { -- The restaurant music laptop/dj table (to use prop just add the prop and propHeading fields)
       -- { coords = vec3(-1201.0, -1137.0, 8.1), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = -20.0 },
    },
    garage = { -- The restaurant garage
    --     {
    --         coords = vec4(-594.62, -1086.59, 21.76, 220.09), -- Garage prop spawn coords
    --         spawnCoords = vec4(-593.19, -1084.99, 22.33, 311.96), -- Vehicle spawn coords
    --         vehicles = {
    --             { icon = 'fas fa-car', label = 'Panto', id = 'panto' },
    --             { icon = 'fas fa-car', label = 'Speedo Express', id = 'burrito3' },
    --         },
    --     },
    },
    delivery = { -- The restaurant location to start the delivery mission
        --{ coords = vec3(-152.4, -266.5, 43.65), radius = 1.0, prop = 'hei_prop_hei_bank_phone_01', propHeading = -20.0, priceLost = 10, comission = 10, cooldown = 10 },
    },
    drivethru = { -- The restaurant drive thru locations where players inside the restaurant will receive a notify, it'll give a sound and then at the location they can communicate via a private channel only for that locations
       -- { inCoords = vec3(1803.2, 4602.03, 37.33), inRadius = 2.0, outCoords = vec3(1807.88, 4602.63, 37.24), outRadius = 3.0, driveThruId = 123 },
    },
    peds = { -- The restaurant spawned peds
        --{ coords = vec4(142.49, -651.71, 27.74, 70.29), model = 'ig_djsoljakob', anim = { dict = 'anim@amb@nightclub@djs@dixon@', clip = 'dixn_dance_cntr_open_dix' } },
        --{ coords = vec4(127.07, -652.13, 28.01, 211.67), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
        --{ coords = vec4(131.29, -641.6, 28.01, 135.97), model = 's_f_y_stripperlite', anim = { dict = 'mini@strip_club@private_dance@part2', clip = 'priv_dance_p2' } },
    },
    chairs = { -- All the restaurant chairs (Can be used by all players)
       --Downstairs--
        --Booth1
        -- vec4(-573.04, -1058.81, 22.5, 180.75), --stand = vec3(-575.37, -1059.79, 22.34-0.5) },
        -- vec4(-573.92, -1058.82, 22.5, 180.75), --stand = vec3(-575.37, -1059.79, 22.34-0.5) },
        -- vec4(-573.06, -1060.7, 22.5, 0.75), --stand = vec3(-575.37, -1059.79, 22.34-0.5)},
        -- vec4(-573.91, -1060.72, 22.5, 0.75), --stand = vec3(-575.37, -1059.79, 22.34-0.5) },
        -- --Booth2
        -- vec4(-572.98, -1062.46, 22.5, 180.75), --stand = vec3(-575.34, -1063.39, 22.34-0.5) },
        -- vec4(-573.84, -1062.45, 22.5, 180.75), --stand = vec3(-575.34, -1063.39, 22.34-0.5) },
        -- vec4(-573.05, -1064.37, 22.5, 0.75), --stand = vec3(-575.34, -1063.39, 22.34-0.5) },
        -- vec4(-573.89, -1064.37, 22.5, 0.75), --stand = vec3(-575.34, -1063.39, 22.34-0.5) },
        -- --Booth3
        -- vec4(-573.0, -1066.11, 22.5, 180.75), --stand = vec3(-575.49, -1067.04, 22.34-0.5) },
        -- vec4(-573.9, -1066.1, 22.5, 180.75), --stand = vec3(-575.49, -1067.04, 22.34-0.5) },
        -- vec4(-573.07, -1068.03, 22.5, 0.75), --stand = vec3(-575.49, -1067.04, 22.34-0.5) },
        -- vec4(-573.87, -1068.01, 22.5, 0.75), --stand = vec3(-575.49, -1067.04, 22.34-0.5) },
        -- --Fireside
        -- vec4(-580.84, -1051.22, 22.35, 277.75),
        -- vec4(-579.78, -1052.51, 22.35, 329.75),
        -- vec4(-577.61, -1052.6, 22.35, 35.75),
        -- vec4(-576.86, -1051.03, 22.35, 108.75),
        -- --Center
        -- vec4(-579.72, -1062.12, 22.35, 0.75),
        -- vec4(-580.7, -1062.55, 22.35, 45.75),
        -- vec4(-581.02, -1063.46, 22.35, 90.75),
        -- vec4(-580.64, -1064.45, 22.35, 135.75),
        -- vec4(-579.71, -1064.79, 22.35, 180.75),
        -- vec4(-578.67, -1064.47, 22.35, 225.75),
        -- vec4(-578.33, -1063.39, 22.35, 270.75),
        -- vec4(-578.76, -1062.34, 22.35, 315.75),
        -- --Stools
        -- vec4(-586.18, -1064.68, 22.6, 90.75), --stand = vec3(-585.72, -1064.75, 22.34) },
        -- vec4(-586.17, -1065.69, 22.6, 90.75), --stand = vec3(-585.75, -1065.69, 22.34) },
        -- vec4(-586.15, -1066.68, 22.6, 90.75), --stand = vec3(-585.84, -1066.7, 22.34) },
        -- vec4(-586.17, -1067.69, 22.6, 90.75), --stand = vec3(-585.79, -1067.64, 22.34) },
        -- --Boss sofa
        -- vec4(-591.21, -1049.06, 22.35, 180.75),
        -- vec4(-589.95, -1049.06, 22.35, 180.75),
        -- --Boss Room1
        -- vec4(-598.44, -1050.99, 22.35, 270.0),
        -- vec4(-598.45, -1050.1, 22.35, 270.0),
        -- vec4(-596.26, -1053.52, 22.35, 0.0),
        -- --Upstairs
        -- --Sofa1
        -- vec4(-573.72, -1052.29, 26.61, 270.0),
        -- vec4(-573.73, -1053.45, 26.61, 270.0),
        -- --Corner Sofa
        -- vec4(-569.68, -1066.56, 26.62, 90.0),
        -- vec4(-569.7, -1068.13, 26.62, 90.0),
        -- vec4(-570.97, -1069.42, 26.62, 0),
        -- vec4(-572.61, -1069.4, 26.62, 0),
        -- --Boss Room 2
        -- vec4(-577.09, -1065.14, 26.61, 165.0),
        -- vec4(-578.82, -1065.24, 26.61, 200.0),
        -- vec4(-578.24, -1067.83, 26.61, 0),
        -- --Boss Room 3
        -- vec4(-577.0, -1062.6, 26.61, 0),
        -- vec4(-579.1, -1061.28, 26.61, 270.0),
        -- vec4(-577.39, -1057.87, 26.61, 180.0),
        -- vec4(-578.59, -1057.9, 26.61, 180.0),
    },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)
