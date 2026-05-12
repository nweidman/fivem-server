-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'East Side Motorworks', -- The display name of the restaurant
    job = 'esm', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 3, -- Limit of ingredients per recipe
    maxRecipes = 10, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 0, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = false, coords = vec3(89.38, 19.71, 68.59), sprite = 106, color = 41, scale = 0.6, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(1118.5238, -772.1069, 55.0),
            vec3(1163.5430, -771.6432, 55.0),
            vec3(1162.9490, -806.8177, 55.0),
            vec3(1118.5394, -806.5787, 55.0),
        },
        thickness = 50,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(1151.1859, -793.5416, 57.5509), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(1160.2148, -778.9662, 57.6240), radius = 1.0, label = 'Storage', slots = 50, weight = 5000000 },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(1159.9700, -784.7192, 57.4618), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1141.9039, -791.0539, 57.4618), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(1150.0558, -790.7407, 57.4618), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    -- menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
    --     { coords = vec3(92.07, 11.08, 68.62), radius = 1.0, label = 'Menu' },
    -- },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)