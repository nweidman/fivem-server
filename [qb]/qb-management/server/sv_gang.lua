local QBCore = exports['qb-core']:GetCoreObject()
local GangAccounts = {}

local ox_inventory = exports.ox_inventory

function GetGangAccount(account)
	return GangAccounts[account] or 0
end

function AddGangMoney(account, amount)
	if not GangAccounts[account] then
		GangAccounts[account] = 0
	end

	GangAccounts[account] = GangAccounts[account] + amount
	MySQL.insert('INSERT INTO management_funds (job_name, amount, type) VALUES (:job_name, :amount, :type) ON DUPLICATE KEY UPDATE amount = :amount',
		{
			['job_name'] = account,
			['amount'] = GangAccounts[account],
			['type'] = 'gang'
		})
end

function RemoveGangMoney(account, amount)
	local isRemoved = false
	if amount > 0 then
		if not GangAccounts[account] then
			GangAccounts[account] = 0
		end

		if GangAccounts[account] >= amount then
			GangAccounts[account] = GangAccounts[account] - amount
			isRemoved = true
		end

		MySQL.update('UPDATE management_funds SET amount = ? WHERE job_name = ? and type = "gang"', { GangAccounts[account], account })
	end
	return isRemoved
end

MySQL.ready(function ()
	local gangmenu = MySQL.query.await('SELECT job_name,amount FROM management_funds WHERE type = "gang"', {})
	if not gangmenu then return end

	for _,v in ipairs(gangmenu) do
		GangAccounts[v.job_name] = v.amount
	end
end)

RegisterNetEvent("qb-gangmenu:server:withdrawMoney", function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'withdrawMoney Exploiting') return end

	local gang = Player.PlayerData.gang.name
	if RemoveGangMoney(gang, amount) then
		Player.Functions.AddMoney("bank", amount, 'Gang menu withdraw')
		TriggerEvent('qb-log:server:CreateLog', 'gangmenu', 'Withdraw Money', 'yellow', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' successfully withdrew $' .. amount .. ' (' .. gang .. ')', false)
		TriggerClientEvent('QBCore:Notify', src, "You have withdrawn: $" ..amount, "success")
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money in the account!", "error")
	end

	TriggerClientEvent('qb-gangmenu:client:OpenMenu', src)
end)

RegisterNetEvent("qb-gangmenu:server:depositMoney", function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'depositMoney Exploiting') return end

	if Player.Functions.RemoveMoney("bank", amount, 'gang menu deposit') then
		local gang = Player.PlayerData.gang.name
		AddGangMoney(gang, amount)
		TriggerEvent('qb-log:server:CreateLog', 'gangmenu', 'Deposit Money', 'yellow', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' successfully deposited $' .. amount .. ' (' .. gang .. ')', false)
		TriggerClientEvent('QBCore:Notify', src, "You have deposited: $" ..amount, "success")
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money to add!", "error")
	end

	TriggerClientEvent('qb-gangmenu:client:OpenMenu', src)
end)

QBCore.Functions.CreateCallback('qb-gangmenu:server:GetAccount', function(_, cb, GangName)
	local gangmoney = GetGangAccount(GangName)
	cb(gangmoney)
end)

-- Get Employees
QBCore.Functions.CreateCallback('qb-gangmenu:server:GetEmployees', function(source, cb, gangname)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'GetEmployees Exploiting') return end

	local employees = {}
	local players = MySQL.query.await("SELECT citizenid, `group`, grade FROM player_groups WHERE `group` = ?", {gangname})	
	if players[1] ~= nil then
		for _, value in pairs(players) do
			local isOnline = QBCore.Functions.GetPlayerByCitizenId(value.citizenid)

			if isOnline then
				employees[#employees+1] = {
				empSource = isOnline.PlayerData.citizenid,
				grade = isOnline.PlayerData.gang.grade,
				isboss = isOnline.PlayerData.gang.isboss,
				name = '🟢' .. isOnline.PlayerData.charinfo.firstname .. ' ' .. isOnline.PlayerData.charinfo.lastname
				}
			else
				local isOffline = QBCore.Functions.GetOfflinePlayerByCitizenId(value.citizenid)
				employees[#employees+1] = {
				empSource = value.citizenid,
				grade =  exports.qbx_core:GetGang(gangname).grades[value.grade],
				isboss = exports.qbx_core:GetGang(gangname).grades[value.grade].isboss,
				name = '❌' ..  isOffline.PlayerData.charinfo.firstname .. ' ' .. isOffline.PlayerData.charinfo.lastname
				}
			end
		end
	end
	cb(employees)
end)

-- Grade Change
RegisterNetEvent('qb-gangmenu:server:GradeUpdate', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Employee = QBCore.Functions.GetPlayerByCitizenId(data.cid)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'GradeUpdate Exploiting') return end
	if data.grade > Player.PlayerData.gang.grade.level then TriggerClientEvent('QBCore:Notify', src, "You cannot promote to this rank!", "error") return end

	if Employee then
		if Employee.Functions.SetGang(Player.PlayerData.gang.name, data.grade) then
			TriggerClientEvent('QBCore:Notify', src, "Successfully updated!", "success")
			TriggerClientEvent('QBCore:Notify', Employee.PlayerData.source, "You have been updated to " ..data.gradename..".", "success")
		else
			TriggerClientEvent('QBCore:Notify', src, "Grade does not exist.", "error")
		end
	else
		MySQL.update(
			'UPDATE players SET gang = JSON_SET(gang, "$.grade.name", ?, "$.grade.level", ?) WHERE citizenid = ?',
			{ data.gradename, data.grade, data.cid }
		)
		local isboss = exports.qbx_core:GetGang(Player.PlayerData.gang.name).grades[data.grade].isboss
		if not isboss then isboss = false end
		MySQL.update(
			'UPDATE players SET gang = JSON_SET(gang, "$.isboss", ?) WHERE citizenid = ?',
			{ isboss, data.cid }
		)
		MySQL.update(
    		'UPDATE player_groups SET grade = ? WHERE citizenid = ?',
    		{ data.grade, data.cid }
		)
		TriggerClientEvent('QBCore:Notify', src, "Successfully updated!", "success")
	end
	TriggerClientEvent('qb-gangmenu:client:OpenMenu', src)
end)

-- Fire Member
RegisterNetEvent('qb-gangmenu:server:FireMember', function(target)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Employee = QBCore.Functions.GetPlayerByCitizenId(target)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'FireEmployee Exploiting') return end

	if Employee then
		if target ~= Player.PlayerData.citizenid then
			if Employee.PlayerData.gang.grade.level > Player.PlayerData.gang.grade.level then TriggerClientEvent('QBCore:Notify', src, "You cannot fire this citizen!", "error") return end
			if Employee.Functions.SetGang("none", '0') then
				TriggerEvent("qb-log:server:CreateLog", "gangmenu", "Gang Fire", "orange", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.PlayerData.charinfo.firstname .. " " .. Employee.PlayerData.charinfo.lastname .. " (" .. Player.PlayerData.gang.name .. ")", false)
				TriggerClientEvent('QBCore:Notify', src, "Gang Member fired!", "success")
				TriggerClientEvent('QBCore:Notify', Employee.PlayerData.source , "You have been expelled from the gang!", "error")
			else
				TriggerClientEvent('QBCore:Notify', src, "Error.", "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', src, "You can\'t kick yourself out of the gang!", "error")
		end
	else
		local player = MySQL.query.await('SELECT * FROM players WHERE citizenid = ? LIMIT 1', {target})
		if player[1] ~= nil then
			Employee = player[1]
			Employee.charinfo = json.decode(Employee.charinfo)
			Employee.gang = json.decode(Employee.gang)
			if Employee.gang.grade.level > Player.PlayerData.job.grade.level then TriggerClientEvent('QBCore:Notify', src, "You cannot fire this citizen!", "error") return end
			local gang = {}
			gang.name = "none"
			gang.label = "No Affiliation"
			gang.payment = 0
			gang.onduty = true
			gang.isboss = false
			gang.grade = {}
			gang.grade.name = nil
			gang.grade.level = 0
			MySQL.update('UPDATE players SET gang = ? WHERE citizenid = ?', {json.encode(gang), target})
			MySQL.query.await(
					'DELETE FROM player_groups WHERE citizenid = ? AND `group` = ?',
					{ target, Player.PlayerData.gang.name }
			)
			TriggerClientEvent('QBCore:Notify', src, "Gang member fired!", "success")
			TriggerEvent("qb-log:server:CreateLog", "gangmenu", "Gang Fire", "orange", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.charinfo.firstname .. " " .. Employee.charinfo.lastname .. " (" .. Player.PlayerData.gang.name .. ")", false)
		else
			TriggerClientEvent('QBCore:Notify', src, "Civilian is not in city.", "error")
		end
	end
	TriggerClientEvent('qb-gangmenu:client:OpenMenu', src)
end)

-- Recruit Player
RegisterNetEvent('qb-gangmenu:server:HireMember', function(recruit)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Target = QBCore.Functions.GetPlayer(recruit)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'HireEmployee Exploiting') return end

	if Target and Target.Functions.SetGang(Player.PlayerData.gang.name, 0) then
		TriggerClientEvent('QBCore:Notify', src, "You hired " .. (Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname) .. " come " .. Player.PlayerData.gang.label .. "", "success")
		TriggerClientEvent('QBCore:Notify', Target.PlayerData.source , "You have been hired as " .. Player.PlayerData.gang.label .. "", "success")
		TriggerEvent('qb-log:server:CreateLog', 'gangmenu', 'Recruit', 'yellow', (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname).. ' successfully recruited ' .. Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname .. ' (' .. Player.PlayerData.gang.name .. ')', false)
	end
	TriggerClientEvent('qb-gangmenu:client:OpenMenu', src)
end)

RegisterNetEvent('qb-gangmenu:server:AddMember', function(recruit, gangName)
	local Target = QBCore.Functions.GetPlayer(recruit)
	
	if Target then
		Target.Functions.SetGang(gangName, 0) 	
	end
end)

RegisterNetEvent('qb-gangmenu:server:RemoveMember', function(recruit)
	local Target = QBCore.Functions.GetPlayerByCitizenId(recruit)

	if Target then
		Target.Functions.SetGang('none', 0) 	
	end
end)

-- Get closest player sv
QBCore.Functions.CreateCallback('qb-gangmenu:getplayers', function(source, cb)
	local src = source
	local players = {}
	local PlayerPed = GetPlayerPed(src)
	local pCoords = GetEntityCoords(PlayerPed)
	for _, v in pairs(QBCore.Functions.GetPlayers()) do
		local targetped = GetPlayerPed(v)
		local tCoords = GetEntityCoords(targetped)
		local dist = #(pCoords - tCoords)
		if PlayerPed ~= targetped and dist < 10 then
			local ped = QBCore.Functions.GetPlayer(v)
			players[#players+1] = {
			id = v,
			coords = GetEntityCoords(targetped),
			name = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname,
			citizenid = ped.PlayerData.citizenid,
			sources = GetPlayerPed(ped.PlayerData.source),
			sourceplayer = ped.PlayerData.source
			}
		end
	end
		table.sort(players, function(a, b)
			return a.name < b.name
		end)
	cb(players)
end)


for name, gang in pairs(QBCore.Shared.Gangs) do
	exports.ox_inventory:RegisterStash('boss_'..name, 'Boss Stash ['..gang.label..']', 10, 100000, nil, {[name] = 0})
end