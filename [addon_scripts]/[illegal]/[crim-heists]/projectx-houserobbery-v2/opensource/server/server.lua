if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports["qb-core"]:GetCoreObject()

    if Config.Framework == "qbox" then
        exports.qbx_core:CreateUseableItem('x_tablet', function (source, item)
            if Loaded then
                TriggerClientEvent('projectx-houserobbery:client:ToggleTablet', source)
            end
        end)
    elseif Config.Framework == "qb-core" then
        QBCore.Functions.CreateUseableItem('x_tablet', function(source, item)
            if Loaded then
                TriggerClientEvent('projectx-houserobbery:client:ToggleTablet', source)
            end
        end)
    end

    function AddMoney(source, cash, amount)
        amount = tonumber(amount)
        if not amount then return false end
    
        local player = exports.qbx_core:GetPlayer(source)
        if not player then return false end
    
        return player.Functions.AddMoney(cash, amount)
    end

    function RemoveMoney(source, amount)
        if Config.Framework == "qbox" then
            return exports.qbx_core:RemoveMoney(source, Config.RemoveMoneyType, amount)
        else
            return QBCore.Functions.GetPlayer(source).Functions.RemoveMoney(Config.RemoveMoneyType, amount)
        end
    end

    function GetMoney(source)
        if Config.Framework == "qbox" then
            return exports.qbx_core:GetMoney(source, Config.RemoveMoneyType)
        else
            return QBCore.Functions.GetPlayer(source).Functions.GetMoney(Config.RemoveMoneyType)
        end
    end

    function Notification(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('QBCore:Notify', source, notification, notificationType, duration)
        end
    end

    function GetCharacterIdentifier(source)
        if Config.Framework == "qb-core" then
            local Player = QBCore.Functions.GetPlayer(source)
            if not Player then return nil end

            local CitizenID = Player.PlayerData.citizenid
            return CitizenID
        else
            local Player = exports.qbx_core:GetPlayer(source)
            if not Player then return nil end

            local CitizenID = Player.PlayerData.citizenid
            return CitizenID
        end
    end

    function CheckPerms(source)
        return QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin')
    end
elseif Config.Framework == "esx" then
    function AddMoney(source, amount)
        if Config.Inventory == "ox" then
            exports.ox_inventory:AddItem(source, "money", amount)
        else
            ESX.GetPlayerFromId(source).addMoney(amount)
        end
    end

    function RemoveMoney(source, amount)
        local Money = ESX.GetPlayerFromId(source).getMoney()
        if Money < amount then return false end
        ESX.GetPlayerFromId(source).removeMoney(amount)
        return true
    end

    function GetMoney(source)
        return ESX.GetPlayerFromId(source).getMoney()
    end

    function Notification(source, notification, notificationType, duration)
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', source, {description = notification, type = notificationType, duration = duration, position = 'center-right'})
        else
            TriggerClientEvent('esx:showNotification', source, notification, notificationType, duration)
        end
    end

    function PdNotify(coords)
        local Players = ESX.GetPlayers()
        for i = 1, #Players do
            local xPlayer = ESX.GetPlayerFromId(Players[i])
            if Config.PoliceJobs[xPlayer.job.name] then
                if Config.Notification == "ox" then
                    TriggerClientEvent('ox_lib:notify', xPlayer.source, {description = 'Someone is robbing a house, check your map for the location', type = 'info', duration = 5000, position = 'center-right'})
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Someone is robbing a house, check your map for the location')
                end
            end
        end
        TriggerClientEvent('projectx-houserobbery:client:PdNotify', coords)
    end

    function GetCharacterIdentifier(source)
        local Player = ESX.GetPlayerFromId(source)
        if not Player then return nil end

        local Identifier = Player.getIdentifier()
        return Identifier
    end

    function CheckPerms(source)
        return ESX.GetPlayerFromId(source).getGroup() == 'admin' or ESX.GetPlayerFromId(source).getGroup() == 'owner'
    end

    lib.callback.register('projectx-houserobbery:server:hasitem', function(source, item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(source, item) >= 1
        elseif Config.Inventory == "codem" then
            return exports['codem-inventory']:HasItem(source, item, 1)
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(source, item, 1)
        elseif Config.Inventory == "tgiann" then
            return exports["tgiann-inventory"]:HasItem(source, item, 1)
        else
            return ESX.GetPlayerFromId(source).hasItem(item).count >= 1
        end
    end)

    CreateThread(function()
        while ESX == nil do Wait(1000) end
        ESX.RegisterUsableItem('x_tablet', function(playerId)
            if Loaded then
                TriggerClientEvent('projectx-houserobbery:client:ToggleTablet', playerId)
            end
        end)
    end)
else

end

function AddItem(source, item, amount, info)
    if Config.Inventory == "ox" then
        exports.ox_inventory:AddItem(source, item, amount, info)
    elseif Config.Inventory == "origen" then
        exports.origen_inventory:AddItem(source, item, amount, nil, nil, info)
    elseif Config.Inventory == "codem" then
        exports['codem-inventory']:AddItem(source, item, amount, nil, info)
    elseif Config.Inventory == "tgiann" then
        exports["tgiann-inventory"]:AddItem(source, item, amount, nil, info, false)
    elseif Config.Framework == "esx" then
        CreateThread(function() while ESX == nil do Wait(1000) end end)
        ESX.GetPlayerFromId(source).addInventoryItem(item, amount)
    elseif Config.Framework == "qb-core" or Config.Framework == "qbox" then
        local QBCore = exports["qb-core"]:GetCoreObject()
        QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount, false, info)
    else
        -- Custom Framework
    end
end

function RemoveItem(source, item, amount)
    if Config.Inventory == "ox" then
        exports.ox_inventory:RemoveItem(source, item, amount)
    elseif Config.Inventory == "origen" then
        exports.origen_inventory:RemoveItem(source, item, amount)
    elseif Config.Inventory == "codem" then
        exports['codem-inventory']:RemoveItem(source, item, amount)
    elseif Config.Inventory == "tgiann" then
        exports["tgiann-inventory"]:RemoveItem(source, item, amount)
    elseif Config.Framework == "esx" then
        CreateThread(function() while ESX == nil do Wait(1000) end end)
        ESX.GetPlayerFromId(source).removeInventoryItem(item, amount)
    elseif Config.Framework == "qb-core" or Config.Framework == "qbox" then
        local QBCore = exports["qb-core"]:GetCoreObject()
        QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item, amount)
    else
        -- Custom Framework
    end
end

function GetItemLabel(item)
    if Config.Inventory == "ox" then
        return exports.ox_inventory:Items(item).label
    elseif Config.Inventory == "origen" then
        return exports.origen_inventory:Items(item).label
    elseif Config.Inventory == "codem" then
        return exports['codem-inventory']:GetItemLabel(item)
    elseif Config.Inventory == "tgiann" then
        return exports["tgiann-inventory"]:GetItemLabel(item)
    elseif Config.Framework == "esx" then
        CreateThread(function() while ESX == nil do Wait(1000) end end)
        return ESX.GetItemLabel(item)
    elseif Config.Framework == "qb-core" or Config.Framework == "qbox" then
        local Items = exports['qb-core']:GetSharedItems()
        return Items[item].label
    else
        return item
    end
end

lib.callback.register("projectx-houserobbery:server:GetOnlinePoliceCount", function(source, approach)
    local PoliceRequired

    if Config.ApproachOptions.PoliceRequired ~= "unique" then
        PoliceRequired = tonumber(Config.ApproachOptions.PoliceRequired)
    else
        local data = Config.ApproachOptions.Approaches[approach]
        if not data then return false end

        PoliceRequired = tonumber(data.PoliceRequired)
    end

    if not PoliceRequired or PoliceRequired <= 0 then return true end

    local CurrentCops = 0

    if Config.Framework == "qbox" then
        for k, _ in pairs(Config.PoliceJobs) do
            local count = exports.qbx_core:GetDutyCountJob(k)
            if count then
                CurrentCops = CurrentCops + count
            end
        end
    elseif Config.Framework == "qb-core" then
        local QBCore = exports['qb-core']:GetCoreObject()

        for k, _ in pairs(Config.PoliceJobs) do
            local _, count = QBCore.Functions.GetPlayersOnDuty(k)
            if count then CurrentCops = CurrentCops + count end
        end
    elseif Config.Framework == "esx" then
        if Config.ESX == "old" then
            local Players = ESX.GetPlayers()
            for i = 1, #Players do
                local xPlayer = ESX.GetPlayerFromId(Players[i])
                if Config.PoliceJobs[xPlayer.job.name] then CurrentCops = CurrentCops + 1 end
            end
        else
            local xPlayers = ESX.GetExtendedPlayers()
            for _, xPlayer in ipairs(xPlayers) do
                if Config.PoliceJobs[xPlayer.job.name] then CurrentCops = CurrentCops + 1 end
            end
        end
    else
        return false
    end

    return CurrentCops >= PoliceRequired
end)

lib.callback.register('projectx-houserobbery:server:WeightCheck', function(source, item)
    if Config.Inventory == "ox" then
        return exports.ox_inventory:CanCarryItem(source, item, 1)
    elseif Config.Inventory == "origen" then
        return exports.origen_inventory:CanCarryItems(source, item, 1)
    elseif Config.Inventory == "tgiann" then
        return exports["tgiann-inventory"]:CanCarryItem(source, item, 1)
    elseif Config.Inventory == "ps" or Config.Inventory == "lj" then
        return true
    elseif Config.Inventory == "qb" then
        return exports['qb-inventory']:CanAddItem(source, item, 1)
    elseif Config.Framework == "esx" then
        Player = ESX.GetPlayerFromId(source)
        return Player.canCarryItem(item, 1)
    else
        return true
    end
end)

----- Group work functions -----
if Config.GroupSystem == "renewed" or Config.GroupSystem == "lb" then
    function GroupgetGroupByMembers(source)
        return exports['qb-phone']:GetGroupByMembers(source)
    end

    function GroupgetGroupMembers(group)
        if not group then return end
        return exports['qb-phone']:getGroupMembers(group)
    end

    function GroupgetJobStatus(group)
        if not group then return end
        return exports['qb-phone']:getJobStatus(group)
    end

    function GroupgetGroupSize(group)
        if not group then return end
        return exports['qb-phone']:getGroupSize(group)
    end

    function GroupisGroupLeader(source, group)
        if not group then return end
        return exports['qb-phone']:isGroupLeader(source, group)
    end

    function GroupCreateBlipForGroup(HouseType, house, group)
        if not group then return end
        exports['qb-phone']:CreateBlipForGroup(group, "targethouse", {
            label = Loc[Config.Lan].group["blip_name"],
            coords = Config.Houses[HouseType][house].DoorCoords,
            sprite = 161,
            color = 59,
            scale = 1.0,
        })
        SetTimeout((Config.Cooldowns["RemoveBlipTime"] * 60000), function()
            exports['qb-phone']:RemoveBlipForGroup(group, "targethouse")
        end)
    end

    function GroupNotifyGroup(group, message, successFail)
        if not group then return end
        exports['qb-phone']:NotifyGroup(group, message, successFail)
    end

    function GroupRemoveBlipForGroup(group)
        if not group then return end
        exports['qb-phone']:RemoveBlipForGroup(group, "targethouse")
    end

    function GroupresetJobStatus(group)
        if not group then return end
        exports['qb-phone']:resetJobStatus(group)
    end

    function GroupsetJobStatus(group, status, stage)
        if not group then return end
        exports['qb-phone']:setJobStatus(group, status, stage)
    end
else
    function GroupgetGroupByMembers(source)
        local group = exports["yseries"]:FindGroupByMember(source)
        if group == 0 then return nil end
        return group
    end

    function GroupgetGroupMembers(group)
        if not group then return end
        local group = exports["yseries"]:GetGroupMembers(group)
        return group
    end

    function GroupgetJobStatus(group)
        if not group then return end
        local group = exports["yseries"]:GetJobStatus(group)
        return group
    end

    function GroupgetGroupSize(group)
        if not group then return end
        local group = exports["yseries"]:GetGroupMembersCount(group)
        return group
    end

    function GroupisGroupLeader(source, group)
        if not group then return end
        local group = exports["yseries"]:IsGroupLeader(group, source)
        return group
    end

    function GroupCreateBlipForGroup(HouseType, house, group)
        if not group then return end
        exports['yseries']:CreateBlipForGroup(group, "targethouse", {
            label = Loc[Config.Lan].group["blip_name"],
            coords = Config.Houses[HouseType][house].DoorCoords,
            sprite = 161,
            color = 59,
            scale = 1.0,
        })
        SetTimeout((Config.Cooldowns["RemoveBlipTime"] * 60000), function()
            exports['yseries']:RemoveBlipForGroup(group, "targethouse")
        end)
    end

    function GroupNotifyGroup(group, message, successFail)
        if not group then return end
        exports["yseries"]:NotifyGroup(group, message)
    end

    function GroupRemoveBlipForGroup(group)
        if not group then return end
        exports["yseries"]:RemoveBlipForGroup(group, "targethouse")
    end

    function GroupresetJobStatus(group)
        if not group then return end
        exports["yseries"]:SetJobStatus(group, nil)
    end

    function GroupsetJobStatus(group, status, stage)
        if not group then return end
        exports["yseries"]:SetJobStatus(group, status)
    end
end

local function InitializeBurglaryMeta(Player)
    local burglary = Player.PlayerData.metadata["burglary"]

    if burglary == nil or type(burglary) ~= "table" then
        burglary = { level = 0, xp = 0 }
        Player.Functions.SetMetaData("burglary", burglary)
    end

    -- Safety checks
    burglary.level = burglary.level or 0
    burglary.xp = burglary.xp or 0
    -- print("Level is ".. burglary.level)
    return burglary
end

function AddExperience(source, SkillName, exp)
    if Config.ServerSideEvents then
        local src = source
        local Player = exports.qbx_core:GetPlayer(src)
        if not Player then return end

        local burglary = InitializeBurglaryMeta(Player)
        burglary.xp = burglary.xp + exp

        if Config.XPLevels[burglary.level+1] and burglary.xp >= Config.XPLevels[burglary.level+1] then
            burglary.level += 1
            exports.qbx_core:Notify( src, ("Burglary level increased to %s!"):format(burglary.level), "success")
        end

        Player.Functions.SetMetaData("burglary", burglary)
    else
        TriggerClientEvent("projectx-houserobbery:client:AddExperience", source, SkillName, exp)
    end
end

function CheckExpLevel(source, SkillName)
    if Config.ServerSideEvents then
        local src = source
        local Player = exports.qbx_core:GetPlayer(src)
        if not Player then return end

        return InitializeBurglaryMeta(Player).level
    else
        local level = lib.callback.await("projectx-houserobbery:client:CheckExpLevel", source, false)
        return level
    end
end

-- Server side functions after a location is robbed
function RobbedSpot(src, HouseName, LootableName, RewardName, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedProp(src, HouseName, RewardName, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedPainting(src, HouseName, RewardName, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedDisplay(src, HouseName, RewardName, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedSafe(src, HouseName, RewardName, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedHighValueItem(src, HouseName, RewardName, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedCash(src, HouseName, Amount, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

function RobbedContract(src, HouseName, ContractName, ContractType, Exp)
    ExpFunction(src, Exp)
    -- Add other functions if needed, you can use the parameters I passed
end

-- Logs
function GetIDs(src)
    local discord = GetPlayerIdentifierByType(src, 'discord') or 'N/A'
    if discord ~= 'N/A' then
        discord = discord:gsub("discord:", "")
    end

    local msg = string.format(" - Identifiers:\n> ID: %s", src)

    if Config.Framework == "qbox" then
        local Player = exports.qbx_core:GetPlayer(src)
        if Player then
            local firstname = Player.PlayerData.charinfo.firstname or "N/A"
            local lastname  = Player.PlayerData.charinfo.lastname or "N/A"
            local citizenid = Player.PlayerData.citizenid or "N/A"
            local license   = Player.PlayerData.license or "N/A"

            msg = string.format(
                "- %s:\n> %s: %s\n> %s: %s %s\n> %s: %s\n> %s: %s",
                Loc[Config.Lan].logs["identifiers"],
                Loc[Config.Lan].logs["id"], src,
                Loc[Config.Lan].logs["character_name"], firstname, lastname,
                Loc[Config.Lan].logs["citizenid"], citizenid,
                Loc[Config.Lan].logs["license"], license
            )
        end

    elseif Config.Framework == "qb" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            local firstname = Player.PlayerData.charinfo.firstname or "N/A"
            local lastname  = Player.PlayerData.charinfo.lastname or "N/A"
            local citizenid = Player.PlayerData.citizenid or "N/A"
            local license   = Player.PlayerData.license or "N/A"

            msg = string.format(
                "- %s:\n> %s: %s\n> %s: %s %s\n> %s: %s\n> %s: %s",
                Loc[Config.Lan].logs["identifiers"],
                Loc[Config.Lan].logs["id"], src,
                Loc[Config.Lan].logs["character_name"], firstname, lastname,
                Loc[Config.Lan].logs["citizenid"], citizenid,
                Loc[Config.Lan].logs["license"], license
            )
        end

    elseif Config.Framework == "esx" then
        local Player = ESX.GetPlayerFromId(src)
        if Player then
            local name    = Player.getName() or "N/A"
            local license = Player.identifier or "N/A"

            msg = string.format(
                "- %s:\n> %s: %s\n> %s: %s\n> %s: %s",
                Loc[Config.Lan].logs["identifiers"],
                Loc[Config.Lan].logs["id"], src,
                Loc[Config.Lan].logs["character_name"], name,
                Loc[Config.Lan].logs["license"], license
            )
        end
    end

    return string.format("%s\n> Discord: %s (<@%s>)**", msg, discord, discord)
end

function CustomLog(title, message)
    -- Your custom log logic here
end

------ Commands ------
RegisterCommand('getoffset', function(source, args)
    if not CheckPerms(source) then return Notification(source, Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDuration) end
    TriggerClientEvent('projectx-houserobbery:client:GetOffset', source, args)
end)

RegisterCommand("burglaryxp", function(source)
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end

    local burglary = InitializeBurglaryMeta(Player)

    local level = burglary.level
    local xp = burglary.xp
    local nextLevelXP = Config.XPLevels[level + 1]

    if nextLevelXP then
        local remaining = nextLevelXP - xp
        TriggerClientEvent('ox_lib:notify', source, {
            title = "Burglary Skill",
            description = "Level: "..level.." | XP: "..xp.."/"..nextLevelXP.." | "..remaining.." XP to next level",
            type = "inform",
            position = "center-right",
            duration = 8000
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = "Burglary Skill",
            description = "Level: "..level.." | XP: "..xp.." | MAX LEVEL",
            type = "success",
            position = "center-right",
            duration = 8000
        })
    end
end)

RegisterCommand('lockhouse', function(source)
    if not CheckPerms(source) then return Notification(source, Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDuration) end
    local pos = GetEntityCoords(GetPlayerPed(source))
    local types = {"Shells", "IPLs"}
    for _, houseType in ipairs(types) do
        for k, v in pairs(Config.Houses[houseType]) do
            if #(pos - vector3(v.DoorCoords.x, v.DoorCoords.y, v.DoorCoords.z)) < 10.0 then
                local Approach = FetchedHouses[k].Approach
                ResetHouse(houseType, k, Approach, true)
                return
            end
            Wait(10)
        end
    end
end)

if Config.PolyTool then
    RegisterCommand('polycreate', function (source)
        if not CheckPerms(source) then return Notification(source, Loc[Config.Lan].error["no_permission"], 'error', Config.NotificationDuration) end
        TriggerClientEvent('projectx-houserobbery:client:OpenPolyTool', source)
    end)
end

local function GetStreetAndZone(source, coords)
    local Street, Zone = lib.callback.await('projectx-houserobbery:client:GetStreetAndZone', source, coords)
    if not Street and not Zone then
        Street = "Unknown"
        Zone = "Unknown"
    end
    return Street, Zone
end

lib.callback.register('projectx-houserobbery:server:Dispatch', function(source, house)
    if not DispatchExploitCheck(source, house) then return Notification(source, Loc[Config.Lan].error["glitch"], 'error', Config.NotificationDuration) end

    local PoliceJobs = {}
    for k, _ in pairs(Config.PoliceJobs) do PoliceJobs[#PoliceJobs + 1] = k end
    local coords = FetchedHouses[house].Coords
    if Config.Dispatch.Resource == 'sonoran' then
        local Street, Zone = GetStreetAndZone(source, coords)
        exports["sonorancad"]:performApiRequest({{
            ["serverId"] = GetConvar("sonoran_serverId", 1),
            ["isEmergency"] = true,
            ["caller"] = 'Security Camera',
            ["location"] = Street..", "..Zone,
            ["description"] = Config.Dispatch.Message,
            ["metaData"] = {
                ["useCallLocation"] = true,
            }
        }}, "CALL_911")
        return false
    elseif Config.Dispatch.Resource == 'fd' then
        local Street, Zone = GetStreetAndZone(source, coords)
        exports.fd_dispatch:addAlert({
            title = Config.Dispatch.Title,
            description = Config.Dispatch.Message,
            groups = PoliceJobs,
            location = {
                coords = coords,
                street = Street..", "..Zone
            },
            priority = 2,
            code = Config.Dispatch.Code,
            blip = {
                sprite = Config.Dispatch.Blip.Sprite,
                color = Config.Dispatch.Blip.Color,
                scale = Config.Dispatch.Blip.Scale,
                time = Config.Dispatch.Blip.Time * 1000
            },
        })
        return false
    elseif Config.Dispatch.Resource == 'origen' then
        exports['origen_police']:SendAlert({
            coords = coords,
            title = Config.Dispatch.Title,
            type = 'GENERAL',
            message = Config.Dispatch.Message,
            job = PoliceJobs[1],
        })
        return false
    elseif Config.Dispatch.Resource == 'tk' then
        exports['tk_dispatch']:addCall({
            title = Config.Dispatch.Title,
            code = Config.Dispatch.Code,
            coords = coords,
            priority = 'Priority 2',
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = Config.Dispatch.Blip.Color,
                sprite = Config.Dispatch.Blip.Sprite,
                scale = Config.Dispatch.Blip.Scale,
            },
            jobs = PoliceJobs
        })
        return false
    elseif Config.Dispatch.Resource == 'rcore' then
        local data = {
            code = Config.Dispatch.Code,
            default_priority = 'medium',
            coords = coords,
            job = 'police',
            text = Config.Dispatch.Title..' - '..Config.Dispatch.Message,
            type = 'alerts',
            blip = {
                sprite = Config.Dispatch.Blip.Sprite, 
                colour = Config.Dispatch.Blip.Color,
                scale = Config.Dispatch.Blip.Scale,
                text = Config.Dispatch.Blip.Text, 
                flashes = false,
                radius = 0,
            }
        }

        TriggerEvent('rcore_dispatch:server:sendAlert', data)
        return false
    elseif Config.Dispatch.Resource == 'lb' then
        local Street, Zone = GetStreetAndZone(source, coords)

        local dispatch = {
            priority = 'medium',
            code = Config.Dispatch.Code,
            title = Config.Dispatch.Title,
            description = Config.Dispatch.Message,
            location = {label = Street..", "..Zone, coords = {x = coords.x, y = coords.y}},
            time = Config.Dispatch.Time,
            job = 'police',

        }
        exports["lb-tablet"]:AddDispatch(dispatch)
        return false
    elseif Config.Dispatch.Resource == 'l2s' then
        local Street, Zone = GetStreetAndZone(source, coords)

        TriggerEvent('l2s-dispatch:server:AddNotification', {
            departments = {'POLICE'}, 
            title = Config.Dispatch.Title,
            message = Config.Dispatch.Message,
            coords = vec2(coords.x, coords.y),
            priority = 1,
            sound = 1, 
            street = Street..", "..Zone,
            blip = {
                sprite = Config.Dispatch.Blip.Sprite,
                colour = Config.Dispatch.Blip.Color,
                scale = Config.Dispatch.Blip.Scale,
                text = Config.Dispatch.Blip.Text,
            }
        })
        return false
    elseif Config.Dispatch.Resource == 'piotreqv1' then
        exports['piotreq_gpt']:SendAlert(source, {
           title = Config.Dispatch.Title,
           code = Config.Dispatch.Code,
           icon = 'fa-solid fa-mask',
           info = {
               {icon = 'fa-solid fa-road', isStreet = true},
               {icon = 'fa-solid fa-triangle-exclamation', data = 'Very Danger'},
           },
           blip = {
               scale = Config.Dispatch.Blip.Scale,
               sprite = Config.Dispatch.Blip.Sprite,
               color = Config.Dispatch.Blip.Color,
               name = Config.Dispatch.Blip.Text,
           },

           notifyTime = Config.Dispatch.Time / 60,
        })
        return false
    elseif Config.Dispatch.Resource == 'piotreqv2' then
        exports['p_mdt']:CreateAlert({
            priority = 'medium',
            code = Config.Dispatch.Code,
            title = Config.Dispatch.Title,
            description = Config.Dispatch.Message,
            coords = coords,
            alertTime = Config.Dispatch.Time,
            blip = {
                sprite = Config.Dispatch.Blip.Sprite,
                color = Config.Dispatch.Blip.Color,
                scale = Config.Dispatch.Blip.Scale,
                shortRange = true,
                name = Config.Dispatch.Blip.Text,
            }
        })
        return false
    elseif Config.Dispatch.Resource == 'pp-mdt' then
        exports['pp-mdt']:AddDispatchCall({
            title = Config.Dispatch.Title,
            description = Config.Dispatch.Message,
            showCitizen = 'gender',
            coords = coords,
        })
        return false
    elseif Config.Dispatch.Resource == 'core' then
        exports['core_dispatch']:addCall(Config.Dispatch.Code,  Config.Dispatch.Title..' - '..Config.Dispatch.Message, {coords}, "police", Config.Dispatch.Time * 1000, Config.Dispatch.Blip.Sprite, Config.Dispatch.Blip.Color, false)
        return false
    elseif Config.Dispatch.Resource == 'emergencydispatch' then
        TriggerEvent('emergencydispatch:emergencycall:new', PoliceJobs[1], Config.Dispatch.Title..' - '..Config.Dispatch.Message, coords, true)
        return false
    elseif Config.Dispatch.Resource == 'wasabimdt' then
        local Street, Zone = GetStreetAndZone(source, coords)
        local data = {
            type = "robbery",
            title = Config.Dispatch.Title,
            description = Config.Dispatch.Message,
            location = Street..", "..Zone,
            coords = { x = coords.x, y = coords.y, z = coords.z },
            priority = 2,
            departments = PoliceJobs,
        }
        exports.wasabi_mdt:CreateDispatch(data)
        return false
    elseif Config.Dispatch.Resource == 'nextscripts' then
        exports.dispatch:CreateDispatchNotify(Config.Dispatch.Title, Config.Dispatch.Message, PoliceJobs[1], coords, source)
        return false
    elseif Config.Dispatch.Resource == 'kibra' then
        exports["kibra-dispatch"]:SendAlert(source, Config.Dispatch.Title, Config.Dispatch.Code, 'fa-solid fa-mask', PoliceJobs, Config.Dispatch.Blip.Sprite)
        return false
    elseif Config.Dispatch.Resource == 'imperial' then
        local Street, Zone = GetStreetAndZone(source, coords)
        exports["ImperialCAD"]:Create911Call({
            name = "Dispatch",
            street = Street,
            crossStreet = Zone,
            postal = "-",
            city = "Los Santos",
            county = "Los Santos County",
            info = Config.Dispatch.Title..' - '..Config.Dispatch.Message,
        })
        return false
    elseif Config.Dispatch.Resource == 'default' then
        if Config.Framework == "esx" then PdNotify(coords) end
        return false
    elseif Config.Dispatch.Resource == 'customsv' then
        -- Add your custom dispatch here
        return false
    else
        return true, PoliceJobs, coords
    end
end)