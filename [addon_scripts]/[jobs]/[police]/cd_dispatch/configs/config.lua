Config = {}
function L(cd, ...) if Locales[Config.Language][cd] then return string.format(Locales[Config.Language][cd], ...) else print('Locale is nil ('..cd..')') end end
--███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
--██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
--█████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
--██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
--██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝


--WHAT DOES 'auto_detect' DO?
--The 'auto_detect' feature automatically identifies your framework and SQL database resource, and applies the appropriate default settings.

Config.Framework = 'auto_detect' --[ 'auto_detect' / 'other' ]   If you select 'auto_detect', only ESX and QBCore frameworks will be detected. Use 'other' for custom frameworks.
Config.Database = 'auto_detect' --[ 'auto_detect' ]   If you select 'auto_detect', only MySQL, GHMattimysql, and Oxmysql SQL database resources will be detected.
Config.AutoInsertSQL = false --Would you like the script to insert the necessary SQL tables into your database automatically? If you have already done this, please set it to false.
Config.Notification = 'ox_lib' --[ 'auto_detect' / 'other' ]   If you select 'auto_detect', only ESX, QBCore, cd_notifications, okokNotify, ps-ui and ox_lib notifications will be detected. Use 'other' for custom notification resources.
Config.Language = 'EN' --[ 'EN' / 'DK' / 'FR' / 'NL' ]   You can add your own locales to Locales.lua, but be sure to update the Config.Language to match it.

Config.FrameworkTriggers = {
    esx = { --If you have modified the default event names in the es_extended resource, change them here.
        resource_name = 'es_extended',
        main = 'esx:getSharedObject',
        load = 'esx:playerLoaded',
        job = 'esx:setJob'
    },
    qbcore = { --If you have modified the default event names in the qb-core resource, change them here.
        resource_name = 'qb-core',
        main = 'QBCore:GetObject',
        load = 'QBCore:Client:OnPlayerLoaded',
        job = 'QBCore:Client:OnJobUpdate',
        duty = 'QBCore:Client:SetDuty'
    }
}


--██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗
--██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝
--██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   
--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   
--██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   
--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝


Config.UsingOneSync = true --Do you use OneSync legacy or infinity?
Config.UseFrameworkDutySystem = true --Do you want to use your frameworks (esx/qbcore) built-in duty system?
Config.Debug = false --To enable debug prints.
Config.EnableTestCommand = false --The test command is 'dispatchtest'.

-- █████╗ ███╗   ██╗████████╗██╗     ██████╗██╗  ██╗███████╗ █████╗ ████████╗
--██╔══██╗████╗  ██║╚══██╔══╝██║    ██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝
--███████║██╔██╗ ██║   ██║   ██║    ██║     ███████║█████╗  ███████║   ██║   
--██╔══██║██║╚██╗██║   ██║   ██║    ██║     ██╔══██║██╔══╝  ██╔══██║   ██║   
--██║  ██║██║ ╚████║   ██║   ██║    ╚██████╗██║  ██║███████╗██║  ██║   ██║   
--╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝     ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝      

Config.AntiCheat = {
    ENABLE = true, -- Enable or Disable all of the built in anti cheat features?
    discord_tag_everyone = false, --Tag @ everyone who has access to your discord webhook channel?

    AllowedJobsOnly = { -- Modders add dozens of jobs to the dispatch alert, with the goal of sending alerts to all players on the server.
        ENABLE = true, -- Enable or Disable this feature?
    },

    BannedWords = { -- This will detect any banned words in a dispatch alert or /911 call.
        ENABLE = true, -- Enable or Disable this feature?
        banned_words = {'nigger', 'nigga', 'fag', 'faggot','http','discord','fuck','fucker','fucking','shit','shitty','bullshit','cunt','bitch','bastard','asshole','arsehole','motherfucker','whore','slut','hoe','skank','retard','prick','wanker','fuckhead','asshat','fuk','fck','fuq','sh1t','b1tch','c*nt','f*ck','biatch','azzhole','a$$hole' } --A table of banned words.
    },

    DuplicateMessages = { -- This will detect the same dispatch alerts being sent.
        ENABLE = true, -- Enable or Disable this feature?
        threshold = {
            events = 3, -- (if x amount of events)
            time = 10 -- (in y amount seconds)
        }
    },

    EventSpam = { -- This will detect events being spammed, fast or slow. If x amount of 'events' are triggered within x amount of 'time' this player will be flagged for modding.
        ENABLE = true, -- Enable or Disable this feature?
        fast = { -- This protects again mass event spam.
            events = 8,  -- (if x amount of events)
            time = 3 -- (in y amount seconds)
        },
        slow = { -- This protects against slowly spamming events, when trying to avoid the fast spam detection above.
            events = 5,  -- (if x amount of events)
            time = 20 -- (in y amount seconds)
        }
    },
}


--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝


Config.AllowedJobs = { --A list of jobs who are allowed to use this dispatch.
--This will group different jobs together. Eg., so 2 jobs {'police', 'ambulance'} can both see can see each other on the dispatch UI and the pause menu/mini-map blips.
    [1] = {'police', 'k9', 'ambulance', 'sheriff' }, --police & ambulance group
    -- [2] = {'mechanic', }, --mechanic group
    --[3] = {'1st_job', '2nd_job', }, --add more here
}

Config.UpdateDistanceUI = { --Do you want the distance (how far the player is from the call) to be constantly updated on the dispatch UI?
    ENABLE = true,
    timer = 3 --(in seconds) How often the distance should be updated.
}

Config.NotifyStatusChange = true --Do you want players to be notified when another player changes their status? (eg., from Available to Unavailable).


--██████╗ ██╗     ██╗██████╗ ███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ █████╗ ██╗     ██╗     ███████╗██╗ ██████╗ ███╗   ██╗
--██╔══██╗██║     ██║██╔══██╗██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔══██╗██║     ██║     ██╔════╝██║██╔════╝ ████╗  ██║
--██████╔╝██║     ██║██████╔╝███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ███████║██║     ██║     ███████╗██║██║  ███╗██╔██╗ ██║
--██╔══██╗██║     ██║██╔═══╝ ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██╔══██║██║     ██║     ╚════██║██║██║   ██║██║╚██╗██║
--██████╔╝███████╗██║██║     ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗██║  ██║███████╗███████╗███████║██║╚██████╔╝██║ ╚████║
--╚═════╝ ╚══════╝╚═╝╚═╝     ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝                                                                                                                           


Config.PauseMenuBlips = {
    ENABLE = true, --Do you want to use the built in player blips (on the pause menu & mini-map)?
    data_update_timer = 1, --(in seconds) How many seconds should the blip data from the server side be sent to the client side to be updated?
    blip_type = 'dynamic', --You can choose 3 different methods for displaying the player blips.
    --'static' = Players will all have the same standard player blip.
    --'dynamic' = Players can change their player blip on the dispatch UI's settings page (assigned vehicle).
    --'auto' = Blips will change automatically depending on the vehicle type. (CAN CAUSE HIGH RESOURCE USAGE!).
    flashing_blips = true, --Do you want blips to flash when a player's vehicle has it's emergancy lights enabled?
    bundle_blips = true, --Do you want to bundle the blips together so they do not spam the pause menu legend?
    radiochannel_on_blips = true, --Do you want a players radio chanel to be displayed on blips?
    minimize_longdistance_blips = true, --Do you want long distance blips to be minimized(smaller size) on the mini-map instead of them being hidden?
    
    blip_sprites = { --These are the blip sprites (icons). More blips can be found here - https://docs.fivem.net/docs/game-references/blips.
        ['static'] = 1,
        ['foot'] = 1,
        ['car'] = 56,
        ['motorcycle'] = 226,
        ['k9'] = 442,
        ['helicopter'] = 43,
        ['boat'] = 427,
        ['supervisor'] = 293,
        ['command'] = 89,
        ['highcommand'] = 96,
    },
}

Config.BlipData = { --You need to add all the jobs that will be able to use the dispatch to the table below so you can choose their blip colour.
    --largeui_blip_colour: The colour of the player blips on the mini-map and pause menu.The only colours available by default are blue/orange/yellow/red. More can be added in the html.
    --pausemenu_blip_colour: The colour of the player blips on dispatch UI map. The 1st one is the default colour and the 2nd one is the flashing colour. More blip colours can be found here - https://docs.fivem.net/docs/game-references/blips.

    ['police'] =    {largeui_blip_colour = 'blue',      pausemenu_blip_colour = {3, 1}},
    ['k9'] =    {largeui_blip_colour = 'orange',      pausemenu_blip_colour = {17, 1}},
    ['ambulance'] = {largeui_blip_colour = 'red',       pausemenu_blip_colour = {1, 0}},
    -- ['mechanic'] =  {largeui_blip_colour = 'orange',    pausemenu_blip_colour = {17, 0}},
    --['CHANGE_ME'] = {largeui_blip_colour = 'blue', pausemenu_blip_colour = {3, 1}},
}


--██████╗ ██╗███████╗██████╗  █████╗ ████████╗ ██████╗██╗  ██╗███████╗██████╗ 
--██╔══██╗██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║██╔════╝██╔══██╗
--██║  ██║██║███████╗██████╔╝███████║   ██║   ██║     ███████║█████╗  ██████╔╝
--██║  ██║██║╚════██║██╔═══╝ ██╔══██║   ██║   ██║     ██╔══██║██╔══╝  ██╔══██╗
--██████╔╝██║███████║██║     ██║  ██║   ██║   ╚██████╗██║  ██║███████╗██║  ██║
--╚═════╝ ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


Config.Dispatcher = {
    ENABLE = false, --Do you want to use the build in dispatcher system? (this is optional)
    notify_activity = true, --Do you want players to be notified when a dispatcher comes online/goes offline? 

    Perms = { --A list of jobs and the minimum job grade for those who are allowed to use the dispatcher features.
        ['police'] = 0,
        ['k9'] = 0,
        ['ambulance'] = 0,
        ['sheriff'] = 0,
    },

    AutoRefreshBlips = {
        ENABLE = true, --Do you want the player blips on the dispatch UI map to be auto refreshed for the dispatchers?.
        refresh_timer = 5, --(in seconds) The amount of time it takes to refresh the player blips (the lower the number the higher the resource usage).
    },

    VoipResource = 'pmavoice' ---[ 'toko' / 'mumble' / 'pmavoice' / 'other' ] Choose your servers voip resource.
}


--     ██╗ ██████╗ ██████╗      ██████╗ █████╗ ██╗     ██╗          ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--     ██║██╔═══██╗██╔══██╗    ██╔════╝██╔══██╗██║     ██║         ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--     ██║██║   ██║██████╔╝    ██║     ███████║██║     ██║         ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██   ██║██║   ██║██╔══██╗    ██║     ██╔══██║██║     ██║         ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--╚█████╔╝╚██████╔╝██████╔╝    ╚██████╗██║  ██║███████╗███████╗    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
-- ╚════╝  ╚═════╝ ╚═════╝      ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Config.JobCallCommands = { 
    ENABLE = true,--Do you want to use the job chat commands eg., /911 to send a notification to the police.

    --label: The job display label.
    --command: The chat command.
    --anonymous: Do you want this call to be anonymous? (does not show the callers name or phone number and uses radius blips).
    --job_table: The jobs who can see the calls. (you can add multiple).
    Civilian_Commands = {
        { job_label = 'Police',         command = '911',        anonymous = false, 	job_table = {'police', 'k9'} },
        { job_label = 'Police',         command = '911a',       anonymous = true,   job_table = {'police', 'k9'} },
        { job_label = 'Ambulance',      command = '911ems',     anonymous = false,	job_table = {'ambulance', } },
        -- { job_label = 'Mechanic',       command = 'mechanic',   anonymous = false,	job_table = {'mechanic', } },
        -- { job_label = 'Car dealer',     command = 'cardealer',  anonymous = false,	job_table = {'cardealer', } },
        -- { job_label = 'Real estate',    command = 'realestate', anonymous = false,	job_table = {'realestate', } },
        -- { job_label = 'Taxi',           command = 'taxi',       anonymous = false,	job_table = {'taxi', } },
        --{ job_label = 'CHANGE_ME',      command = 'CHANGE_ME',  anonymous = false,	job_table = {'CHANGE_ME', 'CHANGE_ME'} },
    },
    
    JobReply_Command = 'reply' --The chat command for the jobs above^ to reply to incomming calls.
}


--██████╗  █████╗ ███╗   ██╗██╗ ██████╗    ██████╗ ██╗   ██╗████████╗████████╗ ██████╗ ███╗   ██╗
--██╔══██╗██╔══██╗████╗  ██║██║██╔════╝    ██╔══██╗██║   ██║╚══██╔══╝╚══██╔══╝██╔═══██╗████╗  ██║
--██████╔╝███████║██╔██╗ ██║██║██║         ██████╔╝██║   ██║   ██║      ██║   ██║   ██║██╔██╗ ██║
--██╔═══╝ ██╔══██║██║╚██╗██║██║██║         ██╔══██╗██║   ██║   ██║      ██║   ██║   ██║██║╚██╗██║
--██║     ██║  ██║██║ ╚████║██║╚██████╗    ██████╔╝╚██████╔╝   ██║      ██║   ╚██████╔╝██║ ╚████║
--╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝    ╚═════╝  ╚═════╝    ╚═╝      ╚═╝    ╚═════╝ ╚═╝  ╚═══╝


Config.PanicButton = {
    ENABLE = true, --Do you want to allow dispatch users to use the built-in panic button?
    command = 'panic', --The chat command.
    key = '', --The key press. This is not used by default. You can choose keys here - https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/.
    job_table = {'police', 'k9', 'ambulance', }, --A list of jobs who can use the panic button. (every job in this list will be notified if a panic button is pressed).
    cooldown = 10, --(in seconds) This cooldown is to prevent a player spamming the panic button.
    play_sound_in_distance = true --Do you want the panic button sound to play to all nearby players?
}


--██████╗ ██╗███╗   ██╗ ██████╗ 
--██╔══██╗██║████╗  ██║██╔════╝ 
--██████╔╝██║██╔██╗ ██║██║  ███╗
--██╔═══╝ ██║██║╚██╗██║██║   ██║
--██║     ██║██║ ╚████║╚██████╔╝
--╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ 


Config.Ping = {
    ENABLE = true, --Do you want to allow players who have access to the dispatch to ping their location to other players of the same job?
    command = 'dispatchping', --The chat command.
    key = 'up', --The key press. You can choose other keys here - https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/.
    cooldown = 10, --(in seconds) This cooldown is to prevent a player spamming pings.
}


--██████╗  ██████╗ ██╗     ██╗ ██████╗███████╗     █████╗ ██╗     ███████╗██████╗ ████████╗███████╗
--██╔══██╗██╔═══██╗██║     ██║██╔════╝██╔════╝    ██╔══██╗██║     ██╔════╝██╔══██╗╚══██╔══╝██╔════╝
--██████╔╝██║   ██║██║     ██║██║     █████╗      ███████║██║     █████╗  ██████╔╝   ██║   ███████╗
--██╔═══╝ ██║   ██║██║     ██║██║     ██╔══╝      ██╔══██║██║     ██╔══╝  ██╔══██╗   ██║   ╚════██║
--██║     ╚██████╔╝███████╗██║╚██████╗███████╗    ██║  ██║███████╗███████╗██║  ██║   ██║   ███████║
--╚═╝      ╚═════╝ ╚══════╝╚═╝ ╚═════╝╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝


Config.PoliceAlerts = {
    ENABLE = true, --Do you want to use the built in police alerts?
    police_jobs = {'police', 'k9' }, --The jobs who will be notified from these police alerts.
    whitelisted_jobs = {'police', 'k9', 'ambulance', 'sheriff' }, --These jobs will NOT trigger these police alerts.
    cooldown = 30, --(in seconds) This cooldown is to prevent alerts from being spammed by the same player.
    add_bolos = true, --(requires cd_radar) Do you want to add a bolo for the vehicle that was used in the crime?
    require_witness_peds = {
        ENABLE = false, --Do you want police alerts only to be sent if a witness (npc ped) is in the area?
        distance = 100, --The distance to check for witnesses.
    },

    --[[GUNSHOTS CONFIG]]--
    GunShots = {
        ENABLE = true, ---Do you want gunshots to alert police?
        
        WhitelistedZones = { --Shooting in whitelisted areas doesn't alert police.
            [1] = {coords = vector3(2171.4573, 2920.8975, -75.0776), distance = 400, name = "VAR"}, --VAR.
            [2] = {coords = vector3(-2730.14, 6598.66, 26.12), distance = 400, name = "OIL"}, --OIL Rig
            [3] = {coords = vector3(4994.1411, -5113.1938, 2.5342), distance = 1500, name = "CAYO"}, --CAYO HEIST
        },
        WhitelistedWeapons = { --Shooting whitelisted weapons doesn't alert police.
            [`WEAPON_FLARE`] = true,
            [`WEAPON_FLAREGUN`] = true,
            [`WEAPON_FIREEXTINGUISHER`] = true,
            [`WEAPON_PETROLCAN`] = true,
            [`WEAPON_STUNGUN`] = true,
            [`weapon_huntingrifle`] = true,
            [`WEAPON_NERFAP`] = true,
            [`WEAPON_NERFRIFLE`] = true,
            [`WEAPON_NERFTRIPLE`] = true,
            [`WEAPON_NERFCPDW`] = true,
            [`WEAPON_NERFSNIPER`] = true,
            [`WEAPON_SANDAL`] = true,
            [`WEAPON_HOBO_SPONGE`] = true,
            [`WEAPON_HOBO_BRICK`] = true,
            [`WEAPON_TARANTULA`] = true,
            [`WEAPON_PDBATON`] = true,
            [`WEAPON_BTASER`] = true,
            [`WEAPON_YTASER`] = true,
            [`WEAPON_ACIDPACKAGE`] = true,
            [-1569615261] = true,
            [`WEAPON_SNOWBALL`] = true,
            [`WEAPON_ACIDPACKAGE`] = true,
            --[`ADD_MORE_HERE`] = true,
        },
        WeaponLabels = {
            [`WEAPON_ASSAULTRIFLE`] = 'AK-47',
            [`WEAPON_BULLPUPRIFLE`] = 'Bullpup Rifle',
            [`WEAPON_COMBATPISTOL`] = 'Combat Pistol',
            [`WEAPON_CARBINERIFLE`] = 'Carbine Rifle',
            [`WEAPON_CARBINERIFLE_MK2`] = 'Carbine Rifle mk2',
            [`WEAPON_HEAVYPISTOL`] = 'Heavy Pistol',
            [`WEAPON_MICROSMG`] = 'Micro SMG',
            [`WEAPON_MUSKET`] = 'Musket Rifle',
            [`WEAPON_PISTOL`] =  'Walther P99',
            [`WEAPON_PISTOL_MK2`] = 'Pistol MK2',
            [`WEAPON_PISTOL50`] = 'Pistol .50',
            [`WEAPON_PUMPSHOTGUN`] = 'Pump Shotgun',
            [`WEAPON_REVOLVER`] = 'Revolver',
            [`WEAPON_SNSPISTOL`] = 'SNS Pistol',
            [`WEAPON_SMG`] = 'SMG',
            [`WEAPON_SPECIALCARBINE`] = 'Special Carbine',
            [`WEAPON_SAWNOFFSHOTGUN`] = 'Sawnoff Shotgun',
            [`weapon_appistol`] = 'AP Pistol',
            [`weapon_stungun`] = 'Taser',
            [`weapon_vintagepistol`] = 'Vintage Pistol',
            [`weapon_marksmanpistol`] = 'Marksman Pistol',
            [`weapon_revolver_mk2`] = 'Violence',
            [`weapon_doubleaction`] = 'Double Action Revolver',
            [`weapon_snspistol_mk2`] = 'SNS Pistol Mk II',
            [`weapon_ceramicpistol`] = 'Ceramic Pistol',
            [`weapon_navyrevolver`] = 'Navy Revolver',
            [`weapon_gadgetpistol`] = 'Perico Pistol',
            [`weapon_pistolxm3`] = 'Pistol XM3',
            [`weapon_2011`] = 'Pistol Mk3',
            [`weapon_smg_mk2`] = 'SMG Mk II',
            [`weapon_assaultsmg`] = 'Assault SMG',
            [`weapon_combatpdw`] = 'Combat PDW',
            [`weapon_machinepistol`] = 'Tec-9',
            [`weapon_minismg`] = 'Mini SMG',
            [`weapon_assaultshotgun`] = 'Assault Shotgun',
            [`weapon_bullpupshotgun`] = 'Bullpup Shotgun',
            [`weapon_musket`] = 'Musket',
            [`weapon_heavyshotgun`] = 'Heavy Shotgun',
            [`weapon_dbshotgun`] = 'Double-barrel Shotgun',
            [`weapon_autoshotgun`] = 'Auto Shotgun',
            [`weapon_pumpshotgun_mk2`] = 'Pumpshotgun Mk II',
            [`weapon_combatshotgun`] = 'Combat Shotgun',
            [`weapon_assaultrifle_mk2`] = 'Assault Rifle Mk II',
            [`weapon_carbinerifle_mk2`] = 'Carbine Rifle Mk II',
            [`weapon_advancedrifle`] = 'Advanced Rifle',
            [`weapon_compactrifle`] = 'Compact Rifle',
            [`weapon_specialcarbine_mk2`] = 'Special Carbine Mk II',
            [`weapon_bullpuprifle_mk2`] = 'Bullpup Rifle Mk II',
            [`weapon_militaryrifle`] = 'Military Rifle',
            [`weapon_projectx`] = 'Project XR',
            [`WEAPON_PROJECTXSMG`] = 'Project SXG',
            [`WEAPON_PROJECTXPISTOL`] = 'Project X19',
            [`WEAPON_ARCTIC516`] = 'Arctic X',
            [`weapon_ak47`] = 'AK-47',
            [`weapon_de`] = 'Desert Eagle',
            [`weapon_fnx45`] = 'FN FNX-45',
            [`weapon_glock17`] = 'x17',
            [`weapon_m4`] = 'M4A1', 
            [`weapon_m9`] = 'Beretta M9A3',
            [`weapon_m70`] ='M70', 		
            [`weapon_m1911`] = 'M1911', 	
            [`weapon_uzi`] = 'UZI', 		
            [`weapon_mac10`] = 'MAC-10', 	
            [`weapon_mossberg`] =  'Mossberg 500', 
            [`weapon_remington`] = 'Remington 870',
            [`weapon_scarh`] = 'SCAR-H', 	
            [`weapon_shiv`] = 'Shiv', 		
            [`weapon_ar15`] = 'AR-15', 	
            [`weapon_mk14`] ='MK14', 	
            [`weapon_sledgehammer`] = 'Sledge Hammer',
            [`weapon_mp9`] = 'MP9', 			
            [`weapon_m110`] = 'N100', 			
            [`weapon_hk416`] = 'HK-416', 		
            [`weapon_ak74`] = 'AK-74', 	
            [`weapon_aks74`] = 'AK-S74', 	
            [`weapon_glock18c`]	= 'x18C', 		
            [`weapon_glock22`] = 'x22', 		
            [`weapon_mp5`] = 'H&K MP5', 	
            [`weapon_karambit`] = 'Karambit', 	
            [`weapon_mcxspear`] = 'PD NcSphere', 		
            [`weapon_nsr9`] = 'R9',           
            [`weapon_beanbagshotgun`] = 'Beanbag Shotgun', 
            [`weapon_rfb`] = 'BFR',          
            [`weapon_2011`] = 'Evo 11',  
            [`weapon_hk416b`] = 'HB24',        
            [`weapon_agc`] = 'AG9', 	
            [`weapon_kvr`] = 'KDR', 	
            [`weapon_p5`] = 'G5', 	
            [`weapon_pm4`] = 'P4', 	
            [`weapon_mrevolver`] = 'PD Revolver',
            [`weapon_x19`] = 'x19', 	
            [`weapon_gang1`] = 'x20', 	
            [`weapon_gang2`] = 'x20', 	
            [`weapon_gang3`] = 'x20', 	
            [`weapon_gang4`] = 'x20', 	
            [`weapon_gang5`] = 'x20', 	
            [`weapon_gang6`] = 'x20', 	
            [`weapon_gang7`] = 'x20', 	
            [`weapon_gang8`] = 'x20', 	
            [`weapon_gang9`] = 'x20', 	
            [`weapon_gang10`] = 'x20', 	
            [`WEAPON_EASTERAP`] = 'Easter x19', 	
            [`WEAPON_EASTERSEMI`] = 'Easter Pistol', 	
            [`WEAPON_EASTERHB`] = 'Easter XMG', 	
            [`WEAPON_MK18`] = 'NK18', 	
            [`WEAPON_M320b`] = 'M320', 	
            [`WEAPON_590`] = 'S920', 	
            [`weapon_x17`] ='x17', 	
            [`weapon_c36`] = 'C36', 			
            [`weapon_mi9`] = 'MI9', 			
            [`weapon_mutant_long`] = 'Mutant', 		
            [`weapon_virtus_4`] = 'Virtus', 		
            [`weapon_bluearp762`] = 'Blue PRA 762',        
            [`weapon_g19xcustom`] = 'x19 Custom',     
            [`weapon_arpsc`] = 'Custom PRA Shellcatcher',
            [`weapon_sfarp`] = 'Skeleton Frame PRA',    
            [`weapon_glock41`] = 'x41',             
            [`weapon_plr16kt`] = 'RLP-56',               
            [`weapon_g19xblack`] = 'x19',                
            [`weapon_g17g5mos`] = 'x57',             
            [`weapon_g26switchp`] = '26 Purple Switch',
            [`weapon_cg17p80s`] = 'x17 P80',           
            [`weapon_mdsh`] = 'Compact Shellcatcher',
            [`WEAPON_MB47`] = 'NG47',
            [`WEAPON_2S`] = '3S', 		
            [`WEAPON_A45`] = 'x45', 	
            [`WEAPON_RATREV`] = 'Rat Revolver',
            [`WEAPON_FMICRODRAGON`] = 'White Micro Dragon',
            [`WEAPON_PSTRIKEH`] = 'PURPLE STRIKER-H',
            [`WEAPON_PSPIKE`]= 'PINK SPIKE',
            [`WEAPON_PH4`] = 'PURPLE H4',
            [`WEAPON_PT39`] = 'PURPLE T11',
            [`WEAPON_P1911KT`] = 'WHITE 991',
            [`WEAPON_PT19`] = 'PINK TITAN 19',
            [`WEAPON_PPH120`] = 'RED PHANTOM 24B',
            [`WEAPON_PCM4A1`] = 'PURPLE COBRA M41',
            [`WEAPON_PMK40H1`] = 'PURPLE MK40 H1',
            [`WEAPON_PXS9`] = 'BLUE XTREME S9',
            [`WEAPON_PT17`] = 'YELLOW TITAN 17',
            [`WEAPON_PMK14`] = 'PURPLE NK14',
            [`WEAPON_PHW45`] = 'PINK HAWK 45',
            [`WEAPON_PPH350`] = 'GREEN 350 PSL',
            [`WEAPON_PDT19`] = 'PD TITAN 19',
            [`WEAPON_PDPT870`] = 'PD PATROL 870',
            [`WEAPON_PDPT700`] = 'PD PATROL M700',
            [`WEAPON_MK417`] = 'PD MK417',
            [`WEAPON_PDDT607`] = 'PD DUTY M607',
            [`WEAPON_PDDT7`] = 'PD DUTY C7',
            [`WEAPON_PDT22`] = 'PD PINK TITAN 22',
            [`WEAPON_PDBR5`] = 'PD BREACH M5',
            [`WEAPON_PDFC66`] = 'PD FORCE P66',
            [`WEAPON_PDMK45`] = 'PD MK45',
            [`WEAPON_PDMK33`] = 'PD MK433',
            [`WEAPON_PDMKUSP`] = 'PD MK UTP',
            [`WEAPON_PROJECTXPISTOLUM`] = 'Project X17', 		      
            --[`ADD_MORE_HERE`] = 'CHANGE_ME',
        },
    },

    --[[SPEEDTRAP CONFIG]]--
    SpeedTrap = {
        ENABLE = false, ----Do you want speeding vehicles to alert police?
        check_owner_for_fine = false, --Do you want players to only be fined in vehicles they own? (if enabled, players in stolen cars will not be fined).

        Blip = {
            ENABLE = false, --Do you want speed traps to display on a players minimap?
            sprite = 184, --Icon of the blip.
            scale = 0.7, --Size of the blip.
            colour = 0, --Colour of the blip.
            display = 5, --Set to [4] to display on the pause menu map or [5] to only display on the mini-map.
            name = L('speedtrap_blip_name') --You dont need to change this.
        },

        Locations = {
            --coords: The location of the speed trap.
            --distance: The distance a player must be from the 'coords^' to alert the speed trap. 
            --speed_limit: The minimum speed to alert the speed trap (in MPH). 
            --fine_amount: The amount the player will be fined (set to 0 to not fine a player).
            [1] = {coords = vector3(1051.42, 331.11, 84.00), distance = 9, speed_limit = 150, fine_amount = 500 }, --LS Freeway.
            [2] = {coords = vector3(544.43, -373.24, 33.14), distance = 9, speed_limit = 150, fine_amount = 5000 }, --Into Legion.
            [3] = {coords = vector3(-2612.10, 2940.81, 16.67), distance = 15, speed_limit = 150, fine_amount = 1000 }, --Zancuda.
            [4] = {coords = vector3(287.94, -517.44, 42.89), distance = 15, speed_limit = 100, fine_amount = 500 }, --Pillbox.
            [5] = {coords = vector3(2792.73, 4407.68, 48.44), distance = 24, speed_limit = 150, fine_amount = 1000 }, --Sandy Freeway.
            [6] = {coords = vector3(577.11, -1028.32, 37.07), distance = 15, speed_limit = 100, fine_amount = 1000 }, --Mission Row.
            [7] = {coords = vector3(114.83, -797.89, 30.97), distance = 15, speed_limit = 100, fine_amount = 2000 }, --Legion Square.
            [8] = {coords = vector3(74.33, -163.30, 54.67), distance = 15, speed_limit = 100, fine_amount = 4000 }, --Pink Cage.
            [9] = {coords = vector3(28.19, -971.05, 28.96), distance = 15, speed_limit = 100, fine_amount = 1000 }, --PDM.
            --[10] = {coords = vector3(0, 0, 0), distance = 15, speed_limit = 50, fine_amount = 1000 },
        }
    },
}


--██╗  ██╗███████╗██╗   ██╗███████╗     █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ███████╗    ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║    ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
--██║  ██╗███████╗   ██║   ███████║    ██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝


Config.small_ui = {
    ENABLE = true, --Do you want to enable the small UI?
    command = 'dispatchsmall', --The chat command.
    key = 'u' --The key press. You can choose other keys here - https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/.
}

Config.large_ui = {
    ENABLE = true, --Do you want to enable the large map UI?
    command = 'dispatchlarge',
    key = 'n'
}

Config.respond = {
    ENABLE = true, --Do you want to enable the units responding feature?
    command = 'respond', 
    key = 'g'
}

Config.move_mode = {
    ENABLE = true, --Do you want to enable the move mode feature?
    command = 'movemode'
}

Config.small_ui_left = {
    ENABLE = true, --Do you want to enable the small UI left scroll?
    command = 'scrollleft', 
    key = 'left'
}

Config.small_ui_right = {
    ENABLE = true, --Do you want to enable the small UI right scroll?
    command = 'scrollright', 
    key = 'right'
}


-- ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
--██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
--██║   ██║   ██║   ███████║█████╗  ██████╔╝
--██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
--╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
-- ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝


function Round(cd) return math.floor(cd+0.5) end
function Trim(cd) return cd:gsub('%s+', '') end

function CheckMultiJobs(job)
    for cd = 1, #Config.AllowedJobs do
        for c, d in pairs(Config.AllowedJobs[cd]) do
            if d == job then
                return Config.AllowedJobs[cd]
            end
        end
    end
    return false
end

function GetConfig()
    return Config
end


-- █████╗ ██╗   ██╗████████╗ ██████╗     ██████╗ ███████╗████████╗███████╗ ██████╗████████╗
--██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝
--███████║██║   ██║   ██║   ██║   ██║    ██║  ██║█████╗     ██║   █████╗  ██║        ██║   
--██╔══██║██║   ██║   ██║   ██║   ██║    ██║  ██║██╔══╝     ██║   ██╔══╝  ██║        ██║   
--██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ██████╔╝███████╗   ██║   ███████╗╚██████╗   ██║   
--╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝     ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝ ╚═════╝   ╚═╝   
        

-----DO NOT TOUCH ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING.-----
if Config.Framework == 'auto_detect' then
    if GetResourceState(Config.FrameworkTriggers.esx.resource_name) == 'started' then
        Config.Framework = 'esx'
    elseif GetResourceState(Config.FrameworkTriggers.qbcore.resource_name) == 'started' then
        Config.Framework = 'qbcore'
    end
end
if Config.Framework == 'esx' or Config.Framework == 'qbcore' then
    for c, d in pairs(Config.FrameworkTriggers[Config.Framework]) do
        Config.FrameworkTriggers[c] = d
    end
    Config.FrameworkTriggers.esx, Config.FrameworkTriggers.qbcore = nil, nil
end

if Config.Database == 'auto_detect' then
    if GetResourceState('mysql-async') == 'started' then
        Config.Database = 'mysql'
    elseif GetResourceState('ghmattimysql') == 'started' then
        Config.Database = 'ghmattimysql'
    elseif GetResourceState('oxmysql') == 'started' then
        Config.Database = 'oxmysql'
    end
end

if Config.Notification == 'auto_detect' then
    if GetResourceState('cd_notifications') == 'started' then
        Config.Notification = 'cd_notifications'
    elseif GetResourceState('okokNotify') == 'started' then
        Config.Notification = 'okokNotify'
    elseif GetResourceState('ps-ui') == 'started' then
        Config.Notification = 'ps-ui'
    elseif GetResourceState('ox_lib') == 'started' then
        Config.Notification = 'ox_lib'
    else
        if Config.Framework == 'esx' or Config.Framework == 'qbcore' then
            Config.Notification = Config.Framework
        else
            Config.Notification = 'chat'
        end
    end
end

if Config.Framework == 'esx' then
    Config.FrameworkSQLtables = {
        vehicle_table = 'owned_vehicles',
        vehicle_identifier = 'owner',
    }
elseif Config.Framework == 'qbcore' then
    Config.FrameworkSQLtables = {
        vehicle_table = 'player_vehicles',
        vehicle_identifier = 'citizenid',
    }
end
-----DO NOT TOUCH ANYTHING ABOVE THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING.-----