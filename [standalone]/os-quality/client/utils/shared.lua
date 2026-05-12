local hasOx = GetResourceState('ox_lib') == 'started'

_G.QBCore = _G.QBCore or exports['qb-core']:GetCoreObject()

---Simple notification helper used by a couple modules.
---@param msg string
---@param nType string|nil
function notify(msg, nType)
    if hasOx and lib and lib.notify then
        lib.notify({ description = msg, type = nType or 'inform' })
    elseif QBCore and QBCore.Functions and QBCore.Functions.Notify then
        QBCore.Functions.Notify(msg, nType or 'primary')
    else
        print(('[os-quality] %s'):format(msg))
    end
end
