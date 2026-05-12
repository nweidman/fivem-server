if Cfg.Inventory ~= 'ox_inventory' then return end

local ItemList = {}
local InventoryImages = {}

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                      BASIC ITEM FUNCTIONS                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Add item to a player's inventory
function AddItem(source, item_name, amount, metadata)
    return exports.ox_inventory:AddItem(source, item_name, amount, metadata)
end

-- Remove item from a player's inventory
function RemoveItem(source, item_name, amount)
    return exports.ox_inventory:RemoveItem(source, item_name, amount)
end

-- Check if a player has a specific item and amount
function HasItem(source, item_name, amount)
    local has_item = exports.ox_inventory:GetItem(source, item_name, nil, false)
    if has_item.count >= amount then
        return true
    end
    return false
end

-- Get the count of a specific item in a player's inventory
function GetItemCount(source, item_name)
    local item = exports.ox_inventory:GetItem(source, item_name, nil, false)
    if item and item.count then
        return item.count
    end
    return 0
end

-- Check if a player can carry a specific item and amount
function CanCarryItem(source, item_name, amount)
    return exports.ox_inventory:CanCarryItem(source, item_name, amount)
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
    local slot = exports.ox_inventory:GetSlotForItem(source, item_name)
    if not slot then return nil end
    return slot
end

-- Get the metadata of an item in a specific slot, or of the first item matching the item_name
function GetItemMetadata(source, item_name, slot)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local item = exports.ox_inventory:GetSlot(source, slot)
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

    local item = exports.ox_inventory:GetSlot(source, slot)
    if item and item.metadata and item.metadata.durability then
        return item.metadata.durability
    end
end

-- Add quality to an item in a specific slot, or to the first item matching the item_name
function AddQualityToItem(source, item_name, slot, qualityIncrease)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local currentQuality = GetItemQuality(source, item_name, slot)
    local newQuality = currentQuality + qualityIncrease
    if newQuality > 100 then newQuality = 100 end

    exports.ox_inventory:SetDurability(source, slot, newQuality)
end

-- Remove quality from an item in a specific slot, or from the first item matching the item_name
function RemoveQualityToItem(source, item_name, slot, qualityDecrease)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    local currentQuality = GetItemQuality(source, item_name, slot)
    local newQuality = currentQuality - qualityDecrease
    if newQuality < 0 then newQuality = 0 end

    exports.ox_inventory:SetDurability(source, slot, newQuality)
end

-- Set the quality of an item in a specific slot, or of the first item matching the item_name
function SetItemQuality(source, item_name, slot, quality)
    if not slot then
        slot = GetSlotFromFirstItemFound(source, item_name)
        if not slot then return end
    end

    exports.ox_inventory:SetDurability(source, slot, quality)
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           GET SHARED DATA                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Check if a player can carry a specific item and amount
function GetItemList()
    if next(ItemList) ~= nil then
        return ItemList
    end

    local items = exports.ox_inventory:Items()
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
        GetResourcePath('ox_inventory')..'/web/images',
        'ox_inventory/web/images/',
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
    exports.ox_inventory:UpdateVehicle(oldPlate, newPlate)
end)