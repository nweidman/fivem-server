----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local MenuName = Config.CoreSettings.MenuName
local InputName = Config.CoreSettings.InputName
local DutyEvent = Config.CoreSettings.DutyEvent
local ClothingEvent = Config.CoreSettings.ClothingEvent
local FuelEvent = Config.CoreSettings.FuelEvent
local RemoveStressEvent = Config.CoreSettings.RemoveStressEvent
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- NOTIFICATIONS START --<!>--
RegisterNetEvent('boii-whitewidow:notifications')
AddEventHandler('boii-whitewidow:notifications', function(msg, type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS END --<!>--

--<!>-- BLIPS START --<!>--
CreateThread(function()
    -- for _, info in pairs(Config.Blips) do
    --     info.blip = AddBlipForCoord(info.x, info.y, info.z)
    --     SetBlipSprite(info.blip, info.id)
    --     SetBlipDisplay(info.blip, 4)
    --     SetBlipScale(info.blip, info.scale)
    --     SetBlipColour(info.blip, info.colour)
    --     SetBlipAsShortRange(info.blip, true)
    --     BeginTextCommandSetBlipName('STRING')
    --     AddTextComponentString(info.title)
    --     EndTextCommandSetBlipName(info.blip)
    -- end
end)
--<!>-- BLIPS END --<!>--

--<!>-- PEDS START --<!>--
if Config.MLOVersion == 'v2' then 
    Citizen.CreateThread(function()
        for _,v in pairs(Config.JobSettings.Garage.V2Garage.Peds) do
            RequestModel(GetHashKey(v.model))
            while not HasModelLoaded(GetHashKey(v.model)) do
                Wait(1)
            end
            CocainePed = CreatePed(4, v.hash,v.x,v.y,v.z-1, 3374176, false, true)
            SetEntityHeading(CocainePed, v.h)
            FreezeEntityPosition(CocainePed, true)
            SetEntityInvincible(CocainePed, true)
            SetBlockingOfNonTemporaryEvents(CocainePed, true)
            TaskStartScenarioInPlace(CocainePed, v.scenario, 0, true)
            -- qb-target ped export
            exports[TargetName]:AddTargetModel(v.model, {options = {{event = 'boii-whitewidow:client:AccessGarage',icon = Language.Targeting['garageicon'],label = Language.Targeting['garagelabel']},},distance = 10.0})
        end
    end)
end
--<!>-- PEDS END --<!>--

--<!>-- ON DUTY START --<!>--
-- ON DUTY ZONES (qb-target / ox_target compatible)
local function addDutyZone(v)
    local jobName   = Config.JobSettings.JobName
    local dutyIcon  = (Language.Targeting and Language.Targeting['dutyicon']) or 'fa-regular fa-id-badge'
    local dutyLabel = (Language.Targeting and Language.Targeting['dutylabel']) or 'Toggle Duty'
    local distance  = v.distance or 1.8

    if TargetName == 'ox_target' then
        -- ox_target: addBoxZone({ coords, size, rotation, options = { ... } })
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_duty_%s'):format(v.name or ('pos_'..tostring(v.coords))),
                    icon     = dutyIcon,
                    label    = dutyLabel,
                    distance = distance,                           -- per-option in ox_target
                    groups   = { [jobName] = 0 },                  -- job restriction
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:WhiteWidowDutyMenu')
                    end
                }
            }
        })

        -- optional: keep ids for cleanup on resource stop
        WW_DutyZoneIds = WW_DutyZoneIds or {}
        table.insert(WW_DutyZoneIds, id)

    else
        -- qb-target: AddBoxZone(name, center, length, width, zoneOpts, interact)
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = 'boii-whitewidow:client:WhiteWidowDutyMenu',
                    icon  = dutyIcon,
                    label = dutyLabel,
                    job   = jobName,   -- qb-target job lock
                },
            },
            distance = distance,       -- zone-level in qb-target
        })
    end
end

-- Build all duty zones from config
-- for _, v in pairs(Config.JobSettings.Locations.Duty) do
--     addDutyZone(v)
-- end

-- optional cleanup for ox_target zones
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_DutyZoneIds then return end
    for _, id in ipairs(WW_DutyZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
--<!>-- ON DUTY END --<!>--

--<!>-- BOSS MENU START --<!>--
-- Boss
local function hasBossAccess()
    local PD = exports.qbx_core:GetPlayerData()
    if not PD or not PD.job then return false end
    if PD.job.name ~= Config.JobSettings.JobName then return false end
    local lvl = (PD.job.grade and (PD.job.grade.level or PD.job.grade)) or 0
    return lvl == 5 or lvl == 6
end

local function addBossZone(v)
    local jobName   = Config.JobSettings.JobName
    local bossIcon  = (Language.Targeting and Language.Targeting['bossicon']) or 'fa-user-tie'
    local bossLabel = (Language.Targeting and Language.Targeting['bosslabel']) or 'Boss Menu'
    local distance  = v.distance or 1.8

    if TargetName == 'ox_target' then
        -- ox_target: single-table API
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_boss_%s'):format(v.name or 'boss'),
                    icon     = bossIcon,
                    label    = bossLabel,
                    distance = distance,                         -- per-option in ox_target
                    groups   = { [jobName] = 0 },                -- coarse: must have the job
                    canInteract = function(_, dist)
                        return dist <= distance and hasBossAccess() -- refine by grade 5/6
                    end,
                    onSelect = function()
                        TriggerEvent(Config.CoreSettings.BossMenuEvent)
                    end
                }
            }
        })

        WW_BossZoneIds = WW_BossZoneIds or {}
        table.insert(WW_BossZoneIds, id)

    else
        -- qb-target: two-table API
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = Config.CoreSettings.BossMenuEvent,
                    icon  = bossIcon,
                    label = bossLabel,
                    job   = jobName,                  -- coarse: must have the job
                    canInteract = function(_, dist)
                        return dist <= distance and hasBossAccess() -- refine by grade 5/6
                    end
                },
            },
            distance = distance,                        -- zone-level in qb-target
        })
    end
end

-- Build all Boss zones
-- for _, v in pairs(Config.JobSettings.Locations.Boss) do
--     addBossZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_BossZoneIds then return end
    for _, id in ipairs(WW_BossZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)--<!>-- BOSS MENU END --<!>--

--<!>-- BOSS STORAGE START --<!>--
-- Boss storage
local function hasBossAccess()
    local PD = exports.qbx_core:GetPlayerData()
    if not PD or not PD.job then return false end
    if PD.job.name ~= Config.JobSettings.JobName then return false end
    local lvl = (PD.job.grade and (PD.job.grade.level or PD.job.grade)) or 0
    return lvl == 5 or lvl == 6
end

-- Who can force entry? (raid job)
local function hasRaidAccess()
    local raid = Config.JobSettings.Raid and Config.JobSettings.Raid.JobName
    if not raid then return false end
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == raid) or false
end

local function addBossStorageZone(v)
    local jobName    = Config.JobSettings.JobName
    local raidJob    = Config.JobSettings.Raid and Config.JobSettings.Raid.JobName
    local iconBoss   = (Language.Targeting and Language.Targeting['bossstorageicon']) or 'fa-box-archive'
    local labelBoss  = (Language.Targeting and Language.Targeting['bossstoragelabel']) or 'Boss Storage'
    local iconForce  = (Language.Targeting and Language.Targeting['forceentryicon']) or 'fa-door-open'
    local labelForce = (Language.Targeting and Language.Targeting['forceentrylabel']) or 'Force Entry'
    local distance   = v.distance or 1.8
    local stashName  = v.stash or 'ww_boss_storage' -- allow override per location

    if TargetName == 'ox_target' then
        -- Build an ox_target box zone
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local opts = {
            -- Boss storage option (jobName + grade 5/6)
            {
                name     = ('ww_boss_storage_%s'):format(v.name or 'pos'),
                icon     = iconBoss,
                label    = labelBoss,
                distance = distance,
                groups   = { [jobName] = 0 },                     -- must have job
                canInteract = function(_, dist)
                    return dist <= distance and hasBossAccess()  -- refine by grade
                end,
                onSelect = function()
                    TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName })
                end
            },
        }

        -- Optional: force entry (raid job)
        if raidJob then
            opts[#opts+1] = {
                name     = ('ww_boss_storage_force_%s'):format(v.name or 'pos'),
                icon     = iconForce,
                label    = labelForce,
                distance = distance,
                groups   = { [raidJob] = 0 },
                canInteract = function(_, dist)
                    return dist <= distance and hasRaidAccess()
                end,
                onSelect = function()
                    TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName, forceentry = true })
                end
            }
        end

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = opts
        })

        WW_BossStorageIds = WW_BossStorageIds or {}
        table.insert(WW_BossStorageIds, id)

    else
        -- qb-target: use AddBoxZone + options with local `action` so we can pass params
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                -- Boss storage option
                {
                    icon  = iconBoss,
                    label = labelBoss,
                    job   = jobName, -- coarse check; refine by grade in canInteract
                    canInteract = function(_, dist)
                        return dist <= distance and hasBossAccess()
                    end,
                    action = function()
                        TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName })
                    end
                },
                -- Force entry (raid job)
                raidJob and {
                    icon  = iconForce,
                    label = labelForce,
                    job   = raidJob,
                    canInteract = function(_, dist)
                        return dist <= distance and hasRaidAccess()
                    end,
                    action = function()
                        TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName, forceentry = true })
                    end
                } or nil
            },
            distance = distance,
        })
    end
end

-- Build all BossStorage zones from config
-- for _, v in pairs(Config.JobSettings.Locations.BossStorage) do
--     addBossStorageZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_BossStorageIds then return end
    for _, id in ipairs(WW_BossStorageIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
--<!>-- BOSS STORAGE END --<!>--

--<!>-- JOB STORAGE START --<!>--
-- Job storage
local function hasJobAccess()
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == Config.JobSettings.JobName) or false
end

-- Can force entry (raid job)?
local function hasRaidAccess()
    local raid = Config.JobSettings.Raid and Config.JobSettings.Raid.JobName
    if not raid then return false end
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == raid) or false
end

local function addJobStorageZone(v)
    local jobName    = Config.JobSettings.JobName
    local raidJob    = Config.JobSettings.Raid and Config.JobSettings.Raid.JobName
    local iconJob    = (Language.Targeting and Language.Targeting['jobstorageicon']) or 'fa-box'
    local labelJob   = (Language.Targeting and Language.Targeting['jobstoragelabel']) or 'Job Storage'
    local iconForce  = (Language.Targeting and Language.Targeting['forceentryicon']) or 'fa-door-open'
    local labelForce = (Language.Targeting and Language.Targeting['forceentrylabel']) or 'Force Entry'
    local distance   = v.distance or 1.8
    local stashName  = v.stash or 'ww_job_storage' -- allow per-location override

    if TargetName == 'ox_target' then
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local opts = {
            -- Normal job storage option
            {
                name     = ('ww_job_storage_%s'):format(v.name or 'pos'),
                icon     = iconJob,
                label    = labelJob,
                distance = distance,
                groups   = { [jobName] = 0 },                  -- must have the job
                canInteract = function(_, dist)
                    return dist <= distance and hasJobAccess()
                end,
                onSelect = function()
                    TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName })
                end
            },
        }

        -- Force entry for raid job (optional)
        if raidJob then
            opts[#opts+1] = {
                name     = ('ww_job_storage_force_%s'):format(v.name or 'pos'),
                icon     = iconForce,
                label    = labelForce,
                distance = distance,
                groups   = { [raidJob] = 0 },
                canInteract = function(_, dist)
                    return dist <= distance and hasRaidAccess()
                end,
                onSelect = function()
                    TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName, forceentry = true })
                end
            }
        end

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = opts
        })

        WW_JobStorageIds = WW_JobStorageIds or {}
        table.insert(WW_JobStorageIds, id)

    else
        -- qb-target signature: AddBoxZone(name, center, length, width, zoneOpts, interact)
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    icon  = iconJob,
                    label = labelJob,
                    job   = jobName,                            -- coarse job gate
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end,
                    action = function()
                        TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName })
                    end
                },
                raidJob and {
                    icon  = iconForce,
                    label = labelForce,
                    job   = raidJob,
                    canInteract = function(_, dist)
                        return dist <= distance and hasRaidAccess()
                    end,
                    action = function()
                        TriggerEvent('boii-whitewidow:client:OpenStash', { stash = stashName, forceentry = true })
                    end
                } or nil
            },
            distance = distance,
        })
    end
end

-- Build all JobStorage zones
-- for _, v in pairs(Config.JobSettings.Locations.JobStorage) do
--     addJobStorageZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_JobStorageIds then return end
    for _, id in ipairs(WW_JobStorageIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
--<!>-- STASHES START --<!>--
AddEventHandler('boii-whitewidow:client:OpenStash', function(data)
    local player = PlayerPedId()
    if not data.forceentry then
        TriggerEvent('md-stashes:client:OpenStash',  data.stash, 1000000, 40)
        -- TriggerEvent('inventory:client:SetCurrentStash', data.stash)
        -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
        --     maxweight = 1000000, -- Adjust storage weight here
        --     slots = 41, -- Adjust storage slots here
        -- })
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)  
    else
        Core.Functions.Progressbar(data.stash, Language.Shared['forceentry'], Config.JobSettings.Raid.ForceEntryTime*1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = Config.JobSettings.Raid.ForceEntryAnimationDict,
            anim = Config.JobSettings.Raid.ForceEntryAnimation,
            flags = Config.JobSettings.Raid.ForceEntryFlags,
        }, {}, {}, function()
        TriggerEvent('md-stashes:client:OpenStash',  data.stash, 1000000, 40)
        --     TriggerEvent('inventory:client:SetCurrentStash', data.stash)
        -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
        --     maxweight = 1000000, -- Adjust storage weight here
        --     slots = 41, -- Adjust storage slots here
        -- })
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4) 
            ClearPedTasks(player)
        end, function()
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-whitewidow:notifications', Language.Shared['cancel'], 'error')
        end)
    end
end)
--<!>-- STASHES END --<!>--
--<!>-- BOSS STORAGE END --<!>--

--<!>-- EPOS START --<!>--
-- EPOS
-- EPOS zones (works with qb-target and ox_target)

-- Require the job and grade >= 2
local function hasEPOSAccess()
    local PD = exports.qbx_core:GetPlayerData()
    if not PD or not PD.job then return false end
    if PD.job.name ~= Config.JobSettings.JobName then return false end
    local lvl = (PD.job.grade and (PD.job.grade.level or PD.job.grade)) or 0
    return lvl >= 2
end

local function addEPOSZone(v)
    local jobName   = Config.JobSettings.JobName
    local eposIcon  = (Language.Targeting and Language.Targeting['eposicon']) or 'fa-credit-card'
    local eposLabel = (Language.Targeting and Language.Targeting['eposlabel']) or 'EPOS'
    local distance  = v.distance or 1.8

    if TargetName == 'ox_target' then
        -- ox_target uses a single-table API
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_epos_%s'):format(v.name or 'pos'),
                    icon     = eposIcon,
                    label    = eposLabel,
                    distance = distance,                -- per-option in ox_target
                    groups   = { [jobName] = 0 },       -- must have the job
                    canInteract = function(_, dist)
                        return dist <= distance and hasEPOSAccess() -- grade >= 2
                    end,
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:WhiteWidowPay')
                    end
                }
            }
        })

        WW_EPOSZoneIds = WW_EPOSZoneIds or {}
        table.insert(WW_EPOSZoneIds, id)

    else
        -- qb-target signature: AddBoxZone(name, center, length, width, zoneOpts, interact)
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = 'boii-whitewidow:client:WhiteWidowPay',
                    icon  = eposIcon,
                    label = eposLabel,
                    job   = jobName,                 -- coarse job gate
                    canInteract = function(_, dist)
                        return dist <= distance and hasEPOSAccess() -- grade >= 2
                    end
                },
            },
            distance = distance,                     -- zone-level in qb-target
        })
    end
end

-- Build all EPOS zones
-- for _, v in pairs(Config.JobSettings.Locations.EPOS) do
--     addEPOSZone(v)
-- end

-- optional cleanup for ox_target zones
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_EPOSZoneIds then return end
    for _, id in ipairs(WW_EPOSZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
-- Event to charge customers
RegisterNetEvent('boii-whitewidow:client:WhiteWidowPay', function()
    TriggerEvent("qb-payments:client:Charge", source, {}, true)
    -- local input = exports[InputName]:ShowInput({
    --     header = Language.Locations.Billing['paymenuheader'],
    --     submitText = Language.Locations.Billing['paymenuheadertext'],
    --     inputs = {
    --         {
    --             type = 'number',
    --             isRequired = true,
    --             name = 'id',
    --             text = Language.Locations.Billing['paytext']
    --         },
    --         {
    --             type = 'number',
    --             isRequired = true,
    --             name = 'amount',
    --             text = Language.Locations.Billing['payamount'],
    --         }
    --     }
    -- })
    -- if input then
    --     if not input.id or not input.amount then 
    --         return 
    --     end
    --     TriggerServerEvent('boii-whitewidow:server:WhiteWidowPay', input.id, input.amount)
    -- end
end)
--<!>-- EPOS START --<!>--

--<!>-- STORAGE TRAY START --<!>--
-- Tray storage
local function addTrayZone(v)
    local icon    = (Language.Targeting and Language.Targeting['traystorageicon']) or 'fa-tray'
    local label   = (Language.Targeting and Language.Targeting['traystoragelabel']) or 'Open Tray'
    local distance= v.distance or 1.8
    local stash   = v.stash or 'ww_tray_storage' -- allow per-location override

    if TargetName == 'ox_target' then
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_tray_%s'):format(v.name or 'pos'),
                    icon     = icon,
                    label    = label,
                    distance = distance,
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:OpenTrayStorage', { stash = stash })
                    end
                }
            }
        })

        WW_TrayZoneIds = WW_TrayZoneIds or {}
        table.insert(WW_TrayZoneIds, id)

    else
        -- qb-target signature
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    icon   = icon,
                    label  = label,
                    -- use action so we can pass extra data
                    action = function()
                        TriggerEvent('boii-whitewidow:client:OpenTrayStorage', { stash = stash })
                    end
                }
            },
            distance = distance,
        })
    end
end

-- Build all Tray zones
-- for _, v in pairs(Config.JobSettings.Locations.Tray) do
--     addTrayZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_TrayZoneIds then return end
    for _, id in ipairs(WW_TrayZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
-- Tray storage event
RegisterNetEvent('boii-whitewidow:client:OpenTrayStorage', function()
    TriggerEvent('md-stashes:client:OpenStash',  'wwtraystorage', 21000, 5)
    -- TriggerEvent('inventory:client:SetCurrentStash', 'wwtraystorage')
    -- TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'wwtraystorage', {
    --     maxweight = 21000, -- Adjust storage weight here
    --     slots = 5, -- Adjust storage slots here
    -- })
end)
--<!>-- STORAGE TRAY END --<!>--

--<!>-- ROLLING JOINTS START --<!>--
local function hasJobAccess()
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == Config.JobSettings.JobName) or false
end

local function addRollingZone(v)
    local jobName  = Config.JobSettings.JobName
    local icon     = (Language.Targeting and Language.Targeting['rollingicon']) or 'fa-cannabis'
    local label    = (Language.Targeting and Language.Targeting['rollinglabel']) or 'Roll Joints'
    local distance = v.distance or 1.8

    if TargetName == 'ox_target' then
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_roll_%s'):format(v.name or 'pos'),
                    icon     = icon,
                    label    = label,
                    distance = distance,                -- per-option distance in ox_target
                    groups   = { [jobName] = 0 },       -- must have the job
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end,
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:RollJointsMenu')
                    end
                }
            }
        })

        WW_RollingZoneIds = WW_RollingZoneIds or {}
        table.insert(WW_RollingZoneIds, id)

    else
        -- qb-target signature: AddBoxZone(name, center, length, width, zoneOpts, interact)
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = 'boii-whitewidow:client:RollJointsMenu',
                    icon  = icon,
                    label = label,
                    job   = jobName,                 -- coarse job gate
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end
                },
            },
            distance = distance,                     -- zone-level distance in qb-target
        })
    end
end

-- Build all Rolling zones
-- for _, v in pairs(Config.JobSettings.Locations.Rolling) do
--     addRollingZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_RollingZoneIds then return end
    for _, id in ipairs(WW_RollingZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
--<!>-- JOINTS END --<!>--

--<!>-- STORES START --<!>--
-- for k, v in pairs(Config.JobSettings.Locations.JobStore) do
    -- exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
    --     name=v.name,
    --     heading= v.heading,
    --     debugPoly= v.debugPoly,
    --     minZ = v.minZ,
    --     maxZ = v.maxZ,
    --     },{
    --     options = {
    --         {
    --         event = 'boii-whitewidow:client:OpenJobStore',
    --         icon = Language.Targeting['jobstoreicon'],
    --         label = Language.Targeting['jobstorelabel'],
    --         job = Config.JobSettings.JobName
    --         },
    --     },
    --     distance = v.distance,
    -- })
-- end
-- for k, v in pairs(Config.JobSettings.Locations.SnackTable) do
    -- exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
    --     name=v.name,
    --     heading= v.heading,
    --     debugPoly= v.debugPoly,
    --     minZ = v.minZ,
    --     maxZ = v.maxZ,
    --     },{
    --     options = {
    --         {
    --         event = 'boii-whitewidow:client:OpenSnackTable',
    --         icon = Language.Targeting['snacktableicon'],
    --         label = Language.Targeting['snacktablelabel']
    --         },
    --     },
    --     distance = v.distance,
    -- })
-- end
-- Open job store
RegisterNetEvent('boii-whitewidow:client:OpenJobStore', function()
    local ShopItems = {}
    ShopItems.label = 'wwjobstore'
    ShopItems.items = Config.JobSettings.Stores.JobStore
    ShopItems.slots = #Config.JobSettings.Stores.JobStore
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'wwjobstore', ShopItems)
end)
-- Open snacks
RegisterNetEvent('boii-whitewidow:client:OpenSnackTable', function()
    local ShopItems = {}
    ShopItems.label = 'wwsnacks'
    ShopItems.items = Config.JobSettings.Stores.SnackTable
    ShopItems.slots = #Config.JobSettings.Stores.SnackTable
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'wwsnacks', ShopItems)
end)
--<!>-- STORES END --<!>--

--<!>-- OUTFITS START --<!>--
-- Clothing zones (works with qb-target and ox_target)

local function hasJobAccess()
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == Config.JobSettings.JobName) or false
end

local function addClothingZone(v)
    local jobName  = Config.JobSettings.JobName
    local icon     = (Language.Targeting and Language.Targeting['outfiticon']) or 'fa-shirt'
    local label    = (Language.Targeting and Language.Targeting['outfitlabel']) or 'Change Outfit'
    local distance = v.distance or 1.8

    if TargetName == 'ox_target' then
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_outfit_%s'):format(v.name or 'pos'),
                    icon     = icon,
                    label    = label,
                    distance = distance,                 -- per-option in ox_target
                    groups   = { [jobName] = 0 },        -- job lock
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end,
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:ChangeOutfit')
                    end
                }
            }
        })

        WW_ClothingZoneIds = WW_ClothingZoneIds or {}
        table.insert(WW_ClothingZoneIds, id)

    else
        -- qb-target signature: AddBoxZone(name, center, length, width, zoneOpts, interact)
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = 'boii-whitewidow:client:ChangeOutfit',
                    icon  = icon,
                    label = label,
                    job   = jobName,                    -- job lock
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end
                },
            },
            distance = distance,                        -- zone-level in qb-target
        })
    end
end

-- Build all Clothing zones
-- for _, v in pairs(Config.JobSettings.Locations.Clothing) do
--     addClothingZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_ClothingZoneIds then return end
    for _, id in ipairs(WW_ClothingZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)

-- Event stays the same
RegisterNetEvent('boii-whitewidow:client:ChangeOutfit', function()
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Clothes1', 0.4)
    TriggerEvent(ClothingEvent)  -- from your config
end)
--<!>-- OUTFITS END --<!>--

--<!>-- TRIMMING START --<!>--
local function hasJobAccess()
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == Config.JobSettings.JobName) or false
end

local function addTrimmingZone(v)
    local jobName  = Config.JobSettings.JobName
    local icon     = (Language.Targeting and Language.Targeting['trimicon']) or 'fa-scissors'
    local label    = (Language.Targeting and Language.Targeting['trimlabel']) or 'Trimming'
    local distance = v.distance or 1.8

    if TargetName == 'ox_target' then
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_trim_%s'):format(v.name or 'pos'),
                    icon     = icon,
                    label    = label,
                    distance = distance,                -- per-option in ox_target
                    groups   = { [jobName] = 0 },       -- must have the job
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end,
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:TrimmingMenu')
                    end
                }
            }
        })

        WW_TrimmingZoneIds = WW_TrimmingZoneIds or {}
        table.insert(WW_TrimmingZoneIds, id)

    else
        -- qb-target signature: AddBoxZone(name, center, length, width, zoneOpts, interact)
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = 'boii-whitewidow:client:TrimmingMenu',
                    icon  = icon,
                    label = label,
                    job   = jobName,                 -- coarse job gate
                    canInteract = function(_, dist)
                        return dist <= distance and hasJobAccess()
                    end
                },
            },
            distance = distance,                     -- zone-level distance in qb-target
        })
    end
end

-- Build all Trimming zones
-- for _, v in pairs(Config.JobSettings.Locations.Trimming) do
--     addTrimmingZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_TrimmingZoneIds then return end
    for _, id in ipairs(WW_TrimmingZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
--<!>-- TRIMMING END --<!>--

--<!>-- BONGS START --<!>--
for k, v in pairs(Config.JobSettings.Locations.BongTables) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-whitewidow:client:BongMenu',
            icon = Language.Targeting['bongicon'],
            label = Language.Targeting['bonglabel'],
            },
        },
        distance = v.distance,
    })
end
--<!>-- BONGS END --<!>--

--<!>-- HARVESTING START --<!>--
-- Strain 1
local function hasJobAccess()
    local PD = exports.qbx_core:GetPlayerData()
    return PD and PD.job and (PD.job.name == Config.JobSettings.JobName) or false
end

local function hasHarvestItem()
    local item = Config.JobSettings.Harvest and Config.JobSettings.Harvest.HarvestItem
    if not item or item == '' then return true end -- no requirement configured
    -- ox_inventory client-side search
    local count = exports.ox_inventory:Search('count', item) or 0
    return count > 0
end

local function addHarvestZoneForStrain(strainIdx, locTable)
    if not locTable then return end

    local jobName   = Config.JobSettings.JobName
    local harvestIt = Config.JobSettings.Harvest and Config.JobSettings.Harvest.HarvestItem
    local icon      = (Language.Targeting and Language.Targeting['harvesticon']) or 'fa-seedling'
    local labelKey  = ('strain%slabel'):format(strainIdx)
    local label     = (Language.Targeting and Language.Targeting[labelKey]) or ('Harvest Strain '..tostring(strainIdx))
    local eventName = ('boii-whitewidow:client:HarvestStrain%s'):format(strainIdx)

    for _, v in pairs(locTable) do
        local distance = v.distance or 1.8

        if TargetName == 'ox_target' then
            -- Build ox_target box zone
            local minZ   = v.minZ or (v.coords.z - 1.0)
            local maxZ   = v.maxZ or (v.coords.z + 1.0)
            local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
            local midZ   = minZ + (height * 0.5)

            local id = exports.ox_target:addBoxZone({
                coords   = vec3(v.coords.x, v.coords.y, midZ),
                size     = vec3(v.length, v.width, height),
                rotation = v.heading or 0.0,
                debug    = v.debugPoly or false,
                options  = {
                    {
                        name     = ('ww_harvest_s%s_%s'):format(strainIdx, v.name or 'pos'),
                        icon     = icon,
                        label    = label,
                        distance = distance,                -- per-option distance in ox_target
                        groups   = { [jobName] = 0 },       -- must have the job
                        -- ox_target supports items requirement; keep it and also sanity-check below
                        items    = harvestIt and { harvestIt } or nil,
                        canInteract = function(_, dist)
                            return dist <= distance and hasJobAccess() and hasHarvestItem()
                        end,
                        onSelect = function()
                            local menuId = ('harvest_context_strain_%s'):format(strainIdx)

                            lib.registerContext({
                                id = menuId,
                                title = label,
                                options = {
                                    {
                                        title = 'Harvest 1 Plant',
                                        description = 'Collect a single plant from this strain',
                                        icon = 'fa-seedling',
                                        event = eventName,
                                        args = 1
                                    },
                                    {
                                        title = 'Harvest 3 Plants',
                                        description = 'Collect three plants from this strain',
                                        icon = 'fa-seedling',
                                        event = eventName,
                                        args = 3
                                    }
                                }
                            })

                            lib.showContext(menuId)
                        end

                    }
                }
            })

            WW_HarvestZoneIds = WW_HarvestZoneIds or {}
            table.insert(WW_HarvestZoneIds, id)

        else
            -- qb-target: AddBoxZone(name, center, length, width, zoneOpts, interact)
            exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
                name      = v.name,
                heading   = v.heading,
                debugPoly = v.debugPoly,
                minZ      = v.minZ,
                maxZ      = v.maxZ,
            }, {
                options = {
                    {
                        event = eventName,
                        icon  = icon,
                        label = label,
                        job   = jobName,                 -- coarse job gate
                        item  = harvestIt,               -- qb-target item requirement
                        canInteract = function(_, dist)  -- extra safety
                            return dist <= distance and hasJobAccess() and hasHarvestItem()
                        end
                    },
                },
                distance = distance,                    -- zone-level in qb-target
            })
        end
    end
end

-- Build Strain 1..8 zones
addHarvestZoneForStrain(1, Config.JobSettings.Locations.Harvest.Strain1)
addHarvestZoneForStrain(2, Config.JobSettings.Locations.Harvest.Strain2)
addHarvestZoneForStrain(3, Config.JobSettings.Locations.Harvest.Strain3)
addHarvestZoneForStrain(4, Config.JobSettings.Locations.Harvest.Strain4)
addHarvestZoneForStrain(5, Config.JobSettings.Locations.Harvest.Strain5)

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_HarvestZoneIds then return end
    for _, id in ipairs(WW_HarvestZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
--<!>-- HARVESTING END --<!>--

--<!>-- EDIBLES TABLE START --<!>--
-- Targeting
local function addEdiblesZone(v)
    local icon     = (Language.Targeting and Language.Targeting['ediblesicon']) or 'fa-cookie-bite'
    local label    = (Language.Targeting and Language.Targeting['edibleslabel']) or 'Edibles Menu'
    local distance = v.distance or 1.8

    if TargetName == 'ox_target' then
        -- ox_target: single-table API
        local minZ   = v.minZ or (v.coords.z - 1.0)
        local maxZ   = v.maxZ or (v.coords.z + 1.0)
        local height = (maxZ - minZ) > 0 and (maxZ - minZ) or 2.0
        local midZ   = minZ + (height * 0.5)

        local id = exports.ox_target:addBoxZone({
            coords   = vec3(v.coords.x, v.coords.y, midZ),
            size     = vec3(v.length, v.width, height),
            rotation = v.heading or 0.0,
            debug    = v.debugPoly or false,
            options  = {
                {
                    name     = ('ww_edibles_%s'):format(v.name or 'pos'),
                    icon     = icon,
                    label    = label,
                    distance = distance,
                    onSelect = function()
                        TriggerEvent('boii-whitewidow:client:EdiblesMenu')
                    end
                }
            }
        })

        WW_EdiblesZoneIds = WW_EdiblesZoneIds or {}
        table.insert(WW_EdiblesZoneIds, id)

    else
        -- qb-target: two-table API
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name      = v.name,
            heading   = v.heading,
            debugPoly = v.debugPoly,
            minZ      = v.minZ,
            maxZ      = v.maxZ,
        }, {
            options = {
                {
                    event = 'boii-whitewidow:client:EdiblesMenu',
                    icon  = icon,
                    label = label,
                },
            },
            distance = distance,
        })
    end
end

-- Build all Edibles zones
-- for _, v in pairs(Config.JobSettings.Locations.Edibles) do
--     addEdiblesZone(v)
-- end

-- optional cleanup for ox_target
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() or not WW_EdiblesZoneIds then return end
    for _, id in ipairs(WW_EdiblesZoneIds) do
        pcall(function() exports.ox_target:removeZone(id) end)
    end
end)
-- Prepare edibles
RegisterNetEvent('boii-whitewidow:client:PrepareEdibles', function(args)
    local player = PlayerPedId()
    args = tonumber(args)
    name = ''
    gummy = ''
    gummyamount = ''
    timer = ''
    weedcrop = ''
    cropremove = ''
    item1name = ''
    item1amount = ''
    item2name = ''
    item2amount = ''
    item3name = ''
    item3amount = ''
    ProgressAnimationDict = Config.JobSettings.Edibles.ProgressAnimationDict
    ProgressAnimation = Config.JobSettings.Edibles.ProgressAnimation
    ProgressFlags = Config.JobSettings.Edibles.ProgressFlags
    if args == 1 then
        name = 'ww_edibles_s1'
        gummy = Config.JobSettings.Edibles.Strain1.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain1.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain1.Time
        weedcrop = Config.JobSettings.Harvest.Strain1.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain1.RemoveAmount
        item2name = Config.JobSettings.Edibles.Strain1.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain1.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain1.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain1.RequiredItems['3'].amount
    elseif args == 2 then
        name = 'ww_edibles_s2'
        gummy = Config.JobSettings.Edibles.Strain2.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain2.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain2.Time
        weedcrop = Config.JobSettings.Harvest.Strain2.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain2.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain2.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain2.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain2.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain2.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain2.RequiredItems['3'].amount
    elseif args == 3 then
        name = 'ww_edibles_s3'
        gummy = Config.JobSettings.Edibles.Strain3.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain3.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain3.Time
        weedcrop = Config.JobSettings.Harvest.Strain3.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain3.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain3.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain3.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain3.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain3.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain3.RequiredItems['3'].amount
    elseif args == 4 then
        name = 'ww_edibles_s4'
        gummy = Config.JobSettings.Edibles.Strain4.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain4.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain4.Time
        weedcrop = Config.JobSettings.Harvest.Strain4.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain4.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain4.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain4.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain4.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain4.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain4.RequiredItems['3'].amount
    elseif args == 5 then
        name = 'ww_edibles_s5'
        gummy = Config.JobSettings.Edibles.Strain5.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain5.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain5.Time
        weedcrop = Config.JobSettings.Harvest.Strain5.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain5.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain5.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain5.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain5.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain5.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain5.RequiredItems['3'].amount
    end
    Core.Functions.Progressbar(name, Language.Locations.Edibles['makeedibles'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ProgressAnimationDict,
        anim = ProgressAnimation,
        flags = ProgressFlags,
    }, {}, {}, function()
        TriggerServerEvent('boii-whitewidow:server:RemoveItem', weedcrop, cropremove)
        Wait(200)
        TriggerServerEvent('boii-whitewidow:server:RemoveItem', item2name, item2amount)
        TriggerServerEvent('boii-whitewidow:server:RemoveItem', item3name, item3amount)
        Wait(1000)
        TriggerServerEvent('boii-whitewidow:server:AddItem', gummy, gummyamount)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)
end)
-- Eat edibles
RegisterNetEvent('boii-whitewidow:client:EatEdibles', function(args)
    local player = PlayerPedId()
    args = tonumber(args)
    name = ''
    edible = ''
    timer = ''
    armour = ''
    stress = ''
    ProgressAnimationDict = Config.DrugSettings.Edibles.ProgressAnimationDict
    ProgressAnimation = Config.DrugSettings.Edibles.ProgressAnimation
    ProgressFlags = Config.DrugSettings.Edibles.ProgressFlags
    if args == 1 then
        name = 'ww_ediblestrain1'
        edible = Config.JobSettings.Edibles.Strain1.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain1.Time
        armour = Config.DrugSettings.Edibles.Strain1.Armour
        stress = Config.DrugSettings.Edibles.Strain1.Stress
    elseif args == 2 then
        name = 'ww_ediblestrain2'
        edible = Config.JobSettings.Edibles.Strain2.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain2.Time
        armour = Config.DrugSettings.Edibles.Strain2.Armour
        stress = Config.DrugSettings.Edibles.Strain2.Stress
    elseif args == 3 then
        name = 'ww_ediblestrain3'
        edible = Config.JobSettings.Edibles.Strain3.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain3.Time
        armour = Config.DrugSettings.Edibles.Strain3.Armour
        stress = Config.DrugSettings.Edibles.Strain3.Stress
    elseif args == 4 then
        name = 'ww_ediblestrain4'
        edible = Config.JobSettings.Edibles.Strain4.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain4.Time
        armour = Config.DrugSettings.Edibles.Strain4.Armour
        stress = Config.DrugSettings.Edibles.Strain4.Stress
    elseif args == 5 then
        name = 'ww_ediblestrain5'
        edible = Config.JobSettings.Edibles.Strain5.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain5.Time
        armour = Config.DrugSettings.Edibles.Strain5.Armour
        stress = Config.DrugSettings.Edibles.Strain5.Stress
    end
    Core.Functions.Progressbar(name, Language.Locations.Edibles['eatedibles'], timer*1000, false, true,{
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ProgressAnimationDict,
        anim = ProgressAnimation,
        flags = ProgressFlags,
    }, {}, {}, function()
        local currentTime = GetGameTimer()
        -- Remove old timestamps (older than 10 minutes)
        for i = #UsageTimestamps, 1, -1 do
            if currentTime - UsageTimestamps[i] > 600000 then -- 10 minutes in ms
                table.remove(UsageTimestamps, i)
            end
        end

        -- Add current timestamp
        table.insert(UsageTimestamps, currentTime)

        if Config.DrugSettings.Edibles.ScreenEffects == true and #UsageTimestamps > 1  then
            TriggerServerEvent('boii-whitewidow:server:RemoveItem', edible, 1)
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)           
            ClearPedTasks(player)
            EdiblesEffect()
        elseif Config.DrugSettings.Edibles.ScreenEffects == false then
            TriggerServerEvent('boii-whitewidow:server:RemoveItem', edible, 1)
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)   
            ClearPedTasks(player)
        end
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)
end)

RegisterNetEvent('boii-whitewidow:client:EatCustomEdibles', function(args)
    local player = PlayerPedId()
    name = tostring(args)
    edible = tostring(args)
    timer = Config.DrugSettings.Edibles.Strain1.Time
    armour = Config.DrugSettings.Edibles.Strain1.Armour
    stress = Config.DrugSettings.Edibles.Strain1.Stress
    ProgressAnimationDict = ''
    ProgressAnimation = ''
    Prop = {
     model = '',
     bone = 0,
     coords = vec3(0.0, 0.0, 0.0),
     rotation = vec3(0.0, 0.0, 0.0),
    }
    if args == 'cosmicbrownie' then
        ProgressAnimationDict = 'mp_player_inteat@burger'
        ProgressAnimation = 'mp_player_int_eat_burger'
        Prop.model = 'bzzz_sugary_brownies_a'
        Prop.bone = 60309
        Prop.coords = vec3(-0.02, 0.0, -0.02)
        Prop.rotation = vec3( 10.0, 0.0, 0.0)
    elseif args == 'weedcakepop' then
        ProgressAnimationDict = 'mp_player_inteat@burger'
        ProgressAnimation = 'mp_player_int_eat_burger'
        Prop.model = 'bzzz_sugary_lollipop_b'
        Prop.bone = 60309
        Prop.coords = vec3(0.0,-0.01,0.0)
        Prop.rotation = vec3(-101.0, 0.0, 76.0)
    end
    Core.Functions.Progressbar(name, Language.Locations.Edibles['eatedibles'], timer*1000, false, true,{
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ProgressAnimationDict,
        anim = ProgressAnimation,
    }, {
        model = Prop.model,
        bone = Prop.bone,
        coords = Prop.coords,
        rotation = Prop.rotation,
    }, {}, function()
        if Config.DrugSettings.Edibles.ScreenEffects == true then
            TriggerServerEvent('boii-whitewidow:server:RemoveItem', edible, 1)
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)           
            ClearPedTasks(player)
            EdiblesEffect()
        elseif Config.DrugSettings.Edibles.ScreenEffects == false then
            TriggerServerEvent('boii-whitewidow:server:RemoveItem', edible, 1)
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)   
            ClearPedTasks(player)
        end
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)
end)

-- Spawns table
CreateThread(function()
    RequestModel(`v_ret_fh_kitchtable`)
    while not HasModelLoaded(`v_ret_fh_kitchtable`) do 
        Wait(1) 
    end
    EdibleTable = CreateObject(`v_ret_fh_kitchtable`, 171.95, -234.50, 49.06, false, false, false)
    SetEntityHeading(EdibleTable,340.50)
    FreezeEntityPosition(EdibleTable, true)
end)
--<!>-- EDIBLES END --<!>--

--<!>-- GARAGE START --<!>--
if Config.MLOVersion == 'v1' then
    for k, v in pairs(Config.JobSettings.Locations.V1Garage) do
        exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading= v.heading,
            debugPoly= v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ,
            },{
            options = {
                {
                event = 'boii-whitewidow:client:AccessGarage',
                icon = Language.Targeting['garageicon'],
                label = Language.Targeting['garagelabel'],
                },
            },
            distance = v.distance,
        })
    end
end
RegisterNetEvent('boii-whitewidow:client:RentVehicle', function()
	Core.Functions.TriggerCallback('boii-whitewidow:server:MoneyCheck', function(price)
		if price then
            if Config.MLOVersion == 'v1' then
                Core.Functions.SpawnVehicle(Config.JobSettings.Garage.Vehicle, function(van)
                    SetVehicleNumberPlateText(van, 'WWIDOW')
                    exports[FuelEvent]:SetFuel(van, 100.0)
                    SetEntityHeading(van, Config.JobSettings.Garage.Heading)
                    TaskWarpPedIntoVehicle(PlayerPedId(), van, -1)
                    TriggerEvent('vehiclekeys:client:SetOwner', Core.Functions.GetPlate(van))
                    SetVehicleEngineOn(van, true, true)
                end, Config.JobSettings.Garage.Spawn, true)  
            elseif Config.MLOVersion == 'v2' then
                Core.Functions.SpawnVehicle(Config.JobSettings.Garage.Vehicle, function(van)
                    SetVehicleNumberPlateText(van, 'WWIDOW')
                    exports[FuelEvent]:SetFuel(van, 100.0)
                    SetEntityHeading(van, Config.JobSettings.Garage.V2Garage.Heading)
                    TaskWarpPedIntoVehicle(PlayerPedId(), van, -1)
                    TriggerEvent('vehiclekeys:client:SetOwner', Core.Functions.GetPlate(van))
                    SetVehicleEngineOn(van, true, true)
                end, Config.JobSettings.Garage.V2Garage.Spawn, true)
            end 
		end
	end)
end)
RegisterNetEvent('boii-whitewidow:client:ReturnVehicle', function()
	local player = PlayerPedId()
	if IsPedInAnyVehicle(player) then
        if Config.MLOVersion == 'v1' then
            local van = GetVehiclePedIsIn(player,true) 
            Core.Functions.DeleteVehicle(van)
            SetEntityCoords(player, Config.JobSettings.Garage.Spawn.x, Config.JobSettings.Garage.Spawn.y, Config.JobSettings.Garage.Spawn.z, 0, 0, 0, false) 
            SetEntityHeading(player, Config.JobSettings.Garage.Heading)
            TriggerServerEvent('boii-whitewidow:server:ReturnDeposit')
        elseif Config.MLOVersion == 'v2' then
            local van = GetVehiclePedIsIn(player,true) 
            Core.Functions.DeleteVehicle(van)
            SetEntityCoords(player, Config.JobSettings.Garage.V2Garage.Spawn.x, Config.JobSettings.Garage.V2Garage.Spawn.y, Config.JobSettings.Garage.V2Garage.Spawn.z, 0, 0, 0, false) 
            SetEntityHeading(player, Config.JobSettings.Garage.V2Garage.Heading)
            TriggerServerEvent('boii-whitewidow:server:ReturnDeposit')
        end
	end
end)
--<!>-- VEHICLE RENTAL MENU END --<!>--
