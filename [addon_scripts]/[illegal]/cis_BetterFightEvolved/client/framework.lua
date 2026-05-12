Citizen.CreateThread(function()

    while Config == nil or Security == nil do
        Citizen.Wait(100)
    end

    if(Config.MeleeOneShotPrevention)then
        RegisterNetEvent(Security.EventPrefix .. ":client:rev", function(data)
            TriggerEvent("qbx_medical:client:playerRevived")
        end)
    end
end)