local QBCore = exports['qb-core']:GetCoreObject()

local function getStatus(ply)
    local md = ply.PlayerData and ply.PlayerData.metadata or {}
    if md.isdead then return 'isDead' end
    if md.inlaststand then return 'isInlaststand' end
    return nil
end

-- Build a downed list, optionally filtering by distance to 'center' within 'radius'
lib.callback.register('dk:getDownedPlayers', function(src, opts)
    opts = opts or {}
    local center = opts.center -- table {x=,y=,z=} or nil
    local radius = tonumber(opts.radius or 0.0) or 0.0

    local results = {}

    for _, id in pairs(QBCore.Functions.GetPlayers()) do
        if id ~= src then
            local ply = QBCore.Functions.GetPlayer(id)
            if ply then
                local status = getStatus(ply)
                if status then
                    local include = true
                    local dist

                    if center and radius > 0.0 then
                        local ped = GetPlayerPed(id)
                        if ped ~= 0 then
                            local pc = GetEntityCoords(ped)
                            local dx = pc.x - center.x
                            local dy = pc.y - center.y
                            local dz = pc.z - center.z
                            dist = math.sqrt(dx*dx + dy*dy + dz*dz)
                            include = dist <= radius
                        end
                    end

                    if include then
                        results[#results+1] = {
                            status = status,
                            distance = dist and (math.floor(dist * 10) / 10) or nil,
                            PlayerData = {
                                source = id,
                                charinfo = ply.PlayerData and ply.PlayerData.charinfo or {}
                            }
                        }
                    end
                end
            end
        end
    end

    table.sort(results, function(a, b)
        return (a.distance or math.huge) < (b.distance or math.huge)
    end)

    return results
end)

local function canAfford(ply, amount, moneyType)
    if amount <= 0 then return true end
    local wallet = (ply.PlayerData.money and ply.PlayerData.money[moneyType]) or 0
    return wallet >= amount
end

local function pay(payer, receiver, amount, moneyType)
    if amount <= 0 then return true end
    if not canAfford(payer, amount, moneyType) then return false end

    payer.Functions.RemoveMoney(moneyType, amount, 'illegal-doctor-fee')

    if receiver then
        local cut = math.floor(amount * (Config.Economy.doctorCut or 1.0))
        if cut > 0 then
            receiver.Functions.AddMoney(moneyType, cut, 'illegal-doctor-payout')
        end
    end

    return true
end

RegisterNetEvent('dk:server:RevivePlayer', function(doctorSid, payload)
    local docSrc = source
    local doctor  = QBCore.Functions.GetPlayer(docSrc)
    if not doctor then return end

    if type(payload) ~= 'table' then return end
    local targetSrc = tonumber(payload.PlayerData and payload.PlayerData.source or 0)
    local status    = payload.status
    if not targetSrc or targetSrc <= 0 then return end

    local patient = QBCore.Functions.GetPlayer(targetSrc)
    if not patient then return end

    -- Validate patient is still down
    local currentStatus = getStatus(patient)
    if not currentStatus then
        TriggerClientEvent('ox_lib:notify', docSrc, { type = 'warning', description = Config.Lang.NOT_DOWN or 'Not down.' })
        return
    end

    -- Compute cost (self vs other)
    local isSelf = (docSrc == targetSrc)
    local cost = 0
    if isSelf then
        cost = Config.PayAmount.Self or 0
    else
        if status == 'isDead' then cost = Config.PayAmount.Isdead or 0
        elseif status == 'isInlaststand' then cost = Config.PayAmount.IsInlaststand or 0
        end
    end

    local moneyType  = Config.Economy.moneyType or 'cash'
    local payDoctor  = Config.Economy.payDoctor ~= false
    local receiver   = payDoctor and doctor or nil
    local payer      = patient

    -- Attempt payment
    if cost > 0 then
        if not pay(payer, receiver, cost, moneyType) then
            TriggerClientEvent('ox_lib:notify', docSrc,    { type = 'error',   description = Config.Lang.PAID_FAIL })
            TriggerClientEvent('ox_lib:notify', targetSrc, { type = 'error',   description = Config.Lang.PAID_FAIL })
            return
        else
            TriggerClientEvent('ox_lib:notify', docSrc,    { type = 'success', description = Config.Lang.PAID_OK })
            TriggerClientEvent('ox_lib:notify', targetSrc, { type = 'inform',  description = Config.Lang.YOU_PAID })
            if payDoctor then
                TriggerClientEvent('ox_lib:notify', docSrc, { type = 'inform', description = Config.Lang.YOU_EARNED })
            end
        end
    end

    -- Progress on patient
    TriggerClientEvent('dk:client:startProgress', targetSrc, (Config.HealWaitTime * 1000), Config.Lang.DR_RECOVERING)

    -- Delay, then revive (if still down)
    SetTimeout((Config.HealWaitTime * 1000) + 100, function()
        local patAgain = QBCore.Functions.GetPlayer(targetSrc)
        if not patAgain then return end
        local stillDown = getStatus(patAgain)
        if not stillDown then return end

        TriggerClientEvent(Config.ReviveEvent, targetSrc, true)
    end)
end)
