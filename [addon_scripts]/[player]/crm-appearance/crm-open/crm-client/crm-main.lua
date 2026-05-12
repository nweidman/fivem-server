-- crm-core - wait for core to load modules.
crm_core_ready()

-- crm-appearance -

local crm_framework = crm_core:crm_lib().crm_info().crm_type

local crm_styles_blocked    = false            -- blocked while crutch is active
local ENFORCE_ACTIVE        = false            -- in a noisy window?
local ENFORCE_UNTIL         = 0                -- timestamp of enforcement end
local GUARD_TICK_NORMAL     = 1800             -- normal background tick
local GUARD_TICK_ENFORCE    = 150              -- rapid reapply during enforcement
local ENFORCE_COOLDOWN_APPLY= 300              -- min ms between applies in enforcement
local LAST_APPLY            = 0                -- last apply timestamp
local STRONG_INFLIGHT       = false            -- debounce strong reapply retries
-- firstTutorial = false

local function crm_is_crutch_active()
    local st = LocalPlayer and LocalPlayer.state or {}
    return st.usingCrutch or st.wasabi_crutch or st.wsb_usingCrutch or st.injuryCrutch or st.crutch or false
end

local function crm_safe_to_apply(ped, is_enforcing)
    if crm_styles_blocked or crm_is_crutch_active() then return false end
    if IsPedUsingAnyScenario(ped) then return false end
    if IsPedRagdoll(ped) or IsPedGettingUp(ped) then return false end
    if IsPedFatallyInjured(ped) or IsPedDeadOrDying(ped) then return false end
    return true
end

local function now() return GetGameTimer() end

local function crm_do_apply()
    if GetResourceState('is-playerstyles') == "started" then
        -- These exports should internally RequestAnimSet + SetPedMovementClipset etc.
        exports['is-playerstyles']:SetWalkingStyle()
        exports['is-playerstyles']:SetMood()
        LAST_APPLY = now()
    end
end

local function crm_reapply_player_styles_strong(delay, tries, interval)
    if STRONG_INFLIGHT then return end
    STRONG_INFLIGHT = true
    CreateThread(function()
        if crm_is_crutch_active() then STRONG_INFLIGHT = false return end
        Wait(tonumber(delay) or 400)
        tries    = tries    or 4
        interval = interval or 700
        for _ = 1, tries do
            local ped = PlayerPedId()
            if crm_safe_to_apply(ped, false) then
                crm_do_apply()
            end
            Wait(interval)
        end
        STRONG_INFLIGHT = false
    end)
end

local function enforce_for(ms)
    ENFORCE_UNTIL = math.max(ENFORCE_UNTIL, now() + (ms or 15000))
    ENFORCE_ACTIVE = true
end

function crm_on_open(_type)
    DisplayRadar(false)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(false)
    end
end

function crm_on_close(_type)
    DisplayRadar(true)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(true)
    end
    crm_reapply_player_styles_strong(200, 2, 400)
    enforce_for(10000)
    -- if firstTutorial then
    --     TriggerEvent('um-tutorial:client:openTutorial')
    --     firstTutorial = false
    -- end
end

local crm_data, crm_wait = nil, false

function crm_save_data()
    if crm_wait then return end
    crm_data = {
        crm_health = GetEntityHealth(crm_cache.crm_ped),
        crm_armour = GetPedArmour(crm_cache.crm_ped)
    }
    crm_wait = true
end

function crm_load_data()
    if not crm_data then return end
    SetEntityMaxHealth(crm_cache.crm_ped, 200)
    SetEntityHealth(crm_cache.crm_ped, crm_data.crm_health)
    SetPedArmour(crm_cache.crm_ped, crm_data.crm_armour)
    SetPlayerHealthRechargeMultiplier(crm_cache.crm_player_id, 0.0)
    SetPlayerHealthRechargeLimit(crm_cache.crm_player_id, 0.0)
    crm_data, crm_wait = nil, false
    crm_reapply_player_styles_strong(150, 2, 350)
    enforce_for(6000)
end

function crm_on_save(_type, crm_old, crm_new)
    if not crm_config.crm_items then return end
    local chg = {crm_clothing={}, crm_accessories={}}
    for i, o in ipairs(crm_old.crm_clothing or {}) do
        local n = crm_new.crm_clothing and crm_new.crm_clothing[i]
        if n and (o.crm_style ~= n.crm_style or o.crm_texture ~= n.crm_texture) then
            chg.crm_clothing[#chg.crm_clothing+1] = {crm_id=o.crm_id or i, crm_new_style=n.crm_style, crm_new_texture=n.crm_texture}
        end
    end
    for i, o in ipairs(crm_old.crm_accessories or {}) do
        local n = crm_new.crm_accessories and crm_new.crm_accessories[i]
        if n and (o.crm_style ~= n.crm_style or o.crm_texture ~= n.crm_texture) then
            chg.crm_accessories[#chg.crm_accessories+1] = {crm_id=o.crm_id or i, crm_new_style=n.crm_style, crm_new_texture=n.crm_texture}
        end
    end
    for _, c in ipairs(chg.crm_clothing)    do crm_debug(("[Style] Clothing %d -> style %d tx %d"):format(c.crm_id, c.crm_new_style, c.crm_new_texture)) end
    for _, c in ipairs(chg.crm_accessories) do crm_debug(("[Style] Accessory %d -> style %d tx %d"):format(c.crm_id, c.crm_new_style, c.crm_new_texture)) end
end

RegisterNetEvent("crm-appearance:init-new-character", function(g, cb)
    crm_init_player_appearance(g)
    crm_show_menu("crm-charcreator", cb)
    crm_reapply_player_styles_strong(300, 2, 400)
    enforce_for(8000)
end)

RegisterNetEvent("crm-appearance:load-player-skin", function()
    crm_init_appearance()
    crm_reapply_player_styles_strong(250, 2, 400)
    enforce_for(8000)
end)

RegisterNetEvent("crm-appearance:show-creator-menu", function()        crm_show_menu("crm-charcreator")   end)
RegisterNetEvent("crm-appearance:show-clothing-menu", function()       crm_show_menu('crm-clothingstore') end)
RegisterNetEvent("crm-appearance:show-barber-menu", function()         crm_show_menu('crm-barbershop')    end)
RegisterNetEvent("crm-appearance:show-plasticsurgery-menu", function() crm_show_menu('crm-plasticsurgery')end)

RegisterNetEvent("crm-appearance:show-outfits", function()
    crm_show_outfits(true, "crm-personal", nil)
    crm_reapply_player_styles_strong(300, 2, 400)
    enforce_for(6000)
end)

RegisterNetEvent("crm-appearance:show-job-outfits", function(job)
    crm_show_outfits(true, "crm-jobs", job)
    crm_reapply_player_styles_strong(300, 2, 400)
    enforce_for(6000)
end)

RegisterNetEvent("crm-appearance:show-job-outfits-auto", function()
    local job = crm_core:crm_lib().crm_character().crm_job.crm_name
    crm_show_outfits(true, "crm-jobs", job)
    crm_reapply_player_styles_strong(300, 2, 400)
    enforce_for(6000)
end)

if crm_framework == "crm_qb" or crm_framework == "crm_qbx" then
    RegisterNetEvent("qb-clothes:client:CreateFirstCharacter", function()
        -- firstTutorial = true
        crm_init_player_appearance('crm-male')
        crm_show_menu("crm-charcreator")
        SetEntityVisible(PlayerPedId(), true, false)
        crm_reapply_player_styles_strong(350, 2, 400)
        enforce_for(8000)
    end)

    RegisterNetEvent("qb-clothing:client:openMenu", function()
        crm_show_menu("crm-charcreator")
    end)

    RegisterNetEvent("qb-clothing:client:openOutfitMenu", function()
        crm_show_outfits(true, "crm-personal", nil)
        crm_reapply_player_styles_strong(300, 2, 400)
        enforce_for(6000)
    end)
end

local function crm_after_revive()
    crm_reapply_player_styles_strong(700, 3, 700)
    enforce_for(20000)  -- longer window, some forks clear late
end
RegisterNetEvent('wasabi_ambulance:revive',           crm_after_revive)
RegisterNetEvent('wasabi_ambulance:client:revive',    crm_after_revive)
RegisterNetEvent('wasabi_ambulance:revived',          crm_after_revive)
AddEventHandler('baseevents:respawned',               crm_after_revive)
AddEventHandler('wasabi_bridge:onPlayerSpawn',        crm_after_revive)

local function crm_watch_hospital_then_reapply(timeoutMs)
    CreateThread(function()
        local t0 = now()
        local timeout = timeoutMs or 35000
        Wait(400)
        while now() - t0 < timeout do
            local ped = PlayerPedId()
            if not IsPedUsingAnyScenario(ped) and not IsPedRagdoll(ped) and not IsPedGettingUp(ped) then break end
            Wait(250)
        end
        crm_reapply_player_styles_strong(800, 3, 800)
        enforce_for(20000)
    end)
end

for _, ev in ipairs({
    'wasabi_ambulance:client:checkIn',
    'wasabi_ambulance:checkIn',
    'wasabi_ambulance:client:hospitalCheckIn',
    'wasabi_ambulance:hospitalCheckIn',
    'wasabi_ambulance:client:sendToBed',
    'wasabi_ambulance:client:putInBed',
    'wasabi_ambulance:client:treated',
    'wasabi_ambulance:treated'
}) do
    RegisterNetEvent(ev, function(...) crm_watch_hospital_then_reapply(35000) end)
end

for _, ev in ipairs({
    'wasabi_ambulance:client:leaveBed',
    'wasabi_ambulance:leaveBed',
    'wasabi_ambulance:healed',
    'wasabi_ambulance:healedPlayer'
}) do
    RegisterNetEvent(ev, function(...)
        crm_reapply_player_styles_strong(800, 3, 800)
        enforce_for(20000)
    end)
end

AddEventHandler('wasabi_ambulance:heal', function(full, _quiet)
    crm_reapply_player_styles_strong(full and 900 or 600, 3, 700)
    enforce_for(18000)
end)
AddEventHandler('wasabi_ambulance:healIfaks', function()
    crm_reapply_player_styles_strong(700, 2, 700)
    enforce_for(15000)
end)
AddEventHandler('wasabi_ambulance:healAfaks', function()
    crm_reapply_player_styles_strong(700, 2, 700)
    enforce_for(15000)
end)

RegisterNetEvent('wasabi_ambulance:syncInjury', function(data, _notify)
    local has = data and next(data) ~= nil
    if not has then
        crm_reapply_player_styles_strong(600, 3, 700)
        enforce_for(15000)
    end
end)

local function crm_reapply_after_crutch_off(delay)
    CreateThread(function()
        Wait(delay or 450)
        if crm_is_crutch_active() then return end
        crm_reapply_player_styles_strong(100, 2, 350)
        enforce_for(6000)
    end)
end

local CRUTCH_ON = {
    'wasabi_ambulance:client:applyCrutch',
    'wasabi_ambulance:applyCrutch',
    'wasabi_ambulance:client:useCrutch',
    'wasabi_ambulance:useCrutch',
    'wasabi_ambulance:client:setCrutch',
    'wasabi_ambulance:setCrutch'
}
local CRUTCH_OFF = {
    'wasabi_ambulance:client:removeCrutch',
    'wasabi_ambulance:removeCrutch',
    'wasabi_ambulance:client:crutchRemoved',
    'wasabi_ambulance:crutchRemoved',
    'wasabi_ambulance:client:clearCrutch',
    'wasabi_ambulance:clearCrutch'
}
for _, ev in ipairs(CRUTCH_ON)  do RegisterNetEvent(ev, function() crm_styles_blocked = true  end) end
for _, ev in ipairs(CRUTCH_OFF) do RegisterNetEvent(ev, function() crm_styles_blocked = false crm_reapply_after_crutch_off(450) end) end

RegisterNetEvent('wasabi_crutch:breakLoop', function(args)
    local target = type(args) == 'table' and (args.id or args.source or args.src) or args
    local myId = GetPlayerServerId(PlayerId())
    if target ~= nil and tonumber(target) ~= tonumber(myId) then return end
    crm_styles_blocked = false
    crm_reapply_after_crutch_off(450)
end)

local function crm_is_self_bag(b) return b == ('player:' .. GetPlayerServerId(PlayerId())) end
local function onCrutchState(val)
    crm_styles_blocked = val and true or false
    if not val then crm_reapply_after_crutch_off(450) end
end
for _, key in ipairs({'usingCrutch','wasabi_crutch','wsb_usingCrutch','injuryCrutch','crutch'}) do
    AddStateBagChangeHandler(key, nil, function(bag, k, value)
        if crm_is_self_bag(bag) then onCrutchState(value) end
    end)
end

CreateThread(function()
    local last = false
    while true do
        Wait(600)
        local active = false
        if exports.wasabi_crutch and exports.wasabi_crutch:IsCrutchActive() then
            active = exports.wasabi_crutch:IsCrutchActive()
        else
            active = crm_is_crutch_active()
        end
        if active ~= last then onCrutchState(active) end
        last = active
    end
end)

CreateThread(function()
    Wait(400)
    if crm_is_crutch_active() then
        crm_styles_blocked = true
    else
        crm_reapply_player_styles_strong(300, 2, 400)
        enforce_for(6000)
    end
end)
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(300)
    if crm_is_crutch_active() then
        crm_styles_blocked = true
    else
        crm_reapply_player_styles_strong(300, 2, 400)
        enforce_for(6000)
    end
end)

CreateThread(function()
    while true do
        local tnow = now()
        if ENFORCE_ACTIVE and tnow >= ENFORCE_UNTIL then ENFORCE_ACTIVE = false end
        local tick = ENFORCE_ACTIVE and GUARD_TICK_ENFORCE or GUARD_TICK_NORMAL
        Wait(tick)

        local ped = PlayerPedId()
        if not crm_safe_to_apply(ped, ENFORCE_ACTIVE) then goto cont end

        if ENFORCE_ACTIVE then
            if (tnow - LAST_APPLY) >= ENFORCE_COOLDOWN_APPLY then
                crm_do_apply()
            end
        else
            if (tnow - LAST_APPLY) >= (GUARD_TICK_NORMAL + 500) then
                crm_do_apply()
            end
        end
        ::cont::
    end
end)

RegisterNetEvent('crm-appearance:fixBag', function()
    ExecuteCommand('fixbag')
end)