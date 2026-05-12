Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qbox', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" or "qs" or "qb" or "esx" or "lj" or "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Target = 'ox_target', -- Target name
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there
    
    TestingMode = false, -- Enable/Disable Testing Mode

    DisableC4Explosion = false, -- Disable the C4 explosion effects
    DisableTheNeedForGrenades = true, -- Disable the need for grenades to blow up the safe

    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    DrawTextRotation = 70.0, -- Rotation of the drawtext zone
    Interaction = { -- true for target, false for drawtext
        ["Button"] = 38, -- [E] by default

        ["Keypad"] = true,
        ["Computer"] = true,
        ["Search"] = true,
        ["Panel"] = true,
        ["Utility"] = true,
        ["Vault"] = true,
        ["OfficeSafe"] = true,
        ["Door"] = true,
        ["Bombs"] = true,
        ["Trollys"] = true,
        ["Tables"] = true,
        ["Drill"] = true,
        ["Gem"] = true,
    },

    ResetBank = 180, -- (Minutes) Time to reset the bank after a robbery
    MinimumPolice = 12, -- Minimum police required to rob a pacific

    ListLength = 100, -- Length of the employee list that will appear on the clipboard
    RequireBag = true, -- Require a bag to loot the trolleys
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    DisableLaserDamage = false, -- Disable laser damage

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist)
    Bonus = {
        Status = false, -- Enable/Disable Bonus items
        BonusChance = 50, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "pacificcard", Chance = 80, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
        },
    },

    -- Strike System (Silent = High risk, Higher reward, Loud = No risk, Fixed reward)
    TotalTrolleys = 7, -- Total maximum amount of trolleys that could spawn, they spawn depending on the settings below
    Strikes = 5, -- How many strikes players have to reach before having their reward cut
    StrikeAmount = 3, -- (Silent Approach ONLY) How many trollys will be removed if they reach the strike limit
    StrikeLoud = 5, -- (Loud Approach ONLY) How many trollys will spawn

    -- Skill System
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 20, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },
    
    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 25, max = 30}, -- Amount of stress applied
    },

    Codes = {
        ["MainOfficeKeypad"] = {min = 10000, max = 99999}, -- Code range
        ["MainOfficeComputerPassword"] = {min = 10000, max = 99999}, -- Code range
        ["PanelCode"] = {min = 10000, max = 99999}, -- Code range
    },

    Inputs = { -- All the ox_lib Input texts
        ["Code"] = {Title = 'Code', Label = 'Password', Description = 'Enter the code', Icon = 'fas fa-lock'},
        ["MainOfficeCode"] = {Title = 'Login Password', Label = 'Password:', Description = 'Enter the login password', Icon = 'fas fa-lock'},
        ["KeypadCounterCode"] = {Title = 'Employee Verification', Label = 'Password:', Description = 'Enter the login code', Icon = 'fas fa-lock'},
        ["SecretCombination"] = {Title = 'Hidden Password', Label = 'Password', Description = 'Enter the hidden 3 word combination', Icon = 'fas fa-lock'},
    },

    DispatchLocation = { -- Choose where the alarm gets triggered, only one should be picked
        ["SideOffice1"] = false,-- On heist initiation (Silent)
        ["Office1Computer"] = false, -- The first computer you hack
        ["MainOfficeKeypad"] = true, -- The keypad of the main office
        ["MainOfficeComputer2"] = false, -- The computer in the main office
    },

    PuzzleSettings = {
        ["ShowFirstLetter"] = {
            ["Status"] = true, -- Show the first letter of the hidden word
            ["Replace"] = "?" -- If ["Status"] is false, replace the hidden word with the chosen string
        },
    
        ["ShowLastLetter"] = {
            ["Status"] = false, -- Show the first letter of the hidden word
            ["Replace"] = "?" -- If ["Status"] is false, replace the hidden word with the chosen string
        },
    
        ["HideOneClue"] = {
            ["Status"] = true, -- Hide one of the clues
            ["Replace"] = "* **Missing** *" -- If ["Status"] is false, replace the hidden word with the chosen string
        }
    },

    -- Durations
    ElectricBoxMinigameDuration = 5, -- (Seconds) Electric box minigame duration (Required for hacking the minivaults)

    NotificationDuration = 2500, -- Notification duration
    PowerDuration = 6000, -- Power progressbar duration
    SmokeDuration = 6000, -- Smoke progressbar duration
    KeypadDuration = 6000, -- Keypad progressbar duration
    PhoneDuration = 6000, -- Phone progressbar duration
    ComputerDuration = 6000, -- Computer progressbar duration
    SafeDuration = 6000, -- Safe progressbar duration
    SearchingDuration = 6000, -- Searching progressbar duration
    PanelDuration = 6000, -- First panel progressbar duration
    BasementReceptionDuration = 6000, -- Basement reception progressbar duration
    DeskDuration = 6000, -- Desk progressbar duration
    GateDuration = 6000, -- Gate progressbar duration
    LaserShutdownDuration = 6000, -- Laser Shutdown duration
    VaultDuration = 6000, -- Vault Step One duration
    DrillingDuration = 6000, -- Drilling duration
    SealedVaultDuration = 6000, -- Panel duration

    Props = {
        ["Electricbox"] = {Model = "m23_1_prop_m31_electricbox_03a", Coords = vector4(268.0, 218.33, 105.0, 248.96)},
    },
}

Config.PacificSteps = {
    ["SideOffice1"] = {
        name = "SideOffice1",
        label = "Hack keypad",-- Text
        coords = vector3(261.91, 213.53, 110.50), -- Circle Zone Coords
        drawtext = vector3(261.36, 213.72, 110.28),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["SideOffice2"] = {
        name = "SideOffice2",
        label = "Disable keypad",-- Text
        coords = vector3(261.91, 213.53, 110.50), -- Circle Zone Coords
        drawtext = vector3(261.36, 213.72, 110.28),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["SideOfficeComputer1"] = {
        name = "SideOfficeComputer1",
        label = "Upload Virus",-- Text
        coords = vector3(264.74, 211.63, 110.09), -- Circle Zone Coords
        drawtext = vector3(264.53, 211.17, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-desktop", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["SideOfficeComputer2"] = {
        name = "SideOfficeComputer2",
        label = "Breach Interface",-- Text
        coords = vector3(264.74, 211.63, 110.09), -- Circle Zone Coords
        drawtext = vector3(264.53, 211.17, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-desktop", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["BackdoorKeypad"] = {
        name = "BackdoorKeypad",
        label = "Hack keypad",-- Text
        coords = vector3(259.11, 212.21, 106.45), -- Circle Zone Coords
        drawtext = vector3(259.61, 212.02, 106.28),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["RoofGenerator"] = {
        name = "RoofGenerator",
        label = "Disable Power",-- Text
        coords = vector3(258.44, 230.34, 151.71), -- Circle Zone Coords
        drawtext = vector3(258.55, 230.7, 151.63),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt-lightning", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["SmokeRoof1"] = {
        name = "SmokeRoof1",
        label = "Throw a smoke grenade",-- Text
        coords = vector3(283.57, 250.58, 128.40), -- Circle Zone Coords
        drawtext = vector3(283.66, 250.66, 129.24),
        distance = 1.5, -- Target Distance
        icon = "fas fa-smog", -- Icon
        size = 0.7, -- Circle Zone size
    },

    ["SmokeRoof2"] = {
        name = "SmokeRoof2",
        label = "Throw a smoke grenade",-- Text
        coords = vector3(285.6, 256.08, 128.40), -- Circle Zone Coords
        drawtext = vector3(285.57, 256.05, 129.24),
        distance = 1.5, -- Target Distance
        icon = "fas fa-smog", -- Icon
        size = 0.7, -- Circle Zone size
    },
    
    ["Computer1"] = {
        name = "Computer1",
        label = "Hack",-- Text
        coords = vector3(246.88, 208.85, 110.22), -- Circle Zone Coords
        drawtext = vector3(247.47, 208.73, 110.28),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Computer2"] = {
        name = "Computer2",
        label = "Hack",-- Text
        coords = vector3(241.36, 211.0, 110.28), -- Circle Zone Coords
        drawtext = vector3(241.97, 211.01, 110.28),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Computer3"] = {
        name = "Computer3",
        label = "Hack",-- Text
        coords = vector3(233.09, 221.26, 110.26), -- Circle Zone Coords
        drawtext = vector3(233.07, 220.45, 110.28),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Computer4"] = {
        name = "Computer4",
        label = "Hack",-- Text
        coords = vector3(250.06, 227.23, 106.28), -- Circle Zone Coords
        drawtext = vector3(250.7, 226.95, 106.29),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Computer5"] = {
        name = "Computer5",
        label = "Hack",-- Text
        coords = vector3(249.03, 228.87, 106.33), -- Circle Zone Coords
        drawtext = vector3(248.39, 229.12, 106.29),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Computer6"] = {
        name = "Computer6",
        label = "Hack",-- Text
        coords = vector3(245.49, 229.41, 106.3), -- Circle Zone Coords
        drawtext = vector3(246.1, 229.16, 106.29),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Computer7"] = {
        name = "Computer7",
        label = "Hack",-- Text
        coords = vector3(244.02, 230.57, 106.3), -- Circle Zone Coords
        drawtext = vector3(243.56, 230.76, 106.29),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["MainOfficeKeypad"] = {
        name = "MainOfficeKeypad",
        label = "Enter Code",-- Text
        coords = vector3(260.15, 208.71, 110.50), -- Circle Zone Coords
        drawtext = vector3(259.88, 208.83, 110.28),
        distance = 1.0, -- Target Distance
        icon = "fas fa-keyboard", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["OfficeSafe"] = {
        name = "OfficeSafe",
        label = "Crack Safe",-- Text
        coords = vector3(259.78, 203.93, 110.26), -- Circle Zone Coords
        drawtext = vector3(260.29, 204.03, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fab fa-keycdn", -- Icon
        size = 0.5, -- Circle Zone size
    },
    
    ["Search1"] = {
        name = "Search1",
        label = "Search",-- Text
        coords = vector3(263.03, 209.81, 109.93), -- Circle Zone Coords
        drawtext = vector3(262.87, 209.45, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-magnifying-glass", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Search2"] = {
        name = "Search2",
        label = "Search",-- Text
        coords = vector3(263.98, 209.64, 109.98), -- Circle Zone Coords
        drawtext = vector3(263.79, 209.08, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-magnifying-glass", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Search3"] = {
        name = "Search3",
        label = "Search",-- Text
        coords = vector3(264.51, 209.19, 109.99), -- Circle Zone Coords
        drawtext = vector3(264.39, 208.88, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-magnifying-glass", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["MainOfficeComputer1"] = {
        name = "MainOfficeComputer1",
        label = "Enter Password",-- Text
        coords = vector3(261.36, 205.19, 110.24), -- Circle Zone Coords
        drawtext = vector3(261.2, 204.87, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-laptop", -- Icon
        size = 0.4, -- Circle Zone size
    },
    
    ["MainOfficeComputer2"] = {
        name = "MainOfficeComputer2",
        label = "Infiltrate bank",-- Text
        coords = vector3(261.36, 205.19, 110.24), -- Circle Zone Coords
        drawtext = vector3(261.2, 204.87, 110.29),
        distance = 1.0, -- Target Distance
        icon = "fas fa-laptop", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["BasementReception"] = {
        name = "BasementReception",
        label = "Plant C4",-- Text
        coords = vector3(260.25, 219.75, 106.28), -- Circle Zone Coords
        drawtext = vector3(259.8, 219.97, 106.28),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bomb", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["EmployeeList"] = {
        name = "EmployeeList",
        label = "Employees Information",-- Text
        coords = vector3(265.37, 220.13, 101.58), -- Circle Zone Coords
        drawtext = vector3(264.82, 219.84, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-clipboard-user", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["DeskOne"] = {
        name = "DeskOne",
        label = "Desk One",-- Text
        coords = vector3(252.97, 222.49, 106.04), -- Circle Zone Coords
        drawtext = vector3(253.1, 222.79, 106.29),
        distance = 1.5, -- Target Distance
        icon = "fas fa-clipboard-user", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["DeskTwo"] = {
        name = "DeskTwo",
        label = "Desk Two",-- Text
        coords = vector3(247.83, 224.22, 105.84), -- Circle Zone Coords
        drawtext = vector3(247.92, 224.67, 106.29),
        distance = 1.5, -- Target Distance
        icon = "fas fa-clipboard-user", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["DeskThree"] = {
        name = "DeskThree",
        label = "Desk Three",-- Text
        coords = vector3(242.67, 226.12, 105.9), -- Circle Zone Coords
        drawtext = vector3(242.89, 226.51, 106.29),
        distance = 1.5, -- Target Distance
        icon = "fas fa-clipboard-user", -- Icon
        size = 0.5, -- Circle Zone size
    },

    
    ["Panel1"] = {
        name = "Panel1",
        label = "Access Panel",-- Text
        coords = vector3(252.22, 226.45, 102.07), -- Circle Zone Coords
        drawtext = vector3(252.43, 226.35, 101.68),
        distance = 0.75, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["Panel2"] = {
        name = "Panel2",
        label = "Access Panel",-- Text
        coords = vector3(253.11, 228.5, 102.12), -- Circle Zone Coords
        drawtext = vector3(253.25, 228.45, 101.68),
        distance = 0.75, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["Panel1Step2"] = {
        name = "Panel1Step2",
        label = "Press Button",-- Text
        coords = vector3(252.22, 226.45, 102.07), -- Circle Zone Coords
        drawtext = vector3(252.43, 226.35, 101.68),
        distance = 0.75, -- Target Distance
        icon = "fas fa-circle", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["Panel2Step2"] = {
        name = "Panel2Step2",
        label = "Press Button",-- Text
        coords = vector3(253.11, 228.5, 102.12), -- Circle Zone Coords
        drawtext = vector3(253.25, 228.45, 101.68),
        distance = 0.75, -- Target Distance
        icon = "fas fa-circle", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["SecurityShutdown"] = {
        name = "SecurityShutdown",
        label = "Shutdown security for a limited time",-- Text
        coords = vector3(268.17, 218.29, 105.54), -- Circle Zone Coords
        drawtext = vector3(267.59, 218.48, 104.88),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["LaserShutdown"] = {
        name = "LaserShutdown",
        label = "Shutdown Lasers",-- Text
        coords = vector3(268.17, 218.29, 105.54), -- Circle Zone Coords
        drawtext = vector3(267.59, 218.48, 104.88),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt-lightning", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["DrillGate"] = {
        name = "DrillGate",
        label = "Drill gate",-- Text
        coords = vector3(253.03, 220.8, 101.87), -- Circle Zone Coords
        drawtext = vector3(253.09, 220.99, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fab fa-keycdn", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["VaultGate"] = {
        name = "VaultGate",
        label = "Unlock door",-- Text
        coords = vector3(261.63, 215.69, 101.71), -- Circle Zone Coords
        drawtext = vector3(261.38, 215.67, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-key", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["Drill1"] = {
        name = "Drill1",
        label = "Drill Lockbox",-- Text
        coords = vector3(259.49, 218.17, 102.20), -- Circle Zone Coords
        drawtext = vector3(259.4, 217.94, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Drill2"] = {
        name = "Drill2",
        label = "Drill Lockbox",-- Text
        coords = vector3(257.97, 213.85, 102.20), -- Circle Zone Coords
        drawtext = vector3(258.22, 214.49, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Drill3"] = {
        name = "Drill3",
        label = "Drill Lockbox",-- Text
        coords = vector3(264.98, 216.36, 102.20), -- Circle Zone Coords
        drawtext = vector3(264.84, 216.06, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Drill4"] = {
        name = "Drill4",
        label = "Drill Lockbox",-- Text
        coords = vector3(266.28, 213.62, 102.20), -- Circle Zone Coords
        drawtext = vector3(265.95, 213.75, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Drill5"] = {
        name = "Drill5",
        label = "Drill Lockbox",-- Text
        coords = vector3(263.36, 211.9, 102.20), -- Circle Zone Coords
        drawtext = vector3(263.53, 212.28, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fas fa-bolt", -- Icon
        size = 0.4, -- Circle Zone size
    },
    
    ["Vault1"] = {
        name = "Vault1",
        label = "Insert the 3 word combination",-- Text
        coords = vector3(252.14, 235.87, 101.56), -- Circle Zone Coords
        drawtext = vector3(251.55, 236.07, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fab fa-wordpress-simple", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["Vault2"] = {
        name = "Vault2",
        label = "Hack Terminal",-- Text
        coords = vector3(252.14, 235.87, 101.56), -- Circle Zone Coords
        drawtext = vector3(251.55, 236.07, 101.68),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["Vault3"] = {
        name = "Vault3",
        label = "Plant Bomb",-- Text
        coords = vector3(255.93, 241.05, 101.77), -- Circle Zone Coords
        drawtext = vector3(255.82, 240.69, 101.7),
        distance = 1.5, -- Target Distance
        icon = "fas fa-bomb", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["Bomb1"] = {
        name = "Bomb1",
        label = "Plant Bomb",-- Text
        coords = vector3(259.04, 247.25, 101.77), -- Circle Zone Coords
        drawtext = vector3(258.75, 246.78, 101.69),
        distance = 1.5, -- Target Distance
        icon = "fas fa-bomb", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["Bomb2"] = {
        name = "Bomb2",
        label = "Plant Bomb",-- Text
        coords = vector3(261.12, 252.87, 101.77), -- Circle Zone Coords
        drawtext = vector3(260.86, 252.38, 101.69),
        distance = 1.5, -- Target Distance
        icon = "fas fa-bomb", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["SealedVault"] = {
        name = "SealedVault",
        label = "Access Panel",-- Text
        coords = vector3(261.56, 258.36, 102.13), -- Circle Zone Coords
        drawtext = vector3(261.37, 257.77, 101.69),
        distance = 1.0, -- Target Distance
        icon = "fab fa-hackerrank", -- Icon
        size = 0.3, -- Circle Zone size
    },

    ["Gem"] = {
        name = "Gem",
        label = "Cut glass",-- Text
        coords = vector3(264.55, 262.41, 102.0), -- Circle Zone Coords
        drawtext = vector3(264.33, 261.8, 101.69),
        distance = 1.0, -- Target Distance
        icon = "fas fa-gem", -- Icon
        size = 0.7, -- Circle Zone size
    },
}

Config.Items = {
    ["Device"] = "signaljammer",
    ["Laptop"] = "passcodeinjector",
    ["Phone"] = "signaljammer",
    ["Stethoscope"] = "signaljammer", --tbd
    ["ElectricCutter"] = "cutter",
    ["Pliers"] = "pliers",
    ["Bag"] = "bag",
    ["Key"] = "pacific_key",
    ["Keycard"] = "pacificcard",
    ["Decryptor"] = "signaljammer", --tbd
    ["HackCard"] = "blackkeycard",
    ["C4"] = "c4",
    ["BigC4"] = "c4",
    ["Drill"] = "toolkit",
    ["SmokeGrenade"] = "gasgrenade",
}

Config.ItemsBreak = {
    ["Device"] = 0, -- % Break Chance
    ["Laptop"] = 100, -- % Break Chance
    ["Phone"] = 0, -- % Break Chance
    ["Pliers"] = 0, -- % Break Chance
    ["HackCard"] = 100, -- % Break Chance
    ["Drill"] = 100, -- % Break Chance
    ["Stethoscope"] = 0, -- % Break Chance
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["BombBeeping"] = 'heartmonbeat', -- The sound that is played when the bomb is beeping
    ["BombBeepingSoundVolume"] = 1.0, -- The volume of the sound that is played
    ["BombBeepingSoundDistance"] = 15.0, -- The distance that the sound reaches
    ["PanelBeeping"] = 'heartmonbeat', -- The sound that is played when the panel is beeping
    ["PanelBeepingSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["PanelBeepingSoundDistance"] = 5.0, -- The distance that the sound reaches
    ["LaserSound"] = 'security-alarm', -- The sound that is played when you touch a laser
    ["LaserVolume"] = 0.05, -- The volume of the sound that is played
    ["LaserDistance"] = 15.0, -- The distance that the sound reaches
    ["VaultSound"] = 'security-alarm', -- The sound that is played when vault deploys smokes
    ["VaultVolume"] = 0.05, -- The volume of the sound that is played
    ["VaultDistance"] = 15.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound that is played when the alarm is triggered
    ["AlarmVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmDistance"] = 25.0, -- The distance that the sound reaches
    ["AlarmLocation"] = vector3(231.7, 215.12, 108.47), -- The location of the alarm
}

Config.Rewardcash = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per cash stack pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 250000, max = 400000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = true, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewardgold = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per gold bar pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "goldbar", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 15, max = 20}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of gold bars you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewarddiamond = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per diamond box pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "diamond", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1, max = 1}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of diamonds you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.GemReward = {
    ["Item"] = "giant_gem",
    ["Amount"] = {min = 1, max = 1},
}

Config.TableRewardcash = { --8
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 200000, max = 250000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = true, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.TableRewardgold = { --9
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "goldbar", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 10, max = 15}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of gold bars you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.DrillReward = {
    ["Drill1"] = {
        ['Status'] = true, -- Choose whether u want this lockbox spawns or not
        ['Item'] = true, -- set this to true to use a cash "item", or keep it false to use normal cash
        ['CashName'] = 'cash', -- cash for normal cash (['ItemForCash'] = false)
        ['CashItem'] = "goldbar", -- Item you want to use for cash (['ItemForCash'] = true)
        ['CashAmount'] = {min = 8, max = 11}, -- Cash that is recieved from robbing the atm
        ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
    },

    ["Drill2"] = {
        ['Status'] = true, -- Choose whether u want this lockbox spawns or not
        ['Item'] = true, -- set this to true to use a cash "item", or keep it false to use normal cash
        ['CashName'] = 'cash', -- cash for normal cash (['ItemForCash'] = false)
        ['CashItem'] = "goldbar", -- Item you want to use for cash (['ItemForCash'] = true)
        ['CashAmount'] = {min = 8, max = 11}, -- Cash that is recieved from robbing the atm
        ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
    },

    ["Drill3"] = {
        ['Status'] = true, -- Choose whether u want this lockbox spawns or not
        ['Item'] = true, -- set this to true to use a cash "item", or keep it false to use normal cash
        ['CashName'] = 'cash', -- cash for normal cash (['ItemForCash'] = false)
        ['CashItem'] = "goldbar", -- Item you want to use for cash (['ItemForCash'] = true)
        ['CashAmount'] = {min = 8, max = 11}, -- Cash that is recieved from robbing the atm
        ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
    },

    ["Drill4"] = {
        ['Status'] = true, -- Choose whether u want this lockbox spawns or not
        ['Item'] = true, -- set this to true to use a cash "item", or keep it false to use normal cash
        ['CashName'] = 'cash', -- cash for normal cash (['ItemForCash'] = false)
        ['CashItem'] = "goldbar", -- Item you want to use for cash (['ItemForCash'] = true)
        ['CashAmount'] = {min = 8, max = 11}, -- Cash that is recieved from robbing the atm
        ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
    },

    ["Drill5"] = {
        ['Status'] = true, -- Choose whether u want this lockbox spawns or not
        ['Item'] = true, -- set this to true to use a cash "item", or keep it false to use normal cash
        ['CashName'] = 'cash', -- cash for normal cash (['ItemForCash'] = false)
        ['CashItem'] = "goldbar", -- Item you want to use for cash (['ItemForCash'] = true)
        ['CashAmount'] = {min = 8, max = 11}, -- Cash that is recieved from robbing the atm
        ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
    },
}

Config.Trollys = {
    ['Trolly1'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly1', -- !!! Do not touch !!!
        Coords = vector3(266.33, 215.22, 100.68),
        Drawtext = vector3(265.65, 214.82, 101.68),
        Heading = 115.4,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Trolly2'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly2', -- !!! Do not touch !!!
        Coords = vector3(265.17, 212.16, 100.68),
        Drawtext = vector3(264.71, 212.74, 101.68),
        Heading = 29.64,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Trolly3'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly3', -- !!! Do not touch !!!
        Coords = vector3(263.79, 214.26, 100.68),
        Drawtext = vector3(263.79, 214.26, 101.68),
        Heading = 72.59,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Trolly4'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly4', -- !!! Do not touch !!!
        Coords = vector3(259.14, 253.43, 100.69),
        Drawtext = vector3(259.53, 253.3, 101.69),
        Heading = 248.03,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Trolly5'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly5', -- !!! Do not touch !!!
        Coords = vector3(262.99, 252.08, 100.69),
        Drawtext = vector3(262.64, 252.21, 101.69),
        Heading = 72.32,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Trolly6'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly6', -- !!! Do not touch !!!
        Coords = vector3(267.06, 255.6, 100.69),
        Drawtext = vector3(267.12, 255.23, 101.69),
        Heading = 185.17,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Trolly7'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly7', -- !!! Do not touch !!!
        Coords = vector3(266.12, 252.13, 100.69),
        Drawtext = vector3(266.56, 252.36, 101.69),
        Heading = 292.14,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },
}

Config.LootTables = {
    ['Table1'] = {
        Type = "gold", -- Type loot spawned (cash/gold)
        Name = 'Table1', -- !!! Do not touch !!!
        Coords = vector3(250.05, 247.45, 101.58),
        Drawtext = vector3(250.64, 247.22, 101.69),
        Heading = 68.4,
        Icon = 'fas fa-coins',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Table2'] = {
        Type = "gold", -- Type loot spawned (cash/gold)
        Name = 'Table2', -- !!! Do not touch !!!
        Coords = vector3(252.07, 252.87, 101.58),
        Drawtext = vector3(252.65, 252.65, 101.69),
        Heading = 68.4,
        Icon = 'fas fa-coins',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Table3'] = {
        Type = "cash", -- Type loot spawned (cash/gold)
        Name = 'Table3', -- !!! Do not touch !!!
        Coords = vector3(254.0, 258.5, 101.58),
        Drawtext = vector3(254.66, 258.26, 101.69),
        Heading = 68.4,
        Icon = 'fas fa-money-bill',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },
    ['Table4'] = {
        Type = "gold", -- Type loot spawned (cash/gold)
        Name = 'Table4', -- !!! Do not touch !!!
        Coords = vector3(268.02, 247.45, 101.58),
        Drawtext = vector3(267.44, 247.71, 101.69),
        Heading = 249.83,
        Icon = 'fas fa-coins',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },

    ['Table5'] = {
        Type = "gold", -- Type loot spawned (cash/gold)
        Name = 'Table5', -- !!! Do not touch !!!
        Coords = vector3(265.96, 241.23, 101.58),
        Drawtext = vector3(265.1, 241.55, 101.69),
        Heading = 246.41,
        Icon = 'fas fa-coins',
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Circle Zone size
    },
}

Config.SecurityGuards = {
    ["Security1"] = { -- Security left
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(249.89, 219.87, 100.68, 328.25), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security2"] = { -- Security right
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(251.66, 218.17, 100.68, 343.36), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security3"] = { -- Security right
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(253.65, 216.64, 100.68, 6.65), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security4"] = { -- Reception
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(257.83, 217.85, 100.68, 71.78), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security5"] = { -- Middle
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(262.09, 213.77, 100.68, 58.04), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security6"] = { -- Middle
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(262.86, 216.13, 100.68, 77.36), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security7"] = { -- Inner left
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(258.61, 231.48, 101.68, 132.22), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security8"] = { -- Inner left
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(256.79, 233.25, 101.68, 171.62), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security9"] = { -- Inner right
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(249.82, 234.34, 101.68, 242.13), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security10"] = { -- Inner right
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(251.76, 239.09, 101.68, 200.14), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security11"] = { -- Inner right
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(255.37, 240.6, 101.7, 175.06), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security12"] = { -- Inner middle
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_y_doorman_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(258.66, 239.14, 101.7, 143.27), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
}

Config.SecurityOptions = { -- Those options are applied for all the security guard peds
    ["MaxHealth"] = 100, -- 0-200
    ["Health"] = 100, -- 0-200
    ["Armour"] = 100, -- 0-100
    ["CombatMovement"] = 1,
    ["CombatRange"] = 2,
    ["Accuracy"] = 100, -- 0-100
    ["CombatAbility"] = 100,
    ["SeeingRange"] = 150.0,
    ["HearingRange"] = 150.0,
    ["Alertness"] = 3,
}

Config.Employees = {
    [1] = {first = "Olivia", last = "Roberts", residence = "Hawaii", age = "27"},
    [2] = {first = "Ethan", last = "Parker", residence = "Kentucky", age = "34"},
    [3] = {first = "Sophia", last = "Adams", residence = "Mississippi", age = "45"},
    [4] = {first = "Benjamin", last = "Taylor", residence = "Montana", age = "19"},
    [5] = {first = "Ava", last = "Wright", residence = "SouthDakota", age = "31"},
    [6] = {first = "Liam", last = "Davis", residence = "Arizona", age = "40"},
    [7] = {first = "Emma", last = "Wilson", residence = "Connecticut", age = "22"},
    [8] = {first = "Noah", last = "Martinez", residence = "WestVirginia", age = "29"},
    [9] = {first = "Isabella", last = "Anderson", residence = "Delaware", age = "36"},
    [10] = {first = "Alexander", last = "Nelson", residence = "Maryland", age = "50"},
    [11] = {first = "Mia", last = "Johnson", residence = "Iowa", age = "25"},
    [12] = {first = "Elijah", last = "Garcia", residence = "NewMexico", age = "33"},
    [13] = {first = "Sofia", last = "Clark", residence = "Vermont", age = "28"},
    [14] = {first = "William", last = "Brown", residence = "Minnesota", age = "42"},
    [15] = {first = "Charlotte", last = "Harris", residence = "Tennessee", age = "37"},
    [16] = {first = "James", last = "Turner", residence = "Wisconsin", age = "30"},
    [17] = {first = "Amelia", last = "Smith", residence = "NorthDakota", age = "23"},
    [18] = {first = "Liam", last = "Anderson", residence = "Texas", age = "26"},
    [19] = {first = "Olivia", last = "Walker", residence = "Virginia", age = "39"},
    [20] = {first = "Emma", last = "Roberts", residence = "Louisiana", age = "32"},
    [21] = {first = "Ethan", last = "Johnson", residence = "Alabama", age = "33"},
    [22] = {first = "Sophia", last = "Garcia", residence = "Alaska", age = "42"},
    [23] = {first = "Benjamin", last = "Lee", residence = "Arkansas", age = "19"},
    [24] = {first = "Ava", last = "Anderson", residence = "California", age = "30"},
    [25] = {first = "Liam", last = "Williams", residence = "Colorado", age = "40"},
    [26] = {first = "Emma", last = "Brown", residence = "Florida", age = "24"},
    [27] = {first = "Noah", last = "Davis", residence = "Georgia", age = "29"},
    [28] = {first = "Isabella", last = "Taylor", residence = "Idaho", age = "35"},
    [29] = {first = "Alexander", last = "Harris", residence = "Illinois", age = "47"},
    [30] = {first = "Mia", last = "Moore", residence = "Indiana", age = "26"},
    [31] = {first = "Elijah", last = "Clark", residence = "Kansas", age = "39"},
    [32] = {first = "Sofia", last = "Martinez", residence = "Iowa", age = "28"},
    [33] = {first = "William", last = "Turner", residence = "Kentucky", age = "41"},
    [34] = {first = "Charlotte", last = "Johnson", residence = "Louisiana", age = "31"},
    [35] = {first = "James", last = "Anderson", residence = "Maine", age = "27"},
    [36] = {first = "Amelia", last = "Walker", residence = "Maryland", age = "23"},
    [37] = {first = "Liam", last = "Smith", residence = "Massachusetts", age = "36"},
    [38] = {first = "Olivia", last = "Taylor", residence = "Michigan", age = "44"},
    [39] = {first = "Emma", last = "Parker", residence = "Minnesota", age = "32"},
    [40] = {first = "Noah", last = "Garcia", residence = "Mississippi", age = "25"},
    [41] = {first = "Sophia", last = "Moore", residence = "Missouri", age = "38"},
    [42] = {first = "Alexander", last = "Davis", residence = "Nebraska", age = "49"},
    [43] = {first = "Ava", last = "Brown", residence = "Nevada", age = "29"},
    [44] = {first = "Benjamin", last = "Johnson", residence = "NewHampshire", age = "21"},
    [45] = {first = "Ethan", last = "Martinez", residence = "NewJersey", age = "37"},
    [46] = {first = "Olivia", last = "Clark", residence = "NewMexico", age = "43"},
    [47] = {first = "Sophia", last = "Williams", residence = "NewYork", age = "28"},
    [48] = {first = "Liam", last = "Turner", residence = "NorthCarolina", age = "30"},
    [49] = {first = "Emma", last = "Walker", residence = "NorthDakota", age = "26"},
    [50] = {first = "Oliver", last = "Wilson", residence = "Ohio", age = "33"},
    [51] = {first = "Lily", last = "Morris", residence = "Georgia", age = "28"},
    [52] = {first = "Carter", last = "Smith", residence = "Florida", age = "32"},
    [53] = {first = "Ghazi", last = "Bekker", residence = "NorthCarolina", age = "41"},
    [54] = {first = "Henry", last = "Baker", residence = "Texas", age = "41"},
    [55] = {first = "Ella", last = "Foster", residence = "California", age = "29"},
    [56] = {first = "Aiden", last = "Gomez", residence = "NewYork", age = "27"},
    [57] = {first = "Scarlett", last = "Rivera", residence = "Arizona", age = "36"},
    [58] = {first = "Logan", last = "Wright", residence = "Montana", age = "33"},
    [59] = {first = "Aria", last = "Mitchell", residence = "Kansas", age = "23"},
    [60] = {first = "Gabriel", last = "Sanchez", residence = "Colorado", age = "30"},
    [61] = {first = "Madison", last = "Lopez", residence = "Alabama", age = "26"},
    [62] = {first = "Wyatt", last = "Turner", residence = "Louisiana", age = "35"},
    [63] = {first = "Luna", last = "Ward", residence = "Maryland", age = "38"},
    [64] = {first = "Owen", last = "Green", residence = "Minnesota", age = "31"},
    [65] = {first = "Avery", last = "Coleman", residence = "NorthDakota", age = "29"},
    [66] = {first = "Jack", last = "Jenkins", residence = "Michigan", age = "43"},
    [67] = {first = "Isabelle", last = "Russell", residence = "NewMexico", age = "22"},
    [68] = {first = "Luke", last = "Stewart", residence = "SouthDakota", age = "26"},
    [69] = {first = "Emily", last = "White", residence = "Wisconsin", age = "31"},
    [70] = {first = "Mason", last = "Robinson", residence = "Tennessee", age = "34"},
    [71] = {first = "Zoey", last = "Gonzalez", residence = "Delaware", age = "25"},
    [72] = {first = "Sebastian", last = "Lee", residence = "Iowa", age = "39"},
    [73] = {first = "Addison", last = "Cooper", residence = "Mississippi", age = "28"},
    [74] = {first = "Eli", last = "Hernandez", residence = "NewJersey", age = "30"},
    [75] = {first = "Natalie", last = "Phillips", residence = "Ohio", age = "37"},
    [76] = {first = "Grayson", last = "Reed", residence = "Indiana", age = "33"},
    [77] = {first = "Hannah", last = "Price", residence = "Maine", age = "24"},
    [78] = {first = "Caleb", last = "Simmons", residence = "Kentucky", age = "29"},
    [79] = {first = "Elizabeth", last = "Barnes", residence = "WestVirginia", age = "39"},
    [80] = {first = "Levi", last = "Ross", residence = "Alaska", age = "28"},
    [81] = {first = "Chloe", last = "Butler", residence = "Arkansas", age = "36"},
    [82] = {first = "Andrew", last = "Fisher", residence = "Connecticut", age = "31"},
    [83] = {first = "Eleanor", last = "Griffin", residence = "Hawaii", age = "30"},
    [84] = {first = "Lincoln", last = "Hart", residence = "Nebraska", age = "35"},
    [85] = {first = "Hazel", last = "Hawkins", residence = "Idaho", age = "27"},
    [86] = {first = "Ezra", last = "Washington", residence = "Missouri", age = "32"},
    [87] = {first = "Penelope", last = "Morgan", residence = "NewHampshire", age = "26"},
    [88] = {first = "Daniel", last = "Hughes", residence = "Illinois", age = "29"},
    [89] = {first = "Aubrey", last = "Diaz", residence = "Virginia", age = "33"},
    [90] = {first = "Mateo", last = "Bell", residence = "Nevada", age = "31"},
    [91] = {first = "Samantha", last = "Hayes", residence = "Wisconsin", age = "26"},
    [92] = {first = "Adrian", last = "Kim", residence = "Oregon", age = "38"},
    [93] = {first = "Zoe", last = "Harrison", residence = "NorthDakota", age = "30"},
    [94] = {first = "Nolan", last = "Peterson", residence = "Kansas", age = "29"},
    [95] = {first = "Ariana", last = "Gardner", residence = "Iowa", age = "24"},
    [96] = {first = "Dominic", last = "Cole", residence = "SouthCarolina", age = "31"},
    [97] = {first = "Riley", last = "Campbell", residence = "Oklahoma", age = "28"},
    [98] = {first = "Brooklyn", last = "Sullivan", residence = "RhodeIsland", age = "29"},
    [99] = {first = "Elias", last = "Perry", residence = "Louisiana", age = "37"},
    [100] = {first = "Layla", last = "Powell", residence = "Utah", age = "26"},
    [101] = {first = "Max", last = "Rossi", residence = "Vermont", age = "25"},
    [102] = {first = "Bella", last = "Gutierrez", residence = "Michigan", age = "28"},
    [103] = {first = "Adam", last = "Ward", residence = "Mississippi", age = "31"},
    [104] = {first = "Stella", last = "Chapman", residence = "Connecticut", age = "27"},
    [105] = {first = "Ian", last = "Medina", residence = "Arizona", age = "33"},
    [106] = {first = "Violet", last = "Meyer", residence = "Montana", age = "29"},
    [107] = {first = "Lucas", last = "Zhang", residence = "NorthCarolina", age = "35"},
    [108] = {first = "Hannah", last = "Lin", residence = "Texas", age = "32"},
    [109] = {first = "Nathan", last = "Molina", residence = "California", age = "30"},
    [110] = {first = "Paisley", last = "Reyes", residence = "NewYork", age = "26"},
    [111] = {first = "Evan", last = "Ibrahim", residence = "Alabama", age = "29"},
    [112] = {first = "Lila", last = "Garcia", residence = "Louisiana", age = "28"},
    [113] = {first = "Miles", last = "Larson", residence = "Maryland", age = "31"},
    [114] = {first = "Ariana", last = "Khan", residence = "Missouri", age = "27"},
    [115] = {first = "Caleb", last = "Nelson", residence = "SouthDakota", age = "33"},
    [116] = {first = "Nova", last = "Chen", residence = "NorthDakota", age = "25"},
    [117] = {first = "Aaron", last = "Li", residence = "Wisconsin", age = "30"},
    [118] = {first = "Brielle", last = "Gomez", residence = "Tennessee", age = "29"},
    [119] = {first = "Hudson", last = "Roberts", residence = "Delaware", age = "36"},
    [120] = {first = "Ayla", last = "Wright", residence = "Iowa", age = "27"},
    [121] = {first = "Jace", last = "Adams", residence = "Mississippi", age = "32"},
    [122] = {first = "Sophie", last = "Hall", residence = "Nebraska", age = "31"},
    [123] = {first = "Caden", last = "Rivera", residence = "NorthDakota", age = "24"},
    [124] = {first = "Nora", last = "Hernandez", residence = "Kansas", age = "29"},
    [125] = {first = "Grayson", last = "Gonzalez", residence = "Virginia", age = "30"},
    [126] = {first = "Elaina", last = "Bennett", residence = "Nevada", age = "28"},
    [127] = {first = "Harrison", last = "Sanchez", residence = "Wisconsin", age = "33"},
    [128] = {first = "Skylar", last = "Morris", residence = "Oregon", age = "27"},
    [129] = {first = "Theo", last = "Perez", residence = "Washington", age = "31"},
    [130] = {first = "Mila", last = "Cook", residence = "Indiana", age = "26"},
    [131] = {first = "Beckett", last = "Jackson", residence = "NewHampshire", age = "29"},
    [132] = {first = "Savannah", last = "Ward", residence = "Illinois", age = "28"},
    [133] = {first = "Ezra", last = "Barnes", residence = "Ohio", age = "33"},
    [134] = {first = "Ruby", last = "Wright", residence = "Oklahoma", age = "26"},
    [135] = {first = "Oscar", last = "Foster", residence = "RhodeIsland", age = "31"},
    [136] = {first = "Luna", last = "Jenkins", residence = "Arkansas", age = "29"},
    [137] = {first = "Carter", last = "Cruz", residence = "Minnesota", age = "32"},
    [138] = {first = "Clara", last = "Hamilton", residence = "WestVirginia", age = "27"},
    [139] = {first = "Micah", last = "Sullivan", residence = "Alaska", age = "30"},
    [140] = {first = "Summer", last = "Bell", residence = "Hawaii", age = "28"},
    [141] = {first = "Tristan", last = "Kim", residence = "Colorado", age = "33"},
    [142] = {first = "Valentina", last = "Peterson", residence = "Kentucky", age = "25"},
    [143] = {first = "Easton", last = "Gardner", residence = "Michigan", age = "29"},
    [144] = {first = "Maddison", last = "Rossi", residence = "Mississippi", age = "30"},
    [145] = {first = "August", last = "Diaz", residence = "Missouri", age = "26"},
    [146] = {first = "Remi", last = "Hayes", residence = "NewMexico", age = "32"},
    [147] = {first = "Hayden", last = "Washington", residence = "NewYork", age = "27"},
    [148] = {first = "Brynlee", last = "Martin", residence = "NorthCarolina", age = "30"},
    [149] = {first = "Maximus", last = "Lin", residence = "Texas", age = "28"},
    [150] = {first = "Evangeline", last = "Gomez", residence = "California", age = "33"},
    [151] = {first = "Roman", last = "Sanchez", residence = "Louisiana", age = "29"},
    [152] = {first = "Emery", last = "Young", residence = "Iowa", age = "28"},
    [153] = {first = "Sawyer", last = "Allen", residence = "NorthDakota", age = "33"},
    [154] = {first = "Jordyn", last = "Fisher", residence = "NewYork", age = "26"},
    [155] = {first = "Ryder", last = "Gomez", residence = "Florida", age = "31"},
    [156] = {first = "Emerson", last = "Harris", residence = "Arizona", age = "29"},
    [157] = {first = "Elliot", last = "Williams", residence = "Montana", age = "32"},
    [158] = {first = "Harmony", last = "Rivera", residence = "NorthCarolina", age = "27"},
    [159] = {first = "Phoenix", last = "Sullivan", residence = "Colorado", age = "30"},
    [160] = {first = "Lennon", last = "Martinez", residence = "California", age = "28"},
    [161] = {first = "Kieran", last = "Lee", residence = "NewJersey", age = "33"},
    [162] = {first = "Cameron", last = "Clark", residence = "Missouri", age = "26"},
    [163] = {first = "Rowan", last = "Davis", residence = "Ohio", age = "31"},
    [164] = {first = "Skyler", last = "Morris", residence = "Illinois", age = "29"},
    [165] = {first = "Zion", last = "Perry", residence = "Florida", age = "32"},
    [166] = {first = "Sage", last = "Parker", residence = "Georgia", age = "27"},
    [167] = {first = "Marley", last = "Turner", residence = "Indiana", age = "30"},
    [168] = {first = "Archer", last = "Nelson", residence = "Kentucky", age = "28"},
    [169] = {first = "Lyric", last = "Smith", residence = "Louisiana", age = "33"},
    [170] = {first = "Elliott", last = "Allen", residence = "Maine", age = "26"},
    [171] = {first = "Olivia", last = "Roberts", residence = "Hawaii", age = "27"},
    [172] = {first = "Ethan", last = "Parker", residence = "Kentucky", age = "34"},
    [173] = {first = "Sophia", last = "Adams", residence = "Mississippi", age = "45"},
    [174] = {first = "Benjamin", last = "Taylor", residence = "Montana", age = "19"},
    [175] = {first = "Ava", last = "Wright", residence = "SouthDakota", age = "31"},
    [176] = {first = "Liam", last = "Davis", residence = "Arizona", age = "40"},
    [177] = {first = "Emma", last = "Wilson", residence = "Connecticut", age = "22"},
    [178] = {first = "Noah", last = "Martinez", residence = "WestVirginia", age = "29"},
    [179] = {first = "Isabella", last = "Anderson", residence = "Delaware", age = "36"},
    [180] = {first = "Alexander", last = "Nelson", residence = "Maryland", age = "50"},
    [181] = {first = "Mia", last = "Johnson", residence = "Iowa", age = "25"},
    [182] = {first = "Elijah", last = "Garcia", residence = "NewMexico", age = "33"},
    [183] = {first = "Sofia", last = "Clark", residence = "Vermont", age = "28"},
    [184] = {first = "William", last = "Brown", residence = "Minnesota", age = "42"},
    [185] = {first = "Charlotte", last = "Harris", residence = "Tennessee", age = "37"},
    [186] = {first = "James", last = "Turner", residence = "Wisconsin", age = "30"},
    [187] = {first = "Amelia", last = "Smith", residence = "NorthDakota", age = "23"},
    [188] = {first = "Liam", last = "Anderson", residence = "Texas", age = "26"},
    [189] = {first = "Olivia", last = "Walker", residence = "Virginia", age = "39"},
    [190] = {first = "Emma", last = "Roberts", residence = "Louisiana", age = "32"},
    [191] = {first = "Ethan", last = "Johnson", residence = "Alabama", age = "33"},
    [192] = {first = "Sophia", last = "Garcia", residence = "Alaska", age = "42"},
    [193] = {first = "Benjamin", last = "Lee", residence = "Arkansas", age = "19"},
    [194] = {first = "Ava", last = "Anderson", residence = "California", age = "30"},
    [195] = {first = "Liam", last = "Williams", residence = "Colorado", age = "40"},
    [196] = {first = "Emma", last = "Brown", residence = "Florida", age = "24"},
    [197] = {first = "Noah", last = "Davis", residence = "Georgia", age = "29"},
    [198] = {first = "Isabella", last = "Taylor", residence = "Idaho", age = "35"},
    [199] = {first = "Alexander", last = "Harris", residence = "Illinois", age = "47"},
    [200] = {first = "Mia", last = "Moore", residence = "Indiana", age = "26"},
    [201] = {first = "Elijah", last = "Clark", residence = "Kansas", age = "39"},
    [202] = {first = "Sofia", last = "Martinez", residence = "Iowa", age = "28"},
    [203] = {first = "William", last = "Turner", residence = "Kentucky", age = "41"},
    [204] = {first = "Charlotte", last = "Johnson", residence = "Louisiana", age = "31"},
    [205] = {first = "James", last = "Anderson", residence = "Maine", age = "27"},
    [206] = {first = "Amelia", last = "Walker", residence = "Maryland", age = "23"},
    [207] = {first = "Liam", last = "Smith", residence = "Massachusetts", age = "36"},
    [208] = {first = "Olivia", last = "Taylor", residence = "Michigan", age = "44"},
    [209] = {first = "Emma", last = "Parker", residence = "Minnesota", age = "32"},
    [210] = {first = "Noah", last = "Garcia", residence = "Mississippi", age = "25"},
    [211] = {first = "Sophia", last = "Moore", residence = "Missouri", age = "38"},
    [212] = {first = "Alexander", last = "Davis", residence = "Nebraska", age = "49"},
    [213] = {first = "Ava", last = "Brown", residence = "Nevada", age = "29"},
    [214] = {first = "Benjamin", last = "Johnson", residence = "NewHampshire", age = "21"},
    [215] = {first = "Ethan", last = "Martinez", residence = "NewJersey", age = "37"},
    [216] = {first = "Olivia", last = "Clark", residence = "NewMexico", age = "43"},
    [217] = {first = "Sophia", last = "Williams", residence = "NewYork", age = "28"},
    [218] = {first = "Liam", last = "Turner", residence = "NorthCarolina", age = "30"},
    [219] = {first = "Emma", last = "Walker", residence = "NorthDakota", age = "26"},
    [220] = {first = "Oliver", last = "Wilson", residence = "Ohio", age = "33"},
    [221] = {first = "Lily", last = "Morris", residence = "Georgia", age = "28"},
    [222] = {first = "Carter", last = "Smith", residence = "Florida", age = "32"},
    [223] = {first = "Grace", last = "Allen", residence = "NorthCarolina", age = "24"},
    [224] = {first = "Sophia", last = "Nguyen", residence = "Florida", age = "28"},
    [225] = {first = "Ella", last = "Foster", residence = "California", age = "29"},
    [226] = {first = "Aiden", last = "Gomez", residence = "NewYork", age = "27"},
    [227] = {first = "Scarlett", last = "Rivera", residence = "Arizona", age = "36"},
    [228] = {first = "Logan", last = "Wright", residence = "Montana", age = "33"},
    [229] = {first = "Aria", last = "Mitchell", residence = "Kansas", age = "23"},
    [230] = {first = "Gabriel", last = "Sanchez", residence = "Colorado", age = "30"},
    [231] = {first = "Madison", last = "Lopez", residence = "Alabama", age = "26"},
    [232] = {first = "Wyatt", last = "Turner", residence = "Louisiana", age = "35"},
    [233] = {first = "Luna", last = "Ward", residence = "Maryland", age = "38"},
    [234] = {first = "Owen", last = "Green", residence = "Minnesota", age = "31"},
    [235] = {first = "Avery", last = "Coleman", residence = "NorthDakota", age = "29"},
    [236] = {first = "Jack", last = "Jenkins", residence = "Michigan", age = "43"},
    [237] = {first = "Isabelle", last = "Russell", residence = "NewMexico", age = "22"},
    [238] = {first = "Luke", last = "Stewart", residence = "SouthDakota", age = "26"},
    [239] = {first = "Emily", last = "White", residence = "Wisconsin", age = "31"},
    [240] = {first = "Mason", last = "Robinson", residence = "Tennessee", age = "34"},
    [241] = {first = "Zoey", last = "Gonzalez", residence = "Delaware", age = "25"},
    [242] = {first = "Sebastian", last = "Lee", residence = "Iowa", age = "39"},
    [243] = {first = "Addison", last = "Cooper", residence = "Mississippi", age = "28"},
    [244] = {first = "Eli", last = "Hernandez", residence = "NewJersey", age = "30"},
    [245] = {first = "Natalie", last = "Phillips", residence = "Ohio", age = "37"},
    [246] = {first = "Grayson", last = "Reed", residence = "Indiana", age = "33"},
    [247] = {first = "Hannah", last = "Price", residence = "Maine", age = "24"},
    [248] = {first = "Caleb", last = "Simmons", residence = "Kentucky", age = "29"},
    [249] = {first = "Elizabeth", last = "Barnes", residence = "WestVirginia", age = "39"},
    [250] = {first = "Levi", last = "Ross", residence = "Alaska", age = "28"},
    [251] = {first = "Chloe", last = "Butler", residence = "Arkansas", age = "36"},
    [252] = {first = "Andrew", last = "Fisher", residence = "Connecticut", age = "31"},
    [253] = {first = "Eleanor", last = "Griffin", residence = "Hawaii", age = "30"},
    [254] = {first = "Lincoln", last = "Hart", residence = "Nebraska", age = "35"},
    [255] = {first = "Hazel", last = "Hawkins", residence = "Idaho", age = "27"},
    [256] = {first = "Ezra", last = "Washington", residence = "Missouri", age = "32"},
    [257] = {first = "Penelope", last = "Morgan", residence = "NewHampshire", age = "26"},
    [258] = {first = "Daniel", last = "Hughes", residence = "Illinois", age = "29"},
    [259] = {first = "Aubrey", last = "Diaz", residence = "Virginia", age = "33"},
    [260] = {first = "Mateo", last = "Bell", residence = "Nevada", age = "31"},
    [261] = {first = "Samantha", last = "Hayes", residence = "Wisconsin", age = "26"},
    [262] = {first = "Adrian", last = "Kim", residence = "Oregon", age = "38"},
    [263] = {first = "Zoe", last = "Harrison", residence = "NorthDakota", age = "30"},
    [264] = {first = "Nolan", last = "Peterson", residence = "Kansas", age = "29"},
    [265] = {first = "Ariana", last = "Gardner", residence = "Iowa", age = "24"},
    [266] = {first = "Dominic", last = "Cole", residence = "SouthCarolina", age = "31"},
    [267] = {first = "Riley", last = "Campbell", residence = "Oklahoma", age = "28"},
    [268] = {first = "Brooklyn", last = "Sullivan", residence = "RhodeIsland", age = "29"},
    [269] = {first = "Elias", last = "Perry", residence = "Louisiana", age = "37"},
    [270] = {first = "Layla", last = "Powell", residence = "Utah", age = "26"},
    [271] = {first = "Max", last = "Rossi", residence = "Vermont", age = "25"},
    [272] = {first = "Bella", last = "Gutierrez", residence = "Michigan", age = "28"},
    [273] = {first = "Adam", last = "Ward", residence = "Mississippi", age = "31"},
    [274] = {first = "Stella", last = "Chapman", residence = "Connecticut", age = "27"},
    [275] = {first = "Ian", last = "Medina", residence = "Arizona", age = "33"},
    [276] = {first = "Violet", last = "Meyer", residence = "Montana", age = "29"},
    [277] = {first = "Evan", last = "Woods", residence = "NewYork", age = "36"},
    [278] = {first = "Lucy", last = "Ferguson", residence = "California", age = "27"},
    [279] = {first = "Axel", last = "Porter", residence = "Alabama", age = "31"},
    [280] = {first = "Brianna", last = "Hunt", residence = "WestVirginia", age = "30"},
    [281] = {first = "Miles", last = "Lawrence", residence = "Kansas", age = "25"},
    [282] = {first = "Nora", last = "Shaw", residence = "Maine", age = "34"},
    [283] = {first = "Hudson", last = "Sims", residence = "Florida", age = "28"},
    [284] = {first = "Caroline", last = "Ortega", residence = "NorthCarolina", age = "26"},
    [285] = {first = "Micah", last = "Jennings", residence = "Nebraska", age = "29"},
    [286] = {first = "Savannah", last = "Ross", residence = "Nevada", age = "31"},
    [287] = {first = "Jace", last = "Wheeler", residence = "Louisiana", age = "27"},
    [288] = {first = "Aaliyah", last = "Holt", residence = "Utah", age = "32"},
    [289] = {first = "Blake", last = "Douglas", residence = "Vermont", age = "24"},
    [290] = {first = "Everly", last = "Barton", residence = "Michigan", age = "30"},
    [291] = {first = "Kai", last = "Yu", residence = "Mississippi", age = "25"},
    [292] = {first = "Genesis", last = "Morrison", residence = "Connecticut", age = "28"},
    [293] = {first = "Tristan", last = "Newton", residence = "Arizona", age = "35"},
    [294] = {first = "Valentina", last = "Francis", residence = "Montana", age = "31"},
    [295] = {first = "Maddox", last = "Sherman", residence = "NewYork", age = "29"},
    [296] = {first = "Isla", last = "Silva", residence = "California", age = "34"},
    [297] = {first = "Emmett", last = "Hanson", residence = "Alabama", age = "27"},
    [298] = {first = "Delilah", last = "Patterson", residence = "WestVirginia", age = "30"},
    [299] = {first = "Cole", last = "Banks", residence = "Kansas", age = "26"},
    [300] = {first = "Kate", last = "Fitzgerald", residence = "Maine", age = "31"},
}

Config.MaleNoGloves = { 
        [0] = true, 
        [1] = true, 
        [2] = true, 
        [3] = true, 
        [4] = true, 
        [5] = true, 
        [6] = true,
        [7] = true,
        [8] = true,
        [9] = true,
        [10] = true,
        [11] = true,
        [12] = true,
        [13] = true,  
        [14] = true,
        [15] = true,
        [18] = true,
        [52] = true,
        [53] = true, 
        [54] = true, 
        [55] = true, 
        [56] = true, 
        [57] = true, 
        [58] = true, 
        [59] = true, 
        [60] = true, 
        [61] = true,
        [62] = true,  
        [112] = true, 
        [113] = true, 
        [114] = true, 
        [118] = true, 
        [125] = true, 
        [132] = true, 
        [184] = true, 
        [188] = true, 
        [196] = true, 
        [198] = true, 
        [202] = true, 
        [214] = true,
        [215] = true,
        [216] = true,
        [217] = true,
        [218] = true,
        [219] = true,
        [220] = true,
        [221] = true,
        [222] = true, 
        [223] = true,
}

Config.FemaleNoGloves = { 
        [0] = true,
        [1] = true,
        [2] = true,
        [3] = true,
        [4] = true,
        [5] = true,
        [6] = true,
        [7] = true,
        [8] = true,
        [9] = true,
        [10] = true,
        [11] = true,
        [12] = true,
        [13] = true,
        [14] = true,
        [15] = true,
        [19] = true,
        [59] = true,
        [60] = true,
        [61] = true,
        [62] = true,
        [63] = true,
        [64] = true,
        [65] = true,
        [66] = true,
        [67] = true,
        [68] = true,
        [69] = true,
        [70] = true,
        [71] = true,
        [129] = true,
        [130] = true,
        [131] = true,
        [135] = true,
        [142] = true,
        [149] = true,
        [153] = true,
        [157] = true,
        [161] = true,
        [165] = true,
        [229] = true,
        [233] = true,
        [241] = true,
        [248] = true,
        [249] = true,
        [250] = true,
        [251] = true,
        [252] = true,
        [253] = true,
        [254] = true,
        [255] = true,
        [256] = true,
        [257] = true,
        [258] = true,
        [259] = true,
        [260] = true,
        [261] = true,
        [262] = true,
        [263] = true,
        [264] = true,
        [265] = true,
        [266] = true,
        [267] = true,
        [268] = true,
        [269] = true,
        [270] = true,
        [271] = true,
        [272] = true,
        [273] = true,
        [274] = true,
        [275] = true,
        [276] = true,
        [277] = true,
        [278] = true,
        [279] = true,
        [280] = true,
        [281] = true,
        [282] = true,
        [283] = true,
        [284] = true,
        [285] = true,
        [286] = true,
        [287] = true,
        [288] = true,
        [289] = true,
        [290] = true,
        [291] = true,
        [292] = true,
        [293] = true,
        [294] = true,
        [295] = true,
        [296] = true,
        [297] = true,
        [298] = true,
        [299] = true,
        [300] = true,
        [301] = true,
        [302] = true,
        [303] = true,
        [304] = true,
        [305] = true,
        [306] = true,
        [307] = true,
        [308] = true,
        [309] = true,
        [310] = true,
        [311] = true,
        [312] = true,
        [313] = true,
        [314] = true,
        [315] = true,
        [316] = true,
        [317] = true,
        [318] = true,
        [319] = true,
        [320] = true,
        [321] = true,
        [322] = true,
        [323] = true,
        [324] = true,
        [325] = true,
        [326] = true,
        [327] = true,
        [328] = true,
        [329] = true,
        [330] = true,
        [331] = true,
        [332] = true,
        [333] = true,
        [334] = true,
        [335] = true,
        [336] = true,
        [337] = true,
        [338] = true,
        [339] = true,
        [340] = true,
        [341] = true,
        [342] = true,
        [343] = true,
        [344] = true,
        [345] = true,
        [346] = true,
        [347] = true,
        [348] = true,
        [349] = true,
        [350] = true,
        [351] = true,
        [352] = true,
        [353] = true,
        [354] = true,
        [355] = true,
        [356] = true,
}

Config.UseDecor = false
Config.Decorname = "SpawnedPed"

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.Steps = {}
Config.ExtraSteps = {}
Config.Tasks = {}

Config.DoorStates = {} -- Sync
Config.DoorList = {
    	        -- BackDoor Left (1)
	{
		objCoords  = vector3(259.09, 212.81, 106.4),
        objHash = 110411286,
		objYaw = 70.38,
		locked = true,
	},
                -- BackDoor Right (2)
    {
        objCoords  = vector3(259.98, 215.25, 106.4),
        objHash = 110411286,
        objYaw = 250.46,
        locked = true,
    },
                -- Side Office (3)
    {
        objCoords  = vector3(262.54, 215.06, 110.43),
        objHash = 964838196,
        objYaw = 70.0,
        locked = true,
    },
                -- Main Office (4)
    {
        objCoords  = vector3(260.86, 210.45, 110.43),
        objHash = 964838196,
        objYaw = 70.0,
        locked = true,
    },
                -- Gate (5)
    {
        objCoords  = vector3(256.31, 220.66, 106.43),
        objHash = -222270721,
        objYaw = 340.0,
        locked = true,
    },
                -- Gate 2 (6)
    {
        objCoords  = vector3(262.2, 222.52, 106.43),
        objHash = 746855201,
        objYaw = 250.39,
        locked = true,
    },
                -- Vault Gate (7)
    {
        objCoords  = vector3(251.86, 221.07, 101.83),
        objHash = -1508355822,
        objYaw = 160.0,
        locked = true,
    },
                -- Vault Gate 2 (8)
    {
        objCoords  = vector3(261.3, 214.51, 101.83),
        objHash = -1508355822,
        objYaw = 250.0,
        locked = true,
    },
                -- Offices Door (9)
    {
        objCoords  = vector3(266.36, 217.57, 110.43),
        objHash = 1956494919,
        objYaw = 340.22,
        locked = true,
    },
}