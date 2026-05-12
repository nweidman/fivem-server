Config = {
    typingGame = {
        difficulty = {
            ['easy'] = 6,
            ['normal'] = 12,
            ['hard'] = 18,
        },
        duration = 20,
        initialSequences = {
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        }
    },
    timedLockpick = {
        speed = 600,
    },
    timedAction = {
        unlockCount = 3,
    },
    quickEvent = {
        difficulty = {
            ['easy'] = 1,
            ['normal'] = 3,
            ['hard'] = 5,
        },
        duration = 1,
        sequences = {
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        },
    },
    combinationLock = {
        difficulty = {
            ['easy'] = 1,
            ['normal'] = 3,
            ['hard'] = 5,
        },
        range = { 1, 360 },
    },
    buttonMashing = {
        decayRate = 5,
        incrementRate = 10,
    },
    angledLockpick = {
        difficulty = {
            ['easy'] = 1,
            ['normal'] = 3,
            ['hard'] = 5,
        },
        range = { 1, 360 },
    },
    fingerPrint = {
        time = 200,
        live = 3,
    },
    hotwire = {
        time = 3,
    },
    hackerMinigame = {
        upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        lowerCase = "abcdefghijklmnopqrstuvwxyz",
        numbers = "0123456789",
        lenght = 3,
        live = 3,
    },
    safeCrack = {
        difficulty = {
            ['easy'] = 1,
            ['normal'] = 3,
            ['hard'] = 5,
        },
    },
    timedButton = {
        wrongCount = 3,
        difficulty = {
            ['easy'] = 10,
            ['normal'] = 7,
            ['hard'] = 5,
        },
        sequences = {
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        },
    },
    timedBar = {
        winCount = 1,
        wrongCount = 3,
        difficulty = {
            ['easy'] = 12,
            ['normal'] = 7,
            ['hard'] = 2,
        },
    },
    circleClick = {
        wrongCount = 3,
        maxScore = 5,
        difficulty = {
            ['easy'] = 2,
            ['normal'] = 1.5,
            ['hard'] = 1,
        },
    },
    multipleLockpick = {
        wrongCount = 3,
        lockCount = 3,
    },
    memoryGame = {
        difficulty = {
            ['easy'] = 3,
            ['normal'] = 5,
            ['hard'] = 7,
        },
    }
}

Strings = {
    ['safecrack'] = '~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_RIGHT~ Rotate\n~INPUT_FRONTEND_RDOWN~ Check',
    ["hackerminigame"] = '>. Crack this password: %s (%s attempts left)',
    ["won"] = "You Won!",
    ["lost"] = "You Lost!",
    ["turn-green"] = "when the key turns green",
    ["success-lockpick"] = "You have successfully picked the lock.",
    ["failed-lockpick"] = "You have failed to pick the lock.",
    ["input-override"] = "Input Override",
    ["correct-key"] = "Press the correct keys when they enter the area to proceed.",
    ["time-button-failed-title"] = "System Lockdown",
    ["time-button-failed-desc"] = "You have failed to override the system.",
    ["time-button-success-title"] = "Success",
    ["time-button-success-desc"] = "The system has been unlocked.",
    ["typing-game-title"] = "Sequence Analyzer",
    ["typing-game-desc"] = "Type the correct sequence to unlock the system.",
    ["typing-game-failed-title"] = "Failed",
    ["typing-game-failed-desc"] = "Incorrect sequence. Shutting down system.",
    ["typing-game-success-title"] = "Success",
    ["typing-game-success-desc"] = "The system has been unlocked."
}
