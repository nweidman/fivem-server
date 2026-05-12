----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

local MenuName = Config.CoreSettings.MenuName  -- 'qb-menu' or 'ox_lib'

-- tiny helpers
local function _L(tbl, key, fallback)
    return (tbl and tbl[key]) or fallback
end

-- client proxy -> server (so menu libs don't need special server flags)
RegisterNetEvent('boii-whitewidow:client:TrimWeedProxy', function(strain)
    TriggerServerEvent('boii-whitewidow:server:TrimWeed', tonumber(strain) or 1)
end)

-- close menu for both libs
RegisterNetEvent('boii-whitewidow:client:StopMenu', function()
    if MenuName == 'qb-menu' then
        TriggerEvent('qb-menu:client:closeMenu')
    elseif lib and lib.hideContext then
        lib.hideContext()
    end
end)

-- Trimming menu (qb-menu / ox_lib compatible)
RegisterNetEvent('boii-whitewidow:client:TrimmingMenu', function()
    local L = Language and Language.Locations and Language.Locations.Trimming or {}
    local S = Language and Language.Shared or {}

    if MenuName == 'qb-menu' then
        -- qb-menu structure
        local items = {
            {
                header = _L(L, 'trimmenuheader', 'Trimming'),
                txt    = _L(L, 'trimmenuheadertext', ''),
                icon   = _L(L, 'trimmenuheadericon', 'fa-scissors'),
                isMenuHeader = true
            }
        }

        for i = 1, 8 do
            items[#items+1] = {
                header = _L(L, ('strain%smenuheader'):format(i), ('Strain %d'):format(i)),
                txt    = _L(L, ('strain%smenuheadertext'):format(i), ''),
                icon   = _L(L, ('strain%smenuheadericon'):format(i), 'fa-leaf'),
                params = {
                    event = 'boii-whitewidow:client:TrimWeedProxy',
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
                event       = 'boii-whitewidow:client:TrimWeedProxy',
                args        = i
            }
        end
        opts[#opts+1] = {
            title = _L(S, 'exitmenu', 'Close'),
            icon  = _L(S, 'exitmenuicon', 'fa-xmark'),
            event = 'boii-whitewidow:client:StopMenu'
        }

        lib.registerContext({
            id = 'ww_trimming_menu',
            title       = _L(L, 'trimmenuheader', 'Trimming'),
            description = _L(L, 'trimmenuheadertext', ''),
            options     = opts
        })
        lib.showContext('ww_trimming_menu')
    end
end)
