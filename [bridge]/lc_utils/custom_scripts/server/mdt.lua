-- If you have successfully implemented any code here, please share your results on our Discord to assist other customers using the same scripts :)
-- https://discord.gg/U5YDgbh
function Utils.CustomScripts.createWeaponInMdt(source,item,amount,metadata)
	-- If you've set the config to "other", you need to configure your export here your mdt export.
	-- Must return true if the weapon was sent to player or false if not.
	-- Remove the error line below after implementing.
	local QBCore = exports['qb-core']:GetCoreObject()
	local serial = QBCore.Shared.RandomInt(2)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(3)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)
	exports.drx_mdt:CreateWeapon(serial, { source = source }, item, exports.ox_inventory:Items(item).label)
	metadata.serial =  serial


	-- After setting the mdt export, you also must run the export to give the weapon to the player.
	return Utils.Framework.insertWeaponInInventory(source,item,amount,metadata)
end