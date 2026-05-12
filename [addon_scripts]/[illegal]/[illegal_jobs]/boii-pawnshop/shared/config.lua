----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

-- Debug settings
Config.Debug = false -- Toggles debug notes

-- Sql settings
Config.UseSQL = false -- Toggle use of sql to buy/sell items. True = sold items will be added to sql and players can buy available stock, False = players can only sell items

-- Core settings for renamed cores (kept for compatibility, but we use qb-core directly)
Config.CoreSettings = {
    Core = 'QBCore',
    CoreFolder = 'qb-core',
    TargetName = 'ox_target',
    MenuName = 'ox_lib',
    InputName = 'ox_lib',
}

-- Resource settings
Config.ResourceSettings = {
    Menu = 'ox_lib', -- Options; qb-menu, boii_ui (we’ll use ox_lib)
}

-- Blip settings
Config.Blips = {
    {title = 'Pawnshop', colour = 46, id = 617, coords = vector3(1121.96, -329.21, 67.12), scale = 0.7, useblip = true}
    -- {title = 'Techshop', colour = 5, id = 79, coords = vector3(-658.66, -854.7, 24.51), scale = 0.6, useblip = true},
    -- {title = 'Fence', colour = 5, id = 88, coords = vector3(-111.64, -7.5, 70.52), scale = 0.6, useblip = true}
}

-- Ped settings
Config.Peds = {
    {name = 'Pawnshop', coords = vector4(1121.96, -329.21, 67.12, 193.1), model = 'cs_molly', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Molly', icon = 'fa-solid fa-shop', event = 'boii-pawnshop:cl:PawnshopMenu', distance = 2.0},
    -- {name = 'Techshop', coords = vector4(-658.66, -854.7, 24.51, 359.8), model = 'a_m_m_hasjew_01', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Herman', icon = 'fa-solid fa-shop', event = 'boii-pawnshop:cl:TechshopMenu', distance = 2.0},
    {name = 'Fence', coords = vec4(-1486.8237, -909.3711, 10.0236, 277.8412), model = 's_m_y_dealer_01', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Fence', icon = 'fab fa-drupal', event = 'boii-pawnshop:cl:FenceMenu', distance = 2.0},
}

-- Pawnshop settings
Config.Pawnshop = {
    Times = { Use = false, Open = 09, Close = 21 },
    Money = { Buy = 'cash', Sell = 'cash' },
    Items = {
        Materials = {
            ['metalscrap'] = { item = 'metalscrap', label = 'Metal Scrap', price = 100,  buymultiplier = 5 },
            ['iron']       = { item = 'iron',       label = 'Iron',        price = 100,  buymultiplier = 5 },
            ['steel']      = { item = 'steel',      label = 'Steel',       price = 100,  buymultiplier = 5 },
            ['aluminum']   = { item = 'aluminum',   label = 'Aluminum',    price = 100,  buymultiplier = 5 },
            ['copper']     = { item = 'copper',     label = 'Copper',      price = 100, buymultiplier = 5 },
            ['plastic']    = { item = 'plastic',    label = 'Plastic',     price = 100,  buymultiplier = 5 },
            ['rubber']     = { item = 'rubber',     label = 'Rubber',      price = 100, buymultiplier = 5 },
            ['glass']     = { item = 'glass',     label = 'Glass',      price = 100, buymultiplier = 5 }
        }, 
        Gems = {
            ['diamond'] = { item = 'diamond', label = 'Diamond', price = 300, buymultiplier = 5 },
            ['emerald'] = { item = 'emerald', label = 'Emerald', price = 300, buymultiplier = 5 },
            ['ruby'] = { item = 'ruby', label = 'Ruby', price = 300, buymultiplier = 5 },
            ['sapphire'] = { item = 'sapphire', label = 'Sapphire', price = 300, buymultiplier = 5 }
        },
        Jewellery = {
            ['goldchain']     = { item = 'goldchain', label = 'Goldchain',      price = 150,  buymultiplier = 5 },
            ['rolex']         = { item = 'rolex',     label = 'Golden Watch',          price = 150, buymultiplier = 5 },
            ['tenkgoldchain']  = { item = 'tenkgoldchain', label = '10K Goldchain', price = 250, buymultiplier = 5 },
            ['diamond_ring']  = { item = 'diamond_ring', label = 'Diamond Ring',   price = 450, buymultiplier = 5 },
            ['gold_ring']  = { item = 'gold_ring', label = 'Gold Ring',   price = 150, buymultiplier = 5 },
            ['sapphire_ring']  = { item = 'sapphire_ring', label = 'Sapphire Ring',   price = 450, buymultiplier = 5 },
            ['ruby_ring']  = { item = 'ruby_ring', label = 'Ruby Ring',   price = 450, buymultiplier = 5 },
            ['emerald_ring']  = { item = 'emerald_ring', label = 'Emerald Ring',   price = 450, buymultiplier = 5 },
            ['diamond_necklace'] = { item = 'diamond_necklace', label = 'Diamond Necklace', price = 450, buymultiplier = 5 },
            ['ruby_necklace'] = { item = 'ruby_necklace', label = 'Ruby Necklace', price = 450, buymultiplier = 5 },
            ['emerald_necklace'] = { item = 'emerald_necklace', label = 'Emerald Necklace', price = 450, buymultiplier = 5 },
            ['sapphire_necklace'] = { item = 'sapphire_necklace', label = 'Sapphire Necklace', price = 450, buymultiplier = 5 },
            ['diamond_earring'] = { item = 'diamond_earring', label = 'Diamond Earring', price = 450, buymultiplier = 5 },
            ['goldearring'] = { item = 'goldearring', label = 'Gold Earring', price = 350, buymultiplier = 5 },
            ['emerald_earring'] = { item = 'emerald_earring', label = 'Emerald Earring', price = 450, buymultiplier = 5 },
            ['ruby_earring'] = { item = 'ruby_earring', label = 'Ruby Earring', price = 450, buymultiplier = 5 },
            ['sapphire_earring'] = { item = 'sapphire_earring', label = 'Sapphire Earring', price = 450, buymultiplier = 5 },
        },
        HomeGoods = {
            ['x_artpiece'] = { item = 'x_artpiece', label = 'Art Piece',      price = 2500,  buymultiplier = 5 },
            ['x_musicequipment'] = { item = 'x_musicequipment', label = 'Loud Speaker',      price = 2000,  buymultiplier = 5 },
            ['x_pcequipment'] = { item = 'x_pcequipment', label = 'PC',      price = 2000,  buymultiplier = 5 },
            ['x_television'] = { item = 'x_television', label = 'Television',      price = 2000,  buymultiplier = 5 },
            ['x_toaster'] = { item = 'x_toaster', label = 'Toaster',      price = 1000,  buymultiplier = 5 },
            ['x_microwave'] = { item = 'x_microwave', label = 'Microwave',      price = 3250,  buymultiplier = 5 },
            ['x_coffeemaker'] = { item = 'x_coffeemaker', label = 'Coffee Maker',      price = 800,  buymultiplier = 5 },
            ['x_painting'] = { item = 'x_painting', label = 'Painting A',      price = 1250,  buymultiplier = 5 },
            ['x_painting2'] = { item = 'x_painting2', label = 'Painting B',      price = 1250,  buymultiplier = 5 },
            ['x_bananatrophy'] = { item = 'x_bananatrophy', label = 'Banana Trophy',      price = 3500,  buymultiplier = 5 },
            ['x_goldenknife'] = { item = 'x_goldenknife', label = 'Golden Knife',      price = 2500,  buymultiplier = 5 },
            ['x_electricguitar'] = { item = 'x_electricguitar', label = 'Electric Guiter',      price = 2000,  buymultiplier = 5 },
            ['x_suitcase'] = { item = 'x_suitcase', label = 'Suitcase',      price = 1000,  buymultiplier = 5 },
            ['x_plush'] = { item = 'x_plush', label = 'Plush Toy',      price = 1500,  buymultiplier = 5 },
            ['wires'] = { item = 'wires', label = 'Wires',      price = 100,  buymultiplier = 5 },
            ['circuitboard'] = { item = 'circuitboard', label = 'Circuit Board',      price = 150,  buymultiplier = 5 },
            ['phone'] = { item = 'phone', label = 'Phone',      price = 250,  buymultiplier = 5 },
            ['laptop'] = { item = 'laptop', label = 'Laptop',      price = 250,  buymultiplier = 5 }
    }
},
    Store = {
        Items = {
            -- [1] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 1 },
            -- [2] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 2 }
        }
    }
}

-- Tech shop settings
Config.Techshop = {
    Times = { Use = true, Open = 09, Close = 21 },
    Money = { Buy = 'cash', Sell = 'cash' },
    Items = {
        Electronics = {
            ['tablet']       = { item = 'tablet',       label = 'Tablet',        price = 40, buymultiplier = 3 },
            ['laptop']       = { item = 'laptop',       label = 'Laptop',        price = 50, buymultiplier = 3 }
        }, 
    },
    Store = { 
        Items = {
            [1] = { name = 'electronickit', price = 300, amount = 100, info = {}, type = 'item', slot = 1 },
            [2] = { name = 'phone',         price = 700, amount = 100, info = {}, type = 'item', slot = 2 },
            [3] = { name = 'radio',         price = 2000, amount = 100, info = {}, type = 'item', slot = 3 }
        }
    }
}

-- Fence settings
Config.Fence = {
    Times = { Use = true, Open = 20, Close = 04 },
    Money = { Buy = 'cash', Sell = 'cash' },
    Items = {
        Gold = {
            ['goldbar'] = { item = 'goldbar', label = 'Gold Bar', price = math.random(800,2000), buymultiplier = 2.5 },
            ['giant_gem'] = { item = 'giant_gem', label = 'Giant Gem', price = math.random(75000,100000), buymultiplier = 2.5 }
        }, 
    },
    Store = { 
        Items = {
            -- [1] = { name = 'lockpick',       price = 300,  amount = 100, info = {}, type = 'item', slot = 1 },
            -- [2] = { name = 'screwdriverset', price = 1000, amount = 100, info = {}, type = 'item', slot = 2 },
            -- [3] = { name = 'radioscanner',   price = 2000, amount = 100, info = {}, type = 'item', slot = 3 }
        }
    }
}

-- Smelting settings
Config.Smelting = {
    Times = { Use = false, Open = 09, Close = 21 },
    Location = {
        {
            coords = vector3(1086.16, -2004.0, 31.37),
            length = 6.0, width = 6.0, heading = 140.50,
            debugPoly = false, minZ = 30.25, maxZ = 33.25,
            event = 'boii-pawnshop:cl:SmeltingMenu',
            icon = 'fas fa-fire-alt', label = 'Smelt Gold', distance = 5.0
        }
    },
    Items = {
        ['goldchain'] = { item = 'goldchain', label = 'Gold Chain', amount = 10, returnitem = 'goldbar', returnamount = 1, time = math.random(10, 15) },
        ['rolex'] = { item = 'rolex', label = 'Golden Watch', amount = 10, returnitem = 'goldbar', returnamount = 1, time = math.random(10, 15) },
        ['tenkgoldchain'] = { item = 'tenkgoldchain', label = '10K Gold Chain', amount = 5, returnitem = 'goldbar', returnamount = 1, time = math.random(10, 15) }
    },
    Animations = {
        Dict = 'amb@prop_human_movie_bulb@base',
        Anim = 'base',
        Flags = 49
    }
}
