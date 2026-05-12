local Config = lib.require('config')

local knockedOut = false
local UNARMED = `WEAPON_UNARMED`

-- =========================
-- Damage modifier helpers
-- =========================
local function _setWeaponDamageModifier(hash, mult)
    if SetWeaponDamageModifier then
        SetWeaponDamageModifier(hash, mult)
    else
        -- 0x4757F00BC6323CFE = NATIVE: SetWeaponDamageModifier(weaponHash, damageMultiplier)
        Citizen.InvokeNative(0x4757F00BC6323CFE, hash, mult + 0.0)
    end
end

local function applyFistDamage()
    if not Config.FistDamage or not Config.FistDamage.enabled then return end
    _setWeaponDamageModifier(UNARMED, Config.FistDamage.multiplier or 1.0)
end

local function resetFistDamage()
    _setWeaponDamageModifier(UNARMED, 1.0)
end

-- =========================
-- Wake up / KO loops
-- =========================
local function wakeUp()
    if not knockedOut then return end
    ClearTimecycleModifier()
    lib.hideTextUI()
    knockedOut = false

    -- ensure we're not leaving any invincibility on
    SetEntityInvincible(cache.ped, false)
    SetEntityCanBeDamaged(cache.ped, true)
    SetPedCanBeTargetted(cache.ped, true)

    -- restore configured fist multiplier after KO
    if Config.FistDamage and Config.FistDamage.enabled then
        applyFistDamage()
    end
end

local function knockedOutLoop()
    SetTimecycleModifier('hud_def_blur')
    lib.showTextUI('You are currently knocked out..', { position = 'top-center' })

    if Config.RestoreHealth then
        CreateThread(function()
            while knockedOut and GetEntityHealth(cache.ped) < GetEntityMaxHealth(cache.ped) do
                Wait(2000)
                SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) + 5)
            end
        end)
    end

    CreateThread(function()
        while knockedOut do
            Wait(100)

            -- keep them damageable while KO
            SetEntityCanBeDamaged(cache.ped, true)
            SetPedCanBeTargetted(cache.ped, true)

            SetPedToRagdoll(cache.ped, 500, 500, 0, 0, 0, 0)
            ResetPedRagdollTimer(cache.ped)

            if IsEntityDead(cache.ped) then
                wakeUp()
                break
            end
        end
    end)
end

-- =========================================
-- KO trigger: only on unarmed melee damage
-- =========================================
AddEventHandler('gameEventTriggered', function(event, data)
    if event ~= 'CEventNetworkEntityDamage' then return end

    -- victim ped index check
    local victimIdx = NetworkGetPlayerIndexFromPed(data[1])
    if victimIdx ~= cache.playerId then return end

    -- ensure melee context and that it was unarmed damage
    if not IsPedInMeleeCombat(cache.ped) then return end
    if not HasPedBeenDamagedByWeapon(cache.ped, UNARMED, 0) then return end

    if not knockedOut and GetEntityHealth(cache.ped) < (Config.Health or 125) then
        knockedOut = true

        -- DO NOT make invincible; we WANT damage during KO
        SetEntityInvincible(cache.ped, false)
        SetEntityCanBeDamaged(cache.ped, true)
        SetPedCanBeTargetted(cache.ped, true)

        -- keep fist multiplier active during KO (so hits still scale)
        -- (do NOT resetFistDamage here)

        knockedOutLoop()
        SetTimeout((Config.KnockoutTime or 20) * 1000, wakeUp)
    end
end)

-- =========================
-- Lifecycle hooks
-- =========================
-- Apply fist damage when the resource starts (client)
AddEventHandler('onClientResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    CreateThread(function()
        while not cache.ped or cache.ped == 0 do Wait(50) end
        applyFistDamage()
    end)
end)

-- Re-apply on player spawn (covers death/respawn)
AddEventHandler('playerSpawned', function()
    CreateThread(function()
        Wait(250)
        applyFistDamage()

        -- in case another resource changed these flags during death/respawn
        if knockedOut then
            SetEntityInvincible(cache.ped, false)
            SetEntityCanBeDamaged(cache.ped, true)
            SetPedCanBeTargetted(cache.ped, true)
        end
    end)
end)

-- Clean reset if resource stops
AddEventHandler('onClientResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    resetFistDamage()
    -- do not force wake here; just ensure no lingering invincibility
    if cache.ped and cache.ped ~= 0 then
        SetEntityInvincible(cache.ped, false)
        SetEntityCanBeDamaged(cache.ped, true)
        SetPedCanBeTargetted(cache.ped, true)
    end
end)

-- =========================
-- (Optional) Live tweak command via ox_lib
-- =========================
-- lib.addCommand('fistmult', {
--     help = 'Set unarmed damage multiplier (e.g. /fistmult 1.25)',
--     params = { { name = 'mult', type = 'number' } },
--     restricted = 'group.admin' -- adjust to your permission model
-- }, function(_, args)
--     local mult = tonumber(args.mult)
--     if not mult or mult <= 0 then
--         return lib.notify({ title = 'Fist Multiplier', description = 'Invalid value', type = 'error' })
--     end
--     Config.FistDamage = Config.FistDamage or {}
--     Config.FistDamage.enabled = true
--     Config.FistDamage.multiplier = mult
--     if not knockedOut or true then -- keep active even during KO
--         applyFistDamage()
--     end
--     lib.notify({ title = 'Fist Multiplier', description = ('Set to %.2f'):format(mult), type = 'success' })
-- end)
