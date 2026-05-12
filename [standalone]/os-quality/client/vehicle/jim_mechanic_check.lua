local function rgbToHex(r, g, b)
    r = math.floor(tonumber(r) or 255)
    g = math.floor(tonumber(g) or 255)
    b = math.floor(tonumber(b) or 255)
    local function hx(x)
        local h = string.format("%02x", math.max(0, math.min(255, x)))
        return h
    end
    return hx(r) .. hx(g) .. hx(b)
end

local function getNearestVehicle(origin, maxDist)
    maxDist = maxDist or 3.0
    local vehs = GetGamePool("CVehicle")
    local closest, cdist = nil, maxDist + 0.001
    for i = 1, #vehs do
        local v = vehs[i]
        if DoesEntityExist(v) then
            local d = #(origin - GetEntityCoords(v))
            if d < cdist then
                closest, cdist = v, d
            end
        end
    end
    return closest, cdist
end

local function safeHarnessLabel(vehicle)
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then return nil end

    local installed = Entity(vehicle).state.harnessInstalled

    if not installed then
        return nil
    end

    return "Harness: Racing Harness"
end

local function getVehDisplayName(vehicle)
    local model = GetEntityModel(vehicle)
    -- Try proper label
    local lbl = GetLabelText(GetDisplayNameFromVehicleModel(model))
    if lbl and lbl ~= "NULL" and lbl ~= "" then
        return lbl
    end
    -- Fallback to model name
    return tostring(model)
end

RegisterNetEvent('jim-mechanic:client:Menu', function(editable)
    local ped = PlayerPedId()
    if not DoesEntityExist(ped) then return end

    -- If not in a vehicle, find nearest within 3.0
    local vehicle
    if not IsPedInAnyVehicle(ped, false) then
        local coords = GetEntityCoords(ped)
        vehicle = select(1, getNearestVehicle(coords, 3.0))
    else
        vehicle = GetVehiclePedIsIn(ped, false)
    end

    if not vehicle or not DoesEntityExist(vehicle) then return end

    -- Build data table
    local CheckTable = {
        [1]  = { lock = true,  part = "nos",          head = "Nitrous: Not Installed",              hide = true },
        [2]  = { lock = true,  part = "engine",       desc = ("Stock: [LVL 0 / %d]"):format(GetNumVehicleMods(vehicle, 11)), head = "Engines:" },
        [3]  = { lock = true,  part = "brakes",       desc = ("Stock: [LVL 0 / %d]"):format(GetNumVehicleMods(vehicle, 12)), head = "Brakes:" },
        [4]  = { lock = true,  part = "suspension",   desc = ("Stock: [LVL 0 / %d]"):format(GetNumVehicleMods(vehicle, 15)), head = "Suspension:" },
        [5]  = { lock = true,  part = "transmission", desc = ("Stock: [LVL 0 / %d]"):format(GetNumVehicleMods(vehicle, 13)), head = "Transmission:" },
        [6]  = { lock = true,  part = "car_armor",    head = "Armor: Stock" },
        [7]  = { lock = true,  part = "turbo",        head = "Turbo: Not Installed" },
        [8]  = { lock = true,  part = "headlights",   head = "Xenon: Not Installed" },
        [9]  = { lock = true,  part = "drifttires",   head = "Drift Tyres: Not Installed",          hide = true },
        [10] = { lock = true,  part = "bprooftires",  head = "Bulletproof Tyres: Not Installed",    hide = true },
        [11] = { lock = true,  part = "antilag",      head = "Antilag: Not Installed",              hide = true },
        [12] = { lock = true,  part = "harness",      head = "Harness: Not Installed",              hide = true },
        [13] = { lock = true,  part = "manual",       head = "Manual: Not Installed",               hide = true },
        [14] = { lock = true,  part = "underglow",    head = "Underglow: Not Installed",            hide = true },
    }

    -- Engine
    if GetNumVehicleMods(vehicle, 11) == 0 then
        CheckTable[2].head = "Engines: ❌ Unavailable"
        CheckTable[2].desc = nil
    end
    if GetVehicleMod(vehicle, 11) ~= -1 then
        local lvl = GetVehicleMod(vehicle, 11) + 1
        CheckTable[2].lock = false
        CheckTable[2].desc = ("Installed: [LVL %d / %d]"):format(lvl, GetNumVehicleMods(vehicle, 11))
    end

    -- Brakes
    if GetNumVehicleMods(vehicle, 12) == 0 then
        CheckTable[3].head = "Brakes: ❌ Unavailable"
        CheckTable[3].desc = nil
    end
    if GetVehicleMod(vehicle, 12) ~= -1 then
        local lvl = GetVehicleMod(vehicle, 12) + 1
        CheckTable[3].lock = false
        CheckTable[3].desc = ("Installed: [LVL %d / %d]"):format(lvl, GetNumVehicleMods(vehicle, 12))
    end

    -- Suspension
    if GetNumVehicleMods(vehicle, 15) == 0 then
        CheckTable[4].head = "Suspension: ❌ Unavailable"
        CheckTable[4].desc = nil
    end
    if GetVehicleMod(vehicle, 15) ~= -1 then
        local lvl = GetVehicleMod(vehicle, 15) + 1
        CheckTable[4].lock = false
        CheckTable[4].desc = ("Installed: [LVL %d / %d]"):format(lvl, GetNumVehicleMods(vehicle, 15))
    end

    -- Transmission
    if GetNumVehicleMods(vehicle, 13) == 0 then
        CheckTable[5].head = "Transmission: ❌ Unavailable"
        CheckTable[5].desc = nil
    end
    if GetVehicleMod(vehicle, 13) ~= -1 then
        local lvl = GetVehicleMod(vehicle, 13) + 1
        CheckTable[5].lock = false
        CheckTable[5].desc = ("Installed: [LVL %d / %d]"):format(lvl, GetNumVehicleMods(vehicle, 13))
    end

    -- Armor (index 16)
    if GetNumVehicleMods(vehicle, 16) == 0 then
        CheckTable[6].head = "Armor: ❌ Unavailable"
        CheckTable[6].desc = nil
    else
        -- If the installed armor mod equals the max level index, treat as installed
        if (GetVehicleMod(vehicle, 16) + 1) == GetNumVehicleMods(vehicle, 16) then
            CheckTable[6].lock = false
            CheckTable[6].head = "Armor:"
            CheckTable[6].desc = "Installed"
        end
    end

    -- Turbo (toggle mod 18)
    if IsToggleModOn(vehicle, 18) then
        CheckTable[7].lock = false
        CheckTable[7].head = "Turbo:"
        CheckTable[7].desc = "Installed"
    elseif GetNumVehicleMods(vehicle, 11) == 0 then
        CheckTable[7].head = "Turbo:"
        CheckTable[7].desc = "❌ Unavailable"
    end

    -- Xenons (toggle mod 22)
    do
        local custom, r, g, b = GetVehicleXenonLightsCustomColor(vehicle)
        if IsToggleModOn(vehicle, 22) then
            CheckTable[8].lock = false
            CheckTable[8].head = "Xenon:"
            if custom then
                CheckTable[8].desc = ("<span style='color:#%s; text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000'>⯀</span> R:%d G:%d B:%d")
                    :format(rgbToHex(r, g, b):upper(), r, g, b)
            else
                CheckTable[8].desc = "Installed"
            end
        elseif GetNumVehicleMods(vehicle, 11) == 0 then
            CheckTable[8].head = "Xenon:"
            CheckTable[8].desc = "❌ Unavailable"
        end
    end

    -- Harness (optional, not on bicycles)
    if not IsThisModelABicycle(GetEntityModel(vehicle)) then
        local harness = safeHarnessLabel(vehicle)
        if harness then
            CheckTable[12].head = "Harness:"
            CheckTable[12].desc = harness:gsub("^Harness:%s*", "")
            CheckTable[12].lock = false
            CheckTable[12].hide = false
        end
    end

    -- Build ox_lib context options
    local vehName  = getVehDisplayName(vehicle)
    local plate    = GetVehicleNumberPlateText(vehicle) or "UNKNOWN"

    local options = {}
    -- Header (disabled item)
    options[#options+1] = {
        title = ("%s"):format(vehName),
        description = ("Plate: [%s]"):format(plate),
        icon = "car",
        disabled = true
    }

    for _, v in ipairs(CheckTable) do
        if not (v.hide and v.lock) then
            local opt = {
                title = v.head or "Unnamed",
                description = v.desc or "",
                -- icon = v.icon or nil, -- you can map icons if you like
            }
            if not v.lock and editable then
                -- Enable selection to remove part
                opt.event = "jim-mechanic:client:Menu:Remove"
                opt.args  = { vehicle = VehToNet(vehicle), mod = v.part, extra = false }
                -- Note: pass NetID so it works even if the entity handle changes on client
            else
                -- Show as information-only
                opt.disabled = true
            end
            options[#options+1] = opt
        end
    end

    -- Register + show ox_lib context
    local ctxId = "jim_mechanic_check_" .. tostring(GetGameTimer())
    lib.registerContext({
        id = ctxId,
        title = "Mechanic Check",
        options = options
    })
    lib.showContext(ctxId)
end)
