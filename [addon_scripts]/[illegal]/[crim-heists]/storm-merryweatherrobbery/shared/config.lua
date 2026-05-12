Config = Config or {}

Config.TestingMode = false

Config.Peds = {
    {coords = vector4(483.63641357422, -3118.8972167969, 25.580160140991, 264.90209960938),  weapon = "WEAPON_MG",           ped = "s_m_m_marine_01"},
    {coords = vector4(484.31210327148, -3123.3679199219, 25.580160140991, 273.97216796875),  weapon = "WEAPON_ASSAULTSMG",   ped = "s_m_y_marine_01"},
    {coords = vector4(486.75424194336, -3121.2099609375, 25.580160140991, 279.30111694336),  weapon = "WEAPON_ASSAULTSMG",   ped = "s_m_y_marine_01"},
    {coords = vector4(489.95709228516, -3124.0725097656, 25.613681793213, 281.54034423828),  weapon = "WEAPON_ASSAULTSMG",   ped = "s_m_y_marine_01"},
    {coords = vector4(491.2900390625, -3126.5510253906, 25.613859176636, 292.91467285156),   weapon = "WEAPON_CARBINERIFLE", ped = "s_m_y_marine_01"},
    {coords = vector4(495.74331665039, -3126.5922851563, 25.580173492432, 302.74606323242),  weapon = "WEAPON_CARBINERIFLE", ped = "s_m_y_marine_01"},
    {coords = vector4(497.22445678711, -3118.3193359375, 25.580171585083, 274.07901000977),  weapon = "WEAPON_CARBINERIFLE", ped = "s_m_y_marine_03"},
    {coords = vector4(492.66125488281, -3133.7507324219, 25.580131530762, 348.78900146484),  weapon = "WEAPON_CARBINERIFLE", ped = "s_m_y_marine_03"},
    {coords = vector4(497.36529541016, -3134.3833007813, 25.580171585083, 16.800424575806),  weapon = "WEAPON_PUMPSHOTGUN",  ped = "s_m_y_marine_03"},
    {coords = vector4(486.00720214844, -3130.34765625, 25.580141067505, 294.02593994141),    weapon = "WEAPON_PUMPSHOTGUN",  ped = "s_m_y_marine_03"},
    {coords = vector4(489.01806640625, -3132.5913085938, 25.580165863037, 301.74487304688),  weapon = "WEAPON_PUMPSHOTGUN",  ped = "s_m_y_marine_03"},
    {coords = vector4(476.11993408203, -3137.171875, 25.600769042969, 307.87930297852),      weapon = "WEAPON_PUMPSHOTGUN",  ped = "s_m_y_marine_03"},
    {coords = vector4(509.05795288086, -3122.5158691406, 25.580160140991, 356.55575561523),  weapon = "WEAPON_PUMPSHOTGUN",  ped = "s_m_y_marine_03"},
}

Config.PedSearch = {
    Cash = {
        enabled = true,
        min = 100,
        max = 250,
    },

    LootPool = {
        -- all chance has to = 100. (item 1 = 30%, item 2 must = 70%, etc)
        { item = 'pistol_ammo',     min = 20, max = 30, chance = 15 },
        { item = 'smg_ammo',        min = 10, max = 15, chance = 10 },
        { item = 'rifle_ammo',      min =  5, max = 10, chance = 10 },
        { item = 'shotgun_ammo',    min =  7, max = 12, chance = 10 },
        { item = 'armor',           min =  2, max =  3, chance = 15 },
        { item = 'heavyarmor',      min =  1, max =  1, chance = 10 },
        { item = 'ifaks',           min =  1, max =  1, chance = 15 },
        { item = 'afaks',           min =  1, max =  1, chance = 13 },
        { item = 'weapon_x19',      min =  1, max =  1, chance = 2 },
    },

    MaxLootDrops = 2, -- how many loot entries can succeed per search
}

Config.PedVariables = {
    accuracy = 30,
    health = 200,
    armour = 100,
}

Config.Coords = {
    firstPower      = vector4(458.66, -3186.13, 6.98, 270.93),
    secondPower     = vector4(458.64, -3229.92, 6.71, 270.93),
    firstSwipe      = vector4(551.92, -3118.84, 18.31, 270.61),
    firstLaptop     = vector4(569.48, -3127.27, 18.68, 180.5),
    printer         = vector4(563.83, -3120.42, 18.45, 359.80),
    thirdPower      = vector4(554.20, -3116.30, 19.35, 359.80),
    firstComputer   = vector4(497.10, -3136.77, 25.84, 94.21),
    secondComputer  = vector4(494.76, -3137.01, 25.73, 271.85),
    employeeSwipe   = vector4(510.81, -3119.51, 26.46, 269.56),
    finalComputer   = vector4(470.49, -3118.92, 25.77, 359.22)
} 

Config.Doors = {
    firstSwipeDoorLeft = {
        coords = vec3(552.25, -3117.25, 18.92),
        model = 1388116908
    },
    firstSwipeDoorRight = {
        coords = vec3(585.97, -3117.25, 18.92),
        model = 1388116908
    },
    mainDoor = {
        coords = vec3(511.0, -3117.54, 25.84),
        model = -840574428
    },
    secretDoorLeft = {
        coords = vec3(475.85, -3125.59, 25.94),
        model = 1237165570
    },
    secretDoorRight = {
        coords = vec3(474.61, -3125.59, 25.92),
        model = 1237165570
    },
}

Config.Variables = {
    copCount = 8,
    FinalComputerTries = 3,
    LockdownDelay = 5, -- minutes until the building locks
    HeistCooldown = 120 -- minutes after finishedHeist before the robbery can start again
}

Config.Backup = {
    cars = {
        {coords = vector4(459.55, -2979.02, 6.04, 183.17), pedModel = 'csb_mweather', weapon = 'weapon_carbinerifle'},
        {coords = vector4(450.90, -2980.72, 6.03, 188.13), pedModel = 'csb_mweather', weapon = 'weapon_carbinerifle'},
        {coords = vector4(455.93, -2995.67, 6.04, 185.50), pedModel = 'csb_mweather', weapon = 'weapon_carbinerifle'}
    },
    destination = vector3(479.37, -3101.51, 6.07)
}

Config.RequiredItems = {
    explosive = 'explosive',
    keycard = 'redkeycard',
    employeecard = 'merryweathercard',
    usbdrive = 'maliciousflashdrive',
    hackdevice = 'passcodeinjector',
    grinder = 'cutter',
    manifest = 'merryweathershippingmanifest'
}

Config.Names = {
    'Steven Gomez', 
    'Hank Schrader',
    'Gustavo Fring',
    'Mike Ehrmantraut',
    'Jesse Pinkman',
    'Walter White',
    'Saul Goodman',
}

Config.Drops = {
    {coords = vector4(901.9609375, -3086.8400878906, 5.9007625579834, 89.876968383789),
    target = vector4(899.8499, -3086.8210, 5.9008, 269.9523)}, -- Good

    {coords = vector4(983.89514160156, -2871.453125, 19.019771575928, 268.66806030273),
    target = vector4(986.0547, -2871.5515, 19.0129, 89.9615)}, -- Good
    -- {coords = vector4(1070.4331054688, -2870.9885253906, 19.00562286377, 271.74038696289), target = vector4(1068.7510986328, -2871.0478515625, 19.219234466553, 270.67022705078)}, -- Good
}

-- Container Loot
Config.Loot = {
    MarkedMoney = {
        enabled = true,
        item = 'markedbills',
        min = 400000,
        max = 500000
    },

    MinLootDrops = 2,
    MaxLootDrops = 3,

    LootPool = {
        -- all chance has to = 100. (item 1 = 30%, item 2 must = 70%, etc)
        { item = 'WEAPON_ARCTIC516',            min = 1, max = 1, chance = 3 },
        { item = 'WEAPON_MICROSMG',             min = 1, max = 1, chance = 3 },
        { item = 'WEAPON_PUMPSHOTGUN',          min = 1, max = 1, chance = 3 },
        { item = 'rifleblueprint',              min = 1, max = 1, chance = 4 },
        { item = 'smgblueprint',                min = 1, max = 1, chance = 5 },
        { item = 'shotgunblueprint',            min = 1, max = 1, chance = 6 },
        { item = 'riflebody',                   min = 1, max = 1, chance = 5 },
        { item = 'riflebarrel',                 min = 1, max = 1, chance = 5 },
        { item = 'riflegrip',                   min = 1, max = 1, chance = 5 },
        { item = 'riflemagazine',               min = 1, max = 1, chance = 5 },
        { item = 'riflestock',                  min = 1, max = 1, chance = 5 },
        { item = 'smgbody',                     min = 1, max = 1, chance = 6 },
        { item = 'smgbarrel',                   min = 1, max = 1, chance = 6 },
        { item = 'smggrip',                     min = 1, max = 1, chance = 6 },
        { item = 'shotgunbody',                 min = 1, max = 1, chance = 6 },
        { item = 'shotgunbarrel',               min = 1, max = 1, chance = 6 },
        { item = 'heavyarmor',                  min = 5, max = 8, chance = 5 },
        { item = 'heistmysterybox',             min = 1, max = 3, chance = 7 },
        { item = 'partsmysterybox',             min = 1, max = 3, chance = 8 },
        { item = 'uhc',                         min = 1, max = 1, chance = 1 },
        --{ item = '',                   min = , max = , chance = },
    }
}