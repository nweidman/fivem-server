lib.addCommand("maxmods", {
    help = "Max Mod Vehicle",
    restricted = 'group.admin'
}, function(source)
    TriggerClientEvent('qbx_smallresources:client:maxmodVehicle', source)

    local player = exports.qbx_core:GetPlayer(source)
    local name   = (player and player.PlayerData and player.PlayerData.name) or GetPlayerName(source)
    local cid    = (player and player.PlayerData and player.PlayerData.citizenid) or 'unknown'
    local ped    = GetPlayerPed(source)
    local coords = ped and GetEntityCoords(ped) or vec3(0.0, 0.0, 0.0)

    local logMsg = (("%s (ID: %d | CID: %s) used /maxmods at coords (%.2f, %.2f, %.2f).")
        :format(name, source, cid, coords.x, coords.y, coords.z))

    TriggerEvent('qb-log:server:CreateLog', 'admin_maxmods', '🚘 Max Mods', 'red', logMsg, false)
end)