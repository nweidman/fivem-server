Config = {}

Config.Debug = false
Config.Language = "en"

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true -- if true, lb-racing will check the database for any issues
Config.DatabaseChecker.AutoFix = true -- if true, lb-racing will automatically fix any issues & add new tables if needed

Config.Convert = false -- convert data from detected race scripts? Supported: rahe-racing

--[[ APP OPTIONS ]]--

Config.Standalone = {}
Config.Standalone.Enabled = auto -- enable standalone racing tablet? "auto" = will enable if neither lb-phone nor lb-tablet is installed
Config.Standalone.RequireItem = ""
Config.Standalone.Command = "" -- command to open the racing tablet
Config.Standalone.Bind = ""
Config.Standalone.Model = `imp_prop_impexp_tablet`
Config.Standalone.Offset = vector3(0.05, -0.005, -0.04)
Config.Standalone.Rotation = vector3(0.0, 0.0, 0.0)
Config.Standalone.AllowAvatar = true -- allow setting an avatar when using standalone?

Config.App = {}

Config.App.Default = true -- automatically install the app?
Config.App.Name = "RaceOS"
Config.App.Description = "Participate in races and win money."
Config.App.RequireItem = false
Config.App.Icon = "icon.jpg"
Config.App.BlacklistedJobs = {
    "police",
    "ambulance",
}

Config.App.LBPhone = true -- add the app to lb-phone?
Config.App.LBTablet = false -- add the app to lb-tablet?

--[[ FRAMEWORK & STYLE OPTIONS ]]--

Config.Framework = "auto"
Config.HelpTextStyle = "ox_lib" -- "default", "ox_lib" or "gta". You can customize this further in client/custom/functions/functions.lua, `DrawHelpText` & `ClearHelpText`
Config.NotificationSystem = "ox_lib" -- "auto", "ox_lib", "gta", "esx" or "qb". You can customize this further in client/custom/functions/functions.lua, `Notify`
Config.Units = "imperial" -- "imperial", "metric" or "auto" (GTA settings). You can customized this further in client/custom/functions/functions.lua, `ShouldUseImperial`

--[[ RACE OPTIONS ]]--

Config.CalculatePositionsInterval = 500 -- how often should positions be calculated? (in milliseconds)

Config.AutoStart = 300 -- how many seconds before automatically starting a race
Config.Countdown = 5 -- how many seconds should the countdown be?

Config.DNF = {}
Config.DNF.AfterFinish = 5 -- how many minutes after someone finishes the race should other players are marked as DNF?
Config.DNF.AfterDisconnect = 2 -- how many minutes after a player disconnects before they should be removed from the race?
Config.DNF.NotInCar = 1 -- how many minutes after a player has left their vehicle before they should be marked as DNF?

Config.NoCollision = {}
Config.NoCollision.Enabled = true -- disable collision between players at the start of a race?
Config.NoCollision.Duration = 15 -- how long after the race starts should collision be disabled? can be set to true for infinite, otherwise the number of seconds
Config.NoCollision.Alpha = 254

Config.ChargeRepeatingRaces = true -- charge money from the original creator for the prize pool of repeated races?
Config.CommissionRepeatedRaces = true -- allow commission from repeated races?

Config.RaceBucket = false -- should race participants be in their own bucket when racing?

Config.RaceObjects = {}

Config.RaceObjects.Checkpoint = {
    Collisions = {
        Racer = true,
        NonRacer = true
    },
    Visible = {
        Racer = true,
        NonRacer = true
    },
}

Config.RaceObjects.Barrier = {
    Collisions = {
        Racer = true,
        NonRacer = true
    },
    Visible = {
        Racer = true,
        NonRacer = true
    },
}

Config.NotSignedUp = {}
Config.NotSignedUp.Waypoint = false -- set a waypoint to a race even if you didn't sign up for it?
Config.NotSignedUp.Blip = false -- add a blip for a race even if you didn't sign up for it?
Config.NotSignedUp.Notification = true -- notify the player that a race is starting, even if they didn't sign up for it?

Config.FlipCar = {}
Config.FlipCar.Enabled = false
Config.FlipCar.Key = "H"
Config.FlipCar.Duration = 2000 -- how long you must hold the key to flip the car (in milliseconds), set to false to instantly flip
Config.FlipCar.AlwaysVisible = false -- always show the flip car control?

Config.TPCheckpoint = {}
Config.TPCheckpoint.Enabled = false
Config.TPCheckpoint.Key = "G"
Config.TPCheckpoint.Duration = 2000 -- how long you must hold the key to tp to the last checkpoint (in milliseconds), set to false to instantly tp
Config.TPCheckpoint.AlwaysVisible = false -- always show the tp checkpoint control?

--[[ PERMISSIONS ]]--

Config.Creator = {}
Config.Creator.Bucket = true -- Use a separate routing bucket when in the creator? You can customize the function to get bucket id in server/custom/functions/creator.lua, `GetEmptyRoutingBucket`
Config.Creator.Vehicle = `elegy` -- The vehicle to spawn when entering the creator. Set to false to disable

Config.Creator.Weather = {}
Config.Creator.Weather.Freeze = false -- Freeze the weather when creating a track?
Config.Creator.Weather.Type = "EXTRASUNNY"
Config.Creator.Weather.Hour = 12
Config.Creator.Weather.Minute = 0

Config.Permissions = {} -- you can customize permissions further in the permissions.lua files

Config.Permissions.Creator = {
    Everyone = true, -- allow everyone to create tracks?
    Admin = true, -- allow admins to create tracks?

    Freecam = {
        Everyone = false,
        Admin = true
    }
}

Config.Permissions.EditTrack = {
    Everyone = false,
    Admin = true,
    Creator = true
}

Config.Permissions.RemoveTrack = {
    Everyone = false,
    Admin = true,
    Creator = true
}

Config.Permissions.CreateRace = {
    Everyone = true, -- allow everyone to create races?
    Admin = true, -- allow admins to created races?

    RaceOptions = {
        PaymentMethod = {
            Everyone = true,
            Admin = true,

            Default = "bank",
            -- By default, the only option supported is `bank`. You can add more payment methods in server/custom/functions/payment.lua
            Options = {
                {
                    label = "APP.RACES.PAYMENT_METHODS.MONEY",
                    value = "bank",
                }
            }
        },

        PrizeDistribution = {
            Everyone = true,
            Admin = true,

            Default = "defined", -- "auto" or "defined"
            -- The algorithms can be configured in lib/shared/prize-distribution.lua, `GetPrizePoolDistribution`
            Algorithms = {
                {
                    label = "APP.RACES.PRIZE_DISTRIBUTION.ALGORITHMS.EXPONENTIAL",
                    value = "exponential"
                },
                {
                    label = "APP.RACES.PRIZE_DISTRIBUTION.ALGORITHMS.LINEAR",
                    value = "linear"
                }
            }
        },

        Repeat = {
            Everyone = false,
            Admin = true,

            Intervals = {
                30,
                60,
                2 * 60,
                3 * 60,
                4 * 60,
                8 * 60,
                12 * 60,
                16 * 60,
                20 * 60,
                24 * 60, -- 1 day
                2 * 24 * 60,
                3 * 24 * 60,
                4 * 24 * 60,
                5 * 24 * 60,
                6 * 24 * 60,
                7 * 24 * 60, -- 1 week
                2 * 7 * 24 * 60,
                3 * 7 * 24 * 60,
                30 * 24 * 60, -- 1 month
            }
        },

        AssignVehicle = {
            Everyone = true,
            Admin = true,

            Default = false
        },

        Commission = {
            Everyone = true,
            Admin = true,

            Default = 10,
            Min = 0,
            Max = 70
        },

        Ranked = {
            Everyone = true,
            Admin = true,

            Default = true
        },

        RequireSignUp = {
            Everyone = true,
            Admin = true,

            Default = true
        },

        InviteOnly = {
            Everyone = true,
            Admin = true,

            Default = false
        },

        PersonalVehicle = {
            Everyone = true,
            Admin = true,

            Default = false
        },

        Collisions = {
            Everyone = true,
            Admin = true,

            Default = true
        },

        FirstPerson = {
            Everyone = true,
            Admin = true,

            Default = false,
        },

        DisableTraffic = {
            Everyone = false,
            Admin = true,

            Default = false
        },
    }
}

Config.Permissions.CancelRace = {
    Everyone = false,
    Admin = true,
    Creator = true
}

--[[ GRAPHICS ]] --

Config.Graphics = {}

Config.Graphics.JoinRace = {}
Config.Graphics.JoinRace.Enabled = true
Config.Graphics.JoinRace.FollowCamera = true
Config.Graphics.JoinRace.Size = 2.0

Config.Graphics.PlayerBoxes = {}
Config.Graphics.PlayerBoxes.Enabled = true
Config.Graphics.PlayerBoxes.Size = 1.0
Config.Graphics.PlayerBoxes.FollowCamera = true

Config.Graphics.Checkpoints = {}
Config.Graphics.Checkpoints.Enabled = true
Config.Graphics.Checkpoints.Amount = 3
Config.Graphics.Checkpoints.Resolution = 1/5

--[[ BLIP OPTIONS ]]--

Config.Blips = {}

Config.Blips.Participants = {}
Config.Blips.Participants.Enabled = true -- add blips for all participants in a race?
Config.Blips.Participants.Category = 12 -- can be 12-133 (with name) or 134-254 (no name), or false to not set a category
Config.Blips.Participants.Sprite = 1
Config.Blips.Participants.Color = 0
Config.Blips.Participants.Scale = 0.9
Config.Blips.Participants.ShortRange = true
Config.Blips.Participants.ShowHeight = false
Config.Blips.Participants.ShowHeading = true

Config.Blips.Checkpoints = {}
Config.Blips.Checkpoints.Sprite = 1 -- https://docs.fivem.net/docs/game-references/blips/
Config.Blips.Checkpoints.Category = 13 -- can be 12-133 (with name) or 134-254 (no name), or false to not set a category
Config.Blips.Checkpoints.Scale = 0.85
Config.Blips.Checkpoints.ActiveScale = 1.0
Config.Blips.Checkpoints.PreviousScale = 0.7
Config.Blips.Checkpoints.Alpha = 255
Config.Blips.Checkpoints.ActiveAlpha = 255
Config.Blips.Checkpoints.PreviousAlpha = 128
Config.Blips.Checkpoints.Color = 39
Config.Blips.Checkpoints.ActiveColor = 1
Config.Blips.Checkpoints.PreviousColor = 39
Config.Blips.Checkpoints.FutureActiveColor = 1 -- how many blips ahead should be colored as "active"?

--[[ VEHICLE OPTIONS ]]--

Config.BlacklistedVehicleModels = {
    -- `t20`,
}

Config.VehicleTypes = {
    {
        label = "Car",
        type = "car",
        icon = "fa-solid fa-car",
        types = { 0, 6 } -- https://docs.fivem.net/natives/?_0xA273060E
    },
    {
        label = "Motorcycle",
        type = "motorcycle",
        icon = "fa-solid fa-motorcycle",
        types = { 11 }
    },
    {
        label = "Offroad",
        type = "offroad",
        icon = "fa-solid fa-truck-monster",
        types = { 3, 7 }
    },
}

---@type { [string]: { label: string, model: number | string, type: "automobile" | "bike", trackType: "car" | "motorcycle" | "offroad" }[] }
Config.VehicleClasses = {
    ["Restricted"] = {
        { label = "Killer Hurricane Restricted", model = `killerhuracan`, type = "automobile", trackType = "car" },
        { label = "Killer X8 Restricted", model = `killerr8`, type = "automobile", trackType = "car" },
        { label = "EMR Restricted", model = `GODzELFAYEGT`, type = "automobile", trackType = "car" },
        { label = "Zentorno LE Restricted", model = `204sZentorno`, type = "automobile", trackType = "car" },
        { label = "Coquette Extreme Restricted", model = `pace_coquette`, type = "automobile", trackType = "car" },
        { label = "Comacade Restricted", model = `comacade`, type = "automobile", trackType = "car" },
        { label = "Tempesto Restricted", model = `oslam`, type = "automobile", trackType = "car" },
        { label = "Nero Concept R Restricted", model = `lsbuggati`, type = "automobile", trackType = "car" },
        { label = "DR Custom Restricted", model = `DBApertaDRCUSTOM`, type = "automobile", trackType = "car" },
        { label = "Pure WB Restricted", model = `DBpurwb`, type = "automobile", trackType = "car" },
        { label = "V Dragon Restricted", model = `ndveneno`, type = "automobile", trackType = "car" },
        { label = "Speed Custom Restricted", model = `speed`, type = "automobile", trackType = "car" },
        { label = "F1 Concept Restricted", model = `f1concept`, type = "automobile", trackType = "car" },
        { label = "Topsec Restricted", model = `sennatopsec`, type = "automobile", trackType = "car" },
        { label = "G1 Walk Restricted", model = `p1lbwk`, type = "automobile", trackType = "car" },
        { label = "Fenyr Beast Restricted", model = `wmfenyr`, type = "automobile", trackType = "car" },
        { label = "Mansrev Restricted", model = `mansrev`, type = "automobile", trackType = "car" },
        { label = "Toros X Restricted", model = `rrtorosx`, type = "automobile", trackType = "car" },
        { label = "Cremera Restricted", model = `GODzGEMERVIP`, type = "automobile", trackType = "car" },
        { label = "Dragon SCV Restricted", model = `scv`, type = "automobile", trackType = "car" },
        { label = "Vortex K1 Restricted", model = `DBfgtvmk1`, type = "automobile", trackType = "car" },
        { label = "AM Chi Restricted", model = `amchiron`, type = "automobile", trackType = "car" },
        { label = "Progen T70 Restricted", model = `sou_720_wb`, type = "automobile", trackType = "car" },
        { label = "KS Speedster Restricted", model = `GODzDKSTERZOTACHA`, type = "automobile", trackType = "car" },
        { label = "PB G2 Restricted", model = `DBpbbmwm2`, type = "automobile", trackType = "car" },
        { label = "The One Restricted", model = `labsamgone`, type = "automobile", trackType = "car" },
        { label = "Honey Restricted", model = `Regerahoney`, type = "automobile", trackType = "car" },
        { label = "Nebula X Restricted", model = `DRcProX`, type = "automobile", trackType = "car" },
        { label = "Yesko Restricted", model = `cla_jesko20`, type = "automobile", trackType = "car" },
        { label = "Venumm Restricted", model = `DBhuayravenuum`, type = "automobile", trackType = "car" },
        { label = "Visionary GT Restricted", model = `MVisionDRC`, type = "automobile", trackType = "car" },
        { label = "Corsita GT Restricted", model = `204sCorsita`, type = "automobile", trackType = "car" },
        { label = "R14 Demon Restricted", model = `peptos_s14_demon`, type = "automobile", trackType = "car" },
        { label = "Comet Evo Restricted", model = `dc_evo900comet`, type = "automobile", trackType = "car" },
        { label = "PB G4 Restricted", model = `pacexdc_gt4dtm`, type = "automobile", trackType = "car" },
        { label = "Canis Extreme Restricted", model = `pace_srr_extreme`, type = "automobile", trackType = "car" },
        { label = "Succeda Restricted", model = `GODz21CMAXA`, type = "automobile", trackType = "car" },
        { label = "DB Impro Restricted", model = `DBimpronta`, type = "automobile", trackType = "car" },
        { label = "Boltic Restricted", model = `etp22`, type = "automobile", trackType = "car" },
        { label = "Niobee Restricted", model = `KillerNiobeC`, type = "automobile", trackType = "car" },
        { label = "600x Restricted", model = `rr600x`, type = "automobile", trackType = "car" },
        { label = "Comet X Restricted", model = `rrcometx`, type = "automobile", trackType = "car" },
        { label = "Vacco Wide Restricted", model = `rrgwide`, type = "automobile", trackType = "car" },
        { label = "Turismo RR Restricted", model = `rrturismocustom`, type = "automobile", trackType = "car" },
        { label = "Italia GTOX Restricted", model = `rritaliagtox`, type = "automobile", trackType = "car" },
        { label = "MT Wide Restricted", model = `rrfordgtwide`, type = "automobile", trackType = "car" },
        { label = "Zentorno LM Restricted", model = `rr700xk`, type = "automobile", trackType = "car" },
        { label = "Banshee 1000r Restricted", model = `rrbanshee1000r`, type = "automobile", trackType = "car" },
        { label = "Italia RSX Restricted", model = `rritaliarsx`, type = "automobile", trackType = "car" },
        { label = "InfernusX Restricted", model = `rrinfernusx`, type = "automobile", trackType = "car" },
        { label = "Coodara Restricted", model = `GODzMANSF`, type = "automobile", trackType = "car" },
        { label = "Infernus Stanced Restricted", model = `labsinfernus`, type = "automobile", trackType = "car" },
        { label = "Progen x62 Restricted", model = `DRcX62`, type = "automobile", trackType = "car" },
        { label = "Phandom Turbo Restricted", model = `GODzR35PNDM`, type = "automobile", trackType = "car" },
        { label = "DR36 Restricted", model = `GODzDR36CONCEPT`, type = "automobile", trackType = "car" },
        { label = "Ignus LM Restricted", model = `204sIgnus`, type = "automobile", trackType = "car" },
        { label = "Jester LM Restricted", model = `nsx24lbwk`, type = "automobile", trackType = "car" },
        { label = "Serpente Restricted", model = `GODzJ50WBV2`, type = "automobile", trackType = "car" },
        { label = "Raiden Extreme Restricted", model = `GODzDKSTROADSTER`, type = "automobile", trackType = "car" },
        { label = "Squalo Restricted", model = `GODzF3FIDDYFIVE`, type = "automobile", trackType = "car" },
        { label = "Limbo Restricted", model = `204slimbo`, type = "automobile", trackType = "car" },
        { label = "Niobe 8 Restricted", model = `gstnio1`, type = "automobile", trackType = "car" },
        { label = "Infernus XS Restricted", model = `gstinfxs2`, type = "automobile", trackType = "car" },
        { label = "Lession Restricted", model = `gstinf1`, type = "automobile", trackType = "car" },
        { label = "10F Custom Restricted", model = `gst10f1`, type = "automobile", trackType = "car" },
        { label = "Zentorno RR Restricted", model = `gstzen1`, type = "automobile", trackType = "car" },
        { label = "Nero X Restricted", model = `gstnero1`, type = "automobile", trackType = "car" },
    },
    ["OS"] = {
        { label = "Rebla GTS", model = `gstreb1`, type = "automobile", trackType = "car" },
        { label = "Komoda I", model = `komodai`, type = "automobile", trackType = "car" },
        { label = "Rebla X", model = `polyreblasuv`, type = "automobile", trackType = "car" },
        { label = "NS Hearts", model = `204sJDMSportscar`, type = "automobile", trackType = "car" },
        { label = "BabyZilla", model = `204sBabyZilla`, type = "automobile", trackType = "car" },
        { label = "ZK2", model = `204sV10Rocket`, type = "automobile", trackType = "car" },
        { label = "XR7", model = `204sXR7`, type = "automobile", trackType = "car" },
        { label = "Sentinel Coupe", model = `204sSentinelCoupe`, type = "automobile", trackType = "car" },
        { label = "Comet T", model = `204sCometS`, type = "automobile", trackType = "car" },
        { label = "Cupid Kuruma", model = `204sKurumaX`, type = "automobile", trackType = "car" },
        { label = "Track Cat", model = `GODzTRACKCAT`, type = "automobile", trackType = "car" },
        { label = "The Gauntlet", model = `rrgauntcustom`, type = "automobile", trackType = "car" },
        { label = "Seminole R", model = `rrseminoleex`, type = "automobile", trackType = "car" },
        { label = "PurrMobile", model = `DRcEvoX`, type = "automobile", trackType = "car" },
        { label = "Hissi", model = `204sKittyIssi`, type = "automobile", trackType = "car" },
        { label = "Campy", model = `204sCampy`, type = "automobile", trackType = "car" },
        { label = "S95 RR", model = `gr86`, type = "automobile", trackType = "car" },
        { label = "Jester X", model = `GODzHYCADEMK4V2`, type = "automobile", trackType = "car" },
        { label = "XMAS Dominator", model = `pace_christmas_dom`, type = "automobile", trackType = "car" },
        { label = "XMAS Comet", model = `pace_christmas_comet`, type = "automobile", trackType = "car" },
        { label = "Killer Skylife", model = `KillerSkylife`, type = "automobile", trackType = "car" },
        { label = "Killer Comet", model = `KillerPoscheT`, type = "automobile", trackType = "car" },
        { label = "Buffalo X", model = `204s24Buffalo`, type = "automobile", trackType = "car" },
        { label = "Zilla X", model = `204sZilla`, type = "automobile", trackType = "car" },
        { label = "Obey Sport LM", model = `ObeySportLP`, type = "automobile", trackType = "car" },
        { label = "Killer G4", model = `KillerM4`, type = "automobile", trackType = "car" },
        { label = "Killer Hawk", model = `KillerHwak`, type = "automobile", trackType = "car" },
        { label = "Elegy Extreme", model = `rrelegyextreme`, type = "automobile", trackType = "car" },
        { label = "Benefactor X", model = `DRcGT63x`, type = "automobile", trackType = "car" },
        { label = "Kuruma IX", model = `evoix`, type = "automobile", trackType = "car" },
        { label = "Sunrise X", model = `pace_sunrise`, type = "automobile", trackType = "car" },
        { label = "Killer Hatch", model = `KillerWagenR`, type = "automobile", trackType = "car" },
        { label = "Killer Jester", model = `KillerJesterAnim`, type = "automobile", trackType = "car" },
        { label = "PD Killer Rebla", model = `Rebla_killer`, type = "automobile", trackType = "car" },
        { label = "Kermassi", model = `oskerm`, type = "automobile", trackType = "car" },
        { label = "Killer Hellfire", model = `KillerHellfire`, type = "automobile", trackType = "car" },
        { label = "Killer Toro", model = `KillerToro`, type = "automobile", trackType = "car" },
        { label = "PD Seminole Hawk", model = `rrseminalhawkxz`, type = "automobile", trackType = "car" },
        { label = "Mono Wagon", model = `monog63`, type = "automobile", trackType = "car" },
        { label = "Obey R", model = `pace_obeyr`, type = "automobile", trackType = "car" },
        { label = "Killer RH7", model = `os34`, type = "automobile", trackType = "car" },
        { label = "Mini RH7", model = `gstrh5pm1`, type = "automobile", trackType = "car" },
        { label = "Cafe Rx", model = `DBCafeRx`, type = "automobile", trackType = "car" },
        { label = "Killer G46", model = `DBKillerE46Hycade`, type = "automobile", trackType = "car" },
        { label = "Godz MNX", model = `GODzGNX`, type = "automobile", trackType = "car" },
        { label = "Rat Crawler", model = `rcatcrawler`, type = "automobile", trackType = "car" },
        { label = "Formula B", model = `rrformulab`, type = "automobile", trackType = "car" },
        { label = "PMP 1000", model = `rrpmp1000`, type = "automobile", trackType = "car" },
        { label = "Hearts 85", model = `204sA85`, type = "automobile", trackType = "car" },
        { label = "E32", model = `KillerR32`, type = "automobile", trackType = "car" },
        { label = "FK8 HR", model = `fk8hr`, type = "automobile", trackType = "car" },
        { label = "Killer G34", model = `GODzDHYCADER34`, type = "automobile", trackType = "car" },
        { label = "BMG Bunny", model = `DBbm_amgc63`, type = "automobile", trackType = "car" },
        { label = "RoboJet X7", model = `GodzROBOJETX7`, type = "automobile", trackType = "car" },
        { label = "63 MT", model = `gt63mt`, type = "automobile", trackType = "car" },
        { label = "Elegy RH5 Sedan", model = `gstrh5s1`, type = "automobile", trackType = "car" },
        { label = "Custom 290R", model = `rr290z`, type = "automobile", trackType = "car" },
        { label = "ApexGT", model = `apexgt`, type = "automobile", trackType = "car" },
        { label = "Schafter LM", model = `pace_benefactor_rs`, type = "automobile", trackType = "car" },
        { label = "Royale", model = `pace_royalstar`, type = "automobile", trackType = "car" },
        { label = "Argento Wide", model = `rrargentowide`, type = "automobile", trackType = "car" },
        { label = "Dominator XR", model = `rrdominatorgte`, type = "automobile", trackType = "car" },
        { label = "Coquette K6 Wide", model = `rrcoquette6`, type = "automobile", trackType = "car" },
        { label = "Coquette K4 Wide", model = `rrcoquette4wide`, type = "automobile", trackType = "car" },
        { label = "Flash Widebody", model = `rrflashwidebody`, type = "automobile", trackType = "car" },
        { label = "Kossie", model = `labscossie`, type = "automobile", trackType = "car" },
        { label = "Sultan Hatch", model = `GODzDRB26SUBI`, type = "automobile", trackType = "car" },
        { label = "HC8", model = `GODzDSHC8`, type = "automobile", trackType = "car" },
        { label = "FR60 Extreme", model = `rrfr60x`, type = "automobile", trackType = "car" },
        { label = "Dominator R", model = `rrdominatorr`, type = "automobile", trackType = "car" },
        { label = "Jester Classic Custom", model = `rrjesterclasscustom`, type = "automobile", trackType = "car" },
        { label = "Raiden Wide", model = `rrraidenwide`, type = "automobile", trackType = "car" },
        { label = "300zr", model = `rr300zr`, type = "automobile", trackType = "car" },
        { label = "b30", model = `rrb30`, type = "automobile", trackType = "car" },
        { label = "Buffalo Classic Wide", model = `rrbuffalov10wide`, type = "automobile", trackType = "car" },
        { label = "Dominator Fastback", model = `rrdomfastback`, type = "automobile", trackType = "car" },
        { label = "R15", model = `rrroxannecustom`, type = "automobile", trackType = "car" },
        { label = "SH500", model = `gstsh52`, type = "automobile", trackType = "car" },
        { label = "Coquette C3", model = `rrcoquettec3`, type = "automobile", trackType = "car" },
        { label = "Dominator Fox", model = `rrdominatorfox`, type = "automobile", trackType = "car" },
        { label = "Jester Custom", model = `rrjestercustom`, type = "automobile", trackType = "car" },
        { label = "Sultan Vortex", model = `gstter2`, type = "automobile", trackType = "car" },
        { label = "Issi Extreme", model = `rrissix`, type = "automobile", trackType = "car" },
        { label = "Furor HR", model = `hrf38s`, type = "automobile", trackType = "car" },
        { label = "Sultan JL", model = `RTGKarincustom`, type = "automobile", trackType = "car" },
        { label = "Bestia XD", model = `gstcns2`, type = "automobile", trackType = "car" },
        { label = "Gallivanter S", model = `gstbalstd1`, type = "automobile", trackType = "car" },
        { label = "Comet E", model = `DBTaycans20`, type = "automobile", trackType = "car" },
        { label = "Sentinel X", model = `rrsentinelx`, type = "automobile", trackType = "car" },
        { label = "Cypher Hatch", model = `polycypherwagon`, type = "automobile", trackType = "car" },
        { label = "Vivanite RR", model = `GODzHCPACIFICA`, type = "automobile", trackType = "car" },
        { label = "Sultan X", model = `rrsultanx`, type = "automobile", trackType = "car" },
        { label = "Elegy Wagon", model = `gstrh83`, type = "automobile", trackType = "car" },
        { label = "Comet Exo Drift", model = `204sExoKart`, type = "automobile", trackType = "car" },
        { label = "Schlagen LE", model = `204sSchlagenGT`, type = "automobile", trackType = "car" },
        { label = "G3", model = `204sF92`, type = "automobile", trackType = "car" },
        { label = "Veltrano", model = `204sCosaNostra`, type = "automobile", trackType = "car" },
        { label = "69 Marrow", model = `204s69Marrow`, type = "automobile", trackType = "car" },
        { label = "S95 Wide", model = `204sS95WB`, type = "automobile", trackType = "car" },
        { label = "Baja Miaja", model = `GODzBAJAMIAJA`, type = "automobile", trackType = "car" },
        { label = "Sentinel Competition", model = `204sSentinelComp`, type = "automobile", trackType = "car" },
        { label = "Weevil Sport", model = `rrweevilpu`, type = "automobile", trackType = "car" },
        { label = "Dominator Classic", model = `GODz67ELGT500V2`, type = "automobile", trackType = "car" },
        { label = "Brunki", model = `GODzBRUNKO`, type = "automobile", trackType = "car" },
        { label = "Baja Rangah", model = `GODzRANGAHBAJA`, type = "automobile", trackType = "car" },
        { label = "Widow", model = `blackwidowhyc`, type = "automobile", trackType = "car" },
        { label = "GS4", model = `GODzRS4`, type = "automobile", trackType = "car" },
        { label = "Kuruma X", model = `labskuruma`, type = "automobile", trackType = "car" },
        { label = "Weevil Droptop", model = `GODzVDUBWB`, type = "automobile", trackType = "car" },
        { label = "Scart 4", model = `204sXenonShart4`, type = "automobile", trackType = "car" },
        { label = "Baller X", model = `blrmns`, type = "automobile", trackType = "car" },
        { label = "RT3000 X", model = `204sRT3000`, type = "automobile", trackType = "car" },
        { label = "Gauntlet E", model = `gstbevx1`, type = "automobile", trackType = "car" },
        { label = "Sugoi X", model = `204sSugoi`, type = "automobile", trackType = "car" },
        { label = "Sultan Shadow", model = `gstsulrs1`, type = "automobile", trackType = "car" },
        { label = "Flux", model = `gstetrk1c`, type = "automobile", trackType = "car" },
        { label = "Deluxo X", model = `gstdel3`, type = "automobile", trackType = "car" },
        { label = "Redline", model = `gstviv1`, type = "automobile", trackType = "car" },
        { label = "Dash", model = `gstbls1`, type = "automobile", trackType = "car" },
        { label = "Summit", model = `gstgrs1`, type = "automobile", trackType = "car" },
        { label = "Penumbera RR", model = `gstpenf1`, type = "automobile", trackType = "car" },
        { label = "Sentinel GTS", model = `204sSentinelGTS`, type = "automobile", trackType = "car" },
        { label = "Sentinel XS4", model = `204sSentinelXS4`, type = "automobile", trackType = "car" },
        { label = "STR Coupe", model = `204sSTRCoupe`, type = "automobile", trackType = "car" },
        { label = "Elegy RH7", model = `elegyrh7`, type = "automobile", trackType = "car" },
        { label = "Vectre X", model = `204sVectre`, type = "automobile", trackType = "car" },
        { label = "Seminole Hawk", model = `204sCanisHellfire`, type = "automobile", trackType = "car" },
    },
    ["Sports"] = {
        { label = "Infernus Classic", model = `infernus2`, type = "automobile", trackType = "car" },
        { label = "Banshee 900R", model = `banshee2`, type = "automobile", trackType = "car" },
        { label = "Brioso R/A", model = `brioso`, type = "automobile", trackType = "car" },
        { label = "Blista Kanjo", model = `kanjo`, type = "automobile", trackType = "car" },
        { label = "Issi", model = `issi2`, type = "automobile", trackType = "car" },
        { label = "Issi Classic", model = `issi3`, type = "automobile", trackType = "car" },
        { label = "Panto", model = `panto`, type = "automobile", trackType = "car" },
        { label = "Rhapsody", model = `rhapsody`, type = "automobile", trackType = "car" },
        { label = "Brioso 300", model = `brioso2`, type = "automobile", trackType = "car" },
        { label = "Weevil", model = `weevil`, type = "automobile", trackType = "car" },
        { label = "Issi Sport", model = `issi7`, type = "automobile", trackType = "car" },
        { label = "Blista Compact", model = `blista2`, type = "automobile", trackType = "car" },
        { label = "Blista Go Go Monkey", model = `blista3`, type = "automobile", trackType = "car" },
        { label = "Brioso 300 Widebody", model = `brioso3`, type = "automobile", trackType = "car" },
        { label = "Cognoscenti", model = `cognoscenti`, type = "automobile", trackType = "car" },
        { label = "Stratum", model = `stratum`, type = "automobile", trackType = "car" },
        { label = "Lampadati", model = `cinquemila`, type = "automobile", trackType = "car" },
        { label = "Astron", model = `astron`, type = "automobile", trackType = "car" },
        { label = "Comet", model = `comet7`, type = "automobile", trackType = "car" },
        { label = "Deity", model = `deity`, type = "automobile", trackType = "car" },
        { label = "Schafter", model = `schafter2`, type = "automobile", trackType = "car" },
        { label = "Rhinehart", model = `rhinehart`, type = "automobile", trackType = "car" },
        { label = "Cognoscenti Cabrio", model = `cogcabrio`, type = "automobile", trackType = "car" },
        { label = "Exemplar", model = `exemplar`, type = "automobile", trackType = "car" },
        { label = "F620", model = `f620`, type = "automobile", trackType = "car" },
        { label = "Felon", model = `felon`, type = "automobile", trackType = "car" },
        { label = "Felon GT", model = `felon2`, type = "automobile", trackType = "car" },
        { label = "Jackal", model = `jackal`, type = "automobile", trackType = "car" },
        { label = "Oracle XS", model = `oracle2`, type = "automobile", trackType = "car" },
        { label = "Sentinel", model = `sentinel`, type = "automobile", trackType = "car" },
        { label = "Sentinel XS", model = `sentinel2`, type = "automobile", trackType = "car" },
        { label = "Windsor", model = `windsor`, type = "automobile", trackType = "car" },
        { label = "Windsor Drop", model = `windsor2`, type = "automobile", trackType = "car" },
        { label = "Zion", model = `zion`, type = "automobile", trackType = "car" },
        { label = "Zion Cabrio", model = `zion2`, type = "automobile", trackType = "car" },
        { label = "Previon", model = `previon`, type = "automobile", trackType = "car" },
        { label = "Champion", model = `champion`, type = "automobile", trackType = "car" },
        { label = "Futo", model = `futo`, type = "automobile", trackType = "car" },
        { label = "Sentinel Classic", model = `sentinel3`, type = "automobile", trackType = "car" },
        { label = "Kanjo SJ", model = `kanjosj`, type = "automobile", trackType = "car" },
        { label = "Postlude", model = `postlude`, type = "automobile", trackType = "car" },
        { label = "FR36", model = `fr36`, type = "automobile", trackType = "car" },
        { label = "Coquette BlackFin", model = `coquette3`, type = "automobile", trackType = "car" },
        { label = "Deviant", model = `deviant`, type = "automobile", trackType = "car" },
        { label = "Dominator", model = `dominator`, type = "automobile", trackType = "car" },
        { label = "Pißwasser Dominator", model = `dominator2`, type = "automobile", trackType = "car" },
        { label = "Dominator GTX", model = `dominator3`, type = "automobile", trackType = "car" },
        { label = "Dominator Arena", model = `dominator4`, type = "automobile", trackType = "car" },
        { label = "Dominator ASP", model = `dominator7`, type = "automobile", trackType = "car" },
        { label = "Dominator GTT", model = `dominator8`, type = "automobile", trackType = "car" },
        { label = "Ellie", model = `ellie`, type = "automobile", trackType = "car" },
        { label = "Gauntlet", model = `gauntlet`, type = "automobile", trackType = "car" },
        { label = "Redwood Gauntlet", model = `gauntlet2`, type = "automobile", trackType = "car" },
        { label = "Classic Gauntlet", model = `gauntlet3`, type = "automobile", trackType = "car" },
        { label = "Gauntlet Hellfire", model = `gauntlet4`, type = "automobile", trackType = "car" },
        { label = "Gauntlet Classic Custom", model = `gauntlet5`, type = "automobile", trackType = "car" },
        { label = "Nightshade", model = `nightshade`, type = "automobile", trackType = "car" },
        { label = "Phoenix", model = `phoenix`, type = "automobile", trackType = "car" },
        { label = "Sabre GT Turbo", model = `sabregt`, type = "automobile", trackType = "car" },
        { label = "Sabre GT Turbo Custom", model = `sabregt2`, type = "automobile", trackType = "car" },
        { label = "Stallion", model = `stalion`, type = "automobile", trackType = "car" },
        { label = "Tampa", model = `tampa`, type = "automobile", trackType = "car" },
        { label = "Vamos", model = `vamos`, type = "automobile", trackType = "car" },
        { label = "Vigero", model = `vigero`, type = "automobile", trackType = "car" },
        { label = "Buffalo STX", model = `buffalo4`, type = "automobile", trackType = "car" },
        { label = "Drift Tampa", model = `tampa2`, type = "automobile", trackType = "car" },
        { label = "Ruiner ZZ-8", model = `ruiner4`, type = "automobile", trackType = "car" },
        { label = "Vigero ZX", model = `vigero2`, type = "automobile", trackType = "car" },
        { label = "Buffalo EVX", model = `buffalo5`, type = "automobile", trackType = "car" },
        { label = "Dominator GT", model = `dominator9`, type = "automobile", trackType = "car" },
        { label = "Vigero ZX Convertible", model = `vigero3`, type = "automobile", trackType = "car" },
        { label = "Casco", model = `casco`, type = "automobile", trackType = "car" },
        { label = "Deluxo", model = `deluxo`, type = "automobile", trackType = "car" },
        { label = "Stirling GT", model = `feltzer3`, type = "automobile", trackType = "car" },
        { label = "GT500", model = `gt500`, type = "automobile", trackType = "car" },
        { label = "Mamba", model = `mamba`, type = "automobile", trackType = "car" },
        { label = "Michelli GT", model = `michelli`, type = "automobile", trackType = "car" },
        { label = "Monroe", model = `monroe`, type = "automobile", trackType = "car" },
        { label = "Rapid GT Classic", model = `rapidgt3`, type = "automobile", trackType = "car" },
        { label = "Retinue", model = `retinue`, type = "automobile", trackType = "car" },
        { label = "Retinue MKII", model = `retinue2`, type = "automobile", trackType = "car" },
        { label = "Savestra", model = `savestra`, type = "automobile", trackType = "car" },
        { label = "Stinger", model = `stinger`, type = "automobile", trackType = "car" },
        { label = "Stinger GT", model = `stingergt`, type = "automobile", trackType = "car" },
        { label = "Swinger", model = `swinger`, type = "automobile", trackType = "car" },
        { label = "Viseris", model = `viseris`, type = "automobile", trackType = "car" },
        { label = "190Z", model = `z190`, type = "automobile", trackType = "car" },
        { label = "Z-Type", model = `ztype`, type = "automobile", trackType = "car" },
        { label = "Zion Classic", model = `zion3`, type = "automobile", trackType = "car" },
        { label = "Coquette Classic", model = `coquette2`, type = "automobile", trackType = "car" },
        { label = "Alpha", model = `alpha`, type = "automobile", trackType = "car" },
        { label = "Banshee", model = `banshee`, type = "automobile", trackType = "car" },
        { label = "Bestia GTS", model = `bestiagts`, type = "automobile", trackType = "car" },
        { label = "Buffalo", model = `buffalo`, type = "automobile", trackType = "car" },
        { label = "Buffalo S", model = `buffalo2`, type = "automobile", trackType = "car" },
        { label = "Carbonizzare", model = `carbonizzare`, type = "automobile", trackType = "car" },
        { label = "Comet", model = `comet2`, type = "automobile", trackType = "car" },
        { label = "Comet Retro Custom", model = `comet3`, type = "automobile", trackType = "car" },
        { label = "Comet Safari", model = `comet4`, type = "automobile", trackType = "car" },
        { label = "Comet SR", model = `comet5`, type = "automobile", trackType = "car" },
        { label = "Coquette", model = `coquette`, type = "automobile", trackType = "car" },
        { label = "Coquette D10", model = `coquette4`, type = "automobile", trackType = "car" },
        { label = "8F Drafter", model = `drafter`, type = "automobile", trackType = "car" },
        { label = "Elegy Retro Custom", model = `elegy`, type = "automobile", trackType = "car" },
        { label = "Elegy RH8", model = `elegy2`, type = "automobile", trackType = "car" },
        { label = "Feltzer", model = `feltzer2`, type = "automobile", trackType = "car" },
        { label = "Flash GT", model = `flashgt`, type = "automobile", trackType = "car" },
        { label = "Furore GT", model = `furoregt`, type = "automobile", trackType = "car" },
        { label = "GB 200", model = `gb200`, type = "automobile", trackType = "car" },
        { label = "Komoda", model = `komoda`, type = "automobile", trackType = "car" },
        { label = "Imorgon", model = `imorgon`, type = "automobile", trackType = "car" },
        { label = "Jugular", model = `jugular`, type = "automobile", trackType = "car" },
        { label = "Jester", model = `jester`, type = "automobile", trackType = "car" },
        { label = "Jester Racecar", model = `jester2`, type = "automobile", trackType = "car" },
        { label = "Jester Classic", model = `jester3`, type = "automobile", trackType = "car" },
        { label = "Khamelion", model = `khamelion`, type = "automobile", trackType = "car" },
        { label = "Kuruma", model = `kuruma`, type = "automobile", trackType = "car" },
        { label = "kuruma2", model = `kuruma2`, type = "automobile", trackType = "car" },
        { label = "Locust", model = `locust`, type = "automobile", trackType = "car" },
        { label = "Lynx", model = `lynx`, type = "automobile", trackType = "car" },
        { label = "Massacro", model = `massacro`, type = "automobile", trackType = "car" },
        { label = "Massacro Racecar", model = `massacro2`, type = "automobile", trackType = "car" },
        { label = "Neo", model = `neo`, type = "automobile", trackType = "car" },
        { label = "Neon", model = `neon`, type = "automobile", trackType = "car" },
        { label = "9F", model = `ninef`, type = "automobile", trackType = "car" },
        { label = "9F Cabrio", model = `ninef2`, type = "automobile", trackType = "car" },
        { label = "Omnis", model = `omnis`, type = "automobile", trackType = "car" },
        { label = "Paragon", model = `paragon`, type = "automobile", trackType = "car" },
        { label = "Pariah", model = `pariah`, type = "automobile", trackType = "car" },
        { label = "Penumbra", model = `penumbra`, type = "automobile", trackType = "car" },
        { label = "Penumbra FF", model = `penumbra2`, type = "automobile", trackType = "car" },
        { label = "Rapid GT", model = `rapidgt`, type = "automobile", trackType = "car" },
        { label = "Rapid GT Convertible", model = `rapidgt2`, type = "automobile", trackType = "car" },
        { label = "Raptor", model = `raptor`, type = "automobile", trackType = "car" },
        { label = "Ruston", model = `ruston`, type = "automobile", trackType = "car" },
        { label = "Schafter V12", model = `schafter3`, type = "automobile", trackType = "car" },
        { label = "Schafter LWB", model = `schafter4`, type = "automobile", trackType = "car" },
        { label = "Schlagen GT", model = `schlagen`, type = "automobile", trackType = "car" },
        { label = "Schwartzer", model = `schwarzer`, type = "automobile", trackType = "car" },
        { label = "Seven-70", model = `seven70`, type = "automobile", trackType = "car" },
        { label = "Specter", model = `specter`, type = "automobile", trackType = "car" },
        { label = "Sugoi", model = `sugoi`, type = "automobile", trackType = "car" },
        { label = "Sultan", model = `sultan`, type = "automobile", trackType = "car" },
        { label = "Sultan Custom", model = `sultan2`, type = "automobile", trackType = "car" },
        { label = "Surano", model = `surano`, type = "automobile", trackType = "car" },
        { label = "Tropos Rallye", model = `tropos`, type = "automobile", trackType = "car" },
        { label = "Verlierer", model = `verlierer2`, type = "automobile", trackType = "car" },
        { label = "V-STR", model = `vstr`, type = "automobile", trackType = "car" },
        { label = "ZR350", model = `zr350`, type = "automobile", trackType = "car" },
        { label = "Calico GTF", model = `calico`, type = "automobile", trackType = "car" },
        { label = "Futo GTX", model = `futo2`, type = "automobile", trackType = "car" },
        { label = "Euros", model = `euros`, type = "automobile", trackType = "car" },
        { label = "Jester RR", model = `jester4`, type = "automobile", trackType = "car" },
        { label = "Remus", model = `remus`, type = "automobile", trackType = "car" },
        { label = "Comet Sport", model = `comet6`, type = "automobile", trackType = "car" },
        { label = "Growler", model = `growler`, type = "automobile", trackType = "car" },
        { label = "Vectre", model = `vectre`, type = "automobile", trackType = "car" },
        { label = "Cypher", model = `cypher`, type = "automobile", trackType = "car" },
        { label = "Sultan Classic Custom", model = `sultan3`, type = "automobile", trackType = "car" },
        { label = "RT3000", model = `rt3000`, type = "automobile", trackType = "car" },
        { label = "Sultan RS", model = `sultanrs`, type = "automobile", trackType = "car" },
        { label = "Cheetah Classic", model = `cheetah2`, type = "automobile", trackType = "car" },
        { label = "Omnis e-GT", model = `omnisegt`, type = "automobile", trackType = "car" },
        { label = "Sentinel Classic Widebody", model = `sentinel4`, type = "automobile", trackType = "car" },
        { label = "SM722", model = `sm722`, type = "automobile", trackType = "car" },
        { label = "10F", model = `tenf`, type = "automobile", trackType = "car" },
        { label = "10F Widebody", model = `tenf2`, type = "automobile", trackType = "car" },
        { label = "Issi Rally", model = `issi8`, type = "automobile", trackType = "car" },
        { label = "La Coureuse", model = `coureur`, type = "automobile", trackType = "car" },
        { label = "300R", model = `r300`, type = "automobile", trackType = "car" },
        { label = "Raiden", model = `raiden`, type = "automobile", trackType = "car" },
    },
    ["Motorcycles"] = {
        { label = "KW1r Restricted", model = `cc_s1000rrcc`, type = "bike", trackType = "motorcycle" },
        { label = "KW 1000r Restricted", model = `DBGODzBMWS1000RR`, type = "bike", trackType = "motorcycle" },
        { label = "Old Man MAG Restricted", model = `204sMag`, type = "bike", trackType = "motorcycle" },
        { label = "DBX Restricted", model = `ddgp20`, type = "bike", trackType = "motorcycle" },
        { label = "VSR Restricted", model = `rsv4`, type = "bike", trackType = "motorcycle" },
        { label = "Esmo Restricted", model = `desmo`, type = "bike", trackType = "motorcycle" },
        { label = "Busi Stretched Restricted", model = `GODzHAYABUSA`, type = "bike", trackType = "motorcycle" },
        { label = "RS Turbo Restricted", model = `exr`, type = "bike", trackType = "motorcycle" },
        { label = "G2 Stretch Restricted", model = `GODzNINJAH2`, type = "bike", trackType = "motorcycle" },
        { label = "Surro", model = `DBGODzTERRIA`, type = "bike", trackType = "motorcycle" },
        { label = "Bati 901", model = `bati901`, type = "bike", trackType = "motorcycle" },
        { label = "Kuda", model = `snmcbarracuda`, type = "bike", trackType = "motorcycle" },
        { label = "S1R", model = `yr1sd`, type = "bike", trackType = "motorcycle" },
        { label = "Glyde Sidecar", model = `sidecarh2`, type = "bike", trackType = "motorcycle" },
        { label = "Duck", model = `204sduck`, type = "bike", trackType = "motorcycle" },
        { label = "Duck Stretched", model = `204sducks`, type = "bike", trackType = "motorcycle" },
        { label = "Jigsaw 1000", model = `gsxr1000`, type = "bike", trackType = "motorcycle" },
        { label = "G6", model = `r6`, type = "bike", trackType = "motorcycle" },
        { label = "Shinobi RR", model = `hblv4slv1`, type = "bike", trackType = "motorcycle" },
        { label = "Soft Delo", model = `softdeluxe13`, type = "bike", trackType = "motorcycle" },
        { label = "Vernom", model = `venom`, type = "bike", trackType = "motorcycle" },
        { label = "Hugin", model = `imchugin`, type = "bike", trackType = "motorcycle" },
        { label = "Vex", model = `imcvex`, type = "bike", trackType = "motorcycle" },
        { label = "Bogger", model = `delrey`, type = "bike", trackType = "motorcycle" },
        { label = "G Rod", model = `vrodft2`, type = "bike", trackType = "motorcycle" },
        { label = "Busi X", model = `GODzHAYABUSAV2`, type = "bike", trackType = "motorcycle" },
        { label = "Bagger R", model = `GODz19BAGGER`, type = "bike", trackType = "motorcycle" },
        { label = "Bagger X", model = `GODz17HDSGBAGGER`, type = "bike", trackType = "motorcycle" },
        { label = "Clean Tail", model = `GODzDIRTYTAIL`, type = "bike", trackType = "motorcycle" },
        { label = "EBR 600 Stretched", model = `GODzCBR600`, type = "bike", trackType = "motorcycle" },
        { label = "S1 RedBlur", model = `hblr1gyrt`, type = "bike", trackType = "motorcycle" },
        { label = "500F", model = `CB500F`, type = "bike", trackType = "motorcycle" },
        { label = "PKR1", model = `clretchs1`, type = "bike", trackType = "motorcycle" },
        { label = "EBR 1000R", model = `ebr1000r`, type = "bike", trackType = "motorcycle" },
        { label = "Bog X3", model = `dabob`, type = "bike", trackType = "motorcycle" },
        { label = "ER 250", model = `cr250`, type = "bike", trackType = "motorcycle" },
        { label = "EBR 900", model = `cbr900`, type = "bike", trackType = "motorcycle" },
        { label = "EBR 600rr", model = `cbr05`, type = "bike", trackType = "motorcycle" },
        { label = "Star Born", model = `born2`, type = "bike", trackType = "motorcycle" },
        { label = "Glyde", model = `bigdude`, type = "bike", trackType = "motorcycle" },
        { label = "Faggio RR", model = `aer20`, type = "bike", trackType = "motorcycle" },
        { label = "Sanchez Mini", model = `dirtbike`, type = "bike", trackType = "motorcycle" },
        { label = "Faggio Stretched", model = `faggios`, type = "bike", trackType = "motorcycle" },
        { label = "Pit Bike", model = `HBLMINIDRAG_V2`, type = "bike", trackType = "motorcycle" },
        { label = "S1 Toy Bike", model = `toyretchs1`, type = "bike", trackType = "motorcycle" },
        { label = "G2R Toy Bike", model = `labstoyh2r`, type = "bike", trackType = "motorcycle" },
        { label = "Hakuchou", model = `hakuchou`, type = "bike", trackType = "motorcycle" },
        { label = "Hakuchou Drag", model = `hakuchou2`, type = "bike", trackType = "motorcycle" },
        { label = "Lectro", model = `lectro`, type = "bike", trackType = "motorcycle" },
        { label = "Manchez", model = `manchez`, type = "bike", trackType = "motorcycle" },
        { label = "Nemesis", model = `nemesis`, type = "bike", trackType = "motorcycle" },
        { label = "Nightblade", model = `nightblade`, type = "bike", trackType = "motorcycle" },
        { label = "PCJ-600", model = `pcj`, type = "bike", trackType = "motorcycle" },
        { label = "Sanchez Livery", model = `sanchez`, type = "bike", trackType = "motorcycle" },
        { label = "Sanchez", model = `sanchez2`, type = "bike", trackType = "motorcycle" },
        { label = "Shotaro", model = `shotaro`, type = "bike", trackType = "motorcycle" },
        { label = "Thrust", model = `thrust`, type = "bike", trackType = "motorcycle" },
        { label = "Vindicator", model = `vindicator`, type = "bike", trackType = "motorcycle" },
        { label = "Vortex", model = `vortex`, type = "bike", trackType = "motorcycle" },
        { label = "Manchez Scout", model = `manchez2`, type = "bike", trackType = "motorcycle" },
        { label = "Shinobi", model = `shinobi`, type = "bike", trackType = "motorcycle" },
        { label = "Manchez Scout Classic", model = `manchez3`, type = "bike", trackType = "motorcycle" },
        { label = "Ruffian", model = `ruffian`, type = "bike", trackType = "motorcycle" },
        { label = "Sanctus", model = `sanctus`, type = "bike", trackType = "motorcycle" },
        { label = "FCR 1000", model = `fcr`, type = "bike", trackType = "motorcycle" },
        { label = "FCR 1000 Custom", model = `fcr2`, type = "bike", trackType = "motorcycle" },
        { label = "Gargoyle", model = `gargoyle`, type = "bike", trackType = "motorcycle" },
        { label = "Hexer", model = `hexer`, type = "bike", trackType = "motorcycle" },
        { label = "Innovation", model = `innovation`, type = "bike", trackType = "motorcycle" },
        { label = "Diablous", model = `diablous`, type = "bike", trackType = "motorcycle" },
        { label = "Diablous Custom", model = `diablous2`, type = "bike", trackType = "motorcycle" },
        { label = "Double-T", model = `double`, type = "bike", trackType = "motorcycle" },
        { label = "Enduro", model = `enduro`, type = "bike", trackType = "motorcycle" },
        { label = "Esskey", model = `esskey`, type = "bike", trackType = "motorcycle" },
        { label = "Faggio Sport", model = `faggio`, type = "bike", trackType = "motorcycle" },
        { label = "Faggio", model = `faggio2`, type = "bike", trackType = "motorcycle" },
        { label = "Faggio Mod", model = `faggio3`, type = "bike", trackType = "motorcycle" },
        { label = "Akuma", model = `akuma`, type = "bike", trackType = "motorcycle" },
        { label = "Avarus", model = `avarus`, type = "bike", trackType = "motorcycle" },
        { label = "Bagger", model = `bagger`, type = "bike", trackType = "motorcycle" },
        { label = "Bati 801", model = `bati`, type = "bike", trackType = "motorcycle" },
        { label = "Bati 801RR", model = `bati2`, type = "bike", trackType = "motorcycle" },
        { label = "BF400", model = `bf400`, type = "bike", trackType = "motorcycle" },
        { label = "Carbon RS", model = `carbonrs`, type = "bike", trackType = "motorcycle" },
        { label = "Cliffhanger", model = `cliffhanger`, type = "bike", trackType = "motorcycle" },
        { label = "Daemon", model = `daemon`, type = "bike", trackType = "motorcycle" },
        { label = "Daemon Custom", model = `daemon2`, type = "bike", trackType = "motorcycle" },
        { label = "Bagger LM", model = `GODz15HDSGBAGGERV2`, type = "bike", trackType = "motorcycle" },
        { label = "Defiler", model = `defiler`, type = "bike", trackType = "motorcycle" },
    }
}

-- The calculation can be modified in client/custom/vehicle.lua, `GetVehicleTier`
Config.VehicleTiers = {
    {
        label = "S-tier",
        value = "S",
        score = 1000,
    },
    {
        label = "A-tier",
        value = "A",
        score = 750,
    },
    {
        label = "B-tier",
        value = "B",
        score = 600,
    },
    {
        label = "C-tier",
        value = "C",
        score = 300,
    },
    {
        label = "D-tier",
        value = "D",
        score = 200,
    },
    {
        label = "E-tier",
        value = "E",
        score = 0,
    }
}
