Locales = {} -- edit translation in config/locales
Config = {}

Config.Logging = false -- creates logs files in sky_base/data/logs/sky_crashgame, only use when needed because of performace impact

Config.Game = {
    houseEdgePercentage = 12, -- how much players should lose on the long run
    maximumProfit = 70000, -- maximum profit a player can make per bet (-1 no limitation)
    maximumBet = 25500, -- max amount a player can bet
    -- Interval in seconds for how frequently the frontend should sync with the backend.
    -- Syncing is only necessary if the crash values at the end do not match the values in the game.
    -- If there is a mismatch, set a sync interval. Keep the interval as large as possible to minimize performance impact.
    -- Note: If your server performance is already optimized, syncing should not be needed.
    -- Ensure server performance is stable before relying on sync, as it can potentially degrade performance further.
    syncEachSeconds = 0,
}

--Lower ms / More Performance with NPCs instead of Marker
Config.Npc = {
    useNpc = true,
    modelOrHash = "s_m_m_highsec_01", --https://docs.fivem.net/docs/game-references/ped-models/
    heading = 150.0
}

Config.Marker = {
    useMarker = fa;se,
    marker = { 
        -- You can add all properties from here to customize the marker https://docs.fivem.net/natives/?_0x28477EC23D892089
        -- e.g. bobUpAndDown = true,
        type = 1,
        offset = vector(931.0237, 37.0460, 81.1046) -- offset from the location coords
    }
}

Config.Locations = {
    ["1"] = {
        title = "CASINO CRASH GAME",
        description = "The Higher the Bet the Higher your Win!",
        showBlip = true, --If true the Location will have an Blip
        blip = { --The Blip Settings
            name = "Play Crash",
            sprite = 272,
            color = 2
        },
        coords = {x = 960.12, y = 45.14, z = 80.00},
    }
}