return {
	{		-- MRPD
		coords = vec3(465.44, -999.33, 30.7),
		target = {
			loc = vec3(465.44, -999.33, 30.7),
			length = 1,
			width = 1,
			heading = 0,
			minZ = 30.0,
			maxZ = 31.09,
			label = 'Open Fridge'
		},
		name = 'mrpdfridge',
		label = 'Fridge',
		owner = false,
		slots = 50,
		weight = 10000000,
		groups = { ['police'] = 0 }
	},

	{		-- BCSO
		coords = vec3(1830.54, 3665.89, 38.73),
		target = {
			loc = vec3(1830.54, 3665.89, 38.73),
			length = 1,
			width = 1,
			heading = 205.6,
			minZ = 36.5,
			maxZ = 40.0,
			label = 'Open Fridge'
		},
		name = 'bcsofridge',
		label = 'Fridge',
		owner = false,
		slots = 50,
		weight = 1000000,
		groups = { ['police'] = 0 }
	},

	{		-- Davis
		coords = vec3(387.72, -1610.97, 29.78),
		target = {
			loc = vec3(387.72, -1610.97, 29.78),
			length = 1.0,
			width = 1.0,
			heading = 0,
			minZ = 28.0,
			maxZ = 30.09,
			label = 'Open Fridge'
		},
		name = 'davisfridge',
		label = 'Fridge',
		owner = false,
		slots = 50,
		weight = 1000000,
		groups = { ['police'] = 0 }
	},
	
	{		-- Pillbox
		coords = vec3(322.83, -594.23, 42.8),
		target = {
			loc = vec3(322.83, -594.23, 42.8),
			length = 2.0,
			width = 2.0,
			heading = 341.35,
			minZ = 42.0,
			maxZ = 44.5,
			label = 'Open Fridge'
		},
		name = 'emsfridge',
		label = 'Fridge',
		owner = false,
		slots = 50,
		weight = 1000000,
		groups = { ['ambulance'] = 0 }
	},

	{		-- The Black Hand Mafia (Red)
		coords = vec3(-1901.44, 2050.04, 135.98),
		target = {
			loc = vec3(-1901.44, 2050.04, 135.98),
			length = 2.0,
			width = 2.0,
			heading = 341.35,
			minZ = 42.0,
			maxZ = 44.5,
			label = 'Open Stash'
		},
		name = 'blackhandstash',
		label = 'The Black Hand',
		owner = false,
		slots = 80,
		weight = 1500000,
		groups = { ['blackhand'] = 0 }
	},

	{		-- Kage Cartel (Red)
		coords = vec3(972.16, -1832.4, 31.29),
		target = {
			loc = vec3(972.16, -1832.4, 31.29),
			length = 2.0,
			width = 2.0,
			heading = 341.35,
			minZ = 42.0,
			maxZ = 44.5,
			label = 'Open Stash'
		},
		name = 'kagestash',
		label = 'DMZ',
		owner = false,
		slots = 60,
		weight = 800000,
		groups = { ['kage'] = 0 }
	},

	{		-- Milk Cartel (Blue)
		coords = vec3(1394.5, 1150.02, 114.34),
		target = {
			loc = vec3(1394.5, 1150.02, 114.34),
			length = 2.0,
			width = 2.0,
			heading = 341.35,
			minZ = 42.0,
			maxZ = 44.5,
			label = 'Open Stash'
		},
		name = 'milkstash',
		label = 'Milk',
		owner = false,
		slots = 100,
		weight = 2000000,
		groups = { ['milk'] = 0 }
	},

	-- {
	-- 	coords = vec3(301.3, -600.23, 43.28),
	-- 	target = {
	-- 		loc = vec3(301.82, -600.99, 43.29),
	-- 		length = 0.6,
	-- 		width = 1.8,
	-- 		heading = 340,
	-- 		minZ = 43.34,
	-- 		maxZ = 44.74,
	-- 		label = 'Open personal locker'
	-- 	},
	-- 	name = 'emslocker',
	-- 	label = 'Personal Locker',
	-- 	owner = true,
	-- 	slots = 70,
	-- 	weight = 70000,
	-- 	groups = {['ambulance'] = 0}
	-- },
}
