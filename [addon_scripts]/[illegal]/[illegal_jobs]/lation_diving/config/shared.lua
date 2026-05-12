return {

    -- ⚠️ WARNING: When you are working with this script, never do "restart lation_diving"
    -- ⚠️ This will cause issues, data loss & more! You must restart the script like this:
    -- ⚠️ "stop lation_diving" ..wait a couple seconds.. then "ensure lation_diving"

    ----------------------------------------------
    --        🛠️ Setup the basics below
    ----------------------------------------------

    setup = {
        -- Use only if needed, directed by support or know what you're doing
        -- Notice: enabling debug features will significantly increase resmon
        -- And should always be disabled in production
        debug = false,
        -- Set your interaction system below
        -- Available options are: 'ox_target', 'qb-target', 'interact' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        -- We also provide support for various textUI: ox_lib, jg-textui, okokTextUI & qbcore
        -- Go to client/functions.lua line 3 to choose which textUI to use
        interact = 'ox_target',
        -- Set your notification system below
        -- Available options are: 'ox_lib', 'esx', 'qb', 'okok', 'sd-notify', 'wasabi_notify' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        notify = 'ox_lib',
        -- Set your progress bar system below
        -- Available options are: 'ox_lib', 'qbcore' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        -- Any custom progress bar must also support animations
        progress = 'ox_lib',
        -- Do you want to be notified via server console if an update is available?
        -- True if yes, false if no
        version = true,
        -- You have the option to set a job requirement to Scuba Dive if you wish
        -- Just change the false below to your job name, e.g. job = 'job_name'
        job = false,
        -- When a player is diving, they can see their current depth underwater.
        -- Do you want to show this depth in meters or feet?
        -- If meteres, set metric to true. If feet, set metric to false.
        metric = false,
        -- ⚠️ WARNING: Do not alter the number below unless directed by support
        -- ⚠️ And/or understand what you are doing - "SetPedMaxTimeUnderWater" value
        max = 1800.0
    },

    ----------------------------------------------
    --       📍 Activity start settings
    ----------------------------------------------

    start = {
        -- Where to spawn the main ped to start diving
        -- If you wish to disable the starting ped, set coords = false
        coords = vec4(-1304.07, -1369.13, 4.51, 112.92),
        -- The ped model used
        -- More models: https://docs.fivem.net/docs/game-references/ped-models/
        model = 's_m_y_shop_mask',
        -- The scenario assigned to the ped (or scenario = false for no scenario)
        -- More scenarios: https://github.com/DioneB/gtav-scenarios
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        -- You can limit the hours at which the ped is available here
        -- By default, this ped is available 24/7
        -- Min is the earliest the ped is available (in 24hr format)
        -- Max is the latest the ped is available (in 24hr format)
        -- For example, if you want the ped only available during daytime set min = 6 & max = 21
        hours = { min = 0, max = 24 },
        -- When a group owner selects "Start Diving", this is how long it takes
        -- (in seconds) to receive an assigned location on the map.
        cooldown = { min = 3, max = 5 }
    },

    ----------------------------------------------
    --       📈 Customize the XP system
    ----------------------------------------------

    experience = {
        -- The number in these [brackets] are the level
        -- The number after = is the exp required to reach that level
        -- Be sure levels *always* start at level 1 with 0 exp
        [1] = 0,
        [2] = 500,
        [3] = 1250,
        [4] = 2250,
        [5] = 5000,
        -- You can add or remove levels as you wish
    },

    ----------------------------------------------
    --       🤿 Setup your Scuba Gear
    ----------------------------------------------

    gear = {
        -- Customize the various Scuba Gear tanks available
        tanks = {
            -- The number in [brackets] is the level required to use this tank
            -- item: is the actual scuba tank item spawn name
            -- degrade: is how much the tank degrades every 10 seconds underwater
            -- Level 1 lasts roughly a total of 5 minutes underwater before needing a refill
            -- [1] = { item = 'ls_scuba_gear_1', degrade = 3.34 },
            -- Level 2 lasts roughly a total of 10 minutes underwater before needing a refill
            -- [2] = { item = 'ls_scuba_gear_2', degrade = 1.67 },
            -- Level 3 lasts roughly a total of 15 minutes underwater before needing a refill
            -- [3] = { item = 'ls_scuba_gear_3', degrade = 1.11 },
            -- Level 4 lasts roughly a total of 20 minutes underwater before needing a refill
            -- [4] = { item = 'ls_scuba_gear_4', degrade = 0.84 },
            -- Level 5 lasts roughly a total of 25 minutes underwater before needing a refill
            [1] = { item = 'diving_gear', degrade = 0.84 },
            -- The formula to get degradation value based on total time is:
            -- 100 ÷ (Total time in seconds desired ÷ 10) = degrade
        },
        -- The item spawn name for oxygen refill tanks
        refill = 'diving_fill',
        -- The mask is an object, object spawn name:
        mask = 'p_d_scuba_mask_s',
        -- The tank is an object, object spawn name:
        tank = 'p_s_scuba_tank_s',
        -- Optional clothing to be worn when scuba diving
        -- Don't want to change clothes? Set all drawableId's to 0!
        -- ⚠️ Do not alter componentId
        clothes = {
            mask = {
                -- The compononent id you want to set
                componentId = 1,
                -- The drawableId and textureId for males
                male = { drawableId = 0, textureId = 0 },
                -- The drawableId and textureId for females
                female = { drawableId = 0, textureId = 0 }
            },
            upperBody = { --hands
                componentId = 3,
                male = { drawableId = 38, textureId = 0 },
                female = { drawableId = 40, textureId = 0 }
            },
            lowerBody = { --pants
                componentId = 4,
                male = { drawableId = 94, textureId = 24 },
                female = { drawableId = 97, textureId = 24 }
            },
            bags = {
                componentId = 5,
                male = { drawableId = 0, textureId = 0 },
                female = { drawableId = 0, textureId = 0 }
            },
            shoes = {
                componentId = 6,
                male = { drawableId = 67, textureId = 24 },
                female = { drawableId = 70, textureId = 24 }
            },
            shirt = {
                componentId = 8,
                male = { drawableId = 15, textureId = 0 },
                female = { drawableId = 14, textureId = 0 }
            },
            bodyArmor = {
                componentId = 9,
                male = { drawableId = 0, textureId = 0 },
                female = { drawableId = 0, textureId = 0 }
            },
            decals = {
                componentId = 10,
                male = { drawableId = 0, textureId = 0 },
                female = { drawableId = 0, textureId = 0 }
            },
            jackets = {
                componentId = 11,
                male = { drawableId = 243, textureId = 24 },
                female = { drawableId = 262, textureId = 19 }
            }
        }
    },

    ----------------------------------------------
    --          🛒 Setup your shops
    ----------------------------------------------

    shop = {
        -- Do you want to enable the Scuba Gear shop?
        -- This shop is added to the main diving menu
        enable = false,
        -- The account that will be used for purchases
        -- Available options are: 'cash' or 'bank'
        account = 'cash',
        -- The shop items available for purchase
        items = {
            -- item: item spawn name
            -- price: price of item
            -- icon: icon for item
            -- level: optional player level requirement to purchase item
            -- metadata: optional durability level assigned at purchase
            -- metadata: ⚠️ remove this option if selling non-metadata items
            [1] = { item = 'ls_oxygen_tank', price = 100, icon = 'fas fa-repeat', metadata = 100 },
            [2] = { item = 'ls_scuba_gear_1', price = 250, icon = 'fas fa-lungs', level = 1, metadata = 100 },
            [3] = { item = 'ls_scuba_gear_2', price = 500, icon = 'fas fa-lungs', level = 2, metadata = 100 },
            [4] = { item = 'ls_scuba_gear_3', price = 1000, icon = 'fas fa-lungs', level = 3, metadata = 100 },
            [5] = { item = 'ls_scuba_gear_4', price = 2000, icon = 'fas fa-lungs', level = 4, metadata = 100 },
            [6] = { item = 'ls_scuba_gear_5', price = 5000, icon = 'fas fa-lungs', level = 5, metadata = 100 },
            [7] = { item = 'burger', price = 5, icon = 'fas fa-burger' },
            [8] = { item = 'water', price = 5, icon = 'fas fa-glass-water' },
            -- You can add or remove items as you wish
        }
    },

    ----------------------------------------------
    --       🛥️ Customize boat rentals
    ----------------------------------------------

    rental = {
        -- Do you want to offer boat rentals?
        enable = false,
        -- The account that will be used for rentals
        -- Available options are: 'cash' or 'bank'
        account = 'cash',
        -- Do you want to require payment for boat rentals?
        -- If not, set deposit = 0
        deposit = 500,
        -- Do you want to refund some money when the boat is returned?
        -- If not, set returnDeposit = 0
        returnDeposit = 250,
        -- The script will spawn a random boat from the list below
        -- If you only want one boat, leave just one in the list
        models = { 'dinghy' },
        -- When a boat is rented, do you want to teleport the player into it?
        teleport = false,
        -- Where to spawn the rental boat?
        coords = vec4(-291.7570, -2766.1208, 0.6787, 267.4251),
        -- Do you want to add a boat anchor option?
        anchor = false,
    },

    ----------------------------------------------
    --       ⛏️ Build the diving zones
    ----------------------------------------------

    zones = {
        [1] = {
            -- The center location of this zone
            location = vector3(3565.66, 2104.54, -23.92),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(3599.27, 2139.48, -53.61),
                vector3(3551.32, 2188.21, -29.26),
                vector3(3501.3, 2057.38, -23.82),
                vector3(3531.69, 2022.61, -47.21),
                vector3(3624.9, 2026.18, -54.84),
                vector3(3651.59, 2087.01, -59.9),
                vector3(3669.91, 2103.09, -49.69),
                vector3(3658.93, 2157.19, -38.01),
                vector3(3617.98, 2153.66, -50.39),
                vector3(3644.79, 2112.86, -68.11),
                vector3(3551.96, 2062.47, -44.17),
                vector3(3530.45, 2063.77, -42.94),
                vector3(3609.79, 2000.8, -76.77),
                vector3(3693.44, 2085.92, -37.29),
                vector3(3558.87, 2155.66, -45.95),
                vector3(3536.48, 2146.17, -35.22),
                vector3(3505.33, 2193.32, -28.56),
                vector3(3471.76, 2165.4, -19.08),
                vector3(3451.08, 2080.52, -22.74),
                vector3(3446.87, 2154.31, -28.08),
                vector3(3426.35, 2051.99, -21.33),
                vector3(3482.1, 2118.46, -31.73),
                vector3(3621.89, 2178.36, -48.73),
                vector3(3603.29, 2214.33, -24.46),
                vector3(3544.96, 2224.33, -29.73),
                vector3(3535.13, 2106.98, -44.17),
                vector3(3571.39, 2065.99, -44.88)
                -- Add or remove spawns from this zone
            }
        },
        [2] = {
            -- The center location of this zone
            location = vector3(3946.35, 3001.86, -17.53),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(3951.97, 2998.38, -40.55),
                vector3(3882.78, 3033.51, -21.54),
                vector3(3869.69, 3041.77, -13.23),
                vector3(3901.6, 3054.36, -24.33),
                vector3(3943.48, 3046.17, -24.5),
                vector3(3988.32, 3033.04, -20.14),
                vector3(4036.19, 3026.1, -44.1),
                vector3(4029.22, 3004.1, -45.45),
                vector3(4029.04, 2974.01, -43.04),
                vector3(4020.28, 2961.23, -40.74),
                vector3(3994.32, 2968.87, -42.29),
                vector3(3965.68, 2938.45, -8.65),
                vector3(3916.12, 2954.46, -14.01),
                vector3(3874.76, 2947.73, -15.16),
                vector3(3849.54, 2934.83, -14.5),
                vector3(3835.12, 2997.15, -13.99),
                vector3(3864.07, 3071.99, -13.03),
                vector3(3918.09, 3021.64, -35.14),
                vector3(3976.01, 3118.26, -23.11),
                vector3(3944.07, 3105.23, -23.23),
                vector3(3897.73, 3093.87, -22.93)
                -- Add or remove spawns from this zone
            }
        },
        [3] = {
            -- The center location of this zone
            location = vector3(4169.59, 4061.4, -14.88),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(4181.53, 4064.07, -27.53),
                vector3(4234.54, 4108.67, -29.97),
                vector3(4253.25, 4071.58, -29.98),
                vector3(4223.71, 4050.27, -27.63),
                vector3(4190.64, 3997.97, -23.4),
                vector3(4153.86, 4010.44, -25.57),
                vector3(4128.09, 4006.91, -23.21),
                vector3(4066.54, 4035.94, -12.84),
                vector3(4081.03, 4067.77, -21.08),
                vector3(4140.21, 4162.72, -5.9),
                vector3(4158.76, 4109.01, -19.87),
                vector3(4216.22, 4080.41, -28.02),
                vector3(4270.15, 4096.35, -29.77),
                vector3(4295.39, 4066.53, -37.38),
                vector3(4280.35, 4023.04, -42.07),
                vector3(4243.96, 4017.07, -34.63),
                vector3(4131.16, 3956.31, -37.92),
                vector3(4115.21, 3982.52, -23.92),
                vector3(4078.77, 3969.28, -25.06),
                vector3(4048.23, 3996.46, -22.45),
                vector3(4043.67, 4026.33, -21.99),
                vector3(4076.55, 4124.02, -16.13)
                -- Add or remove spawns from this zone
            }
        },
        [4] = {
            -- The center location of this zone
            location = vector3(1915.12, -3070.68, -19.19),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(1922.75, -3092.61, -52.07),
                vector3(1886.49, -3128.1, -51.38),
                vector3(1836.75, -3073.92, -37.55),
                vector3(1844.96, -3113.92, -58.31),
                vector3(1934.82, -3092.9, -59.17),
                vector3(1877.77, -3030.24, -49.81),
                vector3(1842.59, -3047.15, -37.28),
                vector3(1863.16, -3020.62, -51.65),
                vector3(1856.57, -2984.59, -52.33),
                vector3(1912.3, -2983.61, -41.22),
                vector3(1975.54, -3008.69, -34.91),
                vector3(1999.06, -3048.27, -33.84),
                vector3(1988.64, -3126.55, -62.01),
                vector3(1961.32, -3116.43, -62.9),
                vector3(1951.66, -3086.36, -58.7),
                vector3(1915.33, -3194.03, -67.19),
                vector3(1964.68, -3191.94, -68.68),
                vector3(1905.58, -3156.77, -50.16),
                vector3(1861.43, -3137.05, -54.92),
                vector3(1898.39, -3144.96, -49.36),
                vector3(1959.38, -3134.96, -63.59),
                -- Add or remove spawns from this zone
            }
        },
        [5] = {
            -- The center location of this zone
            location = vector3(1895.75, -3049.46, -24.73),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(1895.75, -3049.46, -47.98),
                vector3(1917.75, -3025.94, -43.04),
                vector3(1959.49, -3052.53, -34.9),
                vector3(1907.2, -3073.58, -49.42),
                vector3(1895.93, -3110.03, -51.61),
                vector3(1870.26, -3063.29, -52.66),
                vector3(1862.36, -3019.03, -51.5),
                vector3(1984.05, -3112.95, -58.47),
                vector3(1961.37, -3135.34, -63.09),
                vector3(1905.57, -3155.93, -50.03),
                vector3(1827.23, -3081.13, -40.88),
                vector3(1792.43, -3058.73, -45.5),
                vector3(1827.77, -3016.84, -39.98),
                vector3(1846.38, -2979.11, -53.0),
                vector3(1825.1, -2956.92, -40.98),
                vector3(1883.74, -2962.54, -44.9),
                vector3(1922.15, -2993.14, -39.23),
                vector3(1945.71, -3018.36, -34.32),
                vector3(1977.84, -2983.59, -35.85),
                vector3(1930.63, -2964.32, -36.17),
                vector3(1934.67, -3080.44, -55.51),
                vector3(1915.76, -3069.36, -39.13),
                vector3(2019.43, -3058.43, -33.1),
                -- Add or remove spawns from this zone
            }
        },
        [6] = {
            -- The center location of this zone
            location = vector3(-3002.25, -248.5, -14.21),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(-3002.25, -248.5, -30.96),
                vector3(-3003.38, -224.48, -29.03),
                vector3(-2982.38, -241.25, -30.71),
                vector3(-2959.43, -230.82, -30.46),
                vector3(-3004.69, -197.37, -19.3),
                vector3(-3047.64, -206.41, -25.99),
                vector3(-3032.21, -238.45, -31.9),
                vector3(-3016.91, -273.69, -32.68),
                vector3(-2981.44, -317.91, -35.19),
                vector3(-2962.11, -321.46, -32.7),
                vector3(-2955.98, -270.25, -33.97),
                vector3(-3112.02, -307.6, -40.55),
                vector3(-3058.88, -355.68, -30.02),
                vector3(-3031.68, -373.72, -26.1),
                vector3(-3018.67, -342.98, -31.76),
                vector3(-2962.64, -295.89, -31.45),
                vector3(-3009.75, -296.96, -35.51),
                vector3(-3023.51, -253.08, -30.61),
                vector3(-2980.47, -225.28, -29.04),
                vector3(-2943.86, -223.36, -30.21),
                vector3(-2925.72, -240.59, -24.37),
                vector3(-2875.12, -260.92, -23.89),
                vector3(-2887.74, -295.07, -28.36),
                vector3(-2899.54, -338.37, -49.66),
                vector3(-2961.89, -342.28, -35.31),
                vector3(-3027.27, -339.6, -21.26),
                vector3(-3104.6, -269.13, -26.0),
                vector3(-3099.72, -216.9, -22.27),
                vector3(-3071.42, -255.72, -32.0),
                vector3(-3061.82, -302.49, -31.05),
                vector3(-3014.67, -326.45, -33.85),
                vector3(-2990.94, -310.33, -29.69),

                -- Add or remove spawns from this zone
            }
        },
        [7] = {
            -- The center location of this zone
            location = vector3(-3366.43, 20.84, -18.68),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(-3366.43, 20.84, -21.18),
                vector3(-3354.26, 12.6, -20.64),
                vector3(-3334.36, 4.9, -17.45),
                vector3(-3319.89, 23.25, -16.35),
                vector3(-3325.64, 64.69, -20.3),
                vector3(-3333.39, 86.96, -21.21),
                vector3(-3377.57, 99.0, -36.44),
                vector3(-3393.56, 88.81, -40.24),
                vector3(-3412.32, 61.48, -42.57),
                vector3(-3423.33, 29.21, -36.39),
                vector3(-3382.27, -2.73, -30.75),
                vector3(-3347.25, 12.67, -18.25),
                vector3(-3398.3, 113.79, -36.77),
                vector3(-3436.65, 91.28, -36.5),
                vector3(-3257.79, 33.81, -10.42),
                vector3(-3268.52, -14.21, -16.31),
                vector3(-3270.62, -48.04, -22.57),
                vector3(-3295.6, -67.69, -26.51),
                vector3(-3322.94, -85.16, -33.17),
                vector3(-3371.79, -114.2, -41.94),
                vector3(-3413.3, -58.51, -45.96),
                vector3(-3489.62, -28.85, -42.05),
                vector3(-3470.84, 7.55, -40.86),
                vector3(-3441.28, 27.88, -37.89),
                vector3(-3423.17, 56.22, -44.56),
                vector3(-3467.01, 97.94, -52.31),
                vector3(-3472.72, 52.99, -63.34),
                vector3(-3379.99, 64.14, -34.13),
                vector3(-3359.91, 67.52, -19.86),
                vector3(-3316.07, 109.84, -21.95),
                vector3(-3360.05, 112.5, -28.54),
                vector3(-3416.42, 99.61, -42.05),
                vector3(-3447.45, -1.38, -37.38),

                -- Add or remove spawns from this zone
            }
        },
        [8] = {
            -- The center location of this zone
            location = vector3(-3440.47, 494.91, -19.08),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(-3440.47, 494.91, -34.08),
                vector3(-3424.13, 469.61, -31.9),
                vector3(-3407.82, 500.99, -30.27),
                vector3(-3396.01, 523.18, -27.03),
                vector3(-3458.71, 410.88, -27.45),
                vector3(-3519.95, 470.58, -34.03),
                vector3(-3530.06, 507.62, -50.21),
                vector3(-3500.95, 525.85, -47.26),
                vector3(-3370.27, 531.15, -27.04),
                vector3(-3359.21, 487.32, -25.34),
                vector3(-3384.92, 452.59, -30.02),
                vector3(-3417.46, 401.46, -27.38),
                vector3(-3524.29, 417.36, -38.88),
                vector3(-3525.53, 394.00, -37.59),
                vector3(-3506.05, 425.08, -27.13),
                vector3(-3369.27, 619.68, -14.51),
                vector3(-3392.42, 631.06, -12.3),
                vector3(-3419.13, 597.41, -37.48),
                vector3(-3431.9, 536.99, -32.13),
                vector3(-3523.54, 546.43, -56.21),
                vector3(-3506.21, 577.58, -46.36),
                vector3(-3569.58, 523.83, -58.18),
                vector3(-3531.76, 507.81, -50.05),
                vector3(-3485.39, 514.76, -29.7),
                vector3(-3448.3, 467.52, -34.3),
                vector3(-3439.19, 381.78, -37.6),
                vector3(-3361.12, 407.57, -18.1),
                vector3(-3391.86, 435.59, -24.02),
                vector3(-3425.97, 520.39, -28.51),
                vector3(-3386.37, 496.82, -24.9),
                vector3(-3364.27, 506.68, -25.24),
                vector3(-3383.45, 533.82, -27.82),
                vector3(-3433.54, 380.52, -36.65),


                -- Add or remove spawns from this zone
            }
        },
        [9] = {
            -- The center location of this zone
            location = vector3(-3336.12, 1833.11, -22.72),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
              
                vector3(-3336.12, 1833.11, -26.47),
                vector3(-3303.66, 1882.83, -28.41),
                vector3(-3291.93, 1902.9, -21.75),
                vector3(-3347.2, 1926.59, -41.74),
                vector3(-3357.86, 1885.41, -40.09),
                vector3(-3360.76, 1860.72, -38.38),
                vector3(-3365.56, 1845.53, -40.33),
                vector3(-3358.54, 1831.26, -37.1),
                vector3(-3340.97, 1804.54, -32.92),
                vector3(-3360.31, 1775.09, -33.87),
                vector3(-3405.63, 1781.14, -37.34),
                vector3(-3435.12, 1835.23, -35.45),
                vector3(-3454.93, 1801.27, -31.83),
                vector3(-3406.91, 1778.82, -37.54),
                vector3(-3431.44, 1800.61, -35.15),
                vector3(-3248.09, 1865.26, -14.0),
                vector3(-3237.66, 1893.26, -8.27),
                vector3(-3271.19, 1876.4, -21.05),
                vector3(-3225.76, 1829.36, -3.58),
                vector3(-3245.92, 1791.71, -2.37),
                vector3(-3286.45, 1769.16, -22.46),
                vector3(-3299.79, 1741.19, -24.1),
                vector3(-3315.84, 1728.13, -26.62),
                vector3(-3255.81, 1772.8, -4.12),
                vector3(-3241.59, 1790.11, -2.38),
                vector3(-3234.88, 1846.21, -9.9),
                vector3(-3249.65, 1874.71, -13.29),
                vector3(-3294.13, 1905.48, -22.15),
                vector3(-3371.14, 1939.6, -43.6),
                vector3(-3382.11, 1911.2, -53.43),
                vector3(-3373.9, 1866.1, -27.55),
                vector3(-3385.34, 1785.57, -39.03),
                vector3(-3392.58, 1761.39, -37.29),
                vector3(-3423.72, 1747.01, -34.45),
                vector3(-3460.02, 1768.49, -29.45),
                vector3(-3454.66, 1833.08, -34.03),
                vector3(-3430.37, 1856.66, -35.39),
                vector3(-3434.87, 1903.3, -42.57)

                -- Add or remove spawns from this zone
            }
        },
        [10] = {
            -- The center location of this zone
            location = vector3(-3365.59, 3190.08, -17.93),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(-3365.59, 3190.08, -30.18),
                vector3(-3380.1, 3176.06, -30.82),
                vector3(-3344.35, 3199.82, -30.48),
                vector3(-3346.32, 3226.48, -29.19),
                vector3(-3388.67, 3222.09, -38.01),
                vector3(-3395.44, 3199.83, -32.12),
                vector3(-3391.74, 3163.25, -31.18),
                vector3(-3393.03, 3140.88, -31.83),
                vector3(-3359.12, 3149.89, -30.63),
                vector3(-3335.21, 3167.75, -31.25),
                vector3(-3330.81, 3185.72, -29.41),
                vector3(-3346.09, 3224.33, -29.17),
                vector3(-3388.05, 3224.48, -37.91),
                vector3(-3424.94, 3224.17, -41.19),
                vector3(-3432.07, 3188.33, -38.22),
                vector3(-3371.6, 3203.51, -31.03),
                vector3(-3360.78, 3160.94, -20.06),
                vector3(-3326.25, 3162.22, -30.13),
                vector3(-3362.16, 3139.28, -32.47),
                vector3(-3386.48, 3125.82, -31.09),
                vector3(-3366.2, 3104.91, -33.62),
                vector3(-3343.37, 3112.18, -35.09),
                vector3(-3318.25, 3120.54, -36.09),
                vector3(-3322.11, 3149.43, -31.47),
                vector3(-3299.26, 3189.94, -21.42),
                vector3(-3312.97, 3175.44, -19.9),
                vector3(-3269.69, 3197.75, -18.8),
                vector3(-3267.08, 3236.75, -12.09),
                vector3(-3307.94, 3252.56, -24.96),
                vector3(-3317.84, 3273.55, -25.42),
                vector3(-3335.0, 3251.57, -32.87),
                vector3(-3363.08, 3244.44, -43.5),
                vector3(-3390.56, 3270.41, -42.61),
                vector3(-3418.92, 3247.78, -41.24),
                vector3(-3458.79, 3221.02, -42.26),
                vector3(-3484.84, 3207.31, -45.1),
                vector3(-3473.37, 3184.11, -47.73),
                vector3(-3485.58, 3172.45, -47.05),
                vector3(-3422.63, 3163.12, -36.87)

                -- Add or remove spawns from this zone
            }
        },
        [11] = {
            -- The center location of this zone
            location = vector3(-942.42, 6547.06, -3.99),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
            -- The radius of this zone
            radius = 150.0,
            -- How many crates can be spawned in this zone?
            crates = { min = 5, max = 12 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vector3(-942.42, 6547.06, -5.99),
                vector3(-931.14, 6526.23, -5.39),
                vector3(-912.83, 6545.48, -9.19),
                vector3(-896.72, 6528.44, -15.55),
                vector3(-925.01, 6491.16, -21.38),
                vector3(-951.8, 6509.5, -33.29),
                vector3(-976.17, 6499.98, -35.85),
                vector3(-946.09, 6526.95, -34.67),
                vector3(-944.22, 6554.38, -34.48),
                vector3(-931.43, 6572.63, -31.8),
                vector3(-929.72, 6595.31, -29.77),
                vector3(-988.19, 6583.3, -26.33),
                vector3(-992.15, 6565.1, -25.27),
                vector3(-968.49, 6561.52, -6.13),
                vector3(-951.09, 6557.96, -9.52),
                vector3(-934.69, 6545.31, -6.13),
                vector3(-986.04, 6528.71, -36.22),
                vector3(-1008.45, 6531.56, -20.52),
                vector3(-1005.57, 6567.04, -6.72),
                vector3(-991.82, 6598.64, -26.0),
                vector3(-944.24, 6661.4, -24.7),
                vector3(-976.17, 6650.98, -31.26),
                vector3(-967.7, 6626.54, -26.02),
                vector3(-951.26, 6613.55, -29.0),
                vector3(-904.5, 6602.39, -33.71),
                vector3(-881.16, 6612.18, -33.23),
                vector3(-836.78, 6632.64, -25.28),
                vector3(-852.63, 6645.47, -23.47),
                vector3(-854.72, 6575.58, -30.12),
                vector3(-832.22, 6554.02, -20.34),
                vector3(-835.26, 6523.82, -6.36),
                vector3(-848.46, 6503.12, -4.02),
                vector3(-874.41, 6515.17, -20.39),
                vector3(-864.77, 6541.09, -30.88),
                vector3(-998.62, 6487.39, -33.91),
                vector3(-966.69, 6448.74, -23.06),
                vector3(-934.01, 6451.68, -26.05),
                vector3(-921.75, 6466.37, -19.12),
                vector3(-905.91, 6447.0, -20.2),
                vector3(-1010.09, 6474.17, -31.91),
                vector3(-1022.68, 6485.69, -21.49),
                vector3(-1033.61, 6513.26, -29.31),
                vector3(-1028.87, 6540.65, -28.67)
                -- Add or remove spawns from this zone
            }
        },


        -- DEFAULT LOCATIONS
        -- [1] = {
        --     -- The center location of this zone
        --     location = vec3(1086.9691, -3575.9382, -50.1214),
        --     -- Models selected at random for each crate spawned here
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     -- The radius of this zone
        --     radius = 150.0,
        --     -- How many crates can be spawned in this zone?
        --     crates = { min = 5, max = 12 },
        --     -- How much XP is rewarded for crates found in this zone?
        --     xp = { min = 1, max = 5 },
        --     -- The exact coords the crates will spawn inside this zone
        --     coords = {
        --         vec3(1094.7655, -3577.4995, -52.5339),
        --         vec3(1086.7635, -3537.7588, -43.1057),
        --         vec3(1106.2019, -3583.6062, -17.5417),
        --         vec3(1091.3970, -3618.1091, -44.4066),
        --         vec3(974.6331, -3567.4514, -47.2678),
        --         vec3(1161.8893, -3630.9204, -22.7693),
        --         vec3(1066.5341, -3559.0664, -20.8264),
        --         vec3(1138.0339, -3581.6411, -39.0230),
        --         vec3(1203.7281, -3524.0046, -33.9104),
        --         vec3(1191.8622, -3531.3965, -24.0956),
        --         vec3(1066.8358, -3485.3047, -32.4555),
        --         vec3(1034.0037, -3651.6384, -49.3254),
        --         vec3(1108.3530, -3662.9187, -41.3706),
        --         vec3(1180.6683, -3558.5405, -38.9220),
        --         vec3(1035.1763, -3586.1721, -45.7417),
        --         -- Add or remove spawns from this zone
        --     }
        -- },
        -- [2] = {
        --     location = vec3(3085.2043, -1853.3246, -14.3668),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 12 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(3085.2043, -1853.3246, -16.0565),
        --         vec3(3029.1843, -1820.8015, -24.6999),
        --         vec3(2993.0427, -1818.4943, -34.2077),
        --         vec3(2997.8711, -1753.7402, -11.0640),
        --         vec3(2982.0010, -1912.0287, -28.9325),
        --         vec3(3051.9775, -1926.9736, -54.6551),
        --         vec3(3011.4712, -1866.9753, -48.1732),
        --         vec3(3056.2656, -1761.5493, -43.3554),
        --         vec3(2950.1038, -1839.1633, -35.2352),
        --         vec3(3019.7561, -1913.2930, -32.4005),
        --         vec3(3061.5286, -1866.6348, -35.7668),
        --         vec3(3040.8525, -1879.8348, -57.6607),
        --         vec3(2974.8582, -1785.8473, -13.5562),
        --     }
        -- },
        -- [3] = {
        --     location = vec3(1818.7792, -2984.2068, -41.2811),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 12 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(1815.4813, -2981.9314, -42.1416),
        --         vec3(1820.6042, -2943.6421, -39.3650),
        --         vec3(1738.9772, -2948.8298, -23.5561),
        --         vec3(1732.7568, -3042.6794, -58.3799),
        --         vec3(1902.0460, -3026.5271, -45.4950),
        --         vec3(1760.1697, -2977.9131, -47.1564),
        --         vec3(1760.2402, -3093.1196, -66.6896),
        --         vec3(1820.7825, -3068.2268, -39.7288),
        --         vec3(1929.2610, -2969.8464, -36.5976),
        --         vec3(1777.1892, -2915.6821, -30.6168),
        --         vec3(1709.7538, -2952.2861, -24.4798),
        --         vec3(1849.2987, -2965.3936, -52.7471),
        --         vec3(1891.3480, -2918.0266, -22.7276),
        --     }
        -- },
        -- [4] = {
        --     location = vec3(3150.8074, -973.6499, -26.9572),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 12 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(3150.8074, -973.6499, -26.9572),
        --         vec3(3132.8245, -1026.0867, -42.3399),
        --         vec3(3085.2126, -970.5078, -17.9598),
        --         vec3(3088.5186, -859.4744, -36.9759),
        --         vec3(3129.6709, -944.6890, -39.5992),
        --         vec3(3191.7087, -984.1827, -21.3900),
        --         vec3(3112.4922, -1061.3378, -47.8674),
        --         vec3(3089.1252, -1030.5328, -43.6450),
        --         vec3(3050.0190, -946.1809, -23.7141),
        --         vec3(3184.7986, -870.0077, -65.7725),
        --         vec3(3125.7749, -890.1265, -43.6622),
        --         vec3(3075.5540, -898.0163, -22.6175),
        --     }
        -- },
        -- [5] = {
        --     location = vec3(2383.6611, -2451.3289, -32.9255),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 10 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(2383.6611, -2451.3289, -32.9255),
        --         vec3(2437.7466, -2411.5706, -32.8800),
        --         vec3(2385.5486, -2347.8923, -16.6751),
        --         vec3(2313.7725, -2344.6472, -8.4371),
        --         vec3(2270.5879, -2393.7388, -26.9309),
        --         vec3(2299.5146, -2433.6165, -19.7982),
        --         vec3(2301.1694, -2404.3206, -25.4087),
        --         vec3(2393.1316, -2410.4976, -32.1512),
        --         vec3(2353.0732, -2517.1201, -29.7120),
        --         vec3(2442.2646, -2456.6064, -7.9306),

        --     }
        -- },
        -- [6] = {
        --     location = vec3(280.3442, -3492.5969, -29.2227),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 10 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(280.3442, -3492.5969, -29.2227),
        --         vec3(361.8796, -3468.6265, -26.7427),
        --         vec3(313.8169, -3376.5999, -24.5615),
        --         vec3(214.2739, -3467.3735, -14.0912),
        --         vec3(230.4904, -3558.5493, -50.8256),
        --         vec3(229.1392, -3405.6541, -19.9491),
        --         vec3(263.5007, -3446.9626, -25.7515),
        --         vec3(332.7290, -3455.4980, -28.1874),
        --         vec3(260.9624, -3362.8247, -18.8871),
        --         vec3(183.2011, -3419.6165, -18.7913),
        --     }
        -- },
        -- [7] = {
        --     location = vec3(-2080.0508, -876.7839, -38.1838),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 12 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(-2080.0508, -876.7839, -38.1838),
        --         vec3(-2013.5044, -984.5208, -15.5007),
        --         vec3(-2169.8203, -962.9402, -70.6583),
        --         vec3(-2081.6479, -939.0807, -40.9644),
        --         vec3(-2142.8997, -880.9988, -38.1233),
        --         vec3(-2051.6763, -874.8913, -4.9137),
        --         vec3(-2060.8647, -843.3949, -24.2824),
        --         vec3(-2101.0276, -856.7371, -32.4969),
        --         vec3(-2187.1812, -831.8537, -36.8464),
        --         vec3(-2090.7273, -1001.5419, -43.5531),
        --         vec3(-2000.4624, -917.0707, -14.9745),
        --         vec3(-2035.0875, -833.5734, -14.8460),
        --         vec3(-2041.9478, -818.1243, -5.5512),
        --         vec3(-2161.8516, -776.5375, -22.6451),
        --         vec3(-2142.2932, -839.6798, -32.2059),
        --         vec3(-2049.0518, -920.3878, -32.7276),
        --     }
        -- },
        -- [8] = {
        --     location = vec3(-2837.9504, -494.8672, -45.7883),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 12 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(-2837.9504, -494.8672, -45.7883),
        --         vec3(-2789.4587, -623.3177, -47.6618),
        --         vec3(-2854.2878, -578.2092, -75.3579),
        --         vec3(-2836.2771, -528.2178, -66.3296),
        --         vec3(-2814.6587, -561.5555, -71.3785),
        --         vec3(-2749.4819, -543.8317, -46.9659),
        --         vec3(-2749.5925, -462.8193, -37.6869),
        --         vec3(-2833.0474, -462.1175, -18.8996),
        --         vec3(-2921.6694, -434.5992, -37.3384),
        --         vec3(-2819.7563, -591.3509, -58.2769),
        --         vec3(-2760.0801, -581.4194, -47.1628),
        --         vec3(-2808.8740, -409.1779, -38.3897),
        --         vec3(-2847.6389, -380.1435, -40.4797),
        --         vec3(-2881.4072, -439.8226, -38.2622),
        --         vec3(-2785.4697, -524.0317, -54.6307),
        --     }
        -- },
        -- [9] = {
        --     location = vec3(-3550.5359, 646.9001, -66.3281),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 10 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(-3550.5359, 646.9001, -66.3281),
        --         vec3(-3562.6257, 622.5925, -31.0750),
        --         vec3(-3514.4497, 629.0671, -31.9019),
        --         vec3(-3464.5229, 618.9487, -39.9314),
        --         vec3(-3468.6663, 546.3879, -46.4398),
        --         vec3(-3532.4519, 540.3656, -55.3767),
        --         vec3(-3576.2854, 742.5957, -47.0631),
        --         vec3(-3530.5144, 767.2094, -36.7547),
        --         vec3(-3489.9067, 699.1218, -50.1850),
        --         vec3(-3503.2341, 591.9188, -46.4599),
        --         vec3(-3589.1309, 596.7454, -61.6465),
        --         vec3(-3594.2913, 689.3352, -64.4904),
        --     }
        -- },
        -- [10] = {
        --     location = vec3(-3416.8613, 1701.7200, -61.6626),
        --     models = { 'xm3_prop_xm3_crate_supp_01a', 'sm_prop_smug_crate_s_bones', 'sm_prop_smug_crate_s_tobacco' },
        --     radius = 150.0,
        --     crates = { min = 5, max = 10 },
        --     xp = { min = 1, max = 5 },
        --     coords = {
        --         vec3(-3416.8613, 1701.7200, -61.6626),
        --         vec3(-3417.9424, 1653.9034, -42.2417),
        --         vec3(-3410.1980, 1589.5227, -42.9441),
        --         vec3(-3303.7632, 1705.6891, -23.4423),
        --         vec3(-3494.1262, 1706.0807, -65.6907),
        --         vec3(-3465.9348, 1698.5503, -45.7951),
        --         vec3(-3372.7073, 1669.8127, -45.0799),
        --         vec3(-3331.2153, 1686.3544, -42.6237),
        --         vec3(-3406.0732, 1780.2509, -37.4121),
        --         vec3(-3450.4163, 1663.0955, -40.5404),
        --         vec3(-3336.1089, 1611.4885, -40.8837),
        --     }
        -- }
    },

    ----------------------------------------------
    --       📦 Customize your crates
    ----------------------------------------------

    crates = {
        -- The item spawn name for the crate
        item = 'ls_diving_crate',
        -- The quantity of crates given to the player when picked up
        quantity = { min = 1, max = 1 },
        -- The loot table when opening crates
        -- ⚠️ The way this loot table works is pretty unique - please read :)
        -- ⚠️ Each number in [brackets] is the level required to get a chance at that loot
        -- ⚠️ Each item is rolled individually, so you can get multiple items from one crate
        -- ⚠️ If you are level 1 in Diving, you only get a chance at items from section [1]
        -- ⚠️ If you are level 3 in Diving, you get a chance at items from sections [1] to [3]
        -- ⚠️ This gives you the ability to scale rewards based on the players diving experience
        -- ⚠️ This section is intended to be built by YOU for your specific server and item(s)
        -- ⚠️ We only provide a base loot table to help get you started with some filler items
        loot = {
            [1] = {
                -- These item(s) are only rolled for players level 1 and above
                -- item: spawn name | quantity = min/max | chance = 1-100 | metadata (optional): {key = value}
                { item = 'metalscrap', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'iron', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'copper', quantity = { min = 1, max = 2 }, chance = 25 },
                { item = 'aluminum', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'steel', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'plastic', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'rubber', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'explosive', quantity = { min = 1, max = 1 }, chance = 20 },
                { item = 'lockpick', quantity = { min = 1, max = 1 }, chance = 5 },
                { item = 'advancedlockpick', quantity = { min = 1, max = 1 }, chance = 3 },
                -- { item = 'aluminumoxide', quantity = { min = 1, max = 2 }, chance = 20 },
                -- { item = 'ironoxide', quantity = { min = 1, max = 2 }, chance = 20 },
                { item = 'goldchain', quantity = { min = 1, max = 2 }, chance = 25 },
                { item = 'cryptostick', quantity = { min = 1, max = 2 }, chance = 20 },
                { item = 'goldbar', quantity = { min = 1, max = 1 }, chance = 10 },
                { item = 'rolex', quantity = { min = 1, max = 2 }, chance = 25 },
                { item = 'bagofcoke', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'ifaks', quantity = { min = 1, max = 1 }, chance = 20 },
                { item = 'tenkgoldchain', quantity = { min = 1, max = 2 }, chance = 15 },
                { item = 'diamond', quantity = { min = 1, max = 2 }, chance = 10 },
                { item = 'diamond_ring', quantity = { min = 1, max = 2 }, chance = 20 },
                { item = 'diamond_necklace', quantity = { min = 1, max = 2 }, chance = 20 },
                -- Add or remove items as you wish
            },
            [2] = {
                -- These item(s) are only rolled for players level 2 and above
                { item = 'pistolparts', quantity = { min = 1, max = 3 }, chance = 10 },
                { item = 'kevlar', quantity = { min = 1, max = 2 }, chance = 15 },
                { item = 'afaks', quantity = { min = 1, max = 1 }, chance = 5 },
                { item = 'WEAPON_VINTAGEPISTOL', quantity = { min = 1, max = 1 }, chance = 1 },
            },
            [3] = {
                -- These item(s) are only rolled for players level 3 and above
                { item = 'dynamite', quantity = { min = 1, max = 1 }, chance = 3 },
                { item = 'yhc', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'shotgunbody', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'shotgunbarrel', quantity = { min = 1, max = 1 }, chance = 1 },
            },
            [4] = {
                -- These item(s) are only rolled for players level 4 and above
                { item = 'c4', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'smgbody', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'smgbarrel', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'smggrip', quantity = { min = 1, max = 1 }, chance = 1 },
            },
            [5] = {
                -- These item(s) are only rolled for players level 5 and above
                { item = 'riflemagazine', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'riflebody', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'riflebarrel', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'riflegrip', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'riflestock', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'cashexchangekey', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'mazecard', quantity = { min = 1, max = 1 }, chance = 1 },
                { item = 'heistmysterybox', quantity = { min = 1, max = 1 }, chance = 1 },
            }
        }
    }

}