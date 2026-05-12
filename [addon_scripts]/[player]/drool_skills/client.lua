local isOpen = false
local mySkills = {}

local Training = false
local resting = false
local Membership = false
local AccessTimeRemaining = 0
local Timer = 0
local spawnedPeds = {}
local TargetZones = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
     Wait(500)
    local ped = PlayerPedId()
    Wait(100)
    StatSetInt(`MP0_STRENGTH`, 0, true)
    SetPedMaxTimeUnderwater(ped, 10.00)
    StatSetInt(`MP0_STAMINA`, 0, true)
    StatSetInt(`MP0_DRIVING_ABILITY`, 0, true)
    Wait(100)
    TriggerServerEvent("drool_skills:server:getProgress")
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        if LocalPlayer.state['isLoggedIn'] then
            Wait(500)
            local ped = PlayerPedId()
            Wait(100)
            StatSetInt(`MP0_STRENGTH`, 0, true)
            SetPedMaxTimeUnderwater(ped, 10.00)
            StatSetInt(`MP0_STAMINA`, 0, true)
            Wait(100)
            TriggerServerEvent("drool_skills:server:getProgress")
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000 * 60 * Config.Interval)
        if LocalPlayer.state.isLoggedIn then
            TriggerServerEvent("drool_skills:server:AddXP", Config.IntervalXP)
        end
    end
end)

function RefreshAttributes()
    Wait(3000)
    local ped = PlayerPedId()
    if ped ~= nil then
        -- Applying Character Attributes

        local StaminaLevel = mySkills.levels.stamina.tier
        if StaminaLevel ~= nil and StaminaLevel ~= 0 then
            if StaminaLevel == 1 then
                StatSetInt(`MP0_STAMINA`, 5, true)
            elseif StaminaLevel == 2 then
                StatSetInt(`MP0_STAMINA`, 10, true)
            elseif StaminaLevel == 3 then
                StatSetInt(`MP0_STAMINA`, 20, true)
            elseif StaminaLevel == 4 then
                StatSetInt(`MP0_STAMINA`, 50, true)
            elseif StaminaLevel == 5 then
                StatSetInt(`MP0_STAMINA`, 100, true)
            end
        else
            StatSetInt(`MP0_STAMINA`, 0, true)
        end

        local StrengthLevel = mySkills.levels.strength.tier
        if StrengthLevel ~= nil and StrengthLevel ~= 0 then
            StatSetInt(`MP0_STRENGTH`, StrengthLevel*10, true)
        else
            StatSetInt(`MP0_STRENGTH`, 0, true)
        end
        
        local BreathingLevel = mySkills.levels.breathing.tier
        if BreathingLevel ~= nil and BreathingLevel ~= 0 then
            FloatLungCapacityAmount = BreathingLevel*20 + .0
            SetPedMaxTimeUnderwater(ped, FloatLungCapacityAmount)
        else
            SetPedMaxTimeUnderwater(ped, 10.00)
        end

        -- local StressLevel = mySkills.levels.stress.tier
        TriggerEvent('os-stress:client:UpdateStressLevel')

        -- local WorkingLevel = mySkills.levels.working.tier
        -- Managed in ox_inventory crafting

        local CryptoLevel = mySkills.levels.crypto.tier
        -- Managed in qb-crypto
        
        local HeistLevel = mySkills.levels.heists.tier
        -- Managed in heists

    else
        RefreshAttributes()
    end
end

RegisterNetEvent('drool_skills:client:refreshSkills', function(skills)
    if isOpen then
        SendNUIMessage({
            action = "update",
            data = skills,
            skills = Config.SkillCategories
        })
    end
    mySkills = skills
    while IsPedSwimmingUnderWater(PlayerPedId()) do
        Wait(1000)
    end
    RefreshAttributes()
end)


RegisterNetEvent('drool_skills:client:refreshBreathing', function()
    local ped = PlayerPedId()
    local BreathingLevel = mySkills.levels.breathing.tier
    if BreathingLevel ~= nil and BreathingLevel ~= 0 then
        FloatLungCapacityAmount = BreathingLevel*20 + .0
        SetPedMaxTimeUnderwater(ped, FloatLungCapacityAmount)
    else
        SetPedMaxTimeUnderwater(ped, 10.00)
    end
end)

-- NUI HANDLING --

RegisterNetEvent("drool_skills:client:openUI", function()
    if isOpen then return end
    isOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        data = mySkills,
        skills = Config.SkillCategories
    })
end)

RegisterNUICallback("closeUI", function(_, cb)
    isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close",
    })
    cb({})
end)

RegisterNUICallback("levelUpTier", function(data, cb)
    TriggerServerEvent('drool_skills:server:purchaseTier', data)
    cb("ok")
end)

RegisterNUICallback("resetSkillPoints", function(data, cb)
     TriggerServerEvent('drool_skills:server:resetSkillPoints')
    cb("ok")
end)

-- GYM --

-- Create gym blips
CreateThread(function()
    for _, info in pairs(Config.Gym.entrance_coords) do
        if info.create_blip then
          info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
          SetBlipCategory(info.blip, nil)
          SetBlipSprite(info.blip, info.blip_icon)
          SetBlipDisplay(info.blip, 4)
          SetBlipScale(info.blip, info.blip_scale)
          SetBlipColour(info.blip, info.blip_color)
          SetBlipAsShortRange(info.blip, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString('Gym')
          EndTextCommandSetBlipName(info.blip)
        end
    end
end)

function NearPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(50)
	end

	if Config.PedSpawns.MinusOne then
		spawnedPed = CreatePed(Config.PedSpawns.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.PedSpawns.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end

	SetEntityAlpha(spawnedPed, 0, false)

	if Config.PedSpawns.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end

	if Config.PedSpawns.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end

	if Config.PedSpawns.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end

	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(50)
		end

		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end

	if Config.PedSpawns.FadeIn then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end

	return spawnedPed
end


-- Create peds
CreateThread(function()
	while true do
		Wait(500)
		for k,v in pairs(Config.PedList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)

			if distance < Config.PedSpawns.DistanceSpawn and not spawnedPeds[k] then
				local spawnedPed = NearPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
			end

			if distance >= Config.PedSpawns.DistanceSpawn and spawnedPeds[k] then
				if Config.PedSpawns.FadeIn then
					for i = 255, 0, -51 do
						Wait(50)
						SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
	end
end)


local function Resting()
    resting = true
    Wait(Config.Gym.excercise_cooldown * 1000)
    resting = false
    exports.qbx_core:Notify('You can now exercise again!', 'success')
end

local function GymTimer(Premium)
    if Premium then
        Timer = Config.PremiumMembership.access_time * 60000
    else
        Timer = Config.Gym.access_time * 60000
    end
    while Timer > 0 do
        Wait(1000)
        Timer = Timer - 1000
        if Timer == 0 then
            Membership = false
            exports.qbx_core:Notify('Your membership has now expired, you will need to wait '.. Config.Gym.gym_cooldown .. " hours before you can use the gym again")
        end
    end
end

local DogHashes = {}
for _, v in ipairs(Config.Dogs) do
    DogHashes[GetHashKey(v)] = true
end

local function DoExcercise(coords, heading, animation)
    if Membership then
        if not Training then
            if not resting then
                Training = true
                local ped = PlayerPedId()
                local isDog = DogHashes[ GetEntityModel(ped) ]
                SetEntityHeading(ped, heading)
                SetEntityCoords(ped, coords.x, coords.y, coords.z - 1)
                if isDog then
                    TaskPlayAnim(ped, "creatures@rottweiler@tricks@", "beg_loop", 4.0, -4.0, -1, 1, 0.0, false, false, false)
                else
                    TaskStartScenarioInPlace(ped, animation, 30000, true)
                end
                Wait(30000)
                ClearPedTasks(ped)
                TriggerServerEvent('drool_skills:server:AddXP', math.random(Config.Gym.xp_per_excercise_min, Config.Gym.xp_per_excercise_max))
                TriggerServerEvent('hud:server:RelieveStress', math.random(4, 8))
                exports.qbx_core:Notify('You feel fitter and have earned some XP for your troubles!', 'success')
                Training = false
                Resting()
            else
                exports.qbx_core:Notify('Catch your breath first before attempting to excercise!', 'error')
            end
        else
            exports.qbx_core:Notify("You're already performing an excercise!", 'error')
        end
    else
        exports.qbx_core:Notify('You need a gym membership to be able to use the excercise equipment', 'error')
    end
end

RegisterNetEvent('drool_skills:client:addGymMembership', function(Premium)
	Membership = true
    GymTimer(Premium)
end)

RegisterNetEvent('drool_skills:client:attemptMembershipPurchase', function(paymentType, Premium)
	TriggerServerEvent('drool_skills:server:attemptMembershipPurchase', paymentType.option, Premium)
end)

RegisterNetEvent('drool_skills:client:gymMenu', function()
    if not Membership then
        local gymMenu

        if Config.PremiumMembership.enabled then
            gymMenu = {
                {
                    title = "Welcome to the city gym!",
                    description = "Purchase a pass or leave.",
                    icon = "circle-info",
                    disabled = true
                },
                {
                    title = "Purchase Gym Membership",
                    description = "You can purchase a "..tostring(Config.Gym.access_time).." minute pass for $"..tostring(Config.Gym.entrance_fee),
                    icon = "hand-holding-dollar",
                    onSelect = function()
                        TriggerEvent('drool_skills:client:CashorCardMenu', false)
                    end
                },
                {
                    title = "Purchase Premium Gym Membership",
                    description = "You can purchase a "..tostring(Config.PremiumMembership.access_time).." minute pass for $"..tostring(Config.PremiumMembership.entrance_fee),
                    icon = "hand-holding-dollar",
                    onSelect = function()
                        TriggerEvent('drool_skills:client:CashorCardMenu', true)
                    end
                },
            }
        else
            gymMenu = {
                {
                    title = "Welcome to the city gym!",
                    description = "Purchase a pass or leave.",
                    icon = "circle-info",
                    disabled = true
                },
                {
                    title = "Purchase Gym Membership",
                    description = "You can purchase a "..tostring(Config.Gym.access_time).." minute pass for $"..tostring(Config.Gym.entrance_fee),
                    icon = "hand-holding-dollar",
                    onSelect = function()
                        TriggerEvent('drool_skills:client:CashorCardMenu', false)
                    end
                },
            }
        end
        lib.registerContext({
            id = 'gym_menu',
            title = 'City Gym',
            options = gymMenu
        })
        lib.showContext('gym_menu')
    else
        local gymMenu = {
            {
                title = "How is the workout going?",
                icon = "circle-info",
                disabled = true
            },
            {
                title = "Check Access Time",
                description = "See how much time you have left.",
                icon = "clock",
                onSelect = function()
                    TriggerEvent('drool_skills:client:RemainingTime')
                end
            },
        }
        lib.registerContext({
            id = 'gym_menu',
            title = 'City Gym',
            options = gymMenu
        })
        lib.showContext('gym_menu')
    end
end)

RegisterNetEvent('drool_skills:client:CashorCardMenu', function(Premium)
    local paymentMenu = {
        {
            title = "How would you like to pay?",
            icon = "hand-holding-dollar",
            disabled = true
        },
        {
            title = "Card",
            icon = "credit-card",
            onSelect = function()
                if Premium then
                    TriggerEvent('drool_skills:client:attemptMembershipPurchase', { option = "bank" }, true)
                else
                    TriggerEvent('drool_skills:client:attemptMembershipPurchase', { option = "bank" }, false)
                end
            end
        },
        {
            title = "Cash",
            icon = "coins",
            onSelect = function()
                if Premium then
                    TriggerEvent('drool_skills:client:attemptMembershipPurchase', { option = "cash" }, true)
                else
                    TriggerEvent('drool_skills:client:attemptMembershipPurchase', { option = "cash" }, false)
                end
            end
        },
        {
            title = "<- Go Back",
            onSelect = function()
                TriggerEvent('drool_skills:client:gymMenu')
            end
        }
    }

    lib.registerContext({
        id = 'payment_menu',
        title = 'Gym Membership',
        options = paymentMenu
    })
    lib.showContext('payment_menu')
end)


RegisterNetEvent('drool_skills:client:RemainingTime', function()
	exports.qbx_core:Notify('You have '.. math.round(Timer / 60000) .. " minutes remaining to use the gym!")
end)

local listen = false
local function ExcerciseControls(coords, heading, animation)
    CreateThread(function()
        listen = true
        while listen do
            if IsControlJustPressed(0, 38) then
                lib.hideTextUI()
                DoExcercise(coords, heading, animation)
                listen = false
            end
            Wait(1)
        end
    end)
end

CreateThread(function()
    for k,v in pairs(Config.Gym.entrance_coords) do -- Entrance zones
        TargetZones[k] = exports.ox_target:addBoxZone({
            coords = v.coords,
            size = vec3(2, 2, 2),
            rotation = v.heading,
            debug = Config.DebugPoly,
            options = {
                {
                    name = "gymentrance" .. k,
                    icon = "fa fa-heartbeat",
                    label = "Gym",
                    onSelect = function()
                        TriggerEvent("drool_skills:client:gymMenu")
                    end
                }
            }
        })
    end

    local gymequipmentPoly = {}
    for i = 1, #Config.GymEquipmentLocations do
        local v = Config.GymEquipmentLocations[i]
        
        local zone = BoxZone:Create(v.coords, 2, 2, {
            heading = v.heading,
            name = 'gymequipment' .. i,
            debugPoly = Config.DebugPoly,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 1,
        })

        local gymequipmentCombo = ComboZone:Create({zone}, {name = 'gymequipmentCombo' .. i, debugPoly = Config.DebugPoly})

        gymequipmentCombo:onPlayerInOut(function(isPointInside)
            if isPointInside then
                lib.showTextUI("[E] ".. v.description)
                ExcerciseControls(v.coords, v.heading, v.animation)
            else
                listen = false
                lib.hideTextUI()
            end
        end)
    end
end)


AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k in pairs(TargetZones) do
            exports.ox_target:removeZone(TargetZones[k])
        end

        for k, pedData in pairs(spawnedPeds) do
            if DoesEntityExist(pedData.spawnedPed) then
                DeletePed(pedData.spawnedPed)
            end
        end
        spawnedPeds = {}
    end
end)