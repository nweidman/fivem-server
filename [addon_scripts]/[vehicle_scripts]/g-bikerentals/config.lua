Config = {}

Config.Label = "Bike Rental"        -- Label for locations on map

Config.WalkUpRentalMenu = false     -- True == Walk up to display to open rental menu, False == Must manually press key at display to open rental menu

--[[
    For each Config.RentalLocations[x]:
    - label: Name of the location
        - Not currently in use, more so for knowing which location we're looking at in the
          config without having to go to the coordinates in game
    - rental_coords: The coordinates of the interactable bike rental display
        - Change to vector4, add w coordinate, and uncomment the SetEntityHeading() calls in
          client/main.lua if you want to configure the direction bike displays are facing
    - spawn_coords: The coordinates a player spawns at on bike when they rent a bike
    - default_veh: The default bike model displayed to players
    - chosen_veh: The current bike model displayed to players
        - Dynamic, changes for everyone when the player changes the bike display
    - active: If the location is active
        - Set to false to disable rentals at this location (location and display will not appear on map or to players at all)
]]
Config.RentalLocations = {
    [1] = {
        label = "Paleto",
        rental_coords = vector3(-92.8876, 6327.8721, 30.4902), spawn_coords = vector4(-90.2905, 6325.8545, 31.4902, 216.3774),
        default_veh = 'bmx', chosen_veh = 'bmx',
        active = true
    },
    [2] = {
        label = "Sandy",
        rental_coords = vector3(1647.2667, 3785.1006, 33.9797), spawn_coords = vector4(1641.2921, 3782.3442, 34.9100, 245.6125),
        default_veh = 'bmx', chosen_veh = 'bmx',
        active = true
    },
    [3] = {
        label = "Bay City",
        rental_coords = vector3(-1492.4745, -664.7011, 27.9435), spawn_coords = vector4(-1488.1881, -668.0699, 28.9434, 222.9363),
        default_veh = 'bmx', chosen_veh = 'bmx',
        active = true
    },
    [4] = {
        label = "Elgin",
        rental_coords = vector3(66.4661, -1007.7438, 28.3574), spawn_coords = vector4(68.4007, -1004.1672, 29.3574, 70.9432),
        default_veh = 'bmx', chosen_veh = 'bmx',
        active = true
    },
    [5] = {
        label = "Stawberry",
        rental_coords = vector3(189.9631, -1084.4373, 28.2885), spawn_coords = vector4(194.5358, -1081.5762, 29.2941, 7.5474),
        default_veh = 'bmx', chosen_veh = 'bmx',
        active = true
    },
    [6] = {
        label = "Prison",
        rental_coords = vector3(1854.2166, 2593.3772, 44.6723), spawn_coords = vector4(1855.0996, 2599.3188, 45.6726, 5.2025),
        default_veh = 'bmx', chosen_veh = 'bmx',
        active = true
    },
    -- [7] = {
    --     label = "Trucking",
    --     rental_coords = vector3(-630.5490, 5724.1274, 35.4028), spawn_coords = vector4(-626.4276, 5722.5566, 36.4028, 251.6218),
    --     default_veh = 'bmx', chosen_veh = 'bmx',
    --     active = true
    -- },
    -- [8] = {
    --     label = "Trucking",
    --     rental_coords = vector3(2729.0852, 3417.5791, 55.6997), spawn_coords = vector4(2734.1130, 3415.6399, 56.6998, 249.1044),
    --     default_veh = 'bmx', chosen_veh = 'bmx',
    --     active = true
    -- },    
    [9] = {
       label = "Sandy EMS",
       rental_coords = vector3(1784.8114, 3632.0117, 33.5446), spawn_coords = vector4(1780.9087, 3629.2029, 34.5899, 144.2239),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [10] = {
       label = "Paleto EMS",
       rental_coords = vector3(-230.3311, 6318.0015, 30.4761), spawn_coords = vector4(-233.6150, 6314.9932, 31.4779, 243.7659),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [11] = {
       label = "Pillbox",
       rental_coords = vector3(292.3867, -560.6430, 42.2659), spawn_coords = vector4(290.3166, -560.0079, 43.2527, 66.5323),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [12] = {
       label = "CityHall",
       rental_coords = vector3(-237.3177, -984.2192, 28.2883), spawn_coords = vector4(-240.6429, -988.9274, 29.2880, 257.0341),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [13] = {
       label = "Opium Nights Hotel",
       rental_coords = vector3(-742.3279, -2295.5078, 12.0445), spawn_coords = vector4(-739.6229, -2301.6052, 13.0361, 213.9505),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [14] = {
       label = "Elgin",
       rental_coords = vector3(-79.2667, 138.8901, 80.4951), spawn_coords = vector4(-84.0481, 147.1760, 81.4555, 83.3200),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [15] = {
       label = "Tinsel Towers",
       rental_coords = vector3(-618.6223, 6.6855, 40.7784), spawn_coords = vector4(-624.1394, 6.9062, 41.4646, 125.4424),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    [16] = {
       label = "Weazel Plaza Apartments",
       rental_coords = vector3(-930.7090, -448.6124, 37.5264), spawn_coords = vector4(-935.0128, -447.1248, 37.5751, 100.5684),
       default_veh = 'bmx', chosen_veh = 'bmx',
       active = true
    },
    --[14] = {
    --    label = "Raton Canyon Trails",
    --    rental_coords = vector3(-1491.81, 4979.68, 62.38), spawn_coords = vector4(-1494.91, 4976.02, 63.53, 179.65),
    --    default_veh = 'tribike3', chosen_veh = 'tribike3',
    --    active = true
    --},
    --[15] = {
    --    label = "Mount Chiliad",
    --    rental_coords = vector3(509.83, 5530.33, 775.82), spawn_coords = vector4(496.07, 5532.88, 778.36, 130.45),
    --    default_veh = 'bmx', chosen_veh = 'bmx',
    --    active = true
    --},
    --[16] = {
    --    label = "Braddock Farm",
    --    rental_coords = vector3(2501.2, 5114.1, 45.28), spawn_coords = vector4(2507.3, 5116.1, 46.4, 281.74),
    --    default_veh = 'cruiser', chosen_veh = 'cruiser',
    --    active = true
    --},
    --[17] = {
    --    label = "Chumash",
    --    rental_coords = vector3(-3127.9, 1121.12, 19.66), spawn_coords = vector4(-3126.75, 1125.24, 20.66, 353.7),
    --    default_veh = 'fixter', chosen_veh = 'fixter',
    --    active = true
    --},
    --[18] = {
    --    label = "Kortz Center",
    --    rental_coords = vector3(-2318.9, 452.0, 173.6), spawn_coords = vector4(-2319.65, 446.04, 174.6, 174.28),
    --    default_veh = 'scorcher', chosen_veh = 'scorcher',
    --    active = true
    --},
    --[19] = {
    --    label = "Tataviam Mountains",
    --    rental_coords = vector3(1211.96, -278.55, 68.08), spawn_coords = vector4(1208.26, -274.81, 69.08, 35.14),
    --    default_veh = 'tribike', chosen_veh = 'tribike',
    --    active = true
    --},
    --[20] = {
    --    label = "Galileo Observatory",
    --    rental_coords = vector3(-421.05, 1221.16, 324.77), spawn_coords = vector4(-419.43, 1225.35, 325.76, 339.56),
    --    default_veh = 'tribike2', chosen_veh = 'tribike2',
    --    active = true
    --},
}

--[[
    For each Config.Bikes[x]:
    - model: The bike model
    - label: The name of the bike as is displayed to the player
    - rental_cost: The cost to rent this bike
    - available: If the bike is available for rent
        - Set to false to remove this bike from available rentals
]]
Config.Bikes = {
    [1] = { model = "bmx", label = "BMX", rental_cost = 50, available = true },
    [2] = { model = "cruiser", label = "Cruiser", rental_cost = 50, available = true },
    [3] = { model = "fixter", label = "Fixter", rental_cost = 50, available = true },
    [4] = { model = "scorcher", label = "Scorcher", rental_cost = 50, available = true },
    [5] = { model = "tribike", label = "Tribike", rental_cost = 50, available = true },
    [6] = { model = "tribike2", label = "Tribike 2", rental_cost = 50, available = true },
    [7] = { model = "tribike3", label = "Tribike 3", rental_cost = 50, available = true },
}