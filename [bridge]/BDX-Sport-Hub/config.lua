--------------------------------------
-- <!>--    BODHIX | STUDIO     --<!>--
--------------------------------------
--------------------------------------
-- <!>--  Unified Xtreme Store --<!>--
--------------------------------------
-- Support & Feedback: https://discord.gg/PjN7AWqkpF
--------------------------------------
-- CUSTOMER CONFIGURATION FILE
-- Edit this file to customize prices, display names, store locations, etc.
-- Technical settings are protected in config_protected.lua (escrowed)
--------------------------------------

Config = {}

Config.Debug = false -- True / False for Debug System
Config.Framework = "qbox" -- "qb" / "qbox" / "esx" / "vrp" / "creative" / "custom"
Config.Target = "ox" -- Write your Target System: "qb" or "ox" or "none".
Config.TextFont = 4
Config.FrameworkResourceName = nil
Config.EnablePeds = true

-- ═══════════════════════════════════════════════════════════════
-- 🎮 SPORT WHEEL CONFIGURATION
-- ═══════════════════════════════════════════════════════════════
-- The Sport Wheel allows players to quickly switch between their gear
-- Hold the configured key to open the radial wheel menu
-- Key reference: https://docs.fivem.net/docs/game-references/controls/
Config.SportWheel = {
    enabled = true, -- Set to false to disable the sport wheel completely
    key = 0         -- Default: 0 = V key (INPUT_NEXT_CAMERA)
                    -- Common alternatives:
                    -- 57 = F10, 344 = F11, 288 = F1
                    -- 289 = F2, 170 = F3, 311 = K
}

-- ═══════════════════════════════════════════════════════════════
-- 🌟 EXCLUSIVE CONTENT (VIP Section in Discover Page)
-- ═══════════════════════════════════════════════════════════════
-- Set to false to hide the VIP/Exclusive content section in the Discover page
-- This only hides the VIP pack promotion area, not the entire Discover page
Config.ExclusiveContent = {
    enabled = true  -- Set to false to disable/hide VIP section in Discover page
}

-- ═══════════════════════════════════════════════════════════════
-- 🌍 VIP CONTENT LANGUAGE
-- ═══════════════════════════════════════════════════════════════
-- Language for exclusive/VIP content (unlock popups, verification, etc.)
-- Available: "en", "es", "de", "fr", "it", "pt", "ru", "tr", "ar", "zh", "ja", "ko", "hi", "pl", "nl"
-- English (en), Spanish (es), German (de), French (fr), Italian (it), Portuguese (pt)
-- Russian (ru), Turkish (tr), Arabic (ar), Chinese (zh), Japanese (ja), Korean (ko)
-- Hindi (hi), Polish (pl), Dutch (nl)
Config.VIPLanguage = "en"

-- ═══════════════════════════════════════════════════════════════
-- 🌐 DISCORD API PROXY (For Restricted Regions)
-- ═══════════════════════════════════════════════════════════════
-- If Discord is blocked in your country (China, Russia, etc.),
-- set this to true to route Discord API calls through our proxy.
-- This allows Discord verification to work even in restricted regions.
-- ═══════════════════════════════════════════════════════════════
Config.DiscordProxy = false

-- ═══════════════════════════════════════════════════════════════
-- 🏪 STORE OWNERSHIP SYSTEM (Optional Feature)
-- ═══════════════════════════════════════════════════════════════
-- ADMIN COMMAND: /removeowner <storename>
-- Example: /removeowner Skateshop
-- This removes the current owner from the specified store.
-- Only admins with the proper ace permissions can use this command.
-- ═══════════════════════════════════════════════════════════════
Config.StoreOwnership = {
    enabled = false, -- Set to true to enable store ownership system

    -- Purchase prices for each store (players can buy stores)
    storePrices = {
        Skateshop = 500000,  -- $500,000 to buy Venice Skate Shop
        Xtreme = 450000,     -- $450,000 to buy Xtreme Store
        Future = 750000,     -- $750,000 to buy Future Store (exclusive hoverboard location)
        Snowmoh = 400000     -- $400,000 to buy Mountain Ski Shop
    },

    -- ═══════════════════════════════════════════════════════════════
    -- 🔒 PURCHASE WHITELIST (Optional - Restrict who can buy stores)
    -- ═══════════════════════════════════════════════════════════════
    -- When enabled, only players with identifiers in the whitelist can purchase stores.
    -- Supports: steam, discord, fivem, license identifiers
    -- Format: "type:id" (e.g., "discord:123456789", "steam:110000112345678")
    purchaseWhitelist = {
        enabled = false, -- Set to true to enable purchase whitelist

        -- List of allowed player identifiers (Steam, Discord, FiveM, License)
        -- Add your trusted players who are allowed to purchase stores
        allowedPlayers = {
            -- Examples (replace with real IDs):
            -- "discord:123456789012345678",  -- Discord User ID
            -- "steam:110000112345678",       -- Steam Hex ID
            -- "fivem:12345678",              -- FiveM ID
            -- "license:abcdef1234567890",    -- Rockstar License
        }
    }
}

-- Background Music Configuration
-- YouTube video IDs will be randomly selected when menu opens
Config.BackgroundMusic = {
    enabled = true, -- Set to false to disable background music
    volume = 0.09, -- Volume level (0.0 to 1.0) - Temporarily increased for testing
    links = {
        "https://www.youtube.com/watch?v=1sZbN-7_AfE",
        "https://www.youtube.com/watch?v=XVveECQmiAk",
        "https://www.youtube.com/watch?v=OLq7Uf67RaU",
        "https://www.youtube.com/watch?v=GkSo3I7r-6Q",
        "https://www.youtube.com/watch?v=ZWI35CeDeJQ",
        "https://www.youtube.com/watch?v=m-y_IxPcx8U",
        "https://www.youtube.com/watch?v=qtgf-sidZrU",
        "https://www.youtube.com/watch?v=sTMgX1PDGAE",
        "https://www.youtube.com/watch?v=v6HFc5I0hr8",
        "https://www.youtube.com/watch?v=raHDedgyKxg",
        "https://www.youtube.com/watch?v=ZLyyT9yW9kA",
        "https://www.youtube.com/watch?v=TFR0hH7dx9Y",
        "https://www.youtube.com/watch?v=mrz6tS_6EmU",
        "https://www.youtube.com/watch?v=AGgfFGrN88s",
        "https://www.youtube.com/watch?v=YhK2NwPIdt4",
        "https://www.youtube.com/watch?v=r3PZv4b97l4",
        "https://www.youtube.com/watch?v=TiebZllW8As",
        "https://www.youtube.com/watch?v=aWkPBCF8rFU",
        "https://www.youtube.com/watch?v=X2TYH_qTGv8",
        "https://www.youtube.com/watch?v=7GDp7S1HgSk"
    }
}

Config.Language = {
    Info = {
        ['warning'] = 'The Workshop is currently in use by another player.',
        ['purchase'] = 'You have successfully purchased this design!',
        ['base_purchase'] = 'You have successfully purchased %s!',
        ['failed'] = 'You dont have enough money.',
        ['error'] = 'You already own this design.',
        ['no_gear'] = 'No gear available. Check if other scripts are installed.',
        ['need_item'] = 'You need to purchase %s first ($%s)',
        ['purchase_item_prompt'] = 'Purchase %s for $%s?',
        ['purchase_base_success'] = 'Item purchased successfully! Opening customization...',
        ['purchase_base_failed'] = 'Purchase failed. Not enough money.',
        -- Store Ownership
        ['store_purchased'] = 'You have purchased this store! You can now manage it.',
        ['store_purchase_failed'] = 'Store purchase failed. Not enough money.',
        ['store_already_owned'] = 'This store is already owned by someone else.',
        ['store_sold'] = 'You have successfully sold your store.',
        ['store_not_owner'] = 'You do not own this store.',
        ['revenue_received'] = 'Revenue received from your store: $%s',
        ['prices_updated'] = 'Store prices updated successfully!',
        ['hours_updated'] = 'Store hours updated successfully!',
        ['store_listed_for_sale'] = 'Your store is now listed for sale at $%s',
        ['store_unlisted'] = 'Your store is no longer for sale.'
    },
    Store = {
        ['target'] = 'Open Bodhix Studio.',
        ['target_purchase'] = 'Purchase Store ($%s)',
        ['target_manage'] = 'Manage Store',
        ['text'] = '[E] Open Bodhix Studio.',
        ['text_purchase'] = '[E] Purchase Store ($%s)',
        ['text_manage'] = '[G] Manage Store'
    },
    Menu = {
        ["equipment"] = "CUSTOMIZE",
        ["gear"] = "EXPLORE",
        ["whats_new"] = "DISCOVER",
        ["skateboard"] = "Skateboard",
        ["bmx"] = "BMX",
        ["hoverboard"] = "Hoverboard",
        ["rollers"] = "Rollers",
        ["scooter"] = "Scooter",
        ["ski"] = "Skis",
        ["iceskates"] = "Ice Skates",
        ["surfboard"] = "Surfboard",
        ["deck"] = "Deck",
        ["trucks"] = "Trucks",
        ["wheels"] = "Wheels",
        ["ultra"] = "Ultra",
        ["retro"] = "Retro",
        ["modern"] = "Modern",
        ["classic"] = "Classic",
        ["purchase"] = "Purchase",
        ["yes"] = "Yes",
        ["no"] = "No",
        ["select_category"] = "Select Category",
        ["select_style"] = "Select Style",
        ["select_design"] = "Select Design"
    }
}

-- ═══════════════════════════════════════════════════════════════
-- 💰 EQUIPMENT PRICES (Customer Configurable)
-- Global prices for all equipment categories
-- ═══════════════════════════════════════════════════════════════

Config.EquipmentPrices = {
    helmet = 5000,
    forearms = 3500,
    shinguards = 3500
}

-- ═══════════════════════════════════════════════════════════════
-- 🎮 CATEGORY DEFINITIONS (Customer Configurable)
-- Configure prices, display names, and availability
-- Technical settings are in config_protected.lua (escrowed)
-- ═══════════════════════════════════════════════════════════════

Config.Categories = {
    skateboard = {
        -- Customer configurable settings
        displayName = "Skateboard",
        parts = {
            deck = {
                price = 4500,
                modern = { count = 20 },
                classic = { count = 18 }
            },
            trucks = {
                price = 2000,
                modern = { count = 14 },
                classic = { count = 13 }
            },
            wheels = {
                price = 1500,
                modern = { count = 14 },
                classic = { count = 13 }
            }
        },
        baseItemPrice = 15000,
        repairPrice = 5000,
        itemName = "skateboard"
    },

    bmx = {
        -- Customer configurable settings
        displayName = "BMX",
        baseItemPrice = 20000,
        price = 15000,
        count = 10,
        itemName = "bmx"
    },

    hoverboard = {
        -- Customer configurable settings
        displayName = "Hoverboard",
        styles = {
            ultra = {
                count = 16,
                displayName = "Ultra"
            },
            retro = {
                count = 16,
                displayName = "Retro"
            }
        },
        baseItemPrice = 50000,
        price = 35000,
        itemName = "hoverboard"
    },

    rollers = {
        -- Customer configurable settings
        displayName = "Rollers",
        styles = {
            retro = {
                count = 8,
                displayName = "Retro"
            },
            modern = {
                count = 8,
                displayName = "Modern"
            }
        },
        baseItemPrice = 12000,
        price = 8500,
        itemName = "rollers"
    },

    scooter = {
        -- Customer configurable settings
        displayName = "Scooter",
        baseItemPrice = 15000,
        price = 10000,
        count = 10,
        itemName = "scooter"
    },

    ski = {
        -- Customer configurable settings
        displayName = "Skis",
        baseItemPrice = 10000,
        price = 6500,
        count = 15,
        itemName = "skis"
    },

    iceskates = {
        -- Customer configurable settings
        displayName = "Ice Skates",
        baseItemPrice = 7500,
        price = 4500,
        count = 6,
        itemName = "iceskates"
    },

    snowboard = {
        -- Customer configurable settings
        displayName = "Snowboard",
        baseItemPrice = 12000,
        price = 7500,
        count = 16,
        itemName = "snowboard"
    },

    surfboard = {
        -- Customer configurable settings
        displayName = "Surfboard",
        baseItemPrice = 25000,
        price = 15000,
        count = 10,
        itemName = "surfboard"
    }
}

-- ═══════════════════════════════════════════════════════════════
-- 🏪 STORE LOCATIONS (Spot-Based Configuration)
-- Each spot defines: NPC location, available categories, camera, and gear spawn coords
-- ═══════════════════════════════════════════════════════════════

Config.Spots = {
    Skateshop = {
        -- Resource dependency (NPC only spawns if this resource exists, nil = always spawn)
        dependency = nil,

        -- Store Hours (24-hour format, nil = always open)
        hours = nil,

        -- Store Closure Events (triggered when store opens/closes)
        closureEvents = {
            enabled = true,                              -- Enable closure events for this store
            onOpen = "xtreme-store:venice:open",         -- Event triggered when store opens
            onClose = "xtreme-store:venice:close"        -- Event triggered when store closes
        },

        -- NPC Location
        npc = {
            x = 129.3552,   
            y = -218.2211,
            z = 54.5827,
            heading = 53.4226,
            model = 'A_F_Y_Beach_02',
            sex = 'female', -- Used for reaction audio
            scenario = 'WORLD_HUMAN_STAND_IMPATIENT'
        },

        -- NPC Spawn/Leave Points (for realistic arrival/departure)
        npcSpawn = {
            x = 126.9518,    -- Spawn point when arriving
            y = -225.5571,
            z = 54.5828,
            heading = 346.9007
        },
        npcLeave = {
            x = 126.9518,    -- Walk to this point when leaving
            y = -225.5571,
            z = 54.5828,
            heading = 346.9007
        },

        -- Music Distance Settings (proximity-based background music)
        musicDistance = {
            maxDistance = 20.0,      -- Distance where music becomes silent (0 volume)
            maxVolumeDistance = 5.0  -- Distance where music reaches max volume
        },
        -- Camera Positions (per category)
        cameras = {
            skateboard = {
                x = 127.0290,
                y = -218.2390,
                z = 55.7986,
                heading = 243.2017,
                angle = -9.0
            },
            hoverboard = {
                x = -1386.4010,
                y = -1326.0321,
                z = 4.9827,
                heading = 320.2581,
                angle = -9.0
            },
            bmx = {
                x = -1387.6504,
                y = -1334.1372,
                z = 4.6502,
                heading = 345.2973,
                angle = -14.0
            },
            scooter = {
                x = 125.6060,
                y = -218.7161,
                z = 54.5577,
                heading = 198.0248,
                angle = -14.0
            },
            rollers = {
                x = 121.9705,
                y = -212.2097,
                z = 54.5577,
                heading = 200.0553,
                angle = -11.0,
                dict = 'amb@lo_res_idles@',
                name = 'world_human_picnic_female_lo_res_base'
            },
            ski = {
                x = -1386.4010,
                y = -1326.0321,
                z = 4.9827,
                heading = 320.2581,
                angle = -9.0
            },
            iceskates = {
                x = -1385.3987,
                y = -1325.3444,
                z = 7.5,
                heading = 137.9154,
                angle = -11.0,
                dict = 'amb@lo_res_idles@',
                name = 'world_human_picnic_female_lo_res_base'
            },
            snowboard = {
                x = -1386.4010,
                y = -1326.0321,
                z = 4.9827,
                heading = 320.2581,
                angle = -9.0
            },
            surfboard = {
                x = -1386.4010,
                y = -1326.0321,
                z = 4.9827,
                heading = 320.2581,
                angle = -9.0
            }
        },
        -- Gear Spawn Positions (per category)
        gearSpawns = {
            skateboard = {
                x = 128.1677,
                y = -218.8140,
                z = 54.8483,
                heading = 157.5323,
                angle = -17.0
            },
            hoverboard = {
                x = -1385.7,
                y = -1325.45,
                z = 4.21,
                heading = 80.3,
                angle = 197.0
            },
            bmx = {
                x = -1387.3950,
                y = -1331.8953,
                z = 3.92,
                heading = 305.5547,
                angle = 180.0
            },
            scooter = {
                x = 126.2773,
                y = -220.2532,
                z = 53.5924,
                heading = 330.3513,
                angle = 180.0
            },
            rollers = {
                x = 122.6765,
                y = -214.5556,
                z = 53.96,
                heading = 22.9578,
                angle = 0.0
            },
            ski = {
                x = -1385.7,
                y = -1325.45,
                z = 4.21,
                heading = 258.3,
                angle = 127.0
            },
            iceskates = {
                x = -1386.8734,
                y = -1326.3470,
                z = 7.3,
                heading = 339.0,
                angle = 0.0
            },
            snowboard = {
                x = -1385.7,
                y = -1325.45,
                z = 4.21,
                heading = 258.3,
                angle = 127.0
            },
            surfboard = {
                x = -1385.7,
                y = -1325.45,
                z = 4.61,
                heading = 258.3,
                angle = 127.0
            }
        },
        -- Available categories at this spot
        availableCategories = {
            "skateboard",
            "hoverboard",
            "bmx",
            "scooter",
            "rollers",
            "ski",
            "iceskates",
            "snowboard",
            "surfboard"
        },

        -- Equipment Store Coordinates
        equipmentCoords = vector4(126.0299, -224.7277, 54.5828, 339.5011), -- Venice Beach equipment area
        equipmentCameraCoords = vector4(126.7268, -222.7215, 54.5827, 160.0296) -- Equipment camera position
    },
    Xtreme = {
        -- Resource dependency (NPC only spawns if this resource exists, nil = always spawn)
        dependency = "BDX-XTreme-Stores",

        -- Store Hours (24-hour format, nil = always open)
        hours = {
            open = 8,   -- 9 AM
            close = 22  -- 9 PM
        },

        -- NPC Location
        npc = {
            x = 273.6808,
            y = 136.0932,
            z = 104.4110,
            heading = 338.3990,
            model = 'a_m_m_skater_01',
            sex = 'male', -- Used for reaction audio
            scenario = 'WORLD_HUMAN_STRIP_WATCH_STAND'
        },

        -- NPC Spawn/Leave Points (for realistic arrival/departure)
        npcSpawn = {
            x = 278.0,
            y = 132.0,
            z = 104.4,
            heading = 180.0
        },
        npcLeave = {
            x = 270.0,
            y = 142.0,
            z = 104.4,
            heading = 60.0
        },
        -- Music Distance Settings (proximity-based background music)
        musicDistance = {
            maxDistance = 15.0,      -- Distance where music becomes silent (0 volume)
            maxVolumeDistance = 5.0  -- Distance where music reaches max volume
        },
        -- Camera Positions (per category)
        cameras = {
            skateboard = {
                x = 276.8861,
                y = 139.7246,
                z = 104.88,
                heading = 213.8,
                angle = -8.0
            },
            hoverboard = {
                x = 276.8861,
                y = 139.7246,
                z = 104.88,
                heading = 213.8,
                angle = -8.0
            },
            bmx = {
                x = 277.3705,   
                y = 136.1456,
                z = 104.4036,
                heading = 233.7569,
                angle = -8.0
            },
            scooter = {
                x = 277.3705,   
                y = 136.1456,
                z = 104.4036,
                heading = 233.7569,
                angle = -13.0
            },
            rollers = {
                x = 276.5972,
                y = 141.7703,
                z = 104.3924,
                heading = 69.4569,
                angle = -8.0,
                dict = 'rcm_barry3',
                name = 'barry_3_sit_loop'
            },
            ski = {
                x = 276.8861,
                y = 139.7246,
                z = 104.88,
                heading = 213.8,
                angle = -8.0
            },
            iceskates = {
                x = 276.5972,
                y = 141.7703,
                z = 104.3924,
                heading = 69.4569,
                angle = -8.0,
                dict = 'rcm_barry3',
                name = 'barry_3_sit_loop'
            },
            snowboard = {
                x = 276.8861,
                y = 139.7246,
                z = 104.88,
                heading = 213.8,
                angle = -8.0
            },
            surfboard = {
                x = 276.8861,
                y = 139.7246,
                z = 104.88,
                heading = 213.8,
                angle = -8.0
            }
        },
        -- Gear Spawn Positions (per category)
        gearSpawns = {
            skateboard = {
                x = 277.35,
                y = 138.9,
                z = 104.31,
                heading = 159.0,
                angle = -17.0
            },
            hoverboard = {
                x = 277.35,
                y = 138.9,
                z = 104.11,
                heading = -20.0,
                angle = 197.0
            },
            bmx = {
                x = 278.5116,
                y = 135.4036,
                z = 103.9110,
                heading = 296.0635,
                angle = 180.0
            },
            scooter = {
                x = 278.5116,
                y = 135.4036,
                z = 103.4110,
                heading = 95.0635,
                angle = 180.0
            },
             rollers = {
                x = 274.8313,
                y = 142.3921,
                z = 103.4111,
                heading = 247.7757,
                angle = -17.0
            },
            ski = {
                x = 277.35,
                y = 138.9,
                z = 104.08,
                heading = 120.0,
                angle = 127.0
            },
            iceskates = {
                x = 274.8313,
                y = 142.3921,
                z = 103.4111,
                heading = 247.7757,
                angle = -17.0
            },
            snowboard = {
                x = 277.35,
                y = 138.9,
                z = 104.20,
                heading = 120.0,
                angle = 127.0
            },
            surfboard = {
                x = 277.35,
                y = 138.9,
                z = 104.60,
                heading = 120.0,
                angle = 127.0
            }
        },
        -- Available categories at this spot
        availableCategories = {
            "skateboard",
            -- "hoverboard",
            -- "bmx",
            "scooter",
            "rollers"
            -- "ski",
            -- "iceskates",
            -- "snowboard",
            -- "surfboard"
        },

        -- Equipment Store Coordinates
        equipmentCoords = vector4(274.3246, 132.5146, 104.4111, 246.3417), -- Xtreme Store equipment area
        equipmentCameraCoords = vector4(276.2878, 131.9357, 104.4111, 69.9333) -- Equipment camera position
    },
    -- Future = {
    --     -- Resource dependency (NPC only spawns if this resource exists, nil = always spawn)
    --     dependency = "BDX-Future-Store",

    --     -- Store Hours (24-hour format, nil = always open)
    --     hours = {
    --         open = 0,   -- Always open (0 = midnight, 24 hours)
    --         close = 24  -- Always open
    --     },

    --     -- NPC Location
    --     npc = {
    --         x = -1403.8314,
    --         y = -1417.6881,
    --         z = 6.6386,
    --         heading = 2.9339,
    --         model = 'cs_chrisformage',
    --         sex = 'male', -- Used for reaction audio
    --         scenario = 'WORLD_HUMAN_CLIPBOARD'
    --     },

    --     -- NPC Spawn/Leave Points (for realistic arrival/departure)
    --     npcSpawn = {
    --         x = -1408.0,
    --         y = -1420.0,
    --         z = 6.6,
    --         heading = 90.0
    --     },
    --     npcLeave = {
    --         x = -1398.0,
    --         y = -1414.0,
    --         z = 6.6,
    --         heading = 270.0
    --     },
    --     -- Music Distance Settings (proximity-based background music)
    --     musicDistance = {
    --         maxDistance = 20.0,      -- Distance where music becomes silent (0 volume)
    --         maxVolumeDistance = 5.0  -- Distance where music reaches max volume
    --     },
    --     -- Camera Positions (per category)
    --     cameras = {
    --         skateboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         hoverboard = {
    --             x = -1404.0228,   
    --             y = -1414.1089,
    --             z = 7.1,
    --             heading = 296.6042,
    --             angle = -14.0
    --         },
    --         bmx = {
    --             x = nil,   
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         scooter = {
    --             x = nil,   
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         rollers = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil,
    --             dict = 'rcm_barry3',
    --             name = 'barry_3_sit_loop'
    --         },
    --         ski = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         iceskates = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil,
    --             dict = 'rcm_barry3',
    --             name = 'barry_3_sit_loop'
    --         },
    --         snowboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil,
    --         },
    --         surfboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --     },
    --     -- Gear Spawn Positions (per category)
    --     gearSpawns = {
    --         skateboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         hoverboard = {
    --             x = -1403.1,
    --             y = -1413.65,
    --             z = 6.0,
    --             heading = 29.0 ,
    --             angle = 205.0
    --         },
    --         bmx = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         scooter = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --          rollers = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         ski = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         iceskates = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         snowboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         surfboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         }
    --     },
    --     -- Available categories at this spot
    --     availableCategories = {
    --         "hoverboard",
    --     },

    --     -- Equipment Store Coordinates
    --     equipmentCoords = vector4(-1404.5692, -1410.6354, 3.7961, 207.8536), -- Future Store equipment area
    --     equipmentCameraCoords = vector4(-1403.7079, -1412.4713, 3.7961, 28.6214) -- Equipment camera position
    -- },
    -- Snowmoh = {
    --     -- Resource dependency (NPC only spawns if this resource exists, nil = always spawn)
    --     dependency = "BDX-Snow-Motion",

    --     -- Store Hours (24-hour format, nil = always open)
    --     hours = {
    --         open = 6,   -- 7 AM (ski shops open early)
    --         close = 23  -- 8 PM
    --     },

    --     -- NPC Location
    --     npc = {
    --         x = 464.8428,
    --         y = 5572.7905,
    --         z = 782.3241,
    --         heading = 90.4061,
    --         model = 'a_m_y_motox_02',
    --         sex = 'male', -- Used for reaction audio
    --         scenario = 'WORLD_HUMAN_AA_COFFEE'
    --     },
    --     -- NPC Spawn/Leave Points (for realistic arrival/departure)
    --     npcSpawn = {
    --         x = 468.0,
    --         y = 5575.0,
    --         z = 782.3,
    --         heading = 200.0
    --     },
    --     npcLeave = {
    --         x = 460.0,
    --         y = 5568.0,
    --         z = 782.3,
    --         heading = 45.0
    --     },
        
    --     -- Music Distance Settings (proximity-based background music)
    --     musicDistance = {
    --         maxDistance = 25.0,      -- Distance where music becomes silent (0 volume)
    --         maxVolumeDistance = 5.0  -- Distance where music reaches max volume
    --     },
    --     -- Camera Positions (per category)
    --     cameras = {
    --         skateboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         hoverboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         bmx = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         scooter = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         rollers = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil,
    --             dict = 'rcm_barry3',
    --             name = 'barry_3_sit_loop'
    --         },
    --         ski = {
    --             x = 461.7201,
    --             y = 5571.4639,
    --             z = 782.8,
    --             heading = 180.6092,
    --             angle = -8.0
    --         },
    --         iceskates = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil,
    --             dict = 'rcm_barry3',
    --             name = 'barry_3_sit_loop'
    --         },
    --         snowboard = {
    --             x = 461.7201,
    --             y = 5571.4639,
    --             z = 782.8,
    --             heading = 180.6092,
    --             angle = -8.0
    --         },
    --         surfboard = {
    --             x = 461.7201,
    --             y = 5571.4639,
    --             z = 782.8,
    --             heading = 180.6092,
    --             angle = -8.0
    --         }
    --     },
    --     -- Gear Spawn Positions (per category)
    --     gearSpawns = {
    --         skateboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         hoverboard = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         bmx = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         scooter = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --          rollers = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         ski = {
    --             x = 461.8075,
    --             y = 5569.8018,
    --             z = 781.8,
    --             heading = 90.0,
    --             angle = 127.0
    --         },
    --         iceskates = {
    --             x = nil,
    --             y = nil,
    --             z = nil,
    --             heading = nil,
    --             angle = nil
    --         },
    --         snowboard = {
    --             x = 461.8075,
    --             y = 5569.8018,
    --             z = 781.8,
    --             heading = 90.0,
    --             angle = 127.0
    --         },
    --         surfboard = {
    --             x = 461.8075,
    --             y = 5569.8018,
    --             z = 782.2,
    --             heading = 90.0,
    --             angle = 127.0
    --         }
    --     },
    --     -- Available categories at this spot
    --     availableCategories = {
    --         "ski",
    --         "snowboard"
    --     },

    --     -- Equipment Store Coordinates
    --     equipmentCoords = vector4(464.5814, 5566.9805, 782.3248, 28.1487), -- Snowmoh Store equipment area
    --     equipmentCameraCoords = vector4(463.1483, 5568.6631, 782.3248, 209.5430) -- Equipment camera position
    -- },
}

-- ═══════════════════════════════════════════════════════════════
-- WAX PATH SYSTEM (Shared grind rails for all sports)
-- ═══════════════════════════════════════════════════════════════
-- Use /waxmode to enter wax mode, aim at surfaces and press E to place wax points.
-- Use /waxsave to save, /waxcancel to cancel, /waxundo to remove last point.
-- Use /waxlist to see saved paths, /waxdelete [id] to remove one, /waxclear to remove all.
-- Rails are stored server-side and shared across all players and sport scripts.

-- ═══════════════════════════════════════════════════════════════
-- KEY BIND SETTINGS MENU
-- ═══════════════════════════════════════════════════════════════
-- Press this key to open the keybind settings menu (in-game)
-- Players can customize their sport controls per-player (saved via KVP)
-- Key reference: https://docs.fivem.net/docs/game-references/controls/
Config.KeyBindMenu = 168 -- 311 = K key

Config.Wax = {
    GrindDetectDistance = 3.0,  -- How close to a wax path start to show target options
    SetupKey = 38,              -- Key to place wax points in setup mode (38 = E)
    UndoKey = 202,              -- Key to undo last wax point in setup mode (202 = Backspace)

    -- Whitelist: restrict who can use /waxmode (place/edit/delete wax paths)
    -- When enabled, only players with matching identifiers can enter wax mode.
    -- When disabled, wax mode uses default ACE permission (admin only).
    Whitelist = {
        enabled = false,        -- Set to true to enable wax mode whitelist
        allowedPlayers = {
            -- Examples (replace with real IDs):
            -- "discord:123456789012345678",
            -- "steam:110000112345678",
            -- "fivem:12345678",
            -- "license:abcdef1234567890",
        }
    }
}
