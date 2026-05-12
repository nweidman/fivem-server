local QBCore = exports['qb-core']:GetCoreObject()
Config = {}
local OwnedLockerBlips = {}
local currentLocker, lockerName

Citizen.CreateThread(function() --add an onplayer loaded for blips and config fetch as well as this thread
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
        Citizen.Wait(100) 
    end
    TriggerEvent('shanks-storagelockers:client:FetchConfig')
    TriggerEvent('shanks-storagelockers:client:setupBlips')
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('shanks-storagelockers:client:FetchConfig')
    TriggerEvent('shanks-storagelockers:client:setupBlips')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(OwnedLockerBlips) do
        RemoveBlip(v)
    end
end)

RegisterNetEvent('shanks-storagelockers:client:FetchConfig')
AddEventHandler('shanks-storagelockers:client:FetchConfig', function()
    QBCore.Functions.TriggerCallback("shanks-storagelockers:server:FetchConfig", function(lockers)
        Config.Lockers = lockers
    end)
end)

RegisterNetEvent('shanks-storagelockers:client:setupBlips')
AddEventHandler('shanks-storagelockers:client:setupBlips', function()
    for k, v in pairs(OwnedLockerBlips) do
        RemoveBlip(v)
    end
    QBCore.Functions.TriggerCallback('shanks-storagelockers:server:getOwnedLockers', function(ownedLockers)
        if ownedLockers ~= nil then
            for k, v in pairs(ownedLockers) do
                local locker = Config.Lockers[v]['coords']
                local lockerBlip = AddBlipForCoord(locker.x, locker.y, locker.z)
                SetBlipSprite (lockerBlip, 50)
                SetBlipDisplay(lockerBlip, 4)
                SetBlipScale  (lockerBlip, 0.45)
                SetBlipAsShortRange(lockerBlip, true)
                SetBlipColour(lockerBlip, 3)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName("Storage Locker")
                EndTextCommandSetBlipName(lockerBlip)
                table.insert(OwnedLockerBlips, lockerBlip)
            end
        end
    end)
end)

Citizen.CreateThread(function() 
    while true do
        sleep = 1000
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            if Config.Lockers ~= nil then
                for k, v in pairs(Config.Lockers) do
                    local dist = #(pos - vector3(v["coords"].x, v["coords"].y, v["coords"].z))
                    if dist < 1.5 then
                        currentLocker = v
                        lockerName = k
                        sleep = 5
                        DrawText3D(v["coords"].x, v["coords"].y, v["coords"].z, "~g~E~w~ - To use locker")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("shanks-storagelockers:client:interact", k, v)
                        end
                    end
                end
            end
    Wait(sleep)
    end
end)

RegisterNetEvent("shanks-storagelockers:client:interact")
AddEventHandler("shanks-storagelockers:client:interact", function(k, v)
    local lockername = k
    local lockertable = v
    local citizenid = QBCore.Functions.GetPlayerData().citizenid
    PlayerJob = QBCore.Functions.GetPlayerData().job

    local options = {}

    if not lockertable["isOwned"] then
        options[#options+1] = {
            title = 'Purchase',
            description = "Purchase Locker for $" .. v.price,
            event = "shanks-storagelockers:client:purchase",
            icon = 'fa-solid fa-dollar-sign'
        }
    elseif lockertable["isOwned"] then
        options[#options+1] = {
            title = 'Open Locker',
            event = "shanks-storagelockers:client:openLocker",
            icon = 'fa-solid fa-unlock'
        }
    end 

    if lockertable["owner"] == citizenid then
        options[#options+1] = {
            title = "Change Password",
            event = "shanks-storagelockers:client:changePasscode",
            icon = 'fa-solid fa-key'
        }

        options[#options+1] = {
            title = "Sell Locker",
            event = "shanks-storagelockers:client:sellLocker",
            icon = 'fa-solid fa-dollar-sign',
            iconColor = 'red',
            args = {
                lockername = lockername,
                lockertable = lockertable
            }
        }
    end

    if PlayerJob.name == "police" or PlayerJob.name == "sheriff" then
        options[#options+1] = {
            title = "Raid Locker",
            event = "shanks-storagelockers:client:raidLocker",
            icon = 'fa-solid fa-handcuffs',
            args = {
                lockername = lockername,
                lockertable = lockertable
            }
        }
    end

    lib.registerContext({
        id='lockerMenu',
        title = "Locker - "..lockername,
        options = options
    })

    lib.showContext('lockerMenu')
end)

RegisterNetEvent('shanks-storagelockers:client:sellLocker')
AddEventHandler('shanks-storagelockers:client:sellLocker', function(data)
    TriggerServerEvent('shanks-storagelockers:server:sellLocker', data.lockername, data.lockertable)
end)

RegisterNetEvent('shanks-storagelockers:client:changePasscode')
AddEventHandler('shanks-storagelockers:client:changePasscode', function()
    SendNUIMessage({
        type = "changePasscode",
        action = "openKeypad",
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('shanks-storagelockers:client:raidLocker')
AddEventHandler('shanks-storagelockers:client:raidLocker', function(data)
    -- QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if QBCore.Functions.HasItem('police_stormram') then
            --add progressbar/animation
            -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', "locker_"..data.lockername, {
            --     maxweight = data.lockertable["capacity"],
            --     slots = data.lockertable["slots"],
            -- })
            -- TriggerEvent('inventory:client:SetCurrentStash', "locker_"..data.lockername)
            -- TriggerServerEvent('md-stashes:server:OpenStash', "locker_"..data.lockername, data.lockertable["capacity"], data.lockertable["slots"])
            exports.ox_inventory:openInventory('stash', "locker_"..data.lockername)
            TriggerServerEvent('shanks-storage:raidLocker', "locker_"..data.lockername, true)
        else
            QBCore.Functions.Notify("You don't have a Stormram on you..", "error")
        end
    -- end, 'police_stormram' )
end)

RegisterNetEvent('shanks-storagelockers:client:purchase') --trigger event after nh-context purchase button. Set password which then starts the buying process
AddEventHandler('shanks-storagelockers:client:purchase', function()
    --add the money check here instead
    QBCore.Functions.Notify("Please set a password")
    SendNUIMessage({
        type = "create",
        action = "openKeypad",
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('shanks-storagelockers:client:openLocker') --trigger event after nh-context open locker button. Opens the password UI for the locker
AddEventHandler('shanks-storagelockers:client:openLocker', function()
    SendNUIMessage({
        type = "attempt",
        action = "openKeypad",
    })
    SetNuiFocus(true, true)
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end 

RegisterNUICallback('PadLockClose', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("CombinationSound", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('UseCombination', function(data, cb)
    if data.type == 'attempt' then
        QBCore.Functions.TriggerCallback('shanks-storagelockers:server:getData', function(combination)
            if tonumber(data.combination) ~= nil then
                if tonumber(data.combination) == tonumber(combination) then
                    SetNuiFocus(false, false)
                    SendNUIMessage({
                        action = "closeKeypad",
                        error = false,
                    })

                    --takeAnim()
                    -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', "locker_"..lockerName, {
                    --     maxweight = currentLocker["capacity"],
                    --     slots = currentLocker["slots"],
                    -- })
                    -- TriggerEvent('inventory:client:SetCurrentStash', "locker_"..lockerName)
                    -- TriggerServerEvent('md-stashes:server:OpenStash', "locker_"..lockerName, currentLocker["capacity"], currentLocker["slots"])
                    -- TriggerServerEvent('shanks-storagelockers:OpenStash', "locker_"..lockerName, currentLocker["capacity"], currentLocker["slots"])
                    exports.ox_inventory:openInventory('stash', "locker_"..lockerName)
                    TriggerServerEvent('shanks-storage:lockerAttemptLog', "locker_"..lockerName, true)
                else
                    QBCore.Functions.Notify("Incorrect Password", 'error')
                    SetNuiFocus(false, false)
                    SendNUIMessage({
                        action = "closeKeypad",
                        error = true,
                    })

                    TriggerServerEvent('shanks-storage:lockerAttemptLog', "locker_"..lockerName, false)
                end
            end        
        end, lockerName, 'password') 
    elseif data.type == 'create' then
        SendNUIMessage({
            action = "closeKeypad",
            error = false,
        })
        if data.combination ~= nil then
            QBCore.Functions.TriggerCallback('shanks-storagelockers:server:purchaselocker', function(bankmoney)
                if bankmoney >= currentLocker.price then
                    TriggerServerEvent("shanks-storagelockers:server:createPassword", data.combination, lockerName)
                    TriggerEvent('shanks-storagelockers:client:FetchConfig')
                    QBCore.Functions.Notify("You have purchased this locker","success")
                end
            end, currentLocker, lockerName)
        end
    elseif data.type == 'changePasscode' then
        SendNUIMessage({
            action = "closeKeypad",
            error = false,
        })
        if data.combination ~= nil then
            TriggerServerEvent("shanks-storagelockers:server:changePasscode", data.combination, lockerName, currentLocker)
        end
    end
end)