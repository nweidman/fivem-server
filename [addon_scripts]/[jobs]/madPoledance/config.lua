Config = {}

Config.language = 'en'

Config.target = 'ox' --  'qb', 'ox', 'auto'

-- default offsets for existing poles are x + 0.07, y + 0.3, z + 1.15
Config.Poles = {
   {activeNPC = false, coords = vector3(-1393.77, -611.99, 30.7)},
    {activeNPC = false, coords = vector3(-1390.80, -616.62, 30.7)},
    {activeNPC = false, coords = vector3(-1387.84, -621.15, 30.7)},
    {activeNPC = false, coords = vector3(-1391.33, -632.07, 31.3)},
    {activeNPC = false, coords = vector3(-1409.14, -606.57, 30.5)},
    {activeNPC = false, coords = vector3(-1369.99, -621.08, 30.5)},
    -- {activeNPC = false, coords = vector3(114.499, -1277.792, 21.387)},
    -- {activeNPC = false, coords = vector3(108.674, -1281.162, 21.387)},
    -- {activeNPC = false, coords = vector3(128.152, -1301.439, 21.387)},
    -- {activeNPC = false, coords = vector3(122.327, -1304.808, 21.387)},
    -- {activeNPC = true, coords = vector3(106.7449, -1313.185, 29.84712)},
    -- {activeNPC = true, coords = vector3(109.5838, -1311.546, 29.84712)},
    -- {activeNPC = true, coords = vector3(112.2671, -1309.997, 29.84712)},
    -- {activeNPC = true, coords = vector3(-2003.3077, -543.3831, 13.0584), spawnProp = true},
}


Config.Lang = {    
    ['en'] = {
        getAway = 'Send away',
        toBed = 'Go to bed',
        getDancer = 'Call dancer',
        getAmbientDancer = 'activate ambiente NPC',
        resetAmbientDancer = 'deactivate ambiente NPC',
        usePole = 'Dance',
        chooseDance = 'Which style?',
        pole1 = 'Pole 1',
        pole2 = 'Pole 2',
        pole3 = 'Pole 3',
        stage1 = 'Stage 1',
        stage2 = 'Stage 2',
        stage3 = 'Stage 3',
        stage4 = 'Stage 4',
        stage5 = 'Stage 5',
        stage6 = 'Stage 6',
    },
    ['de'] = {
        getAway = 'weg schicken',
        toBed = 'ins Bett gehen',
        getDancer = 'Tänzerin rufen',
        getAmbientDancer = 'Ambiente NPC aktivieren',
        resetAmbientDancer = 'Ambiente NPC löschen',
        usePole = 'Tanzen',
        chooseDance = 'Welchen Style?',
        pole1 = 'Stange 1',
        pole2 = 'Stange 2',
        pole3 = 'Stange 3',
        stage1 = 'Bühne 1',
        stage2 = 'Bühne 2',
        stage3 = 'Bühne 3',
        stage4 = 'Bühne 4',
        stage5 = 'Bühne 5',
        stage6 = 'Bühne 6',
    },
}



Config.Stripper = {
    --- This is only for Fiv3Devs Vanilla Unicorn
    vu_pink = {
        active = false,
        spawn = vector4(112.5999, -1286.0714, 21.3973, 21.3987),
        pole = vector3(108.674, -1281.162, 21.39),
        model = 'S_F_Y_Stripper_01',
    },
    vu_red = {
        active = false,
        spawn = vector4(115.9899, -1283.0032, 21.3973, 14.3878),
        pole = vector3(114.499, -1277.792, 21.39),
        model = 'S_F_Y_Stripper_01',
    },
    vu_purple = {
        active = false,
        spawn = vector4(124.2235, -1297.6359, 21.3973, 217.1986),
        pole = vector3(128.152, -1301.439, 21.39),
        model = 'S_F_Y_Stripper_01',
    },
    vu_blue = {
        active = false,
        spawn = vector4(120.7403, -1300.0042, 21.3973, 188.9074),
        pole = vector3(122.327, -1304.808, 21.39),
        model = 'S_F_Y_Stripper_01',
    },
}


