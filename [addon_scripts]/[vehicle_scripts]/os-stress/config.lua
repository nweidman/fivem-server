local Config = {}

Config.Debug = false -- Loads of prints in F8 
Config.UseMPH = true -- Use MPH instead of KPH

Config.Stress = {
  chance = 0.05,

  minForShaking = 60,      -- shaking starts later so it’s less annoying

  minForSpeeding = 130,           -- when buckled (seatbelt OR harness)
  minForSpeedingUnbuckled = 90,   -- when unbuckled

  beltMultipliers = {
    unbuckled = 0.8,   -- slightly less than full stress
    buckled   = 0.4,   -- less stress when wearing seatbelt
    harness   = 0.25,  -- even less stress when harness on
  },

  whitelistedWeapons = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`,
  },

  -- Blur & effect intervals unchanged...
  blurIntensity = {
    [1] = {min = 50, max = 60, intensity = 1500},
    [2] = {min = 60, max = 70, intensity = 2000},
    [3] = {min = 70, max = 80, intensity = 2500},
    [4] = {min = 80, max = 90, intensity = 2700},
    [5] = {min = 90, max = 100, intensity = 3000},
  },
  effectInterval = {
    [1] = {min = 50, max = 60, timeout = math.random(50000, 60000)},
    [2] = {min = 60, max = 70, timeout = math.random(40000, 50000)},
    [3] = {min = 70, max = 80, timeout = math.random(30000, 40000)},
    [4] = {min = 80, max = 90, timeout = math.random(20000, 30000)},
    [5] = {min = 90, max = 100, timeout = math.random(15000, 20000)},
  },

  speedRanges = {
    -- { min = 80,  max = 90,  multiplier = 1.5 }, -- very low
    { min = 90,  max = 100, multiplier = 0.1 }, -- low
    { min = 101, max = 120, multiplier = 0.2 }, -- moderate
    { min = 121, max = 140, multiplier = 0.4 }, -- high
    { min = 150,            multiplier = 0.6 }, -- very high 
  },
}

Config.WhitelistedJobs = {'police', 'k9', 'ambulance'} -- Disable stress for whatever jobs you want

return Config