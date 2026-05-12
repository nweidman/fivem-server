Config = {}

Config.Interval = 30 -- minutes interval between adding XP
Config.IntervalXP = 10 -- how much XP added per interval
Config.Skillmenu = "skills" -- skillmenu command
Config.DefaultKey = "F11" -- default key to open skillmenu
Config.DoubleXP = false -- Whether or not to double all XP earned
Config.DebugPoly = false -- Show polyzones

Config.ResetSkillsPrice = 50000

Config.Gym = {
    entrance_fee = 3000, -- How much will it cost to use the gym
    entrance_coords = { -- Where to buy access to be able to use the gym equipment | Blip Info: https://docs.fivem.net/docs/game-references/blips/
        -- [1] = {coords = vector3(-485.3101, 270.4557, 83.3163), heading =  265.0005, create_blip = true, blip_title = "Vinewood Gym", blip_color = 0, blip_icon = 311, blip_scale = 0.7},
        [1] = {coords = vector3(-1208.59, -1574.19, 4.60), heading = 304.96, create_blip = true, blip_title = "Muscles Sands Gym", blip_color = 0, blip_icon = 311, blip_scale = 0.7},
        [2] = {coords = vector3(-170.4618, -1743.1294, 32.6829), heading = 317.2249, create_blip = true, blip_title = "Davis Gym", blip_color = 0, blip_icon = 311, blip_scale = 0.7},
        [3] = {coords = vector3(1743.9257, 3695.1252, 34.1314), heading = 211.6989, create_blip = true, blip_title = "Sandy Gym", blip_color = 0, blip_icon = 311, blip_scale = 0.7},
        [4] = {coords = vector3(-72.3732, 6411.3047, 31.6381), heading = 222.0314, create_blip = true, blip_title = "Paleto Gym", blip_color = 0, blip_icon = 311, blip_scale = 0.7},
        [5] = {coords = vector3(-3159.6978, 1185.0441, 20.5849), heading = 184.8001, create_blip = true, blip_title = "Chumash Gym", blip_color = 0, blip_icon = 311, blip_scale = 0.7},
    },
    gym_cooldown = 4, -- How many hours a player must wait before they will be able to access the gym again (Persistent through server restarts)
    xp_per_excercise_min = 15, -- Minimum amount of XP gained per excercise
    xp_per_excercise_max = 25, -- Maximum amount of XP gained per excercise
    excercise_cooldown = 60, -- How many seconds a player must wait before being able to excercise again
    access_time = 15, -- How many minutes can a player acccess the gym for
}

Config.PremiumMembership = {
    enabled = true,
    entrance_fee = 5000,
    access_time = 30,
}

Config.PedSpawns = { -- To setup peds to spawn, use Config.PedList
    Invincible = true, -- Is the ped going to be invincible?
    Frozen = true, -- Is the ped frozen in place?
    Stoic = true, -- If you do not want the peds to react to events around them
    FadeIn = true, -- Will the ped fade in and out based on the distance. (Looks a lot better.)
    DistanceSpawn = 100.0, -- Distance before spawning/despawning the ped. (GTA Units.)
    MinusOne = true, -- Leave this enabled if your coordinates grabber does not -1 from the player coords.
    GenderNumbers = { -- No reason to touch these.
	    ['male'] = 4,
	    ['female'] = 5
    }
}

Config.PedList = { -- Peds: https://docs.fivem.net/docs/game-references/ped-models/
	-- {   -- VINEWOOD
	-- 	model = `a_f_y_fitness_01`, -- Model name as a hash.
	-- 	coords = vec4(-483.88, 269.92, 83.31, 80.54), -- (X, Y, Z, Heading)
	-- 	gender = 'male' -- The gender of the ped, used for the CreatePed native.
	-- },
    {   -- BEACH
		model = `a_f_y_fitness_01`, -- Model name as a hash.
		coords = vector4(-1208.59, -1574.19, 4.60, 304.96), -- (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},
    {   -- DAVIS
		model = `a_f_y_fitness_01`, -- Model name as a hash.
		coords = vector4(-169.7676, -1742.4098, 32.6829, 141.0996), -- (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},
    {   -- SANDY
		model = `a_f_y_fitness_01`, -- Model name as a hash.
		coords = vector4(1744.3372, 3694.4421, 34.1812, 27.8254), -- (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},
    {   -- PALETO
		model = `a_f_y_fitness_01`, -- Model name as a hash.
		coords = vector4(-71.9368, 6411.8545, 31.6322, 141.9053), -- (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},
    {   -- CHUMASH
		model = `a_f_y_fitness_01`, -- Model name as a hash.
		coords = vector4(-3159.5273, 1183.8193, 20.7246, 353.9361), -- (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},
}

Config.Dogs = {
    "a_c_chop",
    "a_c_husky",
    "a_c_retriever",
    "a_c_shepherd",
    "a_c_rottweiler",
    "ft-aushep",
    "ft-bloodhound",
    "ft-groe",
    "ft-pterrier",
    "ft-pandags",
    "ft-amakita",
    "ft_dshepherd",
    "a_c_aussiepup",
    "bughusky",
    "bugk9",
    "ft-dobermanv2",
    "bugdoberman",
    "a_c_dalmatian",
    "golden_r"
}

Config.GymEquipmentLocations = { -- Animations: prop_human_muscle_chin_ups, world_human_muscle_free_weights, world_human_push_ups, world_human_yoga, world_human_jog_standing, world_human_sit_ups, world_human_muscle_flex
    -- VINEWOOD GYM
    -- [1] = {
    --     coords = vector3(-477.9651, 268.1812, 83.3445), heading = 129.7751,
    --     animation = 'world_human_jog_standing', -- Which animation to use for the excercise
    --     description = 'Jog' -- What to display when in the zone
    -- },
    -- [2] = {
    --     coords = vector3(-475.3402, 267.9442, 83.3444), heading = 129.7751,
    --     animation = 'world_human_jog_standing',
    --     description = 'Jog'
    -- },
    -- [3] = {
    --     coords = vector3(-472.6928, 267.6039, 83.3443), heading = 129.7751,
    --     animation = 'world_human_jog_standing',
    --     description = 'Jog'
    -- },
    -- [4] = {
    --     coords = vector3(-467.5421, 271.0218, 83.3444), heading = 129.7751,
    --     animation = 'world_human_jog_standing',
    --     description = 'Jog'
    -- },
    -- [5] = {
    --     coords = vector3(-468.0240, 267.9181, 83.3444), heading = 129.7751,
    --     animation = 'world_human_jog_standing',
    --     description = 'Jog'
    -- },
    -- [6] = {
    --     coords = vector3(-479.8330, 269.3289, 83.3444), heading = 262.2332,
    --     animation = 'world_human_yoga',
    --     description = 'Do Yoga'
    -- },
    -- [7] = {
    --     coords = vector3(-469.2170, 275.9629, 83.3444), heading = 175.5036,
    --     animation = 'world_human_muscle_free_weights',
    --     description = 'Lift Weights'
    -- },
    -- [8] = {
    --     coords = vector3(-468.7338, 278.8389, 83.3444), heading = 349.9837,
    --     animation = 'world_human_muscle_free_weights',
    --     description = 'Lift Weights'
    -- },
    -- [9] = {
    --     coords = vector3(-474.2345, 275.9757, 83.8343), heading = 353.1176,
    --     animation = 'world_human_sit_ups',
    --     description = 'Do Sit Ups'
    -- },
    -- [10] = {
    --     coords = vector3(-472.3026, 280.7339, 83.8378), heading = 179.2240,
    --     animation = 'world_human_sit_ups',
    --     description = 'Do Sit Ups'
    -- },
    -- [11] = {
    --     coords = vector3(-474.1789, 279.9826, 83.3443), heading = 173.1033,
    --     animation = 'world_human_muscle_flex',
    --     description = 'Flex Muscles'
    -- },
    -- [12] = {
    --     coords = vector3(-472.2728, 276.7833, 83.3444), heading = 356.5580,
    --     animation = 'world_human_muscle_flex',
    --     description = 'Flex Muscles'
    -- },
    -- [13] = {
    --     coords = vector3(-467.3862, 275.2748, 83.6044), heading = 262.3759,
    --     animation = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
    --     description = 'Chin Ups'
    -- },
    -- BEACH --
    [1] = {
        coords = vector3(-1204.77, -1564.30, 4.60), heading = 35.90,
        animation = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
        description = 'Chin Ups'
    },
    [2] = {
        coords = vector3(-1207.43, -1566.03, 4.60), heading = 303.96,
        animation = 'world_human_yoga',
        description = 'Do Yoga'
    },
    [3] = {
        coords = vector3(-1201.80, -1566.78, 4.61), heading = 126.48,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [4] = {
        coords = vector3(-1199.36, -1564.80, 4.66), heading = 36.03,
    animation = 'world_human_muscle_free_weights',
    description = 'Lift Weights'    
    },
    [5] = {
        coords = vector3(-1196.19, -1569.07, 4.58), heading = 306.39,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [6] = {
        coords = vector3(-1207.78, -1562.59, 4.60), heading = 213.20,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [7] = {
        coords = vector3(-1200.09, -1571.12, 4.60), heading = 217.34,
        animation = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
        description = 'Chin Ups'
    },
    -- DAVIS
    [8] = {
        coords = vector3(-164.9851, -1738.3179, 32.7109), heading = 186.6183,
        animation = 'world_human_jog_standing', -- Which animation to use for the excercise
        description = 'Jog' -- What to display when in the zone
    },
    [9] = {
        coords = vector3(-163.3169, -1736.4261, 32.7109), heading = 186.6183,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [10] = {
        coords = vector3(-161.6807, -1734.3867, 32.7109), heading = 186.6183,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [11] = {
        coords = vector3(-159.3229, -1730.0822, 32.7110), heading = 186.6183,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [12] = {
        coords = vector3(-161.7631, -1728.0334, 32.7110), heading = 186.6183,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [13] = {
        coords = vector3(-167.0298, -1739.6636, 32.7109), heading = 329.2063,
        animation = 'world_human_yoga',
        description = 'Do Yoga'
    },
    [14] = {
        coords = vector3(-166.7492, -1726.7991, 32.7110), heading = 227.0533,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [15] = {
        coords = vector3(-169.1745, -1724.7889, 32.7110), heading = 51.8926,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [16] = {
        coords = vector3(-172.3452, -1726.8318, 33.2043), heading = 232.2000,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [17] = {
        coords = vector3(-169.6519, -1730.8505, 33.2009), heading = 52.3029,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [18] = {
        coords = vector3(-168.9174, -1729.0024, 32.7110), heading = 53.7337,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [19] = {
        coords = vector3(-172.8951, -1728.8859, 32.7110), heading = 234.4409,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [20] = {
        coords = vector3(-165.0956, -1725.6035, 33.0010), heading = 317.3686,
        animation = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
        description = 'Chin Ups'
    },
    -- SANDY
    [21] = {
        coords = vector3(1746.3939, 3688.5010, 34.2093), heading = 74.8941,
        animation = 'world_human_jog_standing', -- Which animation to use for the excercise
        description = 'Jog' -- What to display when in the zone
    },
    [22] = {
        coords = vector3(1747.6246, 3686.2581, 34.2093), heading = 74.8941,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [23] = {
        coords = vector3(1748.8212, 3683.9885, 34.2093), heading = 74.8941,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [24] = {
        coords = vector3(1752.1519, 3680.3530, 34.2094), heading = 74.8941,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [25] = {
        coords = vector3(1754.7924, 3681.8726, 34.2093), heading = 74.8941,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [26] = {
        coords = vector3(1745.9419, 3690.9451, 34.2093), heading = 215.1507,
        animation = 'world_human_yoga',
        description = 'Do Yoga'
    },
    [27] = {
        coords = vector3(1757.7190, 3686.1824, 34.2093), heading = 121.5526,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [28] = {
        coords = vector3(1760.5311, 3687.8970, 34.2092), heading = 299.7377,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [29] = {
        coords = vector3(1759.8026, 3691.5869, 34.7026), heading = 122.6215,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [30] = {
        coords = vector3(1754.8219, 3690.2629, 34.6992), heading = 305.4612,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [31] = {
        coords = vector3(1756.5343, 3689.0061, 34.2092), heading = 303.4942,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [32] = {
        coords = vector3(1757.8439, 3692.7000, 34.2093), heading = 123.0032,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [33] = {
        coords = vector3(1758.3905, 3684.2534, 34.5023), heading = 211.6588,
        animation = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
        description = 'Chin Ups'
    },
    -- PALETO
    [34] = {
        coords = vector3(-66.7196, 6415.5210, 31.6603), heading = 183.4414,
        animation = 'world_human_jog_standing', -- Which animation to use for the excercise
        description = 'Jog' -- What to display when in the zone
    },
    [35] = {
        coords = vector3(-64.8694, 6417.1909, 31.6603), heading = 183.4414,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [36] = {
        coords = vector3(-63.0318, 6419.0630, 31.6603), heading = 183.4414,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [37] = {
        coords = vector3(-60.2725, 6423.2622, 31.6603), heading = 183.4414,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [38] = {
        coords = vector3(-62.5238, 6425.2383, 31.6603), heading = 183.4414,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [39] = {
        coords = vector3(-69.1221, 6414.2974, 31.6603), heading = 319.2079,
        animation = 'world_human_yoga',
        description = 'Do Yoga'
    },
    [40] = {
        coords = vector3(-67.6064, 6427.3130, 31.6603), heading = 224.8832,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [41] = {
        coords = vector3(-69.4515, 6429.1948, 31.6603), heading = 47.5362,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [42] = {
        coords = vector3(-73.1071, 6427.6382, 32.1537), heading = 226.5743,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [43] = {
        coords = vector3(-70.6116, 6423.2109, 32.1502), heading = 49.0181,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [44] = {
        coords = vector3(-69.8630, 6425.1670, 31.6603), heading = 49.3491,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [45] = {
        coords = vector3(-73.6762, 6425.4834, 31.6603), heading = 225.9072,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [46] = {
        coords = vector3(-65.7447, 6428.1030, 31.9303), heading = 312.9262,
        animation = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
        description = 'Chin Ups'
    },
    -- CHUMASH
    [47] = {
        coords = vector3(-3154.5623, 1173.7659, 20.8023), heading = 133.9114,
        animation = 'world_human_jog_standing', -- Which animation to use for the excercise
        description = 'Jog' -- What to display when in the zone
    },
    [48] = {
        coords = vector3(-3159.3755, 1174.0707, 20.8024), heading = 224.7616,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [49] = {
        coords = vector3(-3159.6633, 1169.2423, 20.8024), heading = 314.5436,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [50] = {
        coords = vector3(-3154.7927, 1168.9816, 20.8024), heading = 48.8728,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [51] = {
        coords = vector3(-3157.3357, 1176.4144, 20.7527), heading = 173.9530,
        animation = 'world_human_jog_standing',
        description = 'Jog'
    },
    [52] = {
        coords = vector3(-3157.1768, 1171.5505, 20.8024), heading = 178.8200,
        animation = 'world_human_yoga',
        description = 'Do Yoga'
    },
    [53] = {
        coords = vector3(-3160.1309, 1180.2891, 20.7527), heading = 175.2347,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [54] = {
        coords = vector3(-3150.0371, 1169.3131, 20.7526), heading = 268.4311,
        animation = 'world_human_muscle_free_weights',
        description = 'Lift Weights'
    },
    [55] = {
        coords = vector3(-3148.3997, 1172.8556, 21.2460), heading = 88.2762,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [56] = {
        coords = vector3(-3142.1912, 1173.6223, 20.7526), heading = 87.3729,
        animation = 'world_human_sit_ups',
        description = 'Do Sit Ups'
    },
    [57] = {
        coords = vector3(-3149.1758, 1174.8700, 20.7526), heading =  83.6592,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
    [58] = {
        coords = vector3(-3152.5820, 1174.0227, 20.7526), heading = 266.9021,
        animation = 'world_human_muscle_flex',
        description = 'Flex Muscles'
    },
}

Config.SkillCategories = {
    Stamina = {
        icon = "🏃‍♂️",
        key = "stamina",
        tiers = {
            { name = "Jogger",                  cost = 1, description = "Increase your total stamina by 5%" },
            { name = "Sprinter",                cost = 3, description = "Increase your total stamina by 10%" },
            { name = "Marathoner",              cost = 5, description = "Increase your total stamina by 30%" },
            { name = "Iron Lungs",              cost = 15, description = "Increase your total stamina by 50%" },
            { name = "Stamina Master",          cost = 20, description = "Stamina is no longer a concern. You could run forever!" },
        }
    },
    Strength = {
        icon = "💪",
        key = "strength",
        tiers = {
            { name = "Brawler",                 cost = 1, description = "Increase your punching strength by 10%" },
            { name = "Powerhouse",              cost = 3, description = "Increase your punching strength by 20%" },
            { name = "Enforcer",                cost = 8, description = "Increase your punching strength by 30%" },
            { name = "Juggernaut",              cost = 10, description = "Increase your punching strength by 40%" },
            { name = "Strength Master",         cost = 20, description = "Increase your punching strength by 50%" },
        }
    },
    ["Lung Capacity"] = {
        icon = "🌊",
        key = "breathing",
        tiers = {
            { name = "Paddler",                 cost = 1, description = "You can hold your breath under water for around 15 seconds" },
            { name = "Diver",                   cost = 3, description = "You can hold your breath under water for around 30 seconds" },
            { name = "Freediver",               cost = 8, description = "You can hold your breath under water for around 1 minute" },
            { name = "Deep Sea Explorer",       cost = 10, description = "You can hold your breath under water for around 1 minute, 30 seconds" },
            { name = "Breath Master",           cost = 20, description = "You can hold your breath under water for around 2 minutes" },
        }
    },
    Stress = {
        icon = "🧘",
        key = "stress",
        tiers = {
            { name = "Calm Mind",               cost = 1, description = "Stress from driving builds up 1.75x slower" },
            { name = "Steady Hand",             cost = 3, description = "Stress from driving builds up 2.5x slower" },
            { name = "Zen Practitioner",        cost = 8, description = "Stress from driving builds up 3x slower" },
            { name = "Sage",                    cost = 10, description = "Stress from driving builds up 3.5x slower" },
            { name = "Stress Master",           cost = 20, description = "Stress from driving builds up 4x slower" },
        }
    },
    Working = {
        icon = "🧰",
        key = "working",
        tiers = {
            { name = "Apprentice",              cost = 1, description = "Produce business items 20% faster" },
            { name = "Hard Worker",             cost = 3, description = "Produce business items 40% faster" },
            { name = "Experienced Worker",      cost = 8, description = "Produce business items 60% faster" },
            { name = "Businessman",             cost = 10, description = "Produce business items 80% faster" },
            { name = "Master of all Crafts",    cost = 20, description = "Produce business items almost instantly" },
        }
    },
    -- Crafting = {
    --     icon = "🛠️",
    --     key = "crafting",
    --     tiers = {
    --         { name = "Rookie Craftsman",        cost = 1, description = "Basic understanding of underground crafting. Can produce low-quality items." },
    --         { name = "Smuggler",                cost = 3, description = "Skilled at illicit production. Items are of decent quality." },
    --         { name = "Underground Architect",   cost = 8, description = "Advanced techniques. Can craft rare or high-quality illegal items." },
    --         { name = "Criminal Artisan",        cost = 10, description = "Expert in illegal crafting. High efficiency and low risk of failure." },
    --         { name = "Crafting Master",         cost = 20, description = "Elite mastery of illegal crafting. Produces perfect items quickly and reliably." },
    --     }
    -- },
    Cryptography = {
        icon = "💻",
        key = "crypto",
        tiers = {
            { name = "Script Kiddie",           cost = 1,  description = "Reduce the wait between crypto decryptions by 5 seconds." },
            { name = "Coder",                   cost = 3,  description = "Reduce the wait between crypto decryptions by 10 seconds." },
            { name = "Net Runner",              cost = 8,  description = "Reduce the wait between crypto decryptions by 15 seconds." },
            { name = "Cyber Ghost",             cost = 10, description = "Reduce the wait between crypto decryptions by 20 seconds." },
            { name = "Master Hacker",           cost = 20, description = "Remove the minigame when decrypting cryptosticks (does NOT apply to crypto hard drives)." },
        }
    },
    -- Health = {
    --     icon = "❤️",
    --     key = "health",
    --     tiers = {
    --         { name = "Resilient",               cost = 1,  description = "Increase your Maximum Health by 2%" },
    --         { name = "Tough",                   cost = 3,  description = "Increase your Maximum Health by 4%" },
    --         { name = "Iron Body",               cost = 8,  description = "Increase your Maximum Health by 6%" },
    --         { name = "Steel Frame",             cost = 10, description = "Increase your Maximum Health by 8%" },
    --         { name = "Health Master",           cost = 20, description = "Increase your Maximum Health by 10%" },
    --     }
    -- },
    Heists = {
        icon = "💰",
        key = "heists",
        tiers = {
            { name = "Hostage Holder",          cost = 1,  description = "2% increase to marked bills in heist payouts" },
            { name = "Money Bagger",            cost = 3,  description = "3% increase to marked bills in heist payouts" },
            { name = "Crewman",                 cost = 8,  description = "5% increase to marked bills in heist payouts" },
            { name = "Tactician",               cost = 10, description = "8% increase to marked bills in heist payouts" },
            { name = "Heist Mastermind",        cost = 20, description = "10% increase to marked bills in heist payouts" },
        }
    },

    -- Flying = {
    --     icon = "✈️",
    --     color = "bg-yellow-600",
    --     key = "flying",
    --     tiers = {
    --         { name = "Rookie Pilot", cost = 1, description = "Basic flight control. Reduced turbulence effects." },
    --         { name = "Skilled Aviator", cost = 3, description = "Better stability and smoother landings." },
    --         { name = "Air Ace", cost = 8, description = "Advanced maneuvers unlocked. Increased fuel efficiency." },
    --         { name = "Sky Commander", cost = 10, description = "Maximum precision flying. Reduced crash penalties." },
    --         { name = "Flight Master", cost = 20, description = "Elite mastery of all aircraft. Near-perfect handling." },
    --     }
    -- },
    -- Driving = {
    --     icon = "🚗",
    --     color = "bg-orange-600",
    --     key = "driving",
    --     tiers = {
    --         { name = "Learner Driver", cost = 1, description = "Improved handling and reduced damage in crashes." },
    --         { name = "Street Racer", cost = 3, description = "Better acceleration and cornering." },
    --         { name = "Road Warrior", cost = 8, description = "Improved off-road control and durability." },
    --         { name = "Pro Driver", cost = 10, description = "Advanced maneuvers unlocked. Faster repairs." },
    --         { name = "Driving Master", cost = 20, description = "Ultimate driving skill. Maximum vehicle performance." },
    --     }
    -- },
    -- Crafting = {
    --     icon = "🛠️",
    --     color = "bg-orange-600",
    --     key = "crafting",
    --     tiers = {
    --         { name = "Apprentice", cost = 1, description = "Can craft simple items with less chance of failure." },
    --         { name = "Journeyman", cost = 3, description = "Crafting efficiency improved. Reduced material usage." },
    --         { name = "Artisan", cost = 8, description = "Unlocks advanced crafting recipes. Faster crafting speed." },
    --         { name = "Engineer", cost = 10, description = "Greater efficiency. High success rates on complex crafts." },
    --         { name = "Crafting Master", cost = 20, description = "Perfect crafting skill. Maximum efficiency and speed." },
    --     }
    -- },
    -- ['Drug Gathering'] = {
    --     icon = "🌿",
    --     color = "bg-orange-600",
    --     key = "druggathering",
    --     tiers = {
    --         { name = "Forager", cost = 1, description = "Can spot basic plants and materials more easily." },
    --         { name = "Gatherer", cost = 3, description = "Improved gathering speed and yields." },
    --         { name = "Harvester", cost = 8, description = "Higher chance of finding rare resources." },
    --         { name = "Field Expert", cost = 10, description = "Efficient gathering with maximum yield." },
    --         { name = "Gathering Master", cost = 20, description = "Unmatched skill. Always collect maximum resources." },
    --     }
    -- },

}

Config.Levels = {
    [1] = {
        requiredXP = 100,
        addperkpoints = 0,
    },
    [2] = {
        requiredXP = 205,
        addperkpoints = 1,
    },
    [3] = {
        requiredXP = 315,
        addperkpoints = 1,
    },
    [4] = {
        requiredXP = 430,
        addperkpoints = 1,
    },
    [5] = {
        requiredXP = 551,
        addperkpoints = 1,
    },
    [6] = {
        requiredXP = 677,
        addperkpoints = 1,
    },
    [7] = {
        requiredXP = 808,
        addperkpoints = 1,
    },
    [8] = {
        requiredXP = 944,
        addperkpoints = 1,
    },
    [9] = {
        requiredXP = 1086,
        addperkpoints = 1,
    },
    [10] = {
        requiredXP = 1233,
        addperkpoints = 10,
    },
    [11] = {
        requiredXP = 1386,
        addperkpoints = 2,
    },
    [12] = {
        requiredXP = 1545,
        addperkpoints = 2,
    },
    [13] = {
        requiredXP = 1711,
        addperkpoints = 2,
    },
    [14] = {
        requiredXP = 1884,
        addperkpoints = 2,
    },
    [15] = {
        requiredXP = 2063,
        addperkpoints = 2,
    },
    [16] = {
        requiredXP = 2250,
        addperkpoints = 2,
    },
    [17] = {
        requiredXP = 2444,
        addperkpoints = 2,
    },
    [18] = {
        requiredXP = 2646,
        addperkpoints = 2,
    },
    [19] = {
        requiredXP = 2856,
        addperkpoints = 2,
    },
    [20] = {
        requiredXP = 3074,
        addperkpoints = 15,
    },
    [21] = {
        requiredXP = 3301,
        addperkpoints = 3,
    },
    [22] = {
        requiredXP = 3537,
        addperkpoints = 3,
    },
    [23] = {
        requiredXP = 3783,
        addperkpoints = 3,
    },
    [24] = {
        requiredXP = 4039,
        addperkpoints = 3,
    },
    [25] = {
        requiredXP = 4305,
        addperkpoints = 3,
    },
    [26] = {
        requiredXP = 4581,
        addperkpoints = 3,
    },
    [27] = {
        requiredXP = 4869,
        addperkpoints = 3,
    },
    [28] = {
        requiredXP = 5168,
        addperkpoints = 3,
    },
    [29] = {
        requiredXP = 5479,
        addperkpoints = 3,
    },
    [30] = {
        requiredXP = 5815,
        addperkpoints = 20,
    },
    [31] = {
        requiredXP = 6165,
        addperkpoints = 4,
    },
    [32] = {
        requiredXP = 6529,
        addperkpoints = 4,
    },
    [33] = {
        requiredXP = 6908,
        addperkpoints = 4,
    },
    [34] = {
        requiredXP = 7302,
        addperkpoints = 4,
    },
    [35] = {
        requiredXP = 7712,
        addperkpoints = 4,
    },
    [36] = {
        requiredXP = 8138,
        addperkpoints = 4,
    },
    [37] = {
        requiredXP = 8581,
        addperkpoints = 4,
    },
    [38] = {
        requiredXP = 9042,
        addperkpoints = 4,
    },
    [39] = {
        requiredXP = 9521,
        addperkpoints = 4,
    },
    [40] = {
        requiredXP = 10019,
        addperkpoints = 25,
    },
    [41] = {
        requiredXP = 10537,
        addperkpoints = 5,
    },
    [42] = {
        requiredXP = 11076,
        addperkpoints = 5,
    },
    [43] = {
        requiredXP = 11637,
        addperkpoints = 5,
    },
    [44] = {
        requiredXP = 12220,
        addperkpoints = 5,
    },
    [45] = {
        requiredXP = 12826,
        addperkpoints = 5,
    },
    [46] = {
        requiredXP = 13457,
        addperkpoints = 5,
    },
    [47] = {
        requiredXP = 14113,
        addperkpoints = 5,
    },
    [48] = {
        requiredXP = 14795,
        addperkpoints = 5,
    },
    [49] = {
        requiredXP = 15504,
        addperkpoints = 5,
    },
    [50] = {
        requiredXP = 16242,
        addperkpoints = 30,
    },
    [51] = {
        requiredXP = 17009,
        addperkpoints = 6,
    },
    [52] = {
        requiredXP = 17807,
        addperkpoints = 6,
    },
    [53] = {
        requiredXP = 18637,
        addperkpoints = 6,
    },
    [54] = {
        requiredXP = 19500,
        addperkpoints = 6,
    },
    [55] = {
        requiredXP = 20398,
        addperkpoints = 6,
    },
    [56] = {
        requiredXP = 21332,
        addperkpoints = 6,
    },
    [57] = {
        requiredXP = 22303,
        addperkpoints = 6,
    },
    [58] = {
        requiredXP = 23313,
        addperkpoints = 6,
    },
    [59] = {
        requiredXP = 24363,
        addperkpoints = 6,
    },
    [60] = {
        requiredXP = 25456,
        addperkpoints = 35,
    },
    [61] = {
        requiredXP = 26592,
        addperkpoints = 7,
    },
    [62] = {
        requiredXP = 27774,
        addperkpoints = 7,
    },
    [63] = {
        requiredXP = 29003,
        addperkpoints = 7,
    },
    [64] = {
        requiredXP = 30281,
        addperkpoints = 7,
    },
    [65] = {
        requiredXP = 31610,
        addperkpoints = 7,
    },
    [66] = {
        requiredXP = 32993,
        addperkpoints = 7,
    },
    [67] = {
        requiredXP = 34431,
        addperkpoints = 7,
    },
    [68] = {
        requiredXP = 35296,
        addperkpoints = 7,
    },
    [69] = {
        requiredXP = 37481,
        addperkpoints = 7,
    },
    [70] = {
        requiredXP = 39098,
        addperkpoints = 40,
    },
    [71] = {
        requiredXP = 40780,
        addperkpoints = 8,
    },
    [72] = {
        requiredXP = 42529,
        addperkpoints = 8,
    },
    [73] = {
        requiredXP = 44348,
        addperkpoints = 8,
    },
    [74] = {
        requiredXP = 46240,
        addperkpoints = 8,
    },
    [75] = {
        requiredXP = 48208,
        addperkpoints = 8,
    },
    [76] = {
        requiredXP = 50255,
        addperkpoints = 8,
    },
    [77] = {
        requiredXP = 52384,
        addperkpoints = 8,
    },
    [78] = {
        requiredXP = 54598,
        addperkpoints = 8,
    },
    [79] = {
        requiredXP = 56900,
        addperkpoints = 8,
    },
    [80] = {
        requiredXP = 59294,
        addperkpoints = 45,
    },
    [81] = {
        requiredXP = 61784,
        addperkpoints = 9,
    },
    [82] = {
        requiredXP = 64374,
        addperkpoints = 9,
    },
    [83] = {
        requiredXP = 67067,
        addperkpoints = 9,
    },
    [84] = {
        requiredXP = 69868,
        addperkpoints = 9,
    },
    [85] = {
        requiredXP = 72781,
        addperkpoints = 9,
    },
    [86] = {
        requiredXP = 75811,
        addperkpoints = 9,
    },
    [87] = {
        requiredXP = 78692,
        addperkpoints = 9,
    },
    [88] = {
        requiredXP = 82239,
        addperkpoints = 9,
    },
    [89] = {
        requiredXP = 85647,
        addperkpoints = 9,
    },
    [90] = {
        requiredXP = 89192,
        addperkpoints = 50,
    },
    [91] = {
        requiredXP = 92878,
        addperkpoints = 10,
    },
    [92] = {
        requiredXP = 96712,
        addperkpoints = 10,
    },
    [93] = {
        requiredXP = 100699,
        addperkpoints = 10,
    },
    [94] = {
        requiredXP = 104846,
        addperkpoints = 10,
    },
    [95] = {
        requiredXP = 109159,
        addperkpoints = 10,
    },
    [96] = {
        requiredXP = 113644,
        addperkpoints = 10,
    },
    [97] = {
        requiredXP = 118309,
        addperkpoints = 10,
    },
    [98] = {
        requiredXP = 123160,
        addperkpoints = 10,
    },
    [99] = {
        requiredXP = 128205,
        addperkpoints = 10,
    },
    [100] = {
        requiredXP = 135000,
        addperkpoints = 100,
    },
}
