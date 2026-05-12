Config = {}

Config.DespawnTime = 3 * 60

Config.GhostAlpha = 180

Config.TargetDistance = 2.0

Config.Show3DLabel = false
Config.LabelHeight = 1.05

Config.EnableTestCommands = false
Config.TestCommand = 'testghost'     -- /testghost [quit|headpopped|disconnected]
Config.ClearCommand = 'clearghosts'

Config.ReasonList = {
    ['game crashed'] = 'Head Popped',
    ['timed out'] = 'Head Popped',
    ['exiting'] = 'Quitting',
    ['you were kicked for being afk'] = 'Kicked for AFK',
    ['banned'] = 'Banned.',
    ['exploit'] = 'Exploiting',
    ['kicked'] = 'Kicked',
}
