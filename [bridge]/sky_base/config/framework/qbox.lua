if Sky.Config.framework == "qbox" then
    Sky.FW = {}


    if IsDuplicityVersion() then goto server end
    -- Client Side from here

    --Update Hunger and Thirst
    RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
        TriggerEvent("sky_base:updateHungerAndThirst", newHunger, newThirst)
    end)

    -- Is Player Loaded
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        TriggerEvent("sky_base:playerLoaded")
    end)

    --Update Money
    RegisterNetEvent('QBCore:Client:OnMoneyChange', function(account, amount, isMinus)
        local newMoney = exports.qbx_core:GetPlayerData().money[account]
        TriggerEvent("sky_base:updateAccountMoney", account, newMoney)
    end)

    --Entered Car and Left
    RegisterNetEvent('QBCore:Client:VehicleInfo', function(data)
        if data.event == "Entered" then
            TriggerEvent("sky_base:enteredVehicle", data.vehicle, data.plate, data.seat)
        elseif data.event == "Left" then
            TriggerEvent("sky_base:exitedVehicle", data.vehicle, data.plate, data.seat)
        end
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
        TriggerEvent("sky_base:updateJob", JobInfo)
        TriggerServerEvent("sky_base:updateJob", JobInfo)
    end)

    --Added Item
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        TriggerEvent("sky_base:inventoryUpdated")
    end)

    ::server::
    if not IsDuplicityVersion() then return end
    -- Server Side from here


    RegisterNetEvent("QBCore:Server:PlayerLoaded", function(xPlayer)
        TriggerEvent("sky_base:playerLoaded", xPlayer.PlayerData.source)
    end)


    function Sky.FW.RegisterUsableItem(name, callback)
        exports.qbx_core:CreateUseableItem(name, callback)
    end

    function Sky.FW.IsPlayerOnline(sourceOrIdentifier)
        local xPlayer = exports.qbx_core:GetPlayer(sourceOrIdentifier)
        if xPlayer == nil then
            xPlayer = exports.qbx_core:GetPlayerByCitizenId(tostring(sourceOrIdentifier))
            if xPlayer == nil then
                return false
            else
                return xPlayer.PlayerData.source
            end
        else
            return xPlayer.PlayerData.citizenid
        end
    end

    function Sky.FW.GetIdentifier(source)
        local xPlayer = exports.qbx_core:GetPlayer(tonumber(source))
        if not xPlayer then
            Sky.Debug("debug", "[Sky.FW.GetIdentifier] Player not found for source: " .. tostring(source))
            return
        end
        return tostring(xPlayer.PlayerData.citizenid)
    end

    function Sky.FW.GetName(sourceOrIdentifier)
        local xPlayer = exports.qbx_core:GetPlayer(sourceOrIdentifier)

        if not xPlayer then
            xPlayer = exports.qbx_core:GetOfflinePlayer(sourceOrIdentifier)
        end

        if not xPlayer or not xPlayer.PlayerData or not xPlayer.PlayerData.charinfo then
            return "Unknown Player"
        end

        return Sky.String.SanitizeForSQL(string.format(
            "%s %s",
            xPlayer.PlayerData.charinfo.firstname or "",
            xPlayer.PlayerData.charinfo.lastname or ""
        ))
    end

    function Sky.FW.GetFirstname(sourceOrIdentifier)
        local xPlayer = exports.qbx_core:GetPlayer(sourceOrIdentifier)
        if xPlayer == nil then xPlayer = exports.qbx_core:GetOfflinePlayer(sourceOrIdentifier) end
        if not xPlayer or not xPlayer.PlayerData or not xPlayer.PlayerData.charinfo then return end
        return Sky.String.SanitizeForSQL(xPlayer.PlayerData.charinfo.firstname)
    end

    function Sky.FW.GetLastname(sourceOrIdentifier)
        local xPlayer = exports.qbx_core:GetPlayer(sourceOrIdentifier)
        if xPlayer == nil then xPlayer = exports.qbx_core:GetOfflinePlayer(sourceOrIdentifier) end
        if not xPlayer or not xPlayer.PlayerData or not xPlayer.PlayerData.charinfo then return end
        return Sky.String.SanitizeForSQL(xPlayer.PlayerData.charinfo.lastname)
    end

    function Sky.FW.GetGender(source)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if not xPlayer then return end
        return xPlayer.PlayerData.charinfo.gender
    end

    function Sky.FW.GetBirthdate(source)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if not xPlayer then return end
        local charInfo = xPlayer.PlayerData and xPlayer.PlayerData.charinfo
        if type(charInfo) ~= "table" then return end
        return charInfo.birthdate
    end

    function Sky.FW.GetAccountMoney(source, account)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if account == "money" then
            account = "cash"
        elseif account == "black_money" then
            account = "black"
        end
        return xPlayer.PlayerData.money[account]
    end

    function Sky.FW.AddAccountMoney(source, account, amount)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if account == "money" then
            account = "cash"
        elseif account == "black_money" then
            account = "black"
        end
        xPlayer.Functions.AddMoney(account, amount)
    end

    function Sky.FW.RemoveAccountMoney(source, account, amount)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if account == "money" then
            account = "cash"
        elseif account == "black_money" then
            account = "black"
        end
        if xPlayer.PlayerData.money[account] >= amount then
            xPlayer.Functions.RemoveMoney(account, amount)
            return true
        end
        return false
    end

    function Sky.FW.GetSharedAccountBalance(name)
        if GetResourceState("qs-banking") == "started" then
            local accountBalance = exports["qs-banking"]:GetAccountBalance(name)
            if accountBalance ~= nil then
                return accountBalance
            end
            return 0
        end
        local accountBalance = exports['Renewed-Banking']:getAccountMoney(name)
        return accountBalance
    end

    function Sky.FW.AddSharedAccountBalance(name, amount)
        if GetResourceState("qs-banking") == "started" then
            exports["qs-banking"]:AddMoney(name, amount, "sky_base")
            return
        end
        exports['Renewed-Banking']:addAccountMoney(name, amount)
    end

    function Sky.FW.RemoveSharedAccountBalance(name, amount)
        if GetResourceState("qs-banking") == "started" then
            exports["qs-banking"]:RemoveMoney(name, amount, "sky_base")
            return
        end
        exports['Renewed-Banking']:removeAccountMoney(name, amount)
    end

    function Sky.FW.GetInventoryItems(source)
        local items = {}

        if GetResourceState("jaksam_inventory") == "started" then
            local inventory = exports["jaksam_inventory"]:getInventory(source)
            if inventory and type(inventory) == "table" and inventory.items then
                local inventoryItems = inventory.items
                if type(inventoryItems) == "table" then
                    for _, item in pairs(inventoryItems) do
                        if item and type(item) == "table" and item.name then
                            local amount = item.amount
                            if amount and type(amount) == "number" and amount > 0 then
                                items[#items + 1] = {
                                    name = item.name,
                                    label = item.label or item.name,
                                    amount = amount
                                }
                            end
                        end
                    end
                end
            end
        elseif GetResourceState("qs-inventory") == "started" then
            local ok, inventory = pcall(function()
                return exports["qs-inventory"]:GetInventory(source)
            end)
            if not ok then
                ok, inventory = pcall(function()
                    return exports["qs-inventory"]:getInventory(source)
                end)
            end
            if ok and inventory then
                local inventoryItems = inventory.items or inventory
                if type(inventoryItems) == "table" then
                    for _, item in pairs(inventoryItems) do
                        if item and type(item) == "table" and item.name then
                            local amount = item.amount or item.count
                            if amount and type(amount) == "number" and amount > 0 then
                                items[#items + 1] = {
                                    name = item.name,
                                    label = item.label or item.name,
                                    amount = amount
                                }
                            end
                        end
                    end
                end
            end
        else
            local inventory = exports.ox_inventory:GetInventoryItems(source)
            for _, item in pairs(inventory) do
                print(item.name, item.count)
                if item.count > 0 then
                    items[#items + 1] = {
                        name = item.name,
                        label = item.label,
                        amount = item.count
                    }
                end
            end
        end

        return items
    end

    function Sky.FW.GetItems()
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:getStaticItemsList()
        elseif GetResourceState("qs-inventory") == "started" then
            local ok, items = pcall(function()
                return exports["qs-inventory"]:GetItems()
            end)
            if not ok then
                ok, items = pcall(function()
                    return exports["qs-inventory"]:getItems()
                end)
            end
            if not ok then
                ok, items = pcall(function()
                    return exports["qs-inventory"]:GetItemList()
                end)
            end
            if ok and items then
                return items
            end
        end
        return exports.ox_inventory:Items()
    end

    function Sky.FW.GetInventoryItem(source, item, metadata)
        if GetResourceState("jaksam_inventory") == "started" then
            local playerItem = exports["jaksam_inventory"]:getItemByName(source, item, metadata)
            if playerItem then
                return {
                    name = playerItem.name,
                    label = playerItem.label or playerItem.name,
                    amount = playerItem.amount or 0
                }
            end
            return nil
        elseif GetResourceState("qs-inventory") == "started" then
            local ok, playerItem = pcall(function()
                return exports["qs-inventory"]:GetItemByName(source, item, metadata)
            end)
            if not ok then
                ok, playerItem = pcall(function()
                    return exports["qs-inventory"]:getItemByName(source, item, metadata)
                end)
            end
            if ok and playerItem then
                return {
                    name = playerItem.name,
                    label = playerItem.label or playerItem.name,
                    amount = playerItem.amount or playerItem.count or 0
                }
            end
            return nil
        end

        local xPlayer = exports.qbx_core:GetPlayer(source)
        local playerItem = xPlayer.Functions.GetItemByName(item)
        if playerItem then
            return {
                name = playerItem.name,
                label = playerItem.label,
                amount = playerItem.count
            }
        else
            return nil
        end
    end

    function Sky.FW.CanCarryItem(source, item, amount)
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:canCarryItem(source, item, amount)
        elseif GetResourceState("qs-inventory") == "started" then
            return exports["qs-inventory"]:CanCarryItem(source, item, amount)
        end
        local canAdd = exports.ox_inventory:CanCarryItem(source, item, amount)
        return canAdd
    end

    function Sky.FW.HasItem(source, item, amount)
        amount = amount or 1

        if GetResourceState("jaksam_inventory") == "started" then
            local playerItem = exports["jaksam_inventory"]:getItemByName(source, item)
            if playerItem and playerItem.amount then
                return playerItem.amount >= amount
            end
            return false
        elseif GetResourceState("qs-inventory") == "started" then
            local ok, playerItem = pcall(function()
                return exports["qs-inventory"]:GetItemByName(source, item)
            end)
            if not ok then
                ok, playerItem = pcall(function()
                    return exports["qs-inventory"]:getItemByName(source, item)
                end)
            end
            if ok and playerItem then
                local itemAmount = playerItem.amount or playerItem.count or 0
                return itemAmount >= amount
            end
            return false
        end

        local xPlayer = exports.qbx_core:GetPlayer(source)
        local foundItem = xPlayer.Functions.GetItemByName(item)
        if foundItem == nil then
            return false
        end

        return foundItem.count >= amount
    end

    function Sky.FW.RemoveItem(source, item, amount)
        if GetResourceState("jaksam_inventory") == "started" then
            local success = exports["jaksam_inventory"]:removeItem(source, item, amount)
            if success then
                return amount
            end
            return 0
        elseif GetResourceState("qs-inventory") == "started" then
            local success = exports["qs-inventory"]:RemoveItem(source, item, amount)
            if success then
                return amount
            end
            return 0
        end

        local xPlayer = exports.qbx_core:GetPlayer(source)
        local playerItem = xPlayer.Functions.GetItemByName(item)

        if playerItem then
            if playerItem.count > amount then
                xPlayer.Functions.RemoveItem(item, amount)
                return amount
            else
                xPlayer.Functions.RemoveItem(item, playerItem.count)
                return playerItem.count
            end
        else
            return 0
        end
    end

    function Sky.FW.AddItem(source, item, amount, force)
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:addItem(source, item, amount)
        elseif GetResourceState("qs-inventory") == "started" then
            return exports["qs-inventory"]:AddItem(source, item, amount)
        end
        local xPlayer = exports.qbx_core:GetPlayer(source)
        return xPlayer.Functions.AddItem(item, amount)
    end

    function Sky.FW.GetItemLabel(item)
        return QBCore.Shared.Items[item].label
    end

    ---@return {{identifier = string, job_grade = number }, {...}}
    function Sky.FW.GetJobUsers(jobName)
        local groupMembers = exports.qbx_core:GetGroupMembers(jobName, "job")
        local users = {}
        for _, user in ipairs(groupMembers) do
            if user ~= nil then
                table.insert(users, {
                    identifier = user.citizenid,
                    job_grade = user.grade
                })
            end
        end

        return users
    end

    ---Get Job from online or offline Player
    ---@param source string|number Can be license or player id
    ---@return string
    function Sky.FW.GetJob(source)
        if Sky.FW.IsPlayerOnline(source) then
            local xPlayer = exports.qbx_core:GetPlayer(source)
            if xPlayer ~= nil then
                return xPlayer.PlayerData.job.name
            else
                return ""
            end
        else
            local jobData = Sky.DB.GetValue("players", "license", source, "job")
            if not jobData then
                Sky.Debug("warn",
                    "[Sky.FW.GetJob] No job data found for offline player with license: " .. tostring(source))
                return ""
            end
            return jobData.name
        end
    end

    ---Set Job for online or offline Player
    ---@param source string|number Can be license or player id
    ---@param jobName string
    ---@param jobGrade number
    function Sky.FW.SetJob(source, jobName, jobGrade)
        exports.qbx_core:SetJob(source, jobName, jobGrade)
    end

    ---Set Duty status for a player
    ---@param source string|number Can be license or player id
    ---@param onDuty boolean
    function Sky.FW.SetDuty(source, onDuty)
        exports.qbx_core:SetJobDuty(source, onDuty)
    end

    ---Toggle Duty status for a player
    ---@param source string|number Can be license or player id
    function Sky.FW.ToggleDuty(source)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if not xPlayer then return end
        local currentDuty = xPlayer.PlayerData.job.onduty
        exports.qbx_core:SetJobDuty(source, not currentDuty)
    end

    ---Get count of on-duty players for a specific job
    ---@param jobName string
    ---@return number count
    ---@return table sources Array of player sources
    function Sky.FW.GetOnDutyCount(jobName)
        return exports.qbx_core:GetDutyCountJob(jobName)
    end

    function Sky.FW.DoesJobExist(jobName, grade)
        local jobs = exports.qbx_core:GetJobs()
        local job = jobs[jobName]
        if job then
            return true
        end
        return false
    end

    ---Get Jobs
    ---@return {name: string, label: string, grades: {[string]: {grade: number, name: string, label?: string, payment: string}}}
    function Sky.FW.GetJobs()
        local jobs = exports.qbx_core:GetJobs()
        for name, job in pairs(jobs) do
            jobs[name] = {
                name = name,
                label = job.label,
                grades = {}
            }
            for id, grade in ipairs(job.grades) do
                jobs[name].grades[tostring(id)] = { grade = id, payment = grade.payment, label = grade.name }
            end
        end
        return jobs
    end

    function Sky.FW.GetGroup(source)
        if exports.qbx_core:HasPermission(source, 'god') then
            return "god"
        elseif exports.qbx_core:HasPermission(source, 'admin') then
            return "admin"
        elseif exports.qbx_core:HasPermission(source, 'mod') then
            return "mod"
        else
            return "user"
        end
    end

    function Sky.FW.GetPlayers()
        return exports.qbx_core:GetPlayersInBucket(0)
    end

    function Sky.FW.IsVehicleOwnedByPlayer(source, plate)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        local isVehicleOwned = Sky.Query("SELECT * FROM player_vehicles WHERE plate = @plate AND license = @license", {
            ["@plate"] = plate,
            ["@license"] = xPlayer.PlayerData.license,
        })
        if not isVehicleOwned[1] or isVehicleOwned[1].license ~= xPlayer.PlayerData.license then
            return false
        else
            return true
        end
    end

    ---Get Job Data from online or offline Player
    ---@param source string|number Can be license or player id
    ---@param what "name"|"label"|"grade"|"grade_name"|"grade_label"|"duty"
    ---@return string
    function Sky.FW.GetJobData(source, what)
        if Sky.FW.IsPlayerOnline(source) then
            local xPlayer = exports.qbx_core:GetPlayer(source)
            if what == "name" then
                return xPlayer.PlayerData.job.name
            elseif what == "label" then
                return xPlayer.PlayerData.job.label
            elseif what == "grade" then
                return xPlayer.PlayerData.job.grade.level
            elseif what == "grade_name" then
                return xPlayer.PlayerData.job.grade.name
            elseif what == "grade_label" then
                return xPlayer.PlayerData.job.grade.name
            elseif what == "duty" then
                return xPlayer.PlayerData.job.onduty
            end
        else
            if type(source) == "number" then
                Sky.Debug("warn",
                    "[Sky.FW.GetJobData] Offline player job data requested with player ID. License expected. Source: "
                    .. tostring(source))
                return ""
            end
            local jobData = Sky.DB.GetValue("players", "license", source, "job")
            if what == "name" then
                return jobData.name
            elseif what == "label" then
                return jobData.label
            elseif what == "grade" then
                return jobData.grade.level
            elseif what == "grade_name" then
                return jobData.grade.name
            elseif what == "grade_label" then
                return jobData.grade.name
            end
        end
    end

    function Sky.FW.GetStatus(source, name)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        return xPlayer.PlayerData.metadata[name]
    end

    function Sky.FW.SetStatus(source, name, value)
        local xPlayer = exports.qbx_core:GetPlayer(source)

        xPlayer.Functions.SetMetaData(name, value)
        xPlayer.Functions.UpdatePlayerData(false)
    end

    function Sky.FW.ChangePlayerName(source, firstname, lastname)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        local charInfo = xPlayer.PlayerData.charinfo
        charInfo.firstname = firstname
        charInfo.lastname = lastname
        xPlayer.Functions.SetPlayerData("charinfo", charInfo)
        xPlayer.Functions.Save()
        xPlayer.Functions.UpdatePlayerData(false)
        TriggerClientEvent('QBCore:Player:UpdatePlayerData', source)
    end

    function Sky.FW.GetWeapons(source)
        local weapons = {}
        if GetResourceState("jaksam_inventory") == "started" then
            local inventory = exports["jaksam_inventory"]:getInventory(source)
            if inventory and type(inventory) == "table" and inventory.items then
                for _, item in pairs(inventory.items) do
                    if item and item.name then
                        local isWeapon = item.type == "weapon" or string.sub(item.name, 1, 7) == "weapon_"
                        local amount = item.amount
                        if isWeapon and amount and amount > 0 then
                            weapons[#weapons + 1] = {
                                name = item.name,
                                label = item.label or item.name,
                                amount = amount,
                                ammo = nil
                            }
                        end
                    end
                end
            end
        elseif GetResourceState("qs-inventory") == "started" then
            local ok, inventory = pcall(function()
                return exports["qs-inventory"]:GetInventory(source)
            end)
            if not ok then
                ok, inventory = pcall(function()
                    return exports["qs-inventory"]:getInventory(source)
                end)
            end
            if ok and inventory then
                local inventoryItems = inventory.items or inventory
                if type(inventoryItems) == "table" then
                    for _, item in pairs(inventoryItems) do
                        if item and item.name then
                            local isWeapon = item.type == "weapon" or string.sub(item.name, 1, 7) == "weapon_"
                            local amount = item.amount or item.count
                            if isWeapon and amount and amount > 0 then
                                weapons[#weapons + 1] = {
                                    name = item.name,
                                    label = item.label or item.name,
                                    amount = amount,
                                    ammo = nil
                                }
                            end
                        end
                    end
                end
            end
        else
            local xPlayer = exports.qbx_core:GetPlayer(source)
            if not xPlayer or not xPlayer.PlayerData then
                return weapons
            end

            local items = xPlayer.PlayerData.items or {}
            for _, item in pairs(items) do
                local name = item.name
                if name and item.count and item.count > 0 then
                    local isWeapon = item.type == "weapon" or string.sub(name, 1, 7) == "weapon_"
                    if isWeapon then
                        local label = item.label
                        if not label and QBCore and QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[name] then
                            label = QBCore.Shared.Items[name].label
                        end
                        weapons[#weapons + 1] = {
                            name = name,
                            label = label,
                            amount = item.count,
                            ammo = item.info and item.info.ammo or nil
                        }
                    end
                end
            end
        end

        return weapons
    end

    function Sky.FW.CanCarryWeapon(source, weaponName)
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:canCarryItem(source, weaponName, 1)
        end
        if GetResourceState("qs-inventory") == "started" then
            return exports["qs-inventory"]:CanCarryItem(source, weaponName, 1)
        end
        local canAdd = exports["qb-inventory"]:CanAddItem(source, weaponName, 1)
        return canAdd -- TODO: find qbx replacement
    end

    function Sky.FW.RemoveWeapon(source, weaponName)
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:removeItem(source, weaponName, 1) == true
        elseif GetResourceState("qs-inventory") == "started" then
            return exports["qs-inventory"]:RemoveItem(source, weaponName, 1) == true
        end
        local xPlayer = exports.qbx_core:GetPlayer(source)
        local weapon = xPlayer.Functions.GetItemByName(weaponName)

        if weapon then
            xPlayer.Functions.RemoveItem(weaponName)
            return true
        else
            return false
        end
    end

    function Sky.FW.AddWeapon(source, weaponName, ammo)
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:addItem(source, weaponName, 1)
        elseif GetResourceState("qs-inventory") == "started" then
            return exports["qs-inventory"]:AddItem(source, weaponName, 1)
        end
        local xPlayer = exports.qbx_core:GetPlayer(source)
        return xPlayer.Functions.AddItem(weaponName, 1)
    end

    function Sky.FW.CheckLicense(source, licenseType)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if xPlayer.PlayerData.metadata['licences'][licenseType] then
            return true
        else
            return false
        end
    end

    function Sky.FW.AddLicense(source, licenseType)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        xPlayer.PlayerData.metadata['licences'][licenseType] = true
        xPlayer.Functions.SetMetaData('licences', xPlayer.PlayerData.metadata['licences'])
        xPlayer.Functions.UpdatePlayerData(false)
    end

    function Sky.FW.GetLicenseCatalog(source)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if not xPlayer or not xPlayer.PlayerData.metadata['licences'] then
            return {}
        end

        local results = {}
        for key, _ in pairs(xPlayer.PlayerData.metadata['licences']) do
            table.insert(results, { type = key })
        end
        table.sort(results, function(a, b)
            return tostring(a.type) < tostring(b.type)
        end)
        return results
    end

    function Sky.FW.GetLicenses(source)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if not xPlayer or not xPlayer.PlayerData.metadata['licences'] then
            return {}
        end

        local results = {}
        for key, value in pairs(xPlayer.PlayerData.metadata['licences']) do
            if value then
                table.insert(results, { type = key })
            end
        end
        table.sort(results, function(a, b)
            return tostring(a.type) < tostring(b.type)
        end)
        return results
    end

    function Sky.FW.RemoveLicense(source, licenseType)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        if not xPlayer then
            return
        end
        if not xPlayer.PlayerData.metadata['licences'] then
            xPlayer.PlayerData.metadata['licences'] = {}
        end
        xPlayer.PlayerData.metadata['licences'][licenseType] = false
        xPlayer.Functions.SetMetaData('licences', xPlayer.PlayerData.metadata['licences'])
        xPlayer.Functions.UpdatePlayerData(false)
    end

    RegisterServerEvent('hospital:server:SetDeathStatus', function(isDead)
        if isDead then
            TriggerClientEvent("sky_base:onPlayerDeath", source)
        end
    end)

    function Sky.FW.IsDead(source)
        local xPlayer = exports.qbx_core:GetPlayer(source)
        return xPlayer.PlayerData.metadata.isdead
    end

    function Sky.FW.GetPlaytime(source)
        local src = tonumber(source)
        if not src then
            Sky.Debug("warn", "GetPlaytime: Invalid 'source' provided. Must be a number.")
            return 0
        end

        local Player = exports.qbx_core:GetPlayer(src)
        if not Player or not Player.PlayerData or not Player.PlayerData.metadata then
            return 0
        end

        local playtimeMinutes = Player.PlayerData.metadata["playtime"]
        if type(playtimeMinutes) ~= "number" then
            return 0
        end

        return playtimeMinutes
    end
end
