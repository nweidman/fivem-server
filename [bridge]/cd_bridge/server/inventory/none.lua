if Cfg.Inventory ~= 'none' then return end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                      BASIC ITEM FUNCTIONS                        │
-- └──────────────────────────────────────────────────────────────────┘


-- Add item to a player's inventory
function Addtem(source, item_name, amount, metadata)
    return true
end

-- Add item to a player's inventory
function RemoveItem(source, item_name, amount)
    return true
end

-- Remove item from a player's inventory
function GetItemCount(source, item_name)
    return 10000
end

-- Check if a player has a specific item and amount
function HasItem(source, item_name, amount)
    return true
end

-- Check if a player can carry a specific item and amount
function CanCarryItem(source, item_name, amount)
    return true
end

-- Add weapon to a player's inventory
function AddWeapon(source, weapon_name, ammo)
    return true
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           ITEM QUALITY                           │
-- └──────────────────────────────────────────────────────────────────┘

-- Returns the slot ID of the first item that matches the item_name
function GetSlotFromFirstItemFound(source, item_name)
    return nil
end

-- Get the metadata of an item in a specific slot, or of the first item matching the item_name
function GetItemMetadata(source, item_name, slot)
    return nil
end

-- Get the quality of an item in a specific slot, or of the first item matching the item_name
function GetItemQuality(source, item_name, slot)
    return nil
end

-- Add quality to an item in a specific slot, or to the first item matching the item_name
function AddQualityToItem(source, item_name, slot, qualityIncrease)

end

-- Remove quality from an item in a specific slot, or from the first item matching the item_name
function RemoveQualityToItem(source, item_name, slot, qualityDecrease)

end

-- Set the quality of an item in a specific slot, or of the first item matching the item_name
function SetItemQuality(source, item_name, slot, quality)

end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           GET SHARED DATA                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Check if a player can carry a specific item and amount
function GetItemList()
    return {}
end

-- Get inventory images
function GetInventoryImages()
    return {}
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                                OTHER                             │
-- └──────────────────────────────────────────────────────────────────┘

RegisterServerEvent('cd_garage:VehiclePlateChanged', function(oldPlate, newPlate, netId)
    -- This inventory does not support updating vehicle trunk plates, so no action is required here.
end)