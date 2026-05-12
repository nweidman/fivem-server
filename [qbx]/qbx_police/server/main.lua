local sharedConfig = require 'config.shared'
Plates = {}
local playerStatus = {}
local casings = {}
local bloodDrops = {}
local fingerDrops = {}
local updatingCops = false

---@param player Player
---@param minGrade? integer
---@return boolean?
function IsLeoAndOnDuty(player, minGrade)
    local job = player.PlayerData.job
    if job and job.type == 'leo' and job.onduty then
        return job.grade.level >= (minGrade or 0)
    end
end

-- === Cop count helpers (added) ===
local function countOnDutyCops()
    local players = exports.qbx_core:GetQBPlayers()
    local amount = 0
    for i = 1, #players do
        if IsLeoAndOnDuty(players[i]) then
            amount = amount + 1
        end
    end
    return amount
end

local function broadcastCopCount(amount)
    local n = amount ~= nil and tonumber(amount) or countOnDutyCops()
    if not n then n = 0 end
    -- to all clients
    TriggerClientEvent('police:SetCopCount', -1, n)
    -- ALSO a server-side event for internal listeners
    TriggerEvent('police:SetCopCount', n)
end
-- === /Cop count helpers ===

-- Functions
local function updateBlips()
    local dutyPlayers = {}
    local players = exports.qbx_core:GetQBPlayers()
    for _, player in pairs(players) do
        local playerData = player.PlayerData
        local job = playerData.job
        if (job.type == 'leo' or job.type == 'ems') and job.onduty then
            local source = playerData.source
            local ped = GetPlayerPed(source)
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            dutyPlayers[#dutyPlayers + 1] = {
                job = job.name,
                source = source,
                label = playerData.metadata.callsign,
                location = vec4(coords.x, coords.y, coords.z, heading)
            }
        end
    end

    TriggerClientEvent('police:client:UpdateBlips', -1, dutyPlayers)
end

local function generateId(table)
    local id = lib.string.random('11111')
    if not table then return id end
    while table[id] do
        id = lib.string.random('11111')
    end
    return id
end

RegisterNetEvent('police:server:SendTrackerLocation', function(coords, requestId)
    local target = exports.qbx_core:GetPlayer(source)
    local msg = locale('info.target_location', target.PlayerData.charinfo.firstname, target.PlayerData.charinfo.lastname)
    local alertData = {
        title = locale('info.anklet_location'),
        coords = coords,
        description = msg
    }
    TriggerClientEvent('police:client:TrackerMessage', requestId, msg, coords)
    TriggerClientEvent('qb-phone:client:addPoliceAlert', requestId, alertData)
end)

-- Items
exports.qbx_core:CreateUseableItem('handcuffs', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player.Functions.GetItemByName('handcuffs') then return end
    TriggerClientEvent('police:client:CuffPlayerSoft', source)
end)

exports.qbx_core:CreateUseableItem('moneybag', function(source, item)
    if not item.info or item.info == '' then return end
    local player = exports.qbx_core:GetPlayer(source)
    if not player
        or player.PlayerData.job.type == 'leo'
        or not player.Functions.GetItemByName('moneybag')
        or not player.Functions.RemoveItem('moneybag', 1, item.slot)
    then
        return
    end
    player.Functions.AddMoney('cash', tonumber(item.info.cash), 'used-moneybag')
end)

-- Callbacks
lib.callback.register('police:server:isPlayerDead', function(_, playerId)
    local player = exports.qbx_core:GetPlayer(playerId)
    return player.PlayerData.metadata.isdead or player.PlayerData.metadata.inlaststand
end)

lib.callback.register('police:GetPlayerStatus', function(_, targetSrc)
    local player = exports.qbx_core:GetPlayer(targetSrc)
    if not player or not next(playerStatus[targetSrc]) then return {} end
    local status = playerStatus[targetSrc]

    local statList = {}
    for i = 1, #status do
        statList[#statList + 1] = status[i].text
    end

    return statList
end)

lib.callback.register('police:GetImpoundedVehicles', function()
    return FetchImpoundedVehicles()
end)

lib.callback.register('qbx_policejob:server:spawnVehicle', function(source, model, coords, plate, giveKeys, vehId)
    local netId, veh = qbx.spawnVehicle({
        model = model,
        spawnSource = coords,
        warp = GetPlayerPed(source)
    })

    if not netId or netId == 0 or not veh or veh == 0 then return end

    SetVehicleNumberPlateText(veh, plate)
    if giveKeys == true then exports['Renewed-Vehiclekeys']:addKey(plate) end
    --if giveKeys == true then exports.qbx_vehiclekeys:GiveKeys(source, veh) end

    if vehId then Entity(veh).state.vehicleid = vehId end
    return netId
end)

local function isPlateFlagged(plate)
    return Plates and Plates[plate] and Plates[plate].isflagged
end

lib.callback.register('police:server:isPlateFlagged', function(_, plate)
    return isPlateFlagged(plate)
end)

local function isPoliceForcePresent()
    local players = exports.qbx_core:GetQBPlayers()
    for i = 1, #players do
        local job = players[i].PlayerData.job
        if job.type == 'leo' and job.grade.level >= 2 then
            return true
        end
    end
end

lib.callback.register('qbx_police:server:isPoliceForcePresent', isPoliceForcePresent)

if GetConvar('qbx:enablebridge', 'true') == 'true' then
    local QBCore = exports['qb-core']:GetCoreObject()
    ---@deprecated use police:server:isPlateFlagged
    QBCore.Functions.CreateCallback('police:IsPlateFlagged', function(_, cb, plate)
        lib.print.warn(GetInvokingResource(),
            'invoked deprecated callback police:IsPlateFlagged. Use police:server:isPlateFlagged instead.')
        cb(isPlateFlagged(plate))
    end)

    ---@deprecated
    QBCore.Functions.CreateCallback('police:server:IsPoliceForcePresent', function(_, cb)
        lib.print.warn(GetInvokingResource(),
            'invoked deprecated callback police:server:IsPoliceForcePresent. Use lib callback qbx_police:server:isPoliceForcePresent instead')
        cb(isPoliceForcePresent())
    end)
end

-- Events
RegisterNetEvent('police:server:Radar', function(fine)
    local src    = source
    local price  = sharedConfig.radars.speedFines[fine].fine
    local player = exports.qbx_core:GetPlayer(src)
    if not player.Functions.RemoveMoney('bank', math.floor(price), 'Radar Fine') then return end
    exports['okokBanking']:AddMoney(society, value)
    --exports['Renewed-Banking']:addAccountMoney('police', price)
    exports.qbx_core:Notify(src, locale('info.fine_received', price), 'inform')
end)

local function getSender(src)
    local xPlayer = exports.qbx_core:GetPlayer(src)
    local firstname, lastname, callsign = 'UNKNOWN', 'OFFICER', nil
    if xPlayer and xPlayer.PlayerData then
        local pd = xPlayer.PlayerData
        local ci = pd.charinfo or {}
        firstname = ci.firstname or firstname
        lastname  = ci.lastname or lastname
        local md = pd.metadata or {}
        callsign  = md.callsign or callsign
    end
    return {
        id = src,
        name = (('%s %s'):format(firstname, lastname)):gsub('%s+', ' '),
        callsign = callsign
    }
end

local function isLeoOnDuty(ply)
    local job = ply.PlayerData and ply.PlayerData.job
    if not job then return false end
    return (job.type == 'leo' or job.name == 'police' or job.name == 'sheriff') and job.onduty == true
end

RegisterNetEvent('police:server:policeAlert', function(text, camId, playerSource)
    local src = playerSource or source

    local ped = GetPlayerPed(src)
    local coords = DoesEntityExist(ped) and GetEntityCoords(ped) or nil

    local sender = getSender(src)

    local enriched = sender.callsign
        and (('[%s] %s — %s'):format(sender.callsign, sender.name, text))
        or  (('%s — %s'):format(sender.name, text))

    if camId then
        enriched = ('%s %s%s'):format(
            enriched,
            (locale and locale('info.camera_id')) or 'Camera: ',
            tostring(camId)
        )
    end

    local title = (locale and locale('info.new_call')) or 'New Call'

    local players = exports.qbx_core:GetQBPlayers()
    for _, v in pairs(players) do
        if isLeoOnDuty(v) then
            local targetSrc = (v.PlayerData and v.PlayerData.source) or v.source or _
            TriggerClientEvent('qb-phone:client:addPoliceAlert', targetSrc, {
                title = title,
                coords = coords,
                description = enriched
            })
            TriggerClientEvent('police:client:policeAlert', targetSrc, coords, enriched, camId)
        end
    end
end)

RegisterNetEvent('police:server:TakeOutImpound', function(plate, garage)
    local src = tonumber(source)
    if not src then return end
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    if #(playerCoords - sharedConfig.locations.impound[garage]) > 10.0 then return end

    Unimpound(plate)
    exports.qbx_core:Notify(src, locale('success.impound_vehicle_removed'), 'success')
end)

local function isTargetTooFar(src, targetSrc, maxDistance)
    maxDistance = maxDistance or 2.5
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(targetSrc)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    if #(playerCoords - targetCoords) > maxDistance then
        return true
    end
end

lib.callback.register('police:server:CuffPlayer', function(src, cuffedSrc, isSoftcuff)
    if isTargetTooFar(src, cuffedSrc) then return end

    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end
    local cuffedPlayer = exports.qbx_core:GetPlayer(cuffedSrc)
    if not cuffedPlayer or not player.Functions.GetItemByName('handcuffs') then return end

    TriggerClientEvent('police:client:GetCuffed', cuffedPlayer.PlayerData.source, player.PlayerData.source, isSoftcuff)

    return true
end)

-- /Cuff
lib.addCommand('cuff', {
    help = 'Cuff nearby (needs cuffs) or cuff a player by ID (admin)',
    params = { { name = 'id', type = 'number', optional = true } },
    -- restricted = 'group.admin',
}, function(source, args)
    local src = source
    local targetId = args.id and tonumber(args.id) or nil

    if targetId then
        if not IsPlayerAceAllowed(src, 'admin') then
            exports.qbx_core:Notify(src, "You don't have permission to cuff by ID.", 'error')
            return
        end

        local TPlayer = exports.qbx_core:GetPlayer(targetId)
        if not TPlayer then
            exports.qbx_core:Notify(src, "You must specify a valid player ID.", 'error')
            return
        end

        local SOFT = true
        TriggerClientEvent('police:client:GetCuffed', targetId, src, SOFT)
        TriggerEvent('police:server:CuffPlayer', targetId, SOFT)
        return
    end

    local count = exports.ox_inventory:Search(src, 'count', 'handcuffs') or 0
    count = count + (exports.ox_inventory:Search(src, 'count', 'fuzzyhandcuffs') or 0)
    if count < 1 then
        exports.qbx_core:Notify(src, "You do not have handcuffs.", 'error')
        return
    end

    TriggerClientEvent('police:client:CuffPlayerSoft', src)
end)

RegisterNetEvent('police:server:EscortPlayer', function(escortSrc)
    local src = source
    if isTargetTooFar(src, escortSrc) then return end

    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end
    local escortPlayer = exports.qbx_core:GetPlayer(escortSrc)
    if not escortPlayer then return end

    if (player.PlayerData.job.type == 'leo' or player.PlayerData.job.type == 'ems') or (escortPlayer.PlayerData.metadata.ishandcuffed or escortPlayer.PlayerData.metadata.isdead or escortPlayer.PlayerData.metadata.inlaststand) then
        TriggerClientEvent('police:client:GetEscorted', escortPlayer.PlayerData.source, player.PlayerData.source)
    else
        exports.qbx_core:Notify(src, locale('error.not_cuffed_dead'), 'error')
    end
end)

RegisterNetEvent('police:server:KidnapPlayer', function(kidnapedSrc)
    local src = source
    if isTargetTooFar(src, kidnapedSrc) then return end
    local player = exports.qbx_core:GetPlayer(source)
    local escortPlayer = exports.qbx_core:GetPlayer(kidnapedSrc)
    if not player or not escortPlayer then return end

    if escortPlayer.PlayerData.metadata.ishandcuffed or escortPlayer.PlayerData.metadata.isdead or escortPlayer.PlayerData.metadata.inlaststand then
        TriggerClientEvent('police:client:GetKidnappedTarget', escortPlayer.PlayerData.source, player.PlayerData.source)
        TriggerClientEvent('police:client:GetKidnappedDragger', player.PlayerData.source, escortPlayer.PlayerData.source)
    else
        exports.qbx_core:Notify(src, locale('error.not_cuffed_dead'), 'error')
    end
end)

RegisterNetEvent('police:server:SetPlayerOutVehicle', function(targetSrc)
    local src = source
    if isTargetTooFar(src, targetSrc) then return end

    local escortPlayer = exports.qbx_core:GetPlayer(targetSrc)
    if not escortPlayer then return end
    local metadata = escortPlayer.PlayerData.metadata
    if not (metadata.ishandcuffed or metadata.isdead or metadata.inlaststand) then
        return exports.qbx_core:Notify(src, locale('error.not_cuffed_dead'), 'error')
    end

    TriggerClientEvent('police:client:SetOutVehicle', escortPlayer.PlayerData.source)
end)

RegisterNetEvent('police:server:PutPlayerInVehicle', function(targetSrc)
    local src = source
    if isTargetTooFar(src, targetSrc) then return end

    local escortPlayer = exports.qbx_core:GetPlayer(targetSrc)
    if not escortPlayer then return end
    local metadata = escortPlayer.PlayerData.metadata

    if not (metadata.ishandcuffed or metadata.isdead or metadata.inlaststand) then
        return exports.qbx_core:Notify(src, locale('error.not_cuffed_dead'), 'error')
    end

    TriggerClientEvent('police:client:PutInVehicle', escortPlayer.PlayerData.source)
end)

RegisterNetEvent('police:server:BillPlayer', function(targetSrc, price)
    local src = source
    if isTargetTooFar(src, targetSrc) then return end

    local player = exports.qbx_core:GetPlayer(src)
    if not player or player.PlayerData.job.type ~= 'leo' then return end
    local targetPlayer = exports.qbx_core:GetPlayer(targetSrc)
    if not targetPlayer then return end

    if not targetPlayer.Functions.RemoveMoney('bank', price, 'paid-bills') then return end
    exports['okokBanking']:AddMoney(society, value)
    --exports['Renewed-Banking']:addAccountMoney('police', price)
    exports.qbx_core:Notify(targetPlayer.PlayerData.source, locale('info.fine_received', price), 'inform')
end)

RegisterNetEvent('police:server:JailPlayer', function(targetSrc, time)
    local src = source
    if isTargetTooFar(src, targetSrc) then return end

    local player = exports.qbx_core:GetPlayer(src)
    if not player or player.PlayerData.job.type ~= 'leo' then return end
    local targetPlayer = exports.qbx_core:GetPlayer(targetSrc)
    if not targetPlayer then return end

    local currentDate = os.date('*t')
    if currentDate.day == 31 then
        currentDate.day = 30
    end

    targetPlayer.Functions.SetMetaData('injail', time)
    targetPlayer.Functions.SetMetaData('criminalrecord', {
        hasRecord = true,
        date = currentDate
    })
    if GetResourceState('qbx_prison') == 'started' then
        exports.qbx_prison:JailPlayer(targetPlayer.PlayerData.source, time)
    else
        TriggerClientEvent('police:client:SendToJail', targetPlayer.PlayerData.source, time)
    end
    exports.qbx_core:Notify(src, locale('info.sent_jail_for', time), 'inform')
end)

RegisterNetEvent('police:server:SetHandcuffStatus', function(isHandcuffed)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end
    player.Functions.SetMetaData('ishandcuffed', isHandcuffed)
    Player(source).state.invBusy = isHandcuffed
end)

RegisterNetEvent('police:server:RegisterLocker', function()
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end
    local stashName = 'policestash_' .. player.PlayerData.citizenid

    local inventory = exports.ox_inventory:GetInventory(stashName)

    if not inventory then
        exports.ox_inventory:RegisterStash(stashName, 'Police Stash ('..player.PlayerData.citizenid..')', 100, 1000000)
    end

end)

RegisterNetEvent('heli:spotlight', function(state)
    TriggerClientEvent('heli:spotlight', -1, source, state)
end)

RegisterNetEvent('police:server:FlaggedPlateTriggered', function(radar, plate, street)
    local src = tonumber(source)
    if not src then return end
    local coords = GetEntityCoords(GetPlayerPed(src))
    local players = exports.qbx_core:GetQBPlayers()
    for i = 1, #players do
        if IsLeoAndOnDuty(players[i]) then
            local alertData = {
                title = locale('info.new_call'),
                coords = coords,
                description = locale('info.plate_triggered', plate, street, radar)
            }
            TriggerClientEvent('qb-phone:client:addPoliceAlert', i, alertData)
            TriggerClientEvent('police:client:policeAlert', i, coords, locale('info.plate_triggered_blip', radar))
        end
    end
end)

-- qbox + ox_inventory police search (frisk) opener

local function isPolice(player)
    -- Supports both single-job and multi-job setups
    local jobs = player.PlayerData and player.PlayerData.jobs
    if jobs then
        return jobs.police ~= nil
    end
    local job = player.PlayerData and player.PlayerData.job
    return job and job.name == 'police'
end

local function playersWithinRange(aSrc, bSrc, maxDist)
    local aPed = GetPlayerPed(aSrc)
    local bPed = GetPlayerPed(bSrc)
    if aPed == 0 or bPed == 0 then return false end

    local aPos = GetEntityCoords(aPed)
    local bPos = GetEntityCoords(bPed)
    return #(aPos - bPos) <= (maxDist or 3.0)
end

-- qbox + ox_inventory: open target player's inventory for police
-- Robust: server finds the nearest target if client ID is bad/missing.

local OPEN_RANGE = 3.0

local function isPolice(player)
    if not player or not player.PlayerData then return false end
    local pd = player.PlayerData
    if pd.jobs then                    -- multi-job support
        return pd.jobs.police ~= nil
    end
    return pd.job and pd.job.name == 'police'
end

local function getNearestPlayerServer(src, maxDist)
    local srcPed = GetPlayerPed(src)
    if srcPed == 0 then return nil end

    local srcPos = GetEntityCoords(srcPed)
    local closest, closestDist = nil, maxDist or OPEN_RANGE

    for _, id in pairs(GetPlayers()) do
        local tgt = tonumber(id)
        if tgt ~= src then
            local ped = GetPlayerPed(tgt)
            if ped ~= 0 then
                local dist = #(GetEntityCoords(ped) - srcPos)
                if dist <= closestDist then
                    closest, closestDist = tgt, dist
                end
            end
        end
    end

    return closest
end

RegisterNetEvent('police:server:SearchPlayer', function(targetSrc)
    local src = source
    local officer = exports.qbx_core:GetPlayer(src)
    if not officer then return end

    if not isPolice(officer) then
        exports.qbx_core:Notify(src, 'Only police can search players.', 'error')
        return
    end

    -- Coerce/validate client-provided target if any
    local target = tonumber(targetSrc)
    if target then
        local tPlayer = exports.qbx_core:GetPlayer(target)
        if not tPlayer then target = nil end
    end

    -- If client-provided ID is missing/invalid, pick nearest on the server
    if not target then
        target = getNearestPlayerServer(src, OPEN_RANGE)
        if not target then
            exports.qbx_core:Notify(src, 'No player nearby to search.', 'error')
            return
        end
    end

    -- Final distance safety check
    local srcPed = GetPlayerPed(src)
    local tgtPed = GetPlayerPed(target)
    if srcPed == 0 or tgtPed == 0 then
        exports.qbx_core:Notify(src, 'Target is not online.', 'error')
        return
    end
    if #(GetEntityCoords(srcPed) - GetEntityCoords(tgtPed)) > OPEN_RANGE then
        exports.qbx_core:Notify(src, 'Target is too far away.', 'error')
        return
    end

    -- Notify both parties (optional)
    exports.qbx_core:Notify(src, 'Opening target inventory…', 'inform')
    exports.qbx_core:Notify(target, 'You are being searched by police.', 'inform')

    -- Open the TARGET player’s inventory for the officer
    Wait(200)
    exports.ox_inventory:forceOpenInventory(src, 'player', target)
end)

RegisterNetEvent('police:server:SeizeCash', function(targetSrc)
    local src = source
    if isTargetTooFar(src, targetSrc) then return end

    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end
    local targetPlayer = exports.qbx_core:GetPlayer(targetSrc)
    if not targetPlayer then return end

    local moneyAmount = targetPlayer.PlayerData.money.cash
    targetPlayer.Functions.RemoveMoney('cash', moneyAmount, 'police-cash-seized')
    player.Functions.AddItem('moneybag', 1, false, { cash = moneyAmount })
    exports.qbx_core:Notify(targetPlayer.PlayerData.source, locale('info.cash_confiscated'), 'inform')
end)

RegisterNetEvent('police:server:RobPlayer', function(targetSrc)
    local src = source
    if isTargetTooFar(src, targetSrc) then return end

    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end
    local targetPlayer = exports.qbx_core:GetPlayer(targetSrc)
    if not player or not targetPlayer then return end

    local money = targetPlayer.PlayerData.money.cash
    if targetPlayer.Functions.RemoveMoney('cash', money, 'police-player-robbed') then
        player.Functions.AddMoney('cash', money, 'police-player-robbed')
    end

    exports.qbx_core:Notify(targetPlayer.PlayerData.source, locale('info.cash_robbed', money), 'inform')
    exports.qbx_core:Notify(player.PlayerData.source, locale('info.stolen_money', money), 'inform')
end)

RegisterNetEvent('police:server:Impound', function(plate, fullImpound, price, body, engine, fuel)
    local src = source
    price = price or 0
    if not IsVehicleOwned(plate) then return end
    if not fullImpound then
        ImpoundWithPrice(price, body, engine, fuel, plate)
        exports.qbx_core:Notify(src, locale('info.vehicle_taken_depot', price), 'inform')
    else
        ImpoundForever(body, engine, fuel, plate)
        exports.qbx_core:Notify(src, locale('info.vehicle_seized'), 'inform')
    end
end)

RegisterNetEvent('evidence:server:UpdateStatus', function(data)
    playerStatus[source] = data
end)

RegisterNetEvent('evidence:server:CreateBloodDrop', function(citizenid, bloodtype, coords)
    local bloodId = generateId(bloodDrops)
    bloodDrops[bloodId] = {
        dna = citizenid,
        bloodtype = bloodtype
    }
    TriggerClientEvent('evidence:client:AddBlooddrop', -1, bloodId, citizenid, bloodtype, coords)
end)

RegisterNetEvent('evidence:server:CreateFingerDrop', function(coords)
    local player = exports.qbx_core:GetPlayer(source)
    local fingerId = generateId(fingerDrops)
    fingerDrops[fingerId] = player.PlayerData.metadata.fingerprint
    TriggerClientEvent('evidence:client:AddFingerPrint', -1, fingerId, player.PlayerData.metadata.fingerprint, coords)
end)

RegisterNetEvent('evidence:server:ClearBlooddrops', function(bloodDropList)
    if not bloodDropList or not next(bloodDropList) then return end
    for _, v in pairs(bloodDropList) do
        TriggerClientEvent('evidence:client:RemoveBlooddrop', -1, v)
        bloodDrops[v] = nil
    end
end)

RegisterNetEvent('evidence:server:AddBlooddropToInventory', function(bloodId, bloodInfo)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local playerName = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
    local streetName = bloodInfo.street
    local bloodType = bloodInfo.bloodtype
    local bloodDNA = bloodInfo.dnalabel
    local metadata = {}
    metadata.type = 'Blood Evidence'
    metadata.description = 'DNA ID: ' .. bloodDNA
    metadata.description = metadata.description .. '\n\nBlood Type: ' .. bloodType
    metadata.description = metadata.description .. '\n\nCollected By: ' .. playerName
    metadata.description = metadata.description .. '\n\nCollected At: ' .. streetName
    if not exports.ox_inventory:RemoveItem(src, 'empty_evidence_bag', 1) then
        return exports.qbx_core:Notify(src, locale('error.have_evidence_bag'), 'error')
    end
    if exports.ox_inventory:AddItem(src, 'filled_evidence_bag', 1, metadata) then
        TriggerClientEvent('evidence:client:RemoveBlooddrop', -1, bloodId)
        bloodDrops[bloodId] = nil
    end
end)

RegisterNetEvent('evidence:server:AddFingerprintToInventory', function(fingerId, fingerInfo)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local playerName = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
    local streetName = fingerInfo.street
    local fingerprint = fingerInfo.fingerprint
    local metadata = {}
    metadata.type = 'Fingerprint Evidence'
    metadata.description = 'Fingerprint ID: ' .. fingerprint
    metadata.description = metadata.description .. '\n\nCollected By: ' .. playerName
    metadata.description = metadata.description .. '\n\nCollected At: ' .. streetName
    if not exports.ox_inventory:RemoveItem(src, 'empty_evidence_bag', 1) then
        return exports.qbx_core:Notify(src, locale('error.have_evidence_bag'), 'error')
    end
    if exports.ox_inventory:AddItem(src, 'filled_evidence_bag', 1, metadata) then
        TriggerClientEvent('evidence:client:RemoveFingerprint', -1, fingerId)
        fingerDrops[fingerId] = nil
    end
end)

--[[ If you re-enable casings:
RegisterNetEvent('evidence:server:CreateCasing', function(weapon, serial, coords)
    local casingId = generateId(casings)
    local serieNumber = exports.ox_inventory:GetCurrentWeapon(source).metadata.serial
    if not serieNumber then
        serieNumber = serial
    end
    TriggerClientEvent('evidence:client:AddCasing', -1, casingId, weapon, coords, serieNumber)
end)
]]

-- *** UPDATED: cop count event uses broadcaster ***
RegisterNetEvent('police:server:UpdateCurrentCops', function()
    if updatingCops then return end
    updatingCops = true
    broadcastCopCount() -- computes and fires both client + server events
    updatingCops = false
end)

RegisterNetEvent('evidence:server:ClearCasings', function(casingList)
    if casingList and next(casingList) then
        for _, v in pairs(casingList) do
            TriggerClientEvent('evidence:client:RemoveCasing', -1, v)
            casings[v] = nil
        end
    end
end)

RegisterNetEvent('evidence:server:AddCasingToInventory', function(casingId, casingInfo)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local playerName = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
    local streetName = casingInfo.street
    local ammoType = casingInfo.ammolabel
    local serialNumber = casingInfo.serie
    local metadata = {}
    metadata.type = 'Casing Evidence'
    metadata.description = 'Ammo Type: ' .. ammoType
    metadata.description = metadata.description .. '\n\nSerial #: ' .. serialNumber
    metadata.description = metadata.description .. '\n\nCollected By: ' .. playerName
    metadata.description = metadata.description .. '\n\nCollected At: ' .. streetName
    if not exports.ox_inventory:RemoveItem(src, 'empty_evidence_bag', 1) then
        return exports.qbx_core:Notify(src, locale('error.have_evidence_bag'), 'error')
    end
    if exports.ox_inventory:AddItem(src, 'filled_evidence_bag', 1, metadata) then
        TriggerClientEvent('evidence:client:RemoveCasing', -1, casingId)
        casings[casingId] = nil
    end
end)

RegisterNetEvent('police:server:showFingerprint', function(playerId)
    TriggerClientEvent('police:client:showFingerprint', playerId, source)
    TriggerClientEvent('police:client:showFingerprint', source, playerId)
end)

RegisterNetEvent('police:server:showFingerprintId', function(sessionId)
    local player = exports.qbx_core:GetPlayer(source)
    local fid = player.PlayerData.metadata.fingerprint
    TriggerClientEvent('police:client:showFingerprintId', sessionId, fid)
    TriggerClientEvent('police:client:showFingerprintId', source, fid)
end)

RegisterNetEvent('police:server:SetTracker', function(targetId)
    local src = source
    if isTargetTooFar(src, targetId) then return end

    local target = exports.qbx_core:GetPlayer(targetId)
    if not exports.qbx_core:GetPlayer(src) or not target then return end

    local trackerMeta = target.PlayerData.metadata.tracker
    if trackerMeta then
        target.Functions.SetMetaData('tracker', false)
        exports.qbx_core:Notify(targetId, locale('success.anklet_taken_off'), 'success')
        exports.qbx_core:Notify(src,
            locale('success.took_anklet_from', target.PlayerData.charinfo.firstname, target.PlayerData.charinfo.lastname),
            'success')
        TriggerClientEvent('police:client:SetTracker', targetId, false)
    else
        target.Functions.SetMetaData('tracker', true)
        exports.qbx_core:Notify(targetId, locale('success.put_anklet'), 'success')
        exports.qbx_core:Notify(src,
            locale('success.put_anklet_on', target.PlayerData.charinfo.firstname, target.PlayerData.charinfo.lastname),
            'success')
        TriggerClientEvent('police:client:SetTracker', targetId, true)
    end
end)

AddEventHandler('onServerResourceStart', function(resource)
    if resource ~= 'ox_inventory' then return end

    local jobs = {}
    for k, v in pairs(exports.qbx_core:GetJobs()) do
        if v.type == 'leo' then
            jobs[k] = 0
        end
    end

    for i = 1, #sharedConfig.locations.trash do
        exports.ox_inventory:RegisterStash(('policetrash_%s'):format(i), 'Police Trash', 300, 4000000, nil, jobs,
            sharedConfig.locations.trash[i])
    end
    exports.ox_inventory:RegisterStash('policelocker', 'Police Locker', 100, 1000000, true)
end)

-- Threads
CreateThread(function()
    Wait(1000)
    for i = 1, #sharedConfig.locations.trash do
        exports.ox_inventory:ClearInventory(('policetrash_%s'):format(i))
    end
    while true do
        Wait(1000 * 60 * 10)
        -- prefer fast path if available
        local ok, curCops = pcall(function() return exports.qbx_core:GetDutyCountType('leo') end)
        if ok and type(curCops) == 'number' then
            broadcastCopCount(curCops)  -- fires client + server events
        else
            broadcastCopCount()         -- manual count fallback
        end
    end
end)

CreateThread(function()
    while true do
        Wait(10000)
        updateBlips()
    end
end)

-- ========= DNA SCANNER (server) =========
-- Qbox-compatible via qb-core export. Accepts citizenid or hex→ASCII.
-- Can also (optionally) look up offline players from DB.

local QBCore do
    local ok, core = pcall(function() return exports['qb-core']:GetCoreObject() end)
    if not ok or not core then
        error('[DNA] Could not get Core from qb-core. Ensure qb-core starts before this resource.')
    end
    QBCore = core
end

-- SETTINGS
local USE_OFFLINE = false   -- set to true if you enable oxmysql in fxmanifest and have a matching schema
local LOG_DEBUG   = false

-- Gate: must be on-duty police
local function isCallerOnDutyPolice(src)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.PlayerData then return false end
    local PD = Player.PlayerData

    local j = PD.job
    if j and (j.name == 'police' or j.id == 'police') and (j.onduty or j.onDuty) then
        return true
    end
    local jobs = PD.jobs
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

-- Try to decode key if it looks like hex
local function hexToAsciiMaybe(s)
    if type(s) ~= 'string' then return nil end
    local hex = s:gsub('^%s+',''):gsub('%s+$',''):gsub('^0x','')
    if hex == '' or (#hex % 2 ~= 0) then return nil end
    if not hex:match('^[0-9A-Fa-f]+$') then return nil end
    local t = {}
    for i = 1, #hex, 2 do
        local b = tonumber(hex:sub(i, i+1), 16)
        if not b then return nil end
        t[#t+1] = string.char(b)
    end
    return table.concat(t)
end

-- Online resolution: citizenid (string), or numeric "state id" if your framework stores it
local function resolveOnlineByKey(key)
    -- 1) citizenid (string)
    local P = exports.qbx_core:GetPlayerByCitizenId(key)
    if P then return P end
    return exports.qbx_core:GetOfflinePlayer(key)
    -- -- 2) numeric "State ID" (try common places)
    -- if key:match('^%d+$') then
    --     local players = QBCore.Functions.GetQBPlayers and QBCore.Functions.GetQBPlayers() or {}
    --     for _, P2 in pairs(players) do
    --         local PD = P2.PlayerData
    --         if PD.cid and tostring(PD.cid) == key then return P2 end
    --         if PD.metadata and PD.metadata.cid and tostring(PD.metadata.cid) == key then return P2 end
    --         if PD.charinfo and PD.charinfo.id and tostring(PD.charinfo.id) == key then return P2 end
    --     end
    -- end
end

-- OFFLINE DB (optional): by citizenid; add a 'cid' path if your schema has it
local function resolveOfflineByKey(key)
    if not USE_OFFLINE or not MySQL or not MySQL.single then return nil end

    -- citizenid exact match
    local row = MySQL.single.await(
        'SELECT citizenid, charinfo, job, jobs FROM players WHERE citizenid = ? LIMIT 1',
        { key }
    )
    if row then return row, 'citizenid' end

    -- If you have a numeric cid column, uncomment:
    -- if key:match('^%d+$') then
    --     local row2 = MySQL.single.await(
    --         'SELECT citizenid, charinfo, job, jobs FROM players WHERE cid = ? LIMIT 1',
    --         { tonumber(key) }
    --     )
    --     if row2 then return row2, 'cid' end
    -- end

    return nil
end

local function toClientBlobFromDB(row)
    local okC, charinfo = pcall(function()
        return type(row.charinfo) == 'string' and json.decode(row.charinfo) or row.charinfo
    end)
    if not okC then charinfo = {} end

    local okJ, job = pcall(function()
        return type(row.job) == 'string' and json.decode(row.job) or row.job
    end)
    if not okJ then job = nil end

    local okJS, jobs = pcall(function()
        return type(row.jobs) == 'string' and json.decode(row.jobs) or row.jobs
    end)
    if not okJS then jobs = nil end

    local firstname = (charinfo and charinfo.firstname) or 'Unknown'
    local lastname  = (charinfo and charinfo.lastname)  or ''
    local phone     = (charinfo and (charinfo.phone or charinfo.phone_number)) or 'N/A'

    local jobName = 'unemployed'
    if jobs and type(jobs) == 'table' then
        for _, j in pairs(jobs) do
            if j and (j.onduty or j.primary) then jobName = j.name or jobName break end
            jobName = j.name or jobName
        end
    elseif job then
        jobName = job.name or jobName
    end

    return {
        name  = (firstname .. ' ' .. lastname):gsub('%s+$',''),
        cid   = row.citizenid,
        job   = jobName,
        phone = phone,
        offline = true
    }
end

RegisterNetEvent('police:checkDNAResult', function(key)
    local src = source
    key = tostring(key or ''):gsub('^%s+',''):gsub('%s+$','')
    if key == '' then
        if LOG_DEBUG then print('[DNA][SERVER] empty key from client') end
        TriggerClientEvent('police:dnaInvalid', src)
        return
    end

    -- gate
    if not isCallerOnDutyPolice(src) then
        if LOG_DEBUG then print('[DNA][SERVER] rejected: caller not on-duty police') end
        return
    end

    -- accept hex or plain text
    local decoded = hexToAsciiMaybe(key)
    if decoded and decoded ~= '' then
        if LOG_DEBUG then print(("[DNA][SERVER] key looked like hex; decoded '%s' -> '%s'"):format(key, decoded)) end
        key = decoded
    else
        if LOG_DEBUG then print(("[DNA][SERVER] using key as-is: '%s'"):format(key)) end
    end

    -- ONLINE
    local P = resolveOnlineByKey(key)
    if P and P.PlayerData then
        local PD = P.PlayerData
        local blob = {
            name  = (PD.charinfo and PD.charinfo.firstname or 'Unknown') .. ' ' .. (PD.charinfo and PD.charinfo.lastname or ''),
            cid   = PD.citizenid,
            job   = (PD.job and PD.job.name) or 'unemployed',
            phone = (PD.charinfo and (PD.charinfo.phone or PD.charinfo.phone_number)) or 'N/A',
            offline = false,
        }
        if LOG_DEBUG then
            print(("[DNA][SERVER] ONLINE match -> citizenid=%s name=%s"):format(blob.cid, blob.name))
        end
        TriggerClientEvent('police:showDNAResult', src, blob)
        return
    end

    -- OFFLINE (optional)
    local row, matchedOn = resolveOfflineByKey(key)
    if row then
        local blob = toClientBlobFromDB(row)
        if LOG_DEBUG then
            print(("[DNA][SERVER] OFFLINE match on %s -> citizenid=%s name=%s"):format(matchedOn, blob.cid, blob.name))
        end
        TriggerClientEvent('police:showDNAResult', src, blob)
        return
    end

    if LOG_DEBUG then print('[DNA][SERVER] no match online/offline') end
    TriggerClientEvent('police:dnaInvalid', src)
end)
-- ========= /DNA SCANNER (server) =========

-- Register a server callback
lib.callback.register('police:server:isCopDead', function(source, targetId)
    local target = exports.qbx_core:GetPlayer(targetId)
    if not target then return false end
    return (target.PlayerData.metadata['isdead']) and (target.PlayerData.job.name == 'police')
end)

