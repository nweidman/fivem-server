-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(447.9715, -990.5087, 33.6317),
        vector3(1820.1156, 3662.6890, 34.4048),
        vector3(386.6841, -1623.4442, 34.1742),
    },
    --['sheriff'] = {
    --    vector3(1820.1156, 3662.6890, 34.4048),
    --    vector3(386.6841, -1623.4442, 34.1742),
    --},
    ['ambulance'] = {
        vector3(304.69, -570.13, 43.26),
    },
    ['doj'] = {
        vec3(-1584.15, 203.46, 58.85),
        vec3(-1642.49, 164.72, 68.36),
        vec3(-1652.95, 186.37, 68.35)
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    -- ['taxi'] = {
    --     vector3(907.24, -150.19, 74.17),
    -- },
    ['lux'] = {
        vector3(-844.5248, -260.3092, 42.9452),
    },
    ['pdm'] = {
        vector3(-1030.0135, -1359.6517, 9.4527),
    },
    ['badlands'] = {
        vector3(-233.1272, 6228.5161, 31.9986),
    },
    ['used'] = {
        vector3(1931.52, 3720.75, 32.57),
    },
    ['photo'] = {
        vector3(-2716.82, -140.96, 16.07),
    },
    ['towing'] = {
        vec3(114.49, 6631.45, 31.99),
    },
    -- ['cardshop'] = {
    --     vector3(-152.19, 217.28, 94.93),
    -- },
    -- ['eastcustoms'] = {
    --     vector3(887.0, -2099.47, 34.89),
    -- },
    -- ['lscustoms'] = {
    --     vector3(-347.5672, -130.6636, 42.0220),
    -- },
    -- ['stance'] = {
    --     vector3(-3074.0022, 455.5461, 6.9732),
    -- },
    -- ['paletotuner'] = {
    --     vector3(1693.6987, 3705.1270, 38.9916),
    -- },
    -- ['bennys'] = {
    --     vector3(-349.4065, -1334.9874, 36.2904),
    -- },
    -- ['eastside'] = {
    --     vector3(1136.2626, -785.9362, 57.6209),
    -- },
     --RESTAURANTS!
    -- ['vanilla'] = {
    --     vector3(95.36, -1293.61, 29.64),
    -- },
    ['casino'] = {
        vector3(942.0183, 63.1884, 80.9025),
    },
    -- ['catcafe'] = {
    --     vector3(-577.29, -1067.67, 26.61),
    -- },

}

Config.BossMenuZones = {
    -- ['police'] = {
    --     { coords = vector3(-1100.11, -828.91, 34.96), length = 0.35, width = 0.45, heading = 351.0, minZ = 30.58, maxZ = 30.68 },
    --     { coords = vector3(1820.1182, 3662.7529, 34.4045), length = 0.35, width = 0.45, heading = 210.0 , minZ = 30.58, maxZ = 30.68 },
    --     { coords = vector3(386.6841, -1623.4442, 34.1742), length = 0.35, width = 0.45, heading = 210.0 , minZ = 30.58, maxZ = 30.68 },
    -- },
    --['sheriff'] = {
    --    { coords = vector3(1820.1182, 3662.7529, 34.4045), length = 0.35, width = 0.45, heading = 210.0 , minZ = 30.58, maxZ = 30.68 },
    --    { coords = vector3(386.6841, -1623.4442, 34.1742), length = 0.35, width = 0.45, heading = 210.0 , minZ = 30.58, maxZ = 30.68 },
    --},
    -- ['ambulance'] = {
    --     { coords = vector3(335.0540, -593.5015, 43.2841), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    --     { coords = vector3(1720.2247, 3639.4563, 35.1408), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    --     { coords = vector3(-267.6878, 6320.5293, 32.4247), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    -- },
    -- ['realestate'] = {
    --     { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    -- },
    -- ['taxi'] = {
    --     { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    -- },
    -- ['cardealer'] = {
    --     { coords = vector3(-27.47, -1107.13, 27.27), length = 2.4, width = 1.05, heading = 340.0, minZ = 27.07, maxZ = 27.67 },
    -- },
    -- ['mechanic'] = {
    --     { coords = vector3(-339.53, -156.44, 44.59), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99 },
    -- },
}

Config.GangMenus = {
    ['hos'] = {
        vector3(-1793.55, 449.77, 128.51),
    },
    ['milk'] = {
        vector3(1393.31, 1160.16, 114.34),
    },
    ['grimz'] = {
        vector3(-662.31, -883.94, 24.51),
    },
    ['blackhand'] = {
        vector3(-1904.86, 2056.09, 140.85),
    },
    ['kage'] = {
        vector3(965.88, -1836.39, 36.54),
    },
    ['mercy'] = {
        vector3(-1816.62, -375.51, 49.39),
    },
    ['shadow'] = {
        vector3(1443.64, -1490.49, 66.66),
    },
    ['bsmc'] = {
        vector3(265.39, 6618.08, 33.19),
    },
    ['cid'] = {
        vector3(627.9, -27.51, 87.8),
    },
}
Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
