if Sky.Config.framework == "qb" then
    Sky.FW = {}

    -- Get Qb
    QBCore = exports['qb-core']:GetCoreObject()

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
        local newMoney = QBCore.Functions.GetPlayerData().money[account]
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

    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(jobInfo)
        jobInfo.grade_label = jobInfo.grade.name
        TriggerEvent("sky_base:updateJob", jobInfo)
        TriggerServerEvent("sky_base:updateJob", jobInfo)
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
        QBCore.Functions.CreateUseableItem(name, callback)
    end

    function Sky.FW.IsPlayerOnline(sourceOrIdentifier)
        local xPlayer = QBCore.Functions.GetPlayer(sourceOrIdentifier)
        if xPlayer == nil then
            xPlayer = QBCore.Functions.GetPlayerByCitizenId(tostring(sourceOrIdentifier))
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
        local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))
        if not xPlayer then
            Sky.Debug("debug", "[Sky.FW.GetIdentifier] Player not found for source: " .. tostring(source))
            return
        end
        return tostring(xPlayer.PlayerData.citizenid)
    end

    function Sky.FW.GetName(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return Sky.String.SanitizeForSQL(string.format("%s %s", xPlayer.PlayerData.charinfo.firstname,
            xPlayer.PlayerData.charinfo.lastname))
    end

    function Sky.FW.GetName(source)
        local xPlayer = tonumber(source) and QBCore.Functions.GetPlayer(tonumber(source))
        local identifier = source
        if xPlayer then
            identifier = xPlayer.PlayerData.citizenid
        end

        local result = Sky.DB.GetValue("players", "citizenid", identifier, "charinfo")

        if result then
            local charinfo = json.decode(result)
            return Sky.String.SanitizeForSQL(charinfo.firstname .. " " .. charinfo.lastname)
        end
    end

    function Sky.FW.GetFirstname(source)
        local xPlayer = tonumber(source) and QBCore.Functions.GetPlayer(tonumber(source))
        local identifier = source
        if xPlayer then
            return Sky.String.SanitizeForSQL(xPlayer.PlayerData.charinfo.firstname)
        end

        local result = Sky.DB.GetValue("players", "citizenid", identifier, "charinfo")
        if result then
            local charinfo = json.decode(result)
            if charinfo then
                return Sky.String.SanitizeForSQL(charinfo.firstname)
            end
        end
    end

    function Sky.FW.GetLastname(source)
        local xPlayer = tonumber(source) and QBCore.Functions.GetPlayer(tonumber(source))
        local identifier = source
        if xPlayer then
            return Sky.String.SanitizeForSQL(xPlayer.PlayerData.charinfo.lastname)
        end

        local result = Sky.DB.GetValue("players", "citizenid", identifier, "charinfo")
        if result then
            local charinfo = json.decode(result)
            if charinfo then
                return Sky.String.SanitizeForSQL(charinfo.lastname)
            end
        end
    end

    function Sky.FW.GetGender(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if not xPlayer then return end
        return xPlayer.PlayerData.charinfo.gender
    end

    function Sky.FW.GetBirthdate(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if not xPlayer then return end
        local charInfo = xPlayer.PlayerData and xPlayer.PlayerData.charinfo
        if type(charInfo) ~= "table" then return end
        return charInfo.birthdate
    end

    function Sky.FW.GetAccountMoney(source, account)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if account == "money" then
            account = "cash"
        elseif account == "black_money" then
            account = "black"
        end
        return xPlayer.PlayerData.money[account]
    end

    function Sky.FW.AddAccountMoney(source, account, amount)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if account == "money" then
            account = "cash"
        elseif account == "black_money" then
            account = "black"
        end
        xPlayer.Functions.AddMoney(account, amount)
    end

    function Sky.FW.RemoveAccountMoney(source, account, amount)
        local xPlayer = QBCore.Functions.GetPlayer(source)
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
        if GetResourceState("qb-banking") == "started" then
            local accountBalance = exports["qb-banking"]:GetAccountBalance(name)
            return accountBalance
        else
            Sky.Debug("error", "[Sky.FW.GetSharedAccountBalance] | qb-banking resource is not started.")
            return 0
        end
    end

    function Sky.FW.AddSharedAccountBalance(name, amount)
        if GetResourceState("qs-banking") == "started" then
            exports["qs-banking"]:AddMoney(name, amount, "sky_base")
            return
        end
        if GetResourceState("qb-banking") == "started" then
            exports["qb-banking"]:AddMoney(name, amount)
        else
            Sky.Debug("error", "[Sky.FW.GetSharedAccountBalance] | qb-banking resource is not started.")
        end
    end

    function Sky.FW.RemoveSharedAccountBalance(name, amount)
        if GetResourceState("qs-banking") == "started" then
            exports["qs-banking"]:RemoveMoney(name, amount, "sky_base")
            return
        end
        if GetResourceState("qb-banking") == "started" then
            exports["qb-banking"]:RemoveMoney(name, amount)
        else
            Sky.Debug("error", "[Sky.FW.GetSharedAccountBalance] | qb-banking resource is not started.")
        end
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
        else
            local xPlayer = QBCore.Functions.GetPlayer(source)
            local inventory = xPlayer.PlayerData.items

            for _, item in pairs(inventory) do
                if item.amount > 0 then
                    items[#items + 1] = {
                        name = item.name,
                        label = item.label,
                        amount = item.amount
                    }
                end
            end
        end

        return items
    end

    function Sky.FW.GetItems()
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:getStaticItemsList()
        end
        return QBCore.Shared.Items
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
            else
                return nil
            end
        end

        local xPlayer = QBCore.Functions.GetPlayer(source)
        local playerItem = xPlayer.Functions.GetItemByName(item)
        if playerItem then
            return {
                name = playerItem.name,
                label = playerItem.label,
                amount = playerItem.amount
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
        elseif GetResourceState("ox_inventory") == "started" then
            return exports.ox_inventory:CanCarryItem(source, item, amount)
        end
        local canAdd = exports["qb-inventory"]:CanAddItem(source, item, amount)
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
        end

        local xPlayer = QBCore.Functions.GetPlayer(source)
        local foundItem = xPlayer.Functions.GetItemByName(item)
        if foundItem == nil then
            return false
        end

        return foundItem.amount >= amount
    end

    function Sky.FW.RemoveItem(source, item, amount)
        if GetResourceState("jaksam_inventory") == "started" then
            local success = exports["jaksam_inventory"]:removeItem(source, item, amount)
            if success then
                return amount
            end
            return 0
        elseif GetResourceState("qs-inventory") == "started" then
            local removed = exports["qs-inventory"]:RemoveItem(source, item, amount)
            if removed == false then
                return 0
            end
            return amount
        end

        local xPlayer = QBCore.Functions.GetPlayer(source)
        local playerItem = xPlayer.Functions.GetItemByName(item)

        if playerItem then
            if playerItem.amount > amount then
                xPlayer.Functions.RemoveItem(item, amount)
                return amount
            else
                xPlayer.Functions.RemoveItem(item, playerItem.amount)
                return playerItem.amount
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
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.Functions.AddItem(item, amount)
    end

    function Sky.FW.GetItemLabel(item)
        return QBCore.Shared.Items[item].label
    end

    ---@return {{identifier = string, job_grade = number }, {...}}
    function Sky.FW.GetJobUsers(jobName)
        local users = {}
        local result = MySQL.query.await(
            "SELECT citizenid, job FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(job, '$.name')) = @job",
            {
                ["@job"] = jobName
            })
        for _, user in ipairs(result) do
            if user ~= nil then
                table.insert(users, {
                    identifier = user.citizenid,
                    job_grade = json.decode(user.job).grade.level
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
            local xPlayer = QBCore.Functions.GetPlayer(source)
            if xPlayer ~= nil then
                return xPlayer.PlayerData.job.name
            else
                return ""
            end
        else
            if type(source) == "string" then
                local jobData = Sky.DB.GetValue("players", "license", source, "job")
                if not jobData then
                    Sky.Debug("warn",
                        "[Sky.FW.GetJob] No job data found for offline player with license: " .. tostring(source))
                    return ""
                end
                return jobData.name
            end
        end
    end

    ---Set Job for online or offline Player
    ---@param source string|number Can be license or player id
    ---@param jobName string
    ---@param jobGrade number
    function Sky.FW.SetJob(source, jobName, jobGrade)
        if Sky.FW.IsPlayerOnline(source) then
            local xPlayer = QBCore.Functions.GetPlayer(source)
            if not xPlayer then return end
            xPlayer.Functions.SetJob(jobName, jobGrade)
        else
            local jobData = Sky.DB.GetValue("players", "license", source, "job")
            jobData.name = jobName
            jobData.grade.level = jobGrade
            Sky.DB.SetValue("players", "job", jobData, "license", source)
        end
    end

    ---Set Duty status for a player
    ---@param source string|number Can be license or player id
    ---@param onDuty boolean
    function Sky.FW.SetDuty(source, onDuty)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.SetJobDuty(onDuty)
    end

    ---Toggle Duty status for a player
    ---@param source string|number Can be license or player id
    function Sky.FW.ToggleDuty(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if not xPlayer then return end
        local currentDuty = xPlayer.PlayerData.job.onduty
        QBCore.Functions.SetJobDuty(source, not currentDuty)
    end

    ---Get count of on-duty players for a specific job
    ---@param jobName string
    ---@return number count
    ---@return table sources Array of player sources
    function Sky.FW.GetOnDutyCount(jobName)
        local sources = {}
        local players = QBCore.Functions.GetPlayers()
        for _, playerId in pairs(players) do
            local xPlayer = QBCore.Functions.GetPlayer(playerId)
            if xPlayer and xPlayer.PlayerData and xPlayer.PlayerData.job then
                local job = xPlayer.PlayerData.job
                if job.name == jobName and job.onduty then
                    sources[#sources + 1] = playerId
                end
            end
        end

        return #sources, sources
    end

    ---Update Job Data
    ---@param jobName string
    ---@param data { label: string, grades: {[string]: {name: string, isboss?: boolean, payment: number}} }
    function Sky.FW.UpdateJob(jobName, data)
        local job = QBCore.Shared.Jobs[jobName]
        if not job then
            Sky.Debug("error", "[Sky.FW.UpdateJob] Job [" .. jobName .. "] not found")
            return
        end

        if job.type then data.type = job.type end
        data.defaultOffDuty = job.defaultOffDuty
        data.offDutyPay = job.offDutyPay
        QBCore.Functions.UpdateJob(jobName, data)
    end

    ---Add grade to job
    ---@param jobName string
    ---@param gradeData {grade: number, name: string, label: string, payment: number}
    ---@return boolean -> success
    function Sky.FW.AddJobGrade(jobName, gradeData)
        if Sky.FW.DoesJobExist(jobName, gradeData) then
            Sky.Debug("debug", "Grade does already exist")
            return false
        end

        local job = QBCore.Shared.Jobs[jobName]
        job.grades[tostring(Sky.Table.Size(job.grades) - 1)] = {
            name = gradeData.name,
            payment = gradeData.payment
        }

        QBCore.Functions.UpdateJob(jobName, job)
        return true
    end

    ---Remove grade from job
    ---@param jobName string
    ---@param grade number
    ---@return boolean -> success
    function Sky.FW.RemoveJobGrade(jobName, grade)
        if not Sky.FW.DoesJobExist(jobName, grade) then
            Sky.Debug("debug", "Grade does not exist")
            return false
        end

        local job = QBCore.Shared.Jobs[jobName]
        job.grades[tostring(grade)] = nil
        return true
    end

    function Sky.FW.DoesJobExist(jobName, grade)
        local jobs = QBCore.Shared.Jobs
        local job = jobs[jobName]
        if job then
            local grade = job.grades[tostring(grade)]
            if grade then
                return true
            end
        end
        return false
    end

    ---Get Jobs
    ---@return {name: string, label: string, grades: {[string]: {grade: number, name: string, label: string, payment: string}}}
    function Sky.FW.GetJobs()
        local jobs = QBCore.Shared.Jobs
        for name, job in pairs(jobs) do
            for gradeIndex, grade in pairs(job.grades) do
                job.grades[gradeIndex].grade = tonumber(gradeIndex)
                job.grades[gradeIndex].name = string.lower(grade.name)
                job.grades[gradeIndex].label = grade.name
            end
            jobs[name] = {
                name = name,
                label = job.label,
                grades = job.grades
            }
        end
        return jobs
    end

    function Sky.FW.GetGroup(source)
        if QBCore.Functions.HasPermission(source, 'god') then
            return "god"
        elseif QBCore.Functions.HasPermission(source, 'admin') then
            return "admin"
        elseif QBCore.Functions.HasPermission(source, 'mod') then
            return "mod"
        else
            return "user"
        end
    end

    function Sky.FW.GetPlayers()
        return QBCore.Functions.GetPlayers()
    end

    function Sky.FW.IsVehicleOwnedByPlayer(source, plate)
        local xPlayer = QBCore.Functions.GetPlayer(source)
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
            local xPlayer = QBCore.Functions.GetPlayer(source)
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
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.metadata[name]
    end

    function Sky.FW.ChangePlayerName(source, firstname, lastname)
        local xPlayer = QBCore.Functions.GetPlayer(source)
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
        else
            local xPlayer = QBCore.Functions.GetPlayer(source)
            if not xPlayer or not xPlayer.PlayerData then
                return weapons
            end

            local items = xPlayer.PlayerData.items or {}
            for _, item in pairs(items) do
                local name = item.name
                if name and item.amount and item.amount > 0 then
                    local isWeapon = item.type == "weapon" or string.sub(name, 1, 7) == "weapon_"
                    if isWeapon then
                        local label = item.label
                        if not label and QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[name] then
                            label = QBCore.Shared.Items[name].label
                        end
                        weapons[#weapons + 1] = {
                            name = name,
                            label = label,
                            amount = item.amount,
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
        elseif GetResourceState("qs-inventory") == "started" then
            return exports["qs-inventory"]:CanCarryItem(source, weaponName, 1)
        end
        local canAdd = exports["qb-inventory"]:CanAddItem(source, weaponName, 1)
        return canAdd
    end

    function Sky.FW.RemoveWeapon(source, weaponName)
        if GetResourceState("jaksam_inventory") == "started" then
            return exports["jaksam_inventory"]:removeItem(source, weaponName, 1) == true
        end
        local xPlayer = QBCore.Functions.GetPlayer(source)
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
        end
        if GetResourceState("ox_inventory") == "started" then
            return Sky.FW.AddItem(source, weaponName, 1, true)
        else
            local xPlayer = QBCore.Functions.GetPlayer(source)

            local info = {}
            info.serie = tostring(QBCore.Shared.RandomInt(2) ..
                QBCore.Shared.RandomStr(3) ..
                QBCore.Shared.RandomInt(1) ..
                QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
            info.quality = 100
            info.ammo = ammo

            if GetResourceState("qs-inventory") == "started" then
                exports["qs-inventory"]:AddItem(source, weaponName, 1)
            else
                exports["qb-inventory"]:AddItem(source, weaponName, 1, false, info)
            end
        end
    end

    function Sky.FW.CheckLicense(source, licenseType)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.PlayerData.metadata['licences'][licenseType] then
            return true
        else
            return false
        end
    end

    function Sky.FW.AddLicense(source, licenseType)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.PlayerData.metadata['licences'][licenseType] = true
        xPlayer.Functions.SetMetaData('licences', xPlayer.PlayerData.metadata['licences'])
        xPlayer.Functions.UpdatePlayerData(false)
    end

    function Sky.FW.GetLicenseCatalog(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
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
        local xPlayer = QBCore.Functions.GetPlayer(source)
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
        local xPlayer = QBCore.Functions.GetPlayer(source)
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

    function Sky.FW.SetStatus(source, name, value)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.SetMetaData(name, value)
        xPlayer.Functions.UpdatePlayerData(false)
    end

    function Sky.FW.IsDead(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        return xPlayer.PlayerData.metadata.isdead
    end

    function Sky.FW.GetPlaytime(source)
        local src = tonumber(source)
        if not src then
            Sky.Debug("warn", "GetPlaytime: Invalid 'source' provided. Must be a number.")
            return 0
        end

        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then
            return 0
        end

        local playtimeMinutes = Player.PlayerData.metadata["playtime"] or 0

        return playtimeMinutes
    end
end
