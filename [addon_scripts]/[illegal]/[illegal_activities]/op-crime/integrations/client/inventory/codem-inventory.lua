------------------------------------------------------------------------------
-- OPEN STASH FUNCTION / this is called when user press 'e' or use target ----
------------------------------------------------------------------------------

if Config.Inventory.inventoryScript ~= "codem-inventory" then return end

function openStash(orgId, stashName, capacity, gangLabel)
    TriggerServerEvent('codem-inventory:server:openstash', stashName, 150, capacity, gangLabel)
end

function openFurnitureStorage(stashName, capacity, slots, label)
    TriggerServerEvent('codem-inventory:server:openstash', stashName, slots, capacity, label)
end