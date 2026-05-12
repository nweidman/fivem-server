local currentStatusList = {}
local casings = {}
local currentCasing = nil
local bloodDrops = {}
local currentBloodDrop = nil
local fingerprints = {}
local currentFingerprint = 0
local shotAmount = 0

local statusList = {
    fight = locale('evidence.red_hands'),
    widepupils = locale('evidence.wide_pupils'),
    redeyes = locale('evidence.red_eyes'),
    weedsmell = locale('evidence.weed_smell'),
    -- gunpowder = locale('evidence.gunpowder'), -- Duplicate Notification
    chemicals = locale('evidence.chemicals'),
    heavybreath = locale('evidence.heavy_breathing'),
    sweat = locale('evidence.sweat'),
    handbleed = locale('evidence.handbleed'),
    confused = locale('evidence.confused'),
    alcohol = locale('evidence.alcohol'),
    heavyalcohol = locale('evidence.heavy_alcohol'),
    agitated = locale('evidence.agitated'),
}

local ignoredWeapons = {
    [`weapon_unarmed`] = true,
    [`weapon_snowball`] = true,
    [`weapon_stungun`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fireextinguisher`] = true,
}

-- local function dropBulletCasing(weapon, ped)
--     local randX = math.random() + math.random(-1, 1)
--     local randY = math.random() + math.random(-1, 1)
--     local coords = GetOffsetFromEntityInWorldCoords(ped, randX, randY, 0)
--     local serial = exports.ox_inventory:getCurrentWeapon().metadata.serial
--     TriggerServerEvent('evidence:server:CreateCasing', weapon, serial, coords)
--     Wait(300)
-- end

local function dnaHash(s)
    local h = string.gsub(s, '.', function(c)
        return string.format('%02x', string.byte(c))
    end)
    return h
end

RegisterNetEvent('evidence:client:SetStatus', function(statusId, time)
    if time > 0 and statusList[statusId] then
        if not currentStatusList?[statusId] or currentStatusList[statusId].time < 20 then
            currentStatusList[statusId] = {
                text = statusList[statusId],
                time = time
            }
            exports.qbx_core:Notify(currentStatusList[statusId].text, 'error')
        end
    elseif statusList[statusId] then
        currentStatusList[statusId] = nil
    end
    TriggerServerEvent('evidence:server:UpdateStatus', currentStatusList)
end)
--[[
RegisterNetEvent('evidence:client:AddBlooddrop', function(bloodId, citizenid, bloodtype, coords)
    bloodDrops[bloodId] = {
        citizenid = citizenid,
        bloodtype = bloodtype,
        coords = vec3(coords.x, coords.y, coords.z - 0.9)
    }
end)

RegisterNetEvent('evidence:client:RemoveBlooddrop', function(bloodId)
    bloodDrops[bloodId] = nil
    currentBloodDrop = 0
end)

RegisterNetEvent('evidence:client:AddFingerPrint', function(fingerId, fingerprint, coords)
    fingerprints[fingerId] = {
        fingerprint = fingerprint,
        coords = vec3(coords.x, coords.y, coords.z - 0.9)
    }
end)

RegisterNetEvent('evidence:client:RemoveFingerprint', function(fingerId)
    fingerprints[fingerId] = nil
    currentFingerprint = 0
end)

RegisterNetEvent('evidence:client:ClearBlooddropsInArea', function()
    local pos = GetEntityCoords(cache.ped)
    local bloodDropList = {}
    if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = locale('progressbar.blood_clear'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = false,
                car = false,
                combat = true,
                mouse = false
            }
        })
    then
        if bloodDrops and next(bloodDrops) then
            for bloodId in pairs(bloodDrops) do
                if #(pos - bloodDrops[bloodId].coords) < 10.0 then
                    bloodDropList[#bloodDropList + 1] = bloodId
                end
            end
            TriggerServerEvent('evidence:server:ClearBlooddrops', bloodDropList)
            exports.qbx_core:Notify(locale('success.blood_clear'), 'success')
        end
    else
        exports.qbx_core:Notify(locale('error.blood_not_cleared'), 'error')
    end
end)

RegisterNetEvent('evidence:client:AddCasing', function(casingId, weapon, coords, serie)
    casings[casingId] = {
        type = weapon,
        serie = serie and serie or locale('evidence.serial_not_visible'),
        coords = vec3(coords.x, coords.y, coords.z - 0.9)
    }
end)

RegisterNetEvent('evidence:client:RemoveCasing', function(casingId)
    casings[casingId] = nil
    currentCasing = 0
end)

RegisterNetEvent('evidence:client:ClearCasingsInArea', function()
    local pos = GetEntityCoords(cache.ped)
    local casingList = {}

    if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            label = locale('progressbar.bullet_casing'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = false,
                car = false,
                combat = true,
                mouse = false,
            }
        })
    then
        if casings and next(casings) then
            for casingId in pairs(casings) do
                if #(pos - casings[casingId].coords) < 10.0 then
                    casingList[#casingList + 1] = casingId
                end
            end
            TriggerServerEvent('evidence:server:ClearCasings', casingList)
            exports.qbx_core:Notify(locale('success.bullet_casing_removed'), 'success')
        end
    else
        exports.qbx_core:Notify(locale('error.bullet_casing_not_removed'), 'error')
    end
end)
]]
local function updateStatus()
    if not LocalPlayer.state.isLoggedIn then return end
    if currentStatusList and next(currentStatusList) then
        for k in pairs(currentStatusList) do
            if currentStatusList[k].time > 0 then
                currentStatusList[k].time -= 10
            else
                currentStatusList[k].time = 0
            end
        end
        TriggerServerEvent('evidence:server:UpdateStatus', currentStatusList)
    end
    if shotAmount > 0 then
        shotAmount = 0
    end
end

CreateThread(function()
    while true do
        Wait(10000)
        updateStatus()
    end
end)

-- local function onPlayerShooting()
--     shotAmount += 1
--     if shotAmount > 5 and not currentStatusList?.gunpowder then
--         if math.random(1, 10) <= 7 then
--             TriggerEvent('evidence:client:SetStatus', 'gunpowder', 200)
--         end
--     end
--     dropBulletCasing(cache.weapon, cache.ped)
-- end

-- CreateThread(function() -- Gunpowder Status when shooting
--     while true do
--         Wait(0)
--         if IsPedShooting(cache.ped) and not ignoredWeapons[cache.weapon] then
--             onPlayerShooting()
--         end
--     end
-- end)

---@param coords vector3
---@return string
local function getStreetLabel(coords)
    local s1, s2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 then
        streetLabel = streetLabel .. ' | ' .. street2
    end
    local sanitized = streetLabel:gsub("%'", "")
    return sanitized
end

local function getPlayerDistanceFromCoords(coords)
    local pos = GetEntityCoords(cache.ped)
    return #(pos - coords)
end

---@param metadata table
local function enrichCasingMetadata(metadata)
    local weapon = exports.qbx_core:GetWeapons()[casings[currentCasing].type]
    if not weapon then return end

    local weaponData = exports.ox_inventory:Items(string.upper(weapon.name))
    if not weaponData?.ammoname then return end

    local ammo = exports.ox_inventory:Items(weaponData.ammoname)
    if ammo?.label then
        metadata.ammolabel = ammo.label
    end
end

---@class DrawEvidenceIfInRangeArgs
---@field evidenceId integer
---@field coords vector3
---@field text string
---@field metadata table
---@field serverEventOnPickup string

---@param args DrawEvidenceIfInRangeArgs
local function drawEvidenceIfInRange(args)
    if getPlayerDistanceFromCoords(args.coords) >= 1.5 then return end

    qbx.drawText3d({ text = args.text, coords = args.coords })

    if IsControlJustReleased(0, 47) then
        if args.metadata.type == locale('info.casing') then
            enrichCasingMetadata(args.metadata)
        end

        TriggerServerEvent(args.serverEventOnPickup, args.evidenceId, args.metadata)
    end
end

--- draw 3D text on the ground to show evidence, if they press pickup button, set metadata and add it to their inventory.
CreateThread(function()
    while true do
        Wait(0)

        if currentCasing and currentCasing ~= 0 then
            drawEvidenceIfInRange({
                evidenceId = currentCasing,
                coords = casings[currentCasing].coords,
                text = locale('info.bullet_casing', casings[currentCasing].type),
                metadata = {
                    type = locale('info.casing'),
                    street = getStreetLabel(casings[currentCasing].coords),
                    ammotype = casings[currentCasing].type,
                    serie = casings[currentCasing].serie
                },
                serverEventOnPickup = 'evidence:server:AddCasingToInventory'
            })
        end

        if currentBloodDrop and currentBloodDrop ~= 0 then
            drawEvidenceIfInRange({
                evidenceId = currentBloodDrop,
                coords = bloodDrops[currentBloodDrop].coords,
                text = locale('info.blood_text', dnaHash(bloodDrops[currentBloodDrop].citizenid)),
                metadata = {
                    type = locale('info.blood'),
                    street = getStreetLabel(bloodDrops[currentBloodDrop].coords),
                    dnalabel = dnaHash(bloodDrops[currentBloodDrop].citizenid),
                    bloodtype = bloodDrops[currentBloodDrop].bloodtype
                },
                serverEventOnPickup = 'evidence:server:AddBlooddropToInventory'
            })
        end

        if currentFingerprint and currentFingerprint ~= 0 then
            drawEvidenceIfInRange({
                evidenceId = currentFingerprint,
                coords = fingerprints[currentFingerprint].coords,
                text = locale('info.fingerprint_text'),
                metadata = {
                    type = locale('info.fingerprint'),
                    street = getStreetLabel(fingerprints[currentFingerprint].coords),
                    fingerprint = fingerprints[currentFingerprint].fingerprint
                },
                serverEventOnPickup = 'evidence:server:AddFingerprintToInventory'
            })
        end
    end
end)

local function canDiscoverEvidence()
    return LocalPlayer.state.isLoggedIn
        and QBX.PlayerData.job.type == 'leo'
        and QBX.PlayerData.job.onduty
        and IsPlayerFreeAiming(cache.playerId)
        and cache.weapon == `WEAPON_FLASHLIGHT`
end

---@param evidence table<number, {coords: vector3}>
---@return number? evidenceId
local function getCloseEvidence(evidence)
    local pos = GetEntityCoords(cache.ped, true)
    for evidenceId, v in pairs(evidence) do
        local dist = #(pos - v.coords)
        if dist < 1.5 then
            return evidenceId
        end
    end
end

CreateThread(function()
    while true do
        local closeEvidenceSleep = 1000
        if canDiscoverEvidence() then
            closeEvidenceSleep = 10
            currentCasing = getCloseEvidence(casings) or currentCasing
            currentBloodDrop = getCloseEvidence(bloodDrops) or currentBloodDrop
            currentFingerprint = getCloseEvidence(fingerprints) or currentFingerprint
        end
        Wait(closeEvidenceSleep)
    end
end)

-- ========= DNA SCANNER (client) =========
-- Uses ox_lib UI + zones and reads your config via: require 'config.shared'

-- Load your returned-table config module (config/shared.lua)
local cfg = require 'config.shared'
local dnaSpots = (cfg.locations and cfg.locations.dna) or {}

if type(dnaSpots) ~= 'table' or #dnaSpots == 0 then
    -- print('[DNA] No Config.locations.dna entries found; update config/shared.lua')
    return
end

----------------------------------------------------------------
-- ReverseDnaHash: decode a hex string like "44464F3430323135" -> "DFO40215"
-- If your DNA is already plain citizenid text, just return it.
----------------------------------------------------------------
function ReverseDnaHash(str)
    local hex = tostring(str or ''):gsub('^%s+', ''):gsub('%s+$', '')
    hex = hex:gsub('^0x', '')
    if hex == '' then return nil end

    -- If it's not hex, just use as-is
    if (#hex % 2 ~= 0) or (not hex:match('^[0-9A-Fa-f]+$')) then
        return hex
    end

    local out = {}
    for i = 1, #hex, 2 do
        local byte = tonumber(hex:sub(i, i + 1), 16)
        if not byte then return nil end
        out[#out + 1] = string.char(byte)
    end
    return table.concat(out)
end

-- Prefer qbx_core, fallback to qb-core for PlayerData
local function getPlayerData()
    if exports.qbx_core and exports.qbx_core.GetPlayerData then
        local ok, pd = pcall(function() return exports.qbx_core:GetPlayerData() end)
        if ok and pd then return pd end
    end
    if exports['qb-core'] and exports['qb-core'].GetPlayerData then
        local ok, pd = pcall(function() return exports['qb-core']:GetPlayerData() end)
        if ok and pd then return pd end
    end
    return nil
end

-- On-duty police check (single-job + multi-job)
local function isOnDutyPolice()
    local pd = getPlayerData()
    if not pd then return false end

    local j = pd.job
    if j and (j.name == 'police' or j.id == 'police') and (j.onduty or j.onDuty) then
        return true
    end

    local jobs = pd.jobs
    if jobs then
        if jobs.police and (jobs.police.onduty or jobs.police.onDuty) then
            return true
        end
        for key, v in pairs(jobs) do
            if (key == 'police' or (v and v.name == 'police')) and (v.onduty or v.onDuty) then
                return true
            end
        end
    end

    return false
end

-- Wrapper with debug logs
local function reverseDnaHashSafe(str)
    local s = tostring(str or ''):gsub('^%s+', ''):gsub('%s+$', '')
    if s == '' then return nil end

    local ok, out = pcall(ReverseDnaHash, s)
    if ok and out and out ~= '' then
        -- print(("[DNA] ReverseDnaHash OK: input='%s' -> citizenid-or-id='%s'"):format(s, out))
        return tostring(out)
    else
        -- print(("[DNA] ReverseDnaHash returned nothing for input='%s'"):format(s))
        return nil
    end
end

-- UI helpers
local showingUI = false
local function showText(label)
    if showingUI then return end
    showingUI = true
    lib.showTextUI(('[E] %s'):format(label or 'Examine DNA'))
end
local function hideText()
    if not showingUI then return end
    showingUI = false
    lib.hideTextUI()
end

-- Scan flow
local function doScan(title)
    local input = lib.inputDialog(title or 'DNA Database', {
        { type = 'input', label = 'Enter DNA Strain', placeholder = '' }
    })
    if not input or not input[1] or input[1] == '' then
        lib.notify({ title = 'DNA', description = 'No input provided.', type = 'error' })
        return
    end

    local ok = lib.progressCircle({
        duration = 1800,
        label = 'Analyzing DNA strain...',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true }
    })
    if not ok then return end

    local key = reverseDnaHashSafe(input[1])
    if not key then
        lib.notify({ title = 'DNA', description = 'Invalid input provided (no mapping).', type = 'error' })
        return
    end

    -- print(("[DNA][CLIENT] sending key='%s' to server"):format(key))
    TriggerServerEvent('police:checkDNAResult', key)
end

-- Build ox_lib zones from config.locations.dna
CreateThread(function()
    for i = 1, #dnaSpots do
        local pos = dnaSpots[i]
        lib.zones.box({
            coords = pos,
            size = vec3(2.0, 2.0, 2.0),
            rotation = 0.0,
            debug = false,

            onEnter = function()
                if isOnDutyPolice() then showText('Examine DNA') end
            end,

            onExit = function()
                hideText()
            end,

            inside = function()
                if not isOnDutyPolice() then
                    hideText()
                    return
                end

                if not showingUI then showText('Examine DNA') end
                if IsControlJustReleased(0, 38) then -- E
                    doScan('DNA Database')
                end
            end,
        })
    end
end)

-- Results UI
RegisterNetEvent('police:showDNAResult', function(data)
    local options = {
        { title = 'Name',     description = tostring(data.name or 'Unknown'),      disabled = true },
        { title = 'State ID', description = tostring(data.cid or 'Unknown'),       disabled = true },
        { title = 'Job',      description = tostring(data.job or 'unemployed'),    disabled = true },
        { title = 'Phone',    description = tostring(data.phone or 'N/A'),         disabled = true },
    }
    if data.offline then
        options[#options+1] = { title = 'Status', description = 'Offline record', disabled = true }
    end

    lib.registerContext({
        id = 'dna_result_ctx',
        title = 'DNA Match Found',
        description = 'Verified in DNA Database',
        options = options
    })
    lib.showContext('dna_result_ctx')
end)

RegisterNetEvent('police:dnaInvalid', function()
    lib.notify({ title = 'DNA', description = 'No player found with that DNA.', type = 'error' })
end)
-- ========= /DNA SCANNER (client) =========
