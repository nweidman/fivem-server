if Sky.Config.framework == "esx" then
    Sky.FW = {}
    local function _sky_dbg(name, ...)
        if Sky.Config.debug then
            local count = select("#", ...)
            local parts = {}
            for i = 1, count do
                parts[i] = tostring(select(i, ...))
            end
            print(("[sky_base][debug] %s(%s)"):format(name, table.concat(parts, ", ")))
        end
    end

    -- Get ESX for new & old versions
    ESX = exports["es_extended"]:getSharedObject()
    if not ESX then
        TriggerEvent("esx:getSharedObject", function(obj)
            _sky_dbg("esx:getSharedObject callback", obj)
            ESX = obj
        end)
    end

    if IsDuplicityVersion() then goto server end
    -- Client Side from here

    --Update Hunger and Thirst
    AddEventHandler("esx_status:onTick", function(data)
        local newHunger, newThirst
        for i, v in pairs(data) do
            if v.name == "hunger" then
                newHunger = v.percent
            elseif v.name == "thirst" then
                newThirst = v.percent
            end
        end
        TriggerEvent("sky_base:updateHungerAndThirst", newHunger, newThirst)
    end)

    -- Is Player Loaded
    RegisterNetEvent('esx:playerLoaded', function()
        _sky_dbg("esx:playerLoaded (client)")
        TriggerEvent("sky_base:playerLoaded")
    end)

    --Update Money
    RegisterNetEvent('esx:setAccountMoney', function(account)
        _sky_dbg("esx:setAccountMoney", account)
        TriggerEvent("sky_base:updateAccountMoney", account.name, account.money)
    end)

    --Entered Car
    AddEventHandler('esx:enteredVehicle', function(vehicle, plate, seat, displayName, netId)
        _sky_dbg("esx:enteredVehicle", vehicle, plate, seat, displayName, netId)
        TriggerEvent("sky_base:enteredVehicle", vehicle, plate, seat)
    end)

    --Exited Car
    AddEventHandler('esx:exitedVehicle', function(vehicle, plate, seat, displayName, netId)
        _sky_dbg("esx:exitedVehicle", vehicle, plate, seat, displayName, netId)
        TriggerEvent("sky_base:exitedVehicle", vehicle, plate, seat)
    end)

    --Added Item
    RegisterNetEvent('esx:addInventoryItem', function(item, count)
        _sky_dbg("esx:addInventoryItem", item, count)
        TriggerEvent("sky_base:inventoryUpdated")
    end)

    --Removed Inventory
    RegisterNetEvent('esx:removeInventoryItem', function(item, count)
        _sky_dbg("esx:removeInventoryItem", item, count)
        TriggerEvent("sky_base:inventoryUpdated")
    end)

    --Update Job
    RegisterNetEvent('esx:setJob', function(job, lastJob)
        _sky_dbg("esx:setJob", job, lastJob)
        TriggerEvent("sky_base:updateJob", job)
        TriggerServerEvent("sky_base:updateJob", job)
    end)

    ::server::
    if not IsDuplicityVersion() then return end
    -- Server Side from here

    RegisterNetEvent("esx:playerLoaded", function(playerId, xPlayer, isNew)
        _sky_dbg("esx:playerLoaded (server)", playerId, xPlayer, isNew)
        TriggerEvent("sky_base:playerLoaded", playerId)
    end)

    function Sky.FW.RegisterUsableItem(name, callback)
        _sky_dbg("Sky.FW.RegisterUsableItem", name, callback)
        ESX.RegisterUsableItem(name, callback)
    end

    function Sky.FW.IsPlayerOnline(sourceOrIdentifier)
        _sky_dbg("Sky.FW.IsPlayerOnline", sourceOrIdentifier)
        local xPlayer = ESX.GetPlayerFromId(sourceOrIdentifier)
        if xPlayer == nil then
            xPlayer = ESX.GetPlayerFromIdentifier(sourceOrIdentifier)
            if xPlayer == nil then
                return nil
            else
                return xPlayer.source
            end
        else
            return xPlayer.identifier
        end
    end

    function Sky.FW.GetIdentifier(source)
        _sky_dbg("Sky.FW.GetIdentifier", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then return nil end
        return xPlayer.identifier
    end

    function Sky.FW.GetName(source)
        _sky_dbg("Sky.FW.GetName", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = source
        if xPlayer then
            identifier = xPlayer.identifier
        end
        local user = Sky.DB.GetSingleRow("users", "identifier", identifier)
        if user ~= nil then
            if user.firstname ~= nil and user.lastname ~= nil then
                return Sky.String.SanitizeForSQL(user.firstname .. " " .. user.lastname)
            else
                return "Unknown"
            end
        end
    end

    function Sky.FW.GetFirstname(source)
        _sky_dbg("Sky.FW.GetFirstname", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = source
        if xPlayer then
            identifier = xPlayer.identifier
        end
        local user = Sky.DB.GetSingleRow("users", "identifier", identifier)
        if user then
            return Sky.String.SanitizeForSQL(user.firstname)
        end
    end

    function Sky.FW.GetLastname(source)
        _sky_dbg("Sky.FW.GetLastname", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = source
        if xPlayer then
            identifier = xPlayer.identifier
        end
        local user = Sky.DB.GetSingleRow("users", "identifier", identifier)
        if user then
            return Sky.String.SanitizeForSQL(user.lastname)
        end
    end

    function Sky.FW.GetGender(source)
        _sky_dbg("Sky.FW.GetGender", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then return end
        return xPlayer.get("sex")
    end

    function Sky.FW.GetBirthdate(source)
        _sky_dbg("Sky.FW.GetBirthdate", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and xPlayer.get then
            local dateOfBirth = xPlayer.get("dateofbirth") or xPlayer.get("dob")
            if dateOfBirth then
                return dateOfBirth
            end
        end

        local identifier = source
        if xPlayer then
            identifier = xPlayer.identifier
        end
        return Sky.DB.GetValue("users", "identifier", identifier, "dateofbirth")
    end

    function Sky.FW.GetAccountMoney(source, account)
        _sky_dbg("Sky.FW.GetAccountMoney", source, account)
        if account == "cash" then
            account = "money"
        end
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getAccount(account).money
    end

    function Sky.FW.AddAccountMoney(source, account, amount)
        _sky_dbg("Sky.FW.AddAccountMoney", source, account, amount)
        if account == "cash" then
            account = "money"
        end
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney(account, amount)
    end

    function Sky.FW.RemoveAccountMoney(source, account, amount)
        _sky_dbg("Sky.FW.RemoveAccountMoney", source, account, amount)
        if account == "cash" then
            account = "money"
        end
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getAccount(account).money >= amount then
            xPlayer.removeAccountMoney(account, amount)
            return true
        end
        return false
    end

    function Sky.FW.GetSharedAccountBalance(name)
        _sky_dbg("Sky.FW.GetSharedAccountBalance", name)
        if GetResourceState("qs-banking") == "started" then
            local accountBalance = exports["qs-banking"]:GetAccountBalance(name)
            if accountBalance ~= nil then
                return accountBalance
            end
            return 0
        end

        local accountBalance = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', "society_" .. name, function(account)
            _sky_dbg("esx_addonaccount:getSharedAccount callback", account)
            accountBalance = account.money
        end)

        if accountBalance ~= nil then
            return accountBalance
        else
            Sky.Debug("error", "[Sky.FW.GetSharedAccountBalance] | esx_addonaccount resource is not started.")
            return 0
        end
    end

    function Sky.FW.AddSharedAccountBalance(name, amount)
        _sky_dbg("Sky.FW.AddSharedAccountBalance", name, amount)
        if GetResourceState("qs-banking") == "started" then
            exports["qs-banking"]:AddMoney(name, amount, "sky_base")
            return
        end

        TriggerEvent('esx_addonaccount:getSharedAccount', "society_" .. name, function(account)
            _sky_dbg("esx_addonaccount:getSharedAccount callback", account)
            account.addMoney(amount)
        end)
    end

    function Sky.FW.RemoveSharedAccountBalance(name, amount)
        _sky_dbg("Sky.FW.RemoveSharedAccountBalance", name, amount)
        if GetResourceState("qs-banking") == "started" then
            exports["qs-banking"]:RemoveMoney(name, amount, "sky_base")
            return
        end

        TriggerEvent('esx_addonaccount:getSharedAccount', "society_" .. name, function(account)
            _sky_dbg("esx_addonaccount:getSharedAccount callback", account)
            account.removeMoney(amount)
        end)
    end

    function Sky.FW.GetInventoryItems(source)
        _sky_dbg("Sky.FW.GetInventoryItems", source)
        local items = {}
        local inventory = {}
        local identifier = Sky.FW.GetIdentifier(source)

        if GetResourceState("ak47_inventory") == "started" then
            inventory = exports['ak47_inventory']:GetInventoryItems(identifier)
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            inventory = xPlayer.getInventory()
        end

        for _, item in pairs(inventory) do
            if item.count > 0 then
                items[#items + 1] = {
                    name = item.name,
                    label = item.label,
                    amount = item.count
                }
            end
        end

        return items
    end

    function Sky.FW.GetItems()
        _sky_dbg("Sky.FW.GetItems")
        if GetResourceState("ox_inventory") == "started" then
            local items = exports.ox_inventory:Items()
            return items
        end
        local items = ESX.GetItems()
        return items
    end

    function Sky.FW.GetInventoryItem(source, item)
        _sky_dbg("Sky.FW.GetInventoryItem", source, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        local item = xPlayer.getInventoryItem(item)
        if item == nil then
            return nil
        end
        return {
            name = item.name,
            label = item.label,
            amount = item.count
        }
    end

    function Sky.FW.CanCarryItem(source, item, amount)
        _sky_dbg("Sky.FW.CanCarryItem", source, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.canCarryItem(item, amount)
    end

    function Sky.FW.HasItem(source, item, amount)
        _sky_dbg("Sky.FW.HasItem", source, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local item = xPlayer.getInventoryItem(item)

        if item == nil then
            return false
        end

        return item.count >= amount
    end

    function Sky.FW.RemoveItem(source, item, amount)
        _sky_dbg("Sky.FW.RemoveItem", source, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local playerItem = xPlayer.getInventoryItem(item)

        if playerItem then
            if playerItem.count > amount then
                xPlayer.removeInventoryItem(item, amount)
                return amount
            else
                xPlayer.removeInventoryItem(item, playerItem.count)
                return playerItem.count
            end
        else
            return 0
        end
    end

    function Sky.FW.AddItem(source, item, amount, force)
        _sky_dbg("Sky.FW.AddItem", source, item, amount, force)
        if GetResourceState("tgiann-inventory") == "started" then
            local success = exports["tgiann-inventory"]:AddItem(source, item, amount)
            return success
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.canCarryItem(item, amount) or force then
                xPlayer.addInventoryItem(item, amount)
                return true
            end
        end
        return false
    end

    function Sky.FW.GetItemLabel(item)
        _sky_dbg("Sky.FW.GetItemLabel", item)
        return ESX.GetItemLabel(item)
    end

    ---@return {{identifier = string, job_grade = number }, {...}}
    function Sky.FW.GetJobUsers(jobName)
        _sky_dbg("Sky.FW.GetJobUsers", jobName)
        local users = MySQL.query.await(
            "SELECT identifier, job_grade FROM users WHERE job = @job", {
                ["@job"] = jobName
            })
        return users
    end

    ---Get Job from online or offline Player
    ---@param source string|number Can be identifier or player id
    ---@return string
    function Sky.FW.GetJob(source)
        _sky_dbg("Sky.FW.GetJob", source)
        if Sky.FW.IsPlayerOnline(source) then
            local xPlayer = type(tonumber(source)) == "number" and ESX.GetPlayerFromId(source) or
                ESX.GetPlayerFromIdentifier(source)
            if xPlayer ~= nil then
                return xPlayer.job.name
            else
                return ""
            end
        else
            if type(source) == "string" then
                return Sky.DB.GetValue("users", "identifier", source, "job")
            end
        end
    end

    ---Set Job for online or offline Player
    ---@param source string|number Can be identifier or player id
    ---@param jobName string
    ---@param jobGrade number
    function Sky.FW.SetJob(source, jobName, jobGrade)
        _sky_dbg("Sky.FW.SetJob", source, jobName, jobGrade)
        if Sky.FW.IsPlayerOnline(source) then
            local xPlayer = type(tonumber(source)) == "number" and ESX.GetPlayerFromId(source) or
                ESX.GetPlayerFromIdentifier(source)
            xPlayer.setJob(jobName, jobGrade)
        else
            Sky.DB.SetValue("users", "job", jobName, "identifier", source)
            Sky.DB.SetValue("users", "job_grade", jobGrade, "identifier", source)
        end
    end

    ---Update Job Data
    ---@param jobName string
    ---@param data { label: string, grades: {[string]: {name: string, isboss?: boolean, payment: number}} }
    function Sky.FW.UpdateJob(jobName, data)
        _sky_dbg("Sky.FW.UpdateJob", jobName, data)
        local jobs = ESX.GetJobs()
        local job = jobs[jobName]
        if not job then
            Sky.Debug("error", "[Sky.FW.UpdateJob] Job [" .. jobName .. "] not found")
            return
        end

        if data.label ~= nil and job.label ~= data.label then
            Sky.DB.SetValue("jobs", "label", data.label, "name", jobName)
        end

        if data.grades then
            for grade, gradeData in pairs(data.grades) do
                local success = pcall(Sky.Query, "UPDATE job_grades SET grade = ? WHERE name = ? AND job_name = ?;",
                    { grade, gradeData.name, jobName })
                if not success then
                    Sky.Debug("error", "[Sky.FW.UpdateJob] Could not update 'grade' for " .. gradeData.name)
                    return
                else
                    Sky.Debug("debug", "Value updated for 'grade' updated")
                end

                if gradeData.payment ~= nil and gradeData.payment ~= job.salary then
                    local success = pcall(Sky.Query, "UPDATE job_grades SET salary = ? WHERE name = ? AND job_name = ?;",
                        { gradeData.payment, gradeData.name, jobName })
                    if not success then
                        Sky.Debug("error", "[Sky.FW.UpdateJob] Could not update 'salary' for " .. gradeData.name)
                        return
                    else
                        Sky.Debug("debug", "Value updated for 'salary' updated")
                    end
                end
            end
        end
        ESX.RefreshJobs()
    end

    ---Add grade to job
    ---@param jobName string
    ---@param gradeData {grade: number, name: string, label: string, payment: number}
    ---@return boolean -> success
    function Sky.FW.AddJobGrade(jobName, gradeData)
        _sky_dbg("Sky.FW.AddJobGrade", jobName, gradeData)
        if Sky.FW.DoesJobExist(jobName, gradeData) then
            Sky.Debug("debug", "Grade does already exist")
            return false
        end

        Sky.DB.AddRow("job_grades", {
            job_name = jobName,
            grade = gradeData.grade,
            name = gradeData.name,
            label = gradeData.label,
            salary = gradeData.payment,
            skin_male = "{}",
            skin_female = "{}"
        })

        ESX.RefreshJobs()
        return true
    end

    ---Remove grade from job
    ---@param jobName string
    ---@param grade number
    ---@return boolean -> success
    function Sky.FW.RemoveJobGrade(jobName, grade)
        _sky_dbg("Sky.FW.RemoveJobGrade", jobName, grade)
        if not Sky.FW.DoesJobExist(jobName, grade) then
            Sky.Debug("debug", "Grade does not exist")
            return false
        end

        local success = pcall(Sky.Query, "DELETE FROM job_grades WHERE job_name = ? AND grade = ?;",
            { jobName, grade })
        if not success then
            Sky.Debug('error', 'Failed to remove record from table "%s".', "job_grades")
        else
            Sky.Debug('debug', 'Record removed from table "%s" where "%s AND %s" equals "%s AND %s".', "job_grades",
                "grade", "job_name",
                grade, jobName)
        end

        ESX.RefreshJobs()
        return true
    end

    function Sky.FW.DoesJobExist(jobName, grade)
        _sky_dbg("Sky.FW.DoesJobExist", jobName, grade)
        return ESX.DoesJobExist(jobName, tonumber(grade))
    end

    ---Get Jobs
    ---@return {name: string, label: string, grades: {[string]: {grade: number, name: string, label: string, payment: string}}}
    function Sky.FW.GetJobs()
        _sky_dbg("Sky.FW.GetJobs")
        local jobs = ESX.GetJobs()
        for _, job in ipairs(jobs) do
            for _, grade in ipairs(job.grades) do
                grade.payment = grade.salary
            end
        end

        return jobs
    end

    function Sky.FW.GetGroup(source)
        _sky_dbg("Sky.FW.GetGroup", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer ~= nil then
            return xPlayer.getGroup()
        else
            return ""
        end
    end

    function Sky.FW.GetPlayers()
        _sky_dbg("Sky.FW.GetPlayers")
        return ESX.GetPlayers()
    end

    function Sky.FW.IsVehicleOwnedByPlayer(source, plate)
        _sky_dbg("Sky.FW.IsVehicleOwnedByPlayer", source, plate)
        local xPlayer = ESX.GetPlayerFromId(source)
        local isVehicleOwned = Sky.Query("SELECT * FROM owned_vehicles WHERE plate = @plate AND owner = @owner", {
            ["@plate"] = plate,
            ["@owner"] = xPlayer.identifier,
        })
        if not isVehicleOwned[1] or isVehicleOwned[1].owner ~= xPlayer.identifier then
            return false
        else
            return true
        end
    end

    ---Get Job Data from online or offline Player (offline only: "name"|"grade")
    ---@param source string|number Can be identifier or player id
    ---@param what "name"|"label"|"grade"|"grade_name"|"grade_label"|"duty"
    ---@return string
    function Sky.FW.GetJobData(source, what)
        _sky_dbg("Sky.FW.GetJobData", source, what)
        if Sky.FW.IsPlayerOnline(source) then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer ~= nil then
                if what == "name" then
                    return xPlayer.getJob().name
                elseif what == "label" then
                    return xPlayer.getJob().label
                elseif what == "grade" then
                    return xPlayer.getJob().grade
                elseif what == "grade_name" then
                    return xPlayer.getJob().grade_name
                elseif what == "grade_label" then
                    return xPlayer.getJob().grade_label
                elseif what == "duty" then
                    return xPlayer.getJob().onDuty
                end
            else
                return ""
            end
        else
            local jobName = Sky.DB.GetValue("users", "identifier", source, "job")
            local jobGrade = Sky.DB.GetValue("users", "identifier", source, "job_grade")
            if what == "name" then
                return jobName
            elseif what == "label" then
                return "N/A"
            elseif what == "grade" then
                return jobGrade
            elseif what == "grade_name" then
                return "N/A"
            elseif what == "grade_label" then
                return "N/A"
            end
        end
    end

    function Sky.FW.GetStatus(source, name)
        _sky_dbg("Sky.FW.GetStatus", source, name)
        local status = 0

        TriggerEvent('esx_status:getStatus', source, name, function(pStatus)
            _sky_dbg("esx_status:getStatus callback", pStatus)
            if pStatus then
                status = (pStatus.val / 10000)
            end
        end)

        return status
    end

    function Sky.FW.ChangePlayerName(source, firstname, lastname)
        _sky_dbg("Sky.FW.ChangePlayerName", source, firstname, lastname)
        local xPlayer = ESX.GetPlayerFromId(source)
        Sky.DB.SetValue("users", "firstname", firstname, "identifier", xPlayer.identifier)
        Sky.DB.SetValue("users", "lastname", lastname, "identifier", xPlayer.identifier)
    end

    function Sky.FW.GetWeapons(source)
        _sky_dbg("Sky.FW.GetWeapons", source)
        local weapons = {}
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer or not xPlayer.getLoadout then
            return weapons
        end

        local loadout = xPlayer.getLoadout()
        for _, weapon in pairs(loadout) do
            weapons[#weapons + 1] = {
                name = weapon.name,
                label = weapon.label,
                ammo = weapon.ammo,
                components = weapon.components,
                tintIndex = weapon.tintIndex
            }
        end

        return weapons
    end

    function Sky.FW.CanCarryWeapon(source, weaponName)
        _sky_dbg("Sky.FW.CanCarryWeapon", source, weaponName)
        local xPlayer = ESX.GetPlayerFromId(source)
        return not xPlayer.hasWeapon(weaponName)
    end

    function Sky.FW.RemoveWeapon(source, weaponName)
        _sky_dbg("Sky.FW.RemoveWeapon", source, weaponName)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer.hasWeapon(weaponName) then
            xPlayer.removeWeapon(weaponName)
            return true
        else
            return false
        end
    end

    function Sky.FW.AddWeapon(source, weaponName, ammo)
        _sky_dbg("Sky.FW.AddWeapon", source, weaponName, ammo)
        if GetResourceState("ox_inventory") == "started" then
            return Sky.FW.AddItem(source, weaponName, 1, true)
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            if not xPlayer.hasWeapon(weaponName) then
                xPlayer.addWeapon(weaponName, ammo)
                return true
            else
                return false
            end
        end
    end

    function Sky.FW.CheckLicense(source, licenseType)
        _sky_dbg("Sky.FW.CheckLicense", source, licenseType)
        if GetResourceState("ak47_idcardv2") == "started" then
            return exports['ak47_idcardv2']:HasLicense(source, "driverlicense", licenseType)
        end
        local timePassed = 0
        local hasLicense
        TriggerEvent("esx_license:checkLicense", source, licenseType, function(has)
            _sky_dbg("esx_license:checkLicense callback", has)
            hasLicense = has
        end)
        while hasLicense == nil and timePassed < 500 do
            Wait(10)
            timePassed = timePassed + 1
        end
        return hasLicense
    end

    function Sky.FW.AddLicense(source, licenseType)
        _sky_dbg("Sky.FW.AddLicense", source, licenseType)
        if GetResourceState("ak47_idcardv2") == "started" then
            exports['ak47_idcardv2']:GiveIdCard(source, {
                item = 'driverlicense', -- item name
                class = licenseType,
                address = 'Greenlight', -- player address
                expire = 3,             -- in month
            })
            return
        end
        TriggerEvent("esx_license:addLicense", source, licenseType, function()
            _sky_dbg("esx_license:addLicense callback")
        end)
    end

    function Sky.FW.GetLicenseCatalog()
        _sky_dbg("Sky.FW.GetLicenseCatalog")
        local timePassed = 0
        local licenses
        TriggerEvent("esx_license:getLicensesList", function(list)
            _sky_dbg("esx_license:getLicensesList callback", list)
            licenses = list
        end)
        while licenses == nil and timePassed < 500 do
            Wait(10)
            timePassed = timePassed + 1
        end
        return licenses or {}
    end

    function Sky.FW.GetLicenses(source)
        _sky_dbg("Sky.FW.GetLicenses", source)
        if GetResourceState("ak47_idcardv2") == "started" then
            local ok, result = pcall(function()
                _sky_dbg("ak47_idcardv2:GetLicenses pcall", source)
                return exports['ak47_idcardv2']:GetLicenses(source, "driverlicense")
            end)
            if ok and type(result) == "table" then
                return result
            end

            local catalog = Sky.FW.GetLicenseCatalog() or {}
            local resolved = {}
            for _, entry in ipairs(catalog) do
                local licenseType = entry
                local label
                if type(entry) == "table" then
                    licenseType = entry.type or entry.name or entry.value or entry.id
                    label = entry.label or entry.name
                end
                if licenseType and exports['ak47_idcardv2']:HasLicense(source, "driverlicense", licenseType) then
                    table.insert(resolved, {
                        type = licenseType,
                        label = label
                    })
                end
            end
            return resolved
        end

        local timePassed = 0
        local licenses
        TriggerEvent("esx_license:getLicenses", source, function(list)
            _sky_dbg("esx_license:getLicenses callback", list)
            licenses = list
        end)
        while licenses == nil and timePassed < 500 do
            Wait(10)
            timePassed = timePassed + 1
        end
        return licenses or {}
    end

    function Sky.FW.RemoveLicense(source, licenseType)
        _sky_dbg("Sky.FW.RemoveLicense", source, licenseType)
        local owner = Sky.FW.GetIdentifier(source) or source
        Sky.Query("DELETE FROM user_licenses WHERE type = ? AND owner = ?;", { licenseType, owner })
    end

    RegisterServerEvent('esx:onPlayerDeath')
    AddEventHandler('esx:onPlayerDeath', function(data)
        _sky_dbg("esx:onPlayerDeath", data)
        TriggerClientEvent("sky_base:onPlayerDeath", source)
    end)

    function Sky.FW.SetStatus(source, name, val)
        _sky_dbg("Sky.FW.SetStatus", source, name, val)
        local statusValue = tonumber(val) or 0
        if math.abs(statusValue) > 100 then
            statusValue = statusValue / 10000
        end

        TriggerClientEvent('esx_status:set', source, name, statusValue * 10000)
    end

    function Sky.FW.IsDead(source)
        _sky_dbg("Sky.FW.IsDead", source)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.dead
    end

    function Sky.FW.GetPlaytime(source)
        _sky_dbg("Sky.FW.GetPlaytime", source)
        local src = tonumber(source)
        if not src then
            Sky.Debug("warn", "GetPlaytime: Invalid 'source' provided. Must be a number.")
            return 0
        end

        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then
            return 0
        end

        local playtimeMinutes
        if xPlayer.getMetaData then
            playtimeMinutes = xPlayer.getMetaData('totalplaytime')
        elseif xPlayer.getMeta then
            playtimeMinutes = xPlayer.getMeta('totalplaytime')
        else
            local metadata = xPlayer.get and xPlayer.get('metadata')
            if metadata then
                playtimeMinutes = metadata.totalplaytime
            end
        end
        playtimeMinutes = playtimeMinutes or 0

        if playtimeMinutes == 0 and xPlayer.get('time') then
            playtimeMinutes = xPlayer.get('time') / 60000
        end

        return playtimeMinutes
    end

    function Sky.FW.SendBill(target, account, reason, amount)
        _sky_dbg("Sky.FW.SendBill", target, account, reason, amount)
        TriggerEvent('esx_billing:sendBill', target, account, reason, amount)
    end
end
