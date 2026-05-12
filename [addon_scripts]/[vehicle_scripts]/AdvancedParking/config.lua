
-- settings for the cleanup process
Cleanup = {
	-- all vehicles will be removed that haven't had an update for X hours
	--   set to nil to disable
	timeThreshold = 1,

	-- all vehicles with an engine health value equal to or below X will be removed
	--   set to nil to disable
	--   set to 0.0 for vehicles with a broken engine
	--   set to -3999.0 for exploded Vehicles
	engineThreshold = 0.0,

	-- all vehicles further than X meters away from players will be removed
	--   set to nil to disable
	distanceThreshold = 250,

	-- all submerged vehicles will be removed
	submergedVehicles = true,

	-- all vehicles inside these zones will be cleared
	zones = {
		--{ position = vector3(0, 0, 0), radius = 10.0 },
	},

	-- all vehicles inside these zones will be ignored and not cleared
	ignoredZones = {
		--{ position = vector3(0, 0, 0), radius = 10.0 },
	},

	-- plates listed here will be ignored and not removed (can include partial strings and not case sensitive)
	ignoredPlates = {
		--"XYZ 404 ",
		--"xyz 404",
		--"mech",
	},

	-- vehicle models listed here will be ignored and not removed
	ignoredModels = {
		--`blista`,
	},

	-- if ALL vehicles on the server should be affected, not only saved vehicles
	allVehicles = false,

	-- send (owned) vehicles to e.g. garage or impound on cleanup (see sv_integrations.lua for implementation)
	storeVehicles = true,

	-- cleanup on server start
	onServerStart = true,

	-- cleanup on script restart
	onScriptRestart = true,

	-- cleanup at set times (uses system time of the server) (day: 0-6 (Sunday-Saturday) (can be omitted); hour: 0-23; minute: 0-59)
	times = {
		{ hour = 7,  minute = 0 },  -- 7:00 AM
		{ hour = 15, minute = 0 },  -- 3:00 PM
		{ hour = 22, minute = 0 },  -- 10:00 PM
	},

	-- when players should be notified before a cleanup (in minutes)
	notificationTimes = { 5, 3, 2, 1 },

	-- notification to show players before removing vehicles (use %s as placeholder for time left in minutes)
	--   check cl_integrations.lua for custom notifications
	timeLeftNotification = "Vehicles will be deleted in %s minutes.",

	-- notification to show players when removing unused vehicles
	--   check cl_integrations.lua for custom notifications
	deleteNotification = "Removing vehicles..."
}

-- enable/disable certain extra values from being saved
SaveExtraValues = {
	-- convertible roof open/closed
	roofState		= true,

	-- plane/heli landing gear up/down
	landingGearUp	= true,

	-- vtol mode on e.g. HYDRA or AVENGER
	vtolMode		= true,

	-- small wings on e.g. AKULA
	stubWings		= true,

	-- boat anchor deployed/raised
	boatAnchor		= true
}

-- This changes the default routing bucket where the script will detect and spawn vehicles.
--   This option becomes obsolete when enabling multiBucketSupport.
--   Do not change unless you know what you are doing!
routingBucket = 0

-- Allows detecting and saving vehicles in all routing buckets.
--   Do not change unless you know what you are doing!
multiBucketSupport = false

-- when a warning should show on server side if pool size "CNetObjVehicle" is getting too full in an area
--   Higher values lead to earlier warning.
poolSizeWarningThreshold = 75

-- map corners - defines a rectangle across the map where vehicles are properly detected and saved
--   Needs to be expanded depending on maps outside its bounds (includes main island and Cayo Perico by default)
--   You will receive warnings in the server console if vehicles are out of bounds.
mapBottomLeft = vector2(-5500, -6000)
mapTopRight = vector2(6000, 8500)

-- Enable if you have problems with frozen vehicles.
--   Make sure to add fixFreezeEntity.lua to scripts that actually freeze vehicles.
forceUnfreezeVehicles = false

-- only save vehicles that are owned (only works with ESX or QB by default)
saveOnlyOwnedVehicles = true

-- If set to true, it will delete outside vehicles with the same plate on update
--   This is just a compatibility feature. You should still properly edit your scripts to prevent
--   duplicate vehicles in the first place.
preventDuplicateVehicles = false

-- comma separated list of vehicle classes that you do not want to save
-- ids can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
classesBlacklist = {
	21 --[[Trains]],
}

-- other vehicles that you do not want to save can be inserted here (use `MODELNAME` when you put 
-- them in there)
vehiclesBlacklist = {
	--`blista`,
	--`firetruk`,
	--`adder`,
}

-- any plates from vehicles you do not want to save, go here (not case sensitive and can use 
-- partial strings)
platesBlacklist = {
	--"XYZ 404 ",
	--"xyz 404",
	--"mech",
}

-- ignore these state bags from being saved altogether (can include partial strings)
ignoreStateBags = {}

-- prevent auto updates of these state bags and only save them on full update to database (can 
-- include partial strings)
preventStateBagAutoUpdate = {}
