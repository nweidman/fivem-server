Framework = nil

if Settings.Framework == "qb" then
	Framework = exports['qb-core']:GetCoreObject()
elseif Settings.Framework == "esx" then
	Framework = exports['es_extended']:getSharedObject()
elseif Settings.Framework == "oldEsx" then
	TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
end

function RegisterServerCallback(...)
	if Settings.Framework == "qb" then
		Framework.Functions.CreateCallback(...)
	else
		Framework.RegisterServerCallback(...)
	end
end

-------------------------------------------------------------

function getXPlayer(src)
	if Settings.Framework == "qb"then
		return Framework.Functions.GetPlayer(src)
	elseif Settings.Framework == "esx" then
		return Framework.GetPlayerFromId(src)
	else
		return Framework.GetPlayerFromId(src)
	end
end

function getCitizenId(player)
    if Settings.Framework == "qb" then
        return player.PlayerData.citizenid
    elseif Settings.Framework == "esx" then
        return player.identifier
    else
        return player.identifier
    end
end

-------------------------------------------------------------

function getName(player, state)
	local fullname
	if Settings.Framework == "esx" or Settings.Framework == "oldEsx" then
		fullname = player.getName()
	else
		local firstname = player.PlayerData.charinfo.firstname
		local lastname = player.PlayerData.charinfo.lastname
		fullname = firstname.." "..lastname
	end

	return fullname
end

function getFirstName(player)
    local firstname
    if Settings.Framework == "esx" or Settings.Framework == "oldEsx" then
        firstname = player.getName()
    else
        firstname = player.PlayerData.charinfo.firstname
    end

    return firstname
end

function getLastName(player)
    local lastname
    if Settings.Framework == "esx" or Settings.Framework == "oldEsx" then
        lastname = ""
    else
        lastname = player.PlayerData.charinfo.lastname
    end

    return lastname
end


-------------------------------------------------------------

function giveServerMoney(player, amount)
    if Settings.Framework == "qb" then
        player.Functions.AddMoney(Settings.CashOrBank, tonumber(amount), ' Shop')
    else
        local cashOrBank = Settings.CashOrBank == "cash" and "money" or "bank"
        player.addAccountMoney(cashOrBank, tonumber(amount))
    end
end

-------------------------------------------------------------

function removeServerMoney(player, bankOrCash, amount)
    if Settings.Framework == "qb" then
        player.Functions.RemoveMoney(bankOrCash, tonumber(amount), ' Shop')
    else
        player.removeAccountMoney(bankOrCash, tonumber(amount))
    end
end

-------------------------------------------------------------

function addItemToPlayer(player, item, amount)
    if Settings.Framework == "qb" then
        player.Functions.AddItem(item, amount)
    else
        player.addInventoryItem(item, amount)
    end
end

-------------------------------------------------------------

function setJobToPlayer(player, job, grade)
    if Settings.Framework == "qb" then
        player.Functions.SetJob(job, grade)
    else
        player.setJob(job, grade)
    end
end

-------------------------------------------------------------

function getPlayerLicense(player)
    if Settings.Framework == "qb" then
        return player.PlayerData.license
    else
        return player.getIdentifier()
    end
end

-------------------------------------------------------------

function addWeaponToPlayer(player, weapon, amount)
    if Settings.Framework == "qb" then
        for i = 1, amount do
            player.Functions.AddItem(weapon, 1)
        end
    else
        player.addWeapon(weapon, ammo)
    end
end


-------------------------------------------------------------

function plateOwnerCheck(citizenId, plate)
    if Settings.Framework == "qb" then
        local result = plateCheck(plate)
        if result ~= nil then
            if result.citizenid == citizenId then
                return result
            else
                return nil
            end
        else
            return nil
        end
    else
        local result = plateCheck(plate)
        if result ~= nil then
            if result.owner == citizenId then
                return result
            else
                return nil
            end
        else
            return nil
        end
    end
end

-------------------------------------------------------------



-------------------------------------------------------------

function addVehicleToGarage(player, itemData)
    local _player = player
    if Settings.Framework == "qb" then
        local license = getPlayerLicense(_player)
        ExecuteSql("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage_id, state, in_garage) VALUES ('"..license.."', '"..getCitizenId(_player).."', '"..itemData.itemName.."', '"..GetHashKey(itemData.itemName).."', '"..json.encode(itemData.carData).."', '"..itemData.carData.plate.."', '"..itemData.garage.."', '1', '1')")
    else
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES ('"..getCitizenId(_player).."', '"..itemData.carData.plate.."', '"..json.encode(itemData.carData).."', '"..itemData.itemType.."', '"..Settings.VehicleStored.."')")
    end
end


-------------------------------------------------------------

function plateCheck(plate)
    if Settings.Framework == "qb" then
        local plateCheck = ExecuteSql("SELECT * FROM player_vehicles WHERE plate = '"..plate.."'")
        if plateCheck[1] ~= nil then
            return plateCheck[1]
        else
            return nil
        end
    else
        local plateCheck = ExecuteSql("SELECT * FROM owned_vehicles WHERE plate = '"..plate.."'")
        if plateCheck[1] ~= nil then
            return plateCheck[1]
        else
            return nil
        end
    end
end

-------------------------------------------------------------
-- @phoneNumber : string (Old Phone Number)
function checkPhoneNumber(phoneNumber)
    if not Settings.PhoneCustomElse then 
        local selectNumberExecute = ""
        if Settings.Phone == "qb-phone" then 
            if Settings.Framework == "qb" then
                selectNumberExecute = "SELECT * FROM players WHERE charinfo LIKE '%"..phoneNumber.."%'"
            else
                selectNumberExecute = "SELECT * FROM users WHERE charinfo LIKE '%"..phoneNumber.."%'"
            end
        elseif Settings.Phone == "gcphone" then
            if Settings.Framework == "qb" then
                selectNumberExecute = "SELECT * FROM players WHERE phone_number = '"..phoneNumber.."'"
            else
                selectNumberExecute = "SELECT * FROM users WHERE phone_number = '"..phoneNumber.."'"
            end
        elseif Settings.Phone == "gksphone" then
            if Settings.Framework == "qb" then
                selectNumberExecute = "SELECT * FROM players WHERE phone_number = '"..phoneNumber.."'"
            else
                selectNumberExecute = "SELECT * FROM users WHERE phone_number = '"..phoneNumber.."'"
            end
        end
        local phoneCheck = ExecuteSql(selectNumberExecute)
        if phoneCheck[1] ~= nil then
            return phoneCheck[1]
        else
            return nil
        end
    else
        -- If you want to use custom else, you can use this function.
        -- You can use this function to check the phone number in your own database.
        -- You can use the phoneNumber as a parameter in the function.
        -- and also check 277. line
        local phoneCheck = ExecuteSql("SELECT * FROM users WHERE phone_number = '"..phoneNumber.."'")
        if phoneCheck[1] ~= nil then
            return phoneCheck[1]
        else
            return nil
        end
    end
end

-------------------------------------------------------------

-- @phoneNumber: string (new Phone Number)
function givePhoneNumber(citizenId, newNumber)
    local playerCitizenId = citizenId
    if not Settings.PhoneCustomElse then
        local setNumberExecute = ""
        local setNumberExecute2 = ""
        if Settings.Phone == "qb-phone" then 
            if Settings.Framework == "qb" then
                setNumberExecute = string.format("UPDATE players SET charinfo = JSON_SET(charinfo, '$.phone', '%s') WHERE citizenid = '%s'", newNumber, playerCitizenId)
                setNumberExecute2 = "UPDATE phone_phones SET phone_number = '"..newNumber.."' WHERE id = '"..playerCitizenId.."'"
            else
                setNumberExecute = string.format("UPDATE users SET charinfo = JSON_SET(charinfo, '$.phone', '%s') WHERE citizenid = '%s'", newNumber, playerCitizenId)
            end
        elseif Settings.Phone == "gcphone" then
            if Settings.Framework == "qb" then
                setNumberExecute = "UPDATE players SET phone_number = '"..newNumber.."' WHERE citizenid = '"..playerCitizenId.."'"
            else
                setNumberExecute = "UPDATE users SET phone_number = '"..newNumber.."' WHERE citizenid = '"..playerCitizenId.."'"
            end
        elseif Settings.Phone == "gksphone" then
            local gksSettings = ExecuteSql("SELECT * FROM gksphone_settings WHERE citizenid = '"..playerCitizenId.."'")
            if Settings.Framework == "qb" then
                selectNumberExecute = "UPDATE players SET phone_number = '"..newNumber.."' WHERE citizenid = '"..playerCitizenId.."'"
            else
                selectNumberExecute = "UPDATE users SET phone_number = '"..newNumber.."' WHERE citizenid = '"..playerCitizenId.."'"
            end
        end
        local executed = ExecuteSql(setNumberExecute)
        if setNumberExecute2 ~= '' then
            local executed2 = ExecuteSql(setNumberExecute2)
        end
    else
        -- If you want to use custom else, you can use this function.
        -- You can use this function to give the phone number in your own database.
        -- You can use the phoneNumber as a parameter in the function.

        ExecuteSql("UPDATE users SET charinfo = '"..phoneNumber.."' WHERE citizenid = '"..getCitizenId(player).."'")
    end
end

-------------------------------------------------------------

function checkPlayerFromSql(citizenId)
    if Settings.Framework == "qb" then
        local playerCheck = ExecuteSql("SELECT * FROM players WHERE citizenid = '"..citizenId.."'")
        if playerCheck[1] ~= nil then
            return playerCheck[1]
        else
            return nil
        end
    else
        local playerCheck = ExecuteSql("SELECT * FROM users WHERE citizenid = '"..citizenId.."'")
        if playerCheck[1] ~= nil then
            return playerCheck[1]
        else
            return nil
        end
    end
end

-------------------------------------------------------------

function updatePlate(oldPlate, newPlate, jsonData)
    if Settings.Framework == "qb" then
        if jsonData then 
            local newVeri = json.decode(jsonData.mods)
            newVeri.plate = newPlate
            ExecuteSql("UPDATE player_vehicles SET mods = '"..json.encode(newVeri).."', plate = '"..newPlate.."' WHERE plate = '"..oldPlate.."'")
        else
            ExecuteSql("UPDATE player_vehicles SET plate = '"..newPlate.."' WHERE plate = '"..oldPlate.."'")
        end
    else
        if jsonData then 
            local newVeri = json.decode(jsonData.vehicle)
            newVeri.plate = newPlate
            ExecuteSql("UPDATE owned_vehicles SET vehicle = '"..json.encode(newVeri).."', plate = '"..newPlate.."' WHERE plate = '"..oldPlate.."'")
        else
            ExecuteSql("UPDATE owned_vehicles SET plate = '"..newPlate.."' WHERE plate = '"..oldPlate.."'")
        end
    end
end


-------------------------------------------------------------

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if Settings.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Settings.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif Settings.Mysql == "mysql-async" then   
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end
