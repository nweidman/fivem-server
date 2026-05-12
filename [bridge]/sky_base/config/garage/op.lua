

if Sky.Config.garage == "op" then
    Sky.Functions = {}


    local DEFAULT_PARKING = "Würfelpark"


    function Sky.Functions.IsPlateUsed(plate)
        local result = Sky.Query('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
        return result[1] ~= nil
    end


    function Sky.Functions.GeneratePlate()
        math.randomseed(GetGameTimer())
        local plate = string.upper(Sky.Math.GetRandomLetters(3) .. Sky.Math.GetRandomNumbers(3))

        if Sky.Functions.IsPlateUsed(plate) then
            return Sky.Functions.GeneratePlate()
        end

        return plate
    end

    function Sky.Functions.GiveVehicle(source, model)
        local player = exports.qbx_core:GetPlayer(source)
        if not player then
            print(('[sky_base][op] Konnte Player %s nicht laden'):format(source))
            return
        end

        local plate = Sky.Functions.GeneratePlate()
        local vehHash = GetHashKey(model)


        local mods = {
            plate = plate,
            model = vehHash
        }


        Sky.Query([[
            INSERT INTO player_vehicles
                (license, citizenid, vehicle, hash, mods, plate, state, garage)
            VALUES
                (?,       ?,         ?,       ?,    ?,    ?,     ?,    ?)
        ]],
        {
            player.PlayerData.license,
            player.PlayerData.citizenid,
            tostring(vehHash),   
            tostring(vehHash),
            json.encode(mods),
            plate,
            1,                   
            DEFAULT_PARKING
        })

  
        TriggerClientEvent('vehiclekeys:client:SetOwner', source, plate)


        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Fahrzeug gekauft',
            description = ('%s [%s] wurde eingelagert (Impound).'):format(model, plate, DEFAULT_PARKING),
            type = 'success',
            duration = 8000
        })

    end

    function Sky.Functions.ChangePlate(oldPlate, newPlate)
        Sky.Query('UPDATE player_vehicles SET plate = ? WHERE plate = ?', {
            newPlate,
            oldPlate
        })
    end
end
