if Cfg.Inventory ~= 'esx_inventory' then return end

local ItemList = {}

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                      BASIC ITEM FUNCTIONS                        │
-- └──────────────────────────────────────────────────────────────────┘

-- Add item to a player's inventory
function AddItem(source, item_name, amount, metadata)
    local Player = GetPlayer(source)
    if not Player then return false end

    return Player.addInventoryItem(item_name, amount)
end

-- Remove item from a player's inventory
function RemoveItem(source, item_name, amount)
    local Player = GetPlayer(source)
    if not Player then return false end

    return Player.removeInventoryItem(item_name, amount)
end

-- Check if a player has a specific item and amount
function HasItem(source, item_name, amount)
    local Player = GetPlayer(source)
    if not Player then return false end

    return Player.hasItem(item_name)
end

-- Get the count of a specific item in a player's inventory
function GetItemCount(source, item_name)
    local Player = GetPlayer(source)
    if not Player then return 0 end

    local hasItem, count = Player.hasItem(item_name)
    if hasItem and count then
        return count
    end
    return 0
end

-- Check if a player can carry a specific item and amount
function CanCarryItem(source, item_name, amount)
    local Player = GetPlayer(source)
    if not Player then return false end

    return Player.canCarryItem(item_name, amount)
end

-- Add weapon to a player's inventory
function AddWeapon(source, weapon_name, ammo)
    local Player = GetPlayer(source)
    if not Player then return false end

    return Player.addWeapon(weapon_name, ammo)
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

-- Get the list of all items in the database
function GetItemList()
    if next(ItemList) ~= nil then
        return ItemList
    end

    local items = DB.fetch('SELECT name, label FROM items')
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

-- Get inventory images (not supported in ESX Inventory)
function GetInventoryImages()
    return {}
end

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                                OTHER                             │
-- └──────────────────────────────────────────────────────────────────┘

RegisterServerEvent('cd_garage:VehiclePlateChanged', function(oldPlate, newPlate, netId)
    -- This inventory does not support updating vehicle trunk plates, so no action is required here.
end)