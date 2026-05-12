----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

local MenuName = Config.CoreSettings.MenuName  -- 'qb-menu' or 'ox_lib'

-- safe lookup
local function _L(tbl, key, fallback)
    return (tbl and tbl[key]) or fallback
end

-- client proxy -> server (so we don't depend on menu lib's server flag)
RegisterNetEvent('boii-whitewidow:client:RollJointsProxy', function(strain)
    TriggerServerEvent('boii-whitewidow:server:RollJoints', tonumber(strain) or 1)
end)

-- universal close
RegisterNetEvent('boii-whitewidow:client:StopMenu', function()
    if MenuName == 'qb-menu' then
        TriggerEvent('qb-menu:client:closeMenu')
    elseif lib and lib.hideContext then
        lib.hideContext()
    end
end)

-- Joint rolling menu (qb-menu / ox_lib compatible)
RegisterNetEvent('boii-whitewidow:client:RollJointsMenu', function()
    local L = Language and Language.Locations and Language.Locations.Rolling or {}
    local S = Language and Language.Shared or {}

    if MenuName == 'qb-menu' then
        local items = {
            {
                header       = _L(L, 'jointsmenuheader', 'Roll Joints'),
                txt          = _L(L, 'jointsmenuheadertext', ''),
                icon         = _L(L, 'jointsmenuheadericon', 'fa-cannabis'),
                isMenuHeader = true
            }
        }

        for i = 1, 8 do
            items[#items+1] = {
                header = _L(L, ('strain%smenuheader'):format(i), ('Strain %d'):format(i)),
                txt    = _L(L, ('strain%smenuheadertext'):format(i), ''),
                icon   = _L(L, ('strain%smenuheadericon'):format(i), 'fa-leaf'),
                params = {
                    event = 'boii-whitewidow:client:RollJointsProxy',
                    args  = i
                }
            }
        end

        items[#items+1] = {
            header = _L(S, 'exitmenu', 'Close'),
            icon   = _L(S, 'exitmenuicon', 'fa-xmark'),
            params = { event = 'boii-whitewidow:client:StopMenu' }
        }

        exports['qb-menu']:openMenu(items)

    else
        -- ox_lib context menu
        local opts = {}
        for i = 1, 8 do
            opts[#opts+1] = {
                title       = _L(L, ('strain%smenuheader'):format(i), ('Strain %d'):format(i)),
                description = _L(L, ('strain%smenuheadertext'):format(i), ''),
                icon        = _L(L, ('strain%smenuheadericon'):format(i), 'fa-leaf'),
                event       = 'boii-whitewidow:client:RollJointsProxy',
                args        = i
            }
        end
        opts[#opts+1] = {
            title = _L(S, 'exitmenu', 'Close'),
            icon  = _L(S, 'exitmenuicon', 'fa-xmark'),
            event = 'boii-whitewidow:client:StopMenu'
        }

        lib.registerContext({
            id          = 'ww_roll_menu',
            title       = _L(L, 'jointsmenuheader', 'Roll Joints'),
            description = _L(L, 'jointsmenuheadertext', ''),
            options     = opts
        })
        lib.showContext('ww_roll_menu')
    end
end)
