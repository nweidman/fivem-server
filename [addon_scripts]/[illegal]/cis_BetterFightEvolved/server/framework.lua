Citizen.CreateThread(function()

    while Config == nil or Security == nil do
        Citizen.Wait(100)
    end

    if(Config.MeleeOneShotPrevention)then
        --Revive Event, Edit with your code if needed
        RegisterServerEvent(Security.EventPrefix .. ":server:frameworkRev", function(data)
            Config.Framework = "QBOX"
            if(Config.Framework == "QBOX")then
                TriggerClientEvent('qbx_medical:client:playerRevived', data.source)
            elseif(Config.Framework == "QBCORE")then
                TriggerClientEvent('hospital:client:Revive', data.source)
            elseif(Config.Framework == "ESX")then
                TriggerClientEvent('esx_ambulancejob:revive', data.source)
            end
        end)
    end
end)