local Inventory = {}

---@param source number
---@return any[]
function Inventory.getInventory(source)
    local xPlayer = server.getPlayer(source)
    if shared.getFrameworkName() == 'esx' then
        return xPlayer.getInventory()
    elseif shared.getFrameworkName() == 'qb' then
        return xPlayer.PlayerData.items
    elseif shared.getFrameworkName() == 'qbx' then
        return xPlayer.PlayerData.items
    end
    return {}
end

---@param source number
---@param itemName string
---@param count number
---@return boolean
function Inventory.giveItem(source, itemName, count)
    exports['drool_skills']:addXP(source, 1)
    local xPlayer = server.getPlayer(source)
    if shared.getFrameworkName() == 'esx' then
        return xPlayer.addInventoryItem(itemName, count)
    elseif shared.getFrameworkName() == 'qb' then
        return xPlayer.Functions.AddItem(itemName, count)
    elseif shared.getFrameworkName() == 'qbx' then
        return xPlayer.Functions.AddItem(itemName, count)
    end
    return false
end

---@param source number
---@param itemName string
---@param count number
---@return boolean
function Inventory.removeItem(source, itemName, count)
    local xPlayer = server.getPlayer(source)
    if shared.getFrameworkName() == 'esx' then
        return xPlayer.removeInventoryItem(itemName, count)
    elseif shared.getFrameworkName() == 'qb' then
        return xPlayer.Functions.RemoveItem(itemName, count)
    elseif shared.getFrameworkName() == 'qbx' then
        return xPlayer.Functions.RemoveItem(itemName, count)
    end
    return false
end

---@param source number
---@param itemName string
---@param count number
---@return boolean
function Inventory.hasItem(source, itemName, amount)
    amount = amount or 1
    local xPlayer = server.getPlayer(source)

    local count = 0
    local item = nil

    if shared.getFrameworkName() == 'esx' then
        item = xPlayer.hasItem(itemName)
    else --[[ QB or QBOX ]]
        item = xPlayer.Functions.GetItemByName(itemName)
    end
    if item then
        count = item.amount or item.count or 0
    end
    return count >= amount
end

---@param source number
---@param itemName string
---@return number
function Inventory.getItemTotalCountByName(source, itemName)
    if shared.isResourceStart('ox_inventory') then
        return exports.ox_inventory:GetItemCount(source, itemName)
    elseif shared.isResourceStart('qb-inventory') then
        return exports['qb-inventory']:GetItemCount(source, itemName)
    elseif shared.isResourceStart('qs-inventory') then
        return exports['qs-inventory']:GetItemTotalAmount(source, itemName)
    else
        -- ? Use your inventory script export
    end

    return 0
end

function Inventory.getItemTotalDurabilityByName(source, itemName)
    if shared.isResourceStart('ox_inventory') then
        local totalDurability = 0

        local slots = exports.ox_inventory:GetSlotIdsWithItem(source, itemName)
        for _, slotId in pairs(slots) do
            local slot = exports.ox_inventory:GetSlot(source, slotId)
            if slot and slot.metadata.durability then
                totalDurability += slot.metadata.durability
            end
        end

        return totalDurability
    elseif shared.isResourceStart('qb-inventory') then
        local totalDurability = 0

        local items = Inventory.getInventory(source)
        local slots = exports['qb-inventory']:GetSlotsByItem(items, itemName)
        for _, slotId in pairs(slots) do
            local item = exports['qb-inventory']:GetItemBySlot(source, slotId)
            if item and item.info.durability then
                totalDurability += item.info.durability
            end
        end

        return totalDurability
    elseif shared.isResourceStart('qs-inventory') then
        local totalDurability = 0

        local playerInventory = exports['qs-inventory']:GetInventory(source)
        if playerInventory then
            for invItemName, invItemData in pairs(playerInventory) do
                if invItemName == itemName and invItemData.info and invItemData.info.durability then
                    totalDurability += invItemData.info.durability
                end
            end
        end

        return totalDurability
    else
        -- ? Use your inventory script export
    end

    return 0
end

function Inventory.setItemDurability(source, itemName, value)
    if shared.isResourceStart('ox_inventory') then
        local foundedSlotId = nil
        local newMetadata = {}

        local slots = exports.ox_inventory:GetSlotIdsWithItem(source, itemName)
        for _, slotId in pairs(slots) do
            local slot = exports.ox_inventory:GetSlot(source, slotId)
            if slot and slot.metadata.durability then
                foundedSlotId = slotId
                slot.metadata.durability = slot.metadata.durability + value
                newMetadata = slot.metadata
                break
            end
        end
        if foundedSlotId then
            exports.ox_inventory:SetMetadata(source, foundedSlotId, newMetadata)
        end
    elseif shared.isResourceStart('qb-inventory') then
        local foundedSlotId = nil
        local newMetadata = {}

        local items = Inventory.getInventory(source)
        local slots = exports['qb-inventory']:GetSlotsByItem(items, itemName)
        for _, slotId in pairs(slots) do
            local item = exports['qb-inventory']:GetItemBySlot(source, slotId)
            if item and item.info.durability then
                foundedSlotId = slotId
                item.info.durability = item.info.durability + value
                newMetadata = item.info
                break
            end
        end

        if foundedSlotId then
            exports['qb-inventory']:SetItemData(source, itemName, 'info', newMetadata, foundedSlotId)
        end
    elseif shared.isResourceStart('qs-inventory') then
        local foundedSlotId = nil
        local newMetadata = {}

        local playerInventory = exports['qs-inventory']:GetInventory(source)
        if playerInventory then
            for invItemName, invItemData in pairs(playerInventory) do
                if invItemName == itemName and invItemData.info and invItemData.info.durability then
                    foundedSlotId = invItemData.slot
                    invItemData.info.durability = invItemData.info.durability + value
                    newMetadata = invItemData.info
                    break
                end
            end
        end

        if foundedSlotId then
            exports['qs-inventory']:SetItemMetadata(source, foundedSlotId, newMetadata)
        end
    else
        -- ? use your inventory script export
    end
end

function Inventory.getSlotWithItem(source, itemName)
    if shared.isResourceStart('ox_inventory') then
        local item = exports.ox_inventory:GetSlotWithItem(source, itemName)
        if not item then return false end
        return item, item.slot
    elseif shared.isResourceStart('qb-inventory') then
        local items = Inventory.getInventory(source)
        local slotId = exports['qb-inventory']:GetFirstSlotByItem(items, itemName)
        if not slotId then return false end

        local item = exports['qb-inventory']:GetItemBySlot(source, slotId)

        return item, slotId
    elseif shared.isResourceStart('qs-inventory') then
        local inventory = exports['qs-inventory']:GetInventory(playerSource)
        if not inventory then return false end

        for slot, item in pairs(inventory) do
            if item.name == itemName then
                return item, slot
            end
        end

        return false
    else
        -- ? use your inventory script export
    end
    return false
end

function Inventory.setItemMetadata(source, itemName, slotId, newMetadata)
    if shared.isResourceStart('ox_inventory') then
        exports.ox_inventory:SetMetadata(source, slotId, newMetadata)
    elseif shared.isResourceStart('qb-inventory') then
        exports['qb-inventory']:SetItemData(source, itemName, 'info', newMetadata, slotId)
    elseif shared.isResourceStart('qs-inventory') then
        exports['qs-inventory']:SetItemMetadata(source, slotId, newMetadata)
    else
        -- ? use your inventory script export
    end
end

return Inventory
