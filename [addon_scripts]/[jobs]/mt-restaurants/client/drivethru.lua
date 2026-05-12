---@param job string
---@param id string | integer
---@param driveThruId string | integer
enteredInDriveThru = function(job, id, driveThruId)
    exports['pma-voice']:setCallChannel(id)
end

---@param job string
---@param id string | integer
---@param driveThruId string | integer
exitInDriveThru = function(job, id, driveThruId)
    exports['pma-voice']:setCallChannel(0)
end

---@param job string
---@param id string | integer
---@param driveThruId string | integer
enteredOutDriveThru = function(job, id, driveThruId)
    lib.callback.await('mt-restaurants:server:playDriveThruAlert', false, job, id)
    exports['pma-voice']:setCallChannel(id)
end

---@param job string
---@param id string | integer
---@param driveThruId string | integer
exitOutDriveThru = function(job, id, driveThruId)
    exports['pma-voice']:setCallChannel(0)
end

RegisterNetEvent('mt-restaurants:client:playDriveThruAlert', function(job, id)
    local coords = Config.restaurants[job].drivethru[id].inCoords
    local pCoords = GetEntityCoords(cache.ped)
    if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, coords.x, coords.y, coords.z, false) <= 10.0 then
        PlaySoundFromCoord(GetSoundId(), "Menu_Accept", coords.x, coords.y, coords.z, "Phone_SoundSet_Default", false, 10.0, false)
        if (getPlayerJob() == job) and playerInsideRestaurant then notify(locale('notify_player_at_drive_thru'), 'info') end
    end
end)