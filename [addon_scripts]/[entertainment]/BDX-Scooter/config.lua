--------------------------------------
-- <!>--    BODHIX | STUDIO     --<!>--
--------------------------------------
--------------------------------------
-- <!>--      BMX | CAREER     --<!>--
--------------------------------------
-- Support & Feedback: https://discord.gg/PjN7AWqkpF

Config = {}

Config.Debug = false -- Enable Prints to check if you getting an error.
Config.ItemName = 'scooter' -- Name of the Item.
Config.Framework = "qb" -- Write your Framework: "qb" or "esx" or "vrp" or "custom". 
Config.Target = "ox" -- Write your Target System: "qb" or "ox" or "none".
Config.FrameworkResourceName = nil -- Fill only in case that your Framework resource folder isnt located in the Default directory.
Config.MaxSpeedKmh = 40 -- This does not really change that much unless you get a boost somehow.
Config.maxJumpHeigh = 5.0 -- We suggest not to mess to much with this (And yes, you can jump very high).
Config.maxFallSurvival = 30.0
Config.LoseConnectionDistance = 2.0 -- This is the distance from you to the skateboard (Don't mess with this, unless you know, what you are doing).
Config.MinimumSkateSpeed = 2.0
Config.MinGroundHeight = 1.0
Config.minimumSpeed = 1.0 -- Minimum km/h to perform a Trick.
Config.ActiveWhitelist = false 

Config.ConnectPlayer = 113 -- G

--TRICK KEYS
Config.BarSpin  = 24    --LEFT MOUSE BUTTON / RT
Config.Forward  = 252   --X / LT
Config.BriFlip  = 51    --E / DPAD RIGHT
Config.Knock    = 80    --R / B
Config.Inward   = 52    --Q / DPAD LEFT
Config.Superman = 23    --F / Y
Config.Tailwhip = 26    --C / RIGHT STICK
Config.NoHander = 20    --Z / DPAD DOWN

Config.Language = {
    Info = {
        ['controls'] = 'Press E to Pickup | Press G to Ride',
    },
    Scooter = {
        ['target'] = 'Save Scooter.',
        ['text'] = '[E] Save Scooter.'
    },
}


