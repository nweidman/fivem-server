WebhookURL = "" -- Webhook to send logs to discord
local QBCore = exports['qb-core']:GetCoreObject()
local TEMPserialnumber = ''
function beforeBuyMarket(source,market_id,price)
	-- Here you can do any verification when a player is buying a market, like if player has the permission to that or anything else you want to check before buy the market. return true or false
	
	return true
end

function afterBuyMarket(source,market_id,price)
	-- Here you can run any code right after the player purchase a business
end

function beforeBuyItem(source,market_id,item_id,amount,total_price,metadata)
	-- This function allows you to add checks before a player buys an item from a market. For example, you can verify whether the player has the necessary permissions or licenses to buy the item.
	-- You can also change the item's metadata here. For instance, by removing the comment from the next line, you will add a new metadata to the item called "purchased_at":
	-- metadata.purchased_at = "Owned stores"
	-- This function must return 'true' to allow the purchase, or 'false' to block it, based on your conditions.
	if not exports.ox_inventory:CanCarryItem(source, item_id, amount) then
		return false
	end
	-- if item_id:find("weapon") then
		-- local serial = QBCore.Shared.RandomInt(2)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(3)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)
		-- exports.drx_mdt:CreateWeapon(serial, { source = source }, item_id, exports.ox_inventory:Items(item_id).label)
		-- local Player = QBCore.Functions.GetPlayer(source)
		-- TEMPserialnumber = QBCore.Shared.RandomInt(2)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(3)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)
		-- metadata.serial =  TEMPserialnumber
		-- -- print(tostring(json.encode(exports.ox_inventory:Items(item_id))))
		-- local invImage = ("nui://ox_inventory/web/images/%s"):format(QBCore.Shared.Items[item_id].image)
		-- if invImage then
		-- 	local weaponInfo = {
		-- 		serialnumber = TEMPserialnumber,
		-- 		owner = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
		-- 		weaponmodel = exports.ox_inventory:Items(item_id).label,
		-- 		weaponurl = invImage,
		-- 		notes = "Purchased in Gun Store",
		-- 		weapClass = "",
		-- 	}
        --     TriggerEvent('mdt:server:registerweapon', weaponInfo.serialnumber, weaponInfo.weaponurl, weaponInfo.notes, weaponInfo.owner, weaponInfo.weapClass, weaponInfo.weaponmodel)
		-- end
	-- end
	return true
end

function afterBuyItem(source,market_id,item_id,amount,total_price,account)
	local Player = QBCore.Functions.GetPlayer(source)

	if item_id == "communityalbum" then
		Player.Functions.RemoveItem(item_id, 1)
		Player.Functions.AddItem("album", 1, nil, {
			pack = "Community",
			image = "Communityalbum"
		})
	end
	if item_id == "eventalbum" then
		Player.Functions.RemoveItem(item_id, 1)
		Player.Functions.AddItem("album", 1, nil, {
			pack = "event",
			image = ""
		})
	end
	-- Here you can run any code just after the player purchased any item, like government taxes or anything else
end

function beforeHireEmployee(source,market_id,employee_id)
	-- Here you can do any verification when a player is being hired to a store by the owner. return true or false
	return true
end

function afterHireEmployee(source,market_id,employee_id)
	-- Here you can run any code right after the a employee was hired
end