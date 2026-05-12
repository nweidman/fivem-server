cfg.memoryhack = {
    notification = "Memorize the final positions of the signal nodes then repeat the pattern. Press ~INPUT_FRONTEND_RDOWN~ to select the correct node.",
    keys = { -- Keys
        exit = 202,
        select = 191,
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
            button = "~INPUT_FRONTEND_RDOWN~",
            text = "Select",
        },
        { -- 06
            position = 2,
            button = "~INPUT_FRONTEND_DOWN~",
            text = "",
        },
        { -- 07
            position = 3,
            button = "~INPUT_FRONTEND_UP~",
            text = "Move Selector",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:MEMORYHACK_C",{time = 300,scramble_time = 60,digit_amount = 4,lives = 6},function(success)
        print(success)
    end)

    time : Min 1 | Max 3600
    scramble_time : Min 1 | Max 3600
    digit_amount : Min 1 | Max 4
    lives : Min 1 | Max 6
]]