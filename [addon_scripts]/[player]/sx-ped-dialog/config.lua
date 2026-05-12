Config = {}

Config.UseDistanceChecking = true
Config.InteractionKey = 38 -- E
Config.UseEveryTickText = true
-- I wouldn't go below 300ms, this wouldn't cause any issues
-- but it would cause a lot of unnecessary checks
Config.DistanceCheckInterval = 1000
Config.PlayerInvisibleWhileInDialog = false

Config.PedCam = {
  offset = {
    x = 0.0,
    y = 2.0,
    z = 1.0
  },
  fov = 50.0,
  pointZOffset = 0.0
}

Locales = {
  -- First %s is the ped name, second %s is the ped group
  ['ped_over_head'] = '%s [~b~%s~w~]',
  -- %s ped name
  ['interact_ped_over_head'] = 'Press  ~INPUT_CONTEXT~to interact with ~g~%s~w~',
  -- For those who are using custom fonts
  ['blip_text_component_string'] = '%s',
}