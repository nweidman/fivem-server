Locales = {} -- edit translation in config/locales
Config = {
    -- Global settings for all scripts
    -- Dont forget to uncomment the imports in fxmanifest.lua if you are using vrp!
    framework = "qbox", -- auto, esx, qb, qbox, vrp, custom - can be customized in config/framework
    garage = "jg", -- auto, esx, qb, qbox, quasar, okok, jg, cd, bp, my, vms, op - can be customized in config/garage
    sql = "oxmysql", -- auto, oxmysql or mysql-async
    phone = "lb", -- auto, esx, qb, d, gks, lb, yserie
    locale = "en", -- locale file to use from config/locales/
    billing = "okok", -- auto, esx, codem, okok, jacksam, quasar
    useMph = true, -- use mph or kmh for speed
    debug = false,

    interactionDistance = 1.2, -- distance from where you can interact with a marker / npc
    defaultBlipSize = 0.8,
    defaultMarkerColor = {
        red = 0,
        green = 255,
        blue = 255,
    },
    enableOXTarget = true, -- enable the OX Target system -> replaces help notification
    useStreamerMode = false, -- enable streamer mode
    maxPing = 200, -- max ping allowed for events
}

-- Blacklist for words you dont want to be used on your server
Config.Blacklist = {
    "<",
    ">",
    "script",
    "iframe",
    "&#8203;",
    "&#x27;",
    "null",
    "undefined",
    "nega",
    "hurensohn",
    "nigga",
    "adolf",
    "hitler",
    "neger",
}