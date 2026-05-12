Citizen.CreateThread(function()
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("DisableFlightMusic",true)
end)

CreateThread(function()
    while true do
        Wait(500)
        local gamepad = GetLastInputMethod(2)
        if not gamepad then
           SetPlayerTargetingMode(3)
        else
            Wait(2000)
        end
    end
end)
