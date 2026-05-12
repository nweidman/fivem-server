local shared = lib.require('configs.shared')

local utils = {}

function utils.distanceCheck(src, printerCoords)
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local dist = #(coords - vec3(printerCoords.x, printerCoords.y, printerCoords.z))

    return dist <= 3
end

-- function utils.hasAllowedJob(src, checkJob)
--     local Player = exports.qbx_core:GetPlayer(src)
--     if checkJob and checkJob == Player.PlayerData.citizenid then
--             return true, checkJob
--     end

--     return false
-- end

return utils