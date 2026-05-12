-- crm-core - wait for core to load modules.

crm_core_ready()

-- crm-core - declaring core modules.

local crm_lib = crm_core:crm_lib()
local crm_inv = crm_core:crm_inv()

-- crm-shopscreator - 

function crm_logs(crm_source, crm_msg)
    if not crm_config.crm_logs then return end
    local crm_name = GetPlayerName(crm_source) or "Unknown"
    print("^2[crm-logs]^7 Executor: " .. crm_name .. " (ID: " .. crm_source .. ") | Operation: " .. crm_msg)
end

-- crm-shopscreator - Command to open shops management dashboard.

crm_is_allowed = function(crm_source) -- used in events to prevent cheat.
    if not IsPlayerAceAllowed(crm_source, 'command') then 
        crm_logs(crm_source, "^1[crm-anticheat] ^7Unauthorized access attempt to admin function.")
        return false 
    end
    return true
end

crm_lib.crm_command(crm_config.crm_dashboard.crm_cmd, {crm_help = crm_config.crm_dashboard.crm_help, crm_args = {}}, {crm_args = false}, crm_config.crm_dashboard.crm_perms, function(crm_source, crm_args) 
    if crm_is_allowed(crm_source) then TriggerClientEvent('crm-shopscreator:open-dashboard', crm_source) end
end)

-- crm-shopscreator - 

function crm_give_item(crm_source, crm_name, crm_quantity)
    local metadata = {}
    local serial = 'N/A'
    if crm_name and crm_name:lower():find("weapon_") then
        local QBCore = exports['qb-core']:GetCoreObject()
        serial = QBCore.Shared.RandomInt(2)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomInt(3)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)..QBCore.Shared.RandomStr(1)
        exports.drx_mdt:CreateWeapon(serial, { source = crm_source }, crm_name, exports.ox_inventory:Items(crm_name).label)
        metadata.serial =  serial
    end
    local Player = exports.qbx_core:GetPlayer(crm_source)
    local data = {
        {
            ["color"] = '6730495',
            ["title"] = "**".. Player.PlayerData.charinfo.firstname .." "..Player.PlayerData.charinfo.lastname.."**",
            ["description"] = 'Item: '..exports.ox_inventory:Items(crm_name).label..'\nAmount: '..crm_quantity..'\nSerial #'..serial,
        }
    }
    PerformHttpRequest('', function(err, text, headers) end, 'POST', json.encode({username = 'Armory', embeds = data}), { ['Content-Type'] = 'application/json' })
    crm_inv.crm_add(crm_source, crm_name, crm_quantity, nil, metadata, "armory purchase")
end

-- crm-shopscreator - 

function crm_give_society(crm_type, crm_value, crm_total)
    -- crm_type: crm_jobs or crm_gangs
    -- crm_value: account name (example: police, ambulance, vagos...)
    if not crm_config.crm_society.crm_enable then return end
    local crm_resource = crm_config.crm_society.crm_resource
    if crm_resource == "crm-banking" then
        exports["crm-banking"]:addSocietyMoney(crm_value, crm_total)
        exports["crm-banking"]:addSocietyTransaction(crm_value, crm_total, 'crm-deposit', "Shop Purchase")
    elseif crm_resource == "esx_society" then
        TriggerEvent('esx_society:depositMoney', crm_value, crm_total)
    end
end

-- crm-shopscreator - crm_config.crm_third_pay

function crm_pay_custom(crm_source, crm_return, crm_bucket)
    local crm_basket = crm_bucket.crm_basket or {}
    local crm_owners = crm_bucket.crm_owners
    local crm_total = 0
    local crm_items = {}
    for _, crm_product in pairs(crm_basket) do
        local crm_total_p = crm_get_price(crm_source, crm_product.crm_parent, crm_product.crm_name, tonumber(crm_product.crm_quantity))
        crm_total += crm_total_p
        table.insert(crm_items, string.format("%s x%s", crm_product.crm_name, crm_product.crm_quantity))
    end
    -- Example of cash payment method - customize the code to any method you want like black money.
    if crm_lib.crm_take_money(crm_source, "crm_cash", crm_total) then
        for _, crm_product in pairs(crm_basket) do
            crm_give_item(crm_source, crm_product.crm_name, tonumber(crm_product.crm_quantity))
        end
        if crm_owners and crm_owners.crm_value then 
            crm_give_society(crm_owners.crm_type, crm_owners.crm_value, crm_total)
        end
        local crm_purchase = table.concat(crm_items, ", ")
        crm_logs(crm_source, ("Player [%s#%s] purchased: %s | Total: $%s | Payment Method: %s"):format(GetPlayerName(crm_source), crm_source, crm_purchase, crm_total, "Cash"))
        crm_return(true)
        return
    else
        TriggerClientEvent('crm-shopscreator:notify', crm_source, {crm_type = 'crm-error', crm_msg = crm_l('crm_notifs.crm_nomoney'), crm_pos = "top"})
        crm_return(false)
        return
    end
    crm_return(false)
end