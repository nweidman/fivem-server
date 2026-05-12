--------------------------------------
-- <!>--    BODHIX | STUDIO     --<!>--
--------------------------------------
--------------------------------------
-- <!>--     SKATE | CAREER     --<!>--
--------------------------------------
-- Support & Feedback: https://discord.gg/PjN7AWqkpF
-- How to: 
-- Use E to Pickup the Skateboard or put in your back 
-- Use G to Ride the Skateboard or put it in you Hand
-- For Tricks, set the Keys in Settings / Key Binding / FiveM
-- You need a the Trigger Event for custom inventory? Use this one: TriggerClientEvent('bodhix-skating:client:start', source, item)

Config = {}

Config.Debug = false -- True / False for Debug System

Config.Framework = "qb" -- Write your Framework: "qb" or "esx" or "vrp" or "custom". 

-- Settings
Config.ItemName = 'skateboard'
Config.Target = "ox" -- Write your Target System: "qb" or "ox" or "none".
Config.TextFont = 4
Config.FrameworkResourceName = nil
Config.MaxSpeedKmh = 40 -- This does not really change that much unless you get a boost somehow.
Config.maxJumpHeigh = 5.0 -- We suggest not to mess to much with this (And yes, you can jump very high).
Config.maxFallSurvival = 15.0
Config.BrokeFallGracePeriod = 5      -- First N trick/stunt falls are safe (no break chance)
Config.BrokeBaseChance = 5           -- Base % chance of break after grace period (only on AirStunt/Trick ragdolls)
Config.BrokeChanceIncrement = 1      -- % increase per additional trick/stunt fall
Config.LoseConnectionDistance = 2.0 -- This is the distance from you to the skateboard (Don't mess with this, unless you know, what you are doing).
Config.MinimumSkateSpeed = 2.0
Config.MinGroundHeight = 1.0

Config.PickupKey = 38
Config.ConnectPlayer = 113

Config.ModernBack = -0.30 -- Adjust if the Modern Skateboard doesn't fit when you put it in your back.
Config.ClassicBack = -0.32 -- Adjust if the Classic Skateboard doesn't fit when you put it in your back (DLC Only).

-- Trick Key Bindings (Leave '' to let players assign in FiveM Settings > Key Bindings)
Config.TrickKeys = {
    -- Air Pose (hold)
    ChristAir   = 29,  -- B / R1
    RocketAir   = 25,  -- RIGHT MOUSE BUTTON / LT
    Superman    = 159, -- 6 / NONE
    JudoAir     = 165, -- 5 / NONE

    -- Tricks (double = press once for single, hold for double spin)
    Shuvit      = 160, -- 3 / NONE
    KickFlip    = 80,  -- R / B
    HeelFlip    = 26,  -- C / R3,
    LaserFlip   = 23,  -- F / Y
    TreFlip     = 52,  -- Q / DPAD LEFT
    ForwardFlip = 164, -- 4 / NONE
    Impossible  = 14,  -- SCROLLWHEEL DOWN / DPAD RIGHT

    -- Manual (hold)
    Manual      = 132, -- LEFT CTRL / LEFT STICK
    NoseManual  = 19,  -- LEFT ALTZ / DPAD DOWN

    -- Floor (press once)
    StepBoost   = 131, -- LEFT SHIFT / X
    Coffin      = 171, -- CAPSLOCK / NONE

    -- Grind (hold)
    Grind       = 24,  -- LEFT MOUSE BUTTON / RT
}

Config.SpeedAlternative = false -- If true, the speed animation will change the style 

-- Grind Detection (wax paths are managed by BDX-Sport-Hub)
Config.GrindDetectDistance = 1.0    -- Detection radius from offset point (-0.5 Z below entity)

Config.Language = {
    Info = {
        ['controls'] = 'Press E to Pickup | Press G to Ride',
    },
}
