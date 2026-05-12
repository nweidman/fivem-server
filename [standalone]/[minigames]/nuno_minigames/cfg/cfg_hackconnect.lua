cfg.hackconnect = {
    notification = "Use ~INPUT_FRONTEND_RIGHT~ ~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_DOWN~ ~INPUT_FRONTEND_UP~ to select various onscreen IP addresses. Find the IP within the grid and press ~INPUT_FRONTEND_RDOWN~ once it's highlighted.",
    keys = { -- Keys
        exit = 202,
        check = 191,
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
            button = "~INPUT_FRONTEND_RDOWN~",
            text = "Check",
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
    TriggerEvent("MINIGAME:HACKCONNECT_C",{time = 300,lives = 7},function(success)
        --print(success)
    end)

    time : Min 1 | Max 3600
    lives : Min 1 | Max 7
]]