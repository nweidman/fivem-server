Config = {}

-- Integrations (recommended to leave as "auto")
Config.Framework = "Qbox" -- or "QBCore", "Qbox", "ESX"
Config.Inventory = "ox_inventory" -- or "ox_inventory", "qb-inventory", "esx_inventory", "codem-inventory", "qs-inventory"
Config.Notifications = "ox_lib" -- or "default", "ox_lib", "lation_ui", "ps-ui", "okokNotify", "nox_notify"
Config.ProgressBar = "ox-bar" -- or "ox-circle", "ox-bar", "lation_ui", "qb"
Config.SkillCheck = "ox" -- or "ox", "qb", "lation_ui"
Config.DrawText = "ox_lib" -- or "jg-textui", "ox_lib", "okokTextUI", "ps-ui", "lation_ui", "qb"
Config.SocietyBanking = "qb-management" -- or "okokBanking", "fd_banking", "Renewed-Banking", "tgg-banking", "qb-banking", "qb-management", "esx_addonaccount"
Config.Menus = "ox" -- or "ox", "lation_ui"

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Set to false to use built-in job system
Config.UseFrameworkJobs = true

-- Mechanic Tablet
Config.UseTabletCommand = false -- set to false to disable command
Config.TabletConnectionMaxDistance = 3.0

-- Shops
Config.Target = "ox_target" -- (shops/stashes only) "qb-target" or "ox_target"
Config.UseSocietyFund = true -- set to false to use player balance
Config.PlayerBalance = "bank" -- or "bank" or "cash"

-- Skill Bars
Config.UseSkillbars = false -- set to false to use progress bars instead of skill bars for installations
Config.ProgressBarDuration = 10000 -- if not using skill bars, this is the progress bar duration in ms (10000 = 10 seconds)
Config.MaximumSkillCheckAttempts = 3 -- How many times the player can attempt a skill check before the skill check fails
Config.SkillCheckDifficulty = { "easy", "easy", "easy", "easy", "easy" } -- for ox only
Config.SkillCheckInputs = { "w", "a", "s", "d" } -- for ox only

-- Servicing
Config.EnableVehicleServicing = false
Config.ServiceRequiredThreshold = 90 -- [%] if any of the servicable parts hit this %, it will flag that the vehicle needs servicing 
Config.ServicingBlacklist = {
  "pbike", "bll1rb", "bll2rb", "bll3rb", "bll4rb", "bll5rb", "bll6rb", "bll7rb", "ll3bb", "ll4bb", "ll5bb", "ll6bb", "ll7bb", "markedvigerorb", "markedgauntletrb", "spnsbjv", "sidecarh", "pdbf400rb", "bcat", "bpunrumporb", "pbus", "apoliceu9", "apoliceu15", "apoliceub", "apoliceu7", "apoliceu6", "umkomodarb", "2vd_ahelion", "2vd_hakuchou", "2vd_vcaracara3", "umhellfire1bb", "gtfminivan", "swatvanr2", "pdpantoj", "Rebla_killer", "spvdjv", "f140rpd", "204sLEOSentinelCoupe", "stdunm", "umcs21bb", "rrseminalhawkxz", "rrkurumaxzm" -- Vehicles that are excluded from servicing damage
}

-- Nitrous
Config.NitrousScreenEffects = true
Config.NitrousRearLightTrails = true -- Only really visible at night
Config.NitrousPowerIncreaseMult = 1.5
Config.NitrousDefaultKeyMapping = "RMENU"
Config.NitrousMaxBottlesPerVehicle = 3 -- The UI can't really handle more than 7, more than that would be unrealistic anyway
Config.NitrousBottleDuration = 10 -- [in seconds] How long a nitrous tank lasts
Config.NitrousBottleCooldown = 5 -- [in seconds] How long until player can start using the next bottle
Config.NitrousPurgeDrainRate = 0.1 -- purging drains bottle only 10% as fast as actually boosting - set to 1 to drain at the same rate 

-- Stancing
Config.StanceMinSuspensionHeight = -0.3
Config.StanceMaxSuspensionHeight = 0.3
Config.StanceMinCamber = 0.0
Config.StanceMaxCamber = 0.5
Config.StanceMinTrackWidth = 0.5
Config.StanceMaxTrackWidth = 1.25
Config.StanceNearbyVehiclesFreqMs = 500

-- Repairs
Config.AllowFixingAtOwnedMechanicsIfNoOneOnDuty = false
Config.DuctTapeMinimumEngineHealth = 50.0
Config.DuctTapeEngineHealthIncrease = 150.0

-- Tuning
Config.TuningGiveInstalledItemBackOnRemoval = true

-- Locations
Config.UseCarLiftPrompt = "[E] Use car lift"
Config.UseCarLiftKey = 38
Config.CustomiseVehiclePrompt = "[E] Customise vehicle"
Config.CustomiseVehicleKey = 38

-- Update vehicle props whenever they are changed [probably should not touch]
-- You can set to false to leave saving any usual props vehicle changes such as
-- GTA performance, cosmetic, colours, wheels, etc to the garage or other scripts
-- that persist the props data to the database. Additional data from this script,
-- such as engine swaps, servicing etc is not affected as it's saved differently
Config.UpdatePropsOnChange = true

-- Stops vehicles from immediately going to redline, for a slightly more realistic feel and
-- reduced liklihood of wheelspin. Can make vehicle launch (slightly) slower.
-- No effect on electric vehicles!
-- May not work immediately for all vehicles; see: https://docs.jgscripts.com/mechanic/manual-transmissions-and-smooth-first-gear#smooth-first-gear
Config.SmoothFirstGear = false

-- If using a manual gearbox, show a notification with key binds when high RPMs 
-- have been detected for too long
Config.ManualHighRPMNotifications = true

-- Misc
Config.UniqueBlips = true
Config.ModsPricesAsPercentageOfVehicleValue = false -- Enable pricing tuning items as % of vehicle value - it tries jg-dealerships, then QBShared, then the vehicles meta file automagically for pricing data
Config.AdminsHaveEmployeePermissions = false -- admins can use tablet & interact with mechanics like an owner
Config.MechanicEmployeesCanSelfServiceMods = false -- set to true to allow mechanic employees to bypass the "place order" system at their own mechanic
Config.FullRepairAdminCommand = "fix"
Config.MechanicAdminCommand = "mechanicadmin"
Config.ChangePlateDuringPreview = "PREVIEW"
Config.RequireManagementForOrderDeletion = false 
Config.UseCustomNamesInTuningMenu = false
Config.DisableNoPaymentOptionForEmployees = false

-- Mechanic Locations
Config.MechanicLocations = {
  repair = {
    type = "self-service",
    logo = "selfrepair.png", -- logos go in /logos
    locations = {
      {
        coords = vector3(442.23, -1008.97, 24.45), --MRPD
        size = 7.0,
        showBlip = false,
      },
      {
        coords = vector3(338.43, -629.28, 22.54), --Pillbox
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(1859.4189, 3706.0720, 33.7418), -- Sandy PD
        size = 7.0,
        showBlip = false,
      },
      {
        coords = vector3(360.47, -1614.84, 29.28), -- Davis
        size = 7.0,
        showBlip = false,
      }
    },
    blip = {
      id = 446,
      color = 47,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 5000, percentVehVal = 0.01 },
      performance      = { enabled = false, price = 4000, percentVehVal = 0.01, priceMult = 1.0 },
      cosmetics        = { enabled = true, price = 1000, percentVehVal = 0.01, priceMult = 0.0 },
      stance           = { enabled = false, price = 500, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 500, percentVehVal = 0.01 },
      wheels           = { enabled = false, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
      neonLights       = { enabled = false, price = 500, percentVehVal = 0.01 },
      headlights       = { enabled = false, price = 500, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = false, price = 500, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = false, price = 500, percentVehVal = 0.01 },
      extras           = { enabled = true, price = 1000, percentVehVal = 0.01 }
    },
  },
  CCM = {
    type = "owned",
    job = "ccm",
    jobManagementRanks = {5},
    logo = "bennys.png",
    commission = 50, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(-336.1616, -1343.3068, 31.4775),
        size = 5.0,
        showBlip = true,
      },
      {
        coords = vector3(-330.6529, -1343.1716, 31.4778),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-332.4239, -1367.6736, 31.5098),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-340.0099, -1367.6893, 31.5077),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-347.6617, -1367.5890, 31.5094),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-342.1448, -1342.8951, 31.4550),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-349.5047, -1336.3531, 31.4823),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-360.0404, -1355.6694, 32.2356),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-344.3614, -1259.0277, 31.4699),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-355.7512, -1354.8260, 31.4865),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-348.2265, -1355.0767, 31.4549),
        size = 5.0,
        showBlip = false,
      }
      -- {
      --   coords = vector3(-324.2, -132.0, 38.54),
      --   size = 3.0,
      --   showBlip = false,
      --   employeeOnly = true,
      -- }
    },
    blip = {
      id = 446,
      color = 1,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 2500, percentVehVal = 1.0 },
      performance      = { enabled = true, price = 3000, percentVehVal = 0.00, priceMult = 1.0 },
      cosmetics        = { enabled = true, price = 1000, percentVehVal = 0.00, priceMult = 0.0 },
      stance           = { enabled = false, price = 500, percentVehVal = 0.00 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.00 },
      wheels           = { enabled = false, price = 1000, percentVehVal = 0.00, priceMult = 0.0 },
      neonLights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      headlights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      tyreSmoke        = { enabled = true, price = 2000, percentVehVal = 0.00 },
      bulletproofTyres = { enabled = false, price = 500, percentVehVal = 0.00 },
      extras           = { enabled = true, price = 1000, percentVehVal = 0.00 }
    },
    tuning = {
      engineSwaps      = { enabled = true, requiresItem = true },
      drivetrains      = { enabled = false, requiresItem = true },
      turbocharging    = { enabled = true, requiresItem = true },
      tyres            = { enabled = false, requiresItem = true },
      brakes           = { enabled = true, requiresItem = true },
      driftTuning      = { enabled = false, requiresItem = true },
      gearboxes        = { enabled = false, requiresItem = true },
    },
  },
  eastside = {
    type = "owned",
    job = "esm",
    jobManagementRanks = {5},
    logo = "eastside.png",
    commission = 50, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(1146.6711, -783.7728, 57.6703),
        size = 5.0,
        showBlip = true,
      },
      {
        coords = vector3(1151.9292, -783.5634, 57.6702),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(1157.3564, -783.4703, 57.6704),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(1158.1177, -792.4976, 57.6501),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(1141.3815, -784.3004, 57.6516),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(1139.4237, -802.5362, 57.5964),
        size = 5.0,
        showBlip = false,
      }
      -- {
      --   coords = vector3(-324.2, -132.0, 38.54),
      --   size = 3.0,
      --   showBlip = false,
      --   employeeOnly = true,
      -- }
    },
    blip = {
      id = 446,
      color = 24,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 2500, percentVehVal = 1.0 },
      performance      = { enabled = true, price = 3000, percentVehVal = 0.00, priceMult = 1.0 },
      cosmetics        = { enabled = true, price = 1000, percentVehVal = 0.00, priceMult = 0.0 },
      stance           = { enabled = false, price = 500, percentVehVal = 0.00 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.00 },
      wheels           = { enabled = false, price = 1000, percentVehVal = 0.00, priceMult = 0.0 },
      neonLights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      headlights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      tyreSmoke        = { enabled = true, price = 2000, percentVehVal = 0.00 },
      bulletproofTyres = { enabled = false, price = 500, percentVehVal = 0.00 },
      extras           = { enabled = true, price = 1000, percentVehVal = 0.00 }
    },
    tuning = {
      engineSwaps      = { enabled = true, requiresItem = true },
      drivetrains      = { enabled = false, requiresItem = true },
      turbocharging    = { enabled = true, requiresItem = true },
      tyres            = { enabled = false, requiresItem = true },
      brakes           = { enabled = true, requiresItem = true },
      driftTuning      = { enabled = false, requiresItem = true },
      gearboxes        = { enabled = false, requiresItem = true },
    },
  },
  stance = {
    type = "owned",
    job = "stance",
    jobManagementRanks = {5},
    logo = "stance.png",
    commission = 50, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(-3076.2109, 440.8760, 6.9733),
        size = 5.0,
        showBlip = true,
      },
      {
        coords = vector3(-3079.3994, 434.9083, 6.9734),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-3082.2937, 428.6304, 6.9734),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-3072.1067, 416.5412, 6.9730),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-3085.9231, 423.4853, 6.9926),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-3074.0964, 447.2949, 6.9732),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-3124.0444, 488.6929, -0.1629),
        size = 10.0,
        showBlip = false,
        employeeOnly = false,
      }
    },
    blip = {
      id = 446,
      color = 1,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = false, price = 500, percentVehVal = 1.0 },
      performance      = { enabled = false, price = 4000, percentVehVal = 0.01, priceMult = 1.0 },
      cosmetics        = { enabled = true, price = 1000, percentVehVal = 0.01, priceMult = 0.0 },
      stance           = { enabled = true, price = 20000, percentVehVal = 0.00 },
      respray          = { enabled = true, price = 2000, percentVehVal = 0.00 },
      wheels           = { enabled = true, price = 10000, percentVehVal = 0.00, priceMult = 0.0 },
      neonLights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      headlights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      tyreSmoke        = { enabled = true, price = 2000, percentVehVal = 0.00 },
      bulletproofTyres = { enabled = false, price = 500, percentVehVal = 0.00 },
      extras           = { enabled = true, price = 1000, percentVehVal = 0.00 }
    },
    tuning = {
      engineSwaps      = { enabled = false, requiresItem = true },
      drivetrains      = { enabled = true, requiresItem = true },
      turbocharging    = { enabled = false, requiresItem = true },
      tyres            = { enabled = true, requiresItem = true },
      brakes           = { enabled = false, requiresItem = true },
      driftTuning      = { enabled = true, requiresItem = true },
      gearboxes        = { enabled = true, requiresItem = true },
    },
  },
  Seaton = {
    type = "owned",
    job = "ss",
    jobManagementRanks = {5},
    logo = "seaton.png",
    commission = 50, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(1711.5897, 3687.3743, 34.5232),
        size = 4.0,
        showBlip = true,
      },
      {
        coords = vector3(1708.7433, 3692.5454, 34.5232),
        size = 4.0,
        showBlip = false,
      },
      {
        coords = vector3(1705.7252, 3697.7480, 34.5232),
        size = 4.0,
        showBlip = false,
      },
      {
        coords = vector3(1702.7980, 3702.8130, 34.5606),
        size = 4.0,
        showBlip = false,
      },
      {
        coords = vector3(1697.9583, 3706.7903, 34.5232),
        size = 4.0,
        showBlip = false,
      },
      {
        coords = vector3(1709.6093, 3709.9868, 34.3545),
        size = 5.0,
        showBlip = false,
      }
    },
    blip = {
      id = 446,
      color = 47,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 2000, percentVehVal = 1.0 },
      performance      = { enabled = true, price = 2250, percentVehVal = 0.00, priceMult = 1.0 },
      cosmetics        = { enabled = true, price = 750, percentVehVal = 0.00, priceMult = 0.0 },
      stance           = { enabled = false, price = 375, percentVehVal = 0.00 },
      respray          = { enabled = true, price = 750, percentVehVal = 0.00 },
      wheels           = { enabled = false, price = 750, percentVehVal = 0.00, priceMult = 0.0 },
      neonLights       = { enabled = true, price = 750, percentVehVal = 0.00 },
      headlights       = { enabled = true, price = 750, percentVehVal = 0.00 },
      tyreSmoke        = { enabled = true, price = 1500, percentVehVal = 0.00 },
      bulletproofTyres = { enabled = false, price = 375, percentVehVal = 0.00 },
      extras           = { enabled = true, price = 750, percentVehVal = 0.00 }
    },
    tuning = {
      engineSwaps      = { enabled = true, requiresItem = true },
      drivetrains      = { enabled = false, requiresItem = true },
      turbocharging    = { enabled = true, requiresItem = true },
      tyres            = { enabled = false, requiresItem = true },
      brakes           = { enabled = true, requiresItem = true },
      driftTuning      = { enabled = false, requiresItem = true },
      gearboxes        = { enabled = false, requiresItem = true },
    },
  },
  lscustoms = {
    type = "owned",
    job = "lscustoms",
    jobManagementRanks = {5},
    logo = "ls_customs.png",
    commission = 50, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(-333.2405, -133.1533, 39.0098),
        size = 5.0,
        showBlip = true,
      },
      {
        coords = vector3(-313.5197, -134.5932, 39.0113),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-312.4599, -125.0396, 39.1900),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-317.0985, -145.3723, 39.0104),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-321.0547, -156.2715, 39.0104),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-339.9047, -161.3799, 39.0156),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-347.8287, -157.8588, 39.0095),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-359.4028, -123.7166, 38.6998),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-336.4735, -104.8939, 39.0285),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-345.2050, -102.3731, 39.0285),
        size = 5.0,
        showBlip = false,
      },
      {
        coords = vector3(-353.4214, -99.4402, 39.0285),
        size = 5.0,
        showBlip = false,
      }
      -- {
      --   coords = vector3(-324.2, -132.0, 38.54),
      --   size = 3.0,
      --   showBlip = false,
      --   employeeOnly = true,
      -- }
    },
    blip = {
      id = 446,
      color = 1,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 2500, percentVehVal = 1.0 },
      performance      = { enabled = true, price = 3000, percentVehVal = 0.00, priceMult = 1.0 },
      cosmetics        = { enabled = true, price = 1000, percentVehVal = 0.00, priceMult = 0.0 },
      stance           = { enabled = false, price = 500, percentVehVal = 0.00 },
      respray          = { enabled = true, price = 1000, percentVehVal = 0.00 },
      wheels           = { enabled = false, price = 1000, percentVehVal = 0.00, priceMult = 0.0 },
      neonLights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      headlights       = { enabled = true, price = 1000, percentVehVal = 0.00 },
      tyreSmoke        = { enabled = true, price = 2000, percentVehVal = 0.00 },
      bulletproofTyres = { enabled = false, price = 500, percentVehVal = 0.00 },
      extras           = { enabled = true, price = 1000, percentVehVal = 0.00 }
    },
    tuning = {
      engineSwaps      = { enabled = true, requiresItem = true },
      drivetrains      = { enabled = false, requiresItem = true },
      turbocharging    = { enabled = true, requiresItem = true },
      tyres            = { enabled = false, requiresItem = true },
      brakes           = { enabled = true, requiresItem = true },
      driftTuning      = { enabled = false, requiresItem = true },
      gearboxes        = { enabled = false, requiresItem = true },
    },
    -- carLifts = { -- only usable by employees
    --   vector4(-357.45, -114.17, 38.7, 339.89)
    -- },
    -- shops = {
    --   {
    --     name = "Servicing Supplies",
    --     coords = vector3(-345.54, -131.32, 39.01),
    --     size = 2.0,
    --     usePed = false,
    --     pedModel = "s_m_m_lathandy_01",
    --     marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    --     items = {
    --       { name = "engine_oil", label = "Engine Oil", price = 50 },
    --       { name = "tyre_replacement", label = "Tyre Replacement", price = 2500 },
    --       { name = "clutch_replacement", label = "Clutch Replacement", price = 3000 },
    --       { name = "air_filter", label = "Air Filter", price = 300 },
    --       { name = "spark_plug", label = "Spark Plug", price = 100 },
    --       { name = "suspension_parts", label = "Suspension Parts", price = 2500 },
    --       { name = "brakepad_replacement", label = "Brakepad Replacement", price = 1500 },
    --     },
    --   },
    --   {
    --     name = "Advanced Upgrades",
    --     coords = vector3(-343.79, -139.92, 39.01),
    --     size = 2.0,
    --     usePed = false,
    --     pedModel = "s_m_m_lathandy_01",
    --     marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    --     items = {
    --       { name = "turbocharger", label = "Turbo Charger", price = 25000 },
    --       { name = "v8_engine", label = "V8 Engine Upgrade", price = 40000 },
    --       { name = "ceramic_brakes", label = "Ceramic Brakes", price = 15000 },
    --     },
    --   }
    -- },
    -- stashes = {
    --   {
    --     name = "Parts Bin",
    --     coords = vector3(-339.24, -132.2, 39.01),
    --     size = 2.0,
    --     usePed = false,
    --     pedModel = "s_m_m_lathandy_01",
    --     marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    --     slots = 10,
    --     weight = 50000,
    --   },
    -- }
  }
}

-- Add electric vehicles to disable combustion engine features
-----------------------------------------------------------------------
-- PLEASE NOTE: In b3258 (Bottom Dollar Bounties) and newer, electric
-- vehicles are detected automatically, so this list is not used! 
Config.ElectricVehicles = {
  "Airtug",     "buffalo5",   "caddy",
  "Caddy2",     "caddy3",     "coureur",
  "cyclone",    "cyclone2",   "imorgon",
  "inductor",   "iwagen",     "khamelion",
  "metrotrain", "minitank",   "neon",
  "omnisegt",   "powersurge", "raiden",
  "rcbandito",  "surge",      "tezeract",
  "virtue",     "vivanite",   "voltic",
  "voltic2",
}

-- Nerd options
Config.DisableSound = false
Config.AutoRunSQL = true
Config.Debug = false