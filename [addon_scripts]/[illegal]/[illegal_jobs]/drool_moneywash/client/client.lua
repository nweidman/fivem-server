local spawnedEntities = {}
local spawnedTargets = {}

AddEventHandler('onResourceStop', function(resName)
    if resName ~= GetCurrentResourceName() then return end

    -- delete all spawned entities
	if spawnedEntities then
		for _, ent in ipairs(spawnedEntities) do
			if DoesEntityExist(ent) then
				DeleteEntity(ent)
			end
		end
	end

    -- remove all ox_target zones
	if spawnedTargets then
		for _, id in ipairs(spawnedTargets) do
			exports.ox_target:removeZone(id)
		end
	end
end)

local function buildGroups(v)
	local groups = {}
	-- jobs
	if v.job then
		if type(v.job) == 'string' then
			groups[v.job] = 0
		elseif type(v.job) == 'table' then
			for k, val in pairs(v.job) do
				if type(k) == 'number' then
					-- array style: { "police", "mechanic" }
					groups[val] = 0
				else
					-- key-value style: { police = 2, mechanic = 0 }
					groups[k] = val
				end
			end
		end
	end
		-- gangs
	if v.gang then
		if type(v.gang) == 'string' then
			groups[v.gang] = 0
		elseif type(v.gang) == 'table' then
			for k, val in pairs(v.gang) do
				if type(k) == 'number' then
					groups[val] = 0
				else
					groups[k] = val
				end
			end
		end
	end
	return next(groups) and groups or nil
end

if Config.UseTarget then

	CreateThread(function()
		for k, v in pairs(Config.Machines['Washing Machines']) do
			if v.spawnMachine then
				local model = Config.WasherModel

				RequestModel(model)
				while not HasModelLoaded(model) do
					Wait(10)
				end

				local entity = CreateObject(model, v.location.x, v.location.y, v.location.z, false, false, true)
				SetEntityHeading(entity, v.heading or 0.0)
				FreezeEntityPosition(entity, true)

				table.insert(spawnedEntities, entity)
		
				-- Attach target to entity
				local targetId = exports.ox_target:addLocalEntity(entity, {
					{
						icon = 'fas fa-sign-in-alt',
						label = 'Wash Money',
						groups = buildGroups(v),
						onSelect = function()
							TriggerEvent('drool_moneywash:client:openMachine', "Money Wash #"..k, true)
						end,
					}
				})
				table.insert(spawnedTargets, targetId)
			else
				exports.ox_target:addBoxZone({
					coords = v.location,
					size = vec3(v.depth, v.width, v.height), -- X, Y, Z
					rotation = v.heading,
					debug = false,
					options = {
						{
							icon = 'fas fa-sign-in-alt',
							label = 'Wash Money',
							groups = buildGroups(v),
							onSelect = function()
								TriggerEvent('drool_moneywash:client:openMachine', "Money Wash #"..k, true)
							end,
						}
					},
					distance = 1.5
				})
			end
		end
			
		for k, v in pairs(Config.Machines['Dryers']) do
			if v.spawnMachine then
				local model = Config.DryerModel

				RequestModel(model)
				while not HasModelLoaded(model) do
					Wait(10)
				end

				local entity = CreateObject(model, v.location.x, v.location.y, v.location.z, false, false, true)
				SetEntityHeading(entity, v.heading or 0.0)
				FreezeEntityPosition(entity, true)

				table.insert(spawnedEntities, entity)
		
				-- Attach target to entity
				local targetId = exports.ox_target:addLocalEntity(entity, {
					{
						icon = 'fas fa-sign-in-alt',
							label = 'Dry Money',
							groups = buildGroups(v),
							onSelect = function()
								TriggerEvent('drool_moneywash:client:openMachine', "Dryer #"..k, false )
							end,
					}
				})
				table.insert(spawnedTargets, targetId)
			else
				exports.ox_target:addBoxZone({
					coords = v.location,
					size = vec3(v.depth, v.width, v.height), -- X, Y, Z
					rotation = v.heading,
					debug = false,
					options = {
						{
							icon = 'fas fa-sign-in-alt',
							label = 'Dry Money',
							groups = buildGroups(v),
							onSelect = function()
								TriggerEvent('drool_moneywash:client:openMachine', "Dryer #"..k, false )
							end,
						}
					},
					distance = 1.5
				})
			end
		end
		
	end)
else
	local closest_machine = nil
	local closest_type = nil

	CreateThread(function()
		while true do
			local close = false
			local PlayerCoords = GetEntityCoords(PlayerPedId())

			for k, v in pairs(Config.Machines['Washing Machines']) do
				if #(PlayerCoords - v) <= 0.4 then
					close = true
					closest_machine = "Money Wash #"..k
					closest_type = "Money Wash"
				end
			end

			for k, v in pairs(Config.Machines['Dryers']) do
				if #(PlayerCoords - v) <= 0.3 then
					close = true
					closest_machine = "Dryer #"..k
					closest_type = "Dryer"
				end
			end

			if not close then
				closest_machine = nil
				closest_type = nil
			end

			Wait(400)
		end
	end)

	CreateThread(function()
		local HasShownText
		while true do
			local WaitTime = 400

			if closest_machine then
				WaitTime = 0
				if not HasShownText then 
					HasShownText = true 
					if Config.DrawText == "qb" then
						exports['qb-core']:DrawText("[E] - Interact With Machine") 
					else
						lib.showTextUI('[E] - Interact With Machine')
					end
				end
				if IsControlJustPressed(0, 38) then
					if closest_type == "Money Wash" then
						TriggerEvent('drool_moneywash:client:openMachine', closest_machine, true)
					else
						TriggerEvent('drool_moneywash:client:openMachine', closest_machine, false)
					end
				end
			else
				if HasShownText then 
					HasShownText = false 
					if Config.DrawText == "qb" then
						exports['qb-core']:HideText() 
					else
						lib.hideTextUI()
					end
				end
			end

			Wait(WaitTime)
		end
	end)
end

local function CalculateWashTime(value)
    return math.floor(math.max(value / 100 * Config.Wash_Time, 1))
end

local function CalculateWashLoss(value, machineNumber)

	if Config.Machines['Washing Machines'][machineNumber].washRate then
		return math.floor(value * Config.Machines['Washing Machines'][machineNumber].washRate)
	end

	local Player = exports.qbx_core:GetPlayerData()
	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil


	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end

    return math.floor((value/100)*(100 - level.mdr) + 0.5)
end

local function CalculateLevel()
	local Player = exports.qbx_core:GetPlayerData()
	local MoneyWashExperience = Player.metadata.moneywashrep
	local highestvalue = 0
	local level = nil

	for k,v in pairs(Config.MoneyDestructionRate) do
		if MoneyWashExperience >= k then
			if tonumber(k) >= highestvalue then
				highestvalue = tonumber(k)
				level = v
			end
		end
	end
	return level
end

-- NUI HANDLING --

RegisterNetEvent('drool_moneywash:client:openMachine', function(machineName, isWasher)
    -- Request the current machine data from the server
    lib.callback('drool_moneywash:getMachineData', false, function(machineData)
        if not machineData then return end

        -- Only send JSON-serializable fields
        local safeData = {
            queue = machineData.queue or {},
            completed = machineData.completed or {},
            currentBill = machineData.currentBill or nil,
            isRunning = machineData.isRunning or false,
            remaining = machineData.remaining or 0
        }

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'open',
            machineName = machineName,
            maxSlots = Config.MaxBillsAtATime,
            isWasher = isWasher,
            data = safeData,
			level = CalculateLevel()
        })
    end, machineName) -- pass machineName to the server callback
end)

RegisterNUICallback('removeUndoneBill', function(data, cb)
    TriggerServerEvent('drool_moneywash:server:removeUndoneBill', data)
    cb('ok')
end)

RegisterNUICallback('updateMachine', function(data, cb)
    TriggerServerEvent('drool_moneywash:server:updateMachine', data)
    cb('ok')
end)

RegisterNUICallback("collectWetBills", function(data, cb)
    TriggerServerEvent('drool_moneywash:server:collectWetBill', data)
    cb("ok")
end)

RegisterNUICallback("collectDryBills", function(data, cb)
    TriggerServerEvent('drool_moneywash:server:collectDryBill', data)
    cb("ok")
end)

RegisterNetEvent('drool_moneywash:client:syncMachine', function(machineName, machineData)
    -- If player has NUI open for this machine, update UI
    SendNUIMessage({
        action = 'sync',
        machineName = machineName,
        data = machineData
    })
end)




-- close menu example
RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Get Marked Money Items
RegisterNUICallback("getMarkedBills", function(data, cb)
    local Player = exports.qbx_core:GetPlayerData()
    local bills = {}
	local machineNumber = tonumber(data.machineName:match("#(%d+)"))

    local items = exports.ox_inventory:Search('slots', Config.DirtyMoneyItem)
    if items then
        for name, data in pairs(items) do
            if data.slot then
                bills[#bills+1] = {
					beforeAmount = data.metadata.worth,
                    amount = CalculateWashLoss(data.metadata.worth, machineNumber),
                    duration = CalculateWashTime(data.metadata.worth),
					originalAmount = data.metadata.worth
                }
            end
        end
    end
    SendNUIMessage({
        action = "showMarkedBills",
        bills = bills
    })

    cb("ok")
end)

RegisterNUICallback("getWetBills", function(data, cb)
    local Player = exports.qbx_core:GetPlayerData()
    local bills = {}

    local items = exports.ox_inventory:Search('slots', Config.WetMoneyItem)
    if items then
        for name, data in pairs(items) do
            if data.slot then
                bills[#bills+1] = {
					beforeAmount = data.metadata.worth,
                    amount = data.metadata.worth,
                    duration = CalculateWashTime(data.metadata.worth)
                }
            end
        end
    end
    SendNUIMessage({
        action = "showMarkedBills",
        bills = bills
    })

    cb("ok")
end)


-- Remove Money after it's put in machine
RegisterNUICallback("removeBill", function(data, cb)
	TriggerServerEvent('drool_moneywash:server:removeBill',data)
    cb("ok")
end)

RegisterNUICallback("removeWetBill", function(data, cb)
	TriggerServerEvent('drool_moneywash:server:removeWetBill',data)
    cb("ok")
end)

if GetResourceState("ox_inventory") == "started" then
	exports.ox_inventory:displayMetadata("worth", "Worth")
end
