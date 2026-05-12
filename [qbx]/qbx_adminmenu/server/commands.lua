local config = require 'config.server'.commandPerms

-- lib.addCommand('report', {
--     help = 'Send Report',
--     params = {
--         {name = 'report', help = 'Your report message', type = 'string'}
--     }
-- }, function(source, args, raw)
--     SendReport(source, string.sub(raw, 8))
-- end)

lib.addCommand('admin', {
    help = 'Opens Admin Menu',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:openMenu', source)
end)

lib.addCommand('noclip', {
    help = 'Toggle NoClip',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:ToggleNoClip', source)
end)

lib.addCommand('names', {
    help = 'Toggle Player Names',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:names', source)
end)

lib.addCommand('blips', {
    help = 'Toggle Player Blips',
    restricted = 'group.admin',
}, function(source)
    TriggerClientEvent('qbx_admin:client:blips', source)
end)

lib.addCommand('admincar', {
    help = 'Buy Vehicle',
    restricted = 'group.admin',
}, function(source)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
    if vehicle == 0 then
        return exports.qbx_core:Notify(source, 'You have to be in a vehicle, to use this', 'error')
    end

    local vehModel = GetEntityModel(vehicle)

    if not exports.qbx_core:GetVehiclesByHash()[vehModel] then
        return exports.qbx_core:Notify(source, 'Unknown vehicle, please contact your developer to register it.', 'error')
    end

    local playerData = exports.qbx_core:GetPlayer(source).PlayerData
    local vehName, props = lib.callback.await('qbx_admin:client:GetVehicleInfo', source)
    local existingVehicleId = Entity(vehicle).state.vehicleid
    if existingVehicleId then
        local response = lib.callback.await('qbx_admin:client:SaveCarDialog', source)

        if not response then
            return exports.qbx_core:Notify(source, 'Canceled.', 'inform')
        end
        local success, err = exports.qbx_vehicles:SetPlayerVehicleOwner(existingVehicleId, playerData.citizenid)
        if not success then error(err) end
    else
        local vehicleId, err = exports.qbx_vehicles:CreatePlayerVehicle({
            model = vehName,
            citizenid = playerData.citizenid,
            props = props,
        })
        if err then error(err) end
        Entity(vehicle).state:set('vehicleid', vehicleId, true)
    end
    exports.qbx_core:Notify(source, 'This vehicle is now yours.', 'success')
end)

lib.addCommand('setmodel', {
    help = 'Sets your model to the given model',
    restricted = 'group.admin',
    params = {
        {name = 'model', help = 'NPC Model', type = 'string'},
        {name = 'id', help = 'Player ID', type = 'number', optional = true},
    }
}, function(source, args)
    local Target = args.id or source

    if not exports.qbx_core:GetPlayer(Target) then return end
    local Player = exports.qbx_core:GetPlayer(source)
    local TPlayer = exports.qbx_core:GetPlayer(Target)
    local logMsg = ('**ADMIN**\n**Name: **%s\n**Character Name: **%s\n**Citizen ID: **%s\n**License: ** %s\n\n**TARGET**\n**Name: **%s\n**Character Name: **%s\n**Citizen ID: **%s\n**License: ** %s\n\n**MODEL**\n%s'):format(
                    GetPlayerName(source),
                    Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
                    Player.PlayerData.citizenid,
                    Player.PlayerData.license,
                    GetPlayerName(Target),
                    TPlayer.PlayerData.charinfo.firstname .. " " .. TPlayer.PlayerData.charinfo.lastname,
                    TPlayer.PlayerData.citizenid,
                    TPlayer.PlayerData.license,
                    tostring(args.model)
                )
                TriggerEvent('qb-log:server:CreateLog', 'admin_setmodel', '👙 /setmodel', 'red', logMsg, false)
    TriggerClientEvent('qbx_admin:client:setModel', Target, args.model)
end)

lib.addCommand('vec2', {
    help = 'Copy vector2 to clipboard (Admin only)',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:copyToClipboard', source, 'coords2')
end)

lib.addCommand('vec3', {
    help = 'Copy vector3 to clipboard (Admin only)',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:copyToClipboard', source, 'coords3')
end)

lib.addCommand('vec4', {
    help = 'Copy vector4 to clipboard (Admin only)',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:copyToClipboard', source, 'coords4')
end)

lib.addCommand('heading', {
    help = 'Copy heading to clipboard (Admin only)',
    restricted = 'group.mod',
}, function(source)
    TriggerClientEvent('qbx_admin:client:copyToClipboard', source, 'heading')
end)

    -- /Thunder

lib.addCommand('thunder', {
    help = (Lang and Lang.t and Lang:t("commands.thunder_sound")) or 'Play the Thunder sound globally',
    restricted = "group.admin",
}, function(source, args)
    if GetResourceState('interact-sound') == 'started' or GetResourceState('InteractSound') == 'started' then
        TriggerEvent('InteractSound_SV:PlayOnAll', "thunder", 5.0)
    end
end)

    -- Banned Thunda

AddEventHandler('txAdmin:events:playerBanned', function(data)
    TriggerEvent('InteractSound_SV:PlayOnAll', "thunder", 5.0)
end)

-- server.lua

-- small helper so we can notify even if qbx_core isn't running
local function notify(src, msg, ntype, dur)
    if GetResourceState('qbx_core') == 'started' then
        exports.qbx_core:Notify(src, msg, ntype or 'inform', dur or 5000)
    else
        TriggerClientEvent('chat:addMessage', src, { args = { '^1SYSTEM', msg } })
    end
end

-- qbx_core permission check (adjust groups if yours differ)
local function isAdmin(src)
    if GetResourceState('qbx_core') ~= 'started' then return false end
    local p = exports.qbx_core:GetPermission(src) or {}
    return p.admin or p.mod
end

    -- /Openinv

lib.addCommand('openinv', {
    help = 'Open a player\'s inventory',
    params = {
        { name = 'id', help = 'Target server ID', type = 'number' },
    },
    restricted = 'group.mod',
    },
    function(source, args, raw)
    local src = source
    if src == 0 then
        print('[openinv] Console cannot use this command.')
        return
    end

    if GetResourceState('ox_inventory') ~= 'started' then
        notify(src, 'ox_inventory is not running.', 'error')
        return
    end

    local playerid = tonumber(args.id or args[1])
    if not playerid then
        notify(src, 'Usage: /openinv <player id>', 'error')
        return
    end
    if playerid == src then
        notify(src, "You can't open your own inventory!", 'error')
        return
    end

    if GetResourceState('qbx_core') ~= 'started' then
        notify(src, 'qbx_core is not running.', 'error')
        return
    end

    local Player  = exports.qbx_core:GetPlayer(src)
    if not Player then return end

    local TPlayer = exports.qbx_core:GetPlayer(playerid)
    if not TPlayer then
        notify(src, 'The player ID you specified is not online!', 'error')
        return
    end

    exports.ox_inventory:forceOpenInventory(src, 'player', playerid)
        local logMsg = ('**ADMIN**\n**Name: **%s\n**Character Name: **%s\n**Citizen ID:** %s\n**License: **%s\n\n**TARGET**\n**Name: **%s\n**Character Name: **%s\n**Citizen ID:** %s\n**License: **%s'):format(
            GetPlayerName(src),
            Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
            Player.PlayerData.citizenid,
            Player.PlayerData.license,
            GetPlayerName(playerid),
            TPlayer.PlayerData.charinfo.firstname .. " " .. TPlayer.PlayerData.charinfo.lastname,
            TPlayer.PlayerData.citizenid,
            TPlayer.PlayerData.license
        )
        TriggerEvent('qb-log:server:CreateLog', 'admin_openinv', '💼 /openinv', 'red', logMsg, false)
end)

    --/DVP

    lib.addCommand('dvp', {
    help = 'Delete nearby peds within a radius',
    params = {
        {
            name = 'radius',
            type = 'number',
            help = 'Radius around you to delete peds'
        }
    },
    restricted = 'group.admin'
}, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)

    local radius = tonumber(args.radius) or 50.0

    local peds = GetGamePool('CPed')
    local deleted = 0

    for _, pedEntity in ipairs(peds) do
        if DoesEntityExist(pedEntity) and not IsPedAPlayer(pedEntity) then
            local pedCoords = GetEntityCoords(pedEntity)
            if #(coords - pedCoords) <= radius then
                DeleteEntity(pedEntity)
                deleted += 1
            end
        end
    end

    lib.notify(src, {
        title = 'DVP',
        description = ('Deleted %s peds within %sm radius'):format(deleted, radius),
        type = 'success'
    })
    local Player = exports.qbx_core:GetPlayer(source)
    local logMsg = ('**ADMIN**\n**Name:** %s\n**Character Name: **%s\n**Citizen ID: **%s\n**License:** %s\n\n**RADIUS**\n**Radius: **%s'):format(
        GetPlayerName(source),
        Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        Player.PlayerData.citizenid,
        Player.PlayerData.license,
        args.radius or '50.0'
    )
    TriggerEvent('qb-log:server:CreateLog', 'admin_dv', '🪄 /dvp', 'white', logMsg, false)
end)

    -- /DVO

lib.addCommand('dvo', {
    help = 'Delete nearby objects within a radius',
    params = {
        {
            name = 'radius',
            type = 'number',
            help = 'Radius around you to delete objects (default 50)'
        }
    },
    restricted = 'group.admin'
}, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local radius = tonumber(args.radius) or 50.0

    local objects = GetAllObjects()
    local deleted = 0

    for _, obj in ipairs(objects) do
        if DoesEntityExist(obj) then
            local objCoords = GetEntityCoords(obj)
            if #(coords - objCoords) <= radius then
                DeleteEntity(obj)
                deleted += 1
            end
        end
    end

    lib.notify(src, {
        title = 'DVO',
        description = ('Deleted %s objects within %sm radius'):format(deleted, radius),
        type = 'success'
    })
    local Player = exports.qbx_core:GetPlayer(source)
    local logMsg = ('**ADMIN**\n**Name:** %s\n**Character Name: **%s\n**Citizen ID: **%s\n**License:** %s\n\n**RADIUS**\n**Radius: **%s'):format(
        GetPlayerName(source),
        Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        Player.PlayerData.citizenid,
        Player.PlayerData.license,
        args.radius or '50.0'
    )
    TriggerEvent('qb-log:server:CreateLog', 'admin_dv', '🪄 /dvo', 'white', logMsg, false)
end)