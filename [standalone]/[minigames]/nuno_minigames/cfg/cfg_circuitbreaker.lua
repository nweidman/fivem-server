cfg.circuitbreaker = {
    notification = "Guide the signal to the exit port.\nUse ~INPUT_FRONTEND_RIGHT~ ~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_DOWN~ ~INPUT_FRONTEND_UP~ to change the signal direction.",
    keys = { -- Keys
        exit = 202,
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
        { -- 04
            position = 1,
            button = "~INPUT_FRONTEND_RIGHT~",
            text = "",
        },
        { -- 05
            position = 2,
            button = "~INPUT_FRONTEND_LEFT~",
            text = "",
        },
        { -- 06
            position = 3,
            button = "~INPUT_FRONTEND_DOWN~",
            text = "",
        },
        { -- 07
            position = 4,
            button = "~INPUT_FRONTEND_UP~",
            text = "Move",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:CIRCUITBREAKER_C",{level_amount = 6},function(success)
        print(success)
    end)

    level_amount : Min 1 | Max 6
]]