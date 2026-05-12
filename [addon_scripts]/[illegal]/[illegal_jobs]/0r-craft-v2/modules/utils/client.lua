--[[ Contains client-side helper functions. ]]

local Utils = {}

---@param title string
---@param type 'inform'|'error'|'success'|'warning'
---@param duration number
---@param description string
function Utils.notify(title, type, duration, description)
    lib.notify({
        title = title,
        type = type or 'inform',
        duration = duration,
        description = description,
        position = 'top-right',
    })
end

---@param text string
---@param options? TextUIOptions
function Utils.showTextUI(text, options)
    lib.showTextUI(text, options)
end

function Utils.hideTextUI()
    lib.hideTextUI()
end

---Change HUD visibility
---@param state boolean
function Utils.toggleHud(state)
    if shared.isResourceStart('0r-hud-v3') then
        exports['0r-hud-v3']:ToggleVisible(state)
    else
        -- ? Your hud script export
    end
end

--[[!!! It is not recommended to change the functions from here on if you are not familiar with them !!!]]

---@param model string
---@param coords vector3
---@param rotation vector3
---@param freeze boolean
---@param isNetwork boolean
---@param doorFlag boolean
---@return integer
function Utils.createObject(model, coords, rotation, freeze, isNetwork, doorFlag)
    if freeze == nil then freeze = true end
    if isNetwork == nil then isNetwork = false end
    if doorFlag == nil then doorFlag = false end
    lib.requestModel(model)
    local object = CreateObject(model, coords.x, coords.y, coords.z, isNetwork, isNetwork, doorFlag)
    SetEntityCoords(object, coords.x, coords.y, coords.z, false, false, false, true)
    if rotation then
        if type(rotation) == 'number' then
            rotation = vector3(0.0, 0.0, rotation)
        end
        SetEntityRotation(object, rotation.x, rotation.y, rotation.z, 2, false)
    end
    FreezeEntityPosition(object, freeze)
    SetModelAsNoLongerNeeded(model)
    return object
end

---@param coords vector3
function Utils.getGroundZ(coords)
    local x, y, z = table.unpack(coords)
    local groundCheckHeights = { z, z + 1.0, z + 2.0, z + 3.0, z + 4.0, z + 5.0 }

    for i, height in pairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

        if foundGround then
            return z, true
        end
    end

    return z, false
end

---@param target number|vector3
---@param options object
---@param route boolean
function Utils.addBlip(target, options, route)
    local blip = type(target) == 'number' and
        AddBlipForEntity(target) or
        AddBlipForCoord(vector3(target))

    SetBlipDisplay(blip, 4)
    SetBlipSprite(blip, options.sprite or 469)
    SetBlipColour(blip, options.color or 0)
    SetBlipScale(blip, options.scale or 0.85)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(options.text or 'Undefined')
    EndTextCommandSetBlipName(blip)

    if route then
        local coords = type(target) == 'number' and GetEntityCoords(target) or vector3(target)
        SetNewWaypoint(coords.x, coords.y)
    end

    return blip
end

return Utils
