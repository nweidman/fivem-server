QBCore = GetResourceState('qb-core') == 'started' and true or false
tryQBox = GetResourceState('qbx_core') == 'started' and true or false

if not QBCore then return end
if tryQBox then return end 

Framework = exports['qb-core']:GetCoreObject()

if ServerConfig.EnableQBgangsIntegrations then
    RegisterNetEvent('QBCore:Server:OnGangUpdate', function(id, data)
        local Player = Framework.Functions.GetPlayer(tonumber(id))
        if Player then
            Player.Functions.SetGang(tostring(data.name), tonumber(data.grade.level))
        else
            print('[ERROR] Unable to update player gang. Specified player is offline:', id)
        end
    end)
end

Fr.usersTable = "players"
Fr.identificatorTable = "citizenid"
Fr.Table = 'player_vehicles'
Fr.VehProps = 'mods'
Fr.OwnerTable = "citizenid"
Fr.StoredTable = 'state'
Fr.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'
Fr.IsPlayerDead = function(source)
    local Player = Fr.getPlayerFromId(source)
    local isLastStand = Player.PlayerData.metadata["inlaststand"]
    local isDead = Player.PlayerData.metadata["isdead"]
    if isDead and isLastStand then
        return true
    else
        return false
    end
end

Fr.VehiclePurchased = function(model, jobId, plate, mods)
    local readyModel = joaat(model)
    local insertQuery = [[
        INSERT INTO `player_vehicles`
        (`license`, `vehicle`, `hash`, `citizenid`, `plate`, `mods`, `gang`, `configName`)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ]]

    local params
    if not mods then
        params = {
            nil, model, readyModel, nil, plate,
            json.encode({model = readyModel, plate = plate}),
            jobId, model
        }
    else
        params = {
            nil, model, readyModel, nil, plate,
            mods, jobId, model
        }
    end

    if Config.GarageScript == 'jg-advancedgarages' then 
        insertQuery = [[
            INSERT INTO `player_vehicles`
            (`license`, `vehicle`, `hash`, `citizenid`, `plate`, `mods`, `gang`, `configName`, `gang_vehicle`, `gang_vehicle_rank`)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ]]

        params[4] = "gang_" .. jobId
        params[9] = 1
        params[10] = 1
    end

    MySQL.Async.insert(insertQuery, params, function(insertId)
        if not insertId then
            print(("[^1ERROR^7] Vehicle insert failed for plate %s"):format(plate))
        else
            local insertInfo = ("[^2INFO^7] Vehicle inserted with ID: %s, plate: %s"):format(insertId, plate)
            if mods then 
                print(insertInfo)
            else
                debugPrint(insertInfo)
            end
        end
    end)
end

Fr.UpdateVehicleState = function(plate, state, networkId)
    MySQL.Async.execute('UPDATE `'.. Fr.Table ..'` SET `'.. Fr.StoredTable ..'` = @state, vehicleid = @networkid WHERE plate = @plate',
    {['@plate'] = plate, ['@networkid'] = networkId, ['@state'] = state})
end

Fr.IsPlateTaken = function(plate)
    local p = promise.new()
    
    MySQL.scalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate},
    function(result)
        p:resolve(result ~= nil)
    end)

    return Citizen.Await(p)
end

Fr.RegisterServerCallback = function(...)
    return Framework.Functions.CreateCallback(...)
end
Fr.GetPlayerFromIdentifier = function(identifier)
    return Framework.Functions.GetPlayerByCitizenId(identifier)
end
Fr.getPlayerFromId = function(...)
    return Framework.Functions.GetPlayer(...)
end
Fr.GetMoney = function(Player, account)
    if account == "money" then account = "cash" end
    return Player.PlayerData.money[account]
end
Fr.GetDirtyMoney = function(Player)
    local blackMoney = Player.Functions.GetItemByName(Config.DirtyMoney.itemName)
    return blackMoney and blackMoney.amount or 0
end
Fr.ManageMoney = function(Player, account, action, amount)
    if account == "money" then account = "cash" end
    if action == "add" then
        return Player.Functions.AddMoney(account, amount)
    else
        return Player.Functions.RemoveMoney(account, amount)
    end
end
Fr.ManageDirtyMoney = function(Player, action, amount)
    if action == "add" then
        return Player.Functions.AddItem(Config.DirtyMoney.itemName, amount)
    else
        return Player.Functions.RemoveItem(Config.DirtyMoney.itemName, amount)
    end
end
Fr.GetIndentifier = function(source)
    local xPlayer = Fr.getPlayerFromId(source)
    if not xPlayer then return nil end
    return xPlayer.PlayerData.citizenid
end
Fr.GetPlayerName = function(sourceOrIdentifier)
    local xPlayer = Fr.getPlayerFromId(sourceOrIdentifier)
    local name

    if xPlayer then
        name = xPlayer.PlayerData.charinfo.firstname .." ".. xPlayer.PlayerData.charinfo.lastname
    else
        local result = MySQL.Sync.fetchAll(
            "SELECT charinfo FROM players WHERE citizenid = @citizenid",
            {['@citizenid'] = trim(sourceOrIdentifier)}
        )
        if result and result[1] then
            result[1].charinfo = json.decode(result[1].charinfo)
            name = result[1].charinfo.firstname .. " " .. result[1].charinfo.lastname
        else
            name = "Unknown"
        end
    end

    return name
end
Fr.GetGroup = function(source)
    return Framework.Functions.GetPermission(source)
end
Fr.addItem = function(xPlayer, itemname, quantity, metadata)
    quantity = tonumber(quantity) or 0
    itemname = tostring(itemname)

    if quantity <= 0 then
        quantity = 1
    end

    return xPlayer.Functions.AddItem(itemname, quantity)
end
Fr.removeItem = function(xPlayer, itemname, quantity)
    quantity = tonumber(quantity) or 0
    itemname = tostring(itemname)

    if quantity <= 0 then
        quantity = 1
    end

    return xPlayer.Functions.RemoveItem(itemname, quantity)
end
Fr.getItem = function(xPlayer, itemname)
    local item = xPlayer.Functions.GetItemByName(itemname)
    local table
    if item then
        table = {amount = item.amount, name = itemname, weight = item.weight, label = item.label}
    else 
        table = {amount = 0, name = itemname, weight = 0, label = ""}
    end
    return table
end
Fr.getInventory = function(xPlayer)
    return xPlayer.PlayerData.items
end
Fr.getItemInfo = function(itemName) 
    return Framework.Shared.Items[itemName]
end
Fr.RegisterItem = function(itemName, itemEvent)
    Framework.Functions.CreateUseableItem(itemName, function(source, item)
        local Player = Fr.getPlayerFromId(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        TriggerClientEvent('op-crime:'.. itemEvent, Fr.GetSourceFromPlayerObject(Player))
    end)
end
Fr.GetSourceFromPlayerObject = function(xPlayer)
    if xPlayer then
        return xPlayer.PlayerData.source
    else
        return nil
    end
end
Fr.GetPlayerJob = function(xPlayer)
    local job = {
        name = xPlayer.PlayerData.job.name,
        grade = xPlayer.PlayerData.job.grade.level
    }
    return job
end
Fr.AddMoneyToOfflineUser = function(identifier, amount, typeMoney)
    if typeMoney == "money" then
       local result = MySQL.Sync.fetchAll(
            "SELECT money FROM players WHERE citizenid = @citizenid",
            {['@citizenid'] = trim(identifier)}
        )
        if result and result[1] then
            local moneyObject = json.encode(result[1].money)
            moneyObject.bank = amount + moneyObject.bank
            MySQL.Async.execute("UPDATE `players` SET `money` = @newMoney WHERE `citizenid` = @citizenid", {
                ['@newMoney'] = json.decode(moneyObject),
                ['@citizenid'] = trim(identifier)
            })
        end
    elseif typeMoney == "blackmoney" then 
        local result = MySQL.Sync.fetchAll(
            "SELECT inventory FROM players WHERE citizenid = @identifier",
            {
                ['@citizenid'] = trim(identifier)
            }
        )

        if result and result[1] then
            local inventoryObject = result[1].inventory

            if type(inventoryObject) == "string" then
                inventoryObject = json.decode(inventoryObject)
            end

            if not inventoryObject then
                inventoryObject = {}
            end

            local usedSlots = {}
            local freeSlot = 1

            for _, item in pairs(inventoryObject) do
                if item.slot then
                    usedSlots[item.slot] = true
                end
            end

            while usedSlots[freeSlot] do
                freeSlot = freeSlot + 1
            end

            table.insert(inventoryObject, {
                slot = freeSlot,
                name = Config.DirtyMoney.itemName,
                type = "item",
                amount = amount,
                info = {},
                metadata = {}
            })

            MySQL.Async.execute(
                "UPDATE players SET inventory = @newInventory WHERE citizenid = @identifier",
                {
                    ['@newInventory'] = json.encode(inventoryObject),
                    ['@citizenid'] = trim(identifier)
                }
            )
        end
    end
end