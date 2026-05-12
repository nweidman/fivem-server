-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'Seaton Sands', -- The display name of the restaurant
    job = 'ss', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 5, -- Limit of ingredients per recipe
    maxRecipes = 10, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 0, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = false, coords = vec3(89.38, 19.71, 68.59), sprite = 106, color = 41, scale = 0.6, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(1718.0830, 3656.7490, 32.0),
            vec3(1774.8008, 3689.6377, 32.0),
            vec3(1744.1572, 3742.4927, 32.0),
            vec3(1687.5275, 3709.7214, 32.0),
        },
        thickness = 50,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(1694.1672, 3704.1318, 38.9397), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(1701.4922, 3690.5203, 34.7153), radius = 1.0, label = 'Storage', slots = 50, weight = 5000000 },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(1704.9918, 3682.5503, 34.5), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1703.0945, 3685.2493, 34.5), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1701.5203, 3687.9209, 34.5), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1698.6952, 3692.7576, 34.5), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1692.6344, 3703.4565, 34.5), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    -- menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
    --     { coords = vec3(92.07, 11.08, 68.62), radius = 1.0, label = 'Menu' },
    -- },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)