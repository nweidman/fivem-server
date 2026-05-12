Config = {
    -- send paddle position to your opponent every 33ms (30x/s)
    -- lower the value for faster sync sync between paddles
    PositionSendRate = 33,
    -- maximum time the puck can stay on one side in ms
    PenaltyTime = 10000,
    -- block these while playing
    RestrictedControls = {37, 157, 159, 160, 161, 162, 163, 164, 165, 158, 101, 337, 53, 54, 47, 140, 141, 263, 264,
                          142, 143, 24, 257, 44, 282, 283, 284, 285, 69, 70, 114, 99, 100, 102, 22, 74, 68, 25, 36, 345,
                          346, 347, 91, 92},
    BounceStrength = 0.05, -- camera bounce effect
    DrawTableScore = true, -- draw actual match score for viewers on top tables
    Framework = 0, -- 0: Standalone (no bets), 1: ESX, 2: QBCore
    EnableBets = true,
    MinBet = 1000,
    MaxBet = 10000,
    BetType = 2, -- 1: Choose the lower stake for both (P1 choose 1k, P2 choose 2k, stake will be 1k for both), 2: both can set their own stakes
    WinMultiplier = 2, -- winner gets 2x the stake
    SpawnDistance = 30.0,
    UIFontID = 0, -- fontId (used in menus)
    UIFontName = nil, -- name of the font (used in scaleforms and notifications)
    NotifySystem = 1, -- 1: native notify, 2: okokNotify, 3: esx_notify, 4: qb_notify, 5: ox_notify
    -- Enable rcore_stats? (https://store.rcore.cz/package/6273968)
    Rcore_Stats = GetResourceState("rcore_stats") ~= "missing"
}

Objects = {{
    -- LSC
    pos = vector3(-342.6638, -129.6383, 38.0097),
    heading = 160.0
}, {
    -- ESM
    pos = vector3(1136.2283, -781.6107, 56.6319),
    heading = 231.2796
}, {
    -- Bennys
    pos = vector3(-333.7995, -1343.34, 35.2903),
    heading = 0.00
}, {
    -- White Widow
    pos = vector3(192.65, -254.48, 53.07),
    heading = 318.0
}, {
    -- Pillbox
    pos = vector3(355.8639, -586.5612, 42.1924),
    heading = 25.0
}}
Translation = {
    MATCH_SETTINGS = "Match Settings",
    SLOW = "Slow",
    MEDIUM = "Medium",
    FAST = "Fast",
    PUCK_SPEED = "Puck Speed",
    PUCK_SPEED_DESC = "The maximum speed of the puck.",
    MAX_SCORE = "Max Score",
    MAX_SCORE_DESC = "The match will end after someone reaches this amount of goals.",
    START = "Start",
    START_DESC = "Press this to save the rules & start the match.",
    LATENCY_HIGH = "Looks like your latency (%s) is too high. Your gameplay won't be that great.",
    LATENCY_NORMAL = "Your latency is %s",
    END_WINNER = "winner.",
    END_LOSER = "loser.",
    END_STATS_SAVES = "%s saves",
    END_STATS_SHOTS = "%s shots on goal",
    END_STATS_GOALS = "%s goals",
    END_STATS_PLAYER = "%s m player travel",
    END_STATS_PUCK = "%s m puck travel",
    END_STATS_TITLE = "Air Hockey",
    TIMERBAR_PENALTY = "PENALTY",
    WAITING_FOR_OP = "Waiting for opponent.",
    TABLE_USED = "This Air Hockey table is being used by someone else.",
    NOT_CLOSE_ENOGUH = "Seems like you're not close enough. Walk away and try again",
    NOT_ENOUGH_PLAYERS = "To start Air Hockey, ask one more player to come closer to the table.",
    WAITING_FOR_OP_TO_JOIN = "Waiting for your opponent to join the match.",
    PRESS_TO_PLAY = "Press ~INPUT_CONTEXT~ to play Air Hockey.",
    MATCH_CANCELLED = "Match Cancelled",
    MATCH_CANCELLED_DESC = "One of you have disconnected, or cancelled the match",
    STARTING = "Waiting for players...",
    WAITING_FOR_HOST = "%s is changing the rules",
    PRESS_TO_CONFIRM_BET = "Press Enter to confirm the bet %s on your win",
    READY = "Ready",
    READY_DESC = "Press Enter if you're ready to play.",
    WAITING_FOR_OP_READY = "Please wait until your opponent confirm they're ready.",
    BETTINGS_CAPT = "Bettings",
    BETTINGS_INFOPANEL = "STAKE: %s",
    BETTING_ACC = "Account",
    BETTING_STAKE = "Stake",
    BETTINGS_USE_ACC_DESC = "Use '%s' account to pay for the stake. Max: %s",
    -- Update 1.1.0
    PADDLE_SKIN = "Paddle Skin",
    PADDLE_SKIN_DESC = "Choose the skin of your paddle.",
    PUCK_SKIN = "Puck Skin",
    PUCK_SKIN_DESC = "Choose the skin of the puck.",
    COLOR_BLUE = "Blue",
    COLOR_GREEN = "Green",
    COLOR_RED = "Red",
    COLOR_ORANGE = "Orange",
    COLOR_GRAY = "Gray",
    COLOR_PURPLE = "Purple",
    COLOR_PINK = "Pink",
    COLOR_BLACK = "Black",
    
    Get = function(key)
        return Translation[key] or "Missing Translation: " .. key
    end
}
