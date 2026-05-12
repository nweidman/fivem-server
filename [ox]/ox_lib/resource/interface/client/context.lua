--[[
    https://github.com/overextended/ox_lib

    This file is licensed under LGPL-3.0 or higher <https://www.gnu.org/licenses/lgpl-3.0.en.html>

    Copyright © 2025 Linden <https://github.com/thelindat>
]]

local contextMenus = {}
local openContextMenu = nil

---@class ContextMenuItem
---@field title? string
---@field menu? string
---@field icon? string | {[1]: IconProp, [2]: string};
---@field iconColor? string
---@field image? string
---@field progress? number
---@field onSelect? fun(args: any)
---@field arrow? boolean
---@field description? string
---@field metadata? string | { [string]: any } | string[]
---@field disabled? boolean
---@field readOnly? boolean
---@field event? string
---@field serverEvent? string
---@field args? any

---@class ContextMenuArrayItem : ContextMenuItem
---@field title string

---@class ContextMenuProps
---@field id string
---@field title string
---@field menu? string
---@field onExit? fun()
---@field onBack? fun()
---@field canClose? boolean
---@field options { [string]: ContextMenuItem } | ContextMenuArrayItem[]


local ExtraJobs = { -- This is to add jobs to the City Hall Ped for wais-jobpack
    [1] = {
        name = 'Builder Job',
        icon = 'fa-solid fa-hammer',
        coords = vec3(926.7890, -1560.2476, 30.7419),
        label = 'Work on a construction project.',
    },
    [2] = {
        name = 'Garbage Job',
        icon = 'fa-solid fa-trash',
        coords = vec3(-321.3975, -1546.1237, 31.0199),
        label = 'Collect trash bags around the city',
    },
    [3] = {
        name = 'Farming',
        icon = 'fa-solid fa-wheat-awn',
        coords = vec3(2416.17, 4993.71, 46.22),
        label = 'Grow and harvest crops',
    },
    [4] = {
        name = 'Delivery Job',
        icon = 'fa-solid fa-truck-fast',
        coords = vec3(78.6603, 111.7501, 81.1712),
        label = 'Deliver Packages around the city',
    },
    [5] = {
        name = 'Window Cleaning Job',
        icon = 'fa-solid fa-spray-can-sparkles',
        coords = vec3(-1244.1080, -1240.6687, 11.0277),
        label = 'Clean the windows of tall buildings',
    },
    [6] = {
        name = 'Trucking',
        icon = 'fa-solid fa-truck',
        coords = vec3(2695.39, 3399.87, 56.73),
        label = 'Transport goods from the trucking depot',
    },
    [7] = {
        name = 'Hunting',
        icon = 'fa-solid fa-paw',
        coords = vec3(-878.18, 4799.43, 300.68),
        label = 'Track down and skin animals',
    },
}

function SetJobGPS(coords)
    if not coords then return end
    SetNewWaypoint(coords.x, coords.y)
    exports.qbx_core:Notify("Location has been marked on your map", 'info')
end

RegisterNetEvent('wais-jobpack:setJobGPS', function(coords)
    SetJobGPS(coords)
end)


local function closeContext(_, cb, onExit)
    if cb then cb(1) end

    lib.resetNuiFocus()

    if not openContextMenu then return end

    if (cb or onExit) and contextMenus[openContextMenu].onExit then contextMenus[openContextMenu].onExit() end

    if not cb then SendNUIMessage({ action = 'hideContext' }) end

    openContextMenu = nil
end

---@param id string
function lib.showContext(id)
    if not contextMenus[id] then error('No context menu of such id found.') end

    local data = contextMenus[id]
    openContextMenu = id

    lib.setNuiFocus(false)

    SendNuiMessage(json.encode({
        action = 'showContext',
        data = {
            title = data.title,
            canClose = data.canClose,
            menu = data.menu,
            options = data.options
        }
    }, { sort_keys = true }))
end

---@param context ContextMenuProps | ContextMenuProps[]
function lib.registerContext(context)
    -- If it's the wais-jobpack cityhall ped, add the other jobs
    if context.id == 'job_center' then 
        for i = 1, #ExtraJobs, 1 do
            context.options[#context.options+1] = {
                title = ExtraJobs[i].name,
                icon = ExtraJobs[i].icon,
                description = ExtraJobs[i].label,
                event = 'wais-jobpack:setJobGPS',
                args = ExtraJobs[i].coords,
            }
        end
        table.sort(context.options, function(a, b)
            return a.title:lower() < b.title:lower()
        end)
    end

    for k, v in pairs(context) do
        if type(k) == 'number' then
            contextMenus[v.id] = v
        else
            contextMenus[context.id] = context
            break
        end
    end
end

---@return string?
function lib.getOpenContextMenu() return openContextMenu end

---@param onExit boolean?
function lib.hideContext(onExit) closeContext(nil, nil, onExit) end

RegisterNUICallback('openContext', function(data, cb)
    if data.back and contextMenus[openContextMenu].onBack then contextMenus[openContextMenu].onBack() end
    cb(1)
    lib.showContext(data.id)
end)

RegisterNUICallback('clickContext', function(id, cb)
    cb(1)

    if math.type(tonumber(id)) == 'float' then
        id = math.tointeger(id)
    elseif tonumber(id) then
        id += 1
    end

    local data = contextMenus[openContextMenu].options[id]

    if not data.event and not data.serverEvent and not data.onSelect then return end

    openContextMenu = nil

    SendNUIMessage({ action = 'hideContext' })
    lib.resetNuiFocus()

    if data.onSelect then data.onSelect(data.args) end
    if data.event then TriggerEvent(data.event, data.args) end
    if data.serverEvent then TriggerServerEvent(data.serverEvent, data.args) end
end)

RegisterNUICallback('closeContext', closeContext)



