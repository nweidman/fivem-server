local machines = {}

-- CREATE DB TABLE IF NEEDED --
MySQL.ready(function()
    local query = [[
        CREATE TABLE IF NOT EXISTS moneywash (
            machine_name VARCHAR(100) NOT NULL PRIMARY KEY,
            queue TEXT NOT NULL DEFAULT '[]',
            current TEXT NOT NULL DEFAULT '{"amount":0,"timeRemaining":0}',
            completed TEXT NOT NULL DEFAULT '[]',
            totalProcessed DECIMAL(20,2) NOT NULL DEFAULT 0,
            lastUpdated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
    ]]

    MySQL.query(query, {}, function(result)
        -- print("[MoneyWash] player_moneywash table ensured.")
    end)
end)

-- CREATE any new machines that doesn't already exist --
MySQL.ready(function()
    for k, v in pairs(Config.Machines['Washing Machines']) do
        local machineName = "Money Wash #" .. k

        -- Check if this machine already exists
        MySQL.query('SELECT machine_name FROM moneywash WHERE machine_name = ?', {machineName}, function(result)
            if not result[1] then
                -- Machine does not exist, insert with default values
                MySQL.insert('INSERT INTO moneywash (machine_name, queue, current, completed, totalProcessed, lastUpdated) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)', {
                    machineName,
                    '[]',                                           -- queue
                    '{"amount":0,"timeRemaining":0}',              -- current
                    '[]',                                           -- completed
                    0                                              -- totalProcessed
                }, function(insertId)
                    -- print(("[MoneyWash] Inserted machine '%s' into DB with default values."):format(machineName))
                end)
            else
                -- print(("[MoneyWash] Machine '%s' already exists in DB."):format(machineName))
            end
        end)
    end
    for k, v in pairs(Config.Machines['Dryers']) do
        local machineName = "Dryer #" .. k

        -- Check if this machine already exists
        MySQL.query('SELECT machine_name FROM moneywash WHERE machine_name = ?', {machineName}, function(result)
            if not result[1] then
                -- Machine does not exist, insert with default values
                MySQL.insert('INSERT INTO moneywash (machine_name, queue, current, completed, totalProcessed, lastUpdated) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)', {
                    machineName,
                    '[]',                                           -- queue
                    '{"amount":0,"timeRemaining":0}',              -- current
                    '[]',                                           -- completed
                    0                                              -- totalProcessed
                }, function(insertId)
                    -- print(("[MoneyWash] Inserted machine '%s' into DB with default values."):format(machineName))
                end)
            else
                -- print(("[MoneyWash] Machine '%s' already exists in DB."):format(machineName))
            end
        end)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    MySQL.query('SELECT * FROM moneywash', {}, function(result)
        for _, row in ipairs(result) do
            local machineName = row.machine_name

            -- Parse JSON fields from DB
            local queue = row.queue and json.decode(row.queue) or {}
            local completed = row.completed and json.decode(row.completed) or {}
            local current = row.current and json.decode(row.current) or {amount = 0, timeRemaining = 0}

            -- Populate local machines table
            -- When loading from DB
            machines[machineName] = {
                queue = queue,
                completed = completed,
                currentBill = (current.amount and current.amount > 0) and current or nil,
                isRunning = false,
                remaining = current.timeRemaining or 0,
                timer = nil,
                totalProcessed = row.totalProcessed or 0
            }

            -- print(("[MoneyWash] Loaded machine '%s' from DB."):format(machineName))
        end
    end)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    for machineName, data in pairs(machines) do
        local queueJSON = json.encode(data.queue or {})
        local completedJSON = json.encode(data.completed or {})
        local currentJSON = json.encode({
            amount = data.currentBill and data.currentBill.amount or 0,
            timeRemaining = data.remaining or 0
        })
        local totalProcessed = data.totalProcessed or 0

        MySQL.update('UPDATE moneywash SET queue = ?, current = ?, completed = ?, totalProcessed = ?, lastUpdated = CURRENT_TIMESTAMP WHERE machine_name = ?', {
            queueJSON, currentJSON, completedJSON, totalProcessed, machineName
        })

        -- print(("[MoneyWash] Saved machine '%s' to DB."):format(machineName))
    end
end)

lib.callback.register('drool_moneywash:getMachineData', function(source, machineName)
    if not machines[machineName] then
        -- If somehow machine does not exist, return default values
        return ({
            queue = {},
            completed = {},
            currentBill = nil,
            isRunning = false,
            remaining = 0
        })
    end

    -- Return a copy of the machine state
    local machine = machines[machineName]
    return ({
        queue = machine.queue,
        completed = machine.completed,
        currentBill = machine.currentBill,
        isRunning = machine.isRunning,
        remaining = machine.remaining
    })
end)

RegisterNetEvent('drool_moneywash:server:updateMachine', function(data)
    local src = source
    local machineName = data.machineName
    local action = data.action
    local amount = data.amount

    if not machines[machineName] then return end

    local machine = machines[machineName]

    if action == 'add' then
        local bill = { 
            id = os.time() .. math.random(1000, 9999), -- simple unique ID
            amount = amount, 
            timeRemaining = data.duration,
            originalAmount = data.beforeAmount
        }

        if not machine.currentBill or (machine.currentBill.amount == 0) then
            machine.currentBill = bill
            machine.remaining = bill.timeRemaining
            machine.isRunning = false
        else
            table.insert(machine.queue, bill)
        end
        local Player = exports.qbx_core:GetPlayer(src)
        TriggerEvent('drool_moneywash:server:sendWebhook', 2, 4360181, "Put bill in machine", "**PLAYER**\n**Name: **"..Player.PlayerData.name.."\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**Citizen ID:** "..Player.PlayerData.citizenid.."\n**License: **"..Player.PlayerData.license.."\n\n**MONEY**\n**Amount:** $"..data.amount.."\n**Wash Time:** "..data.duration.." seconds\n**Machine Name:** "..machineName, os.date("%m-%d-%Y %H:%M:%S"))

    elseif action == 'start' then
    -- Start next bill if not already running
        if not machine.isRunning and (machine.currentBill or #machine.queue > 0) then
            if not machine.currentBill then
                local nextBill = table.remove(machine.queue, 1)
                machine.currentBill = nextBill
                machine.remaining = nextBill.timeRemaining
            end
            machine.isRunning = true

            machine.timer = CreateThread(function()
                while machine.isRunning do
                    if machine.remaining > 0 and machine.currentBill then
                        Wait(1000)
                        machine.remaining = machine.remaining - 1

                        -- broadcast live timer updates
                        TriggerClientEvent('drool_moneywash:client:syncMachine', -1, machineName, machine)
                    else
                        -- bill finished
                        if machine.currentBill then
                            table.insert(machine.completed, machine.currentBill)
                            machine.currentBill = nil
                            machine.remaining = 0
                        end

                        -- move next bill from queue automatically
                        if #machine.queue > 0 then
                            local nextBill = table.remove(machine.queue, 1)
                            machine.currentBill = nextBill
                            machine.remaining = nextBill.timeRemaining
                            -- keep running
                            TriggerClientEvent('drool_moneywash:client:syncMachine', -1, machineName, machine)
                        else
                            -- no more bills, stop machine
                            machine.isRunning = false
                            TriggerClientEvent('drool_moneywash:client:syncMachine', -1, machineName, machine)
                            break
                        end
                    end
                end
            end)
        end
    elseif action == 'stop' then
        if machine.isRunning then
            machine.isRunning = false
            -- The timer thread will exit automatically on next loop because isRunning is now false
            -- currentBill and remaining are already saved, so it will resume from this point
            TriggerClientEvent('drool_moneywash:client:syncMachine', -1, machineName, machine)
        end
    elseif action == 'remove' then
        table.remove(machine.queue, data.index)
    end

    local queueJSON = json.encode(machine.queue or {})
    local completedJSON = json.encode(machine.completed or {})
    local currentJSON = json.encode({
        amount = machine.currentBill and machine.currentBill.amount or 0,
        timeRemaining = machine.remaining or 0
    })
    local totalProcessed = machine.totalProcessed or 0
    MySQL.update('UPDATE moneywash SET queue = ?, current = ?, completed = ?, totalProcessed = ?, lastUpdated = CURRENT_TIMESTAMP WHERE machine_name = ?', {
            queueJSON, currentJSON, completedJSON, totalProcessed, machineName
    })
    -- Sync all clients
    TriggerClientEvent('drool_moneywash:client:syncMachine', -1, machineName, machine)
end)

RegisterNetEvent('drool_moneywash:server:removeUndoneBill', function(data)
    local src = source
    local machineName = data.machineName
    local amount = data.amount
    local Player = exports.qbx_core:GetPlayer(src)

    if not machines[machineName] then return end

    local machine = machines[machineName]

    for i, bill in ipairs(machine.queue) do
        if bill.amount == amount then
            local originalAmount = machine.queue[i].originalAmount
            table.remove(machine.queue, i)
            if machineName:find('Wash') then
                exports.ox_inventory:AddItem(src, Config.DirtyMoneyItem, 1, { worth = originalAmount })
            elseif machineName:find('Dryer') then
                exports.ox_inventory:AddItem(src, Config.WetMoneyItem, 1, { worth = amount })
            end
            TriggerEvent('drool_moneywash:server:sendWebhook', 1, 4360181, "Removed Unfinished Bill From Machine", "**PLAYER**\n**Name: **"..Player.PlayerData.name.."\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**Citizen ID:** "..Player.PlayerData.citizenid.."\n**License: **"..Player.PlayerData.license.."\n\n**MONEY**\n**Amount:** $"..amount.."\n**Machine Name:** "..machineName, os.date("%m-%d-%Y %H:%M:%S"))
            break
        end
    end

    local queueJSON = json.encode(machine.queue or {})
    local completedJSON = json.encode(machine.completed or {})
    local currentJSON = json.encode({
        amount = machine.currentBill and machine.currentBill.amount or 0,
        timeRemaining = machine.remaining or 0
    })
    local totalProcessed = machine.totalProcessed or 0
    MySQL.update('UPDATE moneywash SET queue = ?, current = ?, completed = ?, totalProcessed = ?, lastUpdated = CURRENT_TIMESTAMP WHERE machine_name = ?', {
            queueJSON, currentJSON, completedJSON, totalProcessed, machineName
    })
    -- Sync all clients
    TriggerClientEvent('drool_moneywash:client:syncMachine', -1, machineName, machine)
end)



RegisterNetEvent('drool_moneywash:server:removeBill', function(data)
    local src = source
    exports.ox_inventory:RemoveItem(src, Config.DirtyMoneyItem, 1, { worth = data.worth })
end)

RegisterNetEvent('drool_moneywash:server:removeWetBill', function(data)
    local src = source
    exports.ox_inventory:RemoveItem(src, Config.WetMoneyItem, 1, { worth = data.worth })
end)


RegisterNetEvent('drool_moneywash:server:collectWetBill', function(data)
    local src = source
    local machine = machines[data.machineName]
    if not machine then return end
    local Player = exports.qbx_core:GetPlayer(src)
    -- find a completed bill with that amount
    for i, bill in ipairs(machine.completed) do
        if bill.amount == data.worth then
            table.remove(machine.completed, i)
            exports.ox_inventory:AddItem(src, Config.WetMoneyItem, 1, { worth = bill.amount })
            TriggerEvent('drool_moneywash:server:sendWebhook', 1, 4360181, "Grabbed Wet Money", "**PLAYER**\n**Name: **"..Player.PlayerData.name.."\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**Citizen ID:** "..Player.PlayerData.citizenid.."\n**License: **"..Player.PlayerData.license.."\n\n**MONEY**\n**Amount:** $"..bill.amount.."\n**Machine Name:** "..data.machineName, os.date("%m-%d-%Y %H:%M:%S"))
            break
        end
    end
    exports['drool_skills']:addXP(src, 1)

    local queueJSON = json.encode(machine.queue or {})
    local completedJSON = json.encode(machine.completed or {})
    local currentJSON = json.encode({
        amount = machine.currentBill and machine.currentBill.amount or 0,
        timeRemaining = machine.remaining or 0
    })
    local totalProcessed = machine.totalProcessed or 0
    MySQL.update('UPDATE moneywash SET queue = ?, current = ?, completed = ?, totalProcessed = ?, lastUpdated = CURRENT_TIMESTAMP WHERE machine_name = ?', {
            queueJSON, currentJSON, completedJSON, totalProcessed, data.machineName
    })

    -- sync all clients
    TriggerClientEvent('drool_moneywash:client:syncMachine', -1, data.machineName, machine)
end)

RegisterNetEvent('drool_moneywash:server:collectDryBill', function(data)
    local src = source
    local machine = machines[data.machineName]
    local Player = exports.qbx_core:GetPlayer(src)
    if not machine then return end

    local MoneyWashExperience = Player.PlayerData.metadata.moneywashrep
	
    -- find a completed bill with that amount
    for i, bill in ipairs(machine.completed) do
        if bill.amount == data.worth then
            table.remove(machine.completed, i)
            Player.Functions.AddMoney('cash', bill.amount)
            local machineNumber = tonumber(data.machineName:match("(%d+)"))
            if not (Config.Machines['Dryers'][machineNumber] and Config.Machines['Dryers'][machineNumber].gang) then
                local addXP = math.max(math.floor(bill.amount*0.00001),1)
                if bill.amount < 10000 then
                    addXP = 0
                end
                Player.Functions.SetMetaData('moneywashrep', (MoneyWashExperience + addXP))
            end
            TriggerEvent('drool_moneywash:server:sendWebhook', 2, 4360181, "Grabbed Dry Money", "**PLAYER**\n**Name: **"..Player.PlayerData.name.."\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**Citizen ID:** "..Player.PlayerData.citizenid.."\n**License: **"..Player.PlayerData.license.."\n\n**MONEY**\n**Amount:** $"..bill.amount.."\n**Machine Name:** "..data.machineName.."\n**Experience Gain:** "..math.max(math.floor(bill.amount*0.00001),1).."", os.date("%m-%d-%Y %H:%M:%S"))
            break
        end
    end
    exports['drool_skills']:addXP(src, 1)

    local queueJSON = json.encode(machine.queue or {})
    local completedJSON = json.encode(machine.completed or {})
    local currentJSON = json.encode({
        amount = machine.currentBill and machine.currentBill.amount or 0,
        timeRemaining = machine.remaining or 0
    })
    local totalProcessed = machine.totalProcessed or 0
    MySQL.update('UPDATE moneywash SET queue = ?, current = ?, completed = ?, totalProcessed = ?, lastUpdated = CURRENT_TIMESTAMP WHERE machine_name = ?', {
            queueJSON, currentJSON, completedJSON, totalProcessed, data.machineName
    })

    -- sync all clients
    TriggerClientEvent('drool_moneywash:client:syncMachine', -1, data.machineName, machine)
end)


