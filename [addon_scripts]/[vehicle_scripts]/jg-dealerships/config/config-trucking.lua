TruckingConfig = {}

-- Truck model to spawn (driver's cab)
TruckingConfig.TruckModel = "gstphan2" -- Can also try: "phantom", "packer, gstphan2

-- Cargo/trailer model to attach
TruckingConfig.TrailerSmallVehicle = "DYNAMIC_TR2" -- Vehicle transporter trailer. Can also try: "tr4", "trailers2", "trailers3"
TruckingConfig.TrailerLargeVehicle = "docktrailer"

-- Vehicle properties (optional - customize truck/cargo appearance)
-- These follow the same format as vehicle properties in purchases
-- Examples: colour (hex code), mods, livery, etc.
TruckingConfig.TruckProperties = {
  colour = "#a671fe" -- Optional: custom color
}

TruckingConfig.CargoProperties = {
  colour = "#ffffff" -- Optional: custom color
}

-- Marker settings
TruckingConfig.Markers = {
  spawn = {
    type = 0, -- Down cone
    size = 0.5,
    color = {r = 166, g = 113, b = 254, a = 200},
    bobUpAndDown = true,
    faceCamera = false,
    rotate = false
  },
  pickup = {
    type = 0, -- Down cone
    size = 0.5,
    color = {r = 166, g = 113, b = 254, a = 200},
    bobUpAndDown = true,
    faceCamera = false,
    rotate = false
  },
  dropoff = {
    type = 1, -- Cylinder
    size = 3.0,
    color = {r = 166, g = 113, b = 254, a = 200},
    bobUpAndDown = false,
    faceCamera = false,
    rotate = false
  }
}

-- Trailer attachment settings
TruckingConfig.TrailerAttachment = {
  maxDistance = 3.0, -- Maximum distance to check for attachment
  maxAngle = 45.0, -- Maximum angle difference between truck and trailer
  requireFront = true -- Must be at front of trailer to attach
}

-- Blip settings
TruckingConfig.Blips = {
  spawn = {
    sprite = 477, -- Truck icon
    color = 50, -- Orange
    scale = 1.0,
    label = "Truck Spawn"
  },
  pickup = {
    sprite = 478, -- Trailer icon
    color = 50, -- Orange
    scale = 1.0,
    label = "Cargo Pickup"
  },
  dropoff = {
    sprite = 50, -- Garage icon
    color = 50, -- Orange
    scale = 1.0,
    label = "Delivery Point"
  }
}

TruckingConfig.PickupLocations = {
  {
    name = "Elysian Island",
    coords = vector4(1200.46, -3238.60, 5.79, 0.00),
    blipColor = 50
  },
  {
    name = "Elysian Island",
    coords = vector4(1054.20, -3154.57, 5.90, 180.00),
    blipColor = 50
  },
  {
    name = "Port Container Yard",
    coords = vector4(863.25, -2927.89, 5.90, 270.00),
    blipColor = 50
  },
  {
    name = "Terminal - Freight Depot",
    coords = vector4(804.98, -2911.98, 6.00, 270.00),
    blipColor = 50
  },
  {
    name = "Cypress Flats - RON Depot",
    coords = vec4(630.34, -2748.96, 6.1, 304.89),
    blipColor = 5
  },
  {
    name = "Cypress Flats - Industrial Park",
    coords = vector4(878.57, -2178.94, 30.52, 175.00),
    blipColor = 5
  },
  {
    name = "La Mesa - Logistics Center",
    coords = vector4(859.36, -1710.13, 29.49, 355.61),
    blipColor = 5
  },
  {
    name = "El Burro Heights - Storage Facility",
    coords = vector4(1526.53, -2113.84, 76.77, 0.00),
    blipColor = 5
  },
  {
    name = "LSIA - Cargo Terminal",
    coords = vector4(-782.29, -2661.93, 13.99, 60.00),
    blipColor = 3
  },
  {
    name = "Grand Senora Desert - Logistics Hub",
    coords = vector4(1777.37, 3309.64, 41.22, 298.00),
    blipColor = 5
  },
  {
    name = "Sandy Shores - Industrial Yard",
    coords = vector4(2537.24, 2584.06, 37.94, 12.00),
    blipColor = 5
  },
  {
    name = "Paleto Cove - Shipping Yard",
    coords = vector4(-361.33, 6065.99, 31.50, 311.00),
    blipColor = 50
  },
  {
    name = "East Vinewood - Import Facility",
    coords = vector4(875.16, -953.48, 28.06, 2.00),
    blipColor = 5
  },
  {
    name = "El Burro Heights - Medical Center",
    coords = vector4(1170.7570, -1561.9835, 39.4941, 359.8946),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vector4(758.59, -1656.02, 31.38, 354.00),
    blipColor = 5
  },
  {
    name = "Elysian Island",
    coords = vec4(166.6, -3297.93, 5.22, 269.91),
    blipColor = 5
  },
  {
    name = "Elysian Island",
    coords = vec4(130.21, -3337.48, 5.36, 268.56),
    blipColor = 5
  },
  {
    name = "Elysian Island",
    coords = vec4(287.65, -3209.35, 5.16, 269.95),
    blipColor = 5
  },
  {
    name = "Elysian Island",
    coords = vec4(305.19, -3091.21, 5.17, 0.25),
    blipColor = 5
  },
  {
    name = "Elysian Island",
    coords = vec4(244.01, -2791.55, 5.34, 218.72),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vec4(607.76, -2997.28, 5.38, 179.53),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vec4(600.28, -2930.8, 5.38, 180.67),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vec4(892.76, -3155.41, 5.24, 179.6),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vec4(896.6, -3155.53, 5.24, 179.14),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vec4(900.82, -3155.85, 5.24, 180.41),
    blipColor = 5
  },
  {
    name = "Terminal - Freight Depot",
    coords = vec4(928.91, -3184.42, 5.24, 0.88),
    blipColor = 5
  },
  {
    name = "Buccaneer Way",
    coords = vec4(594.59, -2767.71, 5.39, 329.99),
    blipColor = 5
  },
  {
    name = "Buccaneer Way",
    coords = vec4(631.09, -2748.45, 5.44, 305.14),
    blipColor = 5
  },
  {
    name = "Sandy Trucking",
    coords = vec4(2684.6299, 3456.3008, 55.9365, 246.8334),
    blipColor = 5
  },
  {
    name = "Paleto Trucking",
    coords = vec4(-597.0650, 5732.9409, 36.1217, 175.3311),
    blipColor = 5
  },
  {
    name = "Paleto Construction",
    coords = vec4(65.0366, 6544.6826, 31.5778, 314.4080),
    blipColor = 5
  },
  {
    name = "Paleto Bay",
    coords = vec4(-26.7856, 6413.7285, 31.5738, 225.0378),
    blipColor = 5
  },
  {
    name = "Paleto Bay",
    coords = vec4(-145.8963, 6199.4956, 31.3272, 320.3282),
    blipColor = 5
  },
  {
    name = "Paleto Bay",
    coords = vec4(1688.05, 6401.83, 32.68, 257.69), --old coords vec4(1698.4716, 6398.3647, 32.5389, 253.9503),
    blipColor = 5
  },
  {
    name = "San Chianski Mountain Range",
    coords = vec4(2896.7922, 4382.6768, 50.3775, 292.1989),
    blipColor = 5
  },
}