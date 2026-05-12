RegisterCommand("seat", function(_, args)
    local seat = tonumber(args[1])
    local ped = PlayerPedId()

    if not IsPedInAnyVehicle(ped, false) then
        notify("~r~You must be in a vehicle to change seats.")
        return
    end

    if seat == nil or seat < -1 or seat > 10 then
        notify("~r~Invalid seat number. Use -1 for driver, 0+ for passengers.")
        return
    end

    local vehicle = GetVehiclePedIsIn(ped, false)
    local currentSeat = -1

    for i = -1, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) - 1 do
        if GetPedInVehicleSeat(vehicle, i) == ped then
            currentSeat = i
            break
        end
    end

    if currentSeat == seat then
        notify("~y~You are already in seat " .. seat .. ".")
        return
    end

    if GetPedInVehicleSeat(vehicle, seat) ~= 0 then
        notify("~r~Seat " .. seat .. " is already occupied.")
        return
    end

    TaskWarpPedIntoVehicle(ped, vehicle, seat)
    notify("~g~Moved to seat " .. seat .. ".")
end, false)

function rgbToHex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end
