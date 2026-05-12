cfg.tacticalinput = {
    notification = "Use ~INPUT_SCRIPT_PAD_UP~ ~INPUT_SCRIPT_PAD_DOWN~ ~INPUT_SCRIPT_PAD_LEFT~ ~INPUT_SCRIPT_PAD_RIGHT~ and ~INPUT_SCRIPT_RIGHT_AXIS_X~ to succeed. Match each input to the desired direction shown on-screen.",
    keys = { -- Keys
        exit = 202,
        right = 235,
        left = 234,
        down = 233,
        up = 232,
    },
    instructions = { -- Instructions
        { -- 01
            position = 0,
            button = "~INPUT_FRONTEND_CANCEL~",
            text = "Quit",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:TACTICALINPUT_C",{level_amount = 10},function(success)
        print(success)
    end)

    level_amount : Min 1 | Max 10
]]