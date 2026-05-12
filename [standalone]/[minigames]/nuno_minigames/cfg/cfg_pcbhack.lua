cfg.pcbhack = {
    notification = "Arrange the circuit blocks to create a continuous line between the start and end points. Use ~INPUT_FRONTEND_RIGHT~ ~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_DOWN~ ~INPUT_FRONTEND_UP~ to select and move each block. Press ~INPUT_FRONTEND_RUP~ to test the circuit.",
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
            text = "Move",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:PCBHACK_C",{time = 300,level_amount = 5,fail_remove_time = 60},function(success)
        print(success)
    end)

    time : Min 1 | Max 3600
    level_amount : Min 1 | Max 10
    fail_remove_time : No Limit
]]