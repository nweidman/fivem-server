Config = {}

-- Enabled additional debug prints as well as displays all the possible (automatic) drop zones on the map
Config.debug = false


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,

    -- Whether or not to use the new ESX export method
    useNewESXExport = false,
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
}

-------------------------------------------------
--- ITEM
-------------------------------------------------
Config.item = {
    enabled = true,

    flareItemName = 'kq_airdrop_flare',
    cooldown = 1800, -- time in seconds

    drop = {
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    }
}

-------------------------------------------------
--- GENERAL
-------------------------------------------------

Config.misc = {
    -- Time in minutes as how long the loot should remain on the ground for
    dropLifetime = 10,

    -- Size of the flare/smoke
    flareScale = 3.0,

    -- How long the smoke should stay for
    flareLifetime = 300, -- time in seconds

    -- Whether or not to show the planes on the map
    planeBlips = false,

    -- Whether or not to show the crates on the map
    crateBlips = false,

    crateBlipsLifetime = 60, -- time in seconds
}

-------------------------------------------------
--- LOOT PICKUP ANIMATION
-------------------------------------------------
Config.pickupAnimation = {
    duration = 5, -- in seconds
    dict = 'mp_take_money_mg',
    anim = 'put_cash_into_bag_loop',
    flag = 1,
}

-------------------------------------------------
--- PLANE
-------------------------------------------------

Config.plane = {
    -- Model of the plane. We recommend using bigger planes to make them more visible to the players
    -- Recommended: titan, streamer216
    model = 'titan',

    -- Color of the plane
    color = { r = 122, g = 108, b = 82 },

    -- Velocity of the plane in m/s
    -- This only affects the flight speed before the drop is dropped. The plane will always slow down right
    -- before dropping the crates

    -- Recommended values between 20 and 100. Anything under or over may cause visual issues
    flightSpeed = 50.0,
}

-------------------------------------------------
--- AUTOMATIC DROPS
-------------------------------------------------

Config.automaticDrop = {
    enabled = true,
    -- Time in minutes
    timeBetweenDrops = 60
}

-- Drop zones for the automatic drop
-- coords = coordinates of the zone
-- radius = radius of the potential drop zone
-- flare = true/false, whether to spawn the flare when the crates hit the ground
-- crates = type of crates that will be dropped. As defined per Config.types. Any amount can be given. Will drop in the stated order with slight delay between each drop
Config.drops = {
    {
        coords = vector3(4490.7, -4485.9, 4.2),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(5043.5, -4603.8, 3.0),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(4898.2, -4909.8, 3.5),
        radius = 20.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(4970.0, -5174.3, 2.3),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(4942.1, -5300.7, 5.5),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(5332.4, -5239.5, 32.3),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(5109.3, -5404.3, 21.0),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
    {
        coords = vector3(4820.1, -4585.0, 20.7),
        radius = 200.0,
        flare = true,
        crates = {
            'weaponparts',
            'weaponparts',
            'weaponparts',
        },
    },
}

-- Types of drops
-- amount = amount of the crates it should drop
-- model = model of the crate
-- chunks = little parts which will be spawned upon crate crash

-- loot
-- -- radius = radius of the loot spawn upon crate crashing
-- -- amount = amount of little crates/items that will spawn
-- -- loot - table of different item crates
-- -- -- hash = model of the drop item
-- -- -- items = list of items, amounts and chances
-- -- -- chance = chance of said "loot" to spawn in relation to other loots
-- -- -- textureVariation = texture variation of the prop
-- -- -- minimumDistanceBetween = minimum distance between the props/loot
-- -- -- offset = object offset
-- -- -- animation = animation used for the pickup
-- -- -- labelSingular = label for one of the items
-- -- -- labelPlurar = label for multiple items
-- -- -- collectMessage = message players will to pickup the item
-- -- -- icon = icon used for target systems
Config.types = {
    ['weaponparts'] = {
        amount = 1,
        model = 'xm3_prop_xm3_box_pile_tq_01a',
        chunks = 'prop_ld_crate_lid_01',
        loot = {
            -- Radius around which items will spawn from the crashed plane
            radius = 5.0,
            -- Amount of loot items that will be spawned
            amount = 3,
            loot = {
                {
                    hash = 'm23_1_prop_m31_roostercrate_03a',
                    items = {
                        {
                            item = 'pistolparts',
                            chance = 50,
                            amount = {
                                min = 1,
                                max = 5,
                            },
                        },
                        {
                            item = 'steel',
                            chance = 50,
                            amount = {
                                min = 5,
                                max = 15,
                            },
                        },
                        {
                            item = 'iron',
                            chance = 50,
                            amount = {
                                min = 5,
                                max = 20,
                            },
                        },
                        {
                            item = 'armor',
                            chance = 50,
                            amount = {
                                min = 2,
                                max = 5,
                            },
                        },
                        {
                            item = 'heistmysterybox',
                            chance = 7,
                            amount = {
                                min = 1,
                                max = 5,
                            },
                        },
                        {
                            item = 'partsmysterybox',
                            chance = 7,
                            amount = {
                                min = 1,
                                max = 5,
                            },
                        },
                        -- {
                        --     item = 'pistolbody',
                        --     chance = 5,
                        --     amount = {
                        --         min = 1,
                        --         max = 1,
                        --     },
                        -- },
                        {
                            item = 'shotgunbody',
                            chance = 2,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'shotgunbarrel',
                            chance = 2,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'smgbody',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'smggrip',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'smgbarrel',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'riflebody',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'riflebarrel',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'riflestock',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'riflegrip',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        {
                            item = 'riflemagazine',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        },
                        -- {
                        --     item = 'WEAPON_2S',
                        --     chance = 1,
                        --     amount = {
                        --         min = 1,
                        --         max = 1,
                        --     },
                        -- },
                        {
                            item = 'WEAPON_MACHINEPISTOL',
                            chance = 1,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        }
                    },
                    chance = 100,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Crate',
                    labelPlurar = 'Crate',
                    collectMessage = 'BREAK OPEN CRATE',
                    icon = 'fas fa-box',
                },
            },
        },
    },
    ['tequila'] = {
        amount = 1,
        model = 'prop_lev_crate_01',
        chunks = 'prop_ld_crate_lid_01',
        loot = {
            -- Radius around which items will spawn from the crashed plane
            radius = 5.0,
            -- Amount of loot items that will be spawned
            amount = 8,
            loot = {
                {
                    hash = 'xm3_prop_xm3_product_box_01',
                    items = {
                        {
                            item = 'kq_tequila',
                            chance = 100,
                            amount = {
                                min = 2,
                                max = 3,
                            },
                        }
                    },
                    chance = 70,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Tequila box',
                    labelPlurar = 'Tequila boxes',
                    collectMessage = 'Pickup the tequila box',
                    icon = 'fas fa-box',
                },
                {
                    hash = 'prop_tequila_bottle',
                    items = {
                        {
                            item = 'kq_tequila',
                            chance = 100,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        }
                    },
                    chance = 30,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Tequila bottle',
                    labelPlurar = 'Tequila bottle',
                    collectMessage = 'Pickup the tequila bottle',
                    icon = 'fas fa-box',
                },
            },
        },
    },
}
