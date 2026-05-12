local zones = {}

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent(Config.Core.name..':Notify', notification, notificationType, duration)
        end
    end

    function HasItem(item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(item) > 0
        else
            return QBCore.Functions.HasItem(item)
        end
    end

    function Progressbar(name, label, duration, success, fail, icon)
        if Config.Progressbar == "ox" then
            if lib.progressCircle({
                duration = duration,
                position = 'bottom',
                useWhileDead = false,
                label = label,
                canCancel = false,
                disable = {car = true},
                anim = {},
                prop = {},
            }) then success() else fail() end
        else
            QBCore.Functions.Progressbar(name, label, duration, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {}, {}, {}, success, fail, icon)
        end
    end

    RegisterNetEvent(Config.Core.name..':Client:OnPlayerUnload', function()
        TriggerEvent('projectx-paletobankrobbery-k4mb1:client:Logout')
    end)
elseif Config.Framework == "esx" then -- ESX
    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent('esx:showNotification', notification, notificationType, duration)
        end
    end

    function HasItem(item)
        local p = promise.new()
        if Config.Inventory == "ox" then return exports.ox_inventory:GetItemCount(item) > 0 end
        lib.callback('projectx-paletobankrobbery-k4mb1:server:hasitem', false, function(result)
            p:resolve(result)
        end, item)
        return Citizen.Await(p)
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if lib.progressCircle({
            duration = duration,
            position = 'bottom',
            useWhileDead = false,
            label = label,
            canCancel = false,
            disable = {car = true},
            anim = {},
            prop = {},
        }) then success() else fail() end
    end
    
    RegisterNetEvent('projectx-paletobankrobbery-k4mb1:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Paleto Bank Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        TriggerEvent('projectx-paletobankrobbery-k4mb1:client:Logout')
    end)
else -- Custom Framework

end

function CreateCircleZones(name, coords, size, event, icon, label, distance, param, param2, param3, param4)
    if not Config.WorldInteract then
        if Config.Target == "ox_target" then
            exports.ox_target:addSphereZone({
                name = name,
                coords = coords,
                radius = size,
                debug = Config.debug,
                drawSprite = true,
                options =
                {{
                    icon = icon,
                    label = label,
                    distance = distance,
                    onSelect = event,
                }}
            })
        else
            exports[Config.Target]:AddCircleZone(name, coords, size, {name = name, debugPoly = Config.debug, useZ=true},
                {
                options = {
                    {
                        name = name,
                        type = "client",
                        action = event,
                        icon = icon,
                        label = label,
                        coords = coords,
                    }
                },
                distance = distance
            })
        end
    else
        exports.interact:AddInteraction({
            coords = coords,
            distance = 3.0,
            interactDst = distance, -- optional
            id = name, -- needed for removing interactions
            name = name, -- optional
            options = {
                {
                    label = label,
                    action = function()
                        TriggerEvent(event, param, param2, param3, param4)
                    end,
                },
            }
        })
    end
end

function CircleZoneDestroy(name)
    if Config.WorldInteract then return exports.interact:RemoveInteraction(name) end
    if Config.Target == "ox_target" then exports.ox_target:removeZone(name) else exports[Config.Target]:RemoveZone(name) end
end

function drawTextUi(bool, text)
    if Config.Drawtext == "OX" then
        if bool then lib.showTextUI(text) else lib.hideTextUI() end
    elseif Config.Drawtext == "QB" then
        if bool then exports[Config.Core.abbrev..'-core']:DrawText(text) else exports[Config.Core.abbrev..'-core']:HideText() end
    elseif Config.Drawtext == "OLDQB" then
        if bool then exports[Config.Core.abbrev..'-drawtext']:DrawText(text) else exports[Config.Core.abbrev..'-drawtext']:HideText() end    
    end
end

function zoneDestroy(name)
    for k, v in pairs(zones) do
        if v.name == name then
            zones[k]:remove()
            table.remove(zones, k)
        end
    end
end

function zoneCreate(name, coords, size, rotation, onEnter, onExit)
    zones[#zones + 1] = lib.zones.box({
        name = name,
        coords = coords,
        size = size,
        rotation = rotation,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function OnEvidence(pos, chance)
    if math.random(1, 100) > chance then return end
    TriggerServerEvent('evidence:server:CreateFingerDrop', pos)
end

function Stress(chance)
    TriggerServerEvent('hud:server:GainStress', chance)
end

function Dispatch()
    local coords = GetEntityCoords(PlayerPedId())
    if Config.Dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', 'sheriff'}, 
            coords = data.coords,
            title = '10-15 - Paleto Bank Robbery',
            message = 'A '..data.sex..' robbing a bank at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Paleto Bank Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "origen" then
        TriggerServerEvent("SendAlert:police", {
            coords = vector3(0, 0, 0),
            title = 'Paleto Bank Robbery',
            type = 'GENERAL',
            message = 'Paleto bank is being robbed',
            job = 'police',
        })
    elseif Config.Dispatch == "tk" then
        exports['tk_dispatch']:addCall({
            title = 'Paleto Bank Robbery',
            code = '10-58',
            priority = 'Priority 3',
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = 3,
                sprite = 357,
                scale = 1.0,
            },
            jobs = {'police'}
        })
    elseif Config.Dispatch == "rcore" then
        local player_data = exports['rcore_dispatch']:GetPlayerData()
        local data = {
            code = '10-35 Paleto Bank Robbery', 
            default_priority = 'medium',
            coords = player_data.coords,
            job = 'police',
            text = 'Paleto Bank Robbery!',
            type = 'alert',
            blip_time = 5,
            blip = {
                sprite = 272, 
                colour = 3,
                scale = 0.7,
                text = 'Paleto Bank Robbery', 
                flashes = false,
                radius = 0,
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config.Dispatch == "outlaw" then
        local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Paleto Bank Robbery'}
        local dispatchData = {dispatchData = data, caller = 'Alarm', coords = coords}
        TriggerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Dispatch == "codem" then
        local Data = {
            type = 'Robbery',
            header = 'Robbery in progress',
            text = 'Paleto Bank Robbery in progress',
            code = '10-54',
        }
        exports['codem-dispatch']:CustomDispatch(Data)
    elseif Config.Dispatch == "qs" then
        exports['qs-dispatch']:PaletoBankRobbery()
    elseif Config.Dispatch == "ps" then
        exports['ps-dispatch']:PaletoBankRobbery()
    else
        if Config.Framework == "esx" then
            TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:PdNotify')
            -- (ESX) Add your disptach script here if it's none of the above and remove the line above this one
        else
            -- (Qbcore) Add your disptach script here if it's none of the above
        end
    end
end

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("projectx-paletobankrobbery-k4mb1:client:AddExperience", function(exp)
    -- add exp function here and insert exp as a parameter
end)

function CheckExpLevel()
    -- Add "return" then add your check exp level function here
end

--------------------- Minigames ---------------------
------ You can return true to skip a minigame -------
-----------------------------------------------------
function FuseboxMinigame()
    local p = promise.new()
    exports['boii_minigames']:wire_cut({style = 'default', timer = 60000}, function(success)
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function EmployeeDoorMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleShake(1, 50, 4)
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function VentMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleProgress(1, 50)
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function BackDoorFuseboxMinigame()
    local p = promise.new()
    exports['boii_minigames']:wire_cut({style = 'default', timer = 60000}, function(success)
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function OfficeDoorMinigame()
    local p = promise.new()
    exports['boii_minigames']:pincode({style = 'default', difficulty = 1, guesses = 10}, function(success)
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function KeyMinigame()
    local p = promise.new()
    local success = exports['SN-Hacking']:SkillBar({2000, 3000}, 10, 2) --SkillBar(duration(milliseconds or table{min(milliseconds), max(milliseconds)}), width%(number), rounds(number))
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function SecurityDoorMinigame()
    return true
end

function OfficeSearchMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:KeySpam(2, 50)
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function PuzzleMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:Progress(4, 50)
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function ElectricBoxMinigame()
    local p = promise:new()
    local success = exports['SN-Hacking']:SkillBar({2000, 3000}, 10, 2)
    p:resolve(success)
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    return Citizen.Await(p)
end

function VaultGateMinigame()
    local p = promise.new()
    local success = exports['SN-Hacking']:Mines(5, 5, 3, 1)
    -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function MainComputerMinigame(Step)
    local p = promise.new()
    if Step == "MainComputer1" then
        exports['boii_minigames']:chip_hack({style = 'default', loading_time = 8000, chips = 2, timer = 20000}, function(success)
            -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
            p:resolve(success)
        end)
    elseif Step == "MainComputer2" then
        local success = exports['SN-Hacking']:MemoryCards('medium') --MemoryCards(difficulty(easy, medium, hard), rounds(number))
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    elseif Step == "MainComputer3" then
        local success = exports['SN-Hacking']:Thermite(7, 12, 10000, 2, 2, 3000)
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end
    return Citizen.Await(p)
end

function OfficeComputerMinigame(Step)
    local p = promise.new()
    if Step == "OfficeComputerRight2" then
        local success = exports['SN-Hacking']:Thermite(7, 10, 10000, 2, 2, 3000)
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    elseif Step == "OfficeComputerLeft1" then
        exports['boii_minigames']:chip_hack({style = 'default', loading_time = 8000, chips = 2, timer = 20000}, function(success)
            -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
            p:resolve(success)
        end)
    elseif Step == "OfficeComputerLeft2" then
        local gameData = {totalNumbers = 20, seconds = 20, timesToChangeNumbers = 4, amountOfGames = 1, incrementByAmount = 5}
        local success = exports['pure-minigames']:numberCounter(gameData)
        -- if success then TriggerServerEvent('projectx-paletobankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end
    return Citizen.Await(p)
end

function SmallVaultMinigame()
    TriggerEvent('decrypto-edit:client:starthack')
    -- Use this instead if you wanna skip the minigame for testing -- TriggerEvent('projectx-paletobankrobbery:client:VaultHack', true)

    -- If you want to change this minigame, you have to use those 2 events below for it to function, true for success and false for failure
    -- TriggerEvent('projectx-paletobankrobbery:client:VaultHack', true)
    -- TriggerEvent('projectx-paletobankrobbery:client:VaultHack', false)
end