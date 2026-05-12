function SendDiscordLog(title, description, color)
    local webhook = "" -- 🔒 Replace this with your secure webhook
    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 and err ~= 200 then
            print("Discord Webhook Error:", err)
        end
    end, "POST", json.encode({
        username = "Give Car Logs",
        embeds = embed
    }), {
        ["Content-Type"] = "application/json"
    })
end

function GeneratePlate()
    local letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    local numbers = '0123456789'
    local plate = ''

    for i = 1, 4 do
        local rand = math.random(1, #letters)
        plate = plate .. letters:sub(rand, rand)
    end

    for i = 1, 4 do
        local rand = math.random(1, #numbers)
        plate = plate .. numbers:sub(rand, rand)
    end

    return plate
end

function GetUniquePlate(callback)
    local plate = GeneratePlate()
    MySQL.Async.fetchAll("SELECT * FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate}, function(result)
        if #result > 0 then
            GetUniquePlate(callback)
        else
            callback(plate)
        end
    end)
end

RegisterNetEvent('jg-advancedgarages:server:addVehicleToGarage')
AddEventHandler('jg-advancedgarages:server:addVehicleToGarage', function(targetId, model)
    local src = source
    local Player = Framework.Server.GetPlayer(src)
    local TargetPlayer = Framework.Server.GetPlayer(targetId)
    local isAdmin = Framework.Server.IsAdmin(src)

    if not isAdmin then
        Framework.Server.Notify(src, "You do not have permission to use this command", "error")
        return
    end

    if not TargetPlayer then
        Framework.Server.Notify(src, "Target player not found", "error")
        return
    end

    local modelHash = GetHashKey(model)
    local vehicleProps = {
        model = modelHash,
        mods = {},
    }

    GetUniquePlate(function(plate)
        MySQL.Async.fetchAll("SELECT * FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate}, function(result)
            if #result > 0 then
                Framework.Server.Notify(src, "Vehicle with this plate is already owned", "error")
            else
                MySQL.Async.execute("INSERT INTO player_vehicles (citizenid, vehicle, hash, mods, plate, garage_id, in_garage) VALUES (?, ?, ?, ?, ?, ?, ?)", {
                    TargetPlayer.PlayerData[Framework.PlayerIdentifier],
                    model,
                    GetHashKey(model),
                    json.encode(vehicleProps),
                    plate,
                    "Legion Square",
                    1
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        Framework.Server.Notify(targetId, "You have received a new vehicle", "success")
                        Framework.Server.Notify(src, "Vehicle given successfully", "success")

                        -- ✅ Safe: Send Discord log here
                        SendDiscordLog("Vehicle Given",
                            "**Admin:** " .. Player.PlayerData.name .. " (" .. src .. ")\n" ..
                            "**Receiver:** " .. TargetPlayer.PlayerData.name .. " (" .. targetId .. ")\n" ..
                            "**Vehicle:** " .. model .. "\n" ..
                            "**Plate:** " .. plate,
                            65280)
                    else
                        Framework.Server.Notify(src, "Failed to give vehicle", "error")
                    end
                end)
            end
        end)
    end)
end)

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    local defaultGarage = "Legion Square"

    MySQL.update.await([[
        UPDATE ]] .. Framework.VehiclesTable .. [[
        SET in_garage = 1
        WHERE in_garage = 0
    ]], {})
end)

lib.callback.register('brazzers-fakeplates:getPlateFromFakePlate', function(source, fakeplate)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE fakeplate = ?', {fakeplate})
    if result then
        return result
    end 
end)

lib.callback.register('brazzers-fakeplates:getFakePlateFromPlate', function(source, plate)
    local result = MySQL.scalar.await('SELECT fakeplate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return result
    end
end)