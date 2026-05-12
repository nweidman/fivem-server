-- crm-core - wait for core to load modules.

crm_core_ready()

-- crm-core - declaring core modules.

local crm_lib = crm_core:crm_lib()

-- crm-radialmenu -

local function crm_is_dead()
    return crm_lib.crm_is_dead()
end

-- crm-radialmenu -

function crm_on_open()
    if crm_is_dead() then return false end -- Radial menu will not open if player is dead.
    return true
end

function crm_on_close()
    return true
end

-- crm-radialmenu -

function crm_on_start()
    RegisterCommand(crm_config.crm_toggle.crm_cmd, function()
        crm_toggle_radial(true)
    end)
    RegisterKeyMapping(crm_config.crm_toggle.crm_cmd, crm_config.crm_toggle.crm_desc, 'keyboard', crm_config.crm_toggle.crm_key)
end

-- crm-radialmenu -

CreateThread(function()
    while true do
        Wait(0)
        if crm_showing then
            DisableControlAction(0, 24, true)  -- Disable attack
            DisableControlAction(0, 140, true) -- Disable melee attack
            DisableControlAction(0, 141, true) -- Disable melee heavy attack
            DisableControlAction(0, 142, true) -- Disable alternative melee attack
            DisableControlAction(0, 143, true) -- Disable melee block
            -- Disable camera movement
            DisableControlAction(0, 1, true)  -- Look Left/Right (Mouse & Controller)
            DisableControlAction(0, 2, true)  -- Look Up/Down (Mouse & Controller)
            DisableControlAction(0, 4, true)  -- Vehicle Look Left/Right
            DisableControlAction(0, 5, true)  -- Vehicle Look Up/Down
        else
            Wait(500) -- Reduce CPU usage when menu is not open
        end
    end
end)