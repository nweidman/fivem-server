while Framework == nil do Wait(5) end

Fr.RegisterServerCallback('op-crime:startMission', function(source, cb, missionIndex)
    local playerObject = playersJobs[Fr.GetIndentifier(source)]
    local playerOrg = organisations[tostring(playerObject.jobId)]

    if playerObject then
        if organisations and playerOrg then
            if playerOrg.missions[missionIndex] then
                if playerOrg.missions[missionIndex].startedBy == "" then
                    playerOrg.missions[missionIndex].startedBy = Fr.GetPlayerName(source)
                    playerOrg.missions[missionIndex].status = "started"

                    organisations[tostring(playerObject.jobId)] = playerOrg
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

Fr.RegisterServerCallback('op-crime:sellDrugs', function(source, cb)
    local playerObject = playersJobs[Fr.GetIndentifier(source)]
    local playerOrg = organisations[tostring(playerObject.jobId)]

    if playerObject and playerOrg then 
        local xPlayer = Fr.getPlayerFromId(source)
        if xPlayer then 
            local inventory = Fr.getInventory(xPlayer)
            local missionCfg = Config.Missions['drug_sell_npc']

            if not missionCfg then return cb(false) end
            
            local canProceed = false
            for k, v in pairs(inventory) do
                if v.name == 'bagofweed' or v.name == 'bagofmeth' or v.name == 'bagofcoke' or v.name == 'ls_plain_jane_bag' or v.name == 'ls_banana_kush_bag' or v.name == 'ls_blue_dream_bag' or v.name == 'ls_purple_haze_bag' or v.name == 'ls_orange_crush_bag' or v.name == 'ls_cosmic_kush_bag' or v.name == 'kq_meth_low' or v.name == 'kq_meth_mid' or v.name == 'kq_meth_high' or v.name == 'oxy' or v.name == 'purebagofweed' or v.name == 'purebagofmeth' or v.name == 'purebagofcoke' then
                    local count = v.amount or v.count
                    if count >= 50 then
                        canProceed = true
                        Fr.removeItem(xPlayer, v.name, 50)
                        break;
                    end
                end
            end

            cb(canProceed)
        end
    end
end)

RegisterServerEvent('op-crime:endMission')
AddEventHandler('op-crime:endMission', function(missionIndex)
    local playerObject = playersJobs[Fr.GetIndentifier(source)]
    local playerOrg = organisations[tostring(playerObject.jobId)]

    if playerObject then
        if organisations and playerOrg then
            if playerOrg.missions[missionIndex] then
                if playerOrg.missions[missionIndex].status == "started" then
                    playerOrg.missions[missionIndex].status = "done"
                    organisations[tostring(playerObject.jobId)] = playerOrg

                    for k, v in pairs(playerOrg.missions[missionIndex].UI.missionReward) do 
                        assignReward(v, playerObject.jobId, source)
                    end
                    
                    addOrgExp(playerObject.jobId, playerOrg.missions[missionIndex].UI.missionExp)
                    addOrgDoneMissions(playerObject.jobId)
                end
            end
        end
    end
end)