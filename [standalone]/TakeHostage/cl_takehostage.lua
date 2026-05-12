-----------------------------------------------------------------
--TakeHostage by Robbster, do not redistrbute without permission--
------------------------------------------------------------------

local takeHostage = {
	allowedWeapons = {
'WEAPON_ASSAULTRIFLE',
'WEAPON_BULLPUPRIFLE',
'WEAPON_COMBATPISTOL',
'WEAPON_CARBINERIFLE',
'WEAPON_CARBINERIFLE_MK2',
'WEAPON_HEAVYPISTOL',
'WEAPON_MICROSMG',
'WEAPON_MUSKET',
'WEAPON_PISTOL',
'WEAPON_PISTOL_MK2',
'WEAPON_PISTOL50',
'WEAPON_PUMPSHOTGUN',
'WEAPON_REVOLVER',
'WEAPON_SNSPISTOL',
'WEAPON_SMG',
'WEAPON_SPECIALCARBINE',
'WEAPON_SAWNOFFSHOTGUN',
'weapon_appistol',
'weapon_stungun',
'weapon_vintagepistol',
'weapon_marksmanpistol',
'weapon_revolver_mk2',
'weapon_doubleaction',
'weapon_snspistol_mk2',
'weapon_ceramicpistol',
'weapon_navyrevolver',
'weapon_gadgetpistol',
'weapon_pistolxm3',
'weapon_2011',
'weapon_smg_mk2',
'weapon_assaultsmg',
'weapon_combatpdw',
'weapon_machinepistol',
'weapon_minismg',
'weapon_assaultshotgun',
'weapon_bullpupshotgun',
'weapon_musket',
'weapon_heavyshotgun',
'weapon_dbshotgun',
'weapon_autoshotgun',
'weapon_pumpshotgun_mk2',
'weapon_combatshotgun',
'weapon_assaultrifle_mk2',
'weapon_carbinerifle_mk2',
'weapon_advancedrifle',
'weapon_compactrifle',
'weapon_specialcarbine_mk2',
'weapon_bullpuprifle_mk2',
'weapon_militaryrifle',
'weapon_projectx',
'WEAPON_PROJECTXSMG',
'WEAPON_PROJECTXPISTOL',
'WEAPON_ARCTIC516',
'weapon_ak47',
'weapon_de',
'weapon_fnx45',
'weapon_glock17',
'weapon_m4',
'weapon_m9',
'weapon_m70',	
'weapon_m1911',	
'weapon_uzi',	
'weapon_mac10',
'weapon_mossberg', 
'weapon_remington',
'weapon_scarh',
'weapon_shiv',	
'weapon_ar15',	
'weapon_mk14',
'weapon_sledgehammer',
'weapon_mp9',			
'weapon_m110',			
'weapon_hk416',	
'weapon_ak74',
'weapon_aks74',	
'weapon_glock18c',	
'weapon_glock22',
'weapon_mp5',
'weapon_karambit',	
'weapon_mcxspear', 		
'weapon_nsr9', 
'weapon_beanbagshotgun',
'weapon_rfb',         
'weapon_2011',
'weapon_hk416b',    
'weapon_agc',	
'weapon_kvr',
'weapon_p5',	
'weapon_pm4',
'weapon_mrevolver',
'weapon_x19',
'weapon_GANG1',
'weapon_GANG2',
'weapon_GANG3',
'weapon_GANG4',
'weapon_GANG5',
'weapon_GANG6',
'weapon_GANG7',
'weapon_GANG8',
'weapon_GANG9',
'weapon_GANG10',
'WEAPON_EASTERAP',
'WEAPON_EASTERHB',
'WEAPON_EASTERSEMI',
'WEAPON_MK18',	
'WEAPON_M320b',	
'WEAPON_590',
'weapon_x17',
'weapon_c36',		
'weapon_mi9',			
'weapon_mutant_long',		
'weapon_virtus_4',	
'weapon_bluearp762',       
'weapon_g19xcustom',   
'weapon_arpsc',
'weapon_sfarp',
'weapon_glock41',        
'weapon_plr16kt',          
'weapon_g19xblack',               
'weapon_g17g5mos',          
'weapon_g26switchp',
'weapon_cg17p80s',         
'weapon_mdsh',
'WEAPON_MB47',
'WEAPON_2S',		
'WEAPON_A45',
'WEAPON_RATREV',
'WEAPON_FMICRODRAGON',
'WEAPON_PSTRIKEH',
'WEAPON_PSPIKE',
'WEAPON_PH4',
'WEAPON_PT39',
'WEAPON_P1911KT',
'WEAPON_PT19',
'WEAPON_PPH120',
'WEAPON_PCM4A1',
'WEAPON_PMK40H1',
'WEAPON_PXS9',
'WEAPON_PT17',
'WEAPON_PMK14',
'WEAPON_PHW45',
'WEAPON_PPH350',
'WEAPON_BTASER',
'WEAPON_YTASER',
'WEAPON_PDT19',
'WEAPON_PDPT870',
'WEAPON_PDPT700',
'WEAPON_MK417',
'WEAPON_PDDT607',
'WEAPON_PDDT7',
'WEAPON_PDT22',
'WEAPON_PDBR5',
'WEAPON_PDFC66',
'WEAPON_PDMK45',
'WEAPON_PDMK33',
'WEAPON_PDMKUSP',
'WEAPON_PROJECTXPISTOLUM',
		--etc add guns you want
	},
	InProgress = false,
	type = "",
	targetSrc = -1,
	agressor = {
		animDict = "anim@gangops@hostage@",
		anim = "perp_idle",
		flag = 49,
	},
	hostage = {
		animDict = "anim@gangops@hostage@",
		anim = "victim_idle",
		attachX = -0.24,
		attachY = 0.11,
		attachZ = 0.0,
		flag = 49,
	}
}

RegisterNetEvent('A5:Client:TakeHostage')
AddEventHandler('A5:Client:TakeHostage', function()
    callTakeHostage()
end)

local function drawNativeNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
            if (closestDistance == -1 or closestDistance > distance) then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end        
    end
    return animDict
end

local function drawNativeText(str)
	SetTextEntry_2("STRING")
	AddTextComponentString(str)
	EndTextCommandPrint(1000, 1)
end

-- Uncomment if you want commands /takehostage and /th activated.
-- RegisterCommand("takehostage",function()
-- 	callTakeHostage()
-- end)

-- RegisterCommand("th",function()
-- 	callTakeHostage()
-- end)

function callTakeHostage()
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)

	if not IsPedArmed(PlayerPedId(), 4) then
		drawNativeNotification("You need a weapon in hand with ammo to take a hostage at gunpoint!")
		return
	end

	local canTakeHostage = false
	for i=1, #takeHostage.allowedWeapons do
		local weaponHash = GetHashKey(takeHostage.allowedWeapons[i])

		if HasPedGotWeapon(PlayerPedId(), weaponHash, false) then
			if GetAmmoInPedWeapon(PlayerPedId(), weaponHash) > 0 then
				canTakeHostage = true 
				foundWeapon = takeHostage.allowedWeapons[i]
				break
			end 					
		end
	end

	if not canTakeHostage then 
		drawNativeNotification("You need a weapon with ammo to take a hostage at gunpoint!")
	end

	if not takeHostage.InProgress and canTakeHostage then			
		local closestPlayer = GetClosestPlayer(1)
		if closestPlayer then
			local targetSrc = GetPlayerServerId(closestPlayer)
			if targetSrc ~= -1 then
				SetCurrentPedWeapon(PlayerPedId(), foundWeapon, true)
				takeHostage.InProgress = true
				takeHostage.targetSrc = targetSrc
				TriggerServerEvent("TakeHostage:sync",targetSrc)
				ensureAnimDict(takeHostage.agressor.animDict)
				takeHostage.type = "agressor"
			else
				drawNativeNotification("~r~No one nearby to take as hostage!")
			end
		else
			drawNativeNotification("~r~No one nearby to take as hostage!")
		end
	end
end 

RegisterNetEvent("TakeHostage:syncTarget")
AddEventHandler("TakeHostage:syncTarget", function(target)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	takeHostage.InProgress = true
	ensureAnimDict(takeHostage.hostage.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, takeHostage.hostage.attachX, takeHostage.hostage.attachY, takeHostage.hostage.attachZ, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
	takeHostage.type = "hostage" 
end)

RegisterNetEvent("TakeHostage:releaseHostage")
AddEventHandler("TakeHostage:releaseHostage", function()
	takeHostage.InProgress = false 
	takeHostage.type = ""
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("reaction@shove")
	TaskPlayAnim(PlayerPedId(), "reaction@shove", "shoved_back", 8.0, -8.0, -1, 0, 0, false, false, false)
	Wait(250)
	ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent("TakeHostage:killHostage")
AddEventHandler("TakeHostage:killHostage", function()
	takeHostage.InProgress = false 
	takeHostage.type = ""
	SetEntityHealth(PlayerPedId(),0)
	DetachEntity(PlayerPedId(), true, false)
	ensureAnimDict("anim@gangops@hostage@")
	TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "victim_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
end)

RegisterNetEvent("TakeHostage:cl_stop")
AddEventHandler("TakeHostage:cl_stop", function()
	takeHostage.InProgress = false
	takeHostage.type = "" 
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

local HOSTAGE_FONT   = 1
local HOSTAGE_SCALE  = 0.50
local HOSTAGE_X      = 0.50
local HOSTAGE_Y      = 0.92
local HOSTAGE_COLOR  = {255,255,255,255}

local function ensureAnimDict(dict)
    if HasAnimDictLoaded(dict) then return true end
    RequestAnimDict(dict)
    local t = GetGameTimer()
    while not HasAnimDictLoaded(dict) do
        Wait(0)
        if GetGameTimer() - t > 5000 then
            return false
        end
    end
    return true
end

local function drawNativeText(text, font, scale, x, y, rgba)
    font  = font  or HOSTAGE_FONT
    scale = scale or HOSTAGE_SCALE
    x     = x     or HOSTAGE_X
    y     = y     or HOSTAGE_Y
    local r,g,b,a = table.unpack(rgba or HOSTAGE_COLOR)

    SetTextFont(font)
    SetTextProportional(1)
    SetTextScale(scale, scale)
    SetTextCentre(true)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextDropShadow()
    SetTextOutline()
    SetTextColour(r, g, b, a)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end

Citizen.CreateThread(function()
    while true do
        if takeHostage.type == "agressor" then
            if not IsEntityPlayingAnim(PlayerPedId(), takeHostage.agressor.animDict, takeHostage.agressor.anim, 3) then
                TaskPlayAnim(PlayerPedId(), takeHostage.agressor.animDict, takeHostage.agressor.anim, 8.0, -8.0, 100000, takeHostage.agressor.flag, 0, false, false, false)
            end
        elseif takeHostage.type == "hostage" then
            if not IsEntityPlayingAnim(PlayerPedId(), takeHostage.hostage.animDict, takeHostage.hostage.anim, 3) then
                TaskPlayAnim(PlayerPedId(), takeHostage.hostage.animDict, takeHostage.hostage.anim, 8.0, -8.0, 100000, takeHostage.hostage.flag, 0, false, false, false)
            end
        end
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do 
        if takeHostage.type == "agressor" then
            DisableControlAction(0, 24, true)  -- attack
            DisableControlAction(0, 25, true)  -- aim
            DisableControlAction(0, 47, true)  -- weapon
            DisableControlAction(0, 58, true)  -- weapon
            DisableControlAction(0, 21, true)  -- sprint
            DisablePlayerFiring(PlayerPedId(), true)

            drawNativeText("PRESS [G] TO RELEASE  [H] TO KILL", HOSTAGE_FONT)

            if IsEntityDead(PlayerPedId()) then
                takeHostage.type = ""
                takeHostage.InProgress = false
                ensureAnimDict("reaction@shove")
                TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0, false, false, false)
                TriggerServerEvent("TakeHostage:releaseHostage", takeHostage.targetSrc)
            end

            if IsDisabledControlJustPressed(0, 47) then -- G: release
                takeHostage.type = ""
                takeHostage.InProgress = false
                ensureAnimDict("reaction@shove")
                TaskPlayAnim(PlayerPedId(), "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 168, 0, false, false, false)
                TriggerServerEvent("TakeHostage:releaseHostage", takeHostage.targetSrc)

            elseif IsDisabledControlJustPressed(0, 74) then -- H: kill
                takeHostage.type = ""
                takeHostage.InProgress = false
                ensureAnimDict("anim@gangops@hostage@")
                TaskPlayAnim(PlayerPedId(), "anim@gangops@hostage@", "perp_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
                TriggerServerEvent("TakeHostage:killHostage", takeHostage.targetSrc)
                TriggerServerEvent("TakeHostage:stop", takeHostage.targetSrc)
                Wait(100)
                SetPedShootsAtCoord(PlayerPedId(), 0.0, 0.0, 0.0, 0)
            end

        elseif takeHostage.type == "hostage" then
            DisableControlAction(0, 21, true)  -- sprint
            DisableControlAction(0, 24, true)  -- attack
            DisableControlAction(0, 25, true)  -- aim
            DisableControlAction(0, 47, true)  -- weapon
            DisableControlAction(0, 58, true)  -- weapon
            DisableControlAction(0, 263, true) -- melee
            DisableControlAction(0, 264, true) -- melee
            DisableControlAction(0, 257, true) -- melee
            DisableControlAction(0, 140, true) -- melee
            DisableControlAction(0, 141, true) -- melee
            DisableControlAction(0, 142, true) -- melee
            DisableControlAction(0, 143, true) -- melee
            DisableControlAction(0, 75, true)  -- exit vehicle
            DisableControlAction(27, 75, true) -- exit vehicle
            DisableControlAction(0, 22, true)  -- jump
            DisableControlAction(0, 32, true)  -- move up
            DisableControlAction(0, 268, true)
            DisableControlAction(0, 33, true)  -- move down
            DisableControlAction(0, 269, true)
            DisableControlAction(0, 34, true)  -- move left
            DisableControlAction(0, 270, true)
            DisableControlAction(0, 35, true)  -- move right
            DisableControlAction(0, 271, true)
        end

        Wait(0)
    end
end)