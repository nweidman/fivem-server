local alcoholCount = 0
local relieveCount = 0
local healing = false
local smokingWeed = false

local function healOxy()
    if not healing then
        healing = true
    else
        return
    end

    local count = 9
    while count > 0 do
        Wait(1000)
        count -= 1
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) + 6)
    end
    healing = false
end

local function trevorEffect()
    AnimpostfxPlay('DrugsTrevorClownsFightIn', 3.0, false)
    Wait(3000)
    AnimpostfxPlay('DrugsTrevorClownsFight', 3.0, false)
    Wait(3000)
    AnimpostfxPlay('DrugsTrevorClownsFightOut', 3.0, false)
    AnimpostfxStop('DrugsTrevorClownsFight')
    AnimpostfxStop('DrugsTrevorClownsFightIn')
    AnimpostfxStop('DrugsTrevorClownsFightOut')
end
exports('TrevorEffect', trevorEffect)

local function methBagEffect()
    local startStamina = 8
    trevorEffect()
    SetRunSprintMultiplierForPlayer(cache.playerId, 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(cache.playerId, 1.0)
        end
        startStamina -= 1
        if math.random(5, 100) < 51 then
            trevorEffect()
        end
    end
    SetRunSprintMultiplierForPlayer(cache.playerId, 1.0)
end
exports('MethBagEffect', methBagEffect)

local function ecstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
        RestorePlayerStamina(cache.playerId, 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(cache.ped) then
        SetPedToRagdoll(cache.ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
end
exports('EcstasyEffect', ecstasyEffect)

local function alienEffect()
    AnimpostfxPlay('DrugsMichaelAliensFightIn', 3.0, false)
    Wait(math.random(5000, 8000))
    AnimpostfxPlay('DrugsMichaelAliensFight', 3.0, false)
    Wait(math.random(5000, 8000))
    AnimpostfxPlay('DrugsMichaelAliensFightOut', 3.0, false)
    AnimpostfxStop('DrugsMichaelAliensFightIn')
    AnimpostfxStop('DrugsMichaelAliensFight')
    AnimpostfxStop('DrugsMichaelAliensFightOut')
end
exports('AlienEffect', alienEffect)

local function crackBaggyEffect()
    local startStamina = 8
    alienEffect()
    SetRunSprintMultiplierForPlayer(cache.playerId, 1.3)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(cache.playerId, 1.0)
        end
        startStamina -= 1
        if math.random(1, 100) < 60 and IsPedRunning(cache.ped) then
            SetPedToRagdoll(cache.ped, math.random(1000, 2000), math.random(1000, 2000), 3, false, false, false)
        end
        if math.random(1, 100) < 51 then
            alienEffect()
        end
    end
    if IsPedRunning(cache.ped) then
        SetPedToRagdoll(cache.ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
    SetRunSprintMultiplierForPlayer(cache.playerId, 1.0)
end
exports('CrackBaggyEffect', crackBaggyEffect)

local function cokeBaggyEffect()
    local startStamina = 20
    alienEffect()
    SetRunSprintMultiplierForPlayer(cache.playerId, 1.1)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(cache.playerId, 1.0)
        end
        startStamina -= 1
        if math.random(1, 100) < 10 and IsPedRunning(cache.ped) then
            SetPedToRagdoll(cache.ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
        end
        if math.random(1, 300) < 10 then
            alienEffect()
            Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(cache.ped) then
        SetPedToRagdoll(cache.ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
    SetRunSprintMultiplierForPlayer(cache.playerId, 1.0)
end
exports('CokeBaggyEffect', cokeBaggyEffect)

local function smokeWeed()
    CreateThread(function()
        while smokingWeed do
            Wait(10000)
            TriggerServerEvent('hud:server:RelieveStress', math.random(15, 18))
            relieveCount += 1
            if relieveCount == 6 then
                exports.scully_emotemenu:cancelEmote()
                if smokingWeed then
                    smokingWeed = false
                    relieveCount = 0
                end
            end
        end
    end)
end

lib.callback.register('consumables:client:Eat', function(anim, prop)
    if lib.progressBar({
        duration = 5000,
        label = locale('progress.eating'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = anim or {
            clip = 'mp_player_int_eat_burger',
            dict = 'mp_player_inteat@burger',
            flag = 49
        },
        prop = prop or {
            {
                model = 'prop_cs_burger_01',
                bone = 18905,
                pos = {x = 0.13, y = 0.05, z = 0.02},
                rot = {x = -50.0, y = 16.0, z = 60.0}
            }
        }
    }) then -- if completed
        return true
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
        return false
    end
end)

lib.callback.register('consumables:client:Drink', function(anim, prop)
    if lib.progressBar({
        duration = 5000,
        label = locale('progress.drinking'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = anim or {
            clip = 'loop_bottle',
            dict = 'mp_player_intdrink',
            flag = 49
        },
        prop = prop or {
            {
                model = 'prop_ld_flow_bottle',
                bone = 18905,
                pos = {x = 0.12, y = 0.008, z = 0.03},
                rot = {x = 240.0, y = -60.0, z = 0.0}
            }
        }
    }) then -- if completed
        return true
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
        return false
    end
end)

lib.callback.register('consumables:client:DrinkAlcohol', function(alcoholLevel, anim, prop)
    if lib.progressBar({
        duration = math.random(3000, 6000),
        label = locale('progress.drinking_liquor'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = anim or {
            clip = 'loop_bottle',
            dict = 'mp_player_intdrink',
            flag = 49
        },
        prop = prop or {
            {
                model = 'prop_amb_beer_bottle',
                bone = 18905,
                pos = {x = 0.12, y = 0.008, z = 0.03},
                rot = {x = 240.0, y = -60.0, z = 0.0}
            }
        }
    }) then -- if completed
        alcoholCount += alcoholLevel or 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent('evidence:client:SetStatus', 'alcohol', 200)
        elseif alcoholCount >= 4 then
            TriggerEvent('evidence:client:SetStatus', 'heavyalcohol', 200)
        end
        return true
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
        return false
    end
end)

RegisterNetEvent('consumables:client:Cokebaggy', function()
    if lib.progressBar({
        duration = math.random(5000, 8000),
        label = locale('progress.popping_pills'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'switch@trevor@trev_smoking_meth',
            clip = 'trev_smoking_meth_loop',
            flag = 49
        }
    }) then -- if completed
        local used = lib.callback.await('consumables:server:usedItem', false, 'cokebaggy')
        if not used then return end

        TriggerEvent('evidence:client:SetStatus', 'widepupils', 200)
        cokeBaggyEffect()
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

RegisterNetEvent('consumables:client:Crackbaggy', function()
    if lib.progressBar({
        duration = math.random(7000, 10000),
        label = locale('progress.smoking_crack'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'switch@trevor@trev_smoking_meth',
            clip = 'trev_smoking_meth_loop',
            flag = 49
        }
    }) then -- if completed
        local used = lib.callback.await('consumables:server:usedItem', false, 'crack_baggy')
        if not used then return end

        TriggerEvent('evidence:client:SetStatus', 'widepupils', 300)
        crackBaggyEffect()
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

RegisterNetEvent('consumables:client:EcstasyBaggy', function()
    if lib.progressBar({
        duration = 3000,
        label = locale('progress.popping_pills'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'mp_suicide',
            clip = 'pill',
            flag = 49
        }
    }) then -- if completed
        local used = lib.callback.await('consumables:server:usedItem', false, 'xtcbaggy')
        if not used then return end

        ecstasyEffect()
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

RegisterNetEvent('consumables:client:oxy', function()
    if lib.progressBar({
        duration = 2000,
        label = locale('progress.healing'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'mp_suicide',
            clip = 'pill',
            flag = 49
        }
    }) then -- if completed
        local used = lib.callback.await('consumables:server:usedItem', false, 'oxy')
        if not used then return end

        ClearPedBloodDamage(cache.ped)
        healOxy()
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

RegisterNetEvent('consumables:client:meth', function()
    if lib.progressBar({
        duration = 1500,
        label = locale('progress.smoking_meth'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'switch@trevor@trev_smoking_meth',
            clip = 'trev_smoking_meth_loop',
            flag = 49
        }
    }) then -- if completed
        local used = lib.callback.await('consumables:server:usedItem', false, 'meth')
        if not used then return end

        TriggerEvent('evidence:client:SetStatus', 'widepupils', 300)
        TriggerEvent('evidence:client:SetStatus', 'agitated', 300)
        methBagEffect()
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

RegisterNetEvent('consumables:client:UseJoint', function()
    if lib.progressBar({
        duration = 1500,
        label = locale('progress.lighting_joint'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        }
    }) then -- if completed
        local used = lib.callback.await('consumables:server:usedItem', false, 'joint')
        if not used then return end

        exports.scully_emotemenu:playEmoteByCommand('joint')
        TriggerEvent('evidence:client:SetStatus', 'weedsmell', 300)
        smokeWeed()
    else -- if canceled
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

--@TODO Rework this to only run when needed.
CreateThread(function()
    while true do
        Wait(10)
        if alcoholCount > 0 then
            Wait(1000 * 60 * 15)
            alcoholCount -= 1
        else
            Wait(2000)
        end
    end
end)

--     -- Mysterybox

-- RegisterNetEvent("consumables:client:useMysteryBox", function()
--     local ped = cache.ped

--     if lib.progressBar({
--         duration = 5000,
--         label = "Opening mystery bag...",
--         useWhileDead = false,
--         canCancel = true,
--         disable = {
--             move = false,
--             car = true,
--             mouse = false,
--             combat = true
--         },
--         anim = {
--             dict = "anim@heists@box_carry@",
--             clip = "idle",
--             flag = 49
--         },
--         prop = {
--             model = `xs_prop_arena_bag_01`,
--             bone = 60309,
--             pos = vec3(0.155, -0.05, 0.300),
--             rot = vec3(300.0, 290.0, 0.0)
--         }
--     }) then
--         TriggerServerEvent("consumables:server:mysteryReward")
--     else
--         lib.notify({ description = "Canceled.", type = "error" })
--     end
-- end)

    -- Armor + Heavy Armor

local function playArmorAnim()
    lib.requestAnimDict('missmic4')
    return lib.progressBar({
        duration = 8500,
        label = 'Putting on body armor..',
        useWhileDead = false,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true },
        anim = { dict = 'missmic4', clip = 'michael_tux_fidget', flag = 49 }
    })
end

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    local ped = cache.ped or PlayerPedId()
    local ok = playArmorAnim()
    StopAnimTask(ped, 'missmic4', 'michael_tux_fidget', 1.0)
    ClearPedTasks(ped)

    if ok then
        TriggerServerEvent('consumables:server:useHeavyArmor')
    else
        lib.notify({ type = 'error', description = 'Canceled.' })
    end
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    local ped = cache.ped or PlayerPedId()
    local ok = playArmorAnim()
    StopAnimTask(ped, 'missmic4', 'michael_tux_fidget', 1.0)
    ClearPedTasks(ped)

    if ok then
        TriggerServerEvent('consumables:server:useArmor')
    else
        lib.notify({ type = 'error', description = 'Canceled.' })
    end
end)

RegisterNetEvent('consumables:client:UseKevlar', function()
    local ped = cache.ped or PlayerPedId()
    local ok = playArmorAnim()
    StopAnimTask(ped, 'missmic4', 'michael_tux_fidget', 1.0)
    ClearPedTasks(ped)

    if ok then
        TriggerServerEvent('consumables:server:useKevlar')
    else
        lib.notify({ type = 'error', description = 'Canceled.' })
    end
end)

RegisterNetEvent('consumables:client:ApplyArmor', function(amount)
    local ped = cache.ped or PlayerPedId()
    SetPedArmour(ped, amount)
end)

-- /propfix

local function takeControl(ent, tries)
    tries = tries or 10
    if not DoesEntityExist(ent) then return false end
    local netId = NetworkGetNetworkIdFromEntity(ent)
    if netId == 0 then return true end
    NetworkRequestControlOfEntity(ent)
    local t = 0
    while t < tries and not NetworkHasControlOfEntity(ent) do
        Wait(0)
        NetworkRequestControlOfEntity(ent)
        t = t + 1
    end
    return NetworkHasControlOfEntity(ent)
end

RegisterNetEvent('os:propfix', function()
    local ped = cache.ped or PlayerPedId()

    TriggerEvent('backitems:displayItems', false)

    local removed = 0
    local objects = GetGamePool('CObject')

    for i = 1, #objects do
        local obj = objects[i]
        if DoesEntityExist(obj) and IsEntityAttachedToEntity(obj, ped) then
            takeControl(obj)
            SetEntityAsMissionEntity(obj, true, true)
            DetachEntity(obj, true, true)
            DeleteObject(obj)
            DeleteEntity(obj)
            if not DoesEntityExist(obj) then
                removed = removed + 1
            else
                SetEntityCoords(obj, 0.0, 0.0, -100.0, false, false, false, true)
            end
        end
    end

    TriggerEvent('backitems:displayItems', true)

    lib.notify({
        type = 'inform',
        description = ('Removed %d attached props.'):format(removed)
    })
end)

-- client.lua

local Notify = function(msg, type)
    exports.qbx_core:Notify(msg, type or 'inform')
end

-- Save tables
local savedPants, savedShoes, savedNeck, savedGloves, savedUndershirt = {}, {}, {}, {}, {}

local function myServerId()
    return GetPlayerServerId(PlayerId())
end

local function getPed()
    return cache and cache.ped or PlayerPedId()
end

local function isMale(ped)
    return GetEntityModel(ped) == `mp_m_freemode_01`
end

------------------------------------------------------------
-- Pass-through from server to your CRM radial
------------------------------------------------------------
RegisterNetEvent('dq:radial:toggle', function(clthKey)
    -- Your resource should already listen for this client-side event
    -- We simply forward the specific key.
    TriggerEvent('crm-radial:toggle-clothing', clthKey)
end)

------------------------------------------------------------
-- Pants (component 4)
------------------------------------------------------------
RegisterNetEvent('dq:toggle:pants', function()
    local ped = getPed()

    if isMale(ped) then
        -- keep your original behavior: route to CRM radial for male freemode
        TriggerEvent('crm-radial:toggle-clothing', 'crm-clth-pants')
        return
    end

    local id = myServerId()
    if not savedPants[id] then
        savedPants[id] = {
            drawable = GetPedDrawableVariation(ped, 4),
            texture  = GetPedTextureVariation(ped, 4)
        }
        SetPedComponentVariation(ped, 4, 15, 0, 2) -- no pants variant
        Notify('You have removed your pants.', 'success')
    else
        local s = savedPants[id]
        SetPedComponentVariation(ped, 4, s.drawable, s.texture, 2)
        savedPants[id] = nil
        Notify('You put your pants back on.', 'success')
    end
end)

------------------------------------------------------------
-- Shoes (component 6)
------------------------------------------------------------
RegisterNetEvent('dq:toggle:shoes', function()
    local ped = getPed()

    if isMale(ped) then
        TriggerEvent('crm-radial:toggle-clothing', 'crm-clth-shoes')
        return
    end

    local id = myServerId()
    if not savedShoes[id] then
        savedShoes[id] = {
            drawable = GetPedDrawableVariation(ped, 6),
            texture  = GetPedTextureVariation(ped, 6)
        }
        SetPedComponentVariation(ped, 6, 35, 0, 2) -- your chosen "no shoes" index
        Notify('You have removed your shoes.', 'success')
    else
        local s = savedShoes[id]
        SetPedComponentVariation(ped, 6, s.drawable, s.texture, 2)
        savedShoes[id] = nil
        Notify('You put your shoes back on.', 'success')
    end
end)

------------------------------------------------------------
-- Neck (component 7)
------------------------------------------------------------
RegisterNetEvent('dq:toggle:neck', function()
    local ped = getPed()

    if isMale(ped) then
        TriggerEvent('crm-radial:toggle-clothing', 'crm-clth-neck')
        return
    end

    local id = myServerId()
    if not savedNeck[id] then
        savedNeck[id] = {
            drawable = GetPedDrawableVariation(ped, 7),
            texture  = GetPedTextureVariation(ped, 7)
        }
        SetPedComponentVariation(ped, 7, 20, 0, 2) -- your "no neck acc" index
        Notify('You have removed your neck accessory.', 'success')
    else
        local s = savedNeck[id]
        SetPedComponentVariation(ped, 7, s.drawable, s.texture, 2)
        savedNeck[id] = nil
        Notify('You put your neck accessory back on.', 'success')
    end
end)

------------------------------------------------------------
-- Gloves (component 3 / arms)
------------------------------------------------------------
RegisterNetEvent('dq:toggle:gloves', function()
    local ped = getPed()
    local id  = myServerId()

    if not savedGloves[id] then
        savedGloves[id] = {
            drawable = GetPedDrawableVariation(ped, 3),
            texture  = GetPedTextureVariation(ped, 3)
        }
        SetPedComponentVariation(ped, 3, 15, 0, 2) -- typically "no gloves" arms
        Notify('You have removed your gloves.', 'success')
    else
        local s = savedGloves[id]
        SetPedComponentVariation(ped, 3, s.drawable, s.texture, 2)
        savedGloves[id] = nil
        Notify('You put your gloves back on.', 'success')
    end
end)

------------------------------------------------------------
-- Undershirt (component 8)
------------------------------------------------------------
RegisterNetEvent('dq:toggle:undershirt', function()
    local ped = getPed()
    local id  = myServerId()

    if not savedUndershirt[id] then
        savedUndershirt[id] = {
            drawable = GetPedDrawableVariation(ped, 8),
            texture  = GetPedTextureVariation(ped, 8)
        }
        SetPedComponentVariation(ped, 8, 15, 0, 2)
        Notify('You have removed your undershirt.', 'success')
    else
        local s = savedUndershirt[id]
        SetPedComponentVariation(ped, 8, s.drawable, s.texture, 2)
        savedUndershirt[id] = nil
        Notify('You put your undershirt back on.', 'success')
    end
end)

-- GANG CHANGING STATIONS

local inZone = false

CreateThread(function()
    local zones = {
        {
            coords = vec3(1405.1, 1160.21, 114.38),
            radius = 2.0,
            job = nil -- No job required for this one, MILK
        },
        {
            coords = vec3(-1887.91, 2080.33, 144.86),
            radius = 2.0,
            job = nil -- No job required for this one, BLACK HAND MAFIA
        },
        {
            coords = vec3(-1797.01, 426.47, 128.51),
            radius = 2.0,
            job = nil -- No job required for this one, HOS Mafia
        },
        {
            coords = vec3(-668.51, -873.41, 29.35),
            radius = 2.0,
            job = nil -- No job required for this one, GRIMZ
        },
        {
            coords = vec3(-1380.22, -635.61, 30.32),
            radius = 2.5,
            job = "bahama"
        },
        {
            coords = vec3(-1382.73, -636.89, 30.32),
            radius = 2.5,
            job = "bahama"
        }
    }

    local inZone = false
    local currentZone = nil

    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        inZone = false
        for _, zone in ipairs(zones) do
            if #(pos - zone.coords) < zone.radius then
                local playerJob = exports.qbx_core:GetPlayerData().job.name
                if not zone.job or playerJob == zone.job then
                    if currentZone ~= zone then
                        currentZone = zone
                        lib.showTextUI('[E] - Change Outfits', {
                            position = 'left-center',
                            icon = 'shirt',
                            style = {
                                borderRadius = 8,
                                backgroundColor = '#1d1d1d',
                                color = 'white'
                            }
                        })
                    end

                    sleep = 0 -- check quickly inside zone
                    inZone = true

                    if IsControlJustReleased(0, 38) then -- E key
                        TriggerEvent('crm-appearance:show-outfits')
                    end

                    break -- already in a valid zone, stop checking others
                end
            end
        end

        if not inZone and currentZone then
            lib.hideTextUI()
            currentZone = nil
        end

        Wait(sleep)
    end
end)

local fireworkTime = 0
local fireworkLoc = nil
local FireworkList = {
    ["proj_xmas_firework"] = {
        "scr_firework_xmas_ring_burst_rgw",
        "scr_firework_xmas_burst_rgw",
        "scr_firework_xmas_repeat_burst_rgw",
        "scr_firework_xmas_spiral_burst_rgw",
        "scr_xmas_firework_sparkle_spawn",
    },
    ["scr_indep_fireworks"] = {
        "scr_indep_firework_sparkle_spawn",
        "scr_indep_firework_starburst",
        "scr_indep_firework_shotburst",
        "scr_indep_firework_trailburst",
        "scr_indep_firework_trailburst_spawn",
        "scr_indep_firework_burst_spawn",
        "scr_indep_firework_trail_spawn",
        "scr_indep_firework_fountain",
    },
    ["proj_indep_firework"] = {
        "scr_indep_firework_grd_burst",
        "scr_indep_launcher_sparkle_spawn",
        "scr_indep_firework_air_burst",
        "proj_indep_flare_trail",
    },
    ["proj_indep_firework_v2"] = {
        "scr_firework_indep_burst_rwb",
        "scr_firework_indep_spiral_burst_rwb",
        "scr_xmas_firework_sparkle_spawn",
        "scr_firework_indep_ring_burst_rwb",
        "scr_xmas_firework_burst_fizzle",
        "scr_firework_indep_repeat_burst_rwb",
    },
}

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(true)
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

function FireWorkText()
    CreateThread(function()
        while true do
            Wait(0)
            if fireworkTime > 0 and fireworkLoc then
                DrawText3Ds(fireworkLoc.x, fireworkLoc.y, fireworkLoc.z, 'Firework over ~r~'..fireworkTime)
            end
            if fireworkTime <= 0 then break end
        end
    end)
end


local function DoFireWork(asset, coords)
    fireworkTime = 5
    fireworkLoc = {x = coords.x, y = coords.y, z = coords.z}
    CreateThread(function()
        FireWorkText()
        while fireworkTime > 0 do
            Wait(1000)
            fireworkTime -= 1
        end
        UseParticleFxAssetNextCall("scr_indep_fireworks")
        for _ = 1, math.random(5, 10), 1 do
            local firework = FireworkList[asset][math.random(1, #FireworkList[asset])]
            UseParticleFxAssetNextCall(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, fireworkLoc.x, fireworkLoc.y, fireworkLoc.z + 42.5, 0.0, 0.0, 0.0, math.random() * 0.3 + 0.5, false, false, false)
            Wait(math.random()*500)
        end
        fireworkLoc = nil
    end)
end

CreateThread(function()
    local asset = "scr_indep_fireworks"
    if not HasNamedPtfxAssetLoaded(asset) then
        RequestNamedPtfxAsset(asset)
        while not HasNamedPtfxAssetLoaded(asset) do
            Wait(10)
        end
    end
    local asset2 = "proj_xmas_firework"
    if not HasNamedPtfxAssetLoaded(asset2) then
        RequestNamedPtfxAsset(asset2)
        while not HasNamedPtfxAssetLoaded(asset2) do
            Wait(10)
        end
    end
    local asset3 = "proj_indep_firework_v2"
    if not HasNamedPtfxAssetLoaded(asset3) then
        RequestNamedPtfxAsset(asset3)
        while not HasNamedPtfxAssetLoaded(asset3) do
            Wait(10)
        end
    end
    local asset4 = "proj_indep_firework"
    if not HasNamedPtfxAssetLoaded(asset4) then
        RequestNamedPtfxAsset(asset4)
        while not HasNamedPtfxAssetLoaded(asset4) do
            Wait(10)
        end
    end
end)

RegisterNetEvent('fireworks:client:UseFirework', function(itemName, assetName)

    if lib.progressBar({
        duration = 3000,
        label = "Placing object...",
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true
        },
        anim = {
            dict = "anim@narcotics@trash",
            clip = "drop_front",
            flag = 16
        },
    }) then
        TriggerServerEvent("consumables:server:UseFirework", itemName)
        local pos = GetEntityCoords(PlayerPedId())
        DoFireWork(assetName, pos)
    else
        lib.notify({ description = "Canceled.", type = "error" })
    end
end)

    -- AMMO CASES

RegisterNetEvent("consumables:client:useAmmoCase", function()
    local ped = cache.ped

    if lib.progressBar({
        duration = 3000,
        label = "Unpacking Ammo...",
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = false,
            car = true,
            mouse = false,
            combat = false
        },
        anim = {
            dict = 'mp_arresting',
            clip = 'a_uncuff',     
            flag = 49
        }
    }) then
        TriggerServerEvent("consumables:server:AmmoCase")
    else
        lib.notify({ description = "Canceled.", type = "error" })
    end
end)

-- Backpacks

RegisterNetEvent('dq:runFixBag', function()
    ExecuteCommand('fixbag')
end)