cfg.fingerprintclone = {
    notification = "Match the components to the target fingerprint. Press ~INPUT_FRONTEND_RUP~ to check if the match is correct.",
    keys = { -- Keys
        exit = 202,
        check = 192,
        right = 190,
        left = 189,
        down = 187,
        up = 188,
    },
    instructions = { -- Instructions
        { -- 01
            position = 0,
            button = "~INPUT_FRONTEND_CANCEL~",
            text = "Quit",
        },
        { -- 02
            position = 1,
            button = "~INPUT_FRONTEND_RUP~",
            text = "Run Check",
        },
        { -- 04
            position = 2,
            button = "~INPUT_FRONTEND_RIGHT~",
            text = "",
        },
        { -- 05
            position = 3,
            button = "~INPUT_FRONTEND_LEFT~",
            text = "",
        },
        { -- 06
            position = 4,
            button = "~INPUT_FRONTEND_DOWN~",
            text = "",
        },
        { -- 07
            position = 5,
            button = "~INPUT_FRONTEND_UP~",
            text = "Move Selector",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:FINGERPRINTCLONE_C",{time = 300,scramble_time = 60,fingerprint_amount = 4,fail_remove_time = 60},function(success)
        print(success)
    end)

    time : Min 1 | Max 3600
    scramble_time : Min 1 | Max 3600
    fingerprint_amount : Min 1 | Max 4
    fail_remove_time : No limit
]]