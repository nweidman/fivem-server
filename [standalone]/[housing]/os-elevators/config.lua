-- Thanks for using this script! Check out other free scripts by me on CFX FiveM or my Tebex for paid scripts/support: https://angelicxs.tebex.io/

Config = {}

Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.UseThirdEye = true				-- If true uses third eye.
Config.ThirdEyeName = 'ox_target' 			-- Name of third eye aplication
Config.Use3DText = true                        -- Use 3D text to interact
Config.NHMenu = false						-- Use NH-Context [https://github.com/whooith/nh-context]
Config.QBMenu = false						-- Use QB-Menu (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-menu]
Config.OXLib = true						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib] !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!
Config.ElevatorWaitTime = 0					-- How many seconds until the player arrives at their floor

Config.Notify = {
	enabled = false,							-- Display hint notification?
	distance = 3.0,							-- Distance from elevator that the hint will show
	message = "Target the elevator to use"	-- Text of the hint notification
}

--[[
	USAGE
	To add an elevator, copy the table below and configure as needed:
		coords = vector3 coords of center of elevator
		heading = Direction facing out of the elevator
		level = What floor are they going to
		label = What is on that floor
		jobs = OPTIONAL: Table of job keys that are allowed to access that floor and value of minimum grade of each job
		items = OPTIONAL: Any items that are required to access that floor (only requires one of the items listed)
		jobAndItem = OPTIONAL: If true, you must you have a required job AND a required items. If false or nil no items are needed
	
]]

--[[
	ExampleElevator = {	
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 2", label = "Roof",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_bronze",
				"casino_pass_silver",
				"casino_pass_gold",
			}
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 1", label = "Penthouse",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_gold",
			},
			jobAndItem = true
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 0", label = "Ground"
		},
	},
]]

Config.Elevators = {

    -- VWP Department Elevator
    VWPDElevator = {
        {
            coords = vector3(611.5105, -7.6421, 83.6419),
            heading = 284.5140,
            level = "Ground",
            label = "Main Floor"
        },
        {
            coords = vector3(611.5122, -7.6501, 87.8022),
            heading = 343.4839,
            level = "Offices",
            label = "Armory & Changing",
        },
        {
            coords = vector3(611.7781, -6.9830, 75.0448),
            heading = 328.6116,
            level = "Motor Pool",
            label = "Garage & Cells"
        },
        {
            coords = vector3(601.1237, -15.2420, 101.3460),
            heading = 308.6663,
            level = "Roof",
            label = "Air-One",
        },
    },

    -- Pillbox Hospital Elevator
    PillboxElevator = {
        {
            coords = vector3(313.6087, -578.7667, 43.1924),
            heading =  73.6753,
            level = "Main",
            label = "Beds"
        },
        {
            coords = vector3(312.2223, -581.2849, 43.1924),
            heading = 71.4630,
            level = "Main",
            label = "Beds"
        },
        {
            coords = vector3(329.4626, -594.7224, 43.2601),
            heading = 340.0391,
            level = "Main",
            label = "Back Offices",
        },
        {
            coords = vector3(295.5183, -629.3479, 22.5401),
            heading = 252.7769,
            level = "Garage",
            label = "Bottom Floor"
        },
        {
            coords = vector3(332.7198, -581.5722, 74.1643),
            heading = 249.5567,
            level = "Roof",
            label = "Helicopter",
        },
    },

    -- High Notes Club Elevator
    ['High Notes Elevator'] = {
        {
            coords = vector3(-844.0071, -241.5227, 37.2295),
            heading = 29.2550,
            level = "Main",
            label = "Ground Level"
        },
        {
            coords = vector3(-844.1425, -241.4055, 30.9809),
            heading = 29.2550,
            level = "Basement",
            label = "We Are Growers",
            jobs = { ["highnote"] = 0 }
        },
        {
            coords = vector3(-844.0465, -241.2345, 62.1776),
            heading = 209.3651,
            level = "Roof",
            label = "Party Time"
        },
    },

    ['Sandy Hospital'] = {
        {
            coords = vector3(1759.2668, 3657.1875, 34.6061),
            heading = 203.8198,
            level = "Main",
            label = "Ground Level"
        },
        {
            coords = vector3(1760.1815, 3656.6682, 40.4595),
            heading = 210.4419,
            level = "Roof",
            label = "Helicopter"
        },
    },

    ['Strawberry Apartments'] = {
        {
            coords = vec3(165.59, -1056.2, 30.06),
            heading = 267.01,
            level = "Ground Floor",
            label = "Reception"
        },
        {
            coords = vec3(165.59, -1056.21, 36.31),
            heading = 267.01,
            level = "1st Floor",
            label = "Apartments 101-121",
        },
        {
            coords = vec3(165.53, -1056.2, 42.56),
            heading = 267.01,
            level = "2nd Floor",
            label = "Apartments 201-221"
        },
        {
            coords = vec3(165.52, -1056.2, 48.82),
            heading = 267.01,
            level = "3rd Floor",
            label = "Apartments 301-321"
        },
        {
            coords = vec3(165.52, -1056.2, 55.07),
            heading = 267.01,
            level = "4th Floor",
            label = "Apartments 401-421"
        },
        {
            coords = vec3(165.94, -1056.28, 61.33),
            heading = 267.01,
            level = "5th Floor",
            label = "Apartments 501-521"
        },
    },

     -- Shell Apartments Elevator
    ['Apartment Elevator'] = {
        {
            coords = vec3(-424.0, -833.86, -169.48),
            heading = 29.2550,
            level = "Main",
            label = "Ground Level"
        },
        {
            coords = vec3(-423.99, -833.86, -164.67),
            heading = 29.2550,
            level = "1st Floor",
            label = "Apartments 101 to 111",
        },
        {
            coords = vec3(-423.89, -833.89, -159.86),
            heading = 209.3651,
            level = "2nd Floor",
            label = "Apartments 201 to 211"
        },
        {
            coords = vec3(-423.88, -833.89, -155.94),
            heading = 209.3651,
            level = "3rd Floor",
            label = "Apartments 301 to 311"
        },
    },

     -- Vespucci Apartments Elevator
    ['Vespucci Elevator'] = {
        {
            coords = vec3(56.0635, -1020.1566, 29.3685),
            heading = 64.8518,
            level = "Main",
            label = "Ground Level"
        },
        {
            coords = vec3(56.0994, -1020.1658, 33.3279),
            heading = 245.3348,
            level = "2nd Floor",
            label = "Apartments 201 to 215",
        },
        {
            coords = vec3(56.1286, -1019.9088, 37.3300),
            heading = 248.0168,
            level = "3rd Floor",
            label = "Apartments 301 to 315"
        },
        {
            coords = vec3(56.1489, -1020.2433, 41.3319),
            heading = 252.0183,
            level = "4th Floor",
            label = "Apartments 401 to 415"
        },
        {
            coords = vec3(56.1839, -1020.2101, 45.3341),
            heading = 250.4976,
            level = "5th Floor",
            label = "Apartments 501 to 515"
        },
        {
            coords = vec3(56.2585, -1020.1943, 49.3362),
            heading = 252.6438,
            level = "6th Floor",
            label = "Apartments 601 to 615"
        },
        {
            coords = vec3(56.1091, -1020.0640, 53.3383),
            heading = 253.0588,
            level = "7th Floor",
            label = "Apartments 701 to 715"
        },
        {
            coords = vec3(56.1321, -1019.8596, 57.3402),
            heading = 249.6030,
            level = "8th Floor",
            label = "Apartments 801 to 815"
        },
        {
            coords = vec3(56.0554, -1019.9650, 61.3424),
            heading = 250.7090,
            level = "9th Floor",
            label = "Apartments 901 to 915"
        },
        {
            coords = vec3(56.2357, -1020.0900, 65.3445),
            heading = 247.5254,
            level = "10th Floor",
            label = "Apartments 1001 to 1015"
        },
        {
            coords = vec3(55.8425, -1019.9527, 69.3467),
            heading = 247.5254,
            level = "11th Floor",
            label = "Apartments 1101 to 1115"
        },
        {
            coords = vec3(55.9873, -1020.1598, 73.3485),
            heading = 247.5254,
            level = "12th Floor",
            label = "Apartments 1201 to 1215"
        },
    },
}