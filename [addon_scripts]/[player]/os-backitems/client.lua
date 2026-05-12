local QBCore = exports['qb-core']:GetCoreObject()

local CurrentBackItems = {}
local TempBackItems = {}
local checking = true
local currentWeapon = nil
local slots = 60
local s = {}


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    BackLoop()
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    resetItems()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    resetItems()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(10000)
    BackLoop()
end)

-- RegisterNetEvent("backitems:start", function()
--     Wait(10000)
--     BackLoop()
-- end)

RegisterNetEvent("backitems:displayItems", function(toggle)
    if toggle then 
        for k,v in pairs(TempBackItems) do 
            createBackItem(k)
        end
        BackLoop()
    else 
        TempBackItems = CurrentBackItems
        checking = false
        for k,v in pairs(CurrentBackItems) do
            removeBackItem(k)
        end
        CurrentBackItems = {}
    end
end)

function resetItems()
    removeAllBackItems()
    CurrentBackItems = {}
    TempBackItems = {}
    currentWeapon = nil
    s = {}
    checking = false
end

function BackLoop()
    -- print("[Backitems]: Starting Loop")
    checking = true
    CreateThread(function()
        while checking do
            local player = QBCore.Functions.GetPlayerData()
            while player == nil do 
                player = QBCore.Functions.GetPlayerData()
                Wait(500)
            end
            for i = 1, slots do
                s[i] = player.items[i]
            end
            check()
            Wait(1000)
        end
    end)
end

function check()
    for i = 1, slots do
        if s[i] ~= nil then
            local name = s[i].name
            if BackItems[name] then
                if name ~= currentWeapon then
                    createBackItem(name)
                end
            end
        end
    end

    for k,v in pairs(CurrentBackItems) do 
        local hasItem = false
        for j = 1, slots do
            if s[j] ~= nil then
                local name = s[j].name
                if name == k then 
                    hasItem = true
                end
            end
        end
        if not hasItem then 
            removeBackItem(k)
        end
    end
end

function createBackItem(item)
    if not CurrentBackItems[item] then
        if BackItems[item] then 
            local i = BackItems[item]
            local model = i["model"]
            local ped = PlayerPedId()
            local bone = GetPedBoneIndex(ped, i["back_bone"])
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
            end
            SetModelAsNoLongerNeeded(model)
            CurrentBackItems[item] = CreateObject(GetHashKey(model), 1.0, 1.0, 1.0, true, true, false)   
            local y = i["y"]  
            if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then y = y + 0.035 end
            AttachEntityToEntity(CurrentBackItems[item], ped, bone, i["x"], y, i["z"], i["x_rotation"], i["y_rotation"], i["z_rotation"], 0, 1, 0, 1, 0, 1)
            SetEntityCompletelyDisableCollision(CurrentBackItems[item], false, true)		
	end
    end
end

function removeBackItem(item)
    if CurrentBackItems[item] then
        DeleteEntity(CurrentBackItems[item])
        CurrentBackItems[item] = nil
    end
end

function removeAllBackItems()
    for k,v in pairs(CurrentBackItems) do 
        removeBackItem(k)
    end
end

AddEventHandler('ox_inventory:currentWeapon', function(weapon)
    if weapon == nil then
        createBackItem(currentWeapon)
        currentWeapon = nil
        return
    else
        if currentWeapon ~= nil then  
            createBackItem(currentWeapon)
            currentWeapon = nil
        end
        currentWeapon = tostring(weapon.name)
        removeBackItem(currentWeapon)
    end
end)

local isInVehicle = false
local isEnteringVehicle = false

-- Citizen.CreateThread(function()
-- 	while true do
-- 		local ped = PlayerPedId()

-- 		if not isInVehicle and not IsPlayerDead(PlayerId()) then
-- 			if DoesEntityExist(GetVehiclePedIsTryingToEnter(ped)) and not isEnteringVehicle then
-- 				-- trying to enter a vehicle!
-- 				local vehicle = GetVehiclePedIsTryingToEnter(ped)
-- 				local seat = GetSeatPedIsTryingToEnter(ped)
-- 				local netId = VehToNet(vehicle)
-- 				isEnteringVehicle = true
				
--                 resetItems()
-- 			elseif not DoesEntityExist(GetVehiclePedIsTryingToEnter(ped)) and not IsPedInAnyVehicle(ped, true) and isEnteringVehicle then
-- 				-- vehicle entering aborted
-- 				isEnteringVehicle = false

--                 Citizen.SetTimeout(1000, function()
--                     BackLoop()
--                 end)
-- 			elseif IsPedInAnyVehicle(ped, false) then
-- 				-- suddenly appeared in a vehicle, possible teleport
-- 				isEnteringVehicle = false
-- 				isInVehicle = true

--                 resetItems()
-- 			end
-- 		elseif isInVehicle then
-- 			if not IsPedInAnyVehicle(ped, false) or IsPlayerDead(PlayerId()) then
-- 				isInVehicle = false

--                 Citizen.SetTimeout(1000, function()
--                     BackLoop()
--                 end)
-- 			end
-- 		end

-- 		Citizen.Wait(100)
-- 	end
-- end)