local allActions = require('config.commands').actions

local function DrawText3D(x, y, z, text, type)
    local cfg = (allActions[type] and allActions[type].drawText) or {}
    z = z + (cfg.z or 0.0)

    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if not onScreen then return end

    SetTextScale(0.50, 0.50)
    SetTextFont(2)  -- force font 7
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(_x, _y)
end

return DrawText3D
