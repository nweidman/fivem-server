local DATA_ANIMATIONS <const> = lib.load("data.animations")
local USING_INVENTORY <const> = GetResourceState("ox_inventory"):find("start") and GetConvarInt("inventory:weaponanims", 1) ~= 1
local complete = true
local QBCore = exports["qb-core"]:GetCoreObject()

local weapons = {
    `WEAPON_UNARMED`,
    `WEAPON_KNIFE`,
    `WEAPON_NIGHTSTICK`,
    `WEAPON_BREAD`,
    `WEAPON_FLASHLIGHT`,
    `WEAPON_HAMMER`,
    `WEAPON_BAT`,
    `WEAPON_ZKKNIFE`,
    `WEAPON_GOLFCLUB`,
    `WEAPON_CROWBAR`,
    `WEAPON_BOTTLE`,
    `WEAPON_DAGGER`,
    `WEAPON_HATCHET`,
    `WEAPON_MACHETE`,
    `WEAPON_SWITCHBLADE`,
    `WEAPON_BATTLEAXE`,
    `WEAPON_POOLCUE`,
    `WEAPON_WRENCH`,
    `WEAPON_PISTOL`,
    `WEAPON_PISTOL_MK2`,
    `WEAPON_COMBATPISTOL`,
    `WEAPON_APPISTOL`,
    `WEAPON_PISTOL50`,
    `WEAPON_REVOLVER`,
    `WEAPON_SNSPISTOL`,
    `WEAPON_HEAVYPISTOL`,
    `WEAPON_VINTAGEPISTOL`,
    `WEAPON_MICROSMG`,
    `WEAPON_SMG`,
    `WEAPON_ASSAULTSMG`,
    `WEAPON_MINISMG`,
    `WEAPON_MACHINEPISTOL`,
    `WEAPON_COMBATPDW`,
    `WEAPON_PUMPSHOTGUN`,
    `WEAPON_SAWNOFFSHOTGUN`,
    `WEAPON_ASSAULTSHOTGUN`,
    `WEAPON_BULLPUPSHOTGUN`,
    `WEAPON_HEAVYSHOTGUN`,
    `WEAPON_ASSAULTRIFLE`,
    `WEAPON_CARBINERIFLE`,
    `WEAPON_ADVANCEDRIFLE`,
    `WEAPON_SPECIALCARBINE`,
    `WEAPON_BULLPUPRIFLE`,
    `WEAPON_COMPACTRIFLE`,
    `WEAPON_MG`,
    `WEAPON_COMBATMG`,
    `WEAPON_GUSENBERG`,
    `WEAPON_SNIPERRIFLE`,
    `WEAPON_HEAVYSNIPER`,
    `WEAPON_MARKSMANRIFLE`,
    `WEAPON_GRENADELAUNCHER`,
    `WEAPON_RPG`,
    `WEAPON_STINGER`,
    `WEAPON_MINIGUN`,
    `WEAPON_GRENADE`,
    `WEAPON_STICKYBOMB`,
    `WEAPON_SMOKEGRENADE`,
    `WEAPON_BZGAS`,
    `WEAPON_MOLOTOV`,
    `WEAPON_DIGISCANNER`,
    `weapon_fireextinguisher`,
    `WEAPON_FIREWORK`,
    `WEAPON_MUSKET`,
    `WEAPON_STUNGUN`,
    `WEAPON_HOMINGLAUNCHER`,
    `WEAPON_PROXMINE`,
    `WEAPON_FLAREGUN`,
    `WEAPON_MARKSMANPISTOL`,
    `WEAPON_RAILGUN`,
    `WEAPON_DBSHOTGUN`,
    `WEAPON_AUTOSHOTGUN`,
    `WEAPON_COMPACTLAUNCHER`,
    `WEAPON_PIPEBOMB`,
    `WEAPON_DOUBLEACTION`,
    `WEAPON_SNOWBALL`,
    `WEAPON_PISTOLXM3`,
    `WEAPON_CANDY_CANE`,
    `WEAPON_candyaxe`,
    `WEAPON_CARROTKNIFE`,
    `WEAPON_PENETRATOR`,
    `WEAPON_BIGHAMMER`,
    `WEAPON_CERAMICPISTOL`,
    `WEAPON_NAVYREVOLVER`,
    `WEAPON_GADGETPISTOL`,
    `WEAPON_PISTOLXM3`,
    `WEAPON_TECPISTOL`,
    `WEAPON_HEAVYRIFLE`,
    `WEAPON_MILITARYRIFLE`,
    `WEAPON_TACTICALRIFLE`,
    `WEAPON_SWEEPERSHOTGUN`,
    `WEAPON_ASSAULTRIFLE_MK2`,
    `WEAPON_BULLPUPRIFLE_MK2`,
    `WEAPON_CARBINERIFLE_MK2`,
    `WEAPON_COMBATMG_MK2`,
    `weapon_combatshotgun`,
    `WEAPON_HEAVYSNIPER_MK2`,
    `WEAPON_KNUCKLE`,
    `WEAPON_MARKSMANRIFLE_MK2`,
    `WEAPON_PRECISIONRIFLE`,
    `WEAPON_PETROLCAN`,
    `WEAPON_PUMPSHOTGUN_MK2`,
    `WEAPON_RAYCARBINE`,
    `WEAPON_RAYMINIGUN`,
    `WEAPON_RAYPISTOL`,
    `WEAPON_REVOLVER_MK2`,
    `WEAPON_SMG_MK2`,
    `WEAPON_SNSPISTOL_MK2`,
    `WEAPON_SPECIALCARBINE_MK2`,
    `WEAPON_STONE_HATCHET`,
    `weapon_agc`,
    `weapon_kvr`,
    `weapon_p5`,
    `weapon_pm4`,
    `weapon_mrevolver`,
    `WEAPON_M320b`,
    `weapon_projectx`,
    `WEAPON_PROJECTXSMG`,
    `WEAPON_PROJECTXPISTOL`,
    `WEAPON_ARCTIC516`,
    `WEAPON_MK18`,
    `weapon_mcxspear`,
    `weapon_nsr9`,
    `weapon_beanbagshotgun`,
    `weapon_rfb`,
    `weapon_2011`,
    `weapon_hk416b`,
    `weapon_sledgehammer`,
    `weapon_shiv`,
    `weapon_huntingrifle`,
    `weapon_penetrator`,
    `weapon_katana`,
    `weapon_katana2`,
    `weapon_katana3`,
    `weapon_katana4`,
    `weapon_candy_cane`,
    `weapon_c36`,
    `weapon_mi9`,
    `weapon_mutant_long`,
    `weapon_virtus_4`,
    `weapon_bluearp762`,
    `weapon_g19xcustom`,
    `weapon_arpsc`,
    `weapon_sfarp`,
    `weapon_glock41`,
    `weapon_plr16kt`,
    `weapon_g19xblack`,
    `weapon_g17g5mos`,
    `weapon_g26switchp`,
    `weapon_ar9sc`,
    `weapon_mpad`,
    `weapon_cg17p80s`,
    `weapon_mdsh`,
    `weapon_ak47`,
    `weapon_de`,
    `weapon_fnx45`,
    `weapon_glock17`,
    `weapon_m4`,
    `weapon_m9`,
    `weapon_m70`,
    `weapon_m1911`,
    `weapon_uzi`,
    `weapon_mac10`,
    `weapon_mossberg`,
    `weapon_remington`,
    `weapon_scarh`,
    `weapon_shiv`,
    `weapon_ar15`,
    `weapon_mk14`,
    `weapon_sledgehammer`,
    `weapon_mp9`,
    `weapon_m110`,
    `weapon_hk416`,
    `weapon_ak74`,
    `weapon_aks74`,
    `weapon_glock18c`,
    `weapon_glock22`,
    `weapon_mp5`,
    `weapon_karambit`,
    `weapon_mcxspear`,
    `weapon_nsr9`,
    `weapon_beanbagshotgun`,
    `weapon_rfb`,
    `weapon_2011`,
    `weapon_hk416b`,
    `weapon_agc`,
    `weapon_kvr`,
    `weapon_p5`,
    `weapon_pm4`,
    `weapon_mrevolver`,
    `weapon_x19`,
    `weapon_gang1`,
    `weapon_gang2`,
    `weapon_gang3`,
    `weapon_gang4`,
    `weapon_gang5`,
    `weapon_gang6`,
    `weapon_gang7`,
    `weapon_gang8`,
    `weapon_gang9`,
    `weapon_gang10`,
    `WEAPON_EASTERSEMI`,
    `WEAPON_EASTERHB`,
    `WEAPON_EASTERAP`,
    `weapon_x17`,
    `weapon_c36`,
    `weapon_mi9`,
    `weapon_mutant_long`,
    `weapon_virtus_4`,
    `weapon_bluearp762`,
    `weapon_g19xcustom`,
    `weapon_arpsc`,
    `weapon_sfarp`,
    `weapon_glock41`,
    `weapon_plr16kt`,
    `weapon_g19xblack`,
    `weapon_g17g5mos`,
    `weapon_g26switchp`,
    `weapon_cg17p80s`,
    `weapon_mdsh`,
    `WEAPON_MB47`,
    `WEAPON_2S`,
    `WEAPON_A45`,
    `WEAPON_590`,
    `weapon_huntingrifle`,
    `WEAPON_VALAXE`,
    `WEAPON_VALCLEVER`,
    `WEAPON_VALKNIFE`,
    `WEAPON_VALSPIKEDBAT`,
    `WEAPON_RATREV`,
    `WEAPON_FMICRODRAGON`,
    `WEAPON_PSTRIKEH`,
    `WEAPON_PSPIKE`,
    `WEAPON_PH4`,
    `WEAPON_PT39`,
    `WEAPON_P1911KT`,
    `WEAPON_PT19`,
    `WEAPON_PPH120`,
    `WEAPON_PCM4A1`,
    `WEAPON_PMK40H1`,
    `WEAPON_PXS9`,
    `WEAPON_PT17`,
    `WEAPON_PMK14`,
    `WEAPON_PHW45`,
    `WEAPON_PPH350`,
    `WEAPON_PDBATON`,
    `WEAPON_BTASER`,
    `WEAPON_YTASER`,
    `WEAPON_PDT19`,
    `WEAPON_PDPT870`,
    `WEAPON_PDPT700`,
    `WEAPON_MK417`,
    `WEAPON_PDDT607`,
    `WEAPON_PDDT7`,
    `WEAPON_PDT22`,
    `WEAPON_PDBR5`,
    `WEAPON_PDFC66`,
    `WEAPON_PDMK45`,
    `WEAPON_PDMK33`,
    `WEAPON_PDMKUSP`,
    `WEAPON_PROJECTXPISTOLUM`,
}

local function isVehicleBlocked(vehicle)
    if not vehicle then return end

    local class = GetVehicleClass(vehicle)
    return class == 8 or class == 13
end

local function isBlocked(ped)
    return isVehicleBlocked(cache.vehicle) or GetPedParachuteState(ped) > 0
end

local function getGender(ped)
    local model = GetEntityModel(ped)
    if model == `mp_m_freemode_01` then
        return "male"
    elseif model == `mp_f_freemode_01` then
        return "female"
    end
end

local function getWeaponAnim(ped, weapon, variant)
    local animations = DATA_ANIMATIONS.animations
    local weaponGroups = DATA_ANIMATIONS?.weaponGroups
    local weaponAnims = DATA_ANIMATIONS?.weapons
    local clothingInfo = DATA_ANIMATIONS?.clothing?[variant]
    local anim = nil
    local currentWeaponGroup = GetWeapontypeGroup(weapon)
    local gender = getGender(ped)

    local animByGroup = weaponGroups?[currentWeaponGroup]
    if animByGroup or animByGroup == false then
        anim = animByGroup
    end

    local animByWeapon = weaponAnims?[weapon]
    if animByWeapon or animByWeapon == false then
        anim = animByWeapon
    end

    if not clothingInfo then goto skip end

    for i=1, #clothingInfo do
        local info = clothingInfo[i]
        if not lib.table.contains(info.weapons, weapon) then goto next end

        
        local components = info[gender]
        if not components then goto next end

        local holster = GetPedDrawableVariation(ped, info.variation)
        if lib.table.contains(components, holster) then
            anim = info.anim
        end

        ::next::
    end

    ::skip::

    if anim == nil then
        anim = DATA_ANIMATIONS.default
    end

    return animations[anim]
end

local function startWaponAnim(ped, info, weapon, hideWeapon)
    local coords = GetEntityCoords(ped)
    lib.requestAnimDict(info.dict)
    TaskPlayAnimAdvanced(ped, info.dict, info.clip, coords.x, coords.y, coords.z, 0, 0, GetEntityHeading(ped), 8.0, 3.0, info.duration*2, 50, 0.1)
    RemoveAnimDict(info.dict)

    SetTimeout(info.clothing or info.duration/2, function()
        TriggerEvent("ND_GunAnims:updateHolster", weapon, hideWeapon)
    end)

    Wait(info.duration)
    
    if info.cancel then
        StopAnimTask(ped, info.dict, info.clip, 2.0)
    end
end

local function playWeaponAnim(weapon, variant)
    local ped = cache.ped
    local info = getWeaponAnim(ped, weapon, variant)

    if not info or isBlocked(ped) then
        return
    end

    info = info[variant]
    if not info then return end

    if info.dict then
        startWaponAnim(ped, info, weapon, variant == "unholster")
    else
        local anims = info
        for i=1, #anims do
            local info = anims[i]
            startWaponAnim(ped, info, weapon, variant == "unholster")
        end
    end
end

function thread(variant, ped, hash)
    LocalPlayer.state.invBusy = true

    if variant == "holster" then
        CreateThread(function()
            SetPedCurrentWeaponVisible(ped, false, false)
            DisablePlayerFiring(cache.playerId, true)

            while not complete do
                DisableControlAction(1, 25, true)
                DisableControlAction(1, 68, true)
                DisableControlAction(1, 70, true)
                DisableControlAction(1, 91, true)
                Wait(0)
            end

            DisablePlayerFiring(cache.playerId, false)
            SetPedCurrentWeaponVisible(ped, true, false)
        end)
    else
        CreateThread(function()
            DisablePlayerFiring(cache.playerId, true)
            while not complete do
                if USING_INVENTORY then                 
                    GiveWeaponToPed(ped, hash, 0, false, true)
                    SetCurrentPedWeapon(ped, hash, true)
                end
                DisableControlAction(1, 25, true)
                DisableControlAction(1, 68, true)
                DisableControlAction(1, 70, true)
                DisableControlAction(1, 91, true)
                Wait(0)
            end
            DisablePlayerFiring(cache.playerId, false)
        end)
    end

    LocalPlayer.state.invBusy = false
end

if USING_INVENTORY then
    local items = exports.ox_inventory:Items()

    AddEventHandler("ox_inventory:usedItem", function(name, slotId, metadata)
        local data = items[name]
        if not data or not data.weapon or data.ammo then return end

        complete = false
        local ped = cache.ped
        
        thread("holster", ped, data.hash)
        playWeaponAnim(data.hash, "unholster")
        complete = true
    end)

    AddEventHandler("ox_inventory:currentWeapon", function(weapon)
        local hash = cache.weapon
        local ped = cache.ped
        if not hash or weapon then return end

        complete = false

        thread("unholster", ped, hash)

        if hash ~= 883325847 then -- dont play anim on petrolcan
            playWeaponAnim(hash, "holster")
        end

        complete = true
    end)
end

if not USING_INVENTORY then
    local _, weapon = GetCurrentPedWeapon(cache.ped, true)
    local weaponInHand = nil

    local function weaponChanged(value)
        local ped = cache.ped
        local hash = value or weapon
        complete = false

        if value then
            thread("holster", ped, hash)
            playWeaponAnim(hash, "unholster")
        else
            thread("unholster", ped, hash)
            playWeaponAnim(hash, "holster")
        end
        
        complete = true
    end
    local function checkWeapon(newWeap)
        for i = 1, #weapons do
            if joaat(weapons[i]) == newWeap then
                return true
            end
        end
        return false
    end
    CreateThread(function()
        while true do
            local _, currentWeapon = GetCurrentPedWeapon(cache.ped, true)
            if checkWeapon(currentWeapon) then
                if currentWeapon ~= weapon then
                    local new = currentWeapon ~= `WEAPON_UNARMED` and currentWeapon
                    weaponChanged(new)
                    weaponInHand = new
                    weapon = currentWeapon
                end
            end
            Wait(0)
        end
    end)
end
