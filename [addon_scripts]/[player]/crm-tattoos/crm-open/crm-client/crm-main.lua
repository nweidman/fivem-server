-- crm-core - wait for core to load modules.

crm_core_ready()

-- crm-tattoos - declaring variables.

local crm_lib = crm_core:crm_lib()

-- crm-tattoos - Execute your custom code when tattoos menu show.

function crm_on_open()
    DisplayRadar(false)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(false)
    end
end

-- crm-tattoos - Execute your custom code when tattoos menu hide.

function crm_on_close()
    crm_reload()
    DisplayRadar(true)
    if GetResourceState('crm-hud') == "started" then
        exports['crm-hud']:crm_toggle_hud(true)
    end
end

-- crm-tattoos - 

function crm_reload()
    if GetResourceState('crm-appearance') == "started" then
        TriggerEvent("crm-appearance:load-player-skin")
    elseif GetResourceState('illenium-appearance') == "started" then
        TriggerEvent("illenium-appearance:client:reloadSkin")
    elseif GetResourceState('skinchanger') == "started" then
        crm_lib.crm_shared().TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    elseif GetResourceState('qb-clothing') == "started" then
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
        TriggerServerEvent("qb-clothing:loadPlayerSkin")
    end
end
