Config.Collector = {
    enabled = false,
    currency = 'bank', -- currency to use
    rotation = {
        intervalSeconds = 3600, -- rotation interval in seconds
    },
    ped = {
        location = vector4(-135.81, 223.25, 93.93, 87.95),
        model = 'cs_bankman',
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        blipenabled = false,
        blipname = 'Collector',
        blipid = 605,
        scale = 0.4,
        blipcolor = 5
    },
    quotas = {
        normal = 8, -- maximum number of normal cards to allow
        cvg = 4     -- maximum number of cvg cards to allow 
    },
    payout = {
        normalMultiplier = 1.35, -- multiplier for normal cards
        cvgMultiplier = 1.6      -- multiplier for cvg cards
    },
    filters = { 
        minCondition = 90, -- minimum condition to allow
        minGrade = 9,      -- minimum grade to allow
        rarities = {
            allow = { -- set true allow specific rarities set false disable a rarity.
                Normal = false,
                Uncommon = false,
                Rare = false,
                Epic = false,
                Legendary = true,
                Holo = true,
                OriginalArt = false
            }
        }
    },
    -- Manual List: Uncomment to use a manual list of cards.
    -- or set it false and it will pick random cards from configcards.lua
    selection = {
        useManualList = false, -- use manual list of cards
        manualList = {
            normal = { -- manual list of normal cards
                --'card_merryweather_hq'
                --'card_faggio'
            },
            cvg = { -- manual list of cvg cards
                --'card_merryweather_hq'
            }
        }
    }
}
