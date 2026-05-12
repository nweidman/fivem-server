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

    TestingMode = false, -- Enable/Disable Testing Mode

    -- Drawtext and Target options 
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    Interaction = { -- true for target, false for drawtext
        ["Button"] = 38, -- [E] by default

        ["EmployeeDoor"] = true,
        ["Fusebox"] = true,
        ["BackDoorFusebox"] = true,
        ["Vent"] = true,
        ["Key"] = true,
        ["SecurityDoor"] = true,
        ["OfficeDoor"] = true,
        ["OfficeSearch"]= true,
        ["ElectricBox"] = true,
        ["OfficeComputer"] = true,
        ["MainComputer"] = true,
        ["Puzzle"] = true,
        ["AnimalBook"] = true,
        ["Vault"] = true,
        ["VaultGate"] = true,
        ["Gate"] = true,
        ["Keycard"] = true,
        ["SmallVault"] = true,
        ["Trollys"] = true,
    },

    WeaponRequired = true, -- Weapon requirement on heist loud initiation
    DisableLaserDamage = true, -- Disable Damage done by lasers
    DisableTheNeedForGrenades = true, -- Disable the need for grenades to blow up the safe

    RequireBag = true, -- Require bag to pickup loot from trolleys

    MinimumRequiredPolice = 8, -- Minimum police required for the heist to be initiated
    AutoAlarmOff = 15, -- (Minutes) How long it takes for the alarm to turn off automatically
    ResetHeist = 120, -- (Minutes) How long until the heist gets cleaned up after the heist initiation
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    DiscordLogStatus = true, -- Enable/Disable Logs, to add your webhook go to opensource -> server, line 1 and add your webhook there

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 50, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "blackusb", Chance = 50, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "pacificcard", Chance = 50, Amount = {min = 1, max = 1}},
            -- {Name = "uhc", Chance = 20, Amount = {min = 1, max = 1}},
        },
    },

    -- Strike System (Silent = High risk, Higher reward, Loud = No risk, Fixed reward)
    Strikes = 5, -- How many strikes players have to reach before having their reward cut
    StrikeAmount = 2, -- (Silent Approach ONLY) How many trollys will be removed if they reach the strike limit
    StrikeLoud = 4, -- (Loud Approach ONLY) How many trollys will spawn (preferably less than Trolly Count by 1, to give them insentive to do the loud approach aswell)

    -- Skill System
    SkillSystem = false, -- If want to use a skill system set this to true
    MinimumLevel = 10, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    Evidence = { -- Evidence and Stress Systems
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },
    
    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 25, max = 30}, -- Amount of stress applied
    },

    DispatchLocation = { -- (Silent approach) Setting them all to false will make the heist work on the strike system's police dispatch, meaning the cops wont be called unless they reach the limit
        ["EmployeeDoor"] = false, -- First silent step
        ["OfficeDoor"] = false, -- When you breach the security room
        ["MainComputer1"] = true, -- When you breach the main computer's security (the one in the main room)
    },

    -- Durations
    NotificationDuration = 2500, -- Duration of the notifications

    EmployeeDoorDuration = 6000,
    PuzzleSearchDuration = 6000,
    FuseboxDuration = 6000,
    SecurityDoorDuration = 6000,
    TypingDuration = 6000,
    OfficeDoorDuration = 6000,
    KeyDuration = 6000,
    VaultDuration = 6000,
    KeyfobDuration = 6000,
    SmokeVentDuration = 6000,
    SearchDuration = 6000,
}

Config.Codes = { -- Code difficulties, has to always be min 100, 1000, 10000.. and so on, the max should be the same amount of digits of the min but with all 9s
    ["OfficeComputerRight1"] = {min = 1000, max = 9999},
    ["OfficeComputerRight2"] = {min = 1000, max = 9999},
    ["OfficeComputerLeft2"] = {min = 1000, max = 9999},
}

Config.CodeResetTimer = { -- Code Reset Timers
    ["OfficeComputerLeft2"] = 10, --(Seconds) 5 seconds is the default, meaning they have 5 seconds to insert the code)
    ["OfficeComputerRight2"] = 10, --(Seconds) 5 seconds is the default, meaning they have 5 seconds to insert the code)
}

Config.Inputs = { -- All the ox_lib Input texts
    ["Vault"] = {Title = 'Password', Label = "Password", Description = "Enter the password", Icon = "fas fa-lock"},
    ["OfficeComputerRight1"] = {Title = 'Office Computer 2', Label = 'Code', Description = "Enter the code", Icon = 'fas fa-lock'},
    ["OfficeComputerLeft1"] = {Title = 'Office Computer 1', Label = 'Code', Description = "Enter the code", Icon = 'fas fa-lock'},
    ["OfficeComputerRight2"] = {Header = 'Login Password (Radio it over before the time runs out)', Title = 'Office Computer 2', Label = 'Code', Description = "Enter the code", Icon = 'fas fa-lock'},
    ["OfficeComputerLeft2"] = {Header = 'Login Password (Radio it over before the time runs out)', Title = 'Office Computer 1', Label = 'Code', Description = "Enter the code", Icon = 'fas fa-lock'},
}

Config.PaletoSteps = {
    ["Fusebox"] = {
        name = 'Fusebox', -- !!! Do not touch !!!
        label = 'Cut off power', -- Text
        icon = 'fas fa-link-slash', -- Icon
        coords = vector3(-109.45, 6483.3, 31.7), -- Target Coords
        drawtext = vector3(-109.71, 6483.52, 31.47), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.5, -- Target size
    },

    ["Vent1"] = {
        name = 'Vent1', -- !!! Do not touch !!!
        label = 'Throw a smoke in the vent', -- Text
        icon = 'fas fa-smog', -- Icon
        coords = vector3(-89.26, 6467.13, 31.0), -- Target Coords
        drawtext = vector3(-89.26, 6467.18, 31.44), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.5, -- Target size
    },

    ["Vent2"] = {
        name = 'Vent2', -- !!! Do not touch !!!
        label = 'Throw a smoke in the vent', -- Text
        icon = 'fas fa-smog', -- Icon
        coords = vector3(-100.88, 6478.74, 31.0), -- Target Coords
        drawtext = vector3(-100.75, 6478.83, 31.44), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.5, -- Target size
    },

    ["BackDoorFusebox"] = {
        name = 'BackDoorFusebox', -- !!! Do not touch !!!
        label = 'Cut fuse', -- Text
        icon = 'fas fa-bolt', -- Icon
        coords = vector3(-97.48, 6474.93, 31.81), -- Target Coords
        drawtext = vector3(-97.13, 6475.22, 31.44), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.5, -- Target size
    },

    ["ElectricBox"] = {
        name = 'ElectricBox', -- !!! Do not touch !!!
        label = 'Breach security', -- Text
        icon = 'fas fa-bolt', -- Icon
        coords = vector3(-93.97, 6471.78, 31.43), -- Target Coords
        drawtext = vector3(-93.78, 6471.97, 31.43), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.5, -- Target size
    },

    
    ["EmployeeDoor"] = {
        name = 'EmployeeDoor', -- !!! Do not touch !!!
        label = 'Break the latch', -- Text
        icon = 'fas fa-link-slash', -- Icon
        coords = vector3(-109.79, 6468.43, 31.6), -- Target Coords
        drawtext = vector3(-109.33, 6468.14, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.4, -- Target size
    },

    ["AnimalBook"] = {
        name = 'AnimalBook', -- !!! Do not touch !!!
        label = 'Check board', -- Text
        icon = 'fas fa-folder-open', -- Icon
        coords = vector3(-94.27, 6461.36, 32.4), -- Target Coords
        drawtext = vector3(-94.72, 6461.77, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.75, -- Target size
    },

    ["Puzzle1"] = {
        name = 'Puzzle1', -- !!! Do not touch !!!
        label = 'First clue', -- Text
        icon = 'fas fa-file-image', -- Icon
        coords = vector3(-112.74, 6473.25, 31.80), -- Target Coords
        drawtext = vector3(-113.13, 6473.71, 31.8), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.4, -- Target size
    },

    ["Puzzle2"] = {
        name = 'Puzzle2', -- !!! Do not touch !!!
        label = 'Second clue', -- Text
        icon = 'fas fa-file-image', -- Icon
        coords = vector3(-111.89, 6472.42, 31.80), -- Target Coords
        drawtext = vector3(-112.26, 6472.88, 31.55), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.4, -- Target size
    },

    ["Puzzle3"] = {
        name = 'Puzzle3', -- !!! Do not touch !!!
        label = 'Third clue', -- Text
        icon = 'fas fa-file-image', -- Icon
        coords = vector3(-110.63, 6471.28, 31.80), -- Target Coords
        drawtext = vector3(-110.29, 6471.28, 31.54), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.4, -- Target size
    },

    ["Key"] = {
        name = 'Key', -- !!! Do not touch !!!
        label = 'Search security guard', -- Text
        icon = 'fas fa-wallet', -- Icon
        coords = vector3(-99.52, 6469.99, 30.63), -- Target Coords
        drawtext = vector3(-99.52, 6469.99, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.7, -- Target size
    },

    ["SecurityDoor"] = {
        name = 'SecurityDoor', -- !!! Do not touch !!!
        label = 'Unlock door', -- Text
        icon = 'fas fa-key', -- Icon
        coords = vector3(-102.08, 6465.37, 31.62), -- Target Coords
        drawtext = vector3(-101.81, 6465.69, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.4, -- Target size
    },

    ["OfficeDoor"] = {
        name = 'OfficeDoor', -- !!! Do not touch !!!
        label = 'Unlock door', -- Text
        icon = 'fas fa-key', -- Icon
        coords = vector3(-98.25, 6461.41, 31.75), -- Target Coords
        drawtext = vector3(-98.45, 6461.17, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target Distance
        size = 0.3, -- Target size
    },

    ["OfficeComputerRight1"] = {
        name = 'OfficeComputerRight1', -- !!! Do not touch !!!
        label = 'Enter code', -- Text
        icon = 'fas fa-lock', -- Icon
        coords = vector3(-97.38, 6466.24, 31.63), -- Target Coords
        drawtext = vector3(-96.9, 6466.57, 31.63), -- Drawtext Coords
        distance = 0.90, -- Target Distance
        size = 0.6, -- Target size
    },

    ["OfficeComputerLeft1"] = {
        name = 'OfficeComputerLeft1', -- !!! Do not touch !!!
        label = 'Hack computer', -- Text
        icon = 'fas fa-lock', -- Icon
        coords = vector3(-94.4, 6462.95, 31.62), -- Target Coords
        drawtext = vector3(-94.31, 6463.88, 31.63), -- Drawtext Coords
        distance = 0.90, -- Target Distance
        size = 0.6, -- Target size
    },

    ["OfficeComputerRight2"] = {
        name = 'OfficeComputerRight2', -- !!! Do not touch !!!
        label = 'Access computer', -- Text
        icon = 'fas fa-lock', -- Icon
        coords = vector3(-97.38, 6466.24, 31.63), -- Target Coords
        drawtext = vector3(-96.9, 6466.57, 31.63), -- Drawtext Coords
        distance = 0.90, -- Target Distance
        size = 0.6, -- Target size
    },

    ["OfficeComputerLeft2"] = {
        name = 'OfficeComputerLeft2', -- !!! Do not touch !!!
        label = 'Access computer', -- Text
        icon = 'fas fa-lock', -- Icon
        coords = vector3(-94.4, 6462.95, 31.62), -- Target Coords
        drawtext = vector3(-94.31, 6463.88, 31.63), -- Drawtext Coords
        distance = 0.90, -- Target Distance
        size = 0.6, -- Target size
    },

    ["OfficeSearch1"] = {
        name = 'OfficeSearch1', -- !!! Do not touch !!!
        label = 'Search', -- Text
        icon = 'fas fa-search', -- Icon
        coords = vector3(-94.46, 6466.11, 31.61), -- Target Coords
        drawtext = vector3(-94.71, 6465.77, 31.63), -- Drawtext Coords
        distance = 0.90, -- Target Distance
        size = 0.5, -- Target size
    },

    ["OfficeSearch2"] = {
        name = 'OfficeSearch2', -- !!! Do not touch !!!
        label = 'Search', -- Text
        icon = 'fas fa-search', -- Icon
        coords = vector3(-93.55, 6465.12, 31.51), -- Target Coords
        drawtext = vector3(-93.66, 6464.87, 31.63), -- Drawtext Coords
        distance = 0.90, -- Target Distance
        size = 0.5, -- Target size
    },

    ["OfficeSearch3"] = {
        name = 'OfficeSearch3', -- !!! Do not touch !!!
        label = 'Search', -- Text
        icon = 'fas fa-search', -- Icon
        coords = vector3(-92.52, 6464.36, 31.51), -- Target Coords
        drawtext = vector3(-92.82, 6463.99, 31.63), -- Drawtext Coords
        distance = 0.75, -- Target Distance
        size = 0.5, -- Target size
    },

    ["MainComputer1"] = {
        name = 'MainComputer1', -- !!! Do not touch !!!
        label = 'Access computer', -- Text
        icon = 'fas fa-keyboard', -- Icon
        coords = vector3(-106.18, 6470.58, 31.63), -- Target Coords
        drawtext = vector3(-105.85, 6470.83, 31.63), -- Drawtext Coords
        distance = 0.75, -- Target Distance
        size = 0.5, -- Target size
    },

    ["MainComputer2"] = {
        name = 'MainComputer2', -- !!! Do not touch !!!
        label = 'Access computer', -- Text
        icon = 'fas fa-keyboard', -- Icon
        coords = vector3(-106.18, 6470.58, 31.63), -- Target Coords
        drawtext = vector3(-105.85, 6470.83, 31.63), -- Drawtext Coords
        distance = 0.75, -- Target Distance
        size = 0.5, -- Target size
    },

    ["MainComputer3"] = {
        name = 'MainComputer3', -- !!! Do not touch !!!
        label = 'Access computer', -- Text
        icon = 'fas fa-keyboard', -- Icon
        coords = vector3(-106.18, 6470.58, 31.63), -- Target Coords
        drawtext = vector3(-105.85, 6470.83, 31.63), -- Drawtext Coords
        distance = 0.75, -- Target Distance
        size = 0.5, -- Target size
    },

    ["Vault"] = {
        name = 'Vault', -- !!! Do not touch !!!
        label = 'Scan securtiy card', -- Text
        icon = "fa-solid fa-mobile-screen-button", -- Icon
        coords = vector3(-105.79, 6472.05, 31.76), -- Target Coords
        drawtext = vector3(-105.41, 6471.74, 31.63), -- Drawtext Coords
        vaultCoords = vector3(-104.6, 6473.44, 31.8),  -- !!! Do not touch !!!
        vaultOpenHeading = 150.0,  -- !!! Do not touch !!!
        vaultClosedHeading = 46.0,  -- !!! Do not touch !!!
        distance = 1.0, -- Target distance
        size = 0.4, -- Target size
    },

    ["VaultGate"] = {
        name = 'VaultGate', -- !!! Do not touch !!!
        label = 'Plant C4', -- Text
        icon = "fas fa-bomb", -- Icon
        coords = vector3(-105.35, 6474.72, 31.63), -- Target Coords
        drawtext = vector3(-105.46, 6474.46, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target distance
        size = 0.4, -- Target size
    },

    ["Gate"] = {
        name = 'Gate', -- !!! Do not touch !!!
        label = 'Plant C4', -- Text
        icon = "fas fa-bomb", -- Icon
        coords = vector3(-105.93, 6460.85, 31.63), -- Target Coords
        drawtext = vector3(-105.53, 6461.25, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target distance
        size = 0.4, -- Target size
    },

    ["Keycard"] = {
        name = 'Keycard', -- !!! Do not touch !!!
        label = 'Pickup keycard', -- Text
        icon = "fas fa-address-card", -- Icon
        coords = vector3(-104.11, 6457.76, 31.63), -- Target Coords
        drawtext = vector3(-104.69, 6458.22, 31.63), -- Drawtext Coords
        distance = 1.0, -- Target distance
        size = 0.4, -- Target size
    },

    ["SmallVault"] = {
        name = 'SmallVault', -- !!! Do not touch !!!
        label = 'Scan securtiy card', -- Text
        icon = "fa-solid fa-mobile-screen-button", -- Icon
        coords = vector3(-102.85, 6459.25, 32.35), -- Target Coords
        drawtext = vector3(-103.07, 6459.46, 31.63), -- Drawtext Coords
        vaultCoords = vector3(-101.6, 6460.41, 31.88),  -- !!! Do not touch !!!
        vaultOpenHeading = 150.0,  -- !!! Do not touch !!!
        vaultClosedHeading = 225.0,  -- !!! Do not touch !!!
        distance = 1.0, -- Target distance
        size = 0.4, -- Target size
    },
}

Config.Security = {
    ["Security1"] = {
        Status = true, -- Enable/Disable that ped
        Model = "s_m_m_security_01", -- Ped models check the link for others -> (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-98.82, 6470.66, 30.63, 157.15), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- Ped ammo
    },
    ["Security2"] = {
        Status = true, -- Enable/Disable that ped
        Model = "s_m_m_security_01", -- Ped models check the link for others -> (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-101.16, 6467.12, 30.63, 141.92), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- Ped ammo
    },
    ["Security3"] = {
        Status = true, -- Enable/Disable that ped
        Model = "s_m_m_security_01", -- Ped models check the link for others -> (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-103.39, 6459.74, 30.63, 43.06), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- Ped ammo
    },
    ["Security4"] = {
        Status = true, -- Enable/Disable that ped
        Model = "s_m_m_security_01", -- Ped models check the link for others -> (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-105.71, 6462.58, 30.63, 44.78), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- Ped ammo
    },
}

Config.Trollys = {
    ['Trolly1'] = {
        Type = "gold", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly1', -- !!! Do not touch !!!
        Coords = vector3(-106.41, 6477.87, 30.63), -- Target Coords
        DrawText = vector3(-106.1, 6477.5, 31.63), -- Drawtext Coords
        Heading = 226.28, -- Heading
        Icon = 'fas fa-dollar-sign', -- Icon
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Target size
    },
    ['Trolly2'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly2', -- !!! Do not touch !!!
        Coords = vector3(-102.51, 6477.07, 30.63), -- Target Coords
        DrawText = vector3(-103.01, 6476.56, 31.63), -- Drawtext Coords
        Heading = 131.74, -- Heading
        Icon = 'fas fa-dollar-sign', -- Icon
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Target size
    },
    ['Trolly3'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly3', -- !!! Do not touch !!!
        Coords = vector3(-108.02, 6461.22, 30.63), -- Target Coords
        DrawText = vector3(-107.78, 6460.94, 31.63), -- Drawtext Coords
        Heading = 221.13, -- Heading
        Icon = 'fas fa-dollar-sign', -- Icon
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Target size
    },
    ['Trolly4'] = {
        Type = "gold", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly4', -- !!! Do not touch !!!
        Coords = vector3(-100.45, 6458.11, 30.63), -- Target Coords
        DrawText = vector3(-100.7, 6458.41, 31.63), -- Drawtext Coords
        Heading = 39.82, -- Heading
        Icon = 'fas fa-dollar-sign', -- Icon
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Target size
    },
    ['Trolly5'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly5', -- !!! Do not touch !!!
        Coords = vector3(-103.08, 6457.75, 30.63), -- Target Coords
        DrawText = vector3(-102.91, 6457.57, 31.63), -- Drawtext Coords
        Heading = 225.47, -- Heading
        Icon = 'fas fa-dollar-sign', -- Icon
        Distance = 1.0, -- Target Distance
        Size = 0.3, -- Target size
    },
}

Config.Items = {
    ["Pliers"] = "pliers",
    ["Key"] = "paleto_key",
    ["Keycard"] = "paletocardone",
    ["Keycard2"] = "purplekeycard", -- Need to add it somewhere to be obtained outside of the heist
    ["Bag"] = "bag",
    ["StickyBomb"] = "dynamite",
    ["TearGas"] = "gasgrenade",
    ["Device"] = "signaljammer",
    ["Phone"] = "signaljammer",
    ["Decryptor"] = "signaljammer",
    ["HackCard"] = "passcodeinjector",
}

Config.ItemsBreak = {
    ["Pliers"] = 0, -- % Break Chance
    ["Device"] = 0, -- % Break Chance
    ["Phone"] = 0, -- % Break Chance
    ["Decryptor"] = 0, -- % Break Chance
    ["HackCard"] = 100,
    ["Keycard2"] = 100,
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- Door opening sound
    ["DoorUnlockSoundVolume"] = 2.0, -- Door opening volume
    ["DoorUnlockSoundDistance"] = 3.0, -- Door opening sound distance
    ["VaultAlarm"] = 'security-alarm', -- Alarm sound
    ["VaultAlarmVolume"] = 0.1, -- Alarm volume
    ["VaultAlarmDistance"] = 3.0, -- Alarm  sound distance
    ["LaserSound"] = 'nv', -- Laser sound
    ["LaserVolume"] = 0.05, -- Laser volume
    ["LaserDistance"] = 15.0, -- Laser sound distance
    ["BombBeeping"] = 'heartmonbeat', -- The sound that is played when the bomb is beeping
    ["BombBeepingSoundVolume"] = 3.0, -- The volume of the sound
    ["BombBeepingSoundDistance"] = 15.0, -- Bomb beeping sound distance
}

Config.SecurityOptions = { -- Ped Configurations
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

Config.Rewardcash = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per cash stack pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 250000, max = 350000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = true, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewardgold = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per gold bar pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "goldbar", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 20, max = 30}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of gold bars you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewarddiamond = {
    ["ObtainPerPickup"] = true, -- Obtain the specified items below per diamond box pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "diamond", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1, max = 1}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of diamonds you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Animals = { -- Hints for guessing the animals, change translations accordingly if needed
    ["🐭"] = "A small animal usually gets chased by cats.",
    ["🐻"] = "Winnie The Pooh.",
    ["🐵"] = "A funny animal that loves to swing on trees.",
    ["🐶"] = "A friendly pet that barks and wags its tail.",
    ["🐺"] = "A wild dog that howls in the night.",
    ["🐱"] = "A soft animal that purrs and likes to nap.",
    ["🦁"] = "A big, strong cat that is the king of the jungle.",
    ["🐯"] = "A big cat with stripes that roars loudly.",
    ["🦝"] = "An animal with a cute face and special markings.",
    ["🐮"] = "A big animal on the farm that says 'moo.'",
    ["🐷"] = "A pink farm animal that oinks and likes mud.",
    ["🦒"] = "A tall and spotty animal with a long neck.",
    ["🐰"] = "A small animal with long ears that hops around.",
    ["🐹"] = "A tiny, fluffy pet that runs in a wheel.",
    ["🐼"] = "A black and white bear that eats bamboo.",
    ["🐔"] = "A bird on the farm that clucks and lays eggs.",
    ["🐴"] = "A friendly animal that people ride and take care of.",
    ["🐸"] = "A green animal with big eyes that says 'ribbit.'",
    ["🦓"] = "A black and white horse from Africa with stripes.",
    ["🐢"] = "A slow animal with a hard shell on its back.",
    ["🐘"] = "A giant animal with a long trunk and big ears.",
    ["🦨"] = "A black and white animal that farts.",
    ["🐟"] = "A small swimming animal that lives in the water.",
    ["🦈"] = "A big fish with sharp teeth that lives in the ocean.",
    ["🐬"] = "A smart and friendly animal that swims and jumps in the sea.",
    ["🦆"] = "A bird that quacks and likes to swim in ponds.",
    ["🦉"] = "A wise bird that comes out at night and hoots.",
    ["🦃"] = "A bird that people celebrate with on Thanksgiving.",
    ["🐧"] = "A black and white bird that walks like a funny little person, lives in the cold.",
    ["🕷️"] = "A small creature with eight legs that makes webs.",
    ["🐜"] = "A tiny insect that works together with its friends.",
    ["🐌"] = "A slow animal with a spiral shell on its back.",
    ["🦋"] = "A colorful insect with wings that flutters around.",
    ["🐝"] = "A buzzy insect that collects nectar from flowers.",
    ["🦇"] = "A flying animal that comes out at night and lives in caves.",
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

Config.Weapons = { -- Choose which weapons are required to have in hand to initiate the heist (Loud way)
    -- Melee
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMBATPISTOL',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_MUSKET',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_PISTOL50',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_SMG',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_SAWNOFFSHOTGUN',
    'weapon_appistol',
    'weapon_stungun',
    'weapon_vintagepistol',
    'weapon_marksmanpistol',
    'weapon_revolver_mk2',
    'weapon_doubleaction',
    'weapon_snspistol_mk2',
    'weapon_ceramicpistol',
    'weapon_navyrevolver',
    'weapon_gadgetpistol',
    'weapon_pistolxm3',
    'weapon_2011',
    'weapon_smg_mk2',
    'weapon_assaultsmg',
    'weapon_combatpdw',
    'weapon_machinepistol',
    'weapon_minismg',
    'weapon_assaultshotgun',
    'weapon_bullpupshotgun',
    'weapon_musket',
    'weapon_heavyshotgun',
    'weapon_dbshotgun',
    'weapon_autoshotgun',
    'weapon_pumpshotgun_mk2',
    'weapon_combatshotgun',
    'weapon_assaultrifle_mk2',
    'weapon_carbinerifle_mk2',
    'weapon_advancedrifle',
    'weapon_compactrifle',
    'weapon_specialcarbine_mk2',
    'weapon_bullpuprifle_mk2',
    'weapon_militaryrifle',
    'weapon_projectx',
    'WEAPON_PROJECTXSMG',
    'WEAPON_PROJECTXPISTOL',
    'WEAPON_ARCTIC516',
    'weapon_ak47',
    'weapon_de',
    'weapon_fnx45',
    'weapon_glock17',
    'weapon_m4',
    'weapon_m9',
    'weapon_m70',	
    'weapon_m1911',	
    'weapon_uzi',	
    'weapon_mac10',
    'weapon_mossberg', 
    'weapon_remington',
    'weapon_scarh',
    'weapon_shiv',	
    'weapon_ar15',	
    'weapon_mk14',
    'weapon_sledgehammer',
    'weapon_mp9',			
    'weapon_m110',			
    'weapon_hk416',	
    'weapon_ak74',
    'weapon_aks74',	
    'weapon_glock18c',	
    'weapon_glock22',
    'weapon_mp5',
    'weapon_karambit',	
    'weapon_mcxspear', 		
    'weapon_nsr9', 
    'weapon_beanbagshotgun',
    'weapon_rfb',         
    'weapon_2011',
    'weapon_hk416b',    
    'weapon_agc',	
    'weapon_kvr',
    'weapon_p5',	
    'weapon_pm4',
    'weapon_mrevolver',
    'weapon_x19',
    'weapon_gang1',
    'weapon_gang2',
    'weapon_gang3',
    'weapon_gang4',
    'weapon_gang5',
    'weapon_gang6',
    'weapon_gang7',
    'weapon_gang8',
    'weapon_gang9',
    'weapon_gang10',
    'WEAPON_EASTERAP',
    'WEAPON_EASTERSEMI',
    'WEAPON_EASTERHB',
    'WEAPON_MK18',	
    'WEAPON_M320b',	
    'WEAPON_590',
    'weapon_x17',
    'weapon_c36',		
    'weapon_mi9',			
    'weapon_mutant_long',		
    'weapon_virtus_4',	
    'weapon_bluearp762',       
    'weapon_g19xcustom',   
    'weapon_arpsc',
    'weapon_sfarp',
    'weapon_glock41',        
    'weapon_plr16kt',          
    'weapon_g19xblack',               
    'weapon_g17g5mos',          
    'weapon_g26switchp',
    'weapon_cg17p80s',         
    'weapon_mdsh',
    'WEAPON_MB47',
    'WEAPON_2S',		
    'WEAPON_A45',
    'WEAPON_RATREV',
    'WEAPON_FMICRODRAGON',
    'WEAPON_PSTRIKEH',
    'WEAPON_PSPIKE',
    'WEAPON_PH4',
    'WEAPON_PT39',
    'WEAPON_P1911KT',
    'WEAPON_PT19',
    'WEAPON_PPH120',
    'WEAPON_PCM4A1',
    'WEAPON_PMK40H1',
    'WEAPON_PXS9',
    'WEAPON_PT17',
    'WEAPON_PMK14',
    'WEAPON_PHW45',
    'WEAPON_PPH350',
    'WEAPON_PDBATON',
    'WEAPON_BTASER',
    'WEAPON_YTASER',
    'WEAPON_PDT19',
    'WEAPON_PDPT870',
    'WEAPON_PDPT700',
    'WEAPON_MK417',
    'WEAPON_PDDT607',
    'WEAPON_PDDT7',
    'WEAPON_PDT22',
    'WEAPON_PDBR5',
    'WEAPON_PDFC66',
    'WEAPON_PDMK45',
    'WEAPON_PDMK33',
    'WEAPON_PDMKUSP',
    'WEAPON_PROJECTXPISTOLUM',
}

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
        -- Paleto Employee Door (1)
    {
        objCoords  = vector3(-108.91, 6469.11, 31.91),
        objHash = -1184592117,
        objYaw = 45.0,
        locked = true,
    },
        -- Paleto Vault Gate (2)
    {
        objCoords  = vector3(-106.47, 6476.16, 31.95),
        objHash = 1309269072,
        objYaw = 315.07,
        locked = true,
    },
        -- Paleto Vault2 Room Door (3)
    {
        objCoords  = vector3(-104.39, 6464.71, 31.78),
        objHash = -2051651622,
        objYaw = 135.4,
        locked = true,
    },

        -- Paleto Office Door (4)
    {
        objCoords  = vector3(-99.56, 6462.88, 31.78),
        objHash = -538477509,
        objYaw = 135.0,
        locked = true,
    },

        -- Paleto Back Door (5)
    {
        objCoords  = vector3(-96.68, 6474.08, 31.78),
        objHash = -2051651622,
        objYaw = 134.61,
        locked = true,
    },

        -- Paleto Back Door 2 (6)
    {
        objCoords  = vector3(-102.91, 6466.23, 31.78),
        objHash = -2051651622,
        objYaw = 135.41,
        locked = true,
    },

        -- Paleto Back Door 3 (7)
    {
        objCoords  = vector3(-100.17, 6468.73, 31.78),
        objHash = -538477509,
        objYaw = 35.0,
        locked = true,
    },
}