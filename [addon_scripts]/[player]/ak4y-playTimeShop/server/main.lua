-- ============================================================================
-- AK4Y PlayTime Shop (QB / oldQB) with per-item purchase limits
-- - Add `repeatable = true` for unlimited purchases
-- - Or add `maxPurchases = N` to cap how many times an ID can be bought
-- - If neither is set, default limit is 1 (original behavior)
-- ============================================================================

AK4Y = AK4Y or {}
AK4Y.Framework = AK4Y.Framework or "qb"          -- "qb" | "oldqb"
AK4Y.Mysql     = AK4Y.Mysql or "oxmysql"         -- "oxmysql" | "ghmattimysql" | "mysql-async"
AK4Y.DefaultGarage = AK4Y.DefaultGarage or "pillboxgarage"

-- Optional: your webhook and Steam API key if used in UI
Discord_Webhook = Discord_Webhook or "CHANGE_WEBHOOK"
steamApiKey = steamApiKey or ""                  -- shown back to UI in callback (if you use it)

-- Example items (you likely already have these in a shared/config file)
-- id MUST be unique per shop entry
AK4Y.Items = AK4Y.Items or {
    { id = "VIP_CRATE",   itemType = "item",    itemName = "vip_crate", count = 1,  price = 100, maxPurchases = 5 },
    { id = "MONEY100K",   itemType = "money",   itemName = "money",     count = 100000, price = 50, repeatable = true },
    { id = "DRIFTZX",     itemType = "vehicle", itemName = "elegy",     count = 1,  price = 200 }, -- default limit 1
    { id = "PISTOL",      itemType = "weapon",  itemName = "weapon_pistol", count = 1, price = 75, maxPurchases = 2 },
}

-- ============================================================================
-- Framework init
-- ============================================================================
if AK4Y.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif AK4Y.Framework == "oldqb" then
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
else
    error("[ak4y-playtimeshop] Unsupported framework: "..tostring(AK4Y.Framework))
end

-- ============================================================================
-- DB helper (same interface you posted)
-- ============================================================================
function ExecuteSql(query)
    local IsBusy, result = true, nil
    if AK4Y.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data) result = data; IsBusy = false end)
        else
            MySQL.query(query, {}, function(data) result = data; IsBusy = false end)
        end
    elseif AK4Y.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data) result = data; IsBusy = false end)
    elseif AK4Y.Mysql == "mysql-async" then
        MySQL.Async.fetchAll(query, {}, function(data) result = data; IsBusy = false end)
    else
        print("^1[ak4y-playtimeshop] Invalid MySQL adapter:^0 "..tostring(AK4Y.Mysql))
        IsBusy = false
        result = {}
    end
    while IsBusy do Citizen.Wait(0) end
    return result
end

-- ============================================================================
-- Optional: Create tables if missing (safe to leave in)
-- ============================================================================
CreateThread(function()
    -- main player table (coins)
    ExecuteSql([[
        CREATE TABLE IF NOT EXISTS `ak4y_playtimeshop` (
            `id` INT NOT NULL AUTO_INCREMENT,
            `citizenid` VARCHAR(50) NOT NULL,
            `coin` INT NOT NULL DEFAULT 0,
            `firstName` VARCHAR(50),
            `lastName` VARCHAR(50),
            PRIMARY KEY (`id`),
            INDEX `idx_citizenid` (`citizenid`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    -- purchases table (no unique on citizenid+item_id so multiple rows allowed)
    ExecuteSql([[
        CREATE TABLE IF NOT EXISTS `ak4y_playtimeshop_purchases` (
            `id` INT NOT NULL AUTO_INCREMENT,
            `citizenid` VARCHAR(50) NOT NULL,
            `item_id` VARCHAR(64) NOT NULL,
            `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`),
            INDEX `idx_citizenid_item` (`citizenid`, `item_id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    -- redeemable codes
    ExecuteSql([[
        CREATE TABLE IF NOT EXISTS `ak4y_playtimeshop_codes` (
            `id` INT NOT NULL AUTO_INCREMENT,
            `code` VARCHAR(64) NOT NULL,
            `credit` INT NOT NULL DEFAULT 0,
            PRIMARY KEY (`id`),
            UNIQUE KEY `uniq_code` (`code`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])
end)

-- ============================================================================
-- Discord logging
-- ============================================================================
local DISCORD_NAME  = "AK4Y Scripts"
local DISCORD_IMAGE = "https://steamuserimages-a.akamaihd.net/ugc/848220336390493472/73E4DDF575623F925D0E727FBB0AE67EBFF6902E/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"
DiscordWebhook = Discord_Webhook

function SendToDiscord(title, message, color)
    if DiscordWebhook == "CHANGE_WEBHOOK" or not DiscordWebhook or DiscordWebhook == "" then return end
    local embeds = {{
        color = color or 65280,
        title = "**"..(title or "Log").."**",
        description = message or "",
        footer = { text = "AK4Y Playtime Shop" },
    }}
    PerformHttpRequest(DiscordWebhook, function(err, text, headers) end, 'POST',
        json.encode({ username = DISCORD_NAME, embeds = embeds, avatar_url = DISCORD_IMAGE }),
        { ['Content-Type'] = 'application/json' }
    )
end

-- ============================================================================
-- Top players cache (every 5 minutes)
-- ============================================================================
local topPlayers, todayReward = {}, 0
CreateThread(function()
    while true do
        topPlayers = ExecuteSql("SELECT firstName, lastName, coin FROM ak4y_playtimeshop ORDER BY coin DESC LIMIT 6") or {}
        Wait(5 * 60000)
    end
end)

-- ============================================================================
-- Helpers
-- ============================================================================
local function findShopItemById(id)
    for _, v in pairs(AK4Y.Items or {}) do
        if v.id == id then return v end
    end
end

local function getMaxPurchasesFor(item)
    if item.repeatable == true then return -1 end      -- unlimited
    if tonumber(item.maxPurchases) then return tonumber(item.maxPurchases) end
    return 1                                          -- default single purchase
end

local function getPurchaseCount(citizenId, itemId)
    local row = ExecuteSql("SELECT COUNT(*) AS cnt FROM ak4y_playtimeshop_purchases WHERE citizenid = '"..citizenId.."' AND item_id = '"..itemId.."'")
    return (row and row[1] and tonumber(row[1].cnt)) or 0
end

-- Safe plate generator (same as your snippet)
function GeneratePlate()
    local plate = QBCore.Shared.RandomStr(4) .. QBCore.Shared.RandomInt(4)
    local result = ExecuteSql("SELECT plate FROM player_vehicles WHERE plate = '"..plate.."'")
    if result[1] then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

-- ============================================================================
-- Callbacks
-- ============================================================================
QBCore.Functions.CreateCallback('ak4y-playTimeShop:getPlayerDetails', function(source, cb)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if not xPlayer then
        cb({ coin = 0, topPlayers = topPlayers, steamid = 0, steamApiKey = steamApiKey })
        return
    end

    local identifier = GetPlayerIdentifiers(src)[1] or "steam:0"
    local steamid = 0
    if identifier:find("steam:") then
        steamid = tonumber(identifier:gsub("steam:", ""), 16) or 0
    end

    local citizenId = xPlayer.PlayerData.citizenid
    local firstName = (xPlayer.PlayerData.charinfo and xPlayer.PlayerData.charinfo.firstname) or "Unknown"
    local lastName  = (xPlayer.PlayerData.charinfo and xPlayer.PlayerData.charinfo.lastname) or "Unknown"

    local result = ExecuteSql("SELECT * FROM ak4y_playtimeshop WHERE citizenid = '"..citizenId.."'")
    if not (result and result[1]) then
        ExecuteSql("INSERT INTO ak4y_playtimeshop SET citizenid = '"..citizenId.."', coin = '0', firstName = '"..firstName.."', lastName = '"..lastName.."'")
        cb({ coin = 0, topPlayers = topPlayers, steamid = steamid, steamApiKey = steamApiKey, todayRewardDay = todayReward })
        return
    end

    cb({
        coin = tonumber(result[1].coin) or 0,
        topPlayers = topPlayers,
        steamid = steamid,
        steamApiKey = steamApiKey,
        todayRewardDay = todayReward
    })
end)

QBCore.Functions.CreateCallback('ak4y-playTimeShop:buyItem', function(source, cb, data, mods)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if not xPlayer then
        cb({ success = false, message = "Player not found." }); return
    end

    if not data or not data.itemInfo or not data.itemInfo.id then
        cb({ success = false, message = "Invalid item data." }); return
    end

    local citizenId = xPlayer.PlayerData.citizenid
    local selectedItem = findShopItemById(data.itemInfo.id)
    if not selectedItem then
        cb({ success = false, message = "Item not found in shop." }); return
    end

    -- Purchase limit logic
    local maxPurchases = getMaxPurchasesFor(selectedItem)
    local previousCount = getPurchaseCount(citizenId, selectedItem.id)
    if maxPurchases ~= -1 and previousCount >= maxPurchases then
        cb({ success = false, message = ("Purchase limit reached (%d)."):format(maxPurchases) })
        return
    end

    -- Coin check
    local coinRow = ExecuteSql("SELECT coin FROM ak4y_playtimeshop WHERE citizenid = '"..citizenId.."'")
    if not (coinRow and coinRow[1]) then
        cb({ success = false, message = "No coin data found." }); return
    end

    local playerCoins = tonumber(coinRow[1].coin) or 0
    local price = tonumber(selectedItem.price) or 0
    if playerCoins < price then
        cb({ success = false, message = "Not enough coins." }); return
    end

    -- Deduct coins
    ExecuteSql("UPDATE ak4y_playtimeshop SET coin = coin - '"..price.."' WHERE citizenid = '"..citizenId.."'")

    -- Record purchase (multiple rows allowed)
    ExecuteSql("INSERT INTO ak4y_playtimeshop_purchases (citizenid, item_id) VALUES ('"..citizenId.."', '"..selectedItem.id.."')")

    -- Grant reward
    local myItem   = selectedItem.itemName
    local count    = tonumber(selectedItem.count) or 1
    local itemType = selectedItem.itemType

    if itemType == "item" then
        xPlayer.Functions.AddItem(myItem, count)

    elseif itemType == "weapon" then
        for i = 1, count do
            xPlayer.Functions.AddItem(myItem, 1)
        end

    elseif itemType == "vehicle" then
        for i = 1, count do
            local plate = GeneratePlate()
            if type(mods) ~= "table" then mods = {} end
            mods.plate = plate
            ExecuteSql("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage_id, state, in_garage) VALUES ('"
                ..xPlayer.PlayerData.license.."', '"
                ..citizenId.."', '"
                ..myItem.."', '"
                ..GetHashKey(myItem).."', '"
                ..json.encode(mods).."', '"
                ..plate.."', '"
                ..AK4Y.DefaultGarage.."', 1, 1)"
            )
        end

    elseif itemType == "money" then
        xPlayer.Functions.AddMoney('bank', count)

    else
        -- Fallback treat as item
        xPlayer.Functions.AddItem(myItem, count)
    end

    SendToDiscord(
        "Item Purchase",
        ("**Name:** %s\n**Character Name:** %s %s\n**Citizen ID:** %s\n**Purchased Item:** %s\n**Amount:** %s\n**Times Owned (now):** %d")
            :format(
                xPlayer.PlayerData.name or "Unknown",
                (xPlayer.PlayerData.charinfo and xPlayer.PlayerData.charinfo.firstname) or "Unknown",
                (xPlayer.PlayerData.charinfo and xPlayer.PlayerData.charinfo.lastname) or "Unknown",
                xPlayer.PlayerData.citizenid or "Unknown",
                tostring(selectedItem.itemName),
                tostring(count),
                previousCount + 1
            ),
        65280
    )

    cb({ success = true, message = "You successfully purchased the item." })
end)

QBCore.Functions.CreateCallback('ak4y-playTimeShop:sendInput', function(source, cb, data)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if not xPlayer then cb(false); return end

    local citizenId = xPlayer.PlayerData.citizenid
    local inputData = (data and data.input) or ""
    if inputData == "" then cb(false); return end

    local result = ExecuteSql("SELECT * FROM ak4y_playtimeshop_codes WHERE code = '"..inputData.."'")
    if result and result[1] then
        ExecuteSql("DELETE FROM ak4y_playtimeshop_codes WHERE code = '"..inputData.."'")
        ExecuteSql("UPDATE ak4y_playtimeshop SET coin = coin + '"..result[1].credit.."' WHERE citizenid = '"..citizenId.."'")
        SendToDiscord("Code Redeemed",
            ("CitizenID: ``%s``\nCredit: ``%s``\nCode: ``%s``\nUsed code!"):format(citizenId, tostring(result[1].credit), inputData),
            3447003
        )
        cb(result[1].credit)
    else
        cb(false)
    end
end)

-- ============================================================================
-- Events / Commands
-- ============================================================================
RegisterNetEvent('ak4y-playTimeShop:addCoin', function(amount)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if not xPlayer then return end
    local citizenId = xPlayer.PlayerData.citizenid
    local deger = tonumber(amount) or 0
    if deger <= 0 then return end
    ExecuteSql("UPDATE ak4y_playtimeshop SET coin = coin + '"..deger.."' WHERE citizenid = '"..citizenId.."'")
end)

local inProgress = false
RegisterCommand('purchase_playtime_credit', function(source, args)
    local src = source
    if src ~= 0 then return end -- server console only

    if not args[1] then
        print("^1[ak4y-playtimeshop]^0 Usage: purchase_playtime_credit '{\"transid\":\"CODE123\",\"credit\":100}'")
        return
    end

    local ok, dec = pcall(json.decode, args[1])
    if not ok or type(dec) ~= "table" then
        print("^1[ak4y-playtimeshop]^0 Invalid JSON payload.")
        return
    end

    local tbxid  = dec.transid
    local credit = tonumber(dec.credit) or 0
    if not tbxid or tbxid == "" or credit <= 0 then
        print("^1[ak4y-playtimeshop]^0 transid and positive credit required.")
        return
    end

    while inProgress do Wait(1000) end
    inProgress = true

    local result = ExecuteSql("SELECT * FROM ak4y_playtimeshop_codes WHERE code = '"..tbxid.."'")
    if not (result and result[1]) then
        ExecuteSql("INSERT INTO ak4y_playtimeshop_codes (code, credit) VALUES ('"..tbxid.."', '"..credit.."')")
        SendToDiscord("Console Code Insert",
            ("Code: ``%s``\nCredit: ``%d``\nSuccessfully inserted into database!"):format(tbxid, credit),
            16776960
        )
        print("^2[ak4y-playtimeshop]^0 Inserted code: "..tbxid.." ("..credit..")")
    else
        print("^3[ak4y-playtimeshop]^0 Code already exists: "..tbxid)
    end

    inProgress = false
end)
