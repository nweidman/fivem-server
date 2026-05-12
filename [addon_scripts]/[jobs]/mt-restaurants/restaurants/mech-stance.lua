-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'Stance House', -- The display name of the restaurant
    job = 'stance', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 3, -- Limit of ingredients per recipe
    maxRecipes = 14, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 0, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = false, coords = vec3(89.38, 19.71, 68.59), sprite = 106, color = 41, scale = 0.6, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(-3067.9321, 408.2550, 5.0),
            vec3(-3124.1304, 424.9576, -1.0),
            vec3(-3118.8079, 477.3326, -1.0),
            vec3(-3108.9385, 497.6642, -1.0),
            vec3(-3043.1431, 459.6999, 5.0),
        },
        thickness = 50,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(-3074.1353, 455.4923, 6.9732), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(-3079.3362, 423.8085, 6.9877), radius = 1.0, label = 'Storage', slots = 50, weight = 5000000 },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(-3082.8831, 425.5505, 7.2), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-3077.9658, 430.2129, 7.2), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-3074.8398, 436.4180, 7.2), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-3072.1274, 442.1645, 7.2), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    -- menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
    --     { coords = vec3(92.07, 11.08, 68.62), radius = 1.0, label = 'Menu' },
    -- },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)