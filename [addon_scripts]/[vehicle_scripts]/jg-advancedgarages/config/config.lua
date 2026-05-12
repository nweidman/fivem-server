-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Framework & Integrations
Config.Framework = "Qbox" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "ps-fuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "none"
Config.VehicleKeys = "Renewed" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire" "none"
Config.Notifications = "ox_lib" -- or "default", "okokNotify", "ox_lib", "ps-ui"
Config.Banking = "okokBanking" -- or "qb-banking", "qb-management", "esx_addonaccount", "Renewed-Banking", "okokBanking", "fd_banking"
Config.Gangs = "auto" -- "qb-gangs", "rcore_gangs"

-- Draw text UI prompts (key binding control IDs here: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "ox_lib" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] Open Garage"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] Open Impound"
Config.InsertVehicleKeyBind = 47
Config.InsertVehiclePrompt = "[G] Store Vehicle"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] Exit Garage"

-- Target
Config.UseTarget = false
Config.Target = "ox_target" -- or "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"


-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- Vehicle Spawning & Storing
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true -- Save and apply body and engine damage when taking the vehicle out a garage
Config.AdvancedVehicleDamage = false -- use Kiminaze's VehicleDeformation
Config.SaveVehiclePropsOnInsert = true
Config.CheckVehicleModel = true -- Extra security

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- HIGHLY recommended that you set Config.DoNotSpawnInsideVehicle = false if you decide to enable this
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Vehicle Transfers
Config.GarageVehicleTransferCost = 2500 -- Cost to transfer between garages
Config.TransferHidePlayerNames = true
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = false
}
Config.DisableTransfersToUnregisteredGarages = false -- Potential hacking protection for vigilant servers - unregistered garages are ones created via events in third-party script integrations, such as housing scripts, and therefore could be prone to script kiddie attacks.

-- Prevent vehicle duplication
-- Learn more: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- Public & private garages
Config.JobGaragesAllowInfiniteVehicleSpawns = true -- Job garages
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- Gang garages
Config.GarageVehicleReturnCost = 1250 -- "towing" tax if not placed back in garage after server restart; or if destroyed or underwater while left out
Config.GarageVehicleReturnCostSocietyFund = false -- Job name of society fund to pay return fees into (optional)

-- Public Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = false
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Legion Square"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(212.3971, -798.1231, 30.8820),
    spawn = {vector4(218.0757, -783.8984, 30.2071, 338.7756), vector4(230.5303, -774.0589, 30.1370, 251.0766), vector4(236.0652, -791.2902, 29.9510, 162.6161), vector4(218.6377, -797.6064, 30.1714, 70.4942), vector4(226.0918, -799.8991, 30.0248, 250.0259), vector4(243.8016, -792.6534, 29.8479, 70.3593)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Pink Cage"] = {
    coords = vector3(275.6587, -336.8726, 44.9199),
    spawn = {vector4(291.1612, -337.0447, 44.9199, 160.8371), vector4(287.6644, -329.1575, 44.9199, 256.4652), vector4(298.7786, -333.1677, 44.9199, 68.9555), vector4(296.7800, -339.6822, 44.9199, 69.3653), vector4(285.9821, -335.9771, 44.9199, 251.8210), vector4(284.9462, -349.2488, 44.9931, 162.4517)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Maze Arena"] = {
    coords = vector3(-73.2472, -2004.1862, 18.2753),
    spawn = vector4(-72.5784, -1994.8110, 18.0170, 76.2710),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Mirror Park"] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 20,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Beach"] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Great Ocean Highway"] = {
    coords = vector3(-2968.7048, 368.2223, 14.7702),
    spawn = vector4(-2972.5562, 355.0794, 14.7733, 167.6478),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy South"] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(231.7855, 2602.7319, 45.5811, 355.9844),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy North"] = {
    coords = vector3(1657.5220, 3814.3130, 35.0124),
    spawn = vector4(1658.7549, 3826.4978, 34.7792, 133.6450),
    distance = 20,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Casino"] = {
    coords = vector3(901.0967, -55.2250, 78.7802),
    spawn = vector4(894.0852, -66.1870, 78.7641, 146.7938),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy Trucking"] = {
    coords = vector3(2739.0117, 3413.8572, 56.6479),
    spawn = vector4(2739.4927, 3423.4790, 56.5305, 247.3277),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Paleto Trucking"] = {
    coords = vector3(-610.5214, 5725.2974, 36.4029),
    spawn = vector4(-594.2477, 5710.5078, 37.0046, 192.8085),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grapeseed"] = {
    coords = vector3(1723.7020, 4702.8706, 42.5343),
    spawn = vector4(1713.9896, 4703.1299, 42.7612, 74.3545),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Paleto Bay"] = {
    coords = vector3(67.8387, 6394.8647, 31.2272),
    spawn = {vector4(57.7439, 6386.6323, 31.2322, 129.5776), vector4(66.5330, 6379.6606, 31.2399, 35.1566), vector4(63.3257, 6377.2490, 31.2399, 33.1286), vector4(60.4410, 6375.1182, 31.2399, 31.5451)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Hawick"] = {
    coords = vector3(-518.1727, 52.2375, 52.5799),
    spawn = {vector4(-520.1749, 65.9948, 51.9777, 84.3360), vector4(-534.2288, 57.9365, 51.9733, 263.9364), vector4(-521.1935, 56.1297, 51.9730, 83.0176), vector4(-525.9173, 38.7499, 51.9734, 19.3917)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  -- ["Auction"] = {
  --   coords = vector3(-1821.3374, -863.7871, 3.8701),
  --   spawn = vector4(-1821.2284, -896.1190, 2.7043, 209.6667),
  --   distance = 15,
  --   type = "car",
  --   hideBlip = false,
  --   blip = {
  --     id = 357,
  --     color = 0,
  --     scale = 0.7
  --   },
  --   hideMarkers = true,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  -- },
  -- ["Event"] = {
  --   coords = vector3(1408.6067, 1048.3434, 114.3326),
  --   spawn = vector4(1408.7034, 1056.9362, 114.3326, 266.9873),
  --   distance = 15,
  --   type = "car",
  --   hideBlip = false,
  --   blip = {
  --     id = 357,
  --     color = 0,
  --     scale = 0.7
  --   },
  --   hideMarkers = true,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  -- },
  --   ["Event2"] = {
  --   coords = vector3(-399.01, 1228.03, 325.64),
  --   spawn = vector4(-399.01, 1228.03, 325.64, 78.81),
  --   distance = 15,
  --   type = "car",
  --   hideBlip = false,
  --   blip = {
  --     id = 357,
  --     color = 0,
  --     scale = 0.7
  --   },
  --   hideMarkers = true,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  -- },
  ["Cargo Docks"] = {
    coords = vector3(1114.3125, -3142.2634, 5.9008),
    spawn = vector4(1116.3425, -3129.8162, 5.9008, 89.0309),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Marina"] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-799.4897, -1503.9557, 1.1143, 111.2166),
    distance = 20,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy Boathouse"] = {
    coords = vector3(1380.9330, 3774.8479, 29.9971),
    spawn = vector4(1363.5812, 3811.8057, 29.9170, 44.6254),
    distance = 30,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Docks Boathouse"] = {
    coords = vector3(13.4675, -2799.0725, 2.5259),
    spawn = vector4(-8.3789, -2799.5383, 3.3391, 184.9615),
    distance = 30,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Stance Docks"] = {
    coords = vector3(-3116.3713, 479.0316, 0.9916),
    spawn = vector4(-3131.2717, 493.6112, 2.1048, 164.4158),
    distance = 30,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Hangar"] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = "air",
    hideBlip = false,
    blip = {
      id = 359,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
    ["Sandy Airfield"] = {
    coords = vector3(1736.8344, 3288.6809, 41.1411),
    spawn = vector4(1710.2832, 3258.8774, 41.0726, 106.2970),
    distance = 20,
    type = "air",
    hideBlip = false,
    blip = {
      id = 359,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Private Garages
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 357,
  color = 0,
  scale = 0.7
}

-- Job Garages
Config.JobGarageShowBlips = false
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = false
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Luxury Autos"] = {
    coords = vector3(-848.1981, -272.9045, 39.5357),
    spawn = vector4(-848.1981, -272.9045, 39.5357, 194.9922),
    distance = 5,
    job = {"lux"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["LS Customs"] = {
    coords = vector3(-364.1167, -146.8849, 38.2496),
    spawn = vector4(-364.1167, -146.8849, 38.2496, 27.7302),
    distance = 5,
    job = {"lscustoms"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["SmoKing"] = {
    coords = vector3(433.9708, -1870.7854, 27.1080),
    spawn = vector4(438.0131, -1867.0974, 27.3132, 321.2818),
    distance = 5,
    job = {"smoking"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Highnotes"] = {
    coords = vector3(-850.44, -216.7, 37.53),
    spawn = vector4(-850.44, -216.7, 37.53, 299.56),
    distance = 5,
    job = {"highnote"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["PDM"] = {
    coords = vector3(-1046.8743, -1401.7457, 5.4258),
    spawn = vector4(-1052.9711, -1397.7496, 5.4258, 73.7511),
    distance = 5,
    job = {"pdm"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Badlands"] = {
    coords = vector3(-209.38, 6254.24, 31.49),
    spawn = vector4(-222.2, 6252.07, 31.49, 49.8),
    distance = 5,
    job = {"badlands"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Cruisin Craftsmen Mechanic"] = {
    coords = vector3(-355.9309, -1342.0309, 31.4500),
    spawn = vector4(-356.0046, -1330.1199, 31.4423, 1.7198),
    distance = 5,
    job = {"ccm"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Mirror Park Auto"] = {
    coords = vector3(1127.9023, -782.3428, 57.0010),
    spawn = vector4(1127.9023, -782.3428, 57.0010, 90.2215),
    distance = 5,
    job = {"esm"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Seaton"] = {
    coords = vector3(1721.03, 3669.83, 35.02),
    spawn = vector4(1721.03, 3669.83, 35.02, 286.23),
    distance = 5,
    job = {"ss"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Moo Moo Cafe"] = {
    coords = vector3(-608.66, -1059.37, 21.79),
    spawn = vector4(-615.6184, -1059.0813, 21.7892, 22.8240),
    distance = 5,
    job = {"moo"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Pillbox Garage"] = {
    coords = vector3(312.31, -651.09, 22.54),
    spawn = vector4(334.38, -636.07, 22.54, 59.17),
    distance = 5,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Sandy Garage"] = {
    coords = vector3(1730.7085, 3624.1907, 34.5832),
    spawn = vector4(1724.4912, 3620.6738, 34.5832, 208.6641),
    distance = 5,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Pillbox"] = {
    coords = vector3(297.5517, -604.0051, 43.3125),
    spawn = vector4(278.02, -605.41, 43.02, 94.65),
    distance = 5,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Stance"] = {
    coords = vector3(-3051.8345, 459.8304, 6.8274),
    spawn = vector4(-3053.6057, 453.1465, 6.7435, 199.6040),
    distance = 5,
    job = {"stance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Salt lab Smoothies"] = {
    coords = vector3(-3051.8345, 459.8304, 6.8274),
    spawn = vector4(-3053.6057, 453.1465, 6.7435, 199.6040),
    distance = 5,
    job = {"saltlabsmoothies"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Lily Pad"] = {
    coords = vector3(1126.7590, -656.9446, 56.7871),
    spawn = vector4(1137.1294, -686.5266, 56.7439, 200.1705),
    distance = 5,
    job = {"lilypad"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Bahama Mamas"] = {
    coords = vector3(-1404.16, -586.82, 30.32),
    spawn = vector4(-1404.2, -586.88, 30.32, 295.81),
    distance = 5,
    job = {"bahama"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Paradise Studios"] = {
    coords = vector3(-2681.99, -130.66, 11.32),
    spawn = vector4(-2681.99, -130.66, 11.32, 123.67),
    distance = 5,
    job = {"photo"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["MRPD"] = {
    coords = vector3(462.63, -1019.53, 24.45),
    spawn = {vector4(459.34, -1019.6, 24.45, 9.22), vector4(456.35, -1019.56, 24.45, 0.46), vector4(453.32, -1019.59, 24.45, 3.3), vector4(450.41, -1019.57, 24.45, 356.69), vector4(453.2613, -1019.8524, 23.9578, 1.2221), vector4(456.2030, -1019.9426, 23.9577, 0.1833), vector4(459.5104, -1019.7775, 23.9611, 0.8164), vector4(462.5836, -1019.9942, 23.9583, 359.0685), vector4(441.3793, -1001.8373, 23.9586, 180.3514), vector4(444.2751, -1001.8922, 23.9589, 180.3819), vector4(447.3457, -1001.9269, 23.9577, 180.3210), vector4(450.4225, -1002.0038, 23.9617, 179.8925)},
    distance = 5,
    job = {"police"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["DOJ"] = {
    coords = vec3(-1607.07, 173.35, 59.56),
    spawn = {vec4(-1607.69, 165.57, 59.64, 203.22), vec4(-1604.2, 167.15, 59.46, 203.65), vec4(-1600.45, 168.77, 59.26, 202.14)},
    distance = 5,
    job = {"doj"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
--[[   
  ["VPD"] = {
    coords = vector3(578.42, 10.33, 73.92),
    spawn = {vector4(577.45, 6.59, 73.92, 250.00), vector4(575.5046, 2.8043, 73.3198, 250.0434), vector4(574.0659, -1.6415, 73.3198, 249.4642)},
    distance = 5,
    job = {"police"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
 ]]  
  ["BCSO"] = {
    coords = vector3(1852.53, 3708.67, 33.75),
    spawn = {vector4(1859.9230, 3702.0076, 33.7479, 75.0750), vector4(1853.5492, 3697.6426, 33.7708, 76.7468), vector4(1846.5315, 3693.6946, 33.8611, 77.3714)},
    distance = 5,
    job = {"police"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Paleto PD"] = {
    coords = vector3(-463.43, 6039.67, 31.34),
    spawn = vector4(-470.2450, 6025.9912, 31.3406, 270.3003),
    distance = 5,
    job = {"police"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Davis PD"] = {
    coords = vector3(350.47, -1596.45, 29.28),
    spawn = {vector4(356.1138, -1601.8195, 29.2868, 340.6370), vector4(358.0817, -1583.1034, 29.2918, 231.7778), vector4(368.8392, -1591.9143, 29.2918, 49.8176)},
    distance = 5,
    job = {"police"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["News Personal"] = {
    coords = vec3(-556.84, -931.57, 23.84),
    spawn = {vec4(-556.2, -925.41, 23.86, 267.14), vec4(-556.15, -929.47, 23.86, 269.38), vec4(-556.61, -933.6, 23.85, 270.97)},
    distance = 5,
    job = {"news"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Towing Personal"] = {
    coords = vec3(428.06, -1159.26, 29.29),
    spawn = {vec4(431.86, -1154.95, 29.29, 266.12), vec4(431.85, -1157.75, 29.29, 265.48), vec4(431.66, -1161.01, 29.29, 261.75)},
    distance = 5,
    job = {"towing"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Towing Personal Paleto"] = {
    coords = vec3(145.82, 6602.3, 31.85),
    spawn = vec4(145.87, 6602.13, 31.85, 175.04),
    distance = 5,
    job = {"towing"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
    ["MRPD Air"] = {
    coords = vector3(457.45, -1014.77, 42.46),
    spawn = vector4(451.3, -1014.77, 42.84, 268.75),
    distance = 15,
    job = {"police"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "onx_polcon", -- spawn code for vehicle
        plate = "AIR1", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "pdheli", -- spawn code for vehicle
        plate = "AIR2", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [3] = {
        model = "polval",
        plate = "AIR3",
        minJobGrade = 6,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
--[[   
  ["VPD Air"] = {
    coords = vector3(603.9716, 4.7420, 101.2491),
    spawn = vector4(604.0204, 4.5707, 101.2491, 246.8630),
    distance = 15,
    job = {"police"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "polmav_killer", -- spawn code for vehicle
        plate = "AIR1", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 2,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "pdheli", -- spawn code for vehicle
        plate = "AIR2", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [3] = {
        model = "polval",
        plate = "AIR3",
        minJobGrade = 6,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [4] = {
        model = "2vd_supervolito",
        plate = "AIR4",
        minJobGrade = 6,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
 ]]  
  ["Davis Air"] = {
    coords = vector3(386.12, -1620.56, 38.02),
    spawn = vector4(386.1271, -1620.5669, 38.0265, 50.00),
    distance = 15,
    job = {"police"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "onx_polcon", -- spawn code for vehicle
        plate = "AIR1", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "pdheli", -- spawn code for vehicle
        plate = "AIR2", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [3] = {
        model = "polval",
        plate = "AIR3",
        minJobGrade = 6,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["Sandy Air"] = {
    coords = vector3(1818.7809, 3673.3230, 42.6629),
    spawn = vector4(1818.7773, 3673.3201, 43.1999, 120.5890),
    distance = 15,
    job = {"police"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "onx_polcon", -- spawn code for vehicle
        plate = "AIR1", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "pdheli", -- spawn code for vehicle
        plate = "AIR2", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [3] = {
        model = "polval",
        plate = "AIR3",
        minJobGrade = 6,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["Paleto Air"] = {
    coords = vector3(-465.6952, 5999.1929, 31.2577),
    spawn = vector4(-475.3095, 5988.5015, 31.3367, 314.6758),
    distance = 15,
    job = {"police"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "onx_polcon", -- spawn code for vehicle
        plate = "AIR1", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "pdheli", -- spawn code for vehicle
        plate = "AIR2", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 1, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [3] = {
        model = "polval",
        plate = "AIR3",
        minJobGrade = 6,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["PD City Boats"] = {
    coords = vector3(-1607.1874, -1183.5302, 0.6605),
    spawn = vector4(-1626.8807, -1186.9884, 2.3760, 95.1479),
    distance = 15,
    job = {"police"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "rboatbb", -- spawn code for vehicle
        plate = "PDSHARK", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "largeboat",
        plate = "PDWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["EMS City Boats"] = {
    coords = vector3(-1607.1874, -1183.5302, 0.6605),
    spawn = vector4(-1626.8807, -1186.9884, 2.3760, 95.1479),
    distance = 15,
    job = {"ambulance"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "largeboat2",
        plate = "EMSWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["PD Cargo Boats"] = {
    coords = vector3(1297.0066, -3326.0093, 5.9063),
    spawn = vector4(1314.0391, -3333.4299, 3.3989, 263.8688),
    distance = 15,
    job = {"police"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "rboatbb", -- spawn code for vehicle
        plate = "PDSHARK", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "largeboat",
        plate = "PDWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["EMS Cargo Boats"] = {
    coords = vector3(-1607.1874, -1183.5302, 0.6605),
    spawn = vector4(-1626.8807, -1186.9884, 2.3760, 95.1479),
    distance = 15,
    job = {"ambulance"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "largeboat2",
        plate = "EMSWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["PD Sandy Boats"] = {
    coords = vector3(1406.4943, 3836.6699, 31.1730),
    spawn = vector4(1372.3142, 3803.1831, 31.9400, 5.9298),
    distance = 15,
    job = {"police"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "rboatbb", -- spawn code for vehicle
        plate = "PDSHARK", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "largeboat",
        plate = "PDWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["EMS Sandy Boats"] = {
    coords = vector3(-1607.1874, -1183.5302, 0.6605),
    spawn = vector4(-1626.8807, -1186.9884, 2.3760, 95.1479),
    distance = 15,
    job = {"ambulance"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "largeboat2",
        plate = "EMSWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["PD Paleto Boats"] = {
    coords = vector3(-279.5573, 6627.7285, 5.3563),
    spawn = vector4(-315.2531, 6628.6133, 1.8784, 85.2646),
    distance = 25,
    job = {"police"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "rboatbb", -- spawn code for vehicle
        plate = "PDSHARK", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      },
      [2] = {
        model = "largeboat",
        plate = "PDWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["EMS Paleto Boats"] = {
    coords = vector3(-1607.1874, -1183.5302, 0.6605),
    spawn = vector4(-1626.8807, -1186.9884, 2.3760, 95.1479),
    distance = 15,
    job = {"ambulance"},
    type = "sea",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "largeboat2",
        plate = "EMSWHALE",
        minJobGrade = 0,
        livery = 1,
        extras = {1, 2, 7},
        maxMods = true
      }
    }
  },
  ["Pillbox"] = {
    coords = vector3(288.6394, -611.4294, 43.3869),
    spawn = vector4(291.3249, -612.0100, 43.3902, 39.3150),
    distance = 10,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "killer_ems5", -- spawn code for vehicle
        plate = false, -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["Pillbox Below"] = {
    coords = vector3(321.70, -638.71, 22.54),
    spawn = vector4(323.11, -632.88, 22.54, 64.56),
    distance = 10,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "killer_ems5", -- spawn code for vehicle
        plate = false, -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["Paleto Hospital"] = {
    coords = vector3(-264.5516, 6337.1406, 32.3982),
    spawn = vector4(-253.3675, 6347.0381, 32.4264, 222.9117),
    distance = 10,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "killer_ems5", -- spawn code for vehicle
        plate = false, -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["Sandy Hospital"] = {
    coords = vector3(1723.9347, 3621.7900, 34.5832),
    spawn = vector4(1723.9347, 3621.7900, 34.5832, 206.6688),
    distance = 10,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "killer_ems5", -- spawn code for vehicle
        plate = false, -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["Pillbox Air"] = {
    coords = vector3(352.1983, -588.4052, 74.1647),
    spawn = vector4(352.1983, -588.4052, 74.1647, 72.2626),
    distance = 10,
    job = {"ambulance"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "emsswift", -- spawn code for vehicle
        plate = "EMSAIR", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 2, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      },
      [2] = {
        model = "killer_ems1", -- spawn code for vehicle
        plate = "EMSAIR", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 2, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["Sandy Hospital Air"] = {
    coords = vector3(1784.1730, 3652.2109, 39.8780),
    spawn = vector4(1784.1730, 3652.2109, 39.8780, 306.8453),
    distance = 10,
    job = {"ambulance"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "emsswift", -- spawn code for vehicle
        plate = "EMSAIR", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 2, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      },
      [2] = {
        model = "killer_ems1", -- spawn code for vehicle
        plate = "EMSAIR", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 2, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["LS Customs Tow"] = {
    coords = vector3(-369.27, -108.38, 38.6839),
    spawn = vector4(-369.27, -108.38, 38.68, 66.59),
    distance = 10,
    job = {"lscustoms"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "LSC", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      }
    }
  },
  ["CCM Tow"] = {
    coords = vector3(-328.5799, -1301.2501, 31.4423),
    spawn = vector4(-328.5799, -1301.2501, 31.4423, 183.9203),
    distance = 10,
    job = {"ccm"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "CRUISIN", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 3,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      }
    }
  },
  ["Mirror Park Tow"] = {
    coords = vector3(1129.0585, -803.8231, 57.5769),
    spawn = vector4(1126.6323, -793.7835, 57.6015, 10.9272),
    distance = 10,
    job = {"esm"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "MPA", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      }
    }
  },
  ["Seaton Tow"] = {
    coords = vector3(1726.2562, 3682.3521, 34.7902),
    spawn = vector4(1726.2562, 3682.3521, 34.7902, 18.5041),
    distance = 10,
    job = {"ss"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "SEATON", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 2,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      }
    }
  },
  ["News Vans"] = {
    coords = vec3(-540.22, -910.79, 23.86),
    spawn = vec4(-540.22, -910.79, 23.86, 57.08),
    distance = 10,
    job = {"news"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "DB23SPRINTTCUST", -- spawn code for vehicle
        plate = "NEWSCREW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 1,
        extras = {},
        maxMods = false
      }
    }
  },
  ["News Air"] = {
    coords = vec3(-550.65, -899.52, 24.11),
    spawn = vec4(-550.65, -899.52, 24.11, 177.59),
    distance = 10,
    job = {"news"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "pdheli", -- spawn code for vehicle
        plate = "NEWSAIR", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 3, -- only available to players with set minimum grade
        livery = 2,
        extras = {1, 2, 7},
        maxMods = false
      }
    }
  },
  ["Camel Towing"] = {
    coords = vec3(412.59, -1159.37, 29.29),
    spawn = vec4(417.86, -1150.78, 29.29, 268.74),
    distance = 10,
    job = {"towing"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "CAMELTOW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 4,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      },
      [2] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "CAMELTOWW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 4,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      },
      [3] = {
        model = "fmltow", -- spawn code for vehicle
        plate = "CAMELTOW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      },
      [4] = {
        model = "fmltow", -- spawn code for vehicle
        plate = "CAMELTOWW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      },
      [5] = {
        model = "flatbed", -- spawn code for vehicle
        plate = "CAMELTOW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      },
      [6] = {
        model = "flatbed", -- spawn code for vehicle
        plate = "CAMELTOWW", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      }
    }
  },
  ["Camel Towing Paleto"] = {
    coords = vec3(106.67, 6606.87, 31.79),
    spawn = vec4(119.46, 6599.49, 32.01, 270.09),
    distance = 10,
    job = {"towing"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = false, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "CAMELTOE", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 4,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      },
      [2] = {
        model = "204sYosemiteTow", -- spawn code for vehicle
        plate = "CAMELTOWS", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 4,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = false
      },
      [3] = {
        model = "fmltow", -- spawn code for vehicle
        plate = "CAMELTOE", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      },
      [4] = {
        model = "fmltow", -- spawn code for vehicle
        plate = "CAMELTOWS", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      },
      [5] = {
        model = "flatbed", -- spawn code for vehicle
        plate = "CAMELTOE", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      },
      [6] = {
        model = "flatbed", -- spawn code for vehicle
        plate = "CAMELTOWS", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        livery = 0,
        extras = {},
        maxMods = false
      }
    }
  },
}

-- Gang Garages (QBCore/Qbox only by default)
Config.GangEnableCustomESXIntegration = false -- Set to true if you've added a custom system to cl/sv-functions.lua
Config.GangGarageShowBlips = true
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = false
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["House of Sins"] = {
    coords = vector3(-1791.58, 458.56, 128.31),
    spawn = vector4(-1796.04, 458.18, 128.31, 100.96),
    distance = 10,
    gang = {"hos"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Milk"] = {
    coords = vector3(1391.22, 1117.25, 114.82),
    spawn = vector4(1385.88, 1117.77, 114.73, 80.78),
    distance = 10,
    gang = {"milk"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Grimz"] = {
    coords = vector3(-687.71, -880.83, 24.5),
    spawn = vector4(-685.53, -886.73, 24.5, 222.42),
    distance = 10,
    gang = {"grimz"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Black Hand"] = {
    coords = vector3(-1920.26, 2046.26, 140.79),
    spawn = vector4(-1923.5, 2049.54, 140.83, 175.51),
    distance = 10,
    gang = {"blackhand"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Dead Mans Zyndicate"] = {
    coords = vector3(969.23, -1822.71, 31.1),
    spawn = vector4(964.61, -1822.37, 31.07, 359.63),
    distance = 10,
    gang = {"kage"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Mercy"] = {
    coords = vector3(-1846.32, -370.05, 49.22),
    spawn = vector4(-1853.73, -381.1, 48.44, 143.08),
    distance = 10,
    gang = {"mercy"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Ghost Syndicate"] = {
    coords = vector3(1422.55, -1503.99, 60.88),
    spawn = vector4(1421.63, -1506.65, 60.89, 165.08),
    distance = 10,
    gang = {"shadow"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  },
  ["Burning Suns MC"] = {
    coords = vector3(288.54, 6645.73, 29.77),
    spawn = vector4(288.1747, 6643.8271, 29.7632, 158.6393),
    distance = 10,
    gang = {"bsmc"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  }
}

-- Impound
Config.ImpoundCommand = "impound"
Config.ImpoundFeesSocietyFund = "police" -- Job name of society fund to pay impound fees into (optional)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 12, 24, 72, 168, 720} -- in hours
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ["City Impound"] = {
    coords = vector3(401.2830, -1632.0868, 29.2916),
    spawn = vector4(405.3085, -1642.8816, 29.2918, 230.4886),
    distance = 10,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy Impound"] = {
    coords = vector3(1865.8849, 3692.8733, 33.7713),
    spawn = vector4(1852.3163, 3683.7266, 33.8599, 295.7517),
    distance = 10,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["CRUSHER"] = {
    coords = vector3(-1680.4703, 62.7859, 64.0180),
    spawn = vector4(-1690.5137, 71.6066, 64.6460, 225.8917),
    distance = 10,
    type = "car",
    job = {"police"},
    hideBlip = true,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["PD Impound"] = {
    coords = vector3(483.85, -971.77, 27.38),
    spawn = vector4(485.63, -978.84, 27.46, 177.5),
    distance = 10,
    type = "car",
    job = {"police"},
    hideBlip = true,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Boat Impound"] = {
    coords = vector3(-848.8000, -1368.4200, 1.5996),
    spawn = vector4(-848.4589, -1362.5942, 0.9023, 117.2931),
    distance = 10,
    type = "boat",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Air Impound"] = {
    coords = vector3(-695.5600, -1451.1700, 4.9937),
    spawn = vector4(-725.0370, -1444.0575, 5.0005, 139.5401),
    distance = 10,
    type = "air",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Tow Impound"] = {
    coords = vec3(436.56, -1168.94, 29.29),
    spawn = vec4(437.89, -1161.52, 29.29, 357.58),
    distance = 10,
    type = "car",
    job = {"towing"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Tow Impound Paleto"] = {
    coords = vec3(140.12, 6635.96, 31.62),
    spawn = vec4(145.93, 6613.48, 31.81, 355.56),
    distance = 10,
    type = "car",
    job = {"towing"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
}

-- Garage Interior
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0), -- from
  vector4(227.96, -1006.96, -98.99, 0.0), -- to (this should be the entrance, or slightly further back from the entrance coords for a better final player transition)
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.000000, -984.000000, -99.410004, 118.000000),
  vector4(233.000000, -988.500000, -99.410004, 118.000000),
  vector4(233.000000, -993.000000, -99.410004, 118.000000),
  vector4(233.000000, -997.500000, -99.410004, 118.000000),
  vector4(233.000000, -1002.000000, -99.410004, 118.000000),
  vector4(223.600006, -979.000000, -99.410004, 235.199997),
  vector4(223.600006, -983.599976, -99.410004, 235.199997),
  vector4(223.600006, -988.200012, -99.410004, 235.199997),
  vector4(223.600006, -992.799988, -99.410004, 235.199997),
  vector4(223.600006, -997.400024, -99.410004, 235.199997),
  vector4(223.600006, -1002.000000, -99.410004, 235.199997),
}

-- Staff Commands
Config.ChangeVehiclePlate = "vehplate" -- admin only
Config.DeleteVehicleFromDB = "vehdel" -- admin only
Config.ReturnVehicleToGarage = "rv" -- admin only

-- Add your import vehicle's spawn name and desired label here for pretty vehicle names in the garage
-- This is mainly designed for ESX - if you are using QB, do this in shared!
Config.VehicleLabels = {
  ["spawnName"] = "Pretty Vehicle Label"
}

-- Block certain vehicles from being transferred to other players
Config.PlayerTransferBlacklist = {
  "spawnName"
}

Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = true
Config.__v3Config = true
Config.Debug = false