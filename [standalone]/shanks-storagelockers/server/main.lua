local QBCore = exports['qb-core']:GetCoreObject()
Config = {
    Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
}

CreateThread(function()
    for lockerName, lockerData in pairs(Config.Lockers) do
        exports.ox_inventory:RegisterStash('locker_'..lockerName, "Locker", lockerData.slots, lockerData.capacity, nil)
    end
end)

QBCore.Functions.CreateCallback("shanks-storagelockers:server:FetchConfig", function(source, cb)
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    cb(Config.Lockers)
end)

QBCore.Functions.CreateCallback("shanks-storagelockers:server:purchaselocker", function(source, cb, v, k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenID = Player.PlayerData.citizenid
    local price = v.price
    local bankMoney = Player.PlayerData.money["bank"]
    if bankMoney >= price then
        Player.Functions.RemoveMoney('bank', price, "Locker Purchased")
        Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        Config.Lockers[k]['isOwned'] = true
        Config.Lockers[k]['owner'] = CitizenID 
        SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
        TriggerClientEvent('shanks-storagelockers:client:FetchConfig', -1)
        TriggerClientEvent('shanks-storagelockers:client:setupBlips', src)
        cb(bankMoney)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money..', 'error')
        cb(bankMoney)
    end
end)

QBCore.Functions.CreateCallback("shanks-storagelockers:server:getData", function(source, cb, locker, data)  --make this a fetch event for everything and then pass through what you wanna fetch
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    cb(Config.Lockers[locker][data])
end)

QBCore.Functions.CreateCallback('shanks-storagelockers:server:getOwnedLockers', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ownedLockers = {}
    if Player then
        Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        for k, v in pairs(Config.Lockers) do 
            if Player.PlayerData.citizenid == v["owner"] then
                table.insert(ownedLockers, k)
            end
        end
        if ownedLockers then
            cb(ownedLockers)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent('shanks-storagelockers:server:changePasscode')
AddEventHandler('shanks-storagelockers:server:changePasscode', function(newPasscode, lockername, lockertable)
    local src = source
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    Config.Lockers[lockername]['password'] = newPasscode
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('shanks-storagelockers:client:FetchConfig', -1)
    TriggerClientEvent('QBCore:Notify', src, 'Passcode Changed', 'success')
end)

RegisterNetEvent('shanks-storagelockers:server:sellLocker')
AddEventHandler('shanks-storagelockers:server:sellLocker', function(lockername, lockertable)
    --add extra checks to make sure they own the locker
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = lockertable.price
    local saleprice = price - ((tonumber(price)/100) * 10)
    Config.Lockers[lockername]['isOwned'] = false
    Config.Lockers[lockername]['owner'] = '' --will this work?
    Player.Functions.AddMoney('bank', saleprice, "Locker Sold")
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('QBCore:Notify', src, 'Locker sold for ' .. saleprice, 'success')
    TriggerClientEvent('shanks-storagelockers:client:setupBlips', src)
    TriggerClientEvent('shanks-storagelockers:client:FetchConfig', -1)
end)

RegisterNetEvent('shanks-storagelockers:server:createPassword')
AddEventHandler('shanks-storagelockers:server:createPassword', function(password, locker)
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    Config.Lockers[locker]['password'] = password
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('shanks-storagelockers:client:FetchConfig', -1)
end)

QBCore.Commands.Add("locker", "Create a locker at your current location", {{name = "name", help = "Locker name"}, {name = "price", help = "Locker Price"}, {name = "slots", help = "Slots - suggested 30"}, {name = "capactiy", help = "Capacity - suggested 5,000,000"} }, true, function(source, args)
    local coords = GetEntityCoords(GetPlayerPed(source))
    local Player = QBCore.Functions.GetPlayer(source)
    local name = args[1]
    local price = args[2]
    local slots = args[3]
    local capacity = args[4]
    local newlocker = {
        ["capacity"] = {},
        ["price"] = {},
        ["slots"] = {},
        ["coords"] = {}
    }
    newlocker["price"] = tonumber(price)
    newlocker["capacity"] = tonumber(capacity)
    newlocker["slots"] = tonumber(slots)
    newlocker["coords"] = {x = coords.x, y = coords.y, z = coords.z}
    local currentConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))

    if currentConfig[name] then
        TriggerClientEvent('QBCore:Notify', source, "There is already an existing locker with the same name!", "error")
        return
    end

    
    exports.ox_inventory:RegisterStash('locker_'..name, 'Locker', tonumber(slots), tonumber(capacity), false, false)

    currentConfig[name] = newlocker
    SaveResourceFile(GetCurrentResourceName(), "lockers.json", json.encode(currentConfig), -1)
    TriggerClientEvent('shanks-storagelockers:client:FetchConfig', -1)

    local logMsg = ('**__Admin__**\n**Name: **%s\n**Character Name: **%s\n**Citizen ID: **%s\n**License: **%s\n\n**__LOCKER__**\n**Name:** %s\n**Price:** %s\n**Slots:** %s\n**Capacity:** %s'):format(
        GetPlayerName(source),
        Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        Player.PlayerData.citizenid,
        QBCore.Functions.GetIdentifier(source, 'license'),
        name,
        tonumber(price),
        tonumber(slots),
        tonumber(capacity)
    )   
    TriggerEvent('qb-log:server:CreateLog', 'lockers', '🛅 /locker [CREATE COMMAND]', 'red', logMsg, false)
end, "god")

RegisterNetEvent('shanks-storage:lockerAttemptLog', function(lockerName, opened)
    local src = source
    local label = opened and "Yes, right password." or "Incorrect password, failed to login."
    local Player = QBCore.Functions.GetPlayer(src)
    local logMsg = ('**__PLAYER__**\n**Name:** %s\n**Character Name:** %s\n**Citizen ID:** %s\n**License:** %s\n\n**__LOCKER__**\n**Name:** %s\n**Status:** %s'):format(
        GetPlayerName(src), 
        Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        Player.PlayerData.citizenid,
        QBCore.Functions.GetIdentifier(src, 'license'),
        lockerName,
        label
    )
    if opened then
        TriggerEvent('qb-log:server:CreateLog', 'lockers', '🛅 Locker Open Attempt', 'green', logMsg, false)
    else
        TriggerEvent('qb-log:server:CreateLog', 'lockers', '🛅 Locker Open Attempt', 'red', logMsg, false)
    end
end)

RegisterNetEvent('shanks-storage:raidLocker', function(lockerName, opened)
    local src = source
    local label = opened and "Yes, stash raided." or "Failed to open stash, raid failed."
    local Player = QBCore.Functions.GetPlayer(src)
    local logMsg = ('**__PLAYER__**\n**Name:** %s\n**Character Name:** %s\n**Citizen ID:** %s\n**License:** %s\n\n**__LOCKER__**\n**Name:** %s\n**Status:** %s'):format(
        GetPlayerName(src), 
        Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        Player.PlayerData.citizenid,
        QBCore.Functions.GetIdentifier(src, 'license'),
        lockerName,
        label
    )

    TriggerEvent('qb-log:server:CreateLog', 'lockers', '🛅 Locker Raided by Police', 'blue', logMsg, false)
end)
