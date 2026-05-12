cfg.serverhack = {
    notification = "Connect the output node to the correct input node by pressing ~INPUT_FRONTEND_RDOWN~\nSelect a node using ~INPUT_FRONTEND_DOWN~ ~INPUT_FRONTEND_UP~ and press ~INPUT_FRONTEND_RDOWN~ to select the node.\nYou can press ~INPUT_FRONTEND_RLEFT~ to unselect a node.",
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
            button = "~INPUT_FRONTEND_RDOWN~",
            text = "Select",
        },
        { -- 03
            position = 2,
            button = "~INPUT_FRONTEND_RLEFT~",
            text = "Unselect",
        },
        { -- 04
            position = 3,
            button = "~INPUT_FRONTEND_DOWN~",
            text = "",
        },
        { -- 05
            position = 4,
            button = "~INPUT_FRONTEND_UP~",
            text = "Move",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:SERVERHACK_C",{time = 300},function(success)
        print(success)
    end)

    time : Min 1 | Max 3600
]]