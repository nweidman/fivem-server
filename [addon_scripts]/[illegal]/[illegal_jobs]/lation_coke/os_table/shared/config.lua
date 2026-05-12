Config = {}

Config.AllowedGangs = {
  kage = true,
  milk = true,
}
Config.Tables = {
  {
    coords = vec3(977.92, -1840.63, 31.29),
    heading = 180.04,
    radius = 1.0,
    label = 'DMZ Table 1',
  },
  {
    coords = vec3(977.56, -1844.84, 31.29),
    heading = 179.5,
    radius = 1.0,
    label = 'DMZ Table 2',
  },
  {
    coords = vec3(1393.71, 1145.35, 114.34),
    heading = 256.54,
    radius = 1.0,
    label = 'Milk Table 1',
  },
  {
    coords = vec3(1392.13, 1144.62, 114.34),
    heading = 256.54,
    radius = 1.0,
    label = 'Milk Table 2',
  },
  {
    coords = vec3(1394.76, 1144.54, 114.34),
    heading = 179.73,
    radius = 1.0,
    label = 'Milk Table 3',
  },
}

Config.Items = {
  leaf = 'ls_coca_leaf',
  ground = 'ls_coca_ground',
  base_unf = 'ls_coca_base_unf',
  base = 'ls_coca_base',
  brick = 'ls_cocaine_brick',
  bag = 'purebagofcoke',
  empty_baggy = 'emptybaggy',
  cement = 'ls_cement',

  gasoline = { 'WEAPON_PETROLCAN', 'weapon_petrolcan' },
}

Config.StepTime = {
  processLeaves = 5,
  addGasoline   = 10,
  addCement     = 10,
  heatAndDry    = 540,
  packageBrick  = 30,
}

Config.ProgressBarSeconds = 5

Config.TimerText = {
  enabled = true,
  zOffset = 0.35,
  maxDistance = 3.0,
  showStepName = true,
}

Config.Anim = {
  processLeaves = { dict = 'amb@prop_human_bum_bin@base', name = 'base', flag = 49 },
  addGasoline   = { dict = 'amb@prop_human_bum_bin@base', name = 'base', flag = 49 },
  addCement     = { dict = 'amb@prop_human_bum_bin@base', name = 'base', flag = 49 },

  heatAndDry    = { dict = 'amb@world_human_stand_fire@male@base', name = 'base', flag = 49 },
  packageBrick  = { dict = 'amb@world_human_clipboard@male@base', name = 'base', flag = 49 },
}

Config.Purity = {
  startMin = 60,
  startMax = 95,

  gasolineRange = { min = 5, max = 9 },
  gasolinePenaltyMax = 25,

  cementRange = { min = 15, max = 19 },
  cementPenaltyMax = 25,
}

Config.Package = {
  min = 30,
  max = 100,
}

Config.Quantities = {
  leavesToGround = 20,
  groundToUnf = 4,
}
