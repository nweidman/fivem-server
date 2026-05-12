Config = {
	Lan = "en", -- Pick your language here
	System = {
		Debug = false, -- enable debug mode

		Menu = "ox",			-- "qb", "ox", "gta"
		ProgressBar = "ox",	-- "qb", "ox", "gta"
		Notify = "ox",			-- "qb", "ox", "gta"
		drawText = "ox"			-- "qb", "ox", "gta"

	},
	General = {
		JimShops = false, 		-- Set this to true if using jim-shops for the shops
		DrillSound = true,		-- enable/disable drill sounds

		K4MB1Prop = false, 		-- Enable this to make use of K4MB1's ore props provided with their Mining Cave MLO

		AltMining = false,		-- Enables Alternate mining (enhanced with k4mb1's mining ore props)
								-- Changes system to one based on rarity of ores specified in setMiningTable below
								-- Every ore that spawns will give specific ores

		K4MB1Cart = false,		-- If using k4mb1's shaftcave mlo + caveprops
								-- Allow players to use a minecart to get to the chambers faster
								-- Add's target option to the store ped at the mine shaft

		requiredJob = nil,

	},
	Crafting = {
		craftCam = false,
		MultiCraft = true,		-- Enable multicraft
	},

	Timings = { -- Time it takes to do things
		Cracking = { 9000, 11500 }, -- 15 - 25 seconds
		Washing = { 10000, 12000 }, -- 15 - 25 seconds
		Panning = { 25000, 30000 },-- 45 - 50 seconds
		Pickaxe = { 15000, 18000 }, --  30 - 45 seconds
		Mining = { 10000, 15000 }, -- 45 - 50 seconds
		Laser = { 7000, 10000 },
		OreRespawn = math.random(55000, 75000),
		Crafting = 8000, -- 5 seconds
	},

	PoolAmounts = {
		Mining = {
			AmountPerSuccess = { 1, 2 }		-- Per success, this will give 1 - 3 of the selected item
		},
		Cracking = {
			AmountPerSuccess = { 1, 2 }		-- Per success, this will give 1 - 3 of the selected item
		},
		Panning = {
			Successes = { 1, 1 },			-- When complete, default will give 1 or 2 items
			AmountPerSuccess = { 1, 1 }		-- Per success, this will give 1 - 3 of the selected item
		},
		Washing = {
			Successes = { 1, 2 },			-- When complete, default will give 1 or 2 items
			AmountPerSuccess = { 1, 1 }		-- Per success, this will give 1 - 3 of the selected item
		},

	},

	CrackPool = { -- Rewards from cracking stone
		{ item = "carbon", rarity = "50",},
		{ item = "copperore",rarity = "50",},
		{ item = "sulfurore",rarity = "50",},
		{ item = "coal",rarity = "50",},
		{ item = "ironore", rarity = "50",},
	},

	WashPool = {	-- Rewards from washing stone
		{ item = "goldore", rarity = "30",},
		-- { item = "copperore",rarity = "80",},
		{ item = "uncut_ruby", rarity = "50" },
		{ item = "uncut_emerald", rarity = "50"},
		{ item = "uncut_diamond", rarity = "50"},
		{ item = "uncut_sapphire", rarity = "50"},
	},

	PanPool = {		-- Rewards from panning
		{ item = "can", rarity = "50", },
		{ item = "goldore", rarity = "40", },
		{ item = "bottle", rarity = "50", },
		{ item = "stone", rarity = "20", },
		{ item = "uncut_ruby", rarity = "10" },
		{ item = "uncut_emerald", rarity = "10"},
		{ item = "uncut_diamond", rarity = "10"},
		{ item = "uncut_sapphire", rarity = "10"},
		-- { item = "silverore", rarity = "50", },
	},

	setMiningTable = {	-- Set rarity of ore spawn for AltMining
		{ name = "carbon", rarity = "common", prop = "k4mb1_coal2", },
		{ name = "copperore", rarity = "common", prop = "k4mb1_copperore2", },
		{ name = "ironore", rarity = "common", prop = "k4mb1_ironore2", },
		{ name = "metalscrap", rarity = "common", prop = "k4mb1_leadore2" },
		{ name = "goldore", rarity = "rare", prop = "k4mb1_goldore2" },
		-- { name = "silverore", rarity = "rare", prop = "k4mb1_tinore2" },
		{ name = "uncut_ruby", rarity = "ultra_rare", prop = "k4mb1_crystalred" },
		{ name = "uncut_emerald", rarity = "ultra_rare", prop = "k4mb1_crystalgreen" },
		{ name = "uncut_diamond", rarity = "ultra_rare", prop = "k4mb1_diamond" },
		{ name = "uncut_sapphire", rarity = "ultra_rare", prop = "k4mb1_crystalblue" },
		{ name = "stone", rarity = "common", prop = "cs_x_rubweec" },
	},

------------------------------------------------------------
--Mining Store Items
	Items = {
		label = "Mining Store",  slots = 9,
		items = {
			-- { name = "water_bottle", price = 2, amount = 100, info = {}, type = "item", slot = 1, },
			-- { name = "sandwich", price = 2, amount = 250, info = {}, type = "item", slot = 2, },
			{ name = "bandage", price = 25, amount = 100, info = {}, type = "item", slot = 3, },
			{ name = "weapon_flashlight", price = 75, amount = 100, info = {}, type = "item", slot = 4, },
			{ name = "goldpan", price = 25, amount = 100, info = {}, type = "item", slot = 5, },
			{ name = "pickaxe",	price = 100, amount = 100, info = {}, type = "item", slot = 6, },
			{ name = "miningdrill",	price = 10000, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "mininglaser",	price = 60000, amount = 5, info = {}, type = "item", slot = 8, },
			{ name = "drillbit", price = 0, amount = 100, info = {}, type = "item", slot = 9, },
		},
	},

	Levels = {
		[1] = 500,   -- Level 0 → 1 to use a mining drill
		[2] = 1500, -- Level 2 to use a laser drill
		[3] = 3000, -- Level 3 adds +1 stone to mining
	}
}

function locale(section, string)
	if not string then
		-- print(section, "string is nil")
	end
    if not Config.Lan or Config.Lan == "" then return print("Error, no langauge set") end
    local localTable = Loc[Config.Lan]
    if not localTable then return "Locale Table Not Found" end
    if not localTable[section] then return "["..section.."] Invalid" end
    if not localTable[section][string] then return "["..string.."] Invalid" end
    return localTable[section][string]
end