cfg = {}

cfg.joinDelay = 60                --Seconds. Initial amount of time players will be held in the queue on server startup before being being let in.
cfg.cooldown = 3                  --Seconds. Time each individual player will wait before connecting in order to prevent rate limiting and spamming.
cfg.joinInterval = 0              --Seconds. Time to wait in-between each player joining your server. NOTE: This only applies to players in the queue.
cfg.displayQueueInHostName = true --Add the queue count in front of your server name on the list?
cfg.maxPlayersToDisplay = 5      --Max amount of players to show on the queue list page.
cfg.consoleInfo = true            --Print queue information to the server console?
cfg.stackPrio = false              --Combine all rows/roles of prio together or only use the row/role with the highest amount of points?
cfg.gracePrio = true             --Gives players temporary priority points after they disconnect. Useful if players crash, etc.
cfg.gracePoints = 10000            --The amount of temporary priority points a player receives after they disconnect.
cfg.graceTimer = 180              --Seconds. The amount of time a player has to re-connect to the server after disconnecting before their grace priority expires.
cfg.manualConnect = false         --If you dont know what this is, dont touch it. Read docs for more information.

cfg.discord = {
    enabled = true,              --Setting to false will completely ignore all discord related features.
    requireIdentifier = true,     --Require the player to have discord linked to fivem?
    requireInGuild = true,        --Require the player to be in your discord server to connect?
    whitelist = false,            --Enable a whitelist on your server?
    whitelistRoleId = , --The role that players need to have in order to connect if whitelist is enabled.
    botToken = '',                --Bot need to be in the same discord as the guild ID below.
    guildId = '',--ID of your discord server/guild.
    cache = true,                 --Prevent making multiple unnecessary requests to the discord API and possibly help reduce rate limits.
    cacheTimeout = 120            --Seconds. Amount of time that user info from discord requests will be cached for before it gets reset and fresh, up-to-date information is fetched.
}

cfg.prioRoles = { --points must be greater than 0. role ID must be a number. Label IS required, even if blank.
    { label = 'Server Owner', roleId = , points = 10000 },
    { label = 'Server Director', roleId = , points = 10000 },
    { label = 'Management', roleId = , points = 9500 },
    { label = 'Now Live on ', roleId = , points = 9000 },
    { label = 'Crown', roleId = , points = 8500 },
    { label = 'Diamond', roleId = , points = 8000 },
    { label = 'Ruby', roleId = , points = 7500 },
    { label = 'Emerald', roleId = , points = 7000 },
    { label = 'Admin', roleId = , points = 6500 },
    { label = 'Vanity', roleId = , points = 6100 },
    { label = 'Whitelisted', roleId = , points = 6000 },
    { label = 'Civilian', roleId = , points = 5000 }
}

cfg.cardDesign = { --style can be 'positive', 'default' or 'destructive'
    main_page = {
        bannerImage = '',
        store_button = {
            enabled = true,
            label = 'Store',
            iconImage = '',
            url = '',
            style = 'default'
        },
        players_page = {
            enabled = true,
            label = 'Queue List',
            iconImage = 'https://cdn.n4.gg/queue.png',
            style = 'default'
        },
        prio_page = {
            enabled = true,
            label = 'Prio List',
            iconImage = 'https://cdn.n4.gg/prio.png',
            style = 'default'
        },
        discord_button = {
            enabled = true,
            label = 'Discord',
            iconImage = 'https://cdn.n4.gg/discord.png',
            url = '',
            style = 'default'
        }
    },
    prio_page = {
        store_button = {
            enabled = true,
            label = 'Store',
            iconImage = 'https://cdn.n4.gg/store.png',
            url = '',
            style = 'default'
        },
        discord_button = {
            enabled = true,
            label = 'Discord',
            iconImage = 'https://cdn.n4.gg/discord.png',
            url = '',
            style = 'default'
        },
        back_button = {
            label = 'Go Back',
            iconImage = 'https://cdn.n4.gg/back.png',
            style = 'default'
        }
    },
    players_page = {
        store_button = {
            enabled = true,
            label = 'Store',
            iconImage = 'https://cdn.n4.gg/store.png',
            url = '',
            style = 'default'
        },
        discord_button = {
            enabled = true,
            label = 'Discord',
            iconImage = 'https://cdn.n4.gg/discord.png',
            url = '',
            style = 'default'
        },
        back_button = {
            label = 'Go Back',
            iconImage = 'https://cdn.n4.gg/back.png',
            style = 'default'
        }
    }
}

cfg.language = { --All placeholders can be re-arranged, but MUST have curly {} brackets around them. Ex. {NAME}, {QUEUE_SIZE}
    welcome = 'Welcome, {NAME}. Checking queue information, please wait...',
    joined_queue = '^1{NAME} ^7({ID}) joined the queue. [{POSITION}/{QUEUE_SIZE}] ({POINTS} points)',
    connecting =
    'You are waiting in line to join the server.\n\nTotal Points: {POINTS}\nCurrent Position: [{POSITION}/{QUEUE_SIZE}]\nTime Spent: {HOURS}h {MINUTES}m {SECONDS}s ⏰\n\nJoin our discord or visit our store while you wait!',
    joining = '^1{NAME} ^7(ID: {ID} | Temp ID: {TEMP_ID}) is loading into the server.',
    waiting_to_join = 'You are loading into the server... ({SECONDS}s ⌛)',
    restart =
    'Unable to join at this time. This server has a scheduled restart in 15 seconds. Please wait until the server has fully restarted before re-connecting.',
    license_not_found =
    'Your license identifier was unable to be found. Please make sure that you are logged into a rockstar social club account.',
    discord_not_found =
    'Your discord identifier was unable to be found. Please make sure that your discord app is open and your account is linked to FiveM.',
    discord_rate_limited =
    'You are being rate limited by the discord API. Please wait {SECONDS} and try again.',
    duplicate_license = 'Another player with the same license identifier as you was found in the queue.',
    required_in_guild = 'You must be in our discord in order to join the server: ',
    error_occurred = 'An error occurred while processing your queue information. Please reconnect.',
    not_whitelisted = 'You are not whitelisted. You must have the required discord role in order to connect.',
    grace_prio_label = 'Grace Priority',
    label_not_found = 'Label Not Found',
    point_list_row = '{LABEL} | {POINTS} Points',
    point_list_footer = 'Total Points: {POINTS}',
    player_list_header = 'Players in Queue: {COUNT}',
    player_list_footer = 'and {REMAINING_COUNT} other players.'
}
