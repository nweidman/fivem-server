local QBCore = nil
if GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
end

local function isQbox()
    return GetResourceState('qbx_core') == 'started'
end

local Heist = {
    active = false,
    firstPower = false,
    secondPower = false,
    firstSwipe = false,
    firstLaptop = false,
    printerExamined = false,
    thirdPower = false,
    mainDoorUnlocked = false,
    spawnedMainPeds = false,
    backupCalled = false,
    firstComputer = false,
    secondComputer = false,
    secretDoorOpen = false,
    finalComplete = false,
    finalComputerFailCount = 0,
    finalComputerLocked = false,
    employeeNames = {},
    rightEmployee = nil,
    employeePin = nil,
    employeeAuthenticated = false,
    securityCodes = {},
    drops = {},
    mainPeds = {},
    searchablePeds = {},
    backupVehicles = {},
    backupPeds = {}
}

local function debugPrint(...)
    print('[storm-merryweatherrobbery]', ...)
end

local function notify(src, msg, ntype)
    ntype = ntype or 'primary'

    if isQbox() then
        exports.qbx_core:Notify(src, msg, ntype)
        return
    end

    if QBCore then
        TriggerClientEvent('QBCore:Notify', src, msg, ntype)
        return
    end

    TriggerClientEvent('ox_lib:notify', src, {
        description = msg,
        type = ntype,
        position = 'center-right'
    })
end

local function getPlayer(src)
    if isQbox() then
        return exports.qbx_core:GetPlayer(src)
    end

    if not QBCore then return nil end
    return QBCore.Functions.GetPlayer(src)
end

local function hasItem(src, item, amount)
    amount = amount or 1

    if GetResourceState('ox_inventory') == 'started' then
        local count = exports.ox_inventory:GetItemCount(src, item)
        return (count or 0) >= amount
    end

    local player = getPlayer(src)
    if not player then return false end

    if player.Functions and player.Functions.GetItemByName then
        local itemData = player.Functions.GetItemByName(item)
        return itemData and (itemData.amount or 0) >= amount or false
    end

    return false
end

local function removeItem(src, item, amount)
    amount = amount or 1

    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:RemoveItem(src, item, amount)
    end

    local player = getPlayer(src)
    if not player then return false end

    if player.Functions and player.Functions.RemoveItem then
        return player.Functions.RemoveItem(item, amount)
    end

    if player.RemoveItem then
        return player.RemoveItem(item, amount)
    end

    return false
end

local heistCooldownEndsAt = 0

local function getCooldownMinutesRemaining()
    local now = os.time()
    if heistCooldownEndsAt <= now then return 0 end
    return math.ceil((heistCooldownEndsAt - now) / 60)
end

local function isHeistOnCooldown()
    return getCooldownMinutesRemaining() > 0
end

local function startHeistCooldown()
    local minutes = ((Config.Variables or {}).HeistCooldown or 0)
    minutes = tonumber(minutes) or 0

    if minutes <= 0 then
        heistCooldownEndsAt = 0
        return
    end

    heistCooldownEndsAt = os.time() + math.floor(minutes * 60)
    debugPrint(('Heist cooldown started for %s minutes.'):format(minutes))
end

local function formatCooldown(seconds)
    seconds = math.max(0, tonumber(seconds) or 0)
    local minutes = math.floor(seconds / 60)
    local secs = seconds % 60

    if minutes > 0 then
        return ('%sm %ss'):format(minutes, secs)
    end

    return ('%ss'):format(secs)
end

local DoorStates = {
    firstSwipeDoorLeft = true,
    firstSwipeDoorRight = true,
    mainDoor = true,
    secretDoorLeft = true,
    secretDoorRight = true,
}

local function SetDoorLocked(doorKey, locked, target)
    local doorData = Config.Doors and Config.Doors[doorKey]
    if not doorData or not doorData.coords or not doorData.model then
        return false
    end

    DoorStates[doorKey] = locked
    TriggerClientEvent('storm-merryweather:client:setDoorLocked', target or -1, doorKey, doorData, locked)
    return true
end

local function getDoorKeys()
    local keys = {}
    local cfg = Config.Doors or {}

    if cfg.firstSwipeDoorLeft then keys[#keys + 1] = 'firstSwipeDoorLeft' end
    if cfg.firstSwipeDoorRight then keys[#keys + 1] = 'firstSwipeDoorRight' end
    if cfg.mainDoor then keys[#keys + 1] = 'mainDoor' end
    if cfg.secretDoorLeft then keys[#keys + 1] = 'secretDoorLeft' end
    if cfg.secretDoorRight then keys[#keys + 1] = 'secretDoorRight' end

    return keys
end

local function applyDefaultDoorStates(target)
    for _, doorKey in ipairs(getDoorKeys()) do
        SetDoorLocked(doorKey, true, target)
    end
end

local function syncDoorStatesToPlayer(src)
    for doorKey, locked in pairs(DoorStates) do
        local doorData = Config.Doors and Config.Doors[doorKey]
        if doorData then
            TriggerClientEvent('storm-merryweather:client:setDoorLocked', src, doorKey, doorData, locked)
        end
    end
end

local function syncDoorStatesToAllPlayers()
    for _, src in ipairs(GetPlayers()) do
        syncDoorStatesToPlayer(tonumber(src))
    end
end

RegisterNetEvent('storm-merryweather:server:requestDoorSync', function()
    syncDoorStatesToPlayer(source)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    CreateThread(function()
        Wait(2000)
        applyDefaultDoorStates()
        Wait(1000)
        syncDoorStatesToAllPlayers()
    end)
end)

AddEventHandler('playerJoining', function()
    local src = source
    CreateThread(function()
        Wait(3000)
        syncDoorStatesToPlayer(src)
    end)
end)

local function getCopCount()
    local count = 0

    if isQbox() then
        local jobs = { police = true }
        local players = exports.qbx_core:GetQBPlayers()
        for _, player in pairs(players) do
            local pdata = player.PlayerData
            if pdata and pdata.job and jobs[pdata.job.name] and pdata.job.onduty then
                count += 1
            end
        end
        return count
    end

    if QBCore then
        local players = QBCore.Functions.GetQBPlayers()
        for _, player in pairs(players) do
            local pdata = player.PlayerData
            if pdata and pdata.job and (pdata.job.name == 'police') and pdata.job.onduty then
                count += 1
            end
        end
    end

    return count
end

local function pickUniqueNames(amount)
    local pool = {}
    for i = 1, #Config.Names do
        pool[i] = Config.Names[i]
    end

    local chosen = {}
    for _ = 1, math.min(amount, #pool) do
        local index = math.random(1, #pool)
        chosen[#chosen + 1] = table.remove(pool, index)
    end

    return chosen
end

local function resolveConfiguredDrop(containerNetId)
    local entity = NetworkGetEntityFromNetworkId(containerNetId)
    if entity and entity ~= 0 and DoesEntityExist(entity) then
        local entCoords = GetEntityCoords(entity)
        local closestDrop = nil
        local closestDist = math.huge

        for _, drop in ipairs(Config.Drops) do
            local dx = entCoords.x - drop.coords.x
            local dy = entCoords.y - drop.coords.y
            local dz = entCoords.z - (drop.coords.z - 1.0)
            local dist = (dx * dx) + (dy * dy) + (dz * dz)
            if dist < closestDist then
                closestDist = dist
                closestDrop = drop
            end
        end

        if closestDrop then
            return closestDrop
        end
    end

    return Config.Drops[math.random(1, #Config.Drops)]
end

local function resetHeistState()
    applyDefaultDoorStates()
    syncDoorStatesToAllPlayers()

    Heist.active = false
    Heist.firstPower = false
    Heist.secondPower = false
    Heist.firstSwipe = false
    Heist.firstLaptop = false
    Heist.printerExamined = false
    Heist.thirdPower = false
    Heist.mainDoorUnlocked = false
    Heist.spawnedMainPeds = false
    Heist.backupCalled = false
    Heist.firstComputer = false
    Heist.secondComputer = false
    Heist.secretDoorOpen = false
    Heist.finalComplete = false
    Heist.resetting = false
    Heist.finalComputerFailCount = 0
    Heist.finalComputerLocked = false
    Heist.employeeNames = pickUniqueNames(4)
    Heist.rightEmployee = Heist.employeeNames[math.random(1, #Heist.employeeNames)]
    Heist.employeePin = math.random(1111, 9999)
    Heist.employeeAuthenticated = false
    Heist.securityCodes = { math.random(1000, 9999) }
    Heist.drops = {}

    if Heist.mainPeds then
        for i = #Heist.mainPeds, 1, -1 do
            local netId = Heist.mainPeds[i]
            local ped = NetworkGetEntityFromNetworkId(netId)
            if ped and ped ~= 0 and DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
            Heist.mainPeds[i] = nil
        end
    else
        Heist.mainPeds = {}
    end

    Heist.searchablePeds = {}

    if Heist.backupVehicles then
        for i = #Heist.backupVehicles, 1, -1 do
            local netId = Heist.backupVehicles[i]
            local veh = NetworkGetEntityFromNetworkId(netId)
            if veh and veh ~= 0 and DoesEntityExist(veh) then
                DeleteEntity(veh)
            end
            Heist.backupVehicles[i] = nil
        end
    else
        Heist.backupVehicles = {}
    end

    if Heist.backupPeds then
        for i = #Heist.backupPeds, 1, -1 do
            local netId = Heist.backupPeds[i]
            local ped = NetworkGetEntityFromNetworkId(netId)
            if ped and ped ~= 0 and DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
            Heist.backupPeds[i] = nil
        end
    else
        Heist.backupPeds = {}
    end
end

local function ensureHeistInitialized()
    if not Heist.rightEmployee or #Heist.employeeNames == 0 then
        resetHeistState()
    end
end

resetHeistState()

local function canStartHeist(src)
    if Heist.finalComputerLocked then
        notify(src, 'The facility is in lockdown.', 'error')
        return false
    end

    if isHeistOnCooldown() then
        notify(src, ('Heist is cooling down. Time remaining: %s minute(s)'):format(getCooldownMinutesRemaining()), 'error')
        return false
    end

    if getCopCount() < (Config.Variables.copCount or 8) then
        notify(src, ('Not enough cops on duty. Need %s.'):format(Config.Variables.copCount or 0), 'error')
        return false
    end

    return true
end

local function addItem(src, item, amount, metadata)
    amount = amount or 1
    metadata = metadata or nil

    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:AddItem(src, item, amount, metadata)
    end

    local player = getPlayer(src)
    if not player then return false end

    if player.Functions and player.Functions.AddItem then
        return player.Functions.AddItem(item, amount, false, metadata)
    end

    if player.AddItem then
        return player.AddItem(item, amount, false, metadata)
    end

    return false
end

local function giveMarkedMoney(src)
    local itemName = Config.Loot.MarkedMoney.item or 'markedbills'
    local worth = math.random(
        Config.Loot.MarkedMoney.min,
        Config.Loot.MarkedMoney.max
    )

    local Player = getPlayer(src)
    local HeistLevel = 0

    if Player and Player.PlayerData and Player.PlayerData.metadata and Player.PlayerData.metadata.skills and
        Player.PlayerData.metadata.skills.levels and Player.PlayerData.metadata.skills.levels.heists then
        HeistLevel = Player.PlayerData.metadata.skills.levels.heists.tier or 0
    end

    if HeistLevel == 1 then
        worth = math.floor(worth * 1.02)
        notify(src, 'You received an extra 2% to your marked money from your heist skills.', 'success')
    elseif HeistLevel == 2 then
        worth = math.floor(worth * 1.03)
        notify(src, 'You received an extra 3% to your marked money from your heist skills.', 'success')
    elseif HeistLevel == 3 then
        worth = math.floor(worth * 1.05)
        notify(src, 'You received an extra 5% to your marked money from your heist skills.', 'success')
    elseif HeistLevel == 4 then
        worth = math.floor(worth * 1.08)
        notify(src, 'You received an extra 8% to your marked money from your heist skills.', 'success')
    elseif HeistLevel == 5 then
        worth = math.floor(worth * 1.10)
        notify(src, 'You received an extra 10% to your marked money from your heist skills.', 'success')
    end

    return addItem(src, itemName, 1, {
        worth = worth,
    })
end

local function getWeightedLootIndex(lootPool)
    local totalChance = 0

    for i = 1, #lootPool do
        totalChance = totalChance + (tonumber(lootPool[i].chance) or 0)
    end

    if totalChance <= 0 then
        return nil
    end

    local roll = math.random(1, totalChance)
    local current = 0

    for i = 1, #lootPool do
        current = current + (tonumber(lootPool[i].chance) or 0)
        if roll <= current then
            return i
        end
    end

    return nil
end

local function AddLootPoolRewards(src)
    local lootPool = Config.Loot.LootPool
    if not lootPool or #lootPool == 0 then
        return false
    end

    local minDrops = tonumber(Config.Loot.MinLootDrops) or 1
    local maxDrops = tonumber(Config.Loot.MaxLootDrops) or minDrops

    minDrops = math.max(1, minDrops)
    maxDrops = math.max(minDrops, maxDrops)

    local maxPossibleDrops = math.min(maxDrops, #lootPool)
    local minPossibleDrops = math.min(minDrops, maxPossibleDrops)
    local amountOfDrops = math.random(minPossibleDrops, maxPossibleDrops)

    local availableLoot = {}
    for i = 1, #lootPool do
        availableLoot[#availableLoot + 1] = lootPool[i]
    end

    local gaveAnyLoot = false

    for _ = 1, amountOfDrops do
        if #availableLoot == 0 then break end

        local selectedIndex = getWeightedLootIndex(availableLoot)
        if not selectedIndex then break end

        local lootData = availableLoot[selectedIndex]
        table.remove(availableLoot, selectedIndex)

        local minAmount = tonumber(lootData.min) or 1
        local maxAmount = tonumber(lootData.max) or minAmount
        local amount = math.random(minAmount, maxAmount)

        local success = addItem(src, lootData.item, amount)
        if success then
            gaveAnyLoot = true
        end
    end

    return gaveAnyLoot
end

local function initiateLockdown()
    if Heist.finalComputerLocked then return end

    Heist.finalComputerLocked = true

    CreateThread(function()
        Wait((tonumber(Config.Variables.LockdownDelay) or 5) * 60000)
        resetHeistState()
        startHeistCooldown()
    end)
end

RegisterNetEvent('storm-merryweather:startPower', function(power)
    local src = source
    ensureHeistInitialized()

    if power ~= 'firstPower' and power ~= 'secondPower' then return end

    if not canStartHeist(src) then return end

    if power == 'firstPower' and Heist.firstPower then
        return notify(src, "Doesn't this look blown up enough?", 'inform')
    end

    if power == 'secondPower' and Heist.secondPower then
        return notify(src, "Doesn't this look blown up enough?", 'inform')
    end

    if not hasItem(src, Config.RequiredItems.explosive, 1) then
        return notify(src, ('You need %s.'):format(Config.RequiredItems.explosive), 'error')
    end

    Heist.active = true

    TriggerClientEvent('storm-merryweather:blowPowerMinigame', src, power)
end)

RegisterNetEvent('storm-merryweather:successfulPower', function(power)
    local src = source

    if power ~= 'firstPower' and power ~= 'secondPower' then return end

    if not removeItem(src, Config.RequiredItems.explosive, 1) then
        return notify(src, ('Missing %s.'):format(Config.RequiredItems.explosive), 'error')
    end

    if power == 'firstPower' then
        Heist.firstPower = true
    else
        Heist.secondPower = true
    end

    notify(src, 'Power disabled.', 'success')

    if power == 'secondPower' then
        TriggerClientEvent('storm-merryweather:dispatchAlert', src)
        notify(src, 'Police Have Been Notified', 'inform')
    end
end)

RegisterNetEvent('storm-merryweather:firstSwipe', function()
    local src = source

    if not Heist.firstPower or not Heist.secondPower then
        return notify(src, 'You need to disable both power boxes first.', 'error')
    end

    if Heist.firstSwipe then
        return notify(src, 'This door has already been swiped.', 'error')
    end

    if not hasItem(src, Config.RequiredItems.keycard, 1) then
        return notify(src, ('You need %s.'):format(Config.RequiredItems.keycard), 'error')
    end

    TriggerClientEvent('storm-merryweather:firstSwipe', src)
end)

RegisterNetEvent('storm-merryweather:successfulSwipe', function(swipe)
    local src = source
    if swipe ~= 'firstSwipe' then return end

    if Heist.firstSwipe then
        return notify(src, 'Access has already been granted.', 'inform')
    end

    if not removeItem(src, Config.RequiredItems.keycard, 1) then
        return notify(src, ('Missing %s.'):format(Config.RequiredItems.keycard), 'error')
    end

    Heist.firstSwipe = true
    SetDoorLocked('firstSwipeDoorLeft', false)
    SetDoorLocked('firstSwipeDoorRight', false)
    notify(src, 'Door has been unlocked.', 'inform')
end)

RegisterNetEvent('storm-merryweather:startFirstLaptop', function()
    local src = source

    if not Heist.firstSwipe then
        return notify(src, 'Did you phase through the door?', 'error')
    end

    if Heist.firstLaptop then
        return notify(src, 'The laptop has already been hacked.', 'error')
    end

    if not hasItem(src, Config.RequiredItems.usbdrive, 1) then
        return notify(src, ('You need %s.'):format(Config.RequiredItems.usbdrive), 'error')
    end

    TriggerClientEvent('storm-merryweather:hackLaptop', src)
end)

RegisterNetEvent('storm-merryweather:successfulFirstLaptop', function()
    local src = source

    if Heist.firstLaptop then
        return notify(src, 'The laptop has already been hacked.', 'error')
    end

    Heist.firstLaptop = true
    notify(src, 'The printer has started. Check the printer.', 'inform')
end)

RegisterNetEvent('storm-merryweather:examinePrinter', function()
    local src = source
    ensureHeistInitialized()

    if not Heist.firstLaptop then
        return notify(src, "Papers Don't Print Themselves.", 'error')
    end

    if Heist.printerExamined then
        TriggerClientEvent('storm-merryweather:showPrinterClue', src, {
            employee = Heist.rightEmployee,
            pin = Heist.employeePin,
        })
        return
    end

    Heist.printerExamined = true

    TriggerClientEvent('storm-merryweather:showPrinterClue', src, {
        employee = Heist.rightEmployee,
        pin = Heist.employeePin,
    })

    notify(src, 'The printer has finished printing employee credentials.', 'inform')
end)

RegisterNetEvent('storm-merryweather:thirdPower', function()
    local src = source

    if not Heist.printerExamined then
        return notify(src, "I told you to look at the printer, why did't you", 'error')
    end

    if Heist.thirdPower then
        return notify(src, "Doesn't this look blown up enough?", 'error')
    end

    if not hasItem(src, Config.RequiredItems.explosive, 1) then
        return notify(src, ('You need %s.'):format(Config.RequiredItems.explosive), 'error')
    end

    TriggerClientEvent('storm-merryweather:thirdPower', src)
end)

RegisterNetEvent('storm-merryweather:unlockMainDoor', function()
    local src = source

    if Heist.thirdPower then
        return notify(src, 'The main door has already been unlocked.', 'inform')
    end

    if not removeItem(src, Config.RequiredItems.explosive, 1) then
        return notify(src, ('Missing %s.'):format(Config.RequiredItems.explosive), 'error')
    end

    Heist.thirdPower = true
    Heist.mainDoorUnlocked = true

    if not Heist.spawnedMainPeds then
        Heist.spawnedMainPeds = true
        TriggerClientEvent('storm-merryweather:spawnMainPeds', src)
        notify(src, 'Guards Are Back From Lunch. Stay Alert!', 'inform')
    end

    SetDoorLocked('mainDoor', false)
    notify(src, 'Employee Lounge Has Been Unlocked.', 'informed')
end)

RegisterNetEvent('storm-merryweather:mainComputers', function(computer)
    local src = source

    if computer ~= 'firstComputer' and computer ~= 'secondComputer' then
        return
    end

    if not hasItem(src, Config.RequiredItems.hackdevice, 1) then
        return notify(src, ('You need %s.'):format(Config.RequiredItems.hackdevice), 'error')
    end

    if (computer == 'firstComputer' and Heist.firstComputer) or
        (computer == 'secondComputer' and Heist.secondComputer) then
        return notify(src, 'This terminal has already been decrypted.', 'error')
    end

    if not Heist.spawnedMainPeds then
        Heist.spawnedMainPeds = true
    end

    if not Heist.backupCalled then
        Heist.backupCalled = true
        TriggerClientEvent('storm-merryweather:callInTheBackup', -1)
        notify(src, 'Reinforcements Are On The Way! Take Cover!', 'inform')
    end

    TriggerClientEvent('storm-merryweather:mainComputers', src, computer)
end)

RegisterNetEvent('storm-merryweather:successfulComputer', function(computer)
    local src = source

    if computer ~= 'firstComputer' and computer ~= 'secondComputer' then
        return
    end

    if computer == 'firstComputer' then
        if Heist.firstComputer then
            return notify(src, 'You got everything you need from here.', 'error')
        end
        Heist.firstComputer = true
    elseif computer == 'secondComputer' then
        if Heist.secondComputer then
            return notify(src, 'You got everything you need from here.', 'error')
        end
        Heist.secondComputer = true
    end

    notify(src, 'Terminals decrypted.', 'success')
end)

RegisterNetEvent('storm-merryweather:employeeSwipe', function()
    local src = source

    ensureHeistInitialized()

    if not Heist.firstComputer or not Heist.secondComputer then
        return notify(src, 'Both terminals must be decrypted first.', 'error')
    end

    if Heist.employeeAuthenticated then
        return notify(src, 'Employee credentials have already been verified.', 'error')
    end

    if Heist.secretDoorOpen then
        return notify(src, 'The Secret door is open.', 'error')
    end

    if not removeItem(src, Config.RequiredItems.employeecard, 1) then
        return notify(src, ('Missing %s.'):format(Config.RequiredItems.employeecard), 'error')
    end

    TriggerClientEvent('storm-merryweather:showEmployeeMenu', src, Heist.employeeNames)
end)

RegisterNetEvent('storm-merryweather:submitEmployeeAuth', function(selectedName, enteredPin)
    local src = source

    ensureHeistInitialized()

    if Heist.employeeAuthenticated or Heist.secretDoorOpen then
        return notify(src, 'Employee access has already been granted.', 'error')
    end

    if type(selectedName) ~= 'string' or selectedName == '' then
        return notify(src, 'Invalid employee selection.', 'error')
    end

    if tostring(selectedName) ~= tostring(Heist.rightEmployee) then
        return notify(src, 'This is not the right employee.', 'error')
    end

    if tonumber(enteredPin) ~= tonumber(Heist.employeePin) then
        return notify(src, 'This is not the right pin.', 'error')
    end

    Heist.employeeAuthenticated = true
    Heist.secretDoorOpen = true

    SetDoorLocked('secretDoorLeft', false)
    SetDoorLocked('secretDoorRight', false)

    notify(src, 'Employee credentials verified. Secret Door Has Been Unlocked.', 'success')

    TriggerClientEvent('storm-merryweather:showEmployee2FA', src, {
        code = Heist.securityCodes[1]
    })
end)

RegisterNetEvent('storm-merryweather:finalComputer', function()
    local src = source

    if Heist.finalComputerLocked then
        return notify(src, 'The system has initiated a lockdown sequence.', 'error')
    end

    if not Heist.employeeAuthenticated or not Heist.secretDoorOpen then
        return notify(src, 'You need employee access first.', 'error')
    end

    if not Heist.securityCodes or not Heist.securityCodes[1] then
        return notify(src, 'Security code data is missing.', 'error')
    end

    if Heist.finalComplete then
        return notify(src, 'Why are you still here?', 'inform')
    end

    TriggerClientEvent('storm-merryweather:finalComputer', src)
end)

RegisterNetEvent('storm-merryweather:submitFinalComputerCode', function(enteredCode)
    local src = source

    if Heist.finalComputerLocked then
        return notify(src, 'The system has initiated a lockdown sequence.', 'error')
    end

    if not Heist.employeeAuthenticated or not Heist.secretDoorOpen then
        return notify(src, 'You need employee access first.', 'error')
    end

    if Heist.finalComplete then
        return notify(src, 'Why are you still here?', 'inform')
    end

    local expectedCode = tonumber(Heist.securityCodes and Heist.securityCodes[1])
    local submittedCode = tonumber(enteredCode)

    if not expectedCode or not submittedCode then
        return notify(src, 'Invalid security code.', 'error')
    end

    if submittedCode ~= expectedCode then
        Heist.finalComputerFailCount = (Heist.finalComputerFailCount or 0) + 1

        local maxFails = (Config.Variables and Config.Variables.FinalComputerTries) or 3
        local remaining = maxFails - Heist.finalComputerFailCount

        if remaining > 0 then
            return notify(src, ('2FA authorization failed. %s attempt(s) remaining.'):format(remaining), 'error')
        end

        initiateLockdown()
        return notify(src, ('The system has initiated a lockdown sequence. Facility will lock in %s minute(s).'):format(
            tonumber(Config.Variables.LockdownDelay) or 5
        ), 'error')
    end

    TriggerClientEvent('storm-merryweather:startFinalComputer2FA', src)
end)

RegisterNetEvent('storm-merryweather:failedFinalComputer', function()
    local src = source

    if Heist.finalComputerLocked or Heist.finalComplete then
        return
    end

    Heist.finalComputerFailCount = (Heist.finalComputerFailCount or 0) + 1

    local maxFails = (Config.Variables and Config.Variables.FinalComputerTries) or 3
    local remaining = maxFails - Heist.finalComputerFailCount

    if remaining > 0 then
        notify(src, ('Data transfer failed. %s attempt(s) remaining.'):format(remaining), 'error')
        return
    end

    initiateLockdown()
    notify(src, ('The system has initiated a lockdown sequence. Facility will lock in %s minute(s).'):format(
        tonumber(Config.Variables.LockdownDelay) or 5
    ), 'error')
end)

RegisterNetEvent('storm-merryweather:finishedHeist', function()
    local src = source

    if Heist.finalComputerLocked then
        return notify(src, 'The system has initiated a lockdown sequence.', 'error')
    end

    if not Heist.employeeAuthenticated or not Heist.secretDoorOpen then
        return notify(src, 'You need employee access first.', 'error')
    end

    if Heist.finalComplete then
        return notify(src, 'This heist has already been completed.', 'error')
    end

    Heist.finalComplete = true

    local given = addItem(src, Config.RequiredItems.manifest, 1)
    if not given then
        return notify(src, ('Failed to give %s.'):format(Config.RequiredItems.manifest), 'error')
    end

    notify(src, ('Guards are hacking back into the system, Lockdown sequence initiated in %s minute(s).'):format(
        tonumber(Config.Variables.LockdownDelay) or 5
    ), 'success')

    initiateLockdown()
end)

RegisterNetEvent('storm-merryweather:consumeManifest', function()
    local src = source

    local removed = removeItem(src, Config.RequiredItems.manifest, 1)
    if not removed then
        return
    end

    TriggerClientEvent('storm-merryweather:startManifestDrop', src)
end)

RegisterNetEvent('storm-merryweather:spawnProps', function(netIds)
    local src = source

    if type(netIds) ~= 'table'
        or not netIds.container
        or not netIds.lock
        or not netIds.collision
        or not netIds.crate then
        return
    end

    local selectedDrop = resolveConfiguredDrop(netIds.container)
    if not selectedDrop then return end

    local index = #Heist.drops + 1

    Heist.drops[index] = {
        owner = src,
        coords = selectedDrop.coords,
        target = selectedDrop.target,
        opened = false,
        looted = false,
        props = {
            container = netIds.container,
            lock = netIds.lock,
            collision = netIds.collision,
            crate = netIds.crate
        }
    }

    TriggerClientEvent('storm-merryweather:addLockTarget', -1, index, selectedDrop.target)
end)

RegisterNetEvent('storm-merryweather:attemptOpenContainer', function(index)
    local src = source
    local drop = Heist.drops[index]
    if not drop then return end

    if drop.opened then
        return notify(src, 'This crate is already open.', 'error')
    end

    if not hasItem(src, Config.RequiredItems.grinder, 1) then
        return notify(src, ('You need a %s.'):format(Config.RequiredItems.grinder), 'error')
    end

    TriggerClientEvent('storm-merryweather:attemptOpenContainer', src, index, drop.props)
end)

RegisterNetEvent('storm-merryweather:openContainerCl', function(index)
    local drop = Heist.drops[index]
    if not drop or drop.opened then return end

    drop.opened = true
    TriggerClientEvent('storm-merryweather:openContainerCl', -1, index, drop.props.container, drop.props.collision, drop.props.crate, true)
end)

RegisterNetEvent('storm-merryweather:lootCrate', function(index)
    local src = source
    local drop = Heist.drops[index]
    if not drop then return end

    if drop.looted then
        return notify(src, 'This crate has already been emptied.', 'error')
    end

    drop.looted = true

    if Config.Loot.MarkedMoney.enabled then
        giveMarkedMoney(src)
    end

    AddLootPoolRewards(src)

    notify(src, 'You grabbed the shipment.', 'success')
end)

RegisterNetEvent('storm-merryweather:robPed', function()
    local src = source
    local rewards = {}
    local dropsGiven = 0

    local function addRewardText(text)
        rewards[#rewards + 1] = text
    end

    local function giveItem(itemName, amount)
        amount = tonumber(amount) or 1
        if amount <= 0 then return false end
        return addItem(src, itemName, amount)
    end

    local function giveCash(amount)
        amount = tonumber(amount) or 0
        if amount <= 0 then return false end

        if GetResourceState('ox_inventory') == 'started' then
            return addItem(src, 'cash', amount)
        end

        local player = getPlayer(src)
        if player and player.Functions and player.Functions.AddMoney then
            player.Functions.AddMoney('cash', amount)
            return true
        end

        if player and player.AddMoney then
            player.AddMoney('cash', amount)
            return true
        end

        return false
    end

    local searchConfig = Config.PedSearch or {}
    local cashConfig = searchConfig.Cash or {}
    local lootPool = searchConfig.LootPool or {}
    local maxLootDrops = tonumber(searchConfig.MaxLootDrops) or 1

    if cashConfig.enabled then
        local cash = math.random(cashConfig.min or 1, cashConfig.max or 3)
        if giveCash(cash) then
            addRewardText(('$%s cash'):format(cash))
        end
    end

    for _, loot in ipairs(lootPool) do
        if dropsGiven >= maxLootDrops then
            break
        end

        local chance = tonumber(loot.chance) or 0
        local roll = math.random(1, 100)

        if roll <= chance then
            local amount = math.random(loot.min or 1, loot.max or 1)
            local success = giveItem(loot.item, amount)

            if success then
                dropsGiven = dropsGiven + 1
                addRewardText(('%sx %s'):format(amount, loot.item))
            end
        end
    end

    if #rewards == 0 then
        notify(src, 'You searched the guard but found nothing.', 'error')
        return
    end

    notify(src, ('You searched the guard and found: %s'):format(table.concat(rewards, ', ')), 'success')
end)

RegisterNetEvent('storm-merryweather:searchPed', function()
    local src = source
    local item = 'merryweathercard'

    if addItem(src, item, 1) then
        notify(src, ('You searched the guard and found %s.'):format(item), 'success')
    else
        notify(src, ('Failed to give %s.'):format(item), 'error')
    end
end)