cfg.datacrack = {
    notification = "Press ~INPUT_FRONTEND_RDOWN~ when the highlighted block has the red line passing through it. Lock all blocks in place to successfully hack the terminal.",
    keys = { -- Keys
        exit = 202,
        confirm = 191,
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
            text = "Confirm",
        },
    },
}

--[[ HOW TO USE
    TriggerEvent("MINIGAME:DATACRACK_C",{datacrack_amount = 10,difficulty = "easy"},function(success)
        print(success)
    end)

    datacrack_amount : Min 1 | Max 10
    difficulty : "easy" "medium" "hard" "veryhard" "extreme"
]]