if Sky.Config.garage == "hex" then
    Sky.Functions = {}

    function Sky.Functions.IsPlateUsed(plate)
        local result = Sky.Query('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
        return result[1] ~= nil
    end

    function Sky.Functions.GeneratePlate() 
        math.randomseed(GetGameTimer())
        local plate = string.upper(Sky.Math.GetRandomLetters(3)..' '..Sky.Math.GetRandomNumbers(3))

        if Sky.Functions.IsPlateUsed(plate) then
            return Sky.Functions.GeneratePlate()
        end

        return plate
    end

    function Sky.Functions.GiveVehicle(source, model)
        local plate = Sky.Functions.GeneratePlate()

        local mods = Sky.Cb.Trigger("sky_base:getVehicleMods", source, model)
        mods.plate = plate
        local vehicleType = "car"
        if mods.class == 14 then
            vehicleType = "boat"
        elseif mods.class == 15 or mods.class == 16 then
            vehicleType = "air"
        end

        local xPlayer = ESX.GetPlayerFromId(source)
        Sky.Query('INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored, job) VALUES (@owner, @plate, @vehicle, @type, @stored, @job)',
        {
            ['@owner'] = xPlayer.identifier,
            ['@plate'] = plate,
            ['@vehicle'] = json.encode(mods),
            ['@type'] = vehicleType, 
            ['@stored'] = 1,
            ['@job'] = 'civ',
        })
    end

    function Sky.Functions.ChangePlate(oldPlate, newPlate)
        Sky.Query('UPDATE owned_vehicles SET plate = @newPlate WHERE plate = @oldPlate', {
            ['@newPlate'] = newPlate,
            ['@oldPlate'] = oldPlate
        })
    end
end