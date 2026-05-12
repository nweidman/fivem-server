Config = {}

Config.Timelimit = 3600 -- AFK kick TIMER within time in seconds

Config.OxInventory = true --True if you are using the ox_inventory, if not then false

Config.ZoneProperty = {
    ['hospitalzone'] = { --Zone name can be same in the Config.RadiusZone & Config.PolyZone
        PauseFood = false, 
        PauseWater = false, 
        ReduceStress = false, 
        SafeZone = true,
        Speedlimit = 'false', --'mph', 'kmh' or false
        StressRelief = 0.5, --if ReduceStress = true, Amount of Stress relief per second
        SpeedlimitValue = 30,
        WhitelistJobs = {'ambulance', 'police', 'sheriff'} --Jobs to bypass the safezone restriction
    },
    ['policestationzone'] = { --Zone name can be same in the Config.RadiusZone & Config.PolyZone
        PauseFood = false, 
        PauseWater = false, 
        ReduceStress = false, 
        SafeZone = false,
        Speedlimit = 'false', --'mph', 'kmh' or false
        StressRelief = 0.5, --if ReduceStress = true, Amount of Stress relief per second
        SpeedlimitValue = 30,
        WhitelistJobs = {'ambulance', 'police', 'sheriff'} --Jobs to bypass the safezone restriction --Amount of Stress relief per second
    },
    ['casino'] = { --Zone name can be same in the Config.RadiusZone & Config.PolyZone
        PauseFood = false, 
        PauseWater = false, 
        ReduceStress = false, 
        SafeZone = true,
        Speedlimit = 'false', --'mph', 'kmh' or false
        StressRelief = 0.5, --if ReduceStress = true, Amount of Stress relief per second
        SpeedlimitValue = 30,
        WhitelistJobs = {'ambulance', 'police', 'sheriff'} --Jobs to bypass the safezone restriction --Amount of Stress relief per second
    },
    ['davispd'] = { --Zone name can be same in the Config.RadiusZone & Config.PolyZone
        PauseFood = false, 
        PauseWater = false, 
        ReduceStress = false, 
        SafeZone = false,
        Speedlimit = 'false', --'mph', 'kmh' or false
        StressRelief = 0.5, --if ReduceStress = true, Amount of Stress relief per second
        SpeedlimitValue = 30,
        WhitelistJobs = {'ambulance', 'police', 'sheriff'} --Jobs to bypass the safezone restriction --Amount of Stress relief per second
    },
    ['sandypd'] = { --Zone name can be same in the Config.RadiusZone & Config.PolyZone
    PauseFood = false, 
    PauseWater = false, 
    ReduceStress = false, 
    SafeZone = false,
    Speedlimit = 'false', --'mph', 'kmh' or false
    StressRelief = 0.5, --if ReduceStress = true, Amount of Stress relief per second
    SpeedlimitValue = 30,
    WhitelistJobs = {'ambulance', 'police', 'sheriff'} --Jobs to bypass the safezone restriction --Amount of Stress relief per second
},
['sandyhp'] = { --Zone name can be same in the Config.RadiusZone & Config.PolyZone
PauseFood = false, 
PauseWater = false, 
ReduceStress = false, 
SafeZone = true,
Speedlimit = 'false', --'mph', 'kmh' or false
StressRelief = 0.5, --if ReduceStress = true, Amount of Stress relief per second
SpeedlimitValue = 30,
WhitelistJobs = {'ambulance', 'police', 'sheriff'} --Jobs to bypass the safezone restriction --Amount of Stress relief per second
},
}

Config.RadiusZone = {
    -- ['hospitalzone'] = { --Zone name should be from the Config.ZoneProperty Name
    --     x = 328.9448, y = -587.4816, z = 71.2261, radius = 100.0
    -- },
}

Config.PolyZone = {
    ['policestationzone'] = { --Zone name should be from the Config.ZoneProperty Name
		Debug = false,
		Zones = {
		    {
			    Coords = {
                    vector2(407.26150512695, -961.58459472656),
                    vector2(493.48638916016, -960.46148681641),
                    vector2(494.44357299805, -1026.5689697266),
                    vector2(405.16998291016, -1032.1352539062)
				},
                minZ = 27.000,
				maxZ = 45.000,
			},
		},
	},

    ['hospitalzone'] = { --Zone name should be from the Config.ZoneProperty Name
		Debug = false,
		Zones = {
		    {
			    Coords = {
                    vector2(265.4, -612.55),
                    vector2(289.07, -553.91),
                    vector2(395.63, -562.96),
                    vector2(363.25, -621.65)
				},
                minZ = 20.000,
				maxZ = 100.000,
			},
		},
	},

    ['casino'] = { --Zone name should be from the Config.ZoneProperty Name
    Debug = false,
    Zones = {
        {
            Coords = {
                vector2(870.5019, 18.2074),
                vector2(942.0801, 116.0597),
                vector2(1022.4981, 63.6515),
                vector2(958.1147, -38.6780)
            },
            minZ = 78.000,
            maxZ = 150.000,
        },
    },
},

['davispd'] = { --Zone name should be from the Config.ZoneProperty Name
Debug = false,
Zones = {
    {
        Coords = {
            vector2(364.5634, -1569.0249),
            vector2(414.0114, -1609.9227),
            vector2(387.0882, -1641.0602),
            vector2(338.2117, -1600.5297)
        },
        minZ = 25.000,
        maxZ = 46.000,
    },
},
},

['sandypd'] = { --Zone name should be from the Config.ZoneProperty Name
Debug = false,
Zones = {
    {
        Coords = {
            vector2(1816.2905, 3650.0862),
            vector2(1876.7438, 3683.8298),
            vector2(1856.7480, 3721.4534),
            vector2(1795.4568, 3684.6965)
        },
        minZ = 33.000,
        maxZ = 46.000,
    },
},
},

['sandyhp'] = { --Zone name should be from the Config.ZoneProperty Name
Debug = false,
Zones = {
    {
        Coords = {
            vector2(1722.5811, 3594.6494),
            vector2(1799.7871, 3640.4497),
            vector2(1780.4948, 3673.8789),
            vector2(1701.8689, 3630.3450)
        },
        minZ = 33.000,
        maxZ = 46.000,
    },
},
},

}
