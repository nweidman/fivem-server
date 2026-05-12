Config = {}

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "$%s" -- Format string for currency display. Use %s for the amount (e.g., "$%s" -> "$1,000", "%s coins" -> "1,000 coins")
Config.SpeedUnit = "mph" -- or "kph"
Config.DistanceUnit = "mi" -- or "km"

-- Framework & Integrations
Config.Framework = "Qbox" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "ps-fuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "qs-fuelstations", "none"
Config.VehicleKeys = "Renewed" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire", "none"
Config.Notifications = "ox_lib" -- or "default", "okokNotify", "ox_lib", "ps-ui"

-- Interactions
Config.InteractionMethod = "textui" -- or "textui", "target", "3dtextui", "radial"
Config.DrawText = "ox_lib" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.Target = "ox_target" -- or "ox_target"
Config.DrawText3d = "auto" -- or "sleepless_interact"
Config.RadialMenu = "auto" -- or "ox_lib"

-- Framework jobs
Config.UseFrameworkJobs = true

-- Text UI prompts
Config.OpenShowroomPrompt = "[E] Open Showroom"
Config.OpenShowroomKeyBind = 38
Config.ViewInShowroomPrompt = "[E] View in Showroom"
Config.ViewInShowroomKeyBind = 38
Config.OpenManagementPrompt = "[E] Dealership Management"
Config.OpenManagementKeyBind = 38
Config.SellVehiclePrompt = "[E] Sell Vehicle"
Config.SellVehicleKeyBind = 38

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Finance (to disable finance, you have to do it on a per-location basis in-game)
Config.FinancePayments = 7
Config.FinanceDownPayment = 0.5 -- 0.1 means 10%
Config.FinanceInterest = 0.10 -- 0.1 means 10%
Config.FinancePaymentInterval = 24 -- in hours
Config.FinancePaymentFailedHoursUntilRepo = 24 -- in hours
Config.MaxFinancedVehiclesPerPlayer = 1
Config.FinanceProcessOfflinePlayers = true -- Process finance payments for offline players (deducts from their bank in database)

-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- Vehicle purchases
Config.PlateFormat = "AAAA1111" -- https://docs.jgscripts.com/dealerships/plate-format
Config.HideVehicleStats = true

-- Test drives
Config.TestDrivePlate = "" -- This is a plate seed so it'll be random every time (read: https://docs.jgscripts.com/dealerships/plate-format)
Config.TestDriveTimeSeconds = 120
Config.TestDriveNotInBucket = true -- Set to true for everyone to see the test driven vehicle (player is instanced by default)
Config.DealershipMaxActiveTestDrives = 3 -- Maximum number of active test drives per dealership (direct test drives only)

-- Display vehicles (showroom)
Config.DisplayVehiclesPlate = "DEALER"
Config.DisplayVehiclesHidePurchasePrompt = true

-- Dealership stock purchases
Config.TruckingMissionForOrderDeliveries = true
Config.DealerPurchasePrice = 0.85 -- 0.8 = Dealers pay 80% of vehicle price
Config.VehicleOrderTime = 45 -- in mins
Config.ManagerCanChangePriceOfVehicles = false -- Managers can change the price of vehicles in the dealership

-- Blip format
Config.BlipNameFormat = "Dealership: %s"

Config.Categories = {
  planes = "Planes",
  sportsclassicsp = "PDM Sports Classics",
  sportsclassicsl = "Luxury Sports Classics",
  sedansp = "PDM Sedans",
  sedansl = "Luxury Sedans",
  sedansb = "Badlands Sedans",
  compacts = "Compacts",
  motorcycles = "Motorcycles",
  super = "Super",
  offroadp = "PDM Offroad",
  offroadl = "Luxury Offroad",
  offroadb = "Badlands Offroad",
  helicopters = "Helicopters",
  coupesp = "PDM Coupes",
  coupesl = "Luxury Coupes",
  muscle = "Muscle",
  boats = "Boats",
  vansp = "PDM Vans",
  vansb = "Badlands Vans",
  sportsl = "Luxury Sports",
  sportsp = "PDM Sports",
  suvsp = "PDM SUVs",
  suvsl = "Luxury SUVs",
  suvsb = "Badlands SUVs",
  commercialb = "Badlands Commercial",
  commerciall = "Luxury Commercial",
  cycles = "Cycles",
  industrial = "Industrial",
  drift = "Drift",
  truckl = "Luxury Truck",
  truckb = "Badlands Truck",
  drag = "Drag",
  mini = "Mini",
  restrictedl = "Luxury Restricted",
  restrictedb = "Badlands Restricted",
  trailer = "Trailer"
}

Config.DiscordDiscounts = {
  Enabled = true,

  Roles = {
    
  },

  MaxPercent = 30,
}

--
-- [Advanced]
-- Employee Permissions (only applicable if UseFrameworkJobs is NOT enabled)
-- These define what each employee role can do at owned dealerships
--
-- Permission constants:
--   ADMIN - Full access to everything (implicitly granted to owners and server admins)
--   MANAGE_EMPLOYEES - Hire/fire employees, change roles
--   MANAGE_INVENTORY - Order vehicles, manage stock, display vehicles, pricing
--   MANAGE_FINANCES - Bank account deposits/withdrawals, settings (commission, label)
--   SELL - Direct sales to players, test drives
--   DELIVER - Deliver trucking orders
--   VIEW_RECORDS - View sales history and order history
--
-- Note: When using framework jobs instead of the built-in employee system,
-- you'll map job grades to these same permission constants.
--
Config.EmployeePermissions = {
  ["Manager"] = {
    "ADMIN", -- Full access
  },
  ["Supervisor"] = {
    "MANAGE_INVENTORY",
    "VIEW_RECORDS",
    "SELL",
    "DELIVER",
  },
  ["Sales"] = {
    "SELL",
    "VIEW_RECORDS",
    "DELIVER",
  },
}

-- Commands
Config.MyFinanceCommand = "myfinance"
Config.DirectSaleCommand = "directsale"
Config.DealerAdminCommand = "dealeradmin"

-- Nerd options
Config.EntityStreamingDistance = 50.0 -- Distance in meters at which entities despawn/respawn
Config.RemoveGeneratorsAroundDealership = true
Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.Debug = false