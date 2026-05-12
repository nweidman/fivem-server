function Notify(msg)
    if Config.Framework == 'qbcore' then
        QBCore.Functions.Notify(msg, "success")
    elseif Config.Framework == 'esx' then
        ESX.ShowNotification(msg)
    end
end

function WeaponDisarm(ped)
    TriggerEvent('ox_inventory:disarm')
    SetCurrentPedWeapon(ped, 'WEAPON_UNARMED', true) 
end

function PauseThirst(value)
    TriggerServerEvent("highqez_afk:server:UpdateFoodWater", "thirst", value)
    TriggerEvent('esx_status:set', 'thirst', value)
end

function PauseHunger(value)
    TriggerServerEvent("highqez_afk:server:UpdateFoodWater", "hunger", value)
    TriggerEvent('esx_status:set', 'hunger', value)
end

function RemoveStress(value)
    TriggerServerEvent('highqez_afk:server:RelieveStress', value)
    TriggerServerEvent('hud:server:RelieveStress', value)
end

function ExtraFunctionInZone() -- you can add extra function here, This will trigger when player is inside the zone
    --If you are not a developer then please ignore this section
end
