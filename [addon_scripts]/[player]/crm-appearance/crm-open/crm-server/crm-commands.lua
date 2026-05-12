-- crm-core - wait for core to load modules.

crm_core_ready()

-- crm-core - declaring core modules.

local crm_lib = crm_core:crm_lib()
local crm_lib_type = crm_lib.crm_info().crm_type
local crm_commands = crm_config.crm_commands

-- crm-appearance - Skin command.

local crm_skin = function(crm_source, crm_args)
    local crm_target = nil
    if crm_lib_type == 'crm_esx' then
        crm_target = crm_args.PlayerId
    else
        crm_target = crm_args[1]
    end
    if not crm_target then crm_target = crm_source end
    TriggerClientEvent('crm-appearance:show-creator-menu', tonumber(crm_target))
end

crm_lib.crm_command(crm_commands.crm_skin.crm_cmd, {crm_help = crm_commands.crm_skin.crm_help, crm_args = crm_commands.crm_skin.crm_args}, {crm_args = false}, crm_commands.crm_skin.crm_perms, function(crm_source, crm_args) 
    crm_skin(crm_source, crm_args)
end)

-- crm-appearance - Reload Skin command.

RegisterCommand(crm_commands.crm_reloadskin.crm_cmd, function(source, args)
    local target = tonumber(args[1]) or source

    TriggerClientEvent('backitems:displayItems', target, false)

    TriggerClientEvent('crm-appearance:load-player-skin', target)

    SetTimeout(500, function()
        TriggerClientEvent('crm-appearance:fixBag', target)
    end)
end, false)