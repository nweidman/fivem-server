--------------------------------------
-- <!>--    BODHIX | STUDIO     --<!>--
--------------------------------------
--------------------------------------
-- <!>--   ROLLERS |  CAREER     --<!>--
--------------------------------------
-- Support & Feedback: https://discord.gg/PjN7AWqkpF

Config = {}

Config.Debug = false -- Enable Prints to check if you getting an error.
Config.ItemName = 'rollers' -- Name of the Item.
Config.Framework = "qb" -- Write your Framework: "qb" or "esx" or "vrp" or "custom". 
Config.Target = "none" -- Write your Target System: "qb" or "ox" or "none".
Config.FrameworkResourceName = nil -- Fill only in case that your Framework resource folder isnt located in the Default directory.
Config.MaxSpeedKmh = 40 -- This does not really change that much unless you get a boost somehow.
Config.maxJumpHeigh = 7.0 -- We suggest not to mess to much with this (And yes, you can jump very high).
Config.maxFallSurvival = 155.0
Config.LoseConnectionDistance = 2.0 -- This is the distance from you to the skateboard (Don't mess with this, unless you know, what you are doing).
Config.MinimumSkateSpeed = 2.0
Config.MinGroundHeight = 1.0
Config.minimumSpeed = 1.0 -- Minimum km/h to perform a Trick.
Config.ActiveWhitelist = false 

Config.ConnectPlayer = 113 -- G

--TRICK KEYS
Config.Stick     = 252   --X / LT
Config.Cross     = 80    --R / B
Config.Butterfly = 52    --Q / DPAD LEFT
Config.Rest      = 23    --F / Y

Config.Language = {
    Info = {
        ['controls'] = 'Press E to Pickup | Press G to Ride',
    },
    Roller = {
        ['target'] = 'Save Rollers.',
        ['text'] = '[E] Save Rollers.'
    },
}

