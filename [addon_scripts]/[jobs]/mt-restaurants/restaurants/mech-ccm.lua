-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'Cruisin Craftsmen Mechanic', -- The display name of the restaurant
    job = 'ccm', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 3, -- Limit of ingredients per recipe
    maxRecipes = 10, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 0, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = false, coords = vec3(89.38, 19.71, 68.59), sprite = 106, color = 41, scale = 0.6, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(-296.9324, -1252.8022, 27.0),
            vec3(-297.2417, -1409.1326, 27.0),
            vec3(-356.9585, -1409.8054, 27.0),
            vec3(-363.8979, -1378.5925, 27.0),
            vec3(-363.6304, -1314.2076, 27.0),
            vec3(-357.3976, -1295.0498, 27.0),
            vec3(-357.0944, -1251.1742, 27.0),
        },
        thickness = 50,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(-349.4616, -1335.2365, 36.2904), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(-336.6463, -1367.8942, 31.6025), radius = 1.0, label = 'Storage', slots = 50, weight = 5000000 },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(-328.4564, -1367.6219, 31.3912), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-343.2327, -1367.6675, 31.3912), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-351.5079, -1367.8306, 31.3912), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-362.4461, -1357.5438, 32.0517), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-336.3821, -1257.8363, 31.5975), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    -- menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
    --     { coords = vec3(92.07, 11.08, 68.62), radius = 1.0, label = 'Menu' },
    -- },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)