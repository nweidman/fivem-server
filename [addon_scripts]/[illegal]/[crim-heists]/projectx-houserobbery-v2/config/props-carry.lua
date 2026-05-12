Config.CarryProps = {
    ["Enable"] = false, -- Enable/Disable carrying props when robbing a house

    ["TrunkTargetOnly"] = true, -- If true, the player will need to target the trunk, this will not work with vehicles that dont have a trunk or have a trunk in the front (if false, the target will be the whole vehicle)
    ["UnlockedVehiclesOnly"] = true, -- If true, the player will need to have the vehicle unlocked to put the prop in the trunk

    ["Props"] = {
        -- ["x_coffeemaker"] = {
        --     Model = "prop_coffee_mac_02",
        --     Bone = 24817,
        --     Offset = vec3(0.02, 0.43, 0.03),
        --     Rotation = vec3(91.0, 0.0, -265.0),
        --     Animation = {dict = 'anim@heists@box_carry@', anim = 'idle'}
        -- },
        -- ["x_television"] = {
        --     Model = "prop_tv_03",
        --     Bone = 18905,
        --     Offset = vec3(0.25, 0.3, 0.4),
        --     Rotation = vec3(235.0, 95.0, 15.0),
        --     Animation = {dict = 'anim@heists@box_carry@', anim = 'idle'}
        -- },
        -- ["x_printer"] = {
        --     Model = "v_res_printer",
        --     Bone = 18905,
        --     Offset = vec3(0.3, 0.0, 0.25),
        --     Rotation = vec3(-75.0, -5.0, 35.0),
        --     Animation = {dict = 'anim@heists@box_carry@', anim = 'idle'}
        -- },
        -- ["x_microwave"] = {
        --     Model = "prop_microwave_1",
        --     Bone = 24817,
        --     Offset = vec3(-0.20, 0.43, 0.05),
        --     Rotation = vec3(91.0, 0.0, -265.0),
        --     Animation = {dict = 'anim@heists@box_carry@', anim = 'idle'}
        -- },
        -- ["x_electricguitar"] = {
        --     Model = "prop_el_guitar_01",
        --     Bone = 18905,
        --     Offset = vec3(0.15, 0.0, 0.1),
        --     Rotation = vec3(-10.0, 15.0, 190.0),
        --     Animation = {dict = 'anim@heists@box_carry@', anim = 'idle'}
        -- },
    },
}

VehicleClass = { -- ignore this, don't touch this
    COMPACTS = 0,
    SEDANS = 1,
    SUVS = 2,
    COUPES = 3,
    MUSCLE = 4,
    SPORTS_CLASSICS = 5,
    SPORTS = 6,
    SUPER = 7,
    MOTORCYCLES = 8,
    OFF_ROAD = 9,
    INDUSTRIAL = 10,
    UTILITY = 11,
    VANS = 12,
    CYCLES = 13,
    BOATS = 14,
    HELICOPTERS = 15,
    PLANES = 16,
    SERVICE = 17,
    EMERGENCY = 18,
    MILITARY = 19,
    COMMERCIAL = 20,
    TRAINS = 21,
    OPEN_WHEEL = 22,
}

Config.AllowedVehicleClasses = { -- Which vehicle classes are allowed to put the carried prop into
    [VehicleClass.COMPACTS]        = true,
    [VehicleClass.SEDANS]          = true,
    [VehicleClass.SUVS]            = true,
    [VehicleClass.COUPES]          = true,
    [VehicleClass.MUSCLE]          = true,
    [VehicleClass.SPORTS_CLASSICS] = true,
    [VehicleClass.SPORTS]          = true,
    [VehicleClass.SUPER]           = true,
    [VehicleClass.MOTORCYCLES]     = true,
    [VehicleClass.OFF_ROAD]        = true,
    [VehicleClass.INDUSTRIAL]      = true,
    [VehicleClass.UTILITY]         = true,
    [VehicleClass.VANS]            = true,
    [VehicleClass.CYCLES]          = false,
    [VehicleClass.BOATS]           = false,
    [VehicleClass.HELICOPTERS]     = false,
    [VehicleClass.PLANES]          = false,
    [VehicleClass.SERVICE]         = false,
    [VehicleClass.EMERGENCY]       = false,
    [VehicleClass.MILITARY]        = false,
    [VehicleClass.COMMERCIAL]      = false,
    [VehicleClass.TRAINS]          = false,
    [VehicleClass.OPEN_WHEEL]      = false,
}