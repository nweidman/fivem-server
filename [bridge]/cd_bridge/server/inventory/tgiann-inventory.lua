if Cfg.Inventory ~= 'tgiann-inventory' then return end

local ItemList = {}

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                      BASIC ITEM FUNCTIONS                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Add item to a player's inventory
function AddItem(source, item_name, amount, metadata)
    return exports['tgiann-inventory']:AddItem(source, item_name, amount, nil, metadata)
end

-- Remove item from a player's inventory
function RemoveItem(source, item_name, amount)
    return exports['tgiann-inventory']:RemoveItem(source, item_name, amount)
end

-- Check if a player has a specific item and amount
function HasItem(source, item_name, amount)
    return exports['tgiann-inventory']:HasItem(source, item_name, amount)
end

-- Get the count of a specific item in a player's inventory
function GetItemCount(source, item_name)
    local item_count = exports['tgiann-inventory']:GetItemCount(source, item_name)
    if item_count then
        return item_count
    end
    return 0
end

-- Check if a player can carry a specific item and amount
function CanCarryItem(source, item_name, amount)
    return exports['tgiann-inventory']:CanCarryItem(source, item_name, amount)
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
    local slot = exports['tgiann-inventory']:GetFirstSlotByItem(source, item_name)
    if not slot then return end
    return slot
end

-- Get the metadata of an item in a specific slot, or of the first item matching the item_name
function GetItemMetadata(source, item_name, slot)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local item = exports['tgiann-inventory']:GetItemBySlot(source, slot)
    if item and item.metadata then
        return item.metadata
    end
end

-- Get the quality of an item in a specific slot, or of the first item matching the item_name
function GetItemQuality(source, item_name, slot)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local item = exports['tgiann-inventory']:GetItemBySlot(source, slot)
    if item and item.metadata and item.metadata.quality then
        return item.metadata.quality
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
    exports['tgiann-inventory']:UpdateItemMetadata(src, item_name, slot, metadata)
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
    exports['tgiann-inventory']:UpdateItemMetadata(src, item_name, slot, metadata)
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
    exports['tgiann-inventory']:UpdateItemMetadata(src, item_name, slot, metadata)
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           GET SHARED DATA                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Get the list of all items in the database
function GetItemList()
    if next(ItemList) ~= nil then
        return ItemList
    end
    for _, row in pairs(exports['tgiann-inventory']:GetItemList()) do
        ItemList[row.name] = {
            name = row.name,
            label = row.label
        }
    end
    return ItemList
end

-- Get inventory images
function GetInventoryImages()
    if next(InventoryImages) ~= nil then
        return InventoryImages
    end
    local images = exports.cd_bridge:ReadNUIDirectory(
        GetResourcePath('tgiann-inventory')..'/inventory_images/images',
        'tgiann-inventory/inventory_images/images/',
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
    exports['tgiann-inventory']:UpdateVehicle(oldPlate, newPlate)
end)