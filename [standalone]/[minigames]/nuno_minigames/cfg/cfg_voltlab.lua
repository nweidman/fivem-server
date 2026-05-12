cfg.voltlab = {
    notification = "Press ~INPUT_FRONTEND_RDOWN~ to register the link and add it to the total.~n~Press ~INPUT_FRONTEND_RLEFT~ to go back a step.",
    keys = { -- Keys
        exit = 202,
        select = 191,
        unselect = 193,
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
            button = "~INPUT_FRONTEND_RLEFT~",
            text = "Unselect",
        },
        { -- 03
            position = 2,
            button = "~INPUT_FRONTEND_RDOWN~",
            text = "Select",
        },
        { -- 04
            position = 3,
            button = "~INPUT_FRONTEND_RIGHT~",
            text = "",
        },
        { -- 05
            position = 4,
            button = "~INPUT_FRONTEND_LEFT~",
            text = "",
        },
        { -- 06
            position = 5,
            button = "~INPUT_FRONTEND_DOWN~",
            text = "",
        },
        { -- 07
            position = 6,
            button = "~INPUT_FRONTEND_UP~",
            text = "Move Selector",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:VOLTLAB_C",{time = 300},function(success)
        print(success)
    end)

    time : Min 1 | Max 3600
]]