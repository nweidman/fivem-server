-- Optimized Query table with constants and prepared statements
local Query = {
    SELECT_PROFILES = 'SELECT * FROM `0resmon_craft_profiles`',
    UPDATE_PROFILE = 'UPDATE `0resmon_craft_profiles` SET exp = ? WHERE identifier = ?',
    INSERT_PROFILE = 'INSERT IGNORE INTO `0resmon_craft_profiles` (identifier) VALUES (?)',
}

-- Checking the existence of the database table, if it does not exist, it is created
Citizen.CreateThreadNow(function()
    Citizen.Wait(0)

    local success, result = pcall(MySQL.scalar.await, 'SELECT 1 FROM 0resmon_craft_profiles')

    if not success then
        MySQL.query([[CREATE TABLE `0resmon_craft_profiles` (
			`id` INT AUTO_INCREMENT PRIMARY KEY,
			`identifier` varchar(255) NOT NULL UNIQUE,
            `exp` INT DEFAULT 0,
            `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
		)]])
        lib.print.info('Database Table `0resmon_craft_profiles` created !')
    end
end)

-- Database module
local db = {}

function db.loadProfiles()
    return MySQL.query.await(Query.SELECT_PROFILES)
end

---@param identifier string
---@param data Profile
function db.updateProfile(identifier, data)
    return MySQL.prepare(Query.UPDATE_PROFILE, { data.exp, identifier })
end

---@param identifier string
function db.createPlayer(identifier)
    return MySQL.insert(Query.INSERT_PROFILE, { identifier })
end

return db
