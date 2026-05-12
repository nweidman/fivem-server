if Cfg.Inventory ~= 'qs-inventory' then return end

local ItemList = {}
local InventoryImages = {}

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                      BASIC ITEM FUNCTIONS                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Add item to a player's inventory
function AddItem(source, item_name, amount, metadata)
    return exports['qs-inventory']:AddItem(source, item_name, amount, nil, metadata)
end

-- Remove item from a player's inventory
function RemoveItem(source, item_name, amount)
    return exports['qs-inventory']:RemoveItem(source, item_name, amount)
end

-- Check if a player has a specific item and amount
function HasItem(source, item_name, amount)
    local hasItem = exports['qs-inventory']:GetItemTotalAmount(source, item_name)
    if hasItem >= amount then
        return true
    end
    return false
end

-- Get the count of a specific item in a player's inventory
function GetItemCount(source, item_name)
    local item_count = exports['qs-inventory']:GetItemTotalAmount(source, item_name)
    if item_count then
        return item_count
    end
    return 0
end

-- Check if a player can carry a specific item and amount
function CanCarryItem(source, item_name, amount)
    return exports['qs-inventory']:CanCarryItem(source, item_name, amount)
end

-- Add weapon to a player's inventory
function AddWeapon(source, weapon_name, ammo)
    return AddItem(source, weapon_name, 1, { ammo = ammo })
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           ITEM QUALITY                           │
-- └──────────────────────────────────────────────────────────────────┘

-- Returns the slot ID of the first item that matches the item_name
function GetSlotFromFirstItemFound(source, item_name)
    local inventory = exports['qs-inventory']:GetInventory(source)
    if not inventory then return nil end

    for slot, item in ipairs(inventory) do
        if item.name == item_name then
            return slot
        end
    end

    return nil
end

-- Get the metadata of an item in a specific slot, or of the first item matching the item_name
function GetItemMetadata(source, item_name, slot)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local inventory = exports['qs-inventory']:GetInventory(source)
    if not inventory then return end

    for invSlot, item in pairs(inventory) do
        if invSlot == slot then
            return item.info
        end
    end
end

-- Get the quality of an item in a specific slot, or of the first item matching the item_name
function GetItemQuality(source, item_name, slot)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local inventory = exports['qs-inventory']:GetInventory(source)
    if not inventory then return end

    for invSlot, item in pairs(inventory) do
        if invSlot == slot then
            return item.info and item.info.quality
        end
    end
end

-- Add quality to an item in a specific slot, or to the first item matching the item_name
function AddQualityToItem(source, item_name, slot, qualityIncrease)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local metadata = GetItemMetadata(source, item_name, slot)
    local newQuality = (metadata and metadata.quality) + qualityIncrease
    if newQuality > 100 then newQuality = 100 end

    metadata.quality = newQuality
    exports['qs-inventory']:SetItemMetadata(source, slot, metadata)
end

-- Remove quality from an item in a specific slot, or from the first item matching the item_name
function RemoveQualityToItem(source, item_name, slot, qualityDecrease)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local metadata = GetItemMetadata(source, item_name, slot)
    local newQuality = (metadata and metadata.quality) - qualityDecrease
    if newQuality < 0 then newQuality = 0 end

    metadata.quality = newQuality
    exports['qs-inventory']:SetItemMetadata(source, slot, metadata)
end

-- Set the quality of an item in a specific slot, or of the first item matching the item_name
function SetItemQuality(source, item_name, slot, quality)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local metadata = GetItemMetadata(source, item_name, slot)
    metadata = metadata or {}
    metadata.quality = quality
    exports['qs-inventory']:SetItemMetadata(source, slot, metadata)
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           GET SHARED DATA                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Check if a player can carry a specific item and amount
function GetItemList()
    if next(ItemList) ~= nil then
        return ItemList
    end

    local items = exports['qs-inventory']:GetItemList()
    if not items then
        return ItemList
    end

    for k, v in pairs(items) do
        local name = type(k) == 'string' and k or v.name

        if name then
            ItemList[name] = {
                name = name,
                label = v.label or name,
            }
        end
    end

    return ItemList
end

-- Get inventory images
function GetInventoryImages()
    if next(InventoryImages) ~= nil then
        return InventoryImages
    end
    local images = exports.cd_bridge:ReadNUIDirectory(
        GetResourcePath('qs-inventory')..'/html/images',
        'qs-inventory/html/images/',
        {'png', 'jpg', 'jpeg', 'gif', 'webp'}
    )
    if images then
        InventoryImages = images
    end
    return InventoryImages
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                                OTHER                             │
-- └──────────────────────────────────────────────────────────────────┘

RegisterServerEvent('cd_garage:VehiclePlateChanged', function(oldPlate, newPlate, netId)
    exports['qs-inventory']:UpdateVehiclePlate(oldPlate, newPlate)
end)