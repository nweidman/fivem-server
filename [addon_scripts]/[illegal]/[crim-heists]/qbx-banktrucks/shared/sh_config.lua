Config = {}

Config.MinCops = 2

Config.RobbedPlates = {}
Config.LootedTrucks = {}

Config.ExplosiveItem = 'explosive'
Config.ExplosionDelay = 15000 -- ms between planting and explosion

Config.BeepEnabled = true
Config.BeepStartMs = 12000      -- how long before explosion to start beeping (ms)
Config.BeepIntervalStart = 600 -- initial beep interval (ms)
Config.BeepIntervalEnd = 120   -- final beep interval (ms)
Config.BeepRange = 60.0       -- players within this range (meters) will hear beeps

Config.Minigame = {
    correctBlocks = 11, -- Number of correct blocks the player needs to click
    incorrectBlocks = 3, -- number of incorrect blocks after which the game will fail
    timetoShow = 5, -- time in secs for which the right blocks will be shown
    timetoLose = 28 -- maximum time after timetoshow expires for player to select the right blocks
}