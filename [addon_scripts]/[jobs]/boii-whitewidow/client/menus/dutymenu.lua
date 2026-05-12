----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

local MenuName = Config.CoreSettings.MenuName  -- 'qb-menu' or 'ox_lib'

-- (optional) universal close; keep one copy in your project
RegisterNetEvent('boii-whitewidow:client:StopMenu', function()
    if MenuName == 'qb-menu' then
        TriggerEvent('qb-menu:client:closeMenu')
    elseif lib and lib.hideContext then
        lib.hideContext()
    end
end)

-- Duty menu (qb-menu / ox_lib compatible)
RegisterNetEvent('boii-whitewidow:client:WhiteWidowDutyMenu', function()
    local L = (Language and Language.Locations and Language.Locations.Duty) or {}
    local S = (Language and Language.Shared) or {}

    if MenuName == 'qb-menu' then
        exports['qb-menu']:openMenu({
            {
                header       = L['dutymenuheader'] or 'White Widow',
                txt          = L['dutymenuheadertext'] or 'Duty Menu',
                icon         = L['dutymenuheadericon'] or 'fa-regular fa-id-badge',
                isMenuHeader = true
            },
            {
                header = L['dutytoggle'] or 'Toggle Duty',
                icon   = L['dutytoggleicon'] or 'fa-toggle-on',
                params = { event = 'boii-whitewidow:client:ToggleDuty' }
            },
            {
                header = S['exitmenu'] or 'Close',
                icon   = S['exitmenuicon'] or 'fa-xmark',
                params = { event = 'boii-whitewidow:client:StopMenu' }
            },
        })

    else
        -- ox_lib context
        lib.registerContext({
            id          = 'ww_duty_menu',
            title       = L['dutymenuheader'] or 'White Widow',
            description = L['dutymenuheadertext'] or 'Duty Menu',
            options     = {
                {
                    title = L['dutytoggle'] or 'Toggle Duty',
                    icon  = L['dutytoggleicon'] or 'fa-toggle-on',
                    event = 'boii-whitewidow:client:ToggleDuty'
                },
                {
                    title = S['exitmenu'] or 'Close',
                    icon  = S['exitmenuicon'] or 'fa-xmark',
                    event = 'boii-whitewidow:client:StopMenu'
                }
            }
        })
        lib.showContext('ww_duty_menu')
    end
end)
