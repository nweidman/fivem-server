local BDc = {}

function BDc.HasKeys(plate)
    if GetResourceState('qbx_vehiclekeys'):match('started') then
        return exports.qbx_vehiclekeys:HasKeys(plate)

    elseif GetResourceState('Renewed-Vehiclekeys'):match('started') then
        return exports['Renewed-Vehiclekeys']:hasKey(plate)

    else
        -- Insert your own key system here
        return false
    end
end

return BDc
