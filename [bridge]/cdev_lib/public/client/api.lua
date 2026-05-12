clib_API = {}

-- 📣 Event that is triggered on the client when the player is loaded
RegisterNetEvent(clib_Config.getFrameworkConfig().ClientPlayerLoadEvent, function()
    TriggerEvent("cdev_lib:api:playerLoaded")
end)

-- 📣 Event that is triggered on the client when the player job is updated
RegisterNetEvent(clib_Config.getFrameworkConfig().ClientPlayerJobUpdateEvent, function(job)
    if clib_Config.isQBCore then
        TriggerEvent("cdev_lib:api:jobUpdate", job.name, job.grade.level)
    elseif clib_Config.isESX then
        TriggerEvent("cdev_lib:api:jobUpdate", job.name, job.grade)
    else
        -- 🔧 If using custom, implement your own code here
    end
end)

-- 👀 Methods for handling third eye (or target) interactions
-- Returns a unique option name for ox_target so multiple options with the same event (e.g. useEmote) don't collide.
local function oxOptionName(properties)
    local eventPart = string.split(properties.event, ":")[2]
    if not eventPart then return "option" end
    if properties.name then return properties.name end
    if properties.label and properties.label ~= "" then
        local slug = string.gsub(string.gsub(string.lower(properties.label), "%s+", "_"), "[^%w_]", "")
        if slug ~= "" then return eventPart .. "_" .. slug end
    end
    return eventPart
end

clib_API.ThirdEye = {
    -- 📣 Add a new interaction specifically for a model hash
    -- ⚙️ properties is a table containing the following properties:
    --  - modelHash: The model hash of the entity
    --  - event: The event to trigger when the interaction is selected
    --  - payload: The payload to send with the event
    --  - faIcon: The font awesome icon to use for the interaction
    --  - label: The label of the interaction
    --  - canInteractCallback: A callback function to determine whether the interaction can be shown
    --  - distance: The distance at which the interaction can be selected
    ---@param properties { modelHash: number, event: string, payload: table, faIcon: string, label: string, canInteractCallback: (fun(entity: number): boolean), distance: number }
    AddModelInteraction = function(properties)
        if clib_Config.public.Target == "qbcore" then
            exports["qb-target"]:AddTargetModel(properties.modelHash, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        elseif clib_Config.public.Target == "renewed" then
            exports["qb-target"]:AddTargetModel(properties.modelHash, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback
                    }
                },
                distance = properties.distance
            })
        elseif clib_Config.public.Target == "qtarget" then
            exports.qtarget:AddTargetModel(properties.modelHash, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance
            })
        elseif clib_Config.public.Target == "ox" then
            exports.ox_target:addModel(properties.modelHash, {
                {
                    name = oxOptionName(properties),
                    event = properties.event,
                    payload = properties.payload,
                    icon = properties.faIcon,
                    label = properties.label,
                    canInteract = function(entity, distance)
                        if not entity or not DoesEntityExist(entity) then
                            return false
                        end

                        if not properties.canInteractCallback then
                            return distance <= properties.distance
                        end

                        return properties.canInteractCallback(entity) and
                            distance <= properties.distance
                    end,
                },
            })
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,

    -- 📣 Remove an interaction specifically for a model hash with the given label/event
    -- ⚙️ properties is a table containing the following properties:
    --  - modelHash: The model hash of the entity
    --  - event: The event that was registed
    --  - label: The label of the interaction
    ---@param properties { modelHash: number, event: string, label: string }
    RemoveModelInteraction = function(properties)
        if clib_Config.public.Target == "qbcore" then
            exports["qb-target"]:RemoveTargetModel(properties.modelHash, properties.label)
        elseif clib_Config.public.Target == "renewed" then
            exports["qb-target"]:RemoveTargetModel(properties.modelHash, properties.label)
        elseif clib_Config.public.Target == "qtarget" then
            exports.qtarget:RemoveTargetModel(properties.modelHash, properties.label)
        elseif clib_Config.public.Target == "ox" then
            exports.ox_target:removeModel(properties.modelHash, oxOptionName(properties))
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,

    -- 📣 Add a new interaction specifically for an entity (other params are the same as AddModelInteraction)
    -- ⚙️ properties is a table containing the following properties (other params are the same as AddModelInteraction):
    --  - entity: The entity number to add the interaction to
    ---@param properties { entity: number, event: string, payload: table, faIcon: string, label: string, canInteractCallback: (fun(entity: number): boolean), distance: number }
    AddEntityInteraction = function(properties)
        if clib_Config.public.Target == "qbcore" then
            exports["qb-target"]:AddTargetEntity(properties.entity, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        elseif clib_Config.public.Target == "renewed" then
            exports["qb-target"]:AddTargetEntity(properties.entity, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        elseif clib_Config.public.Target == "qtarget" then
            exports.qtarget:AddTargetEntity(properties.entity, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance
            })
        elseif clib_Config.public.Target == "ox" then
            exports.ox_target:addLocalEntity(properties.entity, {
                {
                    name = oxOptionName(properties),
                    event = properties.event,
                    payload = properties.payload,
                    icon = properties.faIcon,
                    label = properties.label,
                    canInteract = function(entity, distance)
                        if not entity or not DoesEntityExist(entity) then
                            return false
                        end

                        if properties.distance then
                            local isCloseEnough = distance <= properties.distance
                            if not isCloseEnough then
                                return false
                            end
                        end

                        if properties.canInteractCallback then
                            return properties.canInteractCallback(entity)
                        end

                        return true
                    end,
                },
            })
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,

    -- 📣 Remove an interaction specifically for a model hash with the given label/event
    -- ⚙️ properties is a table containing the following properties:
    --  - entity: The entity number to remove the interaction from
    --  - event: The event that was registed
    --  - label: The label of the interaction
    ---@param properties { entity: number, event: string, label: string }
    RemoveEntityInteraction = function(properties)
        if clib_Config.public.Target == "qbcore" then
            exports["qb-target"]:RemoveTargetEntity(properties.entity, properties.label)
        elseif clib_Config.public.Target == "renewed" then
            exports["qb-target"]:RemoveTargetEntity(properties.entity, properties.label)
        elseif clib_Config.public.Target == "qtarget" then
            exports.qtarget:RemoveTargetEntity(properties.entity, properties.label)
        elseif clib_Config.public.Target == "ox" then
            exports.ox_target:removeLocalEntity(properties.entity, {
                name = oxOptionName(properties),
            })
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,

    -- 📣 Add a new interaction globally for a vehicle
    ---@param properties { bones: string[], event: string, payload: table, faIcon: string, label: string, canInteractCallback: (fun(entity: number): boolean), distance: number }
    AddTargetBone = function(properties)
        if clib_Config.public.Target == "qbcore" then
            exports["qb-target"]:AddTargetBone(properties.bones, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        elseif clib_Config.public.Target == "renewed" then
            exports["qb-target"]:AddTargetBone(properties.bones, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        elseif clib_Config.public.Target == "qtarget" then
            exports.qtarget:AddTargetBone(properties.bones, {
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance
            })
        elseif clib_Config.public.Target == "ox" then
            exports.ox_target:addGlobalVehicle({
                name = oxOptionName(properties),
                bones = properties.bones,
                icon = properties.faIcon,
                label = properties.label,
                event = properties.event,
                payload = properties.payload,
                canInteract = function(entity, distance)
                    if not entity or not DoesEntityExist(entity) then
                        return false
                    end

                    if not properties.canInteractCallback then
                        return true
                    end

                    return properties.canInteractCallback(entity)
                end,
            })
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
    -- 📣 Add a new interaction globally for a player
    ---@param properties { event: string, payload: table, faIcon: string, label: string, canInteractCallback: (fun(entity: number): boolean), distance: number }
    AddGlobalPlayer = function(properties)
        if clib_Config.public.Target == 'ox' then
            exports.ox_target:addGlobalPlayer({
                name = oxOptionName(properties),
                event = properties.event,
                payload = properties.payload,
                icon = properties.faIcon,
                label = properties.label,
                distance = properties.distance,
                canInteract = function(entity, distance)
                    if not entity or not DoesEntityExist(entity) then
                        return false
                    end

                    if not properties.canInteractCallback then
                        return true
                    end

                    return properties.canInteractCallback(entity)
                end,
            })
        elseif clib_Config.public.Target ~= 'custom' then
            -- works for all
            exports["qb-target"]:AddGlobalPlayer({
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
    -- 📣 Add a new interaction globally for a vehicle
    ---@param properties { event: string, payload: table, faIcon: string, label: string, canInteractCallback: (fun(entity: number): boolean), distance: number }
    AddGlobalVehicle = function(properties)
        if clib_Config.public.Target == 'ox' then
            exports.ox_target:addGlobalVehicle({
                name = oxOptionName(properties),
                event = properties.event,
                payload = properties.payload,
                icon = properties.faIcon,
                label = properties.label,
                distance = properties.distance,
                canInteract = function(entity, distance)
                    if not entity or not DoesEntityExist(entity) then
                        return false
                    end

                    if not properties.canInteractCallback then
                        return true
                    end

                    return properties.canInteractCallback(entity)
                end,
            })
        elseif clib_Config.public.Target ~= 'custom' then
            exports["qb-target"]:AddGlobalVehicle({
                options = {
                    {
                        event = properties.event,
                        payload = properties.payload,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                    },
                },
                distance = properties.distance,
            })
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,

    -- 📣 Add a new interaction with a circle zone for qb-target
    ---@param properties { event: string, name:string, payload: table, faIcon: string, label: string, canInteractCallback: (fun(entity: number): boolean), distance: number, coords: vector3, radius: number }
    addSphereZone = function(properties)
        if clib_Config.public.Target == 'ox' then
            exports.ox_target:addSphereZone({
                name = properties.name or oxOptionName(properties),
                coords = properties.coords,
                radius = properties.radius,
                options = {
                    {
                        event = properties.event,
                        icon = properties.faIcon,
                        label = properties.label,
                        canInteract = properties.canInteractCallback,
                        distance = properties.distance,
                        payload = properties.payload,
                    }
                }
            })
        elseif clib_Config.public.Target == 'qbcore' or clib_Config.public.Target == 'renewed' or clib_Config.public.Target == 'qtarget' then
            local zoneId = properties.name or string.split(properties.event, ":")[2]

            exports["qb-target"]:AddCircleZone(zoneId, properties.coords, properties.radius, {
                name = zoneId,
                useZ = true,
            }, {
                options = {
                    {
                        type = "client",
                        event = properties.event,
                        icon = properties.faIcon,
                        label = properties.label,
                        args = properties.payload,
                    },
                },
                distance = properties.distance,
                canInteract = properties.canInteractCallback,
            })
        else
            -- Handle other targeting systems or custom code here
        end
    end,

    removeZone = function(id)
        if clib_Config.public.Target == 'ox' then
            exports.ox_target:removeZone(id)
        elseif clib_Config.public.Target == 'qbcore' then
            exports["qb-target"]:RemoveZone(id)
        else
            -- Handle other targeting systems or custom code here
        end
    end
}

-- 🧍 Methods for handling character data on the client
clib_API.Character = {
    -- 🆔 Return the unique identifier for the character currently being played by the player
    GetIdentifier = function()
        if clib_Config.isQBCore then
            return clib.frameworks.QBCore.Functions.GetPlayerData().citizenid
        elseif clib_Config.isESX then
            return clib.frameworks.ESX.GetPlayerData().identifier
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
    -- 💸 Return the cash of the character (used for visuals and pre-server-side validation)
    GetCash = function()
        if clib_Config.isQBCore then
            return clib.frameworks.QBCore.Functions.GetPlayerData().money.cash
        elseif clib_Config.isESX then
            local player = clib.frameworks.ESX.GetPlayerData()
            local accounts = player.accounts

            for i = 1, #accounts do
                if accounts[i].name == "money" then
                    return accounts[i].money
                end
            end
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
    -- 👔 Return the job and grade of the character
    GetJob = function()
        if clib_Config.isQBCore then
            local playerData = clib.frameworks.QBCore.Functions.GetPlayerData()
            if not playerData or not playerData.job then
                return "unemployed", 0
            end
            local job = playerData.job
            return job.name or "unemployed", job.grade and job.grade.level or 0
        elseif clib_Config.isESX then
            local data = clib.frameworks.ESX.GetPlayerData()
            if not data or not data.job then
                return "unemployed", 0
            end
            return data.job.name or "unemployed", data.job.grade or 0
        else
            -- 🔧 If using custom, implement your own code here
            return "unemployed", 0
        end
    end,

    GetGang = function()
        if clib_Config.isQBCore then
            local PlayerData = clib.frameworks.QBCore.Functions.GetPlayerData()
            return PlayerData.gang.name, PlayerData.gang.grade.level
        elseif clib_Config.isESX then
            local PlayerData = clib.frameworks.ESX.GetPlayerData()
            return PlayerData.gang.name, PlayerData.gang.grade
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
    -- Determine if a character has VIP status in your server (optional)
    IsVIP = function()
        local isVIP = promise.new()

        clib.events.TriggerServerCallback("cdev_lib:api:getVIP", function(result)
            isVIP:resolve(result)
        end)

        return Citizen.Await(isVIP)
    end,
    IsDead = function()
        if clib_Config.isQBCore then
            local PlayerData = clib.frameworks.QBCore.Functions.GetPlayerData()
            return IsEntityDead(PlayerPedId()) or PlayerData.metadata["inlaststand"] or PlayerData.metadata["isdead"]
        elseif clib_Config.isESX then
            return IsEntityDead(PlayerPedId()) or clib.frameworks.ESX.GetPlayerData().dead
        else
            -- 🔧 If using custom, implement your own code here
            return IsEntityDead(PlayerPedId())
        end
    end
}

-- 💬 Methods for handling notifications (if using custom you must enable UseCustomNotifications in public/config.lua)
clib_API.Notify = {
    AddDefaultNotification = function(title, message, seconds)
        if not PublicSharedConfig.UseCustomNotifications then
            clib.notification.AddDefaultNotification(title, message, seconds)
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
    AddWarningNotification = function(title, message, seconds)
        if not PublicSharedConfig.UseCustomNotifications then
            clib.notification.AddWarningNotification(title, message, seconds)
        else
            -- 🔧 If using custom, implement your own code here
        end
    end,
}

RegisterNetEvent("cdev_lib:api:notify:default", clib_API.Notify.AddDefaultNotification)
RegisterNetEvent("cdev_lib:api:notify:warning", clib_API.Notify.AddWarningNotification)
