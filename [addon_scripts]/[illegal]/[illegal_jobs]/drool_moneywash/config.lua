Config = {}

Config.Debug = false

-- Framework Options
Config.UseTarget = true
Config.DrawText = "ox_lib" -- only supports ox_lib

Config.DirtyMoneyItem = 'markedbills'
Config.WetMoneyItem = 'wetbills'

Config.Wash_Time = .70 -- 15% Example: $1000 would take 150 seconds to wash
Config.MaxBillsAtATime = 5 --The number of bills that can be washed/dryed at a time per machine.

Config.Machines = {
    -- job/gang = "job_name" --> Can only be used by people with that job or gang
    -- job/gang = { "job1", "job2" } --> Can only be used by people with any of the listed jobs or gangs
    -- job/gang = { "job1" = minGrade1, "job2" = minGrade2 } --> Can only be used by people with the minimum grade number of any of the listed jobs or gangs
    -- job/grade = nil --> Everyone can use it
    -- spawnMachine will create a machine prop at the given location if true
    -- Setting a washRate to a percentage (0.5, 0.9, 1 for no loss, etc) will force that machine to wash at that rate regardless of the user's level.
    ['Washing Machines'] = {
        { location = vec3(-49.5671, 6460.7988, 28.0), heading = 45.03, width = 1.2, depth = 0.2, height = 2.0, distance = 4.7, gang = nil, job = nil, spawnMachine = false, washRate = nil },
        { location = vec3(-3053.2949, 632.0194, 4.0), heading = 290.01, width = 1.2, depth = 0.2, height = 2.0, distance = 4.7, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3052.6956, 630.8284, 4.0), heading = 290.01, width = 1.2, depth = 0.2, height = 2.0, distance = 4.7, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-48.7099, 6461.6895, 28.0), heading = 45.03, width = 1.2, depth = 0.2, height = 2.0, distance = 4.7, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(55.0764, -1609.8657, 25.9098), heading = 136.03, width = 1.2, depth = 0.2, height = 2.0, distance = 4.7, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(54.1495, -1609.2305, 25.7450), heading = 136.03, width = 1.2, depth = 0.2, height = 2.0, distance = 4.7, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-1792.55, 427.89, 124.69), heading = 90.45, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'hos', job = nil, spawnMachine = true, washRate=0.8 },
        { location = vec3(-1790.63, 425.00, 124.69), heading = 178.00, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'hos', job = nil, spawnMachine = true, washRate=0.8 },
        { location = vec3(-1791.25, 431.30, 124.69), heading = 1.49, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'hos', job = nil, spawnMachine = true, washRate=0.8 },
        { location = vec3(-1916.42, 2051.70, 134.98), heading = 167.45, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'blackhand', job = nil, spawnMachine = true, washRate=0.8 },
        { location = vec3(-1914.63, 2051.31, 134.98), heading = 167.45, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'blackhand', job = nil, spawnMachine = true, washRate=0.8 },
        { location = vec3(-1912.88, 2050.90, 134.98), heading = 167.45, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'blackhand', job = nil, spawnMachine = true, washRate=0.8 },
        { location = vec3(-1469.59, -27.09, 49.98), heading = 310.49, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'mcf', job = nil, spawnMachine = true, washRate=0.7 }, 
        -- { location = vec3(-1470.96, -25.46, 49.98), heading = 310.42, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'sns', job = nil, spawnMachine = true, washRate=0.7 }, --- VINEWOOD MAFIA MANSION
        -- { location = vec3(-1472.38, -23.78, 49.98), heading = 310.66, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'sns', job = nil, spawnMachine = true, washRate=0.7 }, --- VINEWOOD MAFIA MANSION

    },
    ['Dryers'] = {
        { location = vec3(-46.0863, 6451.4102, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-46.5797, 6451.9355, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-47.1056, 6452.4668, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-47.6374, 6452.8000, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-49.1665, 6454.4351, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-49.6374, 6455.0044, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-50.1862, 6455.4141, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-50.6160, 6455.8149, 31.0), heading = 135.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3063.1759, 632.8356, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3062.4868, 633.1209, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3061.6960, 633.2473, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3061.1431, 633.5004, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3059.1877, 634.2736, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3058.4618, 634.4043, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3057.7798, 634.7747, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-3057.1091, 635.0854, 7.5), heading = 20.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(64.4176, -1605.5175, 30.0692), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(63.7045, -1606.1332, 30.0688), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(63.2989, -1606.5134, 30.0688), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(62.8789, -1607.0376, 30.0688), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(61.6529, -1608.7954, 30.0690), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(61.2147, -1609.1700, 30.0690), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(60.7526, -1609.8626, 30.0688), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(60.2601, -1610.1812, 30.0688), heading = 43.0, width = 0.73, depth = 0.73, height = 2.0, distance = 8.0, gang = nil, job = nil, spawnMachine = false },
        { location = vec3(-1792.5, 428.64, 124.69), heading = 90.45, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'hos', job = nil, spawnMachine = true },
        { location = vec3(-1791.40, 425.00, 124.69), heading = 178.00, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'hos', job = nil, spawnMachine = true },
        { location = vec3(-1790.53, 431.37, 124.69), heading = 1.49, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'hos', job = nil, spawnMachine = true },
        { location = vec3(-1914.91, 2058.00, 134.98), heading = 348.00, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'blackhand', job = nil, spawnMachine = true },
        { location = vec3(-1913.02, 2057.60, 134.98), heading = 348.00, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'blackhand', job = nil, spawnMachine = true },
        { location = vec3(-1911.24, 2057.15, 134.98), heading = 348.00, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'blackhand', job = nil, spawnMachine = true },
        { location = vec3(-1469.19, -27.63, 49.98), heading = 310.49, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'mcf', job = nil, spawnMachine = true },
        -- { location = vec3(-1470.55, -26.00, 49.98), heading = 310.42, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'sns', job = nil, spawnMachine = true }, --- VINEWOOD MAFIA MANSION
        -- { location = vec3(-1471.96, -24.33, 49.98), heading = 310.66, width = 1.0, depth = 1.0, height = 1.0, distance = 3.0, gang = 'sns', job = nil, spawnMachine = true }, --- VINEWOOD MAFIA MANSION
    
    }
}

-- Set washer/dryer machine props
Config.WasherModel = `prop_washer_03`
Config.DryerModel = `v_ret_fh_dryer`

-- Money Destruction Rate
Config.MoneyDestructionRate = {
    [0] = { -- How many experience points are needed
        mdr = 50, -- How much percentage of the money that will be destroyed in the process
        level = 1, -- Self explanitory
        experience_knowledge = 2 -- How many experience points should you get per successful money laundering
    },
    [25] = {
        mdr = 49,
        level = 2,
        experience_knowledge = 2
    },
    [50] = {
        mdr = 48,
        level = 3,
        experience_knowledge = 2
    },
    [75] = {
        mdr = 47,
        level = 4,
        experience_knowledge = 2
    },
    [100] = {
        mdr = 46,
        level = 5,
        experience_knowledge = 2
    },
    [125] = {
        mdr = 45,
        level = 6,
        experience_knowledge = 2
    },
    [150] = {
        mdr = 44,
        level = 7,
        experience_knowledge = 2
    },
    [175] = {
        mdr = 43,
        level = 8,
        experience_knowledge = 1
    },
    [200] = {
        mdr = 42,
        level = 9,
        experience_knowledge = 1
    },
    [225] = {
        mdr = 41,
        level = 10,
        experience_knowledge = 1
    },
    [250] = {
        mdr = 40,
        level = 11,
        experience_knowledge = 1
    },
    [275] = {
        mdr = 39,
        level = 12,
        experience_knowledge = 1
    },
    [300] = {
        mdr = 38,
        level = 13,
        experience_knowledge = 1
    },
    [325] = {
        mdr = 37,
        level = 14,
        experience_knowledge = 1
    },
    [350] = {
        mdr = 36,
        level = 15,
        experience_knowledge = 1
    },
    [375] = {
        mdr = 35,
        level = 16,
        experience_knowledge = 1
    },
    [400] = {
        mdr = 34,
        level = 17,
        experience_knowledge = 1
    },
    [425] = {
        mdr = 33,
        level = 18,
        experience_knowledge = 1
    },
    [450] = {
        mdr = 32,
        level = 19,
        experience_knowledge = 1
    },
    [475] = {
        mdr = 31,
        level = 20,
        experience_knowledge = 1
    },
    [500] = {
        mdr = 30,
        level = 21,
        experience_knowledge = 1
    },
}
