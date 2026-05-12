if Sky.Config.garage == "bp" then
    Sky.Functions = {}

    function Sky.Functions.IsPlateUsed(plate)
        local result = Sky.Query('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
        return result[1] ~= nil
    end

    function Sky.Functions.GeneratePlate() 
        math.randomseed(GetGameTimer())
        local plate = string.upper(Sky.Math.GetRandomLetters(3)..''..Sky.Math.GetRandomNumbers(3))

        if Sky.Functions.IsPlateUsed(plate) then
            return Sky.Functions.GeneratePlate()
        end

        return plate
    end

    function Sky.Functions.GiveVehicle(source, model)
        -- local plate = Sky.Functions.GeneratePlate()
        -- local mods = Sky.Cb.Trigger("sky_base:getVehicleMods", source, model)

        -- TriggerEvent('bp_garage:addvehiclefrominfo', source, plate, GetHashKey(model), model, false, mods)

        Sky.Cb.Trigger("sky_base:giveVehicleClient", source, model)

        -- TriggerClientEvent('vehiclekeys:client:SetOwner', source, plate)
    end

    function Sky.Functions.ChangePlate(oldPlate, newPlate)
        Sky.Query('UPDATE player_vehicles SET plate = ? WHERE plate = ?', {newPlate, oldPlate})
    end
end