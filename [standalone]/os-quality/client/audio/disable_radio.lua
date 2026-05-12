local function ForceRadioOff()
    local ped = PlayerPedId()
    if not DoesEntityExist(ped) then return end

    SetUserRadioControlEnabled(false)
    SetRadioToStationName("OFF")
    SetFrontendRadioActive(false)
    SetMobileRadioEnabledDuringGameplay(false)

    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            SetVehRadioStation(veh, "OFF")
            SetVehicleRadioEnabled(veh, false)
            SetVehicleRadioLoud(veh, false)
        end
    end
end

local function ForceRadioOffWithSafety()
    ForceRadioOff()
    SetTimeout(250, function()
        ForceRadioOff()
    end)
end

AddEventHandler("onClientResourceStart", function(resName)
    if resName ~= GetCurrentResourceName() then return end
    ForceRadioOffWithSafety()
end)

AddEventHandler("playerSpawned", function()
    ForceRadioOffWithSafety()
end)

AddEventHandler("gameEventTriggered", function(name, args)
    if name == "CEventNetworkPlayerEnteredVehicle"
    or name == "CEventNetworkPlayerExitedVehicle"
    or name == "CEventNetworkPlayerEnteredVehicleSeat"
    then
        ForceRadioOffWithSafety()
    end
end)
