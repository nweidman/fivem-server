-- ──────────────────────────────────────────────────────────────────────────────
-- Turf Zones System Configuration                                             
--        racketeering, rivalry conflicts and drug-selling influence.
-- ──────────────────────────────────────────────────────────────────────────────

-- ──────────────────────────────────────────────────────────────────────────────
-- Turf Zones Base                                                             
-- (Information) ► Enables or disables the entire turf zone mechanic.
-- ──────────────────────────────────────────────────────────────────────────────
Config.DisableTurfZones = false              -- Disable all Turf Zone features
Config.DisableEnterNotifications = true      -- Disable enter/leave zone notifications

Config.TurfActivitiesTimers = {
    -- Time window when activities in Rivalries are allowed
    -- This is regarding when graffiti, drugs sales etc counts to reputation.
    enable = false,
    -- WARNING: Make sure you configured correct Config.TimeZone in MainConfig.lua
    -- INFORMATION: Use 24 hours time format
    startTime = "23:00",
    endTime   = "11:00",
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Rivalry System                                                              
-- (Information) ► A timed gang–vs–gang conflict inside a turf zone.
-- (Information) ► EXP and costs scale with your server economy.
-- ──────────────────────────────────────────────────────────────────────────────

Config.Rivalry = {
    Disable = true,             -- Disable/Enable rivalry system
    RivalryStartPrice = 5000,    -- Cost (dirty money). Set to 0 for free rivalry.
    RivalryDuration = 1,         -- Duration in HOURS
    RivalryWinEXP = 250,         -- EXP reward for winning rivalry
    RivarlyBonusMultiplier = 0.5 -- 0.5 - 50% will be added to rivalry after sale of drug 
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Graffiti System                                                             
-- (Information) ► Allows gangs to paint and remove graffiti inside turf zones.
-- (Information) ► Graffiti contributes to zone loyalty and gang EXP.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Graffiti = {
    Disable = false,             -- Disable/Enable graffiti system
    RenderDistance = 30.0,       -- Distance at which graffiti becomes visible
    CooldownTime = 1,            -- Minutes between spraying graffiti
    CooldownTimeRemover = 1,     -- Minutes between removing graffiti
    SprayingTime = 10,           -- Time in seconds for Spraying Progressbar
    RemovingTime = 10,           -- Time in seconds for removing spray Progressbar

    Dispatch = {
        enable = false,
        title = "Graffiti in Progress",
        message = "Individuals are marking territory with graffiti. Possible gang-related activity.",
        type = "Graffiti", -- Reffer to dispatch type of your Dispatch script.
        blip = {
            color = 1, 
            sprite = 1, 
        }
    },

    Items = {                    -- Required items
        graffitiSpray = "spray",
        graffitiRemover = "spray_remover"
    },

    loyality = {                 -- Loyalty mechanics
        LoyalityPerGraffiti = 5,     -- Loyalty gained when gang paints graffiti
        loyalityIncreaseOnRemove = 2, -- Loyalty for removing enemy graffiti
        loyalityDecreaseOnRemove = 2, -- Loyalty lost when enemy removes your graffiti
        loyalityDecreaseOnPaint = 2,   -- Loyalty lost when enemy paints in your zone
        -- Zone ownership changes when a gang reaches ≥51% loyalty.
    },

    exp = {
        SprayingEXPgain = 5,         -- EXP for successfully spraying
        RemovingGraffitiEXPgain = 5  -- EXP for removing enemy graffiti
        -- Note: Removing your own graffiti gives no EXP.
    },

    -- Turf zone graffiti blips (only visible to gang members)
    Blip = {
        Enable = false,
        Radius = 80.0,                -- Min 25. Larger radius = bigger zone highlight.
    },

    Settings = {
        MaxSize = 9.75,               -- Optimal max graffiti size
        MinSize = 1.75,               -- Optimal min graffiti size
    },

    CleanGraffitiInterval = 72,       -- Every X hours all graffiti is auto-cleaned
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Racketeering System                                                         
-- (Information) ► “Protection” spots generating EXP and rewards for controlling gangs.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Racketeering = {
    DisableBlips = false,   -- True = disables blips on map for racketeering
    Cooldown = 120,          -- Minutes between collect attempts
    Exp = 50,               -- EXP for claiming a racketeering point
    Blip = {
        BlipId = 358,
        BlipColor = 1,
    },
    Dispatch = {
        enable = false,
        title = "Extortion in Progress",
        message = "An individual is collecting protection money from a local store. Immediate attention may be required.",
        type = "Robbery", -- Reffer to dispatch type of your Dispatch script.
        blip = {
            color = 1, 
            sprite = 1, 
        }
    }
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Kills Inside Zone                                                        
-- (Information) ► Configure Influance from Killing other Gangs Members inside Turf
--                 and kills on NPC'S
-- ──────────────────────────────────────────────────────────────────────────────
Config.Kills = {
    enable = true,
    Gangs = {
        loyality = {                       -- Loyalty mechanics
            LoyalityPerKill = 5,          -- Loyalty gained when gang kills other gang member
            loyalityDecreasePerKill = 3,   -- Loyalty lost when enemy kills your gang member
            -- Zone ownership changes when a gang reaches ≥51% loyalty.
        },
        exp = {
            killEXPgain = 5, -- EXP for killing enemy gang
        },
    },
    NPCS = {
        LoyalityDecreasePerKill = 1, -- Loyalty decrease when killing NPC'S inside turf
    }
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Drug Selling Integration                                                    
-- (Information) ► Influence for selling drugs inside turf zones.
-- (Information) ► Supports custom drug scripts via integrations.
-- ──────────────────────────────────────────────────────────────────────────────

local drugSellingAvailable = {
    ['drugs_creator'] = "jaksam_drugs",
    ['envi-trap-phone'] = "envi-trap-phone",
}

Config.DrugSelling = {
    expOnDrugSell = 25,         -- EXP per drug transaction in zone

    loyality = {
        -- Ownership uses the ≥51% loyalty rule
        LoyalityPerTransaction = 15,  -- Loyalty gained when gang sells drugs in zone
        loyalityDecreaseOnOtherOrgs = 15 -- Loyalty lost when OTHER gang sells in your zone
    },

    -- Integration Drug Script (follow docs to integrate)
    -- (Information) ► This is regarding fetching data of sold drugs inside turf zones to add loyality etc.

    DrugScript = scriptCheck(drugSellingAvailable) or 'none',

    -- Full integration documentation:
    -- https://docs.otherplanet.dev/scripts/op-gangs/integrations
    --
    -- Fully supported (no config change needed):
    -- - op-drugselling (FREE)
    -- - nc-drugselling
    -- - visualz_selldrugs
    -- - tk_drugs
    -- - lunar_drugscreator
    -- - fs_trapphone
    -- - lation_selling
}