Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa' 'fi' 'ge' 'he' 'hu' 'id' 'is' 'it' 'lv' 'pt' 'pt-br' 'ro' 'rs' 'sl' 'sv' 'th' 'tr' 'vn'
    Framework = 'qbox', -- 'auto' 'qb-core' 'qbox' 'esx' or 'custom'
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "auto" "ox" "qb" "codem" "origen" "tgiann" "esx" "lj" "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"
    Dialog = "ox", -- "ox" or "bl_dialog"
    Weather = "renewed", -- "auto" "qb" or "cd" "renewed" or "av"

    Interaction = "ox_target", -- "auto" "ox_target", "qb-target", "drawtext", "interact"

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)
    PolyTool = true, -- Enable/Disable Polyzone Tool, allows you to create polyzones ingame easily, used mainly to create zones for ped detection

    Dispatch = {
        Resource = 'cd', -- auto, cd, ps, outlaw, codem, five-dispatch, qf, aty, zat-mdt, opto, kartik, brutal, origen, tk, rcore, lb, redutzu, l2s, fd, sonoran, piotreqv1, piotreqv2, pp-mdt, core, emergencydispatch, wasabimdt, nextscripts, kibra, imperial, or customsv (Server side dispatch) or customcl (Client side dispatch), if you put it as "customsv" or "customcl", you will need to edit the dispatch function in opensource/client.lua or if your is server side in opensource/server.lua
        -- If you wish to change the text and other data on the dispatch you can do it here, not all dispatch systems support everything below:
        Title = 'House Robbery',
        Message = 'A house is being robbed',
        Code = '10-70',
        Time = 5, -- Time in seconds that the alert will appear for, most dispatch systems dont support this

        Blip = {
            Text = 'House Robbery',
            Color = 1,
            Sprite = 41,
            Scale = 0.8
        }
    },

    -- Drawtext Options
    DrawtextButton = 38, -- [E] by default
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib

    ResetHouseAfterRobbing = 15, -- (Minutes) How long until the house resets after someone robs it

    Cooldowns = {
        ["Time"] = 0, -- (Minutes) How long the cooldown will be

        ["GlobalRequestCooldown"] = false, -- If true, nobody will be able to request a robbery until the cooldown is over after someone starts a robbery

        ["HouseCooldown"] = true, -- If true, it will add a cooldown on the house for all players when someone robs it
        ["HouseCooldownTime"] = 30, -- (Minutes) How long the cooldown will be

        ["RemoveBlipTime"] = 5, -- (Minutes) How long until the blip gets removed after the robbery starts
    },

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch, to add more follow this format: {["police"] = true, ["fbi"] = true}

    NoTimeFrame = true, -- Set this to true if you want the robberies to have no time frames
    TimeFrame = {min = 20, max = 6}, -- (24 Hour Clock) Robbery time frame

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },

    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 1, max = 3}, -- Amount of stress applied
    },

    -- Required Item
    LockpickBreakChance = {
        ["OnFail"] = 100, -- Chance of breaking the lockpick on failure
        ["OnSuccess"] = 10, -- Chance of breaking the lockpick on success
    },

    -- Buckets, allows you to set up multiple IPL houses that can be robbed at the same time without interfering with each other
    Buckets = true, -- Enable/Disable Buckets system

    BurnerPhoneItem = false, -- Item required for approaches that require the burner phone, set it to false (BurnerPhoneItem = false) if you don't want to require an item, otherwise set it to "phone" as an example
    BagItem = false, -- Item required for taking items from the house, set it to false (BagItem = false) if you don't want to require an item
    DisableParticles = false, -- Disable particle effects
    HideMinimapOnCamera = true, -- Hides the player's minigame when the camera is active
    DisableAnimationWhileSendingLocation = false, -- Disable animation of the peds when sending a location

    RemoveMoneyType = "cash", -- "cash" or "bank" -- Money that will be used to pay for bribes
    CurrencySymbol = "$",

    -- XP System (If you want to use this option, you need to have a XP system script)
    XPSystem = true, -- Enable/disable XP system
    ServerSideEvents = true, -- Set to true, if you use a server-side event to add XP
    RobberySkillName = 'burglary', -- Name of the skill that will be used for the robbery XP system

    XPLevels = {
        [0] = 0,
        [1] = 200,
        [2] = 400,
        [3] = 600,
        [4] = 800,
        [5] = 1000,
        [6] = 1500
    },

    -- Limits
    MaxRobberiesPerPlayer = false, -- Maximum number of robberies that can be done by a player per restart (set to false to disable it, or set a number to enable it)
    MaxActiveRobberies = false, -- Maximum number of active robberies at the same time (set to false to disable it, or set a number to enable it)

    -- Tasks System
    ["Project X Tasks"] = false, -- Enable/Disable Project X Tasks integration (Requires you to have Project X Tasks installed)
    TasksListPosition = "left", -- Position of the tasks list, "left" or "right"

    -- Burner Phone System
    ["Project X Burner"] = false, -- Enable/Disable Project X Burner integration (Requires you to have Project X Burner installed)

    -- Group Work (If you want to use this, you need to either have a group system on your phone or one of the suggested scripts installed)
    GroupSystem = "lb",
    -- Phone Groups: "renewed", "lb", "yseries" (for "lb", you need to download and put in your resource folder: https://github.com/solareon/slrn_groups/)
    -- Normal Groups:

    Groups = false, -- Enable/disable group work (Requires you to have a group app on your phone or one of the suggested scripts installed)
    GroupMinimum = 1, -- Minimum players required to start a group work
    GroupLimit = 3, -- Max players that can be in a house robbery group to start a job
    OnlyGroupMembersCanRob = false, -- if true, only group members can rob the house, otherwise if false, anyone can join in on the robbery with the group
    GroupSearchXp = false, -- If true, it will give group XP to all group members for each searching spot done
    GroupDoneXp = false, -- If true, it will give group XP to all group members when the job is done

    -- Stealth
    AddScoreWhenFailed = 10.0, -- (Set to 0 to turn off) Adds this amount to the stealth score if the player fails the minigame
    AddScoreWhenOpeningDisplay = 20.0, -- (Set to 0 to turn off) Adds this amount to the stealth score when opening a display
    AddScoreWhenOpeningSafe = 20.0, -- (Set to 0 to turn off) Adds this amount to the stealth score when opening a safe
    AddScoreWhenBreakingObjects = 50.0, -- (Set to 0 to turn off) Adds this amount to the stealth score when opening a safe
    AddScoreWhenFailingAlarmStep = 100.0, -- (Set to 0 to turn off) Adds this amount to the stealth score when opening a safe
    StealthScore = 300, -- If a player reaches this score, the alarm will be enabled (Increment to make it easier or decrement to make it harder)
    WearingShoes = 0.01, -- (Every step taken) Adds this amount to the stealth score if the player is wearing shoes every
    SilencedWeapon = 20.0, -- (Every shot) Adds this amount to the stealth score if the player is using a silenced weapon
    Crouching = 0.0001, -- (Every step taken) Adds this amount to the stealth score if the player is crouching
    Jumping = 20.0, -- (Every jump) Adds this amount to the stealth score if the player is jumping
    Sprinting = 1.5, -- (Every step taken) Adds this amount to the stealth score if the player is sprinting
    Running = 3.0, -- (Every step taken) Adds this amount to the stealth score if the player is running

    -- Durations
    NotificationDuration = 5000, -- Notifications' durations

    LockpickDuration = 1500, -- Lockpicking duration
    PropsDuration = 2000, -- Taking props duration
    HighValueItemsDuration = 5000, -- High value items duration
    SearchingDuration = 2000, -- Seaching duration
    ScoutingDuration = 2500, -- Scouting duration
    TabletDuration = 1000, -- Tablet access duration
    AlarmDuration = 3500, -- Alarm minigame duration
    LasersDuration = 1000, -- Lasers minigame duration
}

Config.ApproachOptions = {
    -- "door" - Lets you go up to any door and lockpick it
    -- "gangster" - A basic approach that requires you to talk to an npc to get a house location
    -- "payphone" - Call a payphone using a phone number that needs to be obtained to get a job
    -- "maid" - Bribe a maid into performing requests or to get info about a house she works at
    -- "hacking" - Hack a real estate database to gain info about houses being sold and pay on the darkweb to get more info about a house
    -- "locksmith" - Bribe a locksmith into giving your a copy of a house key he has worked on before
    -- "valet" - Bribe a valet attendant for some minutes to gain info about luxurious houses (might not give you houses while waiting or the house might have guards)
    PoliceRequired = 0, -- Minimum police required to use for all approaches, set to "unique" if you want to set a different amount for each approach below 

    ["Approaches"] = {
        ["door"] = {
            ["Scouting"] = false, -- Enable/Disable Scouting for this approach -- !!!!!!!!!!!!!!!!!!! This can be a bit heavy since its spawning at least 4 targets for each house !!!!!!!!!!!!!!!!!!!
            ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
            ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        },
        -- ["gangster"] = {
        --     ["Scouting"] = false, -- Enable/Disable Scouting for this approach
        --     ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
        --     ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        --     ["ProgressbarDuration"] = 4, -- (Seconds) Setting it to 0 removes the progressbar

        --     ["DisableNpc"] = false, -- If true, the npc will not spawn and will be replace by a target/drawtext only instead
        --     ["NpcOptions"] = {
        --         ["Models"] = { -- Random models of the npc, remove or add more if you need
        --             "g_m_y_mexgang_01",
        --         },
        --         ["Options"] = { -- Random coords where the npc will spawn, remove or add more if you need
        --             [1] = {
        --                 ["Coords"] = vector4(189.47, -1842.55, 27.21, 231.55),
        --                 ["Scenario"] = "WORLD_HUMAN_LEANING"
        --             },
        --             -- [2] = {
        --             --     ["Coords"] = vector4(116.34, -1953.83, 20.75, 41.11),
        --             --     ["Animation"] = {Dict = "anim@mp_player_intmenu@key_fob@", Anim = "fob_click"}
        --             -- },
        --         },
        --     },
        --     ["PlayerAnimation"] = {
        --         ["Animation"] = {Dict = "misscarsteal4@actor", Anim = "actor_berating_loop"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --     },
        -- },
        -- ["payphone"] = {
        --     ["Scouting"] = false, -- Enable/Disable Scouting for this approach
        --     ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
        --     ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        --     ["PhoneNumber"] = {
        --         -- Permanent Phone number can be pulled with this export for external use: exports["projectx-houserobbery-v2"]:GetPhoneNumber()
        --         ["PermanentPhoneNumber"] = true, -- If true, the phone number will be permanent
        --         ["PermanentNumber"] = 1223, -- Set up your permanent phone number here

        --         -- Non permanent phone number setup
        --         ["PhoneNumber"] = {min = 1000, max = 9999}, -- 4 digit number set up
        --     },
        --     ["PropOptions"] = {
        --         ["RequiredItem"] = false, -- Item required to use the payphone, set it to false (RequiredItem = false) if you don't want to require an item other set it to "phone" as an example
        --         ["Label"] = "Call using the payphone",
        --         ["Icon"] = 'fas fa-phone-volume',
        --     },
        --     ["DialogOptions"] = {
        --         ["Header"] = "Phone Number", -- Change Translation
        --         ["Content"] = "Number", -- Change Translation
        --         ["Input"] = {Title = 'Number', Label = 'Phone Number', Description = 'Enter the phone number', Icon = 'fas fa-phone'}, -- Change Translation

        --         ["EnableLocation"] = true, -- Enable/Disable an interaction location to obtain the phone number - if you want to set it up in a different way use the provided export exports["projectx-houserobbery-v2"]:GetPhoneNumber()
        --         ["NumberLocation"] = vector3(706.12, -967.28, 30.36), -- Interaction coords (["EnableLocation"] = true)
        --         ["Label"] = "Obtain phone number",
        --         ["Icon"] = 'fas fa-phone',

        --         ["Animation"] = {Dict = "amb@prop_human_bum_shopping_cart@male@idle_a", Anim = "idle_c"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --     }
        -- },
        -- ["maid"] = {
        --     ["Scouting"] = false, -- Enable/Disable Scouting for this approach
        --     ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
        --     ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        --     ["ProgressbarDuration"] = 5, -- (Seconds) Setting it to 0 removes the progressbar

        --     ["DisableNpc"] = false, -- If true, the npc will not spawn and will be replace by a target/drawtext only instead
        --     ["NpcOptions"] = {
        --         ["Models"] = { -- Random models of the npc, remove or add more if you need
        --             "s_f_m_maid_01",
        --         },
        --         ["Options"] = { -- Random coords where the npc will spawn, remove or add more if you need
        --             [1] = {
        --                 ["Coords"] = vector4(-508.37, -21.12, 45.61, 350.96),
        --                 ["Animation"] = {Dict = "timetable@floyd@clean_kitchen@base", Anim = "base"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --             },
        --             -- [2] = {
        --             --     ["Coords"] = vector4(116.34, -1953.83, 20.75, 41.11),
        --             --     ["Scenario"] = "WORLD_HUMAN_LEANING"
        --             -- },
        --         },
        --     },
        --     ["PlayerAnimation"] = {
        --         ["Animation"] = {Dict = "misscarsteal4@actor", Anim = "actor_berating_loop"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --     },
        --     ["PedAnimationOnSuccess"] = {
        --         ["Animation"] = {Dict = "mp_common", Anim = "givetake1_b"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --         ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
        --     },
        --     ["PedAnimationOnFail"] = {
        --         ["Animation"] = {Dict = "gestures@m@standing@casual", Anim = "gesture_no_way"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --         ["DelayUntilCancelled"] = 1.5, -- (Seconds) Delay until the animation gets cancelled
        --     },
        --     ["DialogOptions"] = {
        --         ["InfoPrice"] = {
        --             ["Price"] = 250, -- Price for bribing the maid for the location
        --         },
        --         ["InfoBribe"] = {
        --             ["DurationUntilNotified"] = 30, -- (Seconds) Duration until the maid sends you a notification about the house
        --             ["ChanceOfFleeing"] = 10, -- Chance of the maid fleeing when you pay for more info
        --             ["Options"] = { -- Chances are for the maid to be able to fullfill her end of the deal on the intel below
        --                 [1] = {Chance = 75, Price = 250, Description = "When are the owners not home"},
        --                 [2] = {Chance = 75, Price = 200, Description = "Turn off the alarm"},
        --                 [3] = {Chance = 75, Price = 100, Description = "Leave the door unlocked"},
        --                 [4] = {Chance = 75, Price = 25, Description = "Tenant count"},
        --                 [5] = {Chance = 75, Price = 250, Description = "Availability of valuable items"},
        --             },
        --         },
        --         ["DialogTexts"] = {
        --             ["Content"] = "I can give you info on a house for a price",
        --             ["Confirm"] = "Bribe ("..Config.CurrencySymbol.."%s)",
        --             ["Cancel"] = "Walk away"
        --         },
        --         ["DialogTexts2"] = {
        --             ["Content"] = "Want some more info on that house?",
        --             ["Confirm"] = "Check options",
        --             ["Cancel"] = "Continue without bribing"
        --         },
        --         ["InputDialog"] = {
        --             ["Title"] = "I can provide you with details about:",
        --         }
        --     }
        -- },
        -- ["valet"] = {
        --     ["Scouting"] = false, -- Enable/Disable Scouting for this approach
        --     ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
        --     ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        --     ["ProgressbarDuration"] = 5, -- (Seconds) Setting it to 0 removes the progressbar

        --     ["DisableNpc"] = false, -- If true, the npc will not spawn and will be replace by a target/drawtext only instead
        --     ["NpcOptions"] = {
        --         ["Models"] = { -- Random models of the npc, remove or add more if you need
        --             "s_m_y_valet_01",
        --         },
        --         ["Options"] = { -- Random coords where the npc will spawn, remove or add more if you need
        --             [1] = {
        --                 ["Coords"] = vector4(-1286.13, 299.05, 64.95, 153.43),
        --                 ["Scenario"] = "WORLD_HUMAN_GUARD_STAND"
        --             },
        --             -- [2] = {
        --             --     ["Coords"] = vector4(116.34, -1953.83, 20.75, 41.11),
        --             --     ["Animation"] = {Dict = "anim@mp_player_intmenu@key_fob@", Anim = "fob_click"}
        --             -- },
        --         },
        --     },
        --     ["PlayerAnimation"] = {
        --         ["Animation"] = {Dict = "misscarsteal4@actor", Anim = "actor_berating_loop"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --     },
        --     ["PedAnimationOnSuccess"] = {
        --         ["Animation"] = {Dict = "mp_common", Anim = "givetake1_b"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --         ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
        --     },
        --     ["PedAnimationOnFail"] = {
        --         ["Animation"] = {Dict = "gestures@m@standing@casual", Anim = "gesture_no_way"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --         ["DelayUntilCancelled"] = 1.5, -- (Seconds) Delay until the animation gets cancelled
        --     },
        --     ["DialogOptions"] = {
        --         ["InfoPrice"] = { -- Chances determine if he will find a house within the given time or not
        --             [1] = {Chance = 40, Price = 250, Time = 1, Description = "I'll be on dial with you for 1 hour (1 minute real time)"}, -- Time in minutes
        --             [2] = {Chance = 60, Price = 450, Time = 2, Description = "I'll be on dial with you for 2 hour (2 minute real time)"}, -- Time in minutes
        --             [3] = {Chance = 80, Price = 600, Time = 3, Description = "I'll be on dial with you for 3 hour (3 minute real time)"}, -- Time in minutes
        --             [4] = {Chance = 90, Price = 750, Time = 4, Description = "I'll be on dial with you for 4 hour (4 minute real time)"}, -- Time in minutes
        --         },
        --         ["DialogTexts"] = {
        --             ["Content"] = "I will keep track of high profile customers that come in and out, \n\n I will let you know if I can get info about their house location.",
        --             ["Confirm"] = "Check options",
        --             ["Cancel"] = "Walk away"
        --         },
        --         ["InputDialog"] = {
        --             ["Title"] = "I can provide you with details for \n some time, but it will cost you:",
        --         }
        --     }
        -- },
        -- ["locksmith"] = {
        --     ["Scouting"] = false, -- Enable/Disable Scouting for this approach
        --     ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
        --     ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        --     ["ProgressbarDuration"] = 5, -- (Seconds) Setting it to 0 removes the progressbar

        --     ["DisableNpc"] = false, -- If true, the npc will not spawn and will be replace by a target/drawtext only instead
        --     ["NpcOptions"] = {
        --         ["Models"] = { -- Random models of the npc, remove or add more if you need
        --             "a_m_o_ktown_01",
        --         },
        --         ["Options"] = { -- Random coords where the npc will spawn, remove or add more if you need
        --             [1] = {
        --                 ["Coords"] = vector4(895.15, -1045.85, 32.98, 181.08),
        --                 ["Scenario"] = "WORLD_HUMAN_LEANING"
        --             },
        --             -- [2] = {
        --             --     ["Coords"] = vector4(116.34, -1953.83, 20.75, 41.11),
        --             --     ["Animation"] = {Dict = "anim@mp_player_intmenu@key_fob@", Anim = "fob_click"}
        --             -- },
        --         },
        --     },
        --     ["PlayerAnimation"] = {
        --         ["Animation"] = {Dict = "misscarsteal4@actor", Anim = "actor_berating_loop"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --     },
        --     ["PedAnimationOnSuccess"] = {
        --         ["Animation"] = {Dict = "mp_common", Anim = "givetake1_b"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --         ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
        --     },
        --     ["PedAnimationOnFail"] = {
        --         ["Animation"] = {Dict = "gestures@m@standing@casual", Anim = "gesture_no_way"}, -- Use an animation or Scenario (Replace the line with a scenario) Example: ["Scenario"] = "WORLD_HUMAN_LEANING"
        --         ["DelayUntilCancelled"] = 1.5, -- (Seconds) Delay until the animation gets cancelled
        --     },
        --     ["DialogOptions"] = {
        --         ["InfoPrice"] = {
        --             ["Price"] = 500, -- Price for bribing the locksmith
        --         },
        --         ["DialogTexts"] = {
        --             ["Content"] = "I have a great opportunity for you, I have worked on a house before, I can make a copy of the house's key for a price.",
        --             ["Confirm"] = "Purchase ("..Config.CurrencySymbol.."%s)",
        --             ["Cancel"] = "Walk away"
        --         },
        --         ["ItemReceived"] = "house_key", -- Item received from the locksmith
        --     }
        -- },
        -- ["hacking"] = {
        --     ["Scouting"] = false, -- Enable/Disable Scouting for this approach
        --     ["OptionalScouting"] = true, -- If true, the player can rob the house without scouting the spots, if false, the player needs to scout all spots before robbing the house
        --     ["PoliceRequired"] = 0, -- Minimum police required to use this approach
        --     ["ProgressbarDuration"] = 8, -- (Seconds) Setting it to 0 removes the progressbar
        --     ["PropOptions"] = {
        --         ["Coords"] = vector4(-949.40, 386.31, 76.18, 185.96), -- Coords of the laptop prop
        --         ["StandInfrontOfLaptop"] = vector3(-949.49, 386.89, 76.3), -- Coords to stand in front of the laptop
        --         ["RequiredItem"] = "hackdevice", -- Item required to use the laptop, set it to false (RequiredItem = false) if you don't want to require an item other set it to "phone" as an example
        --     },
        --     ["DialogOptions"] = {
        --         ["InfoPrice"] = {
        --             ["Price"] = 500, -- Price for purchasing info from the darkweb
        --         },
        --         ["DialogTexts"] = {
        --             ["Header"] = "Want to purchase some intel?",
        --             ["Content"] = "You successfully hacked the database and found a house, would you want to purchase some intel about it on the darkweb?",
        --             ["Confirm"] = "Purchase ("..Config.CurrencySymbol.."%s)",
        --             ["Cancel"] = "Continue without purchasing"
        --         },
        --         ["InfoText"] = {
        --             ["Header"] = "Here is the info you purchased",
        --             ["Content"] = "That's what I was able to get from the house's database description:",
        --             ["Confirm"] = "Thanks",

        --             ["Intel1"] = "The owners will be gone from %s:00 till %s:00.",
        --             ["Intel2"] = "There is %s people in the house.",
        --             ["Intel3"] = "There are %s high-value items.",
        --         },
        --     },
        -- }
    }
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

Config.MeleeWeapons = {
    -- Melee
    "WEAPON_KNIFE", -- Knife
    "WEAPON_NIGHTSTICK", -- Night Stick
    "WEAPON_HAMMER", -- Hammer
    "WEAPON_BAT", -- Bat
    "WEAPON_CROWBAR", -- Crowbar
    "WEAPON_GOLFCLUB", -- Golfclub
    -- "WEAPON_BOTTLE", -- Bottle
    "WEAPON_DAGGER", -- Dagger
    "WEAPON_HATCHET", -- Hatchet
    "WEAPON_KNUCKLE", -- Knuckle Duster
    "WEAPON_MACHETE", -- Machete
    -- "WEAPON_FLASHLIGHT", -- Flashlight
    "WEAPON_SWITCHBLADE", -- Switch Blade
    "WEAPON_POOLCUE", -- Poolcue
    "WEAPON_WRENCH", -- Wrench
    "WEAPON_BATTLEAXE", -- Battle Axe
    'WEAPON_HOBO_TOILET',
    'WEAPON_HOBO_STICK',
    'WEAPON_HOBO_SPONGE',
    'WEAPON_HOBO_MOP',
    'WEAPON_HOBO_SHARD',
    'WEAPON_HOBO_REBAR',
    'WEAPON_HOBO_PLANK',
    'WEAPON_HOBO_OLDMACHETE',
    'WEAPON_HOBO_DUSTERS',
    'WEAPON_HOBO_BRICK',
    'WEAPON_HOBO_RATSTICK',
    'WEAPON_HOBO_PIPE',
    'WEAPON_HOBO_DIRTYNEEDLE',
    'WEAPON_ZKKNIFE',
    'WEAPON_GOLFCLUB',
    'WEAPON_HAMMER',
    'WEAPON_NIGHTSTICK',
    'WEAPON_CHOCOLATELOLLIPOP',
    'WEAPON_BATEASTER',
    'WEAPON_CHOCOLATEBAT',
    'WEAPON_CHOCOLATEBAT2',
    'WEAPON_HAMMERMARSHMALLOW',
    'WEAPON_KNIFEEASTER1',
    'WEAPON_KNIFEEASTER2',
    'WEAPON_MACHETEEASTER',
    'WEAPON_APPLE_CANDYCANE',
    'WEAPON_CANDYCANE',
    'WEAPON_CANDY_CANE',
    'WEAPON_STONE_HATCHET',
    'WEAPON_CANDYAXE',
    'WEAPON_SHIV',
    'WEAPON_KATANA',
    'WEAPON_KATANA4',
    'WEAPON_SLEDGEHAMMER',
    'WEAPON_KARAMBIT',
    'WEAPON_COLBATON',
    'WEAPON_BATS',
    'WEAPON_KATANA2',
    'WEAPON_KATANA3',
    'WEAPON_GLOW_BAT',
    'WEAPON_VALAXE',
    'WEAPON_VALCLEVER',
    'WEAPON_VALKNIFE',
    'WEAPON_VALSPIKEDBAT',
    'WEAPON_EASTERKARAMBIT',
    'WEAPON_EASTERKATANA',
    'WEAPON_EASTERSICKLE',
    'WEAPON_EASTERSIGN',
    'WEAPON_STICKEGG',
    'WEAPON_ICEPOP_1',
    'WEAPON_ICEPOP_2',
    'WEAPON_ICEPOP_3',
    'WEAPON_POOLNOODLE',
    'WEAPON_PDBATON',
}

if Config.Dispatch.Resource == 'auto' then
    if GetResourceState('cd_dispatch') == 'started' then
        Config.Dispatch.Resource = 'cd'
    elseif GetResourceState('ps-dispatch') == 'started' then
        Config.Dispatch.Resource = 'ps'
    elseif GetResourceState('fd_dispatch') == 'started' then
        Config.Dispatch.Resource = 'fd'
    elseif GetResourceState('linden_outlawalert') == 'started' then
        Config.Dispatch.Resource = 'outlaw'
    elseif GetResourceState('codem-dispatch') == 'started' then
        Config.Dispatch.Resource = 'codem'
    elseif GetResourceState('five-dispatch') == 'started' then
        Config.Dispatch.Resource = 'five-dispatch'
    elseif GetResourceState('qf-mdt') == 'started' then
        Config.Dispatch.Resource = 'qf'
    elseif GetResourceState('aty_dispatch') == 'started' then
        Config.Dispatch.Resource = 'aty'
    elseif GetResourceState('zat-mdt') == 'started' then
        Config.Dispatch.Resource = 'zat-mdt'
    elseif GetResourceState('op-dispatch') == 'started' then
        Config.Dispatch.Resource = 'opto'
    elseif GetResourceState('kartik-mdt') == 'started' then
        Config.Dispatch.Resource = 'kartik'
    elseif GetResourceState('brutal_policejob') == 'started' then
        Config.Dispatch.Resource = 'brutal'
    elseif GetResourceState('origen_police') == 'started' then
        Config.Dispatch.Resource = 'origen'
    elseif GetResourceState('tk_dispatch') == 'started' then
        Config.Dispatch.Resource = 'tk'
    elseif GetResourceState('rcore_dispatch') == 'started' then
        Config.Dispatch.Resource = 'rcore'
    elseif GetResourceState('lb-tablet') == 'started' then
        Config.Dispatch.Resource = 'lb'
    elseif GetResourceState('redutzu-mdt') == 'started' then
        Config.Dispatch.Resource = 'redutzu'
    elseif GetResourceState('l2s-dispatch') == 'started' then
        Config.Dispatch.Resource = 'l2s'
    elseif GetResourceState('sonorancad') == 'started' then
        Config.Dispatch.Resource = 'sonoran'
    elseif GetResourceState('piotreq_gpt') == 'started' then
        Config.Dispatch.Resource = 'piotreqv1'
    elseif GetResourceState('p_mdt') == 'started' then
        Config.Dispatch.Resource = 'piotreqv2'
    elseif GetResourceState('pp-mdt') == 'started' then
        Config.Dispatch.Resource = 'pp-mdt'
    elseif GetResourceState('core_dispatch') == 'started' then
        Config.Dispatch.Resource = 'core'
    elseif GetResourceState('emergencydispatch') == 'started' then
        Config.Dispatch.Resource = 'emergencydispatch'
    elseif GetResourceState('wasabi_mdt') == 'started' then
        Config.Dispatch.Resource = 'wasabimdt'
    elseif GetResourceState('dispatch') == 'started' then
        Config.Dispatch.Resource = 'nextscripts'
    elseif GetResourceState('kibra-dispatch') == 'started' then
        Config.Dispatch.Resource = 'kibra'
    elseif GetResourceState('ImperialCAD') == 'started' then
        Config.Dispatch.Resource = 'imperial'
    else
        Config.Dispatch.Resource = 'none'
        lib.print.warn('^3[Config.Dispatch.Resource] You have auto detection on for dispatch resource, but your dispatch resource is not started or supported by default. Please check your configuration and set the dispatch resource manually.^7')
    end
end

if Config.Framework == 'auto' then
    if GetResourceState('qbx_core') == 'started' then
        Config.Framework = 'qbox'
    elseif GetResourceState('qb-core') == 'started' then
        Config.Framework = 'qb-core'
    elseif GetResourceState('es_extended') == 'started' then
        Config.Framework = 'esx'
        local version = GetResourceMetadata('es_extended', 'version', 0)

        if not version then
            Config.ESX = "old"
        else
            local major, minor = version:match('^(%d+)%.(%d+)')
            major = tonumber(major)
            minor = tonumber(minor)

            if not major or not minor then
                Config.ESX = "old"
            elseif major > 1 or (major == 1 and minor > 4) then
                Config.ESX = "new"
            else
                Config.ESX = "old"
            end
        end
    else
        Config.Framework = 'custom'
        lib.print.warn('^3[Config.Framework] You have auto detection on for framework resource, but your framework resource is not started or supported by default. Please check your configuration and set the framework resource manually.^7')
    end
end

if Config.Inventory == 'auto' then
    if GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 'ox'
    elseif GetResourceState('qb-inventory') == 'started' then
        Config.Inventory = 'qb'
    elseif GetResourceState('ps-inventory') == 'started' then
        Config.Inventory = 'ps'
    elseif GetResourceState('lj-inventory') == 'started' then
        Config.Inventory = 'lj'
    elseif GetResourceState('tgiann-inventory') == 'started' then
        Config.Inventory = 'tgiann'
    elseif GetResourceState('origen_inventory') == 'started' then
        Config.Inventory = 'origen'
    elseif GetResourceState('codem-inventory') == 'started' then
        Config.Inventory = 'codem'
    elseif GetResourceState('es_extended') == 'started' then
        Config.Inventory = 'esx'
    else
        lib.print.warn('^3[Config.Inventory] You have auto detection on for inventory, but your inventory is not started or supported by default. Please check your configuration and set the inventory resource manually.^7')
    end
end

if Config.Weather == 'auto' then
    if GetResourceState('Renewed-Weathersync') == 'started' then
        Config.Weather = 'renewed'
    elseif GetResourceState('av_weather') == 'started' then
        Config.Weather = 'av'
    elseif GetResourceState('qb-weathersync') == 'started' then
        Config.Weather = 'qb'
    elseif GetResourceState('cd_easytime') == 'started' then
        Config.Weather = 'cd'
    else
        lib.print.warn('^3[Config.Weather] You have auto detection on for weather, but your weather system is not started or supported by default. Please check your configuration and set the weather resource manually.^7')
    end
end

if Config.Interaction == 'auto' then
    if GetResourceState('ox_target') == 'started' then
        Config.Interaction = 'ox_target'
    elseif GetResourceState('qb-target') == 'started' then
        Config.Interaction = 'qb-target'
    elseif GetResourceState('interact') == 'started' then
        Config.Interaction = 'interact'
    else
        Config.Interaction = 'drawtext'
        lib.print.warn('^3[Config.Interaction] You have auto detection on for Interaction, but your Interaction system is not started or supported by default. So we set Config.Interaction to drawtext. Please check your configuration and set the interaction resource manually.^7')
    end
end

function LoadHousePreset(InteriorType, name, data)
    if name == "example" then return end
    if IsDuplicityVersion() then
        if Config.PresetHouseCoords[InteriorType][name] then
            lib.print.warn(string.format('^3House preset "%s" already exists in Config.PresetHouseCoords['..InteriorType..']. Overwriting it...^7', name))
        else
            lib.print.info(string.format('^3House preset "%s" has been added via a preset.^7', name))
        end
    end

    Config.PresetHouseCoords[InteriorType][name] = data
end

CreateThread(function()
    if Config.Interaction == "ox-target" then
        lib.print.warn('^3Your interaction system is set to "ox-target", which is incorrect. The correct value is "ox_target".^7')
    elseif Config.Interaction == "qb_target" then
        lib.print.warn('^3Your interaction system is set to "qb_target", which is incorrect. The correct value is "qb-target".^7')
    end
end)