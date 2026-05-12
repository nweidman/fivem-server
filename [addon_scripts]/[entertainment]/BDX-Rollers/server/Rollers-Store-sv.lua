
-- ════════════════════════════════════════════════════════════════
-- USEABLE ITEM REGISTRATION (Handled by Sport Hub)
-- ════════════════════════════════════════════════════════════════
-- The useable item is now automatically registered by BDX-Sport-Hub
-- via server/framework-bridge.lua
-- No need to register it here anymore!

-- ════════════════════════════════════════════════════════════════
-- PURCHASE HANDLER
-- ════════════════════════════════════════════════════════════════

RegisterNetEvent("bodhix-Roller:purchaseItem")
AddEventHandler("bodhix-Roller:purchaseItem", function(itemType, itemId, RollerStyle, price)
    local src = source

    if Config.Debug then
        print(string.format("^5[Rollers Server] ========== PURCHASE REQUEST RECEIVED ==========^0"))
        print(string.format("^5[Rollers Server] Player: %s, ItemType: %s, ItemID: %s, Style: %s, Price: $%s^0", src, tostring(itemType), tostring(itemId), tostring(RollerStyle), tostring(price)))
    end

    -- Validate item type
    if itemType ~= "blades" then
        if Config.Debug then
            print("^1[Rollers Server ERROR] Invalid purchase type!^0")
        end
        return
    end

    -- ✅ Use Sport Hub framework bridge for money removal
    local hasMoney = exports['BDX-Sport-Hub']:RemoveMoney(src, price)

    if Config.Debug then
        if hasMoney then
            print(string.format("^2[Rollers Server] Payment successful: $%s removed^0", price))
        else
            print(string.format("^1[Rollers Server] Payment failed: Player doesn't have $%s^0", price))
        end
    end

    -- If player has enough money, process the purchase
    if hasMoney then
        if Config.Debug then
            print(string.format("^5[Rollers Server] Player has enough money! Processing purchase...^0"))
            print(string.format("^5[Rollers Server] Triggering client event: bodhix-Roller:purchase^0"))
        end

        -- Notify client to save the new rollers design and style
        TriggerClientEvent('bodhix-Roller:purchase', src, itemType, itemId, RollerStyle)

        -- ✅ Design purchase only changes appearance (base item already owned)
        -- Base item (rollers) is now purchased separately via Sport Hub ownership system

        -- ✅ Show success notification only for actual purchases (price > 0)
        -- For equips (price = 0), Sport Hub already shows "Design equipped successfully!"
        if price > 0 then
            exports['BDX-Sport-Hub']:ShowNotification(src, "purchase", "success")
        end

        if Config.Debug then
            if price > 0 then
                print(string.format("^2[Rollers Server] ✅ Player %s purchased %s rollers (design: %s) for $%s^0", src, RollerStyle, itemId, price))
            else
                print(string.format("^6[Rollers Server] ✅ Player %s equipped %s rollers (design: %s)^0", src, RollerStyle, itemId))
            end
            print(string.format("^5[Rollers Server] ========== PURCHASE COMPLETED ==========^0"))
        end
    else
        if Config.Debug then
            print(string.format("^1[Rollers Server] ❌ Player %s does not have enough money! ($%s required)^0", src, price))
        end

        -- Show failure notification from Sport Hub language config
        exports['BDX-Sport-Hub']:ShowNotification(src, "failed", "error")

        TriggerClientEvent('Roller-Store:PurchaseFailed', src)
    end
end)

-- ════════════════════════════════════════════════════════════════
-- ⚠️  FRAMEWORK FUNCTIONS NOW HANDLED BY SPORT HUB
-- ════════════════════════════════════════════════════════════════
-- The following are now centralized in BDX-Sport-Hub/server/framework-bridge.lua:
--   - Useable item registration
--   - Money operations (get, add, remove)
--   - Inventory operations (give, remove, check)
--
-- All framework-specific code has been removed to reduce duplication
-- and make framework customization easier for users.
-- ════════════════════════════════════════════════════════════════
