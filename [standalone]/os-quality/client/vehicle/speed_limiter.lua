local Config = {
    Units = 'mph', -- 'mph' or 'kph'

    TickMs = 500,

    -- Only enforce when the local player is the driver.
    DriverOnly = true,

    RestoreOnExit = true,

    -- Vehicle class speed limits (GetVehicleClass -> 0-21)
    -- Set a class to nil to not cap it.
    LimitsByClass = {
        [0]  = 130, -- Compacts
        [1]  = 135, -- Sedans
        [2]  = 145, -- SUVs
        [3]  = 135, -- Coupes
        [4]  = 145, -- Muscle
        [5]  = 140, -- Sports Classics
        [6]  = 145, -- Sports
        [7]  = 160, -- Super
        [8]  = 150, -- Motorcycles
        [9]  = 135, -- Off-Road
        [10] = 120,  -- Industrial
        [11] = 120, -- Utility
        [12] = 120, -- Vans
        [13] = 50,  -- Cycles (bicycles)
        [14] = 160,  -- Boats
        [15] = nil, -- Helicopters
        [16] = nil, -- Planes
        [17] = 120, -- Service (taxis, buses, etc.)
        [18] = 160, -- Emergency (police/ems/fire)
        [19] = 120, -- Military
        [20] = 120, -- Commercial (trucks, semis)
        [21] = nil,  -- Trains
    },

    TireCaps = {
        onePopped = 100, -- 1 tire burst
        twoPlus   = 80,  -- 2+ tires burst
    },
}

------------------------------------------------------------
-- Helpers
------------------------------------------------------------

local function toMetersPerSecond(value)
    if not value then return nil end
    if Config.Units == 'kph' then
        return value / 3.6
    end
    -- mph
    return value / 2.236936
end

local function minCap(a, b)
    if a == nil then return b end
    if b == nil then return a end
    return (a < b) and a or b
end

local WheelIndicesToCheck = { 0, 1, 2, 3, 4, 5, 45, 47 }

local function getPoppedTireCount(veh)
    local popped = 0
    for i = 1, #WheelIndicesToCheck do
        if IsVehicleTyreBurst(veh, WheelIndicesToCheck[i], false) then
            popped = popped + 1
            if popped >= 2 then
                return popped
            end
        end
    end
    return popped
end

local function getCapForVehicle(veh)
    local class = GetVehicleClass(veh)

    -- Base cap: by class
    local classLimit = Config.LimitsByClass[class]
    local classCap = toMetersPerSecond(classLimit)

    -- Tire override cap
    local popped = getPoppedTireCount(veh)
    local tireCap

    if popped >= 2 then
        tireCap = toMetersPerSecond(Config.TireCaps.twoPlus)
    elseif popped == 1 then
        tireCap = toMetersPerSecond(Config.TireCaps.onePopped)
    end

    -- Final cap is the most restrictive (lowest) cap
    return minCap(classCap, tireCap), class, popped
end

local function applyCap(veh, cap)
    if cap then
        -- cap is in m/s
        SetVehicleMaxSpeed(veh, cap)
        return
    end

    -- Reset to vehicle handling top speed (more correct than a random high number)
    local handlingTop = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel')
    if handlingTop and handlingTop > 0.0 then
        SetVehicleMaxSpeed(veh, handlingTop)
    else
        -- Fallback "uncap"
        SetVehicleMaxSpeed(veh, 999.0)
    end
end

local function shouldEnforce(ped, veh)
    if veh == 0 then return false end
    if Config.DriverOnly and GetPedInVehicleSeat(veh, -1) ~= ped then
        return false
    end
    return true
end

------------------------------------------------------------
-- State + loop (optimized)
------------------------------------------------------------

local state = {
    active = false,
    veh = 0,
    class = -1,
    popped = 0,
    cap = nil, -- m/s
}

local function stopEnforcing()
    if state.active and Config.RestoreOnExit and state.veh ~= 0 then
        applyCap(state.veh, nil)
    end
    state.active = false
    state.veh = 0
    state.class = -1
    state.popped = 0
    state.cap = nil
end

local function refresh(ped)
    local veh = GetVehiclePedIsIn(ped, false)

    if veh == 0 then
        stopEnforcing()
        return
    end

    if not shouldEnforce(ped, veh) then
        -- If we were enforcing on a previous vehicle, restore it
        if state.active and Config.RestoreOnExit and state.veh ~= 0 then
            applyCap(state.veh, nil)
        end
        state.active = false
        state.veh = veh
        state.class = -1
        state.popped = 0
        state.cap = nil
        return
    end

    local cap, class, popped = getCapForVehicle(veh)

    local changed = (veh ~= state.veh) or (class ~= state.class) or (popped ~= state.popped) or (cap ~= state.cap)

    state.active = true
    state.veh = veh
    state.class = class
    state.popped = popped
    state.cap = cap

    if changed then
        applyCap(veh, cap)
    end
end

CreateThread(function()
    while true do
        if not state.active then
            Wait(750)
        else
            Wait(Config.TickMs)
        end

        local ped = PlayerPedId()
        if ped ~= 0 then
            refresh(ped)

            -- Re-apply while active in case another script resets max speed
            if state.active and state.veh ~= 0 then
                applyCap(state.veh, state.cap)
            end
        end
    end
end)
