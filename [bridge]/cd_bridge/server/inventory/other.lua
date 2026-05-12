if Cfg.Inventory ~= 'other' then return end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                      BASIC ITEM FUNCTIONS                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Add item to a player's inventory
--- @param source      number   The player's server ID.
--- @param item_name   string   The item to add.
--- @param amount      number   The amount to add.
--- @param metadata    table    Additional item metadata (optional).
--- @return boolean #           True if the item was added successfully, false otherwise.
function AddItem(source, item_name, amount, metadata)
    return true
end

-- Remove item from a player's inventory
--- @param source      number   The player's server ID.
--- @param item_name   string   The item to remove.
--- @param amount      number   The amount remove.
--- @return boolean #           True if the item was removed successfully, false otherwise.
function RemoveItem(source, item_name, amount)
    return true
end

-- Check if a player has a specific item and amount
--- @param source      number   The player's server ID.
--- @param item_name   string   The item to check for.
--- @param amount      number   The required amount.
--- @return boolean    --True if the player has at least `amount` of `item_name`, false otherwise.
function HasItem(source, item_name, amount)
    return true
end

-- Get the count of a specific item in a player's inventory
--- @param source      number   The player's server ID.
--- @param item_name   string   The item to check for.
--- @return number              --The amount of `item_name` the player has.
function GetItemCount(source, item_name)
    return 0
end

-- Check if a player can carry a specific item and amount
--- @param source      number   The player's server ID.
--- @param item_name   string   The item to check for.
--- @param amount      number   The amount to check for.
--- @return boolean             --True if the player can carry `amount` of `item_name`, false otherwise.
function CanCarryItem(source, item_name, amount)
    return true
end

-- Add weapon to a player's inventory
--- @param source      number   The player's server ID.
--- @param weapon_name string   The weapon to add.
--- @param ammo        number   The amount of ammo to add.
--- @return boolean             --True if the weapon was added successfully, false otherwise.
function AddWeapon(source, weapon_name, ammo)
    return true
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           ITEM QUALITY                           │
-- └──────────────────────────────────────────────────────────────────┘

-- Returns the slot ID of the first item that matches the item_name
--- @param source number The player's server ID.
--- @param item_name string The item name.
--- @return number|nil # The slot ID of the first item that matches the item_name, or nil if no item was found.
function GetSlotFromFirstItemFound(source, item_name)
    return nil
end

-- Get the metadata of an item in a specific slot, or of the first item matching the item_name
--- @param source number The player's server ID.
--- @param item_name string The item name.
--- @param slot number The inventory slot id.
--- @return table|nil # The metadata of the item, or nil if no item was found or if the item has no metadata.
function GetItemMetadata(source, item_name, slot)
    return nil
end

-- Get the quality of an item in a specific slot, or of the first item matching the item_name
--- @param source number The player's server ID.
--- @param item_name string The item name.
--- @param slot number The inventory slot id.
--- @return number|nil # The quality of the item, or nil if no item was found.
function GetItemQuality(source, item_name, slot)
    return nil
end

-- Add quality to an item in a specific slot, or to the first item matching the item_name
--- @param source number The player's server ID.
--- @param item_name string The item name.
--- @param slot number The inventory slot id.
--- @param qualityIncrease number The amount of quality to add.
function AddQualityToItem(source, item_name, slot, qualityIncrease)

end

-- Remove quality from an item in a specific slot, or from the first item matching the item_name
--- @param source number The player's server ID.
--- @param item_name string The item name.
--- @param slot number The item slot to add quality to.
--- @param qualityDecrease number The amount of quality to remove.
function RemoveQualityToItem(source, item_name, slot, qualityDecrease)

end

-- Set the quality of an item in a specific slot, or of the first item matching the item_name
--- @param source number The player's server ID.
--- @param item_name string The item name.
--- @param slot number The inventory slot id.
--- @param quality number The quality to set.
function SetItemQuality(source, item_name, slot, quality)

end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                           GET SHARED DATA                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Check if a player can carry a specific item and amount
--- @return table   --A table of all items in the inventory system.
---                 The returned table must follow this structure:
---                 items['item_label'] = {
---                     name  = 'item_name',
---                     label = 'item_label'
---                 }
function GetItemList()
    return {}
end

-- Get inventory images
--- @return table   --A table of all inventory item images.
---                 The returned table must follow this structure:
---                 images[1] = 'water.png'
function GetInventoryImages()
    return {}
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                                OTHER                             │
-- └──────────────────────────────────────────────────────────────────┘

--- comment
--- @param oldPlate string The vehicle's old plate.
--- @param newPlate string The vehicle's new plate.
--- @param netId number | nil The vehicle's network ID, sometimes it might be nil.
RegisterServerEvent('cd_garage:VehiclePlateChanged', function(oldPlate, newPlate, netId)

end)