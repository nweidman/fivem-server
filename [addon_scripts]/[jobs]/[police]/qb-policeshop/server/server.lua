local isActive = false

-- ============ Discord logging ============
local discord = {
    webhook = "",
    name = 'Vehicle Shop',
    image = ""
}

local function DiscordLog(_, message, color)
    local embed = {{
        color = color or 4255,
        title = "Vehicle Purchase Records",
        description = message,
        footer = { text = "" },
        thumbnail = { url = "" }
    }}
    PerformHttpRequest(discord.webhook, function() end, 'POST',
        json.encode({ username = discord.name, embeds = embed, avatar_url = discord.image }),
        { ['Content-Type'] = 'application/json' }
    )
end

-- ============ Random helpers ============
local function RandomInt(len)
    local s = {}
    for _ = 1, tonumber(len) or 1 do s[#s+1] = tostring(math.random(0, 9)) end
    return table.concat(s)
end

local function RandomStr(len)
    local s = {}
    for _ = 1, tonumber(len) or 1 do s[#s+1] = string.char(math.random(65, 90)) end -- A-Z
    return table.concat(s)
end

-- ============ Plate generators ============
local function GeneratePlate()
    local plate = ('POL%s'):format(RandomInt(5))
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GeneratePlate()
    end
    return plate:upper()
end

local function GenerateEMSPlate()
    local plate = ('EMS%s'):format(RandomInt(5))
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GenerateEMSPlate()
    end
    return plate:upper()
end

local function GenerateMCPlate()
    local plate = (RandomStr(4) .. RandomInt(4))
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GenerateMCPlate()
    end
    return plate:upper()
end

-- ============ Utils ============
local function hasGradeAccess(entry, gradeLevel)
    if not entry then return false end
    if entry.grades == nil then return true end

    if type(entry.grades) == 'number' or type(entry.grades) == 'string' then
        return tonumber(entry.grades) == tonumber(gradeLevel)
    end

    if type(entry.grades) == 'table' then
        for _, g in ipairs(entry.grades) do
            if tonumber(g) == tonumber(gradeLevel) then return true end
        end
    end

    return false
end

local function getAuthorizedJobSet(jobName, gradeLevel)
    if jobName == 'police' then
        if gradeLevel >= 0 and gradeLevel <= 15 then
            return Config.PoliceVehicles
        elseif gradeLevel == 16 then
            return Config.Commissioner
        end

    elseif jobName == 'sheriff' then
        if gradeLevel >= 0 and gradeLevel <= 9 then
            return Config.BSCO or Config.PoliceVehicles
        elseif gradeLevel >= 10 and gradeLevel <= 16 then
            return Config.Commissioner
        end
    end

    return nil
end

local function getAuthorizedGangSet(gangName, gradeLevel)
    if gangName == 'bsmc' and gradeLevel >= 0 then
        return Config.BSMCVehicles
    -- elseif gangName == 'imc' and gradeLevel >= 0 then ---ADD IN FOR ANOTHER MC
    --     return Config.IMCVehicles
    end
    return nil
end

local function garageMatchesAffiliation(garageIndex, jobName, gangName)
    local g = Config.PoliceGarages and Config.PoliceGarages[garageIndex]
    if not g then return false end
    if g.job and g.job ~= jobName then return false end
    if g.gang and g.gang ~= gangName then return false end
    return true
end

-- ============ Preview lock (ox_lib callback) ============
lib.callback.register('CL-PoliceGarage:CheckIfActive', function(source)
    if not isActive then
        isActive = true
        TriggerClientEvent('CL-PoliceGarage:client:SetActive', -1, isActive)
        return true
    end
    exports.qbx_core:Notify(source, 'Someone is in the preview. Please wait!', 'error')
    return false
end)

RegisterNetEvent('CL-PoliceGarage:server:SetActive', function(status)
    isActive = not not status
    TriggerClientEvent('CL-PoliceGarage:client:SetActive', -1, isActive)
end)

-- ============ Purchase: Police/Sheriff ============
RegisterNetEvent('CL-PoliceGarage:TakeMoney', function(data)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    if type(data) ~= 'table' then return end

    local vehicle     = tostring(data.vehicle or '')
    local price       = tonumber(data.price or 0) or 0
    local vehiclename = tostring(data.vehiclename or vehicle)
    local garage      = data.garage

    if vehicle == '' or price <= 0 or not garage then return end

    local pd = Player.PlayerData or {}
    local jobName   = pd.job and pd.job.name or nil
    local jobGrade  = pd.job and pd.job.grade and pd.job.grade.level or 0
    local gangName  = pd.gang and pd.gang.name or nil

    -- Ensure this garage matches the player's affiliation (job or gang)
    if not garageMatchesAffiliation(garage, jobName, gangName) then
        exports.qbx_core:Notify(src, 'Not authorized for this garage.', 'error')
        return
    end

    -- Determine authorized vehicle table for this job & grade
    local set = getAuthorizedJobSet(jobName, jobGrade)
    if not set then
        exports.qbx_core:Notify(src, 'No authorized vehicles for your rank.', 'error')
        return
    end

    -- Validate vehicle exists & grade access
    local entry = set[vehicle]
    if not entry or not hasGradeAccess(entry, jobGrade) then
        exports.qbx_core:Notify(src, 'You are not authorized to buy this vehicle.', 'error')
        return
    end

    -- Charge player
    local bank = Player.Functions.GetMoney('bank') or 0
    if bank < price then
        exports.qbx_core:Notify(src, 'You do not have enough money!', 'error')
        return
    end
    Player.Functions.RemoveMoney('bank', price, 'police garage')

    local plate = GeneratePlate()
    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state, job_personalowned) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        pd.license,
        pd.citizenid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        'Legion Garage',
        0,
        jobName
    })

    TriggerClientEvent('CL-PoliceGarage:SpawnVehicle', src, garage, vehicle, plate, true)
    exports.qbx_core:Notify(src, 'Vehicle Successfully Bought', 'success')

    local steamname = GetPlayerName(src)
    DiscordLog(nil, ('New Vehicle Bought By: **%s** ID: **%s** Bought: **%s (%s)** For: **$%s**'):format(
        steamname, src, vehiclename, plate, price
    ), 14177041)
end)

-- ============ Purchase: EMS (uses Config.PoliceGarages entries with job = 'ambulance') ============
RegisterNetEvent('CL-EMSGarage:TakeMoney', function(data)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    if type(data) ~= 'table' then return end

    local vehicle     = tostring(data.vehicle or '')
    local price       = tonumber(data.price or 0) or 0
    local vehiclename = tostring(data.vehiclename or vehicle)
    local garage      = data.garage

    if vehicle == '' or price <= 0 or not garage then return end

    local pd = Player.PlayerData or {}
    local jobName  = pd.job and pd.job.name or nil
    local jobGrade = pd.job and pd.job.grade and pd.job.grade.level or 0

    if jobName ~= 'ambulance' then
        exports.qbx_core:Notify(src, 'Not authorized for EMS garage.', 'error')
        return
    end

    -- Validate this garage exists and is EMS-designated inside Config.PoliceGarages
    local g = Config.PoliceGarages and Config.PoliceGarages[garage]
    if not g or g.job ~= 'ambulance' then
        exports.qbx_core:Notify(src, 'Invalid EMS garage.', 'error')
        return
    end

    -- Grade limit (0-7)
    if jobGrade < 0 or jobGrade > 7 then
        exports.qbx_core:Notify(src, 'No authorized vehicles for your rank.', 'error')
        return
    end

    local set = Config.AmbulanceVehicles
    if not set then
        exports.qbx_core:Notify(src, 'EMS vehicle list not configured.', 'error')
        return
    end

    local entry = set[vehicle]
    if not entry or not hasGradeAccess(entry, jobGrade) then
        exports.qbx_core:Notify(src, 'You are not authorized to buy this vehicle.', 'error')
        return
    end

    local bank = Player.Functions.GetMoney('bank') or 0
    if bank < price then
        exports.qbx_core:Notify(src, 'You do not have enough money!', 'error')
        return
    end
    Player.Functions.RemoveMoney('bank', price, 'ems garage')

    local plate = GenerateEMSPlate()
    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state, job_personalowned) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        pd.license,
        pd.citizenid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        'Legion Garage',
        0,
        jobName
    })

    TriggerClientEvent('CL-EMSGarage:SpawnVehicle', src, garage, vehicle, plate, true)
    exports.qbx_core:Notify(src, 'Vehicle Successfully Bought', 'success')

    local steamname = GetPlayerName(src)
    DiscordLog(nil, ('New EMS Vehicle Bought By: **%s** ID: **%s** Bought: **%s (%s)** For: **$%s**'):format(
        steamname, src, vehiclename, plate, price
    ), 14177041)
end)

-- ============ Purchase: MC (gangs) ============
RegisterNetEvent('CL-MCGarage:TakeMoney', function(data)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    if type(data) ~= 'table' then return end

    local vehicle     = tostring(data.vehicle or '')
    local price       = tonumber(data.price or 0) or 0
    local vehiclename = tostring(data.vehiclename or vehicle)
    local garage      = data.garage

    if vehicle == '' or price <= 0 or not garage then return end

    local pd = Player.PlayerData or {}
    local gangName  = pd.gang and pd.gang.name or nil
    local gangGrade = pd.gang and pd.gang.grade and pd.gang.grade.level or 0
    local jobName   = pd.job and pd.job.name or nil -- for garage match

    -- Ensure this garage matches the player's affiliation
    if not garageMatchesAffiliation(garage, jobName, gangName) then
        exports.qbx_core:Notify(src, 'Not authorized for this garage.', 'error')
        return
    end

    local set = getAuthorizedGangSet(gangName, gangGrade)
    if not set then
        exports.qbx_core:Notify(src, 'No authorized vehicles for your rank.', 'error')
        return
    end

    local entry = set[vehicle]
    if not entry or not hasGradeAccess(entry, gangGrade) then
        exports.qbx_core:Notify(src, 'You are not authorized to buy this vehicle.', 'error')
        return
    end

    local bank = Player.Functions.GetMoney('bank') or 0
    if bank < price then
        exports.qbx_core:Notify(src, 'You do not have enough money!', 'error')
        return
    end
    Player.Functions.RemoveMoney('bank', price, 'mc bike')

    local plate = GenerateMCPlate()
    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        pd.license,
        pd.citizenid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        'Legion Garage',
        0
    })

    -- Reuse your existing spawn event (matches your current setup)
    TriggerClientEvent('CL-PoliceGarage:SpawnVehicle', src, garage, vehicle, plate, true)
    exports.qbx_core:Notify(src, 'Vehicle Successfully Bought', 'success')

    local steamname = GetPlayerName(src)
    DiscordLog(nil, ('New Vehicle Bought By: **%s** ID: **%s** Bought: **%s (%s)** For: **$%s**'):format(
        steamname, src, vehiclename, plate, price
    ), 14177041)
end)

-- ============ Save vehicle props from client ============
RegisterNetEvent('CL-PoliceGarage:UpdateVehicleProperties', function(plate, props)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player or not plate then return end

    MySQL.update('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {
        json.encode(props or {}),
        plate
    })
end)