
--      /$$$$$ /$$                                    /$$$$$$ 
--     |__  $$|__/                                   /$$__  $$
--        | $$ /$$ /$$$$$$/$$$$                     | $$  \__/
--        | $$| $$| $$_  $$_  $$       /$$$$$$      | $$ /$$$$
--   /$$  | $$| $$| $$ \ $$ \ $$      |______/      | $$|_  $$
--  | $$  | $$| $$| $$ | $$ | $$                    | $$  \ $$
--  |  $$$$$$/| $$| $$ | $$ | $$                    |  $$$$$$/
--   \______/ |__/|__/ |__/ |__/                     \______/  

Config = {}
-- Debug mode
Config.Debug = false

-- Arabic = Chinese = Dutch = English = French = German = Italian = Japanese = Korean = Portuguese = Russian = Spanish = Turkish
Config.Language = 'English'

-- true  = use Bridge target interactions on shop/sell peds
-- false = use on-screen drawtext with E key prompts
Config.Target = true

-- Show Player Button: enable/disable the ability to show cards to nearby players
Config.ShowPlayerButton = true

-- Brand URL displayed in UI (www.j-g.com by default)
Config.BrandURL = 'www..com'

-- Slab brand text
Config.CVGBrandText = ''

-- Pity system settings: boosts rare pulls after dry streaks
Config.Pity = {
    enabled = false, -- Recommended off; makes rare pulls more common if enabled
    -- Packs without the rarity before boosting chance
    thresholds = { 
        Rare = 5,  
        Epic = 8,   
        Legendary = 12,  
        Holo = 10 
    },
    -- Chance multiplier applied when threshold is met (finalChance = chance * boost)
    boosts = {    
        Rare = 2.0, 
        Epic = 2.5, 
        Legendary = 3.0,  
        Holo = 2.5 
    },
    -- If true, ensures boosted rarities have at least max >= 1
    raiseMax = false
}

-- Card condition roll settings; controls typical condition of new cards
Config.Condition = { -- [ Recommended To leave on turning it off wil make card conditions always 100% and fuck up cvg ]
    preset = 'strict', -- choose distribution preset
    degradeOnUse = true, -- remove condition when showing card and to other players
    degradeAmount = 2, -- percentage to remove (2 = 2%, 5 = 5%, etc.)
    presets = {
        strict   = { 
            [0]=12,  [10]=12, [20]=10,   [30]=9,  [40]=8,  [50]=7,   [60]=6,   [70]=5,  [80]=3,  [90]=2,  [100]=1   },
        balanced = { 
            [0]=2,   [10]=3,  [20]=5,   [30]=7,   [40]=9,  [50]=10,  [60]=10,  [70]=9,  [80]=7,  [90]=5,  [100]=3   },
        generous = { 
            [0]=1,   [10]=2,  [20]=3,   [30]=4,   [40]=5,  [50]=7,   [60]=9,   [70]=12, [80]=16, [90]=19, [100]=22  }
    },
}

Config.Sleeves = {
    enabled = true,
    item = 'card_sleeves',
    overlayImage = 'card_sleeve_overlay.webp',
    fullProtect = true,
    -- if wear is 2% and protectPercent = 0.60, then you reduce the wear by = 0.8% per view from 2%.
    protectPercent = 0.60,
    -- if true, sleeve item is returned when the card leaves (sold / graded / etc). if false, it gets destroyed.
    returnSleeve = false
}

-- check if player has already has same card with same name in the book
Config.BindersDuplicatesCheck = true

-- if true it will display a checklist of cards in the book at the back page [20]
Config.BindersChecklistEnabled = true

-- if true, binders will only accept cards that match their assigned brand
Config.BindersEnforceBrand = true

-- Auto-position cards in binder based on their order in configcards.lua
-- true = cards automatically go to their "correct" position (1st card = slot 1, 2nd card = slot 2, etc.)
-- false = traditional manual placement
Config.BindersAutoPosition = true

-- Available themes: Dark, Dark_Blue, Light, Vibrant, Vibrant_Pink, Forest_Green, Neon_Cyan, Sunset_Orange, Midnight_Purple, 
-- Steel_Grey, Gold_Black, Ocean_Teal, Crimson_Black, Azure_Black, Sandstone, Glacier_Blue, Plum_Rose, Emerald_Stone
Config.Binders = {
    { item = '',           themebook = 'Dark',           brand = '' },
    { item = 'jg_warlords_book',           themebook = 'Dark',           brand = 'jg_warlords' },
    { item = 'jg_shin_genesis_book',       themebook = 'Neon_Cyan',      brand = 'jg_shin_genesis' },
    { item = 'jg_void_ether_book',         themebook = 'Forest_Green',   brand = 'jg_void_ether' },
    { item = 'jg_sands_of_eternity_book',  themebook = 'Gold_Black',     brand = 'jg_sands_of_eternity' },
    { item = 'ammunation_elite_book',      themebook = 'Crimson_Black',  brand = 'ammunation_elite' },
    { item = 'full_throttle_book',         themebook = 'Glacier_Blue',   brand = 'full_throttle' },
    { item = 'ls_legends_book',            themebook = 'Emerald_Stone',  brand = 'ls_legends' },
    { item = 'ls_landmark_book',           themebook = 'Steel_Grey',     brand = 'ls_landmark' },
}

-- Grading case image configuration (supports local filenames or full web URLs)
Config.GradingCase = {
    case_pack = 'jim_g_trading_cards_grading_pack.webp',
    case_label = 'jim_g_trading_cards_grading_pack_label.webp',
    case_texture = 'jim_g_trading_cards_grading_pack_t.webp' 
}

-- cvg labels skins
Config.CVGLabelSkins = {
    star_galaxy = { 
        name = 'Star Galaxy', 
        item = 'cvg_label_star_galaxy',
        labelImage = 'cvg_label_star_galaxy.webp',
        textColor = '#eede00ff',
        outlineColor = '#21002eff'
    },
    color_shift = { 
        name = 'Color Shift', 
        item = 'cvg_label_color_shift',
        labelImage = 'cvg_label_color_shift.webp',
        textColor = '#00c7ceff',
        outlineColor = '#110b5eff'
    },
    p_and_b_mix = { 
        name = 'P & B Mix', 
        item = 'cvg_label_p_and_b_mix',
        labelImage = 'cvg_label_p_and_b_mix.webp',
        textColor = '#ee00baff',
        outlineColor = '#053058ff'
    },
    mellow_sky = { 
        name = 'Mellow Sky', 
        item = 'cvg_label_mellow_sky',
        labelImage = 'cvg_label_mellow_sky.webp',
        textColor = '#ee0000ff',
        outlineColor = '#32af01ff'
    },
    aetheric_sigil = {
        name = 'Aetheric Sigil',
        item = 'cvg_label_aetheric_sigil',
        labelImage = 'cvg_label_aetheric_sigil.webp',
        textColor = '#ffd36aff',
        outlineColor = '#24002fff'
    },
    arcane_circle = {
        name = 'Arcane Circle',
        item = 'cvg_label_arcane_circle',
        labelImage = 'cvg_label_arcane_circle.webp',
        textColor = '#e8fff7ff',
        outlineColor = '#1b0a3bff'
    },
    astral_dragon = {
        name = 'Astral Dragon',
        item = 'cvg_label_astral_dragon',
        labelImage = 'cvg_label_astral_dragon.webp',
        textColor = '#e6f7ffff',
        outlineColor = '#0b1a36ff'
    },
    celestial_gear = {
        name = 'Celestial Gear',
        item = 'cvg_label_celestial_gear',
        labelImage = 'cvg_label_celestial_gear.webp',
        textColor = '#0c1f3dff',
        outlineColor = '#fff1c2ff'
    },
    cosmic_phoenix = {
        name = 'Cosmic Phoenix',
        item = 'cvg_label_cosmic_phoenix',
        labelImage = 'cvg_label_cosmic_phoenix.webp',
        textColor = '#bff4ffff',
        outlineColor = '#2a003cff'
    },
    elemental_fusion = {
        name = 'Elemental Fusion',
        item = 'cvg_label_elemental_fusion',
        labelImage = 'cvg_label_elemental_fusion.webp',
        textColor = '#d3fbffff',
        outlineColor = '#0a1030ff'
    },
    glacial_inferno = {
        name = 'Glacial Inferno',
        item = 'cvg_label_glacial_inferno',
        labelImage = 'cvg_label_glacial_inferno.webp',
        textColor = '#fff2d1ff',
        outlineColor = '#1b1b1fff'
    },
    golden_valley = {
        name = 'Golden Valley',
        item = 'cvg_label_golden_valley',
        labelImage = 'cvg_label_golden_valley.webp',
        textColor = '#2a1a0fff',
        outlineColor = '#fff3c7ff'
    },
    katana_street = {
        name = 'Katana Street',
        item = 'cvg_label_katana_street',
        labelImage = 'cvg_label_katana_street.webp',
        textColor = '#f2f7ffff',
        outlineColor = '#030612ff'
    },
    mecha_hangar = {
        name = 'Mecha Hangar',
        item = 'cvg_label_mecha_hangar',
        labelImage = 'cvg_label_mecha_hangar.webp',
        textColor = '#d7f6ffff',
        outlineColor = '#08131cff'
    },
    nebula_drift = {
        name = 'Nebula Drift',
        item = 'cvg_label_nebula_drift',
        labelImage = 'cvg_label_nebula_drift.webp',
        textColor = '#e8fff7ff',
        outlineColor = '#0a1f2aff'
    },
    nebula_fox = {
        name = 'Nebula Fox',
        item = 'cvg_label_nebula_fox',
        labelImage = 'cvg_label_nebula_fox.webp',
        textColor = '#e6f7ffff',
        outlineColor = '#0b1a36ff'
    },
    sage_alignment = {
        name = 'Sage Alignment',
        item = 'cvg_label_sage_alignment',
        labelImage = 'cvg_label_sage_alignment.webp',
        textColor = '#ffe28aff',
        outlineColor = '#0b2f24ff'
    },
    solaris_runes = {
        name = 'Solaris Runes',
        item = 'cvg_label_solaris_runes',
        labelImage = 'cvg_label_solaris_runes.webp',
        textColor = '#ffe46bff',
        outlineColor = '#071a2dff'
    },
    winter_shrine = {
        name = 'Winter Shrine',
        item = 'cvg_label_winter_shrine',
        labelImage = 'cvg_label_winter_shrine.webp',
        textColor = '#f9fbffff',
        outlineColor = '#14284bff'
    }
}
-- CVG case splitter
Config.CVGCaseSplitter = {
    consumeOnUse = true
}
-- Rarity colors
Config.RarityColors = {
    ['Normal'] = '#9ca3af',
    ['Uncommon'] = '#22c55e',
    ['Rare'] = '#3b82f6',
    ['Epic'] = '#a855f7',
    ['Legendary'] = '#ffd700',
    ['Holo'] = '#60a5fa',
    ['OriginalArt'] = '#232527ff'
}
-- High rarity cards
Config.HighRarity = {
    ['Normal'] = false,
    ['Uncommon'] = false,
    ['Rare'] = true,
    ['Epic'] = true,
    ['Legendary'] = true,
    ['Holo'] = true,
    ['OriginalArt'] = true,
}

Config.EffectsEnabled = true
