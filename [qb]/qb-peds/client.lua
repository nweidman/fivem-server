local QBCore = exports['qb-core']:GetCoreObject()

local function IsAllowListed() 
    local pCid = QBCore.Functions.GetPlayerData().citizenid
    local allowed = false

    for i=1, #Config.Allowedlisted do
        if pCid == Config.Allowedlisted[i] then
            allowed = true
            break
        end
    end

    return allowed
end

local function SetPlayerPed(pedmodel)
    local hash = GetHashKey(pedmodel)
    RequestModel(hash)
    while not HasModelLoaded(hash) or not IsModelInCdimage(hash) do
        RequestModel(hash)
        Citizen.Wait(4)
    end
    SetPlayerModel(PlayerId(), hash)
    QBCore.Functions.TriggerCallback('checkifnew', function(cb)
        if cb then
            TriggerEvent("crm-appearance:load-player-skin")
            -- SetPedDefaultComponentVariation(PlayerPedId())
        else
            SetPedDefaultComponentVariation(PlayerPedId())
        end
    end)
    local PlayerData = QBCore.Functions.GetPlayerData()
    SetPedArmour(PlayerPedId(), PlayerData.metadata.armor)
    SetModelAsNoLongerNeeded(hash)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(3000)
    QBCore.Functions.TriggerCallback('checkpedif', function(cb)
        SetPlayerPed(cb)
    end)
end)

RegisterCommand('pedmenu', function(count)
    if IsAllowListed() then
        QBCore.Functions.TriggerCallback('getpedamount', function(cb)
            local pedname = exports['qb-input']:ShowInput({
                header = 'Available Peds : ' .." " .."" ..cb,
                submitText = 'Change Ped',
                inputs = {
                    {
                        type = 'text',
                        isRequired = true,
                        name = 'amount',
                        text = 'Ped Name e.a: a_f_y_eastsa_03' 
                }
                }

            })

            if cb > 0 then
                
                TriggerServerEvent('changeped' , pedname.amount)
                TriggerServerEvent("deletecount")
                SetPlayerPed(pedname.amount)
            else
                
                QBCore.Functions.Notify("Not Enough ", "error")

            end
        end)
    else
        QBCore.Functions.Notify("You are not authorized to use this command!", "error")
    end
end)

