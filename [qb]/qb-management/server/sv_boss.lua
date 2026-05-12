local QBCore = exports['qb-core']:GetCoreObject()
local Accounts = {}
local ox_inventory = exports.ox_inventory

function ExploitBan(id, reason)
	MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
		GetPlayerName(id),
		QBCore.Functions.GetIdentifier(id, 'license'),
		QBCore.Functions.GetIdentifier(id, 'discord'),
		QBCore.Functions.GetIdentifier(id, 'ip'),
		reason,
		2147483647,
		'qb-management'
	})
	TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(id), 'qb-management', reason), true)
	DropPlayer(id, 'You were permanently banned by the server for: Exploiting')
end

function GetAccount(account)
	return Accounts[account] or 0
end

function AddMoney(account, amount)
	if not Accounts[account] then
		Accounts[account] = 0
	end

	Accounts[account] = Accounts[account] + amount
	MySQL.insert('INSERT INTO management_funds (job_name, amount, type) VALUES (:job_name, :amount, :type) ON DUPLICATE KEY UPDATE amount = :amount',
		{
			['job_name'] = account,
			['amount'] = Accounts[account],
			['type'] = 'boss'
		})
end

function RemoveMoney(account, amount)
	local isRemoved = false
	if amount > 0 then
		if not Accounts[account] then
			Accounts[account] = 0
		end

		if Accounts[account] >= amount then
			Accounts[account] = Accounts[account] - amount
			isRemoved = true
		end

		MySQL.update('UPDATE management_funds SET amount = ? WHERE job_name = ? and type = "boss"', { Accounts[account], account })
	end
	return isRemoved
end

MySQL.ready(function ()
	local bossmenu = MySQL.query.await('SELECT job_name,amount FROM management_funds WHERE type = "boss"', {})
	if not bossmenu then return end

	for _,v in ipairs(bossmenu) do
		Accounts[v.job_name] = v.amount
	end
end)

RegisterNetEvent("qb-bossmenu:server:withdrawMoney", function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if not Player.PlayerData.job.isboss then QBCore.Functions.Notify(src, "You are unable to perform this action, please wait a few minutes before trying again!", "error") return end

	local job = Player.PlayerData.job.name
	if RemoveMoney(job, amount) then
		Player.Functions.AddMoney("bank", amount, 'Boss menu withdraw')
		TriggerEvent('qb-log:server:CreateLog', 'bossmenu', 'Withdraw Money', "blue", Player.PlayerData.name.. "Withdrawal $" .. amount .. ' (' .. job .. ')', false)
		TriggerClientEvent('QBCore:Notify', src, "You have withdrawn: $" ..amount, "success")
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money in the account!", "error")
	end

	TriggerClientEvent('qb-bossmenu:client:OpenMenu', src)
end)

RegisterNetEvent("qb-bossmenu:server:depositMoney", function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local bankBalance = Player.Functions.GetMoney("bank")

	if not Player.PlayerData.job.isboss then QBCore.Functions.Notify(src, "You are unable to perform this action, please wait a few minutes before trying again!", "error") return end

	if bankBalance >= amount then
		Player.Functions.RemoveMoney("bank", amount, 'boss menu deposit')
		local job = Player.PlayerData.job.name
		AddMoney(job, amount)
		TriggerEvent('qb-log:server:CreateLog', 'bossmenu', 'Deposit Money', "blue", Player.PlayerData.name.. "Deposit $" .. amount .. ' (' .. job .. ')', false)
		TriggerClientEvent('QBCore:Notify', src, "You have deposited: $" ..amount, "success")
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money to add!", "error")
	end

	TriggerClientEvent('qb-bossmenu:client:OpenMenu', src)
end)

QBCore.Functions.CreateCallback('qb-bossmenu:server:GetAccount', function(_, cb, jobname)
	local result = GetAccount(jobname)
	cb(result)
end)

-- Get Employees
QBCore.Functions.CreateCallback('qb-bossmenu:server:GetEmployees', function(source, cb, jobname)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if not Player.PlayerData.job.isboss then QBCore.Functions.Notify(src, "You are unable to perform this action, please wait a few minutes before trying again!", "error") return end

	local employees = {}
	local players = MySQL.query.await("SELECT citizenid, `group`, grade FROM player_groups WHERE `group` = ?", {jobname})	
	if players[1] ~= nil then
		for _, value in pairs(players) do
			local isOnline = QBCore.Functions.GetPlayerByCitizenId(value.citizenid)
			
			if isOnline then
				employees[#employees+1] = {
				empSource = isOnline.PlayerData.citizenid,
				gradeNum = value.grade,
				grade = exports.qbx_core:GetJob(jobname).grades[value.grade],
				isboss = exports.qbx_core:GetJob(jobname).grades[value.grade].isboss,
				name = '🟢 ' .. isOnline.PlayerData.charinfo.firstname .. ' ' .. isOnline.PlayerData.charinfo.lastname
				}
			else
				local isOffline = QBCore.Functions.GetOfflinePlayerByCitizenId(value.citizenid)
				if isOffline then
					employees[#employees+1] = {
					empSource = value.citizenid,
					gradeNum = value.grade,
					grade =  exports.qbx_core:GetJob(jobname).grades[value.grade],
					isboss = exports.qbx_core:GetJob(jobname).grades[value.grade].isboss,
					name = '❌ ' ..  isOffline.PlayerData.charinfo.firstname .. ' ' .. isOffline.PlayerData.charinfo.lastname
					}
				end
			end
		end
		table.sort(employees, function(a, b)
            return a.gradeNum > b.gradeNum
        end)
	end
	cb(employees)
end)

-- Grade Change
RegisterNetEvent('qb-bossmenu:server:GradeUpdate', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Employee = QBCore.Functions.GetPlayerByCitizenId(data.cid)

	if not Player.PlayerData.job.isboss then QBCore.Functions.Notify(src, "You are unable to perform this action, please wait a few minutes before trying again!", "error") return end
	if data.grade > Player.PlayerData.job.grade.level then TriggerClientEvent('QBCore:Notify', src, "You cannot promote to this rank!", "error") return end
	
	if Employee then
		if Employee.PlayerData.job.name == Player.PlayerData.job.name then 
			Employee.Functions.SetJob(Player.PlayerData.job.name, data.grade)
		end
			exports['ps-multijob']:UpdateJobRank(data.cid, Player.PlayerData.job.name, data.grade)
			MySQL.query.await(
				'UPDATE player_groups SET grade = ? WHERE citizenid = ? AND `group` = ?',
				{ data.grade, Employee.PlayerData.citizenid, Player.PlayerData.job.name }
			)
			TriggerClientEvent('QBCore:Notify', src, "Successfully updated job grade!", "success")
			TriggerClientEvent('QBCore:Notify', Employee.PlayerData.source, "You have been changed to a " ..data.gradename..".", "success")
	else
		local OEmployee = QBCore.Functions.GetOfflinePlayerByCitizenId(data.cid)
		if OEmployee.PlayerData.job.name == Player.PlayerData.job.name then 
			local job = {}
			job.name = "unemployed"
			job.label = "Unemployed"
			job.payment = 0
			job.onduty = true
			job.isboss = false
			job.grade = {}
			job.grade.name = nil
			job.grade.level = 0
			MySQL.update('UPDATE players SET job = ? WHERE citizenid = ?', { json.encode(job), data.cid})
		end
		MySQL.query.await(
				'UPDATE player_groups SET grade = ? WHERE citizenid = ? AND `group` = ?',
				{ data.grade, OEmployee.PlayerData.citizenid, Player.PlayerData.job.name }
		)
		exports['ps-multijob']:UpdateJobRank(data.cid, Player.PlayerData.job.name, data.grade)
		TriggerClientEvent('QBCore:Notify', src, "Successfully updated job grade!", "success")
	end
	TriggerClientEvent('qb-bossmenu:client:OpenMenu', src)
end)

-- Fire Employee
RegisterNetEvent('qb-bossmenu:server:FireEmployee', function(target)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Employee = QBCore.Functions.GetPlayerByCitizenId(target)
	local EmployeeMulti = MySQL.query.await('SELECT grade FROM player_groups WHERE citizenid = ? AND `group` = ? LIMIT 1', { target, Player.PlayerData.job.name })
	local PlayerMulti = MySQL.query.await('SELECT grade FROM player_groups WHERE citizenid = ? AND `group` = ? LIMIT 1', { Player.PlayerData.citizenid, Player.PlayerData.job.name })
	local EmployeeGrade = EmployeeMulti[1].grade
	local PlayerGrade = PlayerMulti[1].grade
	if not Player.PlayerData.job.isboss then QBCore.Functions.Notify(src, "You are unable to perform this action, please wait a few minutes before trying again!", "error") return end

	if Employee then
		if target ~= Player.PlayerData.citizenid then
			if EmployeeGrade > PlayerGrade then TriggerClientEvent('QBCore:Notify', src, "You cannot fire this citizen!", "error") return end
				Employee.Functions.SetJob('unemployed', 0)
				TriggerEvent("qb-log:server:CreateLog", "bossmenu", "Job Fire", "red", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.PlayerData.charinfo.firstname .. " " .. Employee.PlayerData.charinfo.lastname .. " (" .. Player.PlayerData.job.name .. ")", false)
				TriggerClientEvent('QBCore:Notify', src, "Employee fired!", "success")
				TriggerClientEvent('QBCore:Notify', Employee.PlayerData.source , "You have been fired! Good luck.", "error")
				MySQL.query.await(
					'DELETE FROM player_groups WHERE citizenid = ? AND `group` = ?',
					{ target, Player.PlayerData.job.name }
				)
				TriggerEvent('ps-multijob:server:removeJob', target, Player.PlayerData.job.name, Player.PlayerData.job.grade.level)
		else
			TriggerClientEvent('QBCore:Notify', src, "You can\'t fire yourself", "error")
		end
	else
		local player = MySQL.query.await('SELECT * FROM players WHERE citizenid = ? LIMIT 1', { target })
		if player[1] ~= nil then
			Employee = player[1]
			Employee.charinfo = json.decode(Employee.charinfo)
			Employee.job = json.decode(Employee.job)
			if EmployeeGrade > PlayerGrade then TriggerClientEvent('QBCore:Notify', src, "You cannot fire this citizen!", "error") return end
			local job = {}
			job.name = "unemployed"
			job.label = "Unemployed"
			job.payment = 0
			job.onduty = true
			job.isboss = false
			job.grade = {}
			job.grade.name = nil
			job.grade.level = 0
			if Player.PlayerData.job.name == Employee.job.name then
				MySQL.update('UPDATE players SET job = ? WHERE citizenid = ?', { json.encode(job), target })
			end
			MySQL.query.await(
					'DELETE FROM player_groups WHERE citizenid = ? AND `group` = ?',
					{ target, Player.PlayerData.job.name }
			)
			TriggerClientEvent('QBCore:Notify', src, "Employee fired!", "success")
			TriggerEvent('ps-multijob:server:removeJob', target, Player.PlayerData.job.name, EmployeeGrade)
			TriggerEvent("qb-log:server:CreateLog", "bossmenu", "Job Fire", "red", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.charinfo.firstname .. " " .. Employee.charinfo.lastname .. " (" .. Player.PlayerData.job.name .. ")", false)
		else
			TriggerClientEvent('QBCore:Notify', src, "Civilian not in city.", "error")
		end
	end
	TriggerClientEvent('qb-bossmenu:client:OpenMenu', src)
end)

-- Recruit Player
RegisterNetEvent('qb-bossmenu:server:HireEmployee', function(recruit)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Target = QBCore.Functions.GetPlayer(recruit)

	if not Player.PlayerData.job.isboss then QBCore.Functions.Notify(src, "You are unable to perform this action, please wait a few minutes before trying again!", "error") return end
	-- if exports['ps-multijob']:CheckJob(Target.PlayerData.citizenid, Player.PlayerData.job.name, 0) then
		if Target and Target.Functions.SetJob(Player.PlayerData.job.name, 0) then
			TriggerClientEvent('QBCore:Notify', src, "You hired " .. (Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname) .. " come " .. Player.PlayerData.job.label .. "", "success")
			TriggerClientEvent('QBCore:Notify', Target.PlayerData.source , "You were hired as " .. Player.PlayerData.job.label .. "", "success")
			TriggerEvent('qb-log:server:CreateLog', 'bossmenu', 'Recruit', "lightgreen", (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname).. " successfully recruited " .. (Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname) .. ' (' .. Player.PlayerData.job.name .. ')', false)
		end
	-- else
	-- 	TriggerClientEvent('QBCore:Notify', src, "This person already has a job of this type.", "error")
	-- 	TriggerClientEvent('QBCore:Notify', Target.PlayerData.source, "You already have a job of this type.", "error")
	-- end
	TriggerClientEvent('qb-bossmenu:client:OpenMenu', src)
end)

-- Get closest player sv
QBCore.Functions.CreateCallback('qb-bossmenu:getplayers', function(source, cb)
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

function AddMoneyOkokBanking(account, amount)
	if not Accounts[account] then
		Accounts[account] = 0
	end

	Accounts[account] = Accounts[account] + amount
	MySQL.Async.execute('UPDATE management_funds SET amount = ? WHERE job_name = ?', { Accounts[account], account })
end

function RemoveMoneyOkokBanking(account, amount)
	local isRemoved = false
	if amount > 0 then
		if not Accounts[account] then
			Accounts[account] = 0
		end

		if Accounts[account] >= amount then
			Accounts[account] = Accounts[account] - amount
			isRemoved = true
		end

		MySQL.Async.execute('UPDATE management_funds SET amount = ? WHERE job_name = ?', { Accounts[account], account })
	end
	return isRemoved
end

function TransferMoneyOkokBanking(account, amount, iban)
	if not Accounts[account] then
		Accounts[account] = 0
	end

	Accounts[account] = Accounts[account] + amount
	MySQL.Async.execute('UPDATE management_funds SET amount = ? WHERE iban = ?', { Accounts[account], iban })
end

for name, job in pairs(QBCore.Shared.Jobs) do
	exports.ox_inventory:RegisterStash('boss_'..name, 'Boss Stash ['..job.label..']', 10, 100000, nil, {[name] = 0})
end