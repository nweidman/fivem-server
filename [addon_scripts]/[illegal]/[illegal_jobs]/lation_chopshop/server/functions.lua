-- Initialize global variable to store phone
Phone = nil

-- Initialize config(s)
local server = require 'config.server'
local shared = require 'config.shared'

-- Check to see if fm-logs or fmsdk is started
local fmlogs = GetResourceState('fm-logs') == 'started'
local fmsdk = GetResourceState('fmsdk') == 'started'

-- Get phone
local function InitializePhone()
    if GetResourceState('lb-phone') == 'started' then
        Phone = 'lb-phone'
    elseif GetResourceState('qb-phone') == 'started' then
        Phone = 'qb-phone'
    elseif GetResourceState('qs-smartphone-pro') == 'started' then
        Phone = 'qs-smartphone-pro'
    elseif GetResourceState('qs-smartphone') == 'started' then
        Phone = 'qs-smartphone'
    elseif GetResourceState('gksphone') == 'started' then
        Phone = 'gksphone'
    elseif GetResourceState('roadphone') == 'started' then
        Phone = 'roadphone'
    elseif GetResourceState('npwd') == 'started' then
        Phone = 'npwd'
    elseif GetResourceState('yseries') == 'started' then
        Phone = 'yseries'
    elseif GetResourceState('okokPhone') == 'started' then
        Phone = 'okokPhone'
    else
        -- Add custom phone here
    end
end

-- Empty function that's triggered when requesting a job
-- Return true to allow, false to deny
--- @param source number Player ID
function CanRequestJob(source)
    return true
end

-- Empty function that's triggered when a vehicle part is removed
--- @param source number Player ID
--- @param entity number Entity ID
--- @param model string Vehicle model
--- @param typeId string Type ID "wheels", "doors", "frame"
--- @param boneId string Bone ID "door_dside_f", "door_pside_f", "door_dside_r", "door_pside_r", "wheel_lf", "wheel_rf", "wheel_lr", "wheel_rr"
function VehiclePartRemoved(source, entity, model, typeId, boneId)
    -- print(('Vehicle model & part removed: %s, %s'):format(model, typeId))
    exports['drool_skills']:addXP(source, 1)
end

-- Returns boolean if vehicle is owned by a player
--- @param source number Player ID
--- @param plate string Vehicle plate
--- @return boolean
function IsOwnedVehicle(source, plate)
    if not source or not plate then return false end

    local tableName
    if Framework == 'esx' then
        tableName = 'owned_vehicles'
    elseif Framework == 'qb' or Framework == 'qbx' then
        tableName = 'player_vehicles'
    elseif Framework == 'ox' then
        tableName = 'vehicles'
    else
        return false
    end

    local results = MySQL.query.await('SELECT 1 FROM ' .. tableName .. ' WHERE plate = ? LIMIT 1', { plate })
    return results and #results > 0
end

-- Backs up deleted vehicle data to a SQL file
--- @param tableName string Name of the database table
--- @param vehicleData table Vehicle data to backup
function BackupDeletedVehicle(tableName, vehicleData)
    local resourceName = GetCurrentResourceName()
    local fileName = 'deleted_vehicles.sql'
    local existing = LoadResourceFile(resourceName, fileName)

    local columns, values = {}, {}
    for k, v in pairs(vehicleData) do
        table.insert(columns, '`' .. k .. '`')
        if v == nil or v == "" then
            table.insert(values, "NULL")
        elseif type(v) == "number" then
            table.insert(values, tostring(v))
        elseif type(v) == "boolean" then
            table.insert(values, v and "1" or "0")
        else
            table.insert(values, "'" .. tostring(v):gsub("'", "''") .. "'")
        end
    end

    local sql = ("INSERT INTO `%s` (%s) VALUES (%s);\n"):format(
        tableName,
        table.concat(columns, ', '),
        table.concat(values, ', ')
    )

    local newContent = existing .. sql
    SaveResourceFile(resourceName, fileName, newContent, #newContent)
end

-- Deletes owned vehicle from database
--- @param source number Player ID
--- @param plate string Vehicle plate
function DeleteOwnedVehicle(source, plate)
    if not source or not plate then return end
    if not shared.start.deleteOwned then return end

    local tableName
    if Framework == 'esx' then
        tableName = 'owned_vehicles'
    elseif Framework == 'qb' or Framework == 'qbx' then
        tableName = 'player_vehicles'
    elseif Framework == 'ox' then
        tableName = 'vehicles'
    end

    local results = MySQL.query.await('SELECT * FROM ' .. tableName .. ' WHERE plate = ?', { plate })
    if results and #results > 0 then
        BackupDeletedVehicle(tableName, results[1])
        MySQL.query.await('DELETE FROM ' .. tableName .. ' WHERE plate = ?', { plate })
    end
end

-- Send an email
--- @param source number Player ID
--- @param message string
function SendEmail(source, message)
    if not source or not message then return end
    if Phone == 'lb-phone' then
        local number = exports[Phone]:GetEquippedPhoneNumber(source)
        if not number then return end
        local email = exports[Phone]:GetEmailAddress(number)
        if not email then return end
        exports[Phone]:SendMail({
            to = email,
            subject = 'Chop Shop',
            message = message
        })
    elseif Phone == 'qb-phone' then
        exports[Phone]:sendNewMailToOffline(GetIdentifier(source), {
            sender = 'Salvage Specialist',
            subject = 'Chop Shop',
            message = message
        })
    elseif Phone == 'qs-smartphone-pro' then
        exports[Phone]:sendNewMail(source, {
            sender = 'Salvage Specialist',
            subject = 'Chop Shop',
            message = message
        })
    elseif Phone == 'qs-smartphone' then
        TriggerClientEvent('lation_chopshop:sendEmail', source, message)
    elseif Phone == 'gksphone' then
        exports[Phone]:SendNewMail(source, {
            sender = 'Salvage Specialist',
            image = '/html/static/img/icons/mail.png',
            subject = 'Chop Shop',
            message = message
        })
    elseif Phone == 'roadphone' then
        TriggerClientEvent('lation_chopshop:sendEmail', source, message)
    elseif Phone == 'npwd' then
        local player = exports[Phone]:getPlayerData({ source = source })
        if not player then return end
        exports[Phone]:emitMessage({
            senderNumber = exports[Phone]:generatePhoneNumber(),
            targetNumber = player.phoneNumber,
            message = message
        })
    elseif Phone == 'yseries' then
        local number = exports[Phone]:GetPhoneNumberBySourceId(source)
        if not number then return end
        exports[Phone]:SendMail({
            title = 'Chop Shop',
            sender = 'Salvage Specialist',
            senderDisplayName = 'Salvage Specialist',
            content = message
        }, 'phoneNumber', number)
    elseif Phone == 'okokPhone' then
        local email = exports[Phone]:getEmailAddressFromSource(source)
        if not email then return end
        exports[Phone]:sendEmail({
            sender = 'Salvage Specialist',
            recipients = {email},
            subject = 'Chop Shop',
            body = message
        })
    else
        TriggerClientEvent('lation_chopshop:sendEmail', source, message)
    end
end

-- Log player events if applicable
--- @param source number Player ID
--- @param title string Log title
--- @param message string Message contents
function PlayerLog(source, title, message)
    if server.logs.service == 'fivemanage' then
        if not fmsdk then return end
        if server.logs.screenshots then
            exports.fmsdk:takeServerImage(source, {
                name = title,
                description = message,
            })
        else
            exports.fmsdk:LogMessage('info', message)
        end
    elseif server.logs.service == 'fivemerr' then
        if not fmlogs then return end
        exports['fm-logs']:createLog({
            LogType = 'Player',
            Message = message,
            Resource = 'lation_coke',
            Source = source,
        }, { Screenshot = server.logs.screenshots })
    elseif server.logs.service == 'discord' then
        local embed = {
            {
                ["color"] = 16711680,
                ["title"] = "**".. title .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = os.date("%a %b %d, %I:%M%p"),
                    ["icon_url"] = server.logs.discord.footer
                }
            }
        }
        PerformHttpRequest(server.logs.discord.link, function()
        end, 'POST', json.encode({username = server.logs.discord.name, embeds = embed, avatar_url = server.logs.discord.image}),
        {['Content-Type'] = 'application/json'})
    end
end

-- Register net event(s)
RegisterNetEvent('lation_chopshop:sendEmail', SendEmail)

-- Register callback(s)
lib.callback.register('lation_chopshop:isOwnedVehicle', IsOwnedVehicle)

-- Initialize default(s)
InitializePhone()

-- Temporary command to migrate data from V1 to V2
-- This command should be removed after the migration is complete
--- @param source number
RegisterCommand('migrateChopshopData', function(source)
    if source ~= 0 then
        print('This command can only be run from the server console.')
        return
    end

    local function calculateLevel(exp)
        local level = 1
        for lvl, requiredExp in pairs(shared.experience) do
            if exp >= requiredExp then
                level = lvl
            else
                break
            end
        end
        return level
    end

    MySQL.Async.fetchAll('SELECT * FROM lation_chopshop', {}, function(oldData)
        if not oldData or #oldData == 0 then
            print('No player data was found in the V1 lation_chopshop database table.')
            print('If this is your first installation of lation_chopshop; you do not need to run this command.')
            return
        end

        local transactionData = {}

        for _, row in ipairs(oldData) do
            local level = calculateLevel(row.reputation)
            local name = nil

            if Framework == 'esx' then
                local results = MySQL.query.await('SELECT `firstname`, `lastname` FROM `users` WHERE `identifier` = ? LIMIT 1', { row.player_identifier })
                local result = results[1]
                if result then
                    name = result.firstname.. ' ' ..result.lastname
                end
            elseif Framework == 'qb' then
                local results = MySQL.query.await('SELECT * FROM `players` WHERE `citizenid` = ? LIMIT 1', { row.player_identifier })
                local result = results[1]
                if result then
                    local PlayerData = { charinfo = json.decode(result.charinfo) }
                    if PlayerData then
                        name = PlayerData.charinfo.firstname.. ' ' ..PlayerData.charinfo.lastname
                    end
                end
            elseif Framework == 'qbx' then
                local player = exports.qbx_core:GetOfflinePlayer(row.player_identifier)
                if player then
                    name = player.PlayerData.charinfo.firstname.. ' ' ..player.PlayerData.charinfo.lastname
                end
            end

            table.insert(transactionData, {
                query = 'INSERT INTO lation_chopshopv2 (identifier, name, level, exp, vehicles, parts) VALUES (?, ?, ?, ?, ?, ?) ' ..
                        'ON DUPLICATE KEY UPDATE level = VALUES(level), exp = VALUES(exp), vehicles = VALUES(vehicles), parts = VALUES(parts)',
                values = {
                    row.player_identifier,
                    name or 'Unknown',
                    level,
                    row.reputation,
                    row.total_chopped,
                    row.total_parts
                }
            })
        end

        MySQL.transaction(transactionData, function(success)
            if success then
                print('Player data migration from V1 to V2 completed successfully!')
                print('You can now safely delete the "lation_chopshop" database table')
                print('The new database table is "lation_chopshopv2", do not delete that')
                print('------------------------------------------------------------')
                print('You should now remove the /migrateChopshopData command from your server.')
                print('To do this go to lation_chopshop/server/functions.lua and delete lines 153-214')
            else
                print('Player data migration failed - no changes were made and your data is safe.')
            end
        end)
    end)
end, false)

-- Wrapper functions for built-in group management system

function CreateGroup(source)
    api.createGroup(source)
end

function AddGroupMember(source, targetId)
    api.addGroupMember(source, targetId)
end

function RemoveGroupMember(source, targetId)
    api.removeGroupMember(source, targetId)
end

function LeaveGroup(source)
    api.leaveGroup(source)
end

function IsInGroup(source)
    return api.isInGroup(source)
end

function GetGroupMembers(source)
    return api.getGroupMembers(source)
end

function IsGroupOwner(source)
    return api.isGroupOwner(source)
end

function GetGroup(source)
    return api.getGroup(source)
end

function GetGroupOwner(source)
    return api.getGroupOwner(source)
end