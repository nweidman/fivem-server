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
        TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:Logout')
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
        lib.callback('projectx-pacificbankrobbery-k4mb1:server:hasitem', false, function(name)
            p:resolve(name)
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
    
    RegisterNetEvent('projectx-pacificbankrobbery-k4mb1:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Pacific Bank Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)
    
    RegisterNetEvent('esx:onPlayerLogout', function()
        TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:Logout')
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
            job_table = {'police', 'sheriff' }, 
            coords = data.coords,
            title = '10-15 - Pacific Bank Robbery',
            message = 'A '..data.sex..' robbing a bank at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Pacific Bank Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "origen" then
        TriggerServerEvent("SendAlert:police", {
            coords = vector3(0, 0, 0),
            title = 'Pacific Bank Robbery',
            type = 'GENERAL',
            message = 'Pacific bank is being robbed',
            job = 'police',
        })
    elseif Config.Dispatch == "tk" then
        exports['tk_dispatch']:addCall({
            title = 'Pacific Bank Robbery',
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
            code = '10-35 Pacific Bank Robbery', 
            default_priority = 'medium',
            coords = player_data.coords,
            job = 'police',
            text = 'Pacific Bank Robbery!',
            type = 'alert',
            blip_time = 5,
            blip = {
                sprite = 272, 
                colour = 3,
                scale = 0.7,
                text = 'Pacific Bank Robbery', 
                flashes = false,
                radius = 0,
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config.Dispatch == "outlaw" then
        local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Pacific Bank Robbery'}
        local dispatchData = {dispatchData = data, caller = 'Alarm', coords = coords}
        TriggerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Dispatch == "codem" then
        local Data = {
            type = 'Robbery',
            header = 'Robbery in progress',
            text = 'Pacific Bank Robbery in progress',
            code = '10-54',
        }
        exports['codem-dispatch']:CustomDispatch(Data)
    elseif Config.Dispatch == "qs" then
        exports['qs-dispatch']:PacificBankRobbery()
    elseif Config.Dispatch == "ps" then
        exports['ps-dispatch']:PacificBankRobbery()
    else
        if Config.Framework == "esx" then
            TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:PdNotify')
            -- (ESX) Add your disptach script here if it's none of the above and remove the line above this one
        else
            -- (Qbcore) Add your disptach script here if it's none of the above
        end
    end
end

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("projectx-pacificbankrobbery-k4mb1:client:AddExperience", function(exp)
    -- Add exp function here and insert exp as a parameter
end)

function CheckExpLevel()
    -- Add "return" then add your check exp level function here
end

--------------------- Minigames ---------------------
------ You can return true to skip a minigame -------
-----------------------------------------------------
function PowerMinigame()
    local p = promise.new()
    exports['boii_minigames']:wire_cut({style = 'default', timer = 5000}, function(success)
        -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function SmokeMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:CircleSum(3, {length = 4, duration = 10000})
    -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function BackdoorKeypadMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:WaveMatch(1, {duration = 30000})
        -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function SideOffice1Minigame()
    local p = promise.new()
    exports['hh_wordmemory']:startWordMemory({
        timeLimit = 15,
        maxErrors = 1,
        totalWords = 10
    }, function(success, result)
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function SideOffice2Minigame()
    local p = promise:new()
    exports['hh_wordmemory']:startWordMemory({
        timeLimit = 15,
        maxErrors = 1,
        totalWords = 10
    }, function(success, result)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-bobcatheist-k4bm1:server:AddExperience', 1) end
        end
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function Computer1Minigame()
    local p = promise.new()
    local gameData = {totalNumbers = 20, seconds = 20, timesToChangeNumbers = 4, amountOfGames = 1, incrementByAmount = 5}
    local success = exports['pure-minigames']:numberCounter(gameData)
    -- if success then TriggerServerEvent('projectx-storerobbery-fm:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function Computer2Minigame()
    local p = promise.new()
    local success = exports['simonsays']:StartSimonSays(5, 5)
    -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function GeneralComputerMinigame()
    local p = promise.new()
        local success = exports['SN-Hacking']:MemoryCards('hard')
    -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function CodeComputerMinigame()
    return true
end

function MainOfficeKeypadMinigame()
    local p = promise:new()
    local success = exports['SN-Hacking']:ColorPicker(5, 7000, 3000)
    -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function SafecrackingMinigame()
    local p = promise:new()
    local success = exports['bd-minigames']:Lockpick('House Lockpicking', 4, 20)
    p:resolve(success)
    return Citizen.Await(p)
end

function SearchingMinigame()
    local p = promise.new()
    local success = true
    -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function DrillGateMinigame()
    local p = promise.new()
    TriggerEvent("Drilling:Start",function(success)
        p:resolve(success)
    end)
    -- local success = exports["bl_ui"]:CircleShake(1, 50, 2)
    -- if success then TriggerServerEvent('projectx-storerobbery-fm:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    return Citizen.Await(p)
end

function MainOfficeComputerMinigame()
    local p = promise.new()
    local success = exports['bd-minigames']:Thermite(20, 7, 7, 45)
    -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function BasementReceptionMinigame()
    local p = promise.new()
    local success = exports["bl_ui"]:MineSweeper(3, {grid = 7, duration = 10000, target = 10, previewDuration = 3000})
    -- if success then TriggerServerEvent('projectx-storerobbery-fm:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function SecurityShutdownMinigame()
    local p = promise.new()
    local success = exports['lightsout']:StartLightsOut(4, 20)
        -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function LaserShutdownMinigame()
    local p = promise.new()
    exports['boii_minigames']:wire_cut({style = 'default', timer = 5000}, function(success)
        -- if success then TriggerServerEvent('projectx-pacificbankrobbery-k4mb1:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function DrillingMinigame()
    local p = promise.new()
    TriggerEvent("Drilling:Start",function(success)
        p:resolve(success)
    end)
    -- if success then TriggerServerEvent('projectx-storerobbery-fm:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function VaultBombsMinigame()
    return true
end

function Vault2Minigame()
    -- Use this instead if you wanna skip the minigame for testing -- TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:MiniVaultHack', true)
    exports["hacking"]:hacking(
    function() -- success
        TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:MiniVaultHack', true)
    end,
    function() -- failure
        TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:MiniVaultHack', false)
    end)
    -- If you want to change this minigame, you have to use those 2 events below for it to function, true for success and false for failure
    -- TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:MiniVaultHack', true)
    -- TriggerEvent('projectx-pacificbankrobbery-k4mb1:client:MiniVaultHack', false)
end

function Vault3Minigame()
    local p = promise.new()
    local success = exports["bl_ui"]:MineSweeper(3, {grid = 7, duration = 10000, target = 10, previewDuration = 3000})
    -- if success then TriggerServerEvent('projectx-storerobbery-fm:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    p:resolve(success)
    return Citizen.Await(p)
end

function SealedVaultMinigame()
    local p = promise.new()
    exports['ps-ui']:Maze(function(success)
        p:resolve(success)
    end, 15)
    -- if success then TriggerServerEvent('projectx-storerobbery-fm:server:AddExperience', 1) end -- Add this line if you want to give exp for completing the minigame, 1 is the amount of exp
    return Citizen.Await(p)
end