local firstOpening = true
local QBCore = exports['qb-core']:GetCoreObject()
-- Open Menu Command
if Settings.openWithCommand then 
    RegisterCommand(Settings.openCommand, function()
        if Settings.Debug then
            Settings.DebugPrint("Command to open menu was triggered")
        end
        TriggerEvent('ak4y-vipSystemv2:openMenu')
    end, false)
end

-- Open Menu trigger
RegisterNetEvent('ak4y-vipSystemv2:openMenu', function()
    if Settings.Debug then
        Settings.DebugPrint("Opening Menu")
    end
    TriggerServerCallback('ak4y-vipSystemv2:getPlayerData:server', function(data)
        firstOpening = false
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openMenu",
            plyInfo = data
        })
    end, firstOpening)
end)

local spamProtectRedeem = 0
-- redeem code
RegisterNuiCallback("redeemCode", function(data, cb)
    if GetGameTimer() < spamProtectRedeem then
        cb("Wait a moment before trying again")
        return
    end
    spamProtectRedeem = GetGameTimer() + 1000
    if Settings.Debug then
        Settings.DebugPrint("Redeem Code Clicked")
    end
    TriggerServerCallback('ak4y-vipSystemv2:redeemCode:server', function(state)
        cb(state)
    end, data)
end)

-- Send data to NUI
RegisterNuiCallback("getData", function(data, cb)
    SendNUIMessage({
        action = "init",
        config = AK4Y
    })

    if Settings.Debug then
        Settings.DebugPrint("NUI Ready, Data requested from NUI")
    end

    cb("ok")
end)

-- Close event from NUI
RegisterNuiCallback("closeMenu", function(data, cb)
    SetNuiFocus(false, false)

    if Settings.Debug then
        Settings.DebugPrint("Closing Menu")
    end

    cb("ok")
end)

-- Item buy clicked from nui
RegisterNuiCallback("itemBuy", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Item Buy Clicked")
    end
    if data.itemType == Settings.SqlVehicleType or data.itemType == Settings.SqlAirType or data.itemType == Settings.SqlBoatType then
        data.carData = getCarData(data)
        TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state)
            cb(state)
        end, data)
    elseif data.itemType == "bundle" then
        for k, v in pairs(data.giveItems) do 
            if v.itemType == Settings.SqlVehicleType or v.itemType == Settings.SqlAirType or v.itemType == Settings.SqlBoatType then
                v.carData = getCarData(v)
            end
        end
        TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state)
            cb(state)
        end, data)
    elseif data.itemType == "plate" then 
        if IsPedInAnyVehicle(PlayerPedId(), false) then
			local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			local oldPlate = GetVehicleNumberPlateText(veh)
            local newPlate = data.customizePopUp.plateNumber
            data.oldPlate = oldPlate
			TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state)
                SetVehicleNumberPlateText(vehicle, Framework.Shared.RandomStr(1)..Framework.Shared.RandomStr(1)..Framework.Shared.RandomStr(1)..Framework.Shared.RandomStr(1)..Framework.Shared.RandomInt(4))
                if Settings.GiveAddKeys then 
                    Settings.GiveAddKeysFunction(newPlate)
                end
                cb(state)
            end, data)
		else
			cb(AK4Y.Translate.youHaveToBeInVehicle)
		end
    else
            TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state) 
            cb(state)
        end, data)
    end
end)

-- house bought
RegisterNetEvent('ak4y-vipSystemv2:houseBought', function(data)
    if Settings.Debug then
        Settings.DebugPrint("House Bought")
    end
    if data.afterPurchaseTrigger.clientOrServer == "server" then 
        TriggerServerEvent(data.afterPurchaseTrigger.trigger, data.afterPurchaseTrigger.parameters)
    else
        TriggerEvent(data.afterPurchaseTrigger.trigger, data.afterPurchaseTrigger.parameters)
    end
end)

-- start Test drive event
RegisterNetEvent('ak4y-vipSystemv2:startTestDrive', function(data)
    if Settings.Debug then
        Settings.DebugPrint("Starting Test Drive")
    end
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(veh)
    
    TriggerServerCallback('ak4y-vipSystemv2:startTestDrive:server', function(state)
        if state then
            if Settings.Debug then
                Settings.DebugPrint("Test Drive Started")
            end
            SetEntityAsMissionEntity(veh, true, true)
            DeleteVehicle(veh)
            TriggerEvent('ak4y-vipSystemv2:openMenu')
        end
    end, plate)
end)

-- Started the resource
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    -- if Settings.Debug then
        Settings.DebugPrint("Resource Started")
    -- end
end)

----------------------------------

getCarData = function(itemData)
	local carData = nil
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local vehItemNameHash = GetHashKey(itemData.itemName)
	if not IsModelInCdimage(vehItemNameHash) then return end RequestModel(vehItemNameHash)  while not HasModelLoaded(vehItemNameHash) do Wait(0) end
	local vehicle = CreateVehicle(vehItemNameHash, playerCoords.x, playerCoords.y, playerCoords.z - 200.0, 1.0, false, false)
    local tryPlate = QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(4)
    SetVehicleNumberPlateText(vehicle, tryPlate)
	FreezeEntityPosition(vehicle, true)
	if Settings.Framework == "esx" or Settings.Framework == "oldEsx" then
		carData = Framework.Game.GetVehicleProperties(vehicle)
	else
		carData = Framework.Functions.GetVehicleProperties(vehicle)
	end
	DeleteVehicle(vehicle)
	DeleteEntity(vehicle)
	return carData
end

----------------------------------

RegisterNuiCallback("locate", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Locate Clicked")
    end
    -- set gps
    SetNewWaypoint(data.coords.x, data.coords.y)
    frameworkNotify(AK4Y.Translate.locationMarked, "success")
    cb(true)
end)

----------------------------------

-- Test drive event from nui
RegisterNuiCallback("testDrive", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Test Drive Clicked")
    end
    local prevPlayerCoords = GetEntityCoords(PlayerPedId())
    if #(prevPlayerCoords - vector3(Settings.testDriveCoord.x, Settings.testDriveCoord.y, Settings.testDriveCoord.z)) > 10.0 then
        frameworkNotify(AK4Y.Translate.soFarFromTestDriveArea, "error")
        cb(AK4Y.Translate.soFarFromTestDriveArea)
        return
    end
    spawnCarForTest(data, Settings.testDriveTime)
    cb(true)
end)

local inTestDrive = false
local testDriveVehicle = nil
spawnCarForTest = function(itemData, timing)
    if inTestDrive then return end
    local prevPlayerCoords = GetEntityCoords(PlayerPedId())
    if #(prevPlayerCoords - vector3(Settings.testDriveCoord.x, Settings.testDriveCoord.y, Settings.testDriveCoord.z)) > 10.0 then
        frameworkNotify(AK4Y.Translate.soFarFromTestDriveArea, "error")
        return
    end
    inTestDrive = true
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local vehItemNameHash = GetHashKey(itemData.itemName)
	if not IsModelInCdimage(vehItemNameHash) then return end RequestModel(vehItemNameHash)  while not HasModelLoaded(vehItemNameHash) do Wait(0) end
	local vehicle = CreateVehicle(vehItemNameHash, playerCoords.x, playerCoords.y, playerCoords.z, 1.0, true, false)
	testDriveVehicle = vehicle
    local plate = GetVehicleNumberPlateText(vehicle)
    exports.wasabi_carlock:GiveKey(plate)
    SetVehicleOnGroundProperly(vehicle)
	SetEntityAsMissionEntity(vehicle, true, true)
	SetVehicleHasBeenOwnedByPlayer(vehicle, true)
	local id = NetworkGetNetworkIdFromEntity(vehicle)
	SetNetworkIdCanMigrate(id, true)
	SetVehicleNeedsToBeHotwired(vehicle, false)
	TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
	frameworkNotify(testDriveStarted, "success")
	SetTimeout(timing * 1000, function()
        inTestDrive = false
		DeleteVehicle(testDriveVehicle)
		DeleteEntity(testDriveVehicle)
		frameworkNotify(testDriveEnded, "error")
        SetEntityCoords(playerPed, prevPlayerCoords)
	end)
    startTestDriveTimer(timing)
end

function startTestDriveTimer(testDriveTime)
    local gameTimer = GetGameTimer()
    CreateThread(function()
        while inTestDrive do
            if GetGameTimer() < gameTimer + tonumber(1000 * testDriveTime) then
                local secondsLeft = GetGameTimer() - gameTimer
                drawTxt(AK4Y.Translate.testDriveRemaining..''..math.ceil(testDriveTime - secondsLeft / 1000), 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)
            end
            Wait(0)
        end
    end)
end

local performansCd = 1000
CreateThread(function()
    if Settings.testDriveBlip then
        local Dealer = AddBlipForCoord(Settings.testDriveCoord)
        SetBlipSprite (Dealer, 79)
        SetBlipDisplay(Dealer, 4)
        SetBlipScale  (Dealer, 0.70)
        SetBlipAsShortRange(Dealer, true)
        SetBlipColour(Dealer, 4)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Settings.testDriveBlipText)
        EndTextCommandSetBlipName(Dealer)
    end
	while true do
        local pos = GetEntityCoords(PlayerPedId())
        if #(Settings.testDriveCoord - pos) < 10 then 
            performansCd = 1
            DrawText3D(Settings.testDriveCoord.x, Settings.testDriveCoord.y, Settings.testDriveCoord.z+1, Settings.testDriveDrawText)
        end
        Citizen.Wait(performansCd)
    end
end)
