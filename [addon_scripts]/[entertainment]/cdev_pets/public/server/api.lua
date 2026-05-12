PetResourceAPI = {}

--- Shop API: CanPurchaseItem / ChargeItem use cash or custom currency (config customCurrency).
--- Custom currency is validated and charged via clib.api.Character (cdev_lib). Implement GetCustomCurrencyFromSource and RemoveCustomCurrencyFromSource in cdev_lib for your currency types (e.g. crypto, vip_coins).
PetResourceAPI.Shop = {
    ---@param source number
    ---@param item PetShopItem
    ---@param quantity number
    CanPurchaseItem = function(source, item, quantity)
        if item.customCurrency then
            for currencyType, amount in pairs(item.customCurrency) do
                local required = (tonumber(amount) or 0) * quantity

                local hasCustomCurrency, errorMsg = PetResourceAPI.Shop.ValidateCustomCurrency(source, currencyType,
                    required)
                if not hasCustomCurrency then
                    local currencyDisplayName = clib.localizer.get("currency_" .. currencyType) or
                        currencyType:gsub("_", " ")
                    return false,
                        errorMsg or clib.localizer.get("not_enough_currency"):gsub("{currency}", currencyDisplayName)
                end
            end

            return true
        end

        local hasMoney = clib.api.Character.GetCharacterBankFromSource(source) >= (tonumber(item.price) or 0) * quantity

        if not hasMoney then
            return false, loc("not_enough_money")
        end

        return true
    end,
    ---@param source number
    ---@param item PetShopItem
    ---@param quantity number
    ChargeItem = function(source, item, quantity)
        if item.customCurrency then
            for currencyType, amount in pairs(item.customCurrency) do
                local required = (tonumber(amount) or 0) * quantity
                PetResourceAPI.Shop.ChargeCustomCurrency(source, currencyType, required)
            end

            return
        end

        clib.api.Character.RemoveCharacterBankFromSource(source, (tonumber(item.price) or 0) * quantity)
    end,

    ---@param source number
    ---@param currencyType string e.g. "crypto", "vip_coins" (must be implemented in cdev_lib GetCustomCurrencyFromSource)
    ---@param amount number
    ---@return boolean success
    ---@return string? errorMessage
    ValidateCustomCurrency = function(source, currencyType, amount)
        local balance = clib.api.Character.GetCustomCurrencyFromSource(source, currencyType)
        if balance >= amount then
            return true
        end
        local currencyDisplayName = clib.localizer.get("vip_coins") or "VIP Coins"
        return false, clib.localizer.get("not_enough_currency"):gsub("{currency}", currencyDisplayName)
    end,

    ---@param source number
    ---@param currencyType string
    ---@param amount number
    ChargeCustomCurrency = function(source, currencyType, amount)
        clib.api.Character.RemoveCustomCurrencyFromSource(source, currencyType, amount)
    end,
}

PetResourceAPI.GetPetOwnerIdFromSource = function(source)
    return clib.api.Character.GetCharacterIdentifierFromSource(source)
end

PetResourceAPI.GetCharacterNameFromIdentifier = function(citizenid)
    return clib.api.Character.GetCharacterNameFromIdentifier(citizenid)
end

--- Returns true if the player is allowed to buy and (when BlockK9SpawnWhenNoPermission is true) spawn K9 pets.
--- Uses PublicSharedPetsConfig.K9.AllowedJobsToBuyAndSpawn; override this function for custom logic.
PetResourceAPI.IsPlayerAllowedToBuyK9 = function(source)
    local jobName, _ = clib.api.Character.GetCharacterJobFromSource(source)
    if not jobName or type(jobName) ~= "string" then
        return false
    end

    local allowed = PublicSharedPetsConfig and PublicSharedPetsConfig.K9 and PublicSharedPetsConfig.K9.AllowedJobsToBuyAndSpawn
    if not allowed or type(allowed) ~= "table" or #allowed == 0 then
        allowed = { "police" }
    end

    local jobLower = string.lower(tostring(jobName))
    for _, allowedJob in ipairs(allowed) do
        if type(allowedJob) == "string" and string.lower(allowedJob) == jobLower then
            return true
        end
    end

    return false
end

--- Returns true if the player can perform veterinarian actions (quick heal, table treatment).
--- Checks: 1) Job in Veterinary.AllowedVeterinarianJobs (config), 2) Player Shop employee with Veterinary role.
PetResourceAPI.IsPlayerAllowedToBeVeterinarian = function(source)
    local jobName, grade = clib.api.Character.GetCharacterJobFromSource(source)
    if not jobName then return false end

    local jobLower = string.lower(tostring(jobName))
    local gradeNum = tonumber(grade) or 0

    -- Config list: any of these jobs (any grade) can act as vet
    local allowed = PublicSharedPetsConfig.PlayerShop and PublicSharedPetsConfig.PlayerShop.Veterinary and PublicSharedPetsConfig.PlayerShop.Veterinary.AllowedVeterinarianJobs
    if allowed and type(allowed) == "table" then
        for _, allowedJob in ipairs(allowed) do
            if type(allowedJob) == "string" and string.lower(allowedJob) == jobLower then
                return true
            end
        end
    end

    -- Player Shop employee with Veterinary role (existing behavior)
    if string.find(jobLower, "petshop") and gradeNum >= PlayerShop.Roles.VETERINARY and gradeNum < PlayerShop.Roles.MANAGER then
        return true
    end

    return false
end

PetResourceAPI.HasMoney = function(source, amount)
    return clib.api.Character.GetCharacterBankFromSource(source) >= amount
end

PetResourceAPI.Charge = function(source, amount)
    clib.api.Character.RemoveCharacterBankFromSource(source, amount)
end

PetResourceAPI.CheckHasMoneyToDepositToVault = function(source, amount)
    if PublicSharedPetsConfig.UseBankInsteadOfCash then
        return clib.api.Character.GetCharacterBankFromSource(source) >= amount
    else
        return clib.api.Character.GetCharacterCashFromSource(source) >= amount
    end
end

PetResourceAPI.ChargePlayerForDepositToVault = function(source, amount)
    if PublicSharedPetsConfig.UseBankInsteadOfCash then
        clib.api.Character.RemoveCharacterBankFromSource(source, amount)
    else
        clib.api.Character.RemoveCharacterBankFromSource(source, amount)
    end
end

PetResourceAPI.GiveMoneyToPlayerFromVault = function(source, amount)
    if PublicSharedPetsConfig.UseBankInsteadOfCash then
        clib.api.Character.AddCharacterBankForSource(source, amount)
    else
        clib.api.Character.AddCharacterCashForSource(source, amount)
    end
end


-- 📦 Database queries
PetResourceAPI.Queries = {

    CreatePetsTable = function()
        clib.db.Insert([[
            CREATE TABLE IF NOT EXISTS `cdev_pets` (
                `id` bigint(20) NOT NULL AUTO_INCREMENT,
                `key` varchar(50) NOT NULL,
                `owner` varchar(255) NOT NULL,
                `name` text NOT NULL,
                `stamina` int(11) NOT NULL DEFAULT 100,
                `loyalty` int(11) NOT NULL DEFAULT 100,
                `happiness` int(11) NOT NULL DEFAULT 100,
                `hunger` int(11) NOT NULL DEFAULT 100,
                `health` int(11) NOT NULL DEFAULT 100,
                `thirst` int(11) NOT NULL DEFAULT 100,
                `sniff` int(11) NOT NULL DEFAULT 0,
                `resistance` int(11) NOT NULL DEFAULT 0,
                `agility` int(11) NOT NULL DEFAULT 0,
                `attack` int(11) NOT NULL DEFAULT 0,
                `customization` longtext,
                `props` longtext,
                `escaped` tinyint(1) NOT NULL DEFAULT 0,
                `petshopid` varchar(255) NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        clib.db.Update("UPDATE `cdev_pets` SET `customization` = '{}' WHERE `customization` IS NULL")
        clib.db.Update("UPDATE `cdev_pets` SET `props` = '{}' WHERE `props` IS NULL")
    end,
    AddPetShopIdToPets = function()
        local exists = clib.db.Query("SHOW COLUMNS FROM `cdev_pets` LIKE 'petshopid'")

        if #exists == 0 then
            clib.db.Query([[
                ALTER TABLE `cdev_pets` ADD COLUMN `petshopid` varchar(255) NOT NULL
            ]])
        end
    end,
    CreatePetInventoryTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_inventory` (
              `id` bigint(20) NOT NULL AUTO_INCREMENT,
              `inventory` bigint(20) NOT NULL,
              `item` varchar(100) NOT NULL,
              `slot` int(11) NOT NULL,
              `quantity` int(11) NOT NULL,
              `metadata` longtext,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
    end,
    ---@param petId number
    ---@return InventoryItemRow[]
    FetchInventoryItems = function(petId)
        return clib.db.Query("SELECT * FROM cdev_pets_inventory WHERE inventory = ?", { petId })
    end,
    ---@param item InventoryItemRow
    UpdateInventoryItem = function(item)
        clib.db.Insert([[
            UPDATE cdev_pets_inventory SET
                inventory = ?,
                item = ?,
                slot = ?,
                quantity = ?,
                metadata = ?
            WHERE
                id = ?
        ]], {
            item.inventory,
            item.item,
            item.slot,
            item.quantity,
            item.metadata,
            item.id,
        })
    end,
    ---@param item InventoryItemRow
    DeleteInventoryItem = function(item)
        clib.db.Insert("DELETE FROM cdev_pets_inventory WHERE id = ?", {
            item.id,
        })
    end,
    ---@param item InventoryItemRow
    ---@return number
    InsertInventoryItem = function(item)
        return clib.db.Insert(
            "INSERT INTO cdev_pets_inventory(inventory, item, slot, quantity, metadata) values(?, ?, ?, ?, ?)", {
                item.inventory,
                item.item,
                item.slot,
                item.quantity,
                item.metadata
            })
    end,
    ---@return PetDBRow[]
    FetchPet = function(petId)
        return clib.db.Query("SELECT * FROM cdev_pets WHERE id = ?", { petId })
    end,
    ---@param petId number
    ---@param name PetStat
    ---@param value number
    UpdateStat = function(petId, name, value)
        clib.db.Update("UPDATE cdev_pets SET " .. name .. " = ? WHERE id = ?", { value, petId })
    end,

    ---@param petId number
    DeletPet = function(petId)
        clib.db.Insert("DELETE FROM cdev_pets WHERE id = ?", {
            petId
        })
    end,
    ---@param ownerId string
    ---@param name string
    ---@param key string
    InsertPet = function(ownerId, name, key, petshopid, customization, skills)
        return clib.db.Insert(
            "INSERT INTO cdev_pets(owner, `key`, `petshopid`, `name`, customization, props, sniff, resistance, agility, attack) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            {
                ownerId,
                key,
                petshopid,
                name,
                json.encode(customization or {}),
                json.encode({}),
                skills.sniff or 0,
                skills.resistance or 0,
                skills.agility or 0,
                skills.attack or 0
            })
    end,
    ---@param ownerId string
    ---@return PetBagEntry[]
    FetchBag = function(ownerId)
        return clib.db.Query("SELECT id, name, stamina, health, `escaped` FROM cdev_pets WHERE owner = ?", { ownerId })
    end,
    ---@param petId number
    UpdateCustomization = function(petId, customization)
        clib.db.Update("UPDATE cdev_pets SET customization = ? WHERE id = ?", { json.encode(customization), petId })
    end,
    ---@param petId number
    UpdateProps = function(petId, props)
        clib.db.Update("UPDATE cdev_pets SET props = ? WHERE id = ?", { json.encode(props), petId })
    end,
    ---@param petId number
    ---@param escaped boolean
    SetEscaped = function(petId, escaped)
        clib.db.Update("UPDATE cdev_pets SET `escaped` = ? WHERE id = ?", { escaped and 1 or 0, petId })
    end,
    -- PetShop
    CreatePetShopsTable = function()
        clib.db.Insert([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) NOT NULL DEFAULT '',
              `blip` int(11) NOT NULL DEFAULT 0,
              `blipSize` float DEFAULT 1.0,
              `blipColor` int(11) NOT NULL DEFAULT 0,
              `blipLocation` longtext,
              `petsellersLocation` longtext,
              `sellersLocation` longtext,
              `management` longtext,
              `settings` longtext,
              `logo` varchar(255) NOT NULL DEFAULT '',
              `vault` bigint(20) NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
    end,
    --- Migrates existing vault column from INT to BIGINT (supports values > 2.1B).
    MigrateVaultToBigint = function()
        local col = clib.db.Query("SHOW COLUMNS FROM `cdev_pets_petshops` LIKE 'vault'")
        if #col == 0 then return end
        local typ = (col[1].Type or ""):lower()
        if typ:find("^int%(") then
            clib.db.Query([[
                ALTER TABLE `cdev_pets_petshops`
                MODIFY COLUMN `vault` bigint(20) NOT NULL DEFAULT 0
            ]])
        end
    end,
    CreatePetShopStockTable = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_stock` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `item_id` varchar(255) NOT NULL,
              `amount` int(11) NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`),
              KEY `shop_item_idx` (`shop_id`, `item_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]])
    end,
    CreatePetShopEmployees = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_employees` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `identifier` varchar(255) NOT NULL,
              `role` int(11) NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`),
              KEY `shop_identifier_idx` (`shop_id`, `identifier`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]])
    end,
    CreatePetShopSellPrices = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_sell_prices` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `item_id` varchar(255) NOT NULL,
              `price` int(11) NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`),
              KEY `shop_item_idx` (`shop_id`, `item_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]])
    end,
    CreatePetShopSales = function()
        clib.db.Query([[
            CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_sales` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `shop_id` int(11) NOT NULL,
              `identifier` varchar(255) NOT NULL,
              `price` int(11) NOT NULL DEFAULT 0,
              `items` longtext,
              `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
              PRIMARY KEY (`id`),
              KEY `shop_date_idx` (`shop_id`, `date`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        clib.db.Update("UPDATE `cdev_pets_petshops_sales` SET `items` = '{}' WHERE `items` IS NULL")
    end,
    InsertShop = function(name, logo, blip, blipSize, blipColor, blipLocation, petsellersLocation, sellersLocation,
                          management, settings, vaultMoney)
        clib.db.Insert([[
            INSERT INTO cdev_pets_petshops(id, name, logo, blip, blipSize, blipColor, blipLocation, petsellersLocation, sellersLocation, management, settings, vault)
            VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ]], {
            name,
            logo,
            blip,
            blipSize,
            blipColor,
            blipLocation,
            petsellersLocation,
            sellersLocation,
            management,
            settings,
            vaultMoney,
        })
    end,
    UpdateShop = function(name, logo, blip, blipSize, blipColor, blipLocation, petsellersLocation, sellersLocation,
                          management, settings, vaultMoney, id)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET name = ?, logo = ?, blip = ?, blipSize = ?, blipColor = ?, blipLocation = ?, petsellersLocation = ?, sellersLocation = ?, management = ?, settings = ?, vault = ?
            WHERE id = ?
            ]], {
            name,
            logo,
            blip,
            blipSize,
            blipColor,
            blipLocation,
            petsellersLocation,
            sellersLocation,
            management,
            settings,
            vaultMoney,
            id
        })
    end,
    DeleteShop = function(id)
        clib.db.Update("DELETE FROM cdev_pets_petshops WHERE id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_stock WHERE shop_id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_employees WHERE shop_id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_sell_prices WHERE shop_id = ?", { id })
        clib.db.Update("DELETE FROM cdev_pets_petshops_sales WHERE shop_id = ?", { id })
    end,
    UpdatepetsellersLocation = function(petsellersLocation, id)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET petsellersLocation = ?
            WHERE id = ?
        ]], {
            petsellersLocation,
            id
        })
    end,
    UpdateSellersLocation = function(sellersLocation, id)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET sellersLocation = ?
            WHERE id = ?
        ]], {
            sellersLocation,
            id
        })
    end,
    fetchSellersLocation = function(id)
        return clib.db.Query("SELECT sellersLocation FROM cdev_pets_petshops WHERE id = ?", { id })
    end,
    fetchPetSellersLocation = function(id)
        return clib.db.Query("SELECT petsellersLocation FROM cdev_pets_petshops WHERE id = ?", { id })
    end,
    FetchEmployeeMapFromShop = function(shop_id)
        local employees = clib.db.Query("SELECT * FROM cdev_pets_petshops_employees WHERE shop_id = ?", { shop_id })
        for _, employee in pairs(employees) do
            employee.name = PetResourceAPI.GetCharacterNameFromIdentifier(employee.identifier)
        end
        return employees
    end,
    FetchStockFromShop = function(shop_id)
        -- Agrupa por (shop_id, item_id) e soma amount para evitar duplicados na lista (ex.: quando stock foi a 0 e depois adicionou de novo)
        return clib.db.Query([[
            SELECT s.shop_id, s.item_id, SUM(s.amount) AS amount,
                (SELECT COALESCE(price, 0) FROM cdev_pets_petshops_sell_prices p WHERE p.shop_id = s.shop_id AND p.item_id = s.item_id LIMIT 1) AS price
            FROM cdev_pets_petshops_stock s
            WHERE s.shop_id = ?
            GROUP BY s.shop_id, s.item_id
        ]], { shop_id })
    end,
    FetchSellPricesFromShop = function(shop_id)
        return clib.db.Query("SELECT * FROM cdev_pets_petshops_sell_prices WHERE shop_id = ?", { shop_id })
    end,
    FetchPetShops = function()
        return clib.db.Query("SELECT * FROM cdev_pets_petshops")
    end,
    UpdatePetShopEmployee = function(employeeRole, employeeIdentifier, shopId)
        clib.db.Update([[UPDATE cdev_pets_petshops_employees SET role = ? WHERE identifier = ? AND shop_id = ?]],
            { employeeRole, employeeIdentifier, shopId })
    end,
    InsertPetShopSale = function(shopId, identifier, price, items)
        clib.db.Insert(
            [[INSERT INTO cdev_pets_petshops_sales(id, shop_id, identifier, price, items, date) VALUES(NULL, ?, ?, ?, ?, NULL)]],
            { shopId, identifier, price, items or '{}' })
    end,
    FetchPetShopSales = function(shopId, limit)
        limit = limit or 100
        local sales = clib.db.Query(
            "SELECT * FROM cdev_pets_petshops_sales WHERE shop_id = ? ORDER BY id DESC LIMIT ?",
            { shopId, limit }
        )
        for _, sale in pairs(sales) do
            sale.name = PetResourceAPI.GetCharacterNameFromIdentifier(sale.identifier)
            sale.items = json.decode(sale.items)
        end
        return sales
    end,
    InsertPetShopEmployee = function(employeeIdentifier, employeeRole, shopId)
        clib.db.Update([[
            INSERT INTO cdev_pets_petshops_employees(id, identifier, role, shop_id)
            VALUES(NULL, ?, ?, ?)]],
            { employeeIdentifier, employeeRole, shopId })
    end,
    DeletePetShopEmployee = function(employeeIdentifier, shopId)
        clib.db.Update([[
            DELETE FROM cdev_pets_petshops_employees
            WHERE identifier = ? AND shop_id = ?
        ]], {
            employeeIdentifier,
            shopId,
        }
        )
    end,
    UpdatePetShopStockEntry = function(amount, itemId, shopId)
        clib.db.Update([[
            UPDATE cdev_pets_petshops_stock
            SET amount = ?
            WHERE item_id = ? AND shop_id = ?
        ]], {
            amount,
            itemId,
            shopId,
        })
        -- Remove linhas duplicadas (mantém só a de menor id) para o mesmo (shop_id, item_id)
        clib.db.Update([[
            DELETE s1 FROM cdev_pets_petshops_stock s1
            INNER JOIN cdev_pets_petshops_stock s2
            ON s1.shop_id = s2.shop_id AND s1.item_id = s2.item_id AND s1.id > s2.id
            WHERE s1.shop_id = ? AND s1.item_id = ?
        ]], { shopId, itemId })
    end,
    UpdateShopVault = function(vault, shopId)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET vault = ?
            WHERE id = ?
        ]], {
            vault,
            shopId
        })
    end,
    InsertPetShopStockEntry = function(shopId, itemId, amount)
        clib.db.Insert([[
            INSERT INTO cdev_pets_petshops_stock(id, shop_id, item_id, amount)
            VALUES(NULL, ?, ?, ?)
        ]], {
            shopId,
            itemId,
            amount,
        })
    end,
    InsertPetShopShopPrice = function(shopId, itemId, price)
        clib.db.Insert([[
            INSERT INTO cdev_pets_petshops_sell_prices(id, shop_id, item_id, price)
            VALUES(NULL, ?, ?, ?)
        ]], {
            shopId,
            itemId,
            price,
        })
    end,
    UpdatePetShopShopPrice = function(shopId, itemId, price)
        clib.db.Update([[
            UPDATE cdev_pets_petshops_sell_prices
            SET price = ?
            WHERE item_id = ? AND shop_id = ?
        ]], {
            price,
            itemId,
            shopId,
        })
    end,
    DeletePetShopStockEntry = function(itemId, shopId)
        clib.db.Update([[
            DELETE FROM cdev_pets_petshops_stock
            WHERE item_id = ? AND shop_id = ?
        ]], {
            itemId,
            shopId,
        })
    end,

    FetchAllPets = function()
        return clib.db.Query("SELECT * FROM cdev_pets")
    end,

    -- Veterinary Tables Management
    UpdateVetTables = function(vetTablesJson, shopId)
        clib.db.Update([[
            UPDATE cdev_pets_petshops
            SET vetTables = ?
            WHERE id = ?
        ]], {
            vetTablesJson,
            shopId
        })
    end,

    AddVetTablesColumn = function()
        local exists = clib.db.Query("SHOW COLUMNS FROM `cdev_pets_petshops` LIKE 'vetTables'")

        if #exists == 0 then
            clib.db.Query([[
                ALTER TABLE `cdev_pets_petshops`
                ADD COLUMN `vetTables` LONGTEXT DEFAULT '[]'
            ]])
        end
    end,

    ---@return table[] All pets with owner info
    FetchAllPetsWithOwners = function()
        return clib.db.Query([[
            SELECT
                id,
                name,
                owner,
                `key` as model,
                petshopid as PetShopId,
                health,
                hunger,
                thirst,
                stamina,
                loyalty,
                happiness
            FROM cdev_pets
            ORDER BY id DESC
        ]])
    end,

    ---@param petId number
    ---@return boolean success
    AdminDeletePet = function(petId)
        -- Delete pet inventory first
        clib.db.Update("DELETE FROM cdev_pets_inventory WHERE inventory = ?", { petId })

        -- Delete pet
        clib.db.Update("DELETE FROM cdev_pets WHERE id = ?", { petId })

        return true
    end,

    ---@param ownerId string
    ---@return table[] Owner's pets for transfer
    FetchOwnerPetsForTransfer = function(ownerId)
        return clib.db.Query([[
        SELECT
            id,
            name,
            owner,
            `key` as model,
            petshopid as PetShopId,
            health,
            hunger,
            thirst,
            stamina,
            loyalty,
            happiness,
            sniff,
            resistance,
            agility,
            attack,
            `escaped`
        FROM cdev_pets
        WHERE owner = ? AND `escaped` = 0
        ORDER BY id DESC
    ]], { ownerId })
    end,

}
