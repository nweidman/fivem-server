-- server.lua
local pendingRewards = {} -- pendingRewards[source] = { box = 'paperbag', reward = rewardTable, rarity=..., color=... }

-- helpers
local function debugPrint(...)
    if Config.Debug then
        print('[mysterybox]', ...)
    end
end

-- Utility: weighted pick from a list (entries should have .weight)
local function weightedPick(entries)
    local total = 0
    for _, e in ipairs(entries) do
        total = total + (e.weight or 0)
    end
    if total <= 0 then return nil end

    local pick = math.random() * total
    local cumulative = 0

    for i, e in ipairs(entries) do
        cumulative = cumulative + (e.weight or 0)
        if pick <= cumulative then
            return i, e
        end
    end

    return nil
end

-- Exposed API placeholders - replace with your server framework's item/money functions
-- Example implementations (QBCore / qbx_core) are commented inside. Make them match your server.
function AddItem(source, item, amount)
    local ok, res = pcall(function()
        return exports.ox_inventory:AddItem(source, item, amount)
    end)

    debugPrint("AddItem", source, item, amount, "=>", ok and tostring(res) or ("ERR " .. tostring(res)))
    return ok and (res ~= false and res ~= nil)
end

function RemoveItem(source, item, amount)
    local ok, res = pcall(function()
        return exports.ox_inventory:RemoveItem(source, item, amount)
    end)

    debugPrint("RemoveItem", source, item, amount, "=>", ok and tostring(res) or ("ERR " .. tostring(res)))
    return ok and (res ~= false and res ~= nil)
end

function AddMoney(source, account, amount, reason)
    local moneyType = tostring(account or ''):lower()

    -- qbx_core supports: cash, bank, crypto
    if moneyType ~= 'cash' and moneyType ~= 'bank' and moneyType ~= 'crypto' then
        debugPrint("AddMoney invalid moneyType:", tostring(account))
        return false
    end

    local ok, success = pcall(function()
        return exports.qbx_core:AddMoney(source, moneyType, amount, reason)
    end)

    debugPrint("AddMoney", source, moneyType, amount, reason, "=>", ok and tostring(success) or ("ERR " .. tostring(success)))
    return ok and success == true
end

function OpenMysteryBox(source, boxItemName)
    local boxDef = Config.MysteryBoxes[boxItemName]
    if not boxDef then
        debugPrint("Unknown box:", boxItemName)
        return
    end

    local weightedEntries = {}
    for i, entry in ipairs(boxDef.Rewards) do
        local rarityDef = boxDef.Rarities[entry.rarity]
        local weight = (rarityDef and rarityDef.chance) or 0

        table.insert(weightedEntries, {
            index = i,
            weight = weight,
            entry = entry,
            rarity = entry.rarity,
            image = entry.image,
            color = (rarityDef and rarityDef.color) or 'ffffff',
        })
    end

    local chosenIndex, chosen = weightedPick(weightedEntries)
    if not chosen then
        debugPrint("No chosen prize (bad weights).")
        return
    end

    local removed = RemoveItem(source, boxItemName, 1)
    if not removed then
        debugPrint("Failed to remove box from player", source, "box:", boxItemName)
        return
    end

    pendingRewards[source] = {
        box = boxItemName,
        reward = chosen.entry,
        rarity = chosen.rarity,
        color = chosen.color,
    }

    local uiRewards = {}
    for _, e in ipairs(weightedEntries) do
        uiRewards[#uiRewards + 1] = {
            label = e.entry.reward,
            type = e.entry.type,
            amount = e.entry.amount,
            rarity = e.rarity,
            color = e.color
        }
    end

    local boxInfo = exports.ox_inventory:Items(boxItemName)

    local displayLabel = tostring(chosen.entry.reward)
    if chosen.entry.type == 'item' then
        local itemInfo = exports.ox_inventory:Items(chosen.entry.reward)
        displayLabel = (itemInfo and itemInfo.label) or displayLabel
    elseif chosen.entry.type == 'money' then
        local t = tostring(chosen.entry.reward):lower()
        if t == 'crypto' then
            displayLabel = 'Crypto'
        elseif t == 'bank' then
            displayLabel = 'Bank'
        elseif t == 'cash' then
            displayLabel = 'Cash'
        else
            displayLabel = displayLabel
        end
    end

    TriggerClientEvent('mysterybox:client:OpenUI', source, {
        box = boxItemName,
        boxName = (boxInfo and boxInfo.label) or boxItemName,

        reward = chosen.entry,
        rarity = chosen.rarity,
        color = chosen.color,

        label = displayLabel,
        img = chosen.image,
        chosenIndex = chosenIndex - 1,
        rewards = uiRewards,
    })
end

-- When client finishes spin and asks to claim, the server gives the reward (verifies pending)
RegisterNetEvent('mysterybox:server:Claim', function()
    local src = source
    local pending = pendingRewards[src]
    if not pending then
        debugPrint("No pending reward for", src)
        return
    end

    local reward = pending.reward
    debugPrint("Granting reward to", src, reward.reward, reward.amount, reward.type)

    if reward.type == "item" then
        local ok = AddItem(src, reward.reward, reward.amount)
        if not ok then
            debugPrint("FAILED to add item reward:", reward.reward, reward.amount, "to", src)
        end

    elseif reward.type == "money" then
        local ok = AddMoney(src, reward.reward, reward.amount, "Mystery Box")
        if not ok then
            debugPrint("FAILED to add money reward:", reward.reward, reward.amount, "to", src)
        end

    else
        debugPrint("Unknown reward type", tostring(reward.type))
    end

    pendingRewards[src] = nil
end)

AddEventHandler('playerDropped', function()
    local src = source
    if pendingRewards[src] then
        pendingRewards[src] = nil
        debugPrint("Cleared pending reward for dropped player", src)
    end
end)

for boxName, _ in pairs(Config.MysteryBoxes) do
    exports.qbx_core:CreateUseableItem(boxName, function(source, item)
        OpenMysteryBox(source, boxName)
    end)
end

RegisterNetEvent('mysterybox:server:Open', function(boxName)
    local src = source
    OpenMysteryBox(src, boxName)
end)
