local Functions = {}

local resource = string.upper(GetCurrentResourceName())

--Framework Setup
Citizen.CreateThread(function()
	if cfg.framework == "esx_legacy" then
		TriggerEvent("esx:getSharedObject",function(obj) Functions = obj end)
	end
	if cfg.framework == "esx" then
		Functions = exports["es_extended"]:getSharedObject()
	end
	if cfg.framework == "qbcore" then
		Functions = exports["qb-core"]:GetCoreObject()
	end
	if cfg.framework == "qbox" then
		Functions = exports["qbx_core"]
	end
	if cfg.framework == "ndcore" then
		Functions = exports["ND_Core"]
	end
	if cfg.framework == "vrp" then
		local Proxy = module("vrp","lib/Proxy")
		Functions = Proxy.getInterface("vRP")
	end
	if cfg.framework == "vrpex" then
		local Proxy = module("vrp","lib/Proxy")
		Functions = Proxy.getInterface("vRP")
	end
	if cfg.framework == "nunoradioman" then
		Functions = exports["core_system_functions"]:GetFunctions(GetCurrentResourceName()) exports("Refresh", function(data) Functions = data end)
	end
end)

--Framework & Other Functions
function CheckIfItemExists(player,item_name,item_amount)
	if cfg.framework == "esx_legacy" or cfg.framework == "esx" then
		local xPlayer = Functions.GetPlayerFromId(player)

		if item_name == "money" then if xPlayer.getMoney() >= item_amount then return true else return false end else if xPlayer.getInventoryItem(item_name) ~= nil then if xPlayer.getInventoryItem(item_name).count >= item_amount then return true else return false end else return false end end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player)

		if item_name == "money" then if xPlayer.PlayerData.money["cash"] >= item_amount then return true else return false end else if xPlayer.Functions.GetItemByName(item_name) ~= nil then if xPlayer.Functions.GetItemByName(item_name).amount >= item_amount then return true else return false end else return false end end
	end
	if cfg.framework == "qbox" then
		if item_name == "money" then if Functions:GetMoney(player,"cash") >= item_amount then return true else return false end else if exports["ox_inventory"]:GetItem(player,item_name,nil,true) >= item_amount then return true else return false end end
	end
	if cfg.framework == "ndcore" then
		local xPlayer = Functions.getPlayer(player)

		if item_name == "money" then if xPlayer.cash >= item_amount then return true else return false end else if exports["ox_inventory"]:GetItem(player,item_name,nil,true) >= item_amount then return true else return false end end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player})

		if item_name == "money" then if Functions.getMoney({user_id}) >= item_amount then return true else return false end else if Functions.getInventoryItemAmount({user_id,item_name}) >= item_amount then return true else return false end end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player)

		if item_name == "money" then if Functions.getMoney(user_id) >= item_amount then return true else return false end else if Functions.getInventoryItemAmount(user_id,item_name) >= item_amount then return true else return false end end
	end
	if cfg.framework == "nunoradioman" then
		return Functions.Inventory.CheckIfPlayerInventoryItemExists({player = player,item_name = item_name,item_amount = item_amount})
	end
	if cfg.framework == "standalone" then
		return true
	end
end
function RemoveItemFromPlayer(player,item_name,item_amount)
	if cfg.framework == "esx_legacy" or cfg.framework == "esx" then
		local xPlayer = Functions.GetPlayerFromId(player)

		if item_name == "money" then xPlayer.removeAccountMoney("money",item_amount) else xPlayer.removeInventoryItem(item_name,item_amount) end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player)

		if item_name == "money" then xPlayer.Functions.RemoveMoney("cash",item_amount) else xPlayer.Functions.RemoveItem(item_name,item_amount) end
	end
	if cfg.framework == "qbox" then
		if item_name == "money" then Functions:RemoveMoney(player,"cash",item_amount) else exports["ox_inventory"]:RemoveItem(player,item_name,item_amount) end
	end
	if cfg.framework == "ndcore" then
		local xPlayer = Functions.getPlayer(player)

		if item_name == "money" then Functions:deductMoney("cash",item_amount) else exports["ox_inventory"]:RemoveItem(player,item_name,item_amount) end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player})

		if item_name == "money" then Functions.tryPayment({user_id,item_amount}) else Functions.tryGetInventoryItem({user_id,item_name,item_amount,true}) end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player)

		if item_name == "money" then Functions.tryPayment(user_id,item_amount) else Functions.tryGetInventoryItem(user_id,item_name,item_amount,true) end
	end
	if cfg.framework == "nunoradioman" then
		Functions.Inventory.RemoveInventoryItem({player = player,item_name = item_name,item_amount = item_amount,item_notification = true})
	end

	if cfg.log.active then
		Log("removeitem",player,{item_name = item_name,item_amount = item_amount})
	end
end
function GiveItemToPlayer(player,item_name,item_amount)
	exports['drool_skills']:addXP(player, math.random(1, 5))
	if cfg.framework == "esx_legacy" or cfg.framework == "esx" then
		local xPlayer = Functions.GetPlayerFromId(player)

		if item_name == "money" then xPlayer.addAccountMoney("money",item_amount) elseif item_name == "dirtymoney" then xPlayer.addAccountMoney("black_money",item_amount) else xPlayer.addInventoryItem(item_name,item_amount) end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player)

		if item_name == "money" then xPlayer.Functions.AddMoney("cash",item_amount) elseif item == "markedbills" then xPlayer.Functions.AddItem("markedbills",1,false,{worth = item_amount}) else xPlayer.Functions.AddItem(item_name,item_amount) end
	end
	if cfg.framework == "qbox" then
		if item_name == "money" then 
			local Player = exports.qbx_core:GetPlayer(player)
			local HeistLevel = Player and Player.PlayerData.metadata.skills.levels.heists.tier
			if item_amount then 
				if HeistLevel and HeistLevel == 1 then
					item_amount = math.floor(item_amount * 1.02)
					exports.qbx_core:Notify(player, "You received an extra 2% to your marked money from your heist skills.", 'success')
				elseif HeistLevel and HeistLevel == 2 then
					item_amount = math.floor(item_amount * 1.03)
					exports.qbx_core:Notify(player, "You received an extra 3% to your marked money from your heist skills.", 'success')
				elseif HeistLevel and HeistLevel == 3 then
					item_amount = math.floor(item_amount * 1.05)
					exports.qbx_core:Notify(player, "You received an extra 5% to your marked money from your heist skills.", 'success')
				elseif HeistLevel and HeistLevel == 4 then
					item_amount = math.floor(item_amount * 1.08)
					exports.qbx_core:Notify(player, "You received an extra 8% to your marked money from your heist skills.", 'success')
				elseif HeistLevel and HeistLevel == 5 then
					item_amount = math.floor(item_amount * 1.10)
					exports.qbx_core:Notify(player, "You received an extra 10% to your marked money from your heist skills.", 'success')
				end
			end
			exports["ox_inventory"]:AddItem(player, 'markedbills', 1, {worth = item_amount}) 
		else 
			exports["ox_inventory"]:AddItem(player,item_name,item_amount) 
		end
	end
	if cfg.framework == "ndcore" then
		local xPlayer = Functions.getPlayer(player)

		if item_name == "money" then Functions:addMoney("cash",item_amount) else exports["ox_inventory"]:AddItem(player,item_name,item_amount) end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player})

		if item_name == "money" then Functions.giveMoney({user_id,item_amount}) else Functions.giveInventoryItem({user_id,item_name,item_amount,true}) end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player)

		if item_name == "money" then Functions.giveMoney(user_id,item_amount) else Functions.giveInventoryItem(user_id,item_name,item_amount,true) end
	end
	if cfg.framework == "nunoradioman" then
		Functions.Inventory.GiveInventoryItem({player = player,item_name = item_name,item_amount = item_amount,item_notification = true})
	end

	if cfg.log.active then
		Log("giveitem",player,{item_name = item_name,item_amount = item_amount})
	end
end
function CheckForPolice()
	if cfg.framework == "esx_legacy" then
		local xPlayers = Functions.GetPlayers()

		local cops = 0 for _,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.job.name == group then cops = cops + 1 break end end end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "esx" then
		local xPlayers = Functions.GetExtendedPlayers()

		local cops = 0 for _,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.job.name == group then cops = cops + 1 break end end end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "qbcore" then
		local xPlayers = Functions.Functions.GetQBPlayers()

		local cops = 0 for _,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.PlayerData.job.name == group and playerdata.PlayerData.job.onduty then cops = cops + 1 break end end end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "qbox" then
		local xPlayers = Functions:GetQBPlayers()

		local cops = 0 for _,group in pairs(cfg.police.groups) do cops = cops + exports.qbx_core:GetDutyCountJob(group) end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "ndcore" then
		local xPlayers = Functions:getPlayers()

		local cops = 0 for _,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.job.name == group then cops = cops + 1 break end end end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "vrp" then
		local cops = 0 for groupindex,group in pairs(cfg.police.groups) do cops = cops + #Functions.getUsersByPermission({group}) end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "vrpex" then
		local cops = 0 for groupindex,group in pairs(cfg.police.groups) do cops = cops + #Functions.getUsersByPermission(group) end

		if cops >= cfg.police.amount then return true else return false end
	end
	if cfg.framework == "nunoradioman" then
		return true
	end
	if cfg.framework == "standalone" then
		return true
	end
end
function CallPolice(data)
	if cfg.dispatch == "default" then
		if cfg.framework == "esx_legacy" then
			local xPlayers = Functions.GetPlayers()

			for _,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.job.name == group then TriggerClientEvent(resource..":PoliceNotification_c",playerdata.source,data) break end end end
		end
		if cfg.framework == "esx" then
			local xPlayers = Functions.GetExtendedPlayers()

			for _,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.job.name == group then TriggerClientEvent(resource..":PoliceNotification_c",playerdata.source,data) break end end end
		end
		if cfg.framework == "qbcore" then
			local xPlayers = Functions.Functions.GetQBPlayers()

			for player,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.PlayerData.job.name == group and playerdata.PlayerData.job.onduty then TriggerClientEvent(resource..":PoliceNotification_c",player,data) break end end end
		end
		if cfg.framework == "qbox" then
			local xPlayers = Functions:GetQBPlayers()

			for player,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.PlayerData.job.name == group and playerdata.PlayerData.job.onduty then TriggerClientEvent(resource..":PoliceNotification_c",player,data) break end end end
		end
		if cfg.framework == "ndcore" then
			local xPlayers = Functions:getPlayers()

			for player,playerdata in pairs(xPlayers) do for _,group in pairs(cfg.police.groups) do if playerdata.job.name == group then TriggerClientEvent(resource..":PoliceNotification_c",player,data) break end end end
		end
		if cfg.framework == "vrp" then
			for _,group in pairs(cfg.police.groups) do
				local cops = Functions.getUsersByPermission({group})

				for _,user_id in pairs(cops) do
					local player = Functions.getUserSource({user_id})
					TriggerClientEvent(resource..":PoliceNotification_c",player,data)
				end
			end
		end
		if cfg.framework == "vrpex" then
			for _,group in pairs(cfg.police.groups) do
				local cops = Functions.getUsersByPermission(group)

				for _,user_id in pairs(cops) do
					local player = Functions.getUserSource(user_id)
					TriggerClientEvent(resource..":PoliceNotification_c",player,data)
				end
			end
		end
		if cfg.framework == "nunoradioman" then
			TriggerClientEvent(resource..":PoliceNotification_c",-1,data)
		end
	else
		TriggerClientEvent(resource..":PoliceNotification_c",data.player,data)
	end
end
function Notification(data)
	TriggerClientEvent(resource..":Notification_c",data.player,data)
end
function Log(type,player,data)
	local embeds = {}

	local license = string.sub(GetPlayerIdentifierByType(player,"license"),9)
	local discord = string.sub(GetPlayerIdentifierByType(player,"discord"),9)
	local ip = string.sub(GetPlayerIdentifierByType(player,"ip"),4)

	local resource_name = GetResourceMetadata(GetCurrentResourceName(),"resource_name",0)

	if type == "start" then
		table.insert(embeds,{
			description = string.format(cfg.log.logs[type].message,resource_name,os.date("%x"),os.date("%X"),GetPlayerName(player),license,discord,ip),
			color = cfg.log.logs[type].color,
		})
	elseif type == "giveitem" or type == "removeitem" then
		table.insert(embeds,{
			description = string.format(cfg.log.logs[type].message,resource_name,data.item_name,data.item_amount,os.date("%x"),os.date("%X"),GetPlayerName(player),license,discord,ip),
			color = cfg.log.logs[type].color,
		})
	end

	PerformHttpRequest(cfg.log.logs[type].webhook,function(err,text,headers) end,"POST",json.encode({username="Nuno Radio Man",embeds=embeds,avatar_url=cfg.log.logs[type].avatar}),{["Content-Type"]="application/json"})
end