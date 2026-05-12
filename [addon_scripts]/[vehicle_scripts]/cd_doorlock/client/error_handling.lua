-- ┌──────────────────────────────────────────────────────────────────┐
-- │                               BRIDGE                             │
-- └──────────────────────────────────────────────────────────────────┘ 

local function HandleBridgeStart()
    TriggerServerEvent('cd_doorlock:PlayerLoaded')
end

AddEventHandler('cd_bridge:TriggerStartEvents', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    HandleBridgeStart()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    HandleBridgeStart()
end)

-- ┌──────────────────────────────────────────────────────────────────┐
-- │                               DEBUG                              │
-- └──────────────────────────────────────────────────────────────────┘ 

-- client
RegisterNetEvent('cd_doorlock:DebugPrint')
AddEventHandler('cd_doorlock:DebugPrint', function(lines)
    Citizen.Trace(table.concat(lines, '\n') .. '\n')
end)