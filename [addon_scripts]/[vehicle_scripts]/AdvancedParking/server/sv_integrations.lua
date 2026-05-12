local Ox = GetResourceState("ox_core") == "started" and exports["ox_core"] or nil

function IsOwnedVehicle(plate, vehicle)
    if (Ox) then
        return Ox:GetVehicle(vehicle) ~= nil
    end

    return Storage.IsVehicleOwned(plate) == true
end

function StoreVehicle(plate, vehicle, garageName)
    if (Ox) then
        if (vehicle) then
            local oxVeh = Ox:GetVehicle(vehicle)
            if (oxVeh) then
                oxVeh.setStored()
            end
        end
        return
    end

    Storage.StoreVehicleInGarage(plate, garageName)
end
