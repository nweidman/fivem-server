-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local oxState = GetResourceState('ox_lib')
local oxReady = (oxState == 'started' or oxState == 'starting')

local function _progressBar(data)
    if lib and type(lib.progressBar) == 'function' then
        return lib.progressBar(data)
    end
    if exports and exports.ox_lib and exports.ox_lib.progressBar then
        return exports.ox_lib:progressBar(data)
    end
    return false
end

local function _progressCircle(data)
    if lib and type(lib.progressCircle) == 'function' then
        return lib.progressCircle(data)
    end
    if exports and exports.ox_lib and exports.ox_lib.progressCircle then
        return exports.ox_lib:progressCircle(data)
    end
    return false
end

--- @param data table   -- ox_lib progress data (duration, label, canCancel, useWhileDead, disable, anim, prop, onStart, onFinish, etc.)
--- @param uiType "progressBar"|"progressCircle"|string  -- defaults to 'progressBar'
--- @return boolean  -- true if completed, false if cancelled/failed
function WSB.progressUI(data, uiType)
    if not oxReady then
        print('^1[WSB] ox_lib is not running. Start ox_lib to use WSB.progressUI.^0')
        return false
    end

    uiType = (uiType == 'progressCircle' or uiType == 'circle') and 'progressCircle' or 'progressBar'

    if type(data) ~= 'table' then data = {} end
    if data.duration == nil then data.duration = 2500 end

    local ok
    if uiType == 'progressCircle' then
        ok = _progressCircle(data)
    else
        ok = _progressBar(data)
    end

    return ok and true or false
end

function WSB.progressCircle(data) return WSB.progressUI(data, 'progressCircle') end
function WSB.progressBar(data)    return WSB.progressUI(data, 'progressBar')    end

exports('progressUI', function(data, uiType) return WSB.progressUI(data, uiType) end)
exports('progressCircle', function(data) return WSB.progressUI(data, 'progressCircle') end)
exports('progressBar', function(data) return WSB.progressUI(data, 'progressBar') end)
