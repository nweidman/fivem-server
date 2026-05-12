return {

    -- ⚠️ WARNING: When you are working with this script, never do "restart lation_chopshop"
    -- ⚠️ This will cause issues, data loss & more! You must restart the script like this:
    -- ⚠️ "stop lation_chopshop" ..wait a couple seconds.. then "ensure lation_chopshop"

    ----------------------------------------------
    --        🛠️ Setup the basics below
    ----------------------------------------------

    setup = {
        -- Use only if needed, directed by support or know what you're doing
        -- Notice: enabling debug features will significantly increase resmon
        -- And should always be disabled in production
        debug = false,
        -- Set your interaction system below
        -- Available options are: 'ox_target', 'qb-target', 'interact' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        interact = 'ox_target',
        -- Set your notification system below
        -- Available options are: 'lation_ui', 'ox_lib', 'esx', 'qb', 'okok', 'sd-notify', 'wasabi_notify' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        notify = 'ox_lib',
        -- Set your progress bar system below
        -- Available options are: 'lation_ui', 'ox_lib', 'qbcore' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        -- Any custom progress bar must also support animations
        progress = 'ox_lib',
        -- Set your minigame (skillcheck) system below
        -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
        minigame = 'rn_minigames',
        -- Do you want to use Lith Studios Bolt Minigame?
        -- This is a free, interactive minigame for removing wheels
        -- Learn more here: https://lith.store/package/6174416
        ls_bolt_minigame = false,
        -- Set your context menu system below
        -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
        menu = 'ox_lib',
        -- Set your alert & input dialog system below
        -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
        dialogs = 'ox_lib',
        -- Do you want to hide player names in the group menu?
        -- If true, names will instead be replaced with their Player IDs
        -- If false it will display their character names as normal
        hideNames = false,
        -- Do you want to be notified via server console if an update is available?
        -- True if yes, false if no
        version = true,
        -- Input all your police jobs below
        police = { 'police', 'sheriff' }
    },

    ----------------------------------------------
    --       📍 Activity start settings
    ----------------------------------------------

    start = {
        -- Where to spawn the main ped to start chopping
        -- If you wish to disable the starting ped, set coords = false
        coords = vec4(1927.3931, 3837.3005, 32.4726, 232.1737),
        -- The ped model used
        -- More models: https://docs.fivem.net/docs/game-references/ped-models/
        model = 's_m_y_armymech_01',
        -- The scenario assigned to the ped (or scenario = false for no scenario)
        -- More scenarios: https://github.com/DioneB/gtav-scenarios
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        -- You can limit the hours at which the ped is available here
        -- By default, this ped is available 24/7
        -- Min is the earliest the ped is available (in 24hr format)
        -- Max is the latest the ped is available (in 24hr format)
        -- For example, if you want the ped only available during daytime set min = 6 & max = 21
        hours = { min = 0, max = 24 },
        -- How many police must be online in order to start a chop job?
        police = 0,
        -- How long (in seconds) until a vehicle is assigned after requesting a job
        -- Set min & max to 0 to disable the cooldown and instantly assign a vehicle
        cooldown = { min = 0, max = 2 },
        -- When a chop job is completed, do you want to display the "Continue Chopping?"
        -- Dialog to the group owner? True if yes, false if no
        continue = true,
        -- Easy mode is an optional mode that highlights matching vehicle models nearby
        -- Radius is the distance from the player to search for & highlight vehicles
        -- 424 is the maximum "focus zone" with FiveM OneSync anything higher than this will not work
        easyMode = { enable = false, radius = 424 },
        -- This option will REMOVE the ability to start the chopping activity from the main menu
        -- This is useful if you want to use your own custom method to start the chop job
        -- Do not set this option to true if you do not plan to implement a custom method
        exportOnly = false,
        -- Do you want to allow players to chop owned vehicles?
        -- If true, players can chop all vehicles, including owned vehicles
        -- If false, players can only chop unowned vehicles
        allowOwned = false,
        -- ⛔ DANGER: THIS IS A DESTRUCTIVE SETTING
        -- ⛔ DANGER: deleteOwned is only used if allowOwned = true above
        -- ⛔ DANGER: This will delete (permanently remove) an owned vehicle when chopped
        -- ℹ️ INFO: Deleted vehicles are stored in the "deleted_vehicles.sql" file
        -- ℹ️ INFO: This is merely a backup safety measure used for restoration if needed
        deleteOwned = false
    },

    ----------------------------------------------
    --       📈 Customize the XP system
    ----------------------------------------------

    experience = {
        -- The number in these [brackets] are the level
        -- The number after = is the exp required to reach that level
        -- Be sure levels *always* start at level 1 with 0 exp
        [1] = 0,
        [2] = 1000,
        [3] = 5000,
        [4] = 10000,
        [5] = 20000,
        -- You can add or remove levels as you wish
    },

    ----------------------------------------------
    --       🚗 Customize chop vehicles
    ----------------------------------------------

    vehicles = {
        "alpha", "asea", "baller", "banshee", "bjxl", "buccaneer", "bullet", "carbonizzare", "cavalcade2", "coquette",
        "emperor", "exemplar", "f620", "felon", "felon2", "futo", "glendale",
        "huntley", "ingot", "intruder", "jackal", "jester", "manana", "massacro", "ninef", "patriot", "peyote", "phoenix",
        "picador", "premier", "primo", "radi", "rapidgt", "rapidgt2", "regina", "rhapsody", "rocoto", "sabregt",
        "schwarzer", "sentinel", "stanier", "stratum", "sultan", "superd", "surano", "tornado", "vigero"
    },

    ----------------------------------------------
    --        🔨 Customize chopping
    ----------------------------------------------

    chopping = {
        wheels = {
            [0] = { -- Front left tire
                difficulty = { 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 10000
            },
            [1] = { -- Front right tire
                difficulty = { 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 10000
            },
            [2] = { -- Rear left tire
                difficulty = { 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 10000
            },
            [3] = { -- Rear right tire
                difficulty = { 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 10000
            }
        },
        doors = {
            [0] = { -- Front driver door
                difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 12500
            },
            [1] = { -- Front passenger door
                difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 12500
            },
            [2] = { -- Rear driver door
                difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 12500
            },
            [3] = { -- Rear passenger door
                difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 12500
            },
            [4] = { -- Hood
                difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 15000
            },
            [5] = { -- Trunk
                difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
                inputs = { 'E' },
                duration = 15000
            },
        },
        frame = { -- The frame/chassis
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            duration = 25000
        }
    },

    ----------------------------------------------
    --       💰 Customize chop rewards
    ----------------------------------------------

    rewards = {
        -- The number in these [brackets] are the player level
        [1] = {
            -- The min/max amount of "ls_auto_parts" rewarded for each part chopped
            wheels = { min = 1, max = 1 },
            doors = { min = 1, max = 1 },
            frame = { min = 2, max = 3 },
            -- The min/max amount of XP rewarded when completing a chop job
            xp = { min = 25, max = 35 },
            -- The percentage at which chopping parts duration is reduced for this level
            speed = 0
        },
        [2] = {
            wheels = { min = 1, max = 2 },
            doors = { min = 1, max = 2 },
            frame = { min = 2, max = 4 },
            xp = { min = 35, max = 50 },
            speed = 15
        },
        [3] = {
            wheels = { min = 1, max = 3 },
            doors = { min = 1, max = 3 },
            frame = { min = 3, max = 5 },
            xp = { min = 50, max = 75 },
            speed = 30
        },
        [4] = {
            wheels = { min = 2, max = 3 },
            doors = { min = 2, max = 3 },
            frame = { min = 3, max = 6 },
            xp = { min = 75, max = 100 },
            speed = 50
        },
        [5] = {
            wheels = { min = 2, max = 4 },
            doors = { min = 2, max = 4 },
            frame = { min = 4, max = 6 },
            xp = { min = 100, max = 150 },
            speed = 75
        }
    },

    ----------------------------------------------
    --          🗺️ Assign chop zones
    ----------------------------------------------

    zones = {
        -- vec3(2341.2864, 3051.6968, 48.1518), -- Postal 305
        -- vec3(212.1172, 2788.1692, 45.6551), -- Postal 228
        vec3(-363.0835, 6068.8560, 31.5001), -- Postal 046
        -- vec3(427.7523, 6469.8359, 28.7823), -- Postal 065
        -- vec3(2535.2852, 2581.1621, 37.9448), -- Postal 356
        -- vec3(1565.1151, -2160.2920, 77.5205), -- Postal 782
        -- vec3(127.6519, -3104.5066, 5.9267), -- Postal 927
        -- vec3(-746.8200, -2570.0981, 13.8643), -- Postal 905
        -- vec3(-1484.9718, -898.9039, 10.0236), -- Postal 702ish
        -- vec3(-1025.0972, 695.1023, 161.3133), -- Postal 467
        -- You can add or remove locations as you wish
    },

    ----------------------------------------------
    --      🔨 Customize chop shop items
    ----------------------------------------------

    items = {
        -- The main item rewarded when a vehicle part is chopped
        auto_parts = 'ls_auto_parts',
        -- The torch item used to remove doors/frame from vehicle
        torch = {
            -- The item spawn name
            item = 'blowtorch',
            -- Do you want to require the player have a torch to chop?
            require = true,
            -- Should this item be removed on each use?
            remove = false,
            -- Percentage chance this item breaks on failed skillcheck
            -- Set chance to 0 to disable break chance
            break_chance = 5
        },
        lug_wrench = {
            -- The item spawn name
            item = 'WEAPON_WRENCH',
            -- Do you want to require the player have a lug wrench to chop?
            require = true,
            -- Should this item be removed on each use?
            remove = false,
            -- Percentage chance this item breaks on failed skillcheck
            -- Set chance to 0 to disable break chance
            break_chance = 5
        },
        vehicle_finder = {
            -- The item spawn name
            item = 'ls_vehicle_finder',
            -- Should this item be removed on each use?
            remove = false,
            -- How far the detector searches for vehicles
            -- 424 is the maximum "focus zone" with FiveM OneSync
            -- Anything higher than this will not work
            radius = 424,
            -- How long (in seconds) the vehicle finder lasts
            duration = 60,
            -- Customize blip related settings
            blips = {
                -- The blip sprite ID
                sprite = 225,
                -- The blip color ID
                color = 1,
                -- The blip scale
                scale = 0.7,
                -- The blip name
                name = 'Discovered Vehicle',
            }
        }
    },

    ----------------------------------------------
    --          🛒 Customize shops
    ----------------------------------------------

    shops = {
        -- ⚠️ The shops below are added to the main chop shop menu when enabled!
        -- The swap shop is a shop where players can exchange their ls_auto_parts
        -- For whatever items you wish, such as materials, illegal items, etc
        swap = {
            -- Optionally disable this shop if you wish
            enable = false,
            -- This shop specifically only accepts an item as payment
            -- You cannot use traditional methods of cash/bank/etc
            account = 'ls_auto_parts',
            -- Items available for swapping in this shop
            items = {
                -- item: item spawn name
                -- price: price of item in ls_auto_parts
                -- quantity: amount of item given for price
                -- icon: icon for item
                -- level: optional level requirement to buy item
                -- metadata: optional metadata for item
                [1] = { item = 'metalscrap', price = 5, quantity = 1, icon = 'recycle' },
                [2] = { item = 'rubber', price = 3, quantity = 1, icon = 'recycle' },
                [3] = { item = 'aluminum', price = 2, quantity = 1, icon = 'recycle' },
                [4] = { item = 'leather', price = 1, quantity = 1, icon = 'recycle' },
                -- [5] = { item = '', price = 2, quantity = 1, icon = 'recycle' },
                -- [6] = { item = '', price = 1, quantity = 1, icon = 'recycle' },
                -- [7] = { item = '', price = 1, quantity = 1, icon = 'recycle' },
                -- Add or remove items as you wish
            }
        },
        tool = {
            -- Optionally disable this shop if you wish
            enable = false,
            -- Use cash or bank when purchasing here?
            account = 'cash',
            -- Items available for sale in this shop
            items = {
                -- item: item spawn name
                -- price: price of item
                -- icon: icon for item
                -- level: optional level requirement to buy item
                -- metadata: optional metadata for item
                [1] = { item = 'ls_torch', price = 1250, icon = 'fire-flame-curved' },
                [2] = { item = 'ls_lug_wrench', price = 750, icon = 'wrench' },
                [3] = { item = 'ls_vehicle_finder', price = 4500, icon = 'satellite-dish' },
                -- Add or remove items as you wish
            }
        }
    },

}