Config = {}

Config.Currency = {
    mode  = 'crypto',   -- 'cash', 'item', or 'crypto'

    item  = { name = 'marked_bills', label = 'Marked Bills' }, -- if mode = 'item'

    money = 'cash',     -- if mode = 'cash'  ('cash' or 'bank')

    crypto = 'crypto'   -- if mode = 'crypto' (QB/QBX default wallet)
}

Config.imageBaseUrl = 'https://44417-cdn.fivemsvr.com/img/'  -- change this to your inventory image path

Config.Items = {
    { name = 'WEAPON_BLOWUP_HAMMER', label = 'Blow Up Hammer', price = 250, model = 'WEAPON_BLOWUP_HAMMER',
        image = Config.imageBaseUrl .. 'WEAPON_BLOWUP_HAMMER.png',
        z = { base = 0.58, depth = 0.18, amp = 0.06, freq = 0.5 }, type = 'weapon' },

    { name = 'WEAPON_POOLNOODLE', label = 'Pool Noodle', price = 100, model = 'WEAPON_POOLNOODLE',
        image = Config.imageBaseUrl .. 'WEAPON_POOLNOODLE.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_VALCLEVER', label = 'Heart Cleaver', price = 100, model = 'weapon_valclever',
        image = Config.imageBaseUrl .. 'WEAPON_VALCLEVER.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_GLOW_BAT', label = 'Glow Bat', price = 100, model = 'WEAPON_GLOW_BAT',
        image = Config.imageBaseUrl .. 'WEAPON_GLOW_BAT.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_SLEDGEHAMMER', label = 'Sledge Hammer', price = 100, model = 'w_me_sledgehammer',
        image = Config.imageBaseUrl .. 'WEAPON_SLEDGEHAMMER.png',
        z = { base = 0.84, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_KATANA4', label = 'Katana', price = 100, model = 'w_me_katana4',
        image = Config.imageBaseUrl .. 'WEAPON_KATANA4.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_KARAMBIT', label = 'Karambit', price = 100, model = 'w_me_karambit',
        image = Config.imageBaseUrl .. 'WEAPON_KARAMBIT.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_SHIV', label = 'Prison Shiv', price = 100, model = 'w_me_shiv',
        image = Config.imageBaseUrl .. 'WEAPON_SHIV.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_PT17', label = 'Yellow Titan 17', price = 100, model = 'w_pi_kyrospt17',
        image = Config.imageBaseUrl .. 'WEAPON_PT17.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_X17', label = 'x17', price = 100, model = 'markomods-x17',
        image = Config.imageBaseUrl .. 'WEAPON_X17.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'WEAPON_X19', label = 'x19', price = 100, model = 'markomods-x19',
        image = Config.imageBaseUrl .. 'WEAPON_X19.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    { name = 'suppressor', label = 'Suppressor', price = 100, model = 'w_at_pi_supp_2',
        image = Config.imageBaseUrl .. 'suppressor.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weapon' },

    -- { name = 'fakeplate', label = 'Fake Plate', price = 100, model = 'p_num_plate_02',
    --     image = Config.imageBaseUrl .. 'fakeplate.png',
    --     z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'item' },

    { name = 'head_bag', label = 'Head Bag', price = 100, model = 'prop_money_bag_01',
        image = Config.imageBaseUrl .. 'head_bag.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'item' },

    { name = 'passcodeinjector', label = 'Passcode Injector', price = 100, model = 'w_am_digiscanner',
        image = Config.imageBaseUrl .. 'passcodeinjector.png',
        z = { base = 0.54, depth = 0.14, amp = 0.05, freq = 0.55 }, type = 'weaitempon' },

    { name = 'ls_vehicle_finder', label = 'Vehicle Finder', price = 60, model = 'w_am_digiscanner_reh',
        image = Config.imageBaseUrl .. 'ls_vehicle_finder.png',
        z = { base = 0.56, depth = 0.16, amp = 0.04, freq = 0.6 } , type = 'item'  },
    { name = 'tunerchip', label = 'Tuner Chip', price = 300, model = 'w_am_digiscanner_reh',
        image = Config.imageBaseUrl .. 'tunerchip.png',
        z = { base = 0.56, depth = 0.16, amp = 0.04, freq = 0.6 } , type = 'item'  },
}



Config.VanModel = 'speedo4'
Config.PedModel = 's_m_m_highsec_01'
Config.InteractDistance = 4.5

Config.Interaction = {
    mode = 'target',                      -- 'auto' tries target first, 'target' forces target, 'textui' uses TextUI
    targetSystem = 'ox_target',              -- choose 'auto', 'ox_target', or 'qb-target'
    label = 'Access Black Market',      -- interaction label shown in target menus
    icon = 'fa-solid fa-gun',           -- icon shown in target menus 
    bones = { 'boot', 'bodyshell', 'seat_dside_r', 'seat_pside_r' } -- bones on the vehicle used for target zones
}

Config.SpawnLocations = {
    { coords = vec3(-924.0724, -1299.0457, 5.0189), heading = 240.9548 }, -- Sundays
    { coords = vec3(2913.4580, 4632.6631, 48.4541), heading = 96.5029 }, -- Monday
    { coords = vec3(-251.7018, 6065.6855, 31.6617), heading = 41.6270 }, -- Tuesday
    { coords = vec3(2616.0061, 3264.9238, 55.2123), heading = 108.8854 }, -- Wednesday
    { coords = vec3(-836.0733, -401.3338, 31.3253), heading = 161.6583 }, -- Thursday
    { coords = vec3(1200.9861, -3118.9578, 5.5403), heading = 130.5356 }, -- Friday
    { coords = vec3(-1292.4545, 268.0221, 64.0725), heading = 327.3238 }, -- Saturday
}

Config.UnlockDuringSeat = true
Config.OpenRearDoorForSeat = true   -- Opens rear door before entering (if model supports it)
Config.RearDoorIndex = 2            -- 2 = Back Left, 3 = Back Right
Config.SeatTimeoutMs = 5000         -- Seat timeout in milliseconds
Config.CrateModel = 'xm3_prop_xm3_crate_ammo_01a'  -- Crate model

Config.CrateOffset = vec3(0.02, -1.7, -0.15)  -- Crate offset from vehicle (adjust if needed for your model)



-- Configuration for attaching the ped to the back of the vehicle
Config.PedBackAttach = {
    boneName = nil,           -- Use a specific bone name (e.g., "bodyshell" or "boot") if supported by your vehicle model. Set to nil to use the vehicle root.
    offset   = vec3(-0.65, -1.90, 0.36), -- Offset from the attachment point: X = left/right, Y = forward/backward (negative = backward), Z = height.
    rot      = vec3(0.0, 0.0, -145.0),   -- Rotation in degrees: RZ = -145 to face the rear of the vehicle.
}


-- Ped sitting animation configuration (you can change the dict/name)
Config.PedSitAnim = {
    dict = "anim@amb@beach_party@",                -- Animation dictionary
    name = "seated_smoke_weed_male_a_idle_c",      -- Animation name
    flag = 1,                                      -- Loop + stay in place
}



Config.Cam = {
    enabled       = true,
    startFrom     = 'player',                 -- 'player' or 'van' (camera starts near player or van)
    startOffset   = vec3(0.0, -1.6, 0.9),     -- Camera start offset near player (optional)
    startOffsetVan= vec3(1.2, 1.2, 1.2),      -- Camera start offset if startFrom='van'
    endOffset     = vec3(0.05, -3.1, 0.55),   -- Main offset: in front of van, close to crate height
    focusZ        = 0.7,                      -- Focus point above crate before weapon appears
    fov           = 78.0,                     -- Camera field of view
    interpIn      = 350,                      -- Camera interpolation time (ms) when entering
    interpOut     = 300,                      -- Camera interpolation time (ms) when exiting
}
