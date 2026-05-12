local performanceModIndices = { 11, 12, 13, 15, 16 }
function PerformanceUpgradeVehicle(vehicle, customWheels)
    customWheels = customWheels or false
    local max
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleModKit(vehicle, 0)
        for _, modType in ipairs(performanceModIndices) do
            max = GetNumVehicleMods(vehicle, tonumber(modType)) - 1
            SetVehicleMod(vehicle, modType, max, customWheels)
        end
        ToggleVehicleMod(vehicle, 18, true) -- Turbo
        SetVehicleFixed(vehicle)
    end
end

RegisterNetEvent('qbx_smallresources:client:maxmodVehicle', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    PerformanceUpgradeVehicle(vehicle)
end)