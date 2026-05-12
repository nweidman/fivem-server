-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'LS Customs', -- The display name of the restaurant
    job = 'lscustoms', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 5, -- Limit of ingredients per recipe
    maxRecipes = 10, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 0, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = false, coords = vec3(89.38, 19.71, 68.59), sprite = 106, color = 41, scale = 0.6, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
            vec3(-309.2379, -167.2444, 35.0),
            vec3(-301.5760, -133.5233, 35.0),
            vec3(-310.6345, -95.7016, 35.0),
            vec3(-401.8960, -67.5229, 35.0),
            vec3(-416.5572, -83.2397, 35.0),
            vec3(-360.4996, -182.7350, 35.0),
        },
        thickness = 50,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(-348.0001, -131.0730, 42.0368), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(-336.7144, -131.3662, 39.13), radius = 1.0, label = 'Storage', slots = 50, weight = 5000000 },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(-320.5992, -119.8565, 39.0071), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-317.2733, -139.1361, 39.5197), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-321.4802, -150.2868, 39.5563), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-324.3290, -164.4359, 39.5100), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
        { coords = vec3(-336.0250, -128.8091, 39.5000), radius = 1.0, label = 'Mechanic Crafting', type = 'item', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    -- menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
    --     { coords = vec3(92.07, 11.08, 68.62), radius = 1.0, label = 'Menu' },
    -- },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)