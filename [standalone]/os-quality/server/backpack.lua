local DEBUG = false
local MAX_BACKPACKS = 2

local BACKPACK_ITEMS = {
    backpack = true,
}

local BLOCKED_INVENTORY_ID_PATTERNS = {
    "dumpster"
    -- "locker_",
    -- "organisation_",
    -- "restaurants_",
    -- "apartment_",
    -- "Gunrack_",
    -- "boss_",
    -- "policestash_",
    -- "house_",
    -- "glove",
    -- "trunk",
    -- "property"
}

local function isBackpackItem(name)
    return name and BACKPACK_ITEMS[name] == true
end

local function dbg(...)
    if not DEBUG then return end
    print("^3[backpack_limit]^7", ...)
end

local function inventoryIdToString(inv)
    if inv == nil then return "" end
    if type(inv) == "string" then return inv end
    if type(inv) == "number" then return tostring(inv) end
    if type(inv) == "table" then
        if inv.id ~= nil then return tostring(inv.id) end
        if inv.name ~= nil then return tostring(inv.name) end
    end
    return tostring(inv)
end

local function isBlockedDestInventoryId(invIdStr)
    invIdStr = (invIdStr or ""):lower()
    if invIdStr == "" then return false end
    for _, pat in ipairs(BLOCKED_INVENTORY_ID_PATTERNS) do
        if invIdStr:find(pat, 1, true) then
            return true
        end
    end
    return false
end

local function countBackpacksInInventory(invId)
    local total = 0
    for itemName, _ in pairs(BACKPACK_ITEMS) do
        local c = exports.ox_inventory:Search(invId, 'count', itemName) or 0
        total += c
        if total > MAX_BACKPACKS then break end
    end
    return total
end

local function willExceedBackpackLimit(toInventory, movingItemName, movingCount)
    movingCount = tonumber(movingCount) or 0
    if movingCount <= 0 then return false end
    if not isBackpackItem(movingItemName) then return false end

    local existing = countBackpacksInInventory(toInventory)

    -- Block if adding these would exceed the limit
    if (existing + movingCount) > MAX_BACKPACKS then
        return true
    end

    return false
end

exports.ox_inventory:registerHook('swapItems', function(payload)
    local fromInv = payload.fromInventory
    local toInv   = payload.toInventory
    local toType  = payload.toType
    local action  = payload.action
    local count   = payload.count

    local fromSlot = payload.fromSlot or {}
    local itemName = fromSlot.name

    if not isBackpackItem(itemName) then
        return
    end

    local toInvIdStr = inventoryIdToString(toInv)

    if isBlockedDestInventoryId(toInvIdStr) then
        dbg("BLOCK: backpack -> blocked inventory id:", toInvIdStr, "action:", action, "toType:", toType)
        return false
    end

    if willExceedBackpackLimit(toInv, itemName, count) then
        dbg("BLOCK: would exceed limit in dest:", toInvIdStr, "action:", action, "count:", count)
        return false
    end

    local fromInvIdStr = inventoryIdToString(fromInv)
    local fromCount = countBackpacksInInventory(fromInv)
    if fromCount > MAX_BACKPACKS then
        dbg("BLOCK: source already has >limit:", fromInvIdStr, "count:", fromCount)
        return false
    end
end, {
    itemFilter = BACKPACK_ITEMS,
})

exports.ox_inventory:registerHook('createItem', function(payload)
    local item = payload.item or {}
    local itemName = item.name
    if not isBackpackItem(itemName) then return end

    local invId = payload.inventoryId
    if not invId then return end

    local invIdStr = inventoryIdToString(invId)

    if isBlockedDestInventoryId(invIdStr) then
        dbg("BLOCK createItem: backpack -> blocked inventory:", invIdStr)
        return false
    end

    local existing = countBackpacksInInventory(invId)
    local adding = tonumber(payload.count) or 1

    if (existing + adding) > MAX_BACKPACKS then
        dbg("BLOCK createItem: would exceed limit in:", invIdStr, "existing:", existing, "adding:", adding, "limit:", MAX_BACKPACKS)
        return false
    end
end, {
    itemFilter = BACKPACK_ITEMS
})

exports.ox_inventory:registerHook('buyItem', function(payload)
    local item = payload.item or {}
    local itemName = item.name or payload.itemName
    if not isBackpackItem(itemName) then return end

    local invId = payload.inventoryId or payload.source
    if not invId then return end

    local invIdStr = inventoryIdToString(invId)

    if isBlockedDestInventoryId(invIdStr) then
        dbg("BLOCK buyItem: backpack -> blocked inventory:", invIdStr)
        return false
    end

    local existing = countBackpacksInInventory(invId)
    local adding = tonumber(payload.count) or 1

    if (existing + adding) > MAX_BACKPACKS then
        dbg("BLOCK buyItem: would exceed limit in:", invIdStr, "existing:", existing, "adding:", adding, "limit:", MAX_BACKPACKS)
        return false
    end
end, {
    itemFilter = BACKPACK_ITEMS
})