-- This config is just an example of how to create a restaurant.

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = { -- Auto-assigns restaurant ID based on job field
    enabled = true, -- If false this restaurant will not be enabled
    label = 'Bahama Mamas', -- The display name of the restaurant
    job = 'bahama', -- The job of the restaurant (will become the restaurant ID)
    ingredients = Config.ingredients.globalIngredients, -- The restaurants ingredients (Can be edited or created at ingredients.lua)
    maxIngredients = 6, -- Limit of ingredients per recipe
    maxRecipes = 30, -- Limit of recipes that the restaurant can have (false if don't want limit)
    maxRecipePrice = 1000, -- The max price that restaurant owners can make to a recipe
    blip = { enabled = true, coords = vec3(-1387.57, -591.88, 30.32), sprite = 121, color = 61, scale = 1.0, display = 4 }, -- The restaurant map blip
    zone = { -- The restaurant exterior zone
        points = {
                vec3(-1384.5277099609, -584.45465087891, 29.4),
				vec3(-1415.2163085938, -604.27465820312, 29.4),
				vec3(-1389.8627929688, -644.43115234375, 29.4),
				vec3(-1360.185546875, -628.23389404297, 29.4),
        },
        thickness = 15,
    },
    management = { -- The restaurant boss menus (needed to create recipes)
        { coords = vec3(-1370.19, -625.8, 30.36), radius = 1.0 },
    },
    stashes = { -- The restaurant stashes (blocked to the job)
        { coords = vec3(-1404.71, -600.12, 30.26), radius = 1.0, label = 'Storage', slots = 50, weight = 1000000 },
        { coords = vec3(-1399.96, -602.82, 30.25), radius = 1.0, label = 'Storage', slots = 50, weight = 1000000 },
    },
    trays = { -- The retaurant tray stashes (not blocked to any job)
        { coords = vec3(-1398.84, -601.0, 30.37), radius = 1.0, label = 'Tray', slots = 10, weight = 1000000 },
        { coords = vec3(-1402.22, -602.92, 30.37), radius = 1.0, label = 'Tray', slots = 10, weight = 1000000 },
        ---tables
        { coords = vec3(-1383.54, -628.78, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 1000000 },
        { coords = vec3(-1381.37, -627.41, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },	
        { coords = vec3(-1385.62, -630.15, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },	
        { coords = vec3(-1395.26, -628.09, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
		{ coords = vec3(-1395.88, -627.16, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },	
        { coords = vec3(-1397.21, -625.23, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },	
        { coords = vec3(-1398.07, -623.85, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },	
        { coords = vec3(-1399.18, -622.07, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
		{ coords = vec3(-1399.88, -620.71, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1410.27, -604.52, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1408.15, -603.11, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1406.21, -601.82, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
		{ coords = vec3(-1397.56, -596.07, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1395.74, -594.85, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1393.93, -593.61, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1387.54, -607.11, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
		{ coords = vec3(-1386.58, -608.62, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1381.61, -616.26, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
        { coords = vec3(-1380.64, -617.78, 30.32), radius = 1.0, label = 'Table', slots = 10, weight = 100000 },
    },
    prepare = { -- The restaurant prepare stations to prepare the ingredients
        --{ coords = vec3(-1199.9, -1140.4, 7.9), radius = 1.0, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = { -- The restaurant stations (Where you'll be able to prepare the made recipes)
        { coords = vec3(-1403.8, -598.65, 30.32), radius = 1.0, label = 'Oven', type = 'food', anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
--        { coords = vec3(-1403.47, -601.91, 30.32), radius = 1.0, label = 'Coffee Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-1399.71, -598.03, 30.29), radius = 1.0, label = 'Cocktails', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        -- { coords = vec3(-1399.93, -598.1, 30.32), radius = 1.0, label = 'Beer', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
    },
    registers = { -- The restaurant registers to charge the customers
        { coords = vec3(-1402.88, -602.62, 30.32), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 50 },
        { coords = vec3(-1383.87, -592.4, 30.32), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 50 },
        { coords = vec3(-1398.81, -600.07, 30.32), radius = 1.0, label = 'Register', playersRadius = 5.0, comission = 50 },
    },
    menus = { -- The restaurant menu locs where players can take the menus items (the label must be the same for all)
        { coords = vec3(-1402.88, -602.62, 30.32), radius = 1.0, label = 'Menu' },
        { coords = vec3(-1383.87, -592.4, 30.32), radius = 1.0, label = 'Menu' },
        { coords = vec3(-1398.81, -600.07, 30.32), radius = 1.0, label = 'Menu' },
    },
    offlineShop = { -- The restaurant shop to players be able to buy added items when restaurants offline
      --  { coords = vec4(-1199.667969, -1137.305298, 6.833269, 16.662355), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    music = { -- The restaurant music laptop/dj table (to use prop just add the prop and propHeading fields)
       -- { coords = vec3(-1201.0, -1137.0, 8.1), radius = 1.0, maxMusicRadius = 50.0, maxMusicVolume = 50, prop = 'sf_prop_sf_laptop_01a', propHeading = -20.0 },
    },
    garage = { -- The restaurant garage
        -- {
        --     coords = vec4(-1188.096802, -1117.598877, 4.705121, 294.55+180), -- Garage prop spawn coords
        --     spawnCoords = vec4(-1183.451050, -1116.402954, 5.700829, 194.160385), -- Vehicle spawn coords
        --     vehicles = {
        --         { icon = 'fas fa-car', label = 'Panto', id = 'panto' },
        --         { icon = 'fas fa-car', label = 'Speedo Express', id = 'nspeedo' },
        --     },
        -- },
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
        -- Backroom --
			vec4(-1384.49, -634.52, 30.16, 325.17), --stand = vec3(-1383.97, -633.95, 30.32)}
			vec4(-1382.48, -633.25, 30.16, 258.27), --stand = vec3(-1381.8, -633.44, 30.33)}
			vec4(-1380.65, -631.97, 30.16, 56.5), --stand = vec3(-1379.96, -632.56, 30.32)}
			vec4(-1378.63, -630.59, 30.16, 29.0), --stand = vec3(-1378.26, -631.3, 30.32)}
		-- Bossroom
			vec4(-1369.79, -626.71, 29.86, 30.0), --stand = vec3(-1370.44, -626.89, 30.36)}
			vec4(-1375.03, -625.21, 29.86, 308.24), --stand = vec3(-1374.54, -624.94, 30.33)}
			vec4(-1375.51, -624.44, 29.86, 308.24), --stand = vec3(-1375.06, -624.11, 30.32)}
		-- Center stools
			vec4(-1381.93, -623.84, 30.16, 77.32), --stand = vec3(-1381.4, -623.94, 30.32)}
			vec4(-1382.18, -620.01, 30.16, 119.37), --stand = vec3(-1381.67, -619.71, 30.32)}
			vec4(-1384.10, -616.75, 30.16, 133.07), --stand = vec3(-1383.66, -616.49, 30.32)}
		-- Center Stools
			vec4(-1388.2, -610.53, 30.16, 130.0), --stand = vec3(-1387.68, -610.26, 30.32)}
			vec4(-1390.35, -607.44, 30.16, 137.0), --stand = vec3(-1389.96, -607.0, 30.32)}
			vec4(-1393.85, -605.82, 30.16, 180.0), --stand = vec3(-1393.84, -605.28, 30.32)}
		-- Center Stools Right
			vec4(-1399.66, -609.6, 30.16, 260.0), --stand = vec3(-1400.13, -609.48, 30.32)}
			vec4(-1399.67, -613.46, 30.16, 292.0), --stand = vec3(-1400.11, -613.66, 30.32)}
			vec4(-1397.72, -616.75, 30.16, 309.0), --stand = vec3(-1398.02, -617.07, 30.32)}
		-- Center Stools Right
			vec4(-1393.68, -622.95, 30.16, 305.34), --stand = vec3(-1394.12, -623.27, 30.32)}
			vec4(-1391.51, -626.09, 30.16, 315.45), --stand = vec3(-1391.81, -626.52, 30.32)}
			vec4(-1388.09, -627.87, 30.16, 356.33), --stand = vec3(-1388.09, -628.4, 30.32)}
		-- Stip stools 1
			vec4(-1388.97, -623.16, 29.5, 326.44), --stand = vec3(-1389.27, -623.55, 29.72)}
			vec4(-1389.86, -621.69, 29.5, 286.04), --stand = vec3(-1390.44, -621.83, 29.72)}
			vec4(-1387.46, -623.54, 29.5, 21.50), --stand = vec3(-1387.27, -624.07, 29.72)}
			vec4(-1386.14, -622.54, 29.5, 57.54), --stand = vec3(-1385.58, -622.75, 29.72)}
			vec4(-1385.79, -621.14, 29.5, 112.21), --stand = vec3(-1385.16, -620.89, 29.72)}
			vec4(-1386.72, -619.66, 29.5, 142.69), --stand = vec3(-1386.38, -619.22, 29.72)}
			vec4(-1388.23, -619.34, 29.5, 192.57), --stand = vec3(-1388.38, -618.74, 29.72)}
			vec4(-1389.64, -620.24, 29.5, 235.0), --stand = vec3(-1390.11, -619.79, 29.72)}
		-- Strip Stools 2
			vec4(-1391.97, -618.45, 29.5, 327.55), --stand = vec3(-1392.32, -618.88, 29.72)}
			vec4(-1390.49, -618.85, 29.5, 29.72), --stand = vec3(-1390.5, -619.37, 29.72)}
			vec4(-1389.05, -617.94, 29.5, 61.09), --stand = vec3(-1388.65, -618.24, 29.72)}
			vec4(-1388.72, -616.55, 29.5, 97.52), --stand = vec3(-1388.16, -616.47, 29.72)}
			vec4(-1389.66, -615.07, 29.5, 146.0), --stand = vec3(-1389.41, -614.66, 29.72)}
			vec4(-1391.2,  -614.84,	29.5, 194.05), --stand = vec3(-1391.32, -614.34, 29.72)}
			vec4(-1392.57, -615.65, 29.5, 236.87), --stand = vec3(-1392.83, -615.33, 29.72)}
			vec4(-1392.93, -617.13, 29.5, 271.71), --stand = vec3(-1393.38, -617.08, 29.72)}
		-- Strip Stools 3
			vec4(-1394.77, -614.02, 29.5, 337.0), --stand = vec3(-1395.1, -614.51, 29.72)}
			vec4(-1393.57, -614.28, 29.5, 5.29), --stand = vec3(-1393.53, -614.89, 29.72)}
			vec4(-1392.03, -613.18, 29.5, 73.0), --stand = vec3(-1391.6, -613.39, 29.72)}
			vec4(-1391.76, -611.81, 29.5, 112.56), --stand = vec3(-1391.24, -611.65, 29.72)}
			vec4(-1392.87, -610.54, 29.5, 148.18), --stand = vec3(-1392.47, -610.23, 29.72)}
			vec4(-1393.89, -610.22, 29.5, 181.06), --stand = vec3(-1393.92, -609.8, 29.72)}
			vec4(-1395.46, -611.15, 29.5, 228.41), --stand = vec3(-1395.77, -610.66, 29.72)}
			vec4(-1395.81, -612.57, 29.5, 277.31), --stand = vec3(-1396.25, -612.64, 29.72)}
		-- Outer Chairs
			vec4(-1384.98, -617.69, 29.25, 124.67), --stand = vec3(-1385.53, -618.0, 29.72)}
			vec4(-1384.17, -618.98, 29.25, 117.79), --stand = vec3(-1384.68, -619.22, 29.72)}
			vec4(-1391.45, -623.73, 29.25, 306.0), --stand = vec3(-1391.31, -623.64, 29.37)}
			vec4(-1392.41, -622.34, 29.25, 300.72), --stand = vec3(-1392.35, -622.31, 29.28)}
			vec4(-1396.56, -615.81, 29.25, 307.59), --stand = vec3(-1396.1, -615.48, 29.72)}
			vec4(-1397.33, -614.75, 29.25, 301.55), --stand = vec3(-1396.55, -614.21, 29.72)}
			vec4(-1390.03, -610.09, 29.25, 122.87), --stand = vec3(-1390.52, -610.37, 29.73)}
			vec4(-1389.28, -611.09, 29.25, 123.92), --stand = vec3(-1389.76, -611.39, 29.72)}
		-- Bar chairs

		-- Outer Outer Chairs
			vec4(-1399.5, -596.15, 29.80, 289.32), --stand = vec3(-1398.97, -595.99, 30.32)}
			vec4(-1398.88, -595.17, 29.80, 221.73), --stand = vec3(-1398.52, -595.61, 30.33)}
			vec4(-1397.81, -594.46, 29.80, 212.84), --stand = vec3(-1397.52, -594.95, 30.32)}
			vec4(-1396.58, -593.67, 29.80, 209.17), --stand = vec3(-1396.32, -594.17, 30.33)}
			vec4(-1395.1, -592.72, 29.80, 214.02), --stand = vec3(-1394.8, -593.2, 30.33)}
			vec4(-1394.2, -592.13, 29.80, 212.38), --stand = vec3(-1393.92, -592.61, 30.32)}
			vec4(-1392.79, -592.22, 29.80, 126.09), --stand = vec3(-1393.26, -592.53, 30.32)}
			vec4(-1382.14, -614.88, 29.80, 213.83), --stand = vec3(-1381.85, -615.36, 30.32)}
			vec4(-1388.02, -605.66, 29.80, 216.46), --stand = vec3(-1387.71, -606.12, 30.32)}
			vec4(-1386.53, -606.33, 29.80, 120.06), --stand = vec3(-1387.03, -606.59, 30.33)}
			vec4(-1385.54, -607.89, 29.80, 124.0), --stand = vec3(-1386.02, -608.19, 30.32)}
			vec4(-1385.35, -609.52, 29.80, 33.07), --stand = vec3(-1385.63, -609.04, 30.33)}
			vec4(-1380.51, -615.5, 29.80, 123.21), --stand = vec3(-1380.99, -615.78, 30.33)}
			vec4(-1379.64, -616.96, 29.80, 127.92), --stand = vec3(-1380.1, -617.29, 30.32)}
			vec4(-1379.26, -617.83, 29.80, 108.66), --stand = vec3(-1379.76, -617.98, 30.33)}
			vec4(-1379.83, -626.97, 29.80, 121.32), --stand = vec3(-1380.33, -627.25, 30.32)}
			vec4(-1380.59, -628.45, 29.80, 37.14), --stand = vec3(-1380.92, -627.98, 30.32)}
			vec4(-1382.39, -629.62, 29.80, 33.79), --stand = vec3(-1382.69, -629.14, 30.32)}
			vec4(-1383.28, -630.19, 29.80, 35.59), --stand = vec3(-1383.59, -629.72, 30.32)}
			vec4(-1384.36, -630.89, 29.80, 32.96), --stand = vec3(-1385.6, -631.02, 30.32)}
			vec4(-1385.33, -631.52, 29.80, 31.19), --stand = vec3(-1385.6, -631.02, 30.32)}
			vec4(-1386.72, -631.44, 29.80, 307.1), --stand = vec3(-1386.26, -631.12, 30.33)}
			vec4(-1387.77, -633.73, 29.80, 31.23), --stand = vec3(-1388.18, -633.30, 30.32)}
			vec4(-1388.74, -634.35, 29.80, 33.68), --stand = vec3(-1389.03, -633.87, 30.32)}
			vec4(-1390.04, -635.27, 29.80, 44.85), --stand = vec3(-1390.32, -634.75, 30.32)}
			vec4(-1391.96, -635.66, 29.80, 350.43), --stand = vec3(-1391.85, -635.11, 30.33)}
			vec4(-1393.6, -634.71, 29.80, 312.02), --stand = vec3(-1393.17, -634.35, 30.33)}
			vec4(-1394.45, -633.4, 29.80, 299.26), --stand = vec3(-1393.95, -633.15, 30.32)}
			vec4(-1395.1, -632.28, 29.80, 307.31), --stand = vec3(-1394.64, -631.96, 30.32)}
			vec4(-1394.81, -629.71, 29.80, 42.21), --stand = vec3(-1395.17, -629.27, 30.32)}
			-- vec4(-1394.9, -629.69, 29.80, 33.58), --stand = vec3(-1395.19, -629.21, 30.34)}
			vec4(-1396.16, -629.22, 29.80, 305.63), --stand = vec3(-1395.69, -628.92, 30.33)}
			vec4(-1396.79, -628.25, 29.80, 303.71), --stand = vec3(-1396.31, -627.95, 30.33)}
			vec4(-1397.26, -627.52, 29.80, 302.02), --stand = vec3(-1396.78, -627.24, 30.32)}
			vec4(-1397.91, -626.52, 29.80, 300.6), --stand = vec3(-1397.42, -626.25, 30.32)}
			vec4(-1398.39, -625.8, 29.80, 306.94), --stand = vec3(-1397.93, -625.48, 30.32)}
			vec4(-1399.03, -624.81, 29.80, 306.47), --stand = vec3(-1398.56, -624.49, 30.33)}
			vec4(-1400.0, -623.22, 29.80, 303.58), --stand = vec3(-1399.52, -622.93, 30.32)}
			vec4(-1401.16, -621.43, 29.80, 301.69), --stand = vec3(-1400.67, -621.16, 30.32)}
			vec4(-1400.64, -619.57, 29.80, 213.41), --stand = vec3(-1400.35, -620.06, 30.32)}
			vec4(-1411.97, -604.98, 29.80, 303.02), --stand = vec3(-1411.49, -604.7, 30.33)}
			vec4(-1411.31, -603.65, 29.80, 213.42), --stand = vec3(-1411.02, -604.13, 30.33)}
			vec4(-1410.65, -603.22, 29.80, 210.17), --stand = vec3(-1410.42, -603.65, 30.25)}
			vec4(-1409.36, -602.41, 29.80, 210.86), --stand = vec3(-1409.09, -602.91, 30.32)}
			vec4(-1408.33, -601.71, 29.80, 213.42), --stand = vec3(-1408.03, -602.19, 30.32)}
			vec4(-1407.24, -601.01, 29.80, 210.18), --stand = vec3(-1406.98, -601.51, 30.33)}
			vec4(-1406.34, -600.44, 29.80, 198.88), --stand = vec3(-1406.18, -600.98, 30.32)}

			-- Stripper Booths
			vec4(-1402.81, -619.04, 30.15, 303.84), --stand = vec3(-1402.33, -618.74, 30.68)}
			vec4(-1403.35, -618.18, 30.15, 306.43), --stand = vec3(-1402.88, -617.86, 30.69)}
			vec4(-1405.47, -615.61, 30.15, 309.3), --stand = vec3(-1405.02, -615.27, 31.14)}
			vec4(-1405.18, -615.37, 30.15, 304.39), --stand = vec3(-1404.7, -615.07, 30.69)}
			vec4(-1406.94, -612.65, 30.15, 306.13), --stand = vec3(-1406.94, -612.65, 30.18)}
			vec4(-1406.24, -613.63, 30.15, 305.94), --stand = vec3(-1405.78, -613.32, 30.68)}
			vec4(-1408.62, -610.06, 30.15, 312.61), --stand = vec3(-1408.25, -609.83, 30.68)}
			vec4(-1407.99, -610.98, 30.15, 302.92), --stand = vec3(-1407.51, -610.69, 30.68)}
			-- Stripper Bar
			vec4(-1404.48, -602.76, 30.15, 303.84), --stand = vec3(-1404.81, -603.16, 30.32)}
			vec4(-1402.63, -604.28, 30.15, 336.29), --stand = vec3(-1402.76, -604.82, 30.32)}
			vec4(-1400.27, -604.37, 30.15, 8.63), --stand = vec3(-1400.14, -604.88, 30.32)}
			vec4(-1398.29, -603.07, 30.15, 45.77), --stand = vec3(-1397.73, -603.33, 30.32)}
			vec4(-1397.45, -600.85, 30.15, 82.91), --stand = vec3(-1396.91, -600.81, 30.32)}
			vec4(-1397.94, -598.7, 30.15, 117.81), --stand = vec3(-1397.42, -598.4, 30.32)}

    },
}

-- Add this restaurant to the configuration
AddRestaurant(restaurantConfig)