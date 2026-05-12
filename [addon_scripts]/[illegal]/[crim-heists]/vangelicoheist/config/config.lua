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
    Inventory = "ox", -- "ox" "qs" "qb" "codem" "tgiann" "esx" "lj" "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" "l2s" "redutzu" "lb" "sonoran" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Target = 'ox_target', -- Target name
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    DrawTextRotation = 70.0, -- Rotation of the drawtext zone
    Interaction = { -- true for target, false for drawtext
        ["Button"] = 38, -- [E] by default

        ["SmokeRoof"] = true,
        ["Ped"] = true,
        ["Fingerprint"] = true,
        ["NumberPad"] = true,
        ["Display"] = true,
        ["Fusebox"] = true,
        ["Cabinet"] = true,
        ["Safe"] = true,
        ["Props"] =true,
        ["Vitrine"] = true,
        ["Vault"] = true,
        ["Trolly"] = true,
        ["Gem"] = true,
    },

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch
    MinimumPolice = 6, -- Minimum police required to start the robbery

    ResetHeist = 90, -- (Minutes) Time to reset the heist after a robbery
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    AutoAlarmOff = 5, -- (Minutes) Time to turn off the alarm automatically
    RequireBag = true, -- If they need a bag to loot

    DisableSmoke = false, -- Disable C4 explosion effects
    DisableLaserDamage = false, -- Disable Laser Damage
    SmokeRepetition = 1, -- How many times the smoke will be thrown
    SmokeTime = 10000, -- How long the smoke will last until the next one is thrown

    -- Strike System (Silent = High risk, Higher reward, Loud = No risk, Fixed reward)
    Strikes = 3, -- How many strikes players have to reach before having their reward cut

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 50, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "uhc", Chance = 100, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            -- {Name = "security_card_01", Chance = 50, Amount = {min = 1, max = 1}},
            -- {Name = "c4", Chance = 30, Amount = {min = 1, max = 1}},
        },
    },

    -- Skill System
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 10, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },
    
    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 80, -- Chance of stress on the crime scene
        ["Amount"] = {min = 3, max = 5}, -- Amount of stress applied
    },

    DispatchLocation = { -- Choose where the alarm gets triggered, only one should be picked
        ["Employee1"] = true, -- Hacking the office keypad
        ["Employee2"] = false, -- Second computer hack
        ["OpenFusebox1"] = false, -- Second computer hack
        ["OpenFusebox2"] = false, -- Hacking the computer
    },

    Code = { -- Password for the number pad
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Numberpad Code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Numberpad', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    Props = {
        ["Fusebox1"] = "ch_prop_ch_fuse_box_01a",
        ["Fusebox2"] = "ch_prop_ch_fuse_box_01a",
        ["OpenFusebox1"] = "m24_1_prop_m41_fuse_box_01a",
        ["OpenFusebox2"] = "m24_1_prop_m41_fuse_box_01a",
        ["JewelBox1"] = "ex_office_swag_jewelwatch2",
        ["JewelBox2"] = "ex_office_swag_jewelwatch3",
        ["Button1"] = "h4_prop_h4_casino_button_01b",
        ["Button2"] = "h4_prop_h4_casino_button_01b",
        ["Fingerprint"] = "ch_prop_fingerprint_scanner_01c",
    },

    -- Durations
    NotificationDuration = 2500, -- Notification duration

    NpcDuration = 6000, -- Npc duration
    SmokeDuration = 6000, -- Smoke grenade duration
    SafeDuration = 6000, -- Panel duration
    PropsDuration = 3000, -- Props duration
    DisplayDuration = 6000, -- Display duration
    CabinetDuration = 6000, -- Cabinet duration
    GemDuration = 6000, -- Gem duration
    OpenFuseboxDuration = 6000, -- Open fusebox duration
}

Config.Npc = {
    ["Employee1"] = {
        ["Model"] = "a_f_y_bevhills_04",
        ["Coords"] = vector4(-619.16, -228.67, 37.07, 125.55),
    },
    ["Employee2"] = {
        ["Model"] = "a_f_y_bevhills_04",
        ["Coords"] = vector4(-626.44, -228.3, 37.07, 214.71),
    },
    ["Employee3"] = {
        ["Model"] = "a_f_y_bevhills_04",
        ["Coords"] = vector4(-621.03, -235.64, 37.07, 34.44),
    },
    ["Manager"] = {
        ["Model"] = "a_m_y_smartcaspat_01",
        ["Coords"] = vector4(-619.09, -240.89, 37.06, 318.32),
    },
}

Config.VangelicoSteps = {
    ["SmokeRoof"] = {
        name = "SmokeRoof",
        label = "Throw a smoke grenade",
        coords = vector3(-608.45, -252.97, 52.60),
        drawtext = vector3(-608.98, -253.35, 52.31),
        distance = 1.0,
        icon = "fas fa-bomb",
        size = 0.5,
    },
    ["Employee1"] = {
        name = "Employee1",
        label = "Threaten",
        coords = vector3(-619.16, -228.67, 38.47),
        drawtext = vector3(-620.35, -229.62, 38.06),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.6,
    },
    ["Employee2"] = {
        name = "Employee2",
        label = "Threaten",
        coords = vector3(-626.44, -228.3, 38.47),
        drawtext = vector3(-625.62, -229.41, 38.06),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.6,
    },
    ["Employee3"] = {
        name = "Employee3",
        label = "Threaten",
        coords = vector3(-621.03, -235.64, 38.47),
        drawtext = vector3(-621.82, -234.49, 38.06),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.6,
    },
    ["Manager1"] = {
        name = "Manager1",
        label = "Threaten",
        coords = vector3(-619.09, -240.89, 38.47),
        drawtext = vector3(-618.32, -240.04, 38.06),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.6,
    },
    ["Manager2"] = {
        name = "Manager2",
        label = "Threaten",
        coords = vector3(-616.45, -241.87, 38.46),
        drawtext = vector3(-616.45, -241.87, 38.06),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.6,
    },
    ["NumberPad"] = {
        name = "NumberPad",
        label = "Enter the code",
        coords = vector3(-615.32, -238.17, 38.60),
        drawtext = vector3(-615.92, -238.23, 38.06),
        distance = 1.0,
        icon = "fas fa-code-commit",
        size = 0.4,
    },
    ["Safe1"] = {
        name = "Safe1",
        label = "Obtain fingerprints",
        coords = vector3(-614.88, -239.96, 37.6),
        drawtext = vector3(-615.21, -240.2, 38.06),
        distance = 0.75,
        icon = "fas fa-lock",
        size = 0.5,
    },
    ["Safe2"] = {
        name = "Safe2",
        label = "Unlock safe",
        coords = vector3(-614.88, -239.96, 37.6),
        drawtext = vector3(-615.21, -240.2, 38.06),
        distance = 0.75,
        icon = "fas fa-lock",
        size = 0.5,
    },
    ["Fingerprint"] = {
        name = "Fingerprint",
        label = "Use fingerprint",
        coords = vector3(-620.74, -239.43, 38.18),
        drawtext = vector3(-620.36, -239.75, 38.06),
        distance = 0.75,
        icon = "fas fa-fingerprint",
        size = 0.4,
    },
    ["Gem"] = {
        name = "Gem",
        label = "Cut glass",
        coords = vector3(-624.22, -232.27, 38.09),
        drawtext = vector3(-624.75, -232.63, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.75,
    },
    ["OpenFusebox1"] = {
        name = "OpenFusebox1",
        label = "Open Fusebox",
        coords = vector3(-627.98, -240.54, 38.22),
        drawtext = vector3(-627.51, -240.24, 38.06),
        distance = 1.0,
        icon = "fab fa-elementor",
        size = 0.5,
    },
    ["OpenFusebox2"] = {
        name = "OpenFusebox2",
        label = "Open Fusebox",
        coords = vector3(-633.19, -233.38, 38.22),
        drawtext = vector3(-632.87, -233.25, 38.06),
        distance = 1.0,
        icon = "fab fa-elementor",
        size = 0.5,
    },
    ["Fusebox1"] = {
        name = "Fusebox1",
        label = "Open Fusebox",
        coords = vector3(-627.98, -240.54, 38.22),
        drawtext = vector3(-627.51, -240.24, 38.06),
        distance = 1.0,
        icon = "fab fa-elementor",
        size = 0.5,
    },
    ["Fusebox2"] = {
        name = "Fusebox2",
        label = "Open Fusebox",
        coords = vector3(-633.19, -233.38, 38.22),
        drawtext = vector3(-632.87, -233.25, 38.06),
        distance = 1.0,
        icon = "fab fa-elementor",
        size = 0.5,
    },
    ["Prop1"] = {
        name = "Prop1",
        label = "Pickup box",
        coords = vector3(-617.92, -228.59, 38.45),
        drawtext = vector3(-618.17, -229.11, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Prop2"] = {
        name = "Prop2",
        label = "Pickup box",
        coords = vector3(-618.63, -227.57, 38.45),
        drawtext = vector3(-619.3, -227.54, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine1"] = {
        name = "Vitrine1",
        label = "Break vitrine",
        coords = vector3(-618.32, -234.89, 38.0),
        drawtext = vector3(-617.41, -234.24, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine2"] = {
        name = "Vitrine1",
        label = "Break vitrine",
        coords = vector3(-619.24, -233.83, 38.0),
        drawtext = vector3(-618.91, -232.94, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine3"] = {
        name = "Vitrine3",
        label = "Break vitrine",
        coords = vector3(-620.62, -234.35, 38.0),
        drawtext = vector3(-621.09, -233.57, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine4"] = {
        name = "Vitrine4",
        label = "Break vitrine",
        coords = vector3(-623.18, -236.14, 38.0),
        drawtext = vector3(-623.67, -235.29, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine5"] = {
        name = "Vitrine5",
        label = "Break vitrine",
        coords = vector3(-623.98, -237.31, 38.0),
        drawtext = vector3(-624.91, -237.08, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine6"] = {
        name = "Vitrine6",
        label = "Break vitrine",
        coords = vector3(-623.42, -238.56, 38.0),
        drawtext = vector3(-624.28, -239.2, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine7"] = {
        name = "Vitrine7",
        label = "Break vitrine",
        coords = vector3(-624.62, -240.95, 38.0),
        drawtext = vector3(-625.09, -240.2, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine8"] = {
        name = "Vitrine8",
        label = "Break vitrine",
        coords = vector3(-632.52, -230.15, 38.0),
        drawtext = vector3(-631.98, -230.87, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine9"] = {
        name = "Vitrine9",
        label = "Break vitrine",
        coords = vector3(-629.96, -229.63, 38.0),
        drawtext = vector3(-630.82, -230.27, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine10"] = {
        name = "Vitrine10",
        label = "Break vitrine",
        coords = vector3(-628.94, -230.58, 38.0),
        drawtext = vector3(-629.13, -231.42, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine11"] = {
        name = "Vitrine11",
        label = "Break vitrine",
        coords = vector3(-627.51, -230.12, 38.0),
        drawtext = vector3(-626.99, -230.87, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine12"] = {
        name = "Vitrine12",
        label = "Break vitrine",
        coords = vector3(-625.07, -228.23, 38.0),
        drawtext = vector3(-624.52, -229.02, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine13"] = {
        name = "Vitrine13",
        label = "Break vitrine",
        coords = vector3(-624.14, -227.09, 38.0),
        drawtext = vector3(-623.26, -227.23, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine14"] = {
        name = "Vitrine14",
        label = "Break vitrine",
        coords = vector3(-624.81, -225.85, 38.0),
        drawtext = vector3(-623.95, -225.21, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine15"] = {
        name = "Vitrine15",
        label = "Break vitrine",
        coords = vector3(-620.61, -227.88, 38.0),
        drawtext = vector3(-621.48, -228.49, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine16"] = {
        name = "Vitrine16",
        label = "Break vitrine",
        coords = vector3(-619.01, -230.3, 38.0),
        drawtext = vector3(-619.8, -230.89, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine17"] = {
        name = "Vitrine17",
        label = "Break vitrine",
        coords = vector3(-621.64, -231.96, 38.0),
        drawtext = vector3(-622.21, -231.15, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine18"] = {
        name = "Vitrine18",
        label = "Break vitrine",
        coords = vector3(-625.21, -234.41, 38.0),
        drawtext = vector3(-625.81, -233.74, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine19"] = {
        name = "Vitrine19",
        label = "Break vitrine",
        coords = vector3(-626.56, -232.56, 38.0),
        drawtext = vector3(-626.03, -233.38, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Vitrine20"] = {
        name = "Vitrine20",
        label = "Break vitrine",
        coords = vector3(-623.02, -230.02, 38.0),
        drawtext = vector3(-622.48, -230.77, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display1"] = {
        name = "Display1",
        label = "Break display",
        coords = vector3(-621.6, -222.73, 38.5),
        drawtext = vector3(-622.14, -223.26, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display2"] = {
        name = "Display2",
        label = "Break display",
        coords = vector3(-620.8, -224.13, 38.5),
        drawtext = vector3(-621.18, -224.36, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display3"] = {
        name = "Display3",
        label = "Break display",
        coords = vector3(-619.77, -225.32, 38.5),
        drawtext = vector3(-620.05, -225.54, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display4"] = {
        name = "Display4",
        label = "Break display",
        coords = vector3(-616.23, -230.24, 38.5),
        drawtext = vector3(-616.51, -230.48, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display5"] = {
        name = "Display5",
        label = "Break display",
        coords = vector3(-615.34, -231.57, 38.5),
        drawtext = vector3(-615.55, -231.71, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display6"] = {
        name = "Display6",
        label = "Break display",
        coords = vector3(-614.48, -232.86, 38.5),
        drawtext = vector3(-614.65, -232.98, 38.06),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display7"] = {
        name = "Display7",
        label = "Break display",
        coords = vector3(-618.91, -226.39, 38.7),
        drawtext = vector3(-619.46, -226.82, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Display8"] = {
        name = "Display8",
        label = "Break display",
        coords = vector3(-616.88, -229.08, 38.7),
        drawtext = vector3(-617.51, -229.52, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Cabinet1"] = {
        name = "Cabinet1",
        label = "Open Cabinet",
        coords = vector3(-630.07, -227.55, 38.7),
        drawtext = vector3(-629.86, -227.85, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Cabinet2"] = {
        name = "Cabinet2",
        label = "Open Cabinet",
        coords = vector3(-628.38, -226.35, 38.7),
        drawtext = vector3(-628.12, -226.65, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Cabinet3"] = {
        name = "Cabinet3",
        label = "Open Cabinet",
        coords = vector3(-626.67, -225.16, 38.7),
        drawtext = vector3(-626.5, -225.42, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Cabinet4"] = {
        name = "Cabinet4",
        label = "Open Cabinet",
        coords = vector3(-618.13, -236.93, 38.7),
        drawtext = vector3(-618.37, -236.61, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Cabinet5"] = {
        name = "Cabinet5",
        label = "Open Cabinet",
        coords = vector3(-619.82, -238.14, 38.7),
        drawtext = vector3(-619.99, -237.83, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
    ["Cabinet6"] = {
        name = "Cabinet6",
        label = "Open Cabinet",
        coords = vector3(-621.48, -239.38, 38.7),
        drawtext = vector3(-621.72, -239.07, 38.07),
        distance = 0.75,
        icon = "fas fa-gem",
        size = 0.5,
    },
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["LaserSound"] = 'security-alarm', -- The sound that is played when you touch a laser
    ["LaserVolume"] = 0.05, -- The volume of the sound that is played
    ["LaserDistance"] = 15.0, -- The distance that the sound reaches
    ["BombBeeping"] = 'heartmonbeat', -- The sound that is played when the bomb is beeping
    ["BombBeepingSoundVolume"] = 0.5, -- The volume of the sound that is played
    ["BombBeepingSoundDistance"] = 15.0, -- The distance that the sound reaches
    ["LaserDisable"] = 'nv', -- The sound that is played when the disabling lasers
    ["LaserDisableSoundVolume"] = 3.0, -- The volume of the sound that is played
    ["LaserDisableSoundDistance"] = 15.0, -- The distance that the sound reaches
    ["KeypadBeeping"] = 'heartmonbeat', -- The sound that is played when the keypad is beeping
    ["KeypadBeepingSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["KeypadBeepingSoundDistance"] = 5.0, -- The distance that the sound reaches
    ["GlassBreaking"] = 'breaking_vitrine_glass', -- The sound that is played when the keypad is beeping
    ["GlassBreakingSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["GlassBreakingSoundDistance"] = 5.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound that is played when the alarm is on
    ["AlarmSoundVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmSoundDistance"] = 35.0, -- The distance that the sound reaches
    ["AlarmRepeat"] = 75, -- At 75 and Wait at 8000, the alarm will blare every 8 seconds for a total of 10 minutes
    ["AlarmWait"] = 8000, -- Waits between each alarm blare
}

Config.Items = {
    ["Bag"] = "bag",
    ["SmokeGrenade"] = "gasgrenade", --unused we disabled the silent mode
    ["Phone"] = "advancedlockpick", -- unused?
    ["Hammer"] = "WEAPON_HAMMER",
    ["Circuit"] = "pliers", --fuseboxes
    ["Device"] = "hackdevice", -- Enter the Code
    ["GlassCutter"] = "cutter", --cut glass for gem
    ["Key"] = "vangelicosafekey", -- opens safe (removed)
    ["FingerprintBag"] = "x_fingerprintbag", --given from safe, removed when u use fingerprint
    ["FingerprintTape"] = "pliers", -- fingerprint off of safe
}

Config.ItemsBreak = {
    ["Pliers"] = 0, -- % Break Chance
    ["Phone"] = 0, -- % Break Chance
    ["Device"] = 100, -- % Break Chance
    ["Drill"] = 0, -- % Break Chance
    ["Circuit"] = 0, -- % Break Chance
    ["Hammer"] = 0, -- % Break Chance
    ["FingerprintTape"] = 0,
    ["FingerprintBag"] = 100
}

Config.LootableProps = { -- 2 
    ["Prop1"] = {Item = "diamond_necklace", Amount = {min = 3, max = 5}, ObjectHash = "ex_office_swag_jewelwatch2", x = -1401.62, y = -238.75, z = 38.81, heading = 150.51, rotx = 0.0, roty = 0.0, rotz = 0.0},
    ["Prop2"] = {Item = "diamond_necklace", Amount = {min = 3, max = 5}, ObjectHash = "ex_office_swag_jewelwatch3", x = -1400.89, y = -239.56, z = 38.81, heading = 123.5, rotx = 0.0, roty = 0.0, rotz = 0.0},
}

Config.DisplayRewards = { -- 8
    [1] = {item = "diamond_ring", amount = {min = 2, max = 3}},
}

Config.CabinetRewards = { -- 6
    [1] = {item = "diamond_necklace", amount = {min = 2, max = 3}},
}

Config.VitrineRewards = { -- 20
    [1] = {item = "diamond_necklace", amount = {min = 1, max = 2}},
    [2] = {item = "diamond", amount = {min = 1, max = 2}},
    [3] = {item = "diamond_ring", amount = {min = 1, max = 2}},
}

Config.GemReward = {
    ["Item"] = "giant_gem",
    ["Amount"] = {min = 1, max = 1},
}

Config.SafeReward = {
    ["Item"] = "goldbar",
    ["Amount"] = {min = 20, max = 25},
}

Config.Rewardcash = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per cash stack pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 300000, max = 350000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = true, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewardgold = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per gold bar pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "goldbar", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 8, max = 11}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of gold bars you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewarddiamond = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per diamond box pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "diamond", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 15, max = 25}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of diamonds you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Trollys = {
    ['Trolly1'] = {
        Type = "cash", -- Loot type (cash/gold/diamond)
        Name = 'Trolly1', -- !!! Do not touch !!!
        Coords = vector3(-617.6, -243.26, 37.06),
        Drawtext = vector3(-618.05, -242.76, 38.06),
        Heading = 35.61,
        Icon = 'fas fa-gem', -- Icon for Trolly1
        Distance = 1.0, -- How far will you be able to interact with it
        Size = 0.3, -- Circle Zone size
    },
}

Config.SecurityGuards = {
    ["Security1"] = {
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_m_m_security_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-614.61, -237.42, 37.06, 18.88), -- You can change his location (only choose locations in the backhallway and security room)
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

Config.Weapons = {
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
    	-- First Door (1)
	{
        objCoords = vector3(-614.53, -234.45, 38.21),
        objHash = -254192963,
        objYaw = 216.95,
        locked = true,
	},
        -- Second Door (2)
    {
        objCoords = vector3(-615.66, -237.82, 38.21),
        objHash = -254192963,
        objYaw = 126.95,
        locked = true,
	},
}