if Sky.Config.garage == "quasar" then
    Sky.Functions = {}

    function Sky.Functions.IsPlateUsed(plate)
        if Sky.Config.framework == "esx" then
            result = Sky.Query('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
        elseif Sky.Config.framework == "qb" then
            result = Sky.Query('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
        end
        return result[1] ~= nil
    end

    function Sky.Functions.GeneratePlate() 
        math.randomseed(GetGameTimer())
        local plate = string.upper(Sky.Math.GetRandomLetters(4)..''..Sky.Math.GetRandomNumbers(4))

        if Sky.Functions.IsPlateUsed(plate) then
            return Sky.Functions.GeneratePlate()
        end

        return plate
    end

    function Sky.Functions.GiveVehicle(source, model)
        local plate = Sky.Functions.GeneratePlate()
    
        local mods = Sky.Cb.Trigger("sky_base:getVehicleMods", source, model)
        mods.plate = plate
        local vehicleType = "vehicle"
        local garage = "Legion Square"

        if mods.class == 14 then
            garage = "La Puerta Pier"
            vehicleType = "boat"
        elseif mods.class == 15 or mods.class == 16 then
            garage = "Airport Hangar"
            vehicleType = "plane"
        end

        if Sky.Config.framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(source)
            Sky.Query('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, garage, type) VALUES (@owner, @plate, @vehicle, @stored, @garage, @type)',
            {
                ['@owner']   = xPlayer.identifier,
                ['@plate']   = plate,
                ['@vehicle'] = json.encode(mods),
                ['@stored'] = 1,
                ['@garage'] = garage,
                ['@type'] = vehicleType
            })
        elseif Sky.Config.framework == "qb" then
            local pData = QBCore.Functions.GetPlayer(source)
            Sky.Query('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                string.gsub(pData.PlayerData.license, "license:", ""),
                pData.PlayerData.citizenid, 
                model, 
                GetHashKey(model),
                json.encode(mods), 
                plate,
                garage
            })
        end
        TriggerClientEvent('vehiclekeys:client:SetOwner', source, plate)
    end

    function Sky.Functions.ChangePlate(oldPlate, newPlate)
        Sky.Query('UPDATE owned_vehicles SET plate = @newPlate WHERE plate = @oldPlate', {
            ['@newPlate'] = newPlate,
            ['@oldPlate'] = oldPlate
        })
    end
end