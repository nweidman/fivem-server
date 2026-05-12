-- crm-shopscreator - Execute your custom code when shops menu show.

function crm_shop_open()
    DisplayRadar(false)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(false)
    end
end

-- crm-shopscreator - Execute your custom code when shops menu hide.

function crm_shop_close()
    DisplayRadar(true)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(true)
    end
end

-- crm-shopscreator - Execute your custom code when shops dashboard show.

function crm_dash_open()
    DisplayRadar(false)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(false)
    end
end

-- crm-shopscreator - Execute your custom code when shops dashboard hide.

function crm_dash_close()
    DisplayRadar(true)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(true)
    end
end