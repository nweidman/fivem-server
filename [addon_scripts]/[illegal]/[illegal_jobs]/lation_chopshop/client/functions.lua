-- Initialize global variable(s) to store phone
Phone = nil

-- Initialize config(s)
local shared = require 'config.shared'

-- Localize export
local chopshop = exports.lation_chopshop

-- You can change the textUI script here
-- Options: 'lation_ui', 'ox_lib', 'jg-textui', 'okokTextUI', 'qbcore' & 'custom'
local textui = 'ox_lib'

-- Check if ls_bolt_minigame is installed/started
local ls_bolt_minigame = GetResourceState('ls_bolt_minigame') == 'started'

-- Get phone
local function InitializePhone()
    if GetResourceState('lb-phone') == 'started' then
        Phone = 'lb-phone'
    elseif GetResourceState('qb-phone') == 'started' then
        Phone = 'qb-phone'
    elseif GetResourceState('qs-smartphone-pro') == 'started' then
        Phone = 'qs-smartphone-pro'
    elseif GetResourceState('qs-smartphone') == 'started' then
        Phone = 'qs-smartphone'
    elseif GetResourceState('gksphone') == 'started' then
        Phone = 'gksphone'
    elseif GetResourceState('roadphone') == 'started' then
        Phone = 'roadphone'
    elseif GetResourceState('npwd') == 'started' then
        Phone = 'npwd'
    elseif GetResourceState('yseries') == 'started' then
        Phone = 'yseries'
    elseif GetResourceState('okokPhone') == 'started' then
        Phone = 'okokPhone'
    else
        -- Add custom phone here
    end
end

-- Display a notification
--- @param message string
--- @param type any
function ShowNotification(message, type)
    if shared.setup.notify == 'lation_ui' then
        exports.lation_ui:notify({ title = 'Chop Shop', message = message, type = type or 'info', icon = 'fas fa-car' })
    elseif shared.setup.notify == 'ox_lib' then
        lib.notify({ description = message, type = type or 'inform', position = 'top', icon = 'fas fa-car' })
    elseif shared.setup.notify == 'esx' then
        ESX.ShowNotification(message)
    elseif shared.setup.notify == 'qb' then
        QBCore.Functions.Notify(message, type or 'primary')
    elseif shared.setup.notify == 'okok' then
        exports['okokNotify']:Alert('Chop Shop', message, 5000, type or 'info', false)
    elseif shared.setup.notify == 'sd-notify' then
        exports['sd-notify']:Notify('Chop Shop', message, type or 'primary')
    elseif shared.setup.notify == 'wasabi_notify' then
        exports.wasabi_notify:notify('Chop Shop', message, 5000, type or 'info', false, 'fas fa-car')
    elseif shared.setup.notify == 'custom' then
        -- Add custom notification export/event here
    end
end

-- Display notifications from server
--- @param message string
--- @param type string
RegisterNetEvent('lation_chopshop:notify', function(message, type)
    ShowNotification(message, type)
end)

-- Return true or false if player can start chopping
--- @param model string Model name
--- @param entity number Entity ID
--- @return boolean
function CanStartChopping(model, entity)
    if not model or not entity then return false end

    if not shared.start.allowOwned then
        local plate = GetVehicleNumberPlateText(entity)
        if not plate or plate == '' then return false end

        local isOwned = lib.callback.await('lation_chopshop:isOwnedVehicle', false, plate)

        if isOwned then
            ShowNotification(locale('notify.owned-vehicle'), 'error')
            return false
        end
    end

    return true
end

-- Send email
--- @param message string
local function SendEmail(message)
    if not message then return end
    if Phone == 'qs-smartphone' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = 'Salvage Specialist',
            subject = 'Chop Shop',
            message = message
        })
    elseif Phone == 'roadphone' then
        exports[Phone]:sendMail({
            sender = 'Salvage Specialist',
            subject = 'Chop Shop',
            message = message
        })
    else
        lib.alertDialog({
            header = 'Chop Shop',
            content = message,
            centered = true,
            cancel = true
        })
    end
end

-- Display a progress bar
--- @param data table
function ProgressBar(data)
    if shared.setup.progress == 'lation_ui' then
        if exports.lation_ui:progressBar({
            label = data.label,
            description = data.description or nil,
            icon = data.icon or nil,
            duration = data.duration,
            useWhileDead = data.useWhileDead,
            canCancel = data.canCancel,
            steps = data.steps or nil,
            disable = data.disable,
            anim = {
                dict = data.anim.dict or nil,
                clip = data.anim.clip or nil,
                flag = data.anim.flag or nil
            },
            prop = {
                model = data.prop.model or nil,
                bone = data.prop.bone or nil,
                pos = data.prop.pos or nil,
                rot = data.prop.rot or nil
            }
        }) then
            return true
        end
        return false
    elseif shared.setup.progress == 'ox_lib' then
        -- Want to use ox_lib's progress circle instead of bar?
        -- Change "progressBar" to "progressCircle" below & done!
        if lib.progressBar({
            label = data.label,
            duration = data.duration,
            position = data.position or 'bottom',
            useWhileDead = data.useWhileDead,
            allowSwimming = data.allowSwimming or false,
            canCancel = data.canCancel,
            disable = data.disable,
            anim = {
                dict = data.anim.dict or nil,
                clip = data.anim.clip or nil,
                flag = data.anim.flag or nil
            },
            prop = {
                model = data.prop.model or nil,
                bone = data.prop.bone or nil,
                pos = data.prop.pos or nil,
                rot = data.prop.rot or nil
            }
        }) then
            return true
        end
        return false
    elseif shared.setup.progress == 'qbcore' then
        local p = promise.new()
        QBCore.Functions.Progressbar(data.label, data.label, data.duration, data.useWhileDead, data.canCancel, {
            disableMovement = data.disable.move,
            disableCarMovement = data.disable.car,
            disableMouse = false,
            disableCombat = data.disable.combat
        }, {
            animDict = data.anim.dict or nil,
            anim = data.anim.clip or nil,
            flags = data.anim.flag or nil
        }, {
            model = data.prop.model or nil,
            bone = data.prop.bone or nil,
            coords = data.prop.pos or nil,
            rotation = data.prop.rot or nil
        }, {},
        function()
            ClearPedTasks(cache.ped)
            p:resolve(true)
        end,
        function()
            ClearPedTasks(cache.ped)
            p:resolve(false)
        end)
        return Citizen.Await(p)
    else
        -- Add 'custom' progress bar here
    end
end

-- Register menu
--- @param data table
function RegisterMenu(data)
    if shared.setup.menu == 'lation_ui' then
        exports.lation_ui:registerMenu(data)
    elseif shared.setup.menu == 'ox_lib' then
        lib.registerContext(data)
    elseif shared.setup.menu == 'custom' then
        -- Add 'custom' menu system here
    end
end

-- Show menu
--- @param menuId string
function ShowMenu(menuId)
    if shared.setup.menu == 'lation_ui' then
        exports.lation_ui:showMenu(menuId)
    elseif shared.setup.menu == 'ox_lib' then
        lib.showContext(menuId)
    elseif shared.setup.menu == 'custom' then
        -- Add 'custom' menu system here
    end
end

-- Display an alert dialog
--- @param data table
function ShowAlert(data)
    if shared.setup.dialogs == 'lation_ui' then
        return exports.lation_ui:alert(data)
    elseif shared.setup.dialogs == 'ox_lib' then
        return lib.alertDialog(data)
    elseif shared.setup.dialogs == 'custom' then
        -- Add your custom alert dialog here
    end
end

-- Display an input dialog
--- @param data table
function ShowInput(data)
    if shared.setup.dialogs == 'lation_ui' then
        return exports.lation_ui:input({ title = data.title, options = data.options })
    elseif shared.setup.dialogs == 'ox_lib' then
        return lib.inputDialog(data.title, data.options)
    elseif shared.setup.dialogss == 'custom' then
        -- Add your custom input dialog here
    end
end

-- Display TextUI
--- @param text string 
--- @param icon string
function ShowTextUI(text, icon)
    if textui == 'lation_ui' then
        exports.lation_ui:showText({
            description = text,
            icon = icon,
            iconAnimation = 'beat'
        })
    elseif textui == 'ox_lib' then
        lib.showTextUI(text, {
            position = 'left-center',
            icon = icon,
            iconAnimation = 'beat'
        })
    elseif textui == 'jg-textui' then
        exports['jg-textui']:DrawText(text)
    elseif textui == 'okokTextUI' then
        exports['okokTextUI']:Open(text, 'lightblue ', 'left', false)
    elseif textui == 'qbcore' then
        exports['qb-core']:DrawText(text, 'left')
    else
        -- Add custom textUI here
    end
end

-- Hide TextUI
--- @param label string
function HideTextUI(label)
    if textui == 'lation_ui' then
        local isOpen, text = exports.lation_ui:isOpen()
        if isOpen and text == label then
            exports.lation_ui:hideText()
        end
    elseif textui == 'ox_lib' then
        local isOpen, text = lib.isTextUIOpen()
        if isOpen and text == label then
            lib.hideTextUI()
        end
    elseif textui == 'jg-textui' then
        exports['jg-textui']:HideText()
    elseif textui == 'okokTextUI' then
        exports['okokTextUI']:Close()
    elseif textui == 'qbcore' then
        exports['qb-core']:HideText()
    else
        -- Add custom textUI here
    end
end

-- Display skillcheck
--- @param data table .difficulty, .inputs
function ShowSkillcheck(data)
    if shared.setup.minigame == 'lation_ui' then
        if exports.lation_ui:skillCheck('Chopping', data.difficulty, data.inputs) then
            return true
        end
        return false
    elseif shared.setup.minigame == 'ox_lib' then
        if lib.skillCheck(data.difficulty, data.inputs) then
            return true
        end
        return false
    elseif shared.setup.minigame == 'rn_minigames' then
        return exports['rm_minigames']:buttonMashing(5, 10)
        end
    return false
end

-- Show Lith Studios Bolt Minigame
--- @param entity number Entity number
--- @param wheelId number Wheel index
--- @param mount boolean Mount wheel
--- @param goToWheel boolean Go to wheel
--- @param coords any
function ShowLsBoltMinigame(entity, wheelId, mount, goToWheel, coords)
    if shared.setup.ls_bolt_minigame and not ls_bolt_minigame then
        print('^1[ERROR]: ls_bolt_minigame resource is not installed (or started correctly)^0')
        print('^1[ERROR]: You either have not installed it or the start order is incorrect^0')
        print('^1[ERROR]: If installed, ensure the resource is started BEFORE lation_chopshop^0')
        print('^4[INFO]: Don\'t have ls_bolt_minigame yet? Get it here for free: https://lith.store/package/6174416^0')
        return false
    end

    return exports['ls_bolt_minigame']:BoltMinigame(entity, wheelId, mount, goToWheel, coords)
end

-- Add entity target
--- @param entity number Entity number
--- @param data table Options table
function AddTargetEntity(entity, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 1.75})
    elseif shared.setup.interact == 'interact' then
        exports.interact:AddLocalEntityInteraction({
            entity = entity,
            interactDst = 1.75,
            offset = vec3(0.0, 0.0, 1.0),
            options = data
        })
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system was detected - please visit config/shared "setup" section^0')
    end
end

-- Add target to model
--- @param model string Model
--- @param data table Options table
function AddTargetModel(model, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:addModel(model, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:AddTargetModel(model, {options = data, distance = 1.75})
    elseif shared.setup.interact == 'interact' then
        exports.interact:AddModelInteraction({
            model = model,
            offset = vec3(0.0, 0.0, 0.0),
            id = model,
            interactDst = 1.75,
            options = data
        })
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system was detected - please visit config/shared "setup" section^0')
    end
end

-- Add target to entity bone
--- @param entity number
--- @param bone string
--- @param data table
function AddTargetBone(entity, bone, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:AddTargetBone(bone, {options = data, distance = 1.75})
    elseif shared.setup.interact == 'interact' then
        exports.interact:AddLocalEntityInteraction({
            entity = entity,
            interactDst = 1.75,
            bone = bone,
            options = data
        })
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system was detected - please visit config/shared "setup" section^0')
    end
end

-- Remove target from entity
--- @param entity any|number
--- @param data table|string
function RemoveTargetEntity(entity, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:RemoveTargetEntity(entity, data)
    elseif shared.setup.interact == 'interact' then
        exports.interact:RemoveLocalEntityInteraction(entity, data)
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system was detected - please visit config/shared "setup" section^0')
    end
end

-- Remove target model
--- @param model string Model
function RemoveTargetModel(model)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:removeModel(model, nil)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:RemoveTargetModel(model, nil)
    elseif shared.setup.interact == 'interact' then
        exports.interact:RemoveModelInteraction(model, model)
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system was detected - please visit config/shared "setup" section^0')
    end
end

-- Remove target from entity bone
--- @param entity any|number
--- @param bone string
--- @param data table|string
function RemoveTargetBone(entity, bone, data)
    if shared.setup.interact == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif shared.setup.interact == 'qb-target' then
        exports['qb-target']:RemoveTargetBone(bone, data)
    elseif shared.setup.interact == 'interact' then
        exports.interact:RemoveLocalEntityInteraction(entity, data)
    elseif shared.setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('^1[ERROR]: No interaction system was detected - please visit config/shared "setup" section^0')
    end
end

-- Empty function triggered when "Start Chopping" is selected
--- @param entity number Entity ID
--- @param model string Model name
function StartedChopping(entity, model)
    -- print(('Chopping has started on entity/model: %s/%s'):format(entity, model))
end

-- Assign waypoint to random zone upon vehicle entry
--- @param value number
--- @param _ any
lib.onCache('vehicle', function(value, _)
    if not value then return end

    local model = modelHashes[GetEntityModel(value)]
    if not model then return end

    local assignedModel = chopshop:getAssignedModel()
    if not assignedModel then return end

    if model ~= assignedModel then return end

    local zone = shared.zones[math.random(#shared.zones)]
    if not zone then return end

    SetNewWaypoint(zone.x, zone.y)
    TriggerServerEvent('lation_chopshop:foundModel')
end)

-- Function to spawn NPCs
--- @param model string
--- @param position vector4
function SpawnPed(model, position)
    lib.requestModel(model)
    local ped = CreatePed(0, model, position.x, position.y, position.z - 1.0, position.w, false, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    return ped
end

-- Print debug message
--- @param message string
function Debug(message)
    if not shared.setup.debug then return end
    print(('^2[DEBUG]:^0 %s'):format(message))
end

-- Register net event(s)
RegisterNetEvent('lation_chopshop:sendEmail', SendEmail)

-- Initialize default(s)
InitializePhone()