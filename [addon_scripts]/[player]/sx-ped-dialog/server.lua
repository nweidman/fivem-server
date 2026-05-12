RegisterNetEvent('sx-hackerexchange:giveItem', function(item, count)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if item == 'maliciouscode' then
        if Player.PlayerData.money.crypto < 50 then exports.qbx_core:Notify(src, 'You do not have enough QBit!', 'error') return end
        exports.qbx_core:RemoveMoney(src, 'crypto', 50, 'Purchased Malicious Code')
        exports.ox_inventory:AddItem(src, 'maliciouscode', 1)
    elseif item == 'whitekeycard' then
        if Player.PlayerData.money.crypto < 100 then exports.qbx_core:Notify(src, 'You do not have enough QBit!', 'error') return end
        local usb = exports.ox_inventory:GetItem(src, 'whiteusb', nil, true)
        local card = exports.ox_inventory:GetItem(src, 'blank_card', nil, true)
        if not usb or usb<=0 then exports.qbx_core:Notify(src, 'You do not have a white USB!', 'error') return end
        if not card or card<=0 then exports.qbx_core:Notify(src, 'You do not have a blank card!', 'error') return end
        exports.qbx_core:RemoveMoney(src, 'crypto', 100, 'Purchased White Keycard')
        exports.ox_inventory:RemoveItem(src, 'whiteusb', 1)
        exports.ox_inventory:RemoveItem(src, 'blank_card', 1)
        exports.ox_inventory:AddItem(src, 'whitekeycard', 1)
    elseif item == 'blackkeycard' then
        if Player.PlayerData.money.crypto < 500 then exports.qbx_core:Notify(src, 'You do not have enough QBit!', 'error') return end
        local usb = exports.ox_inventory:GetItem(src, 'blackusb', nil, true)
        local card = exports.ox_inventory:GetItem(src, 'blank_card', nil, true)
        if not usb or usb<=0 then exports.qbx_core:Notify(src, 'You do not have a black USB!', 'error') return end
        if not card or card<=0 then exports.qbx_core:Notify(src, 'You do not have a blank card!', 'error') return end
        exports.qbx_core:RemoveMoney(src, 'crypto', 500, 'Purchased Black Keycard')
        exports.ox_inventory:RemoveItem(src, 'blackusb', 1)
        exports.ox_inventory:RemoveItem(src, 'blank_card', 1)
        exports.ox_inventory:AddItem(src, 'blackkeycard', 1)
    elseif item == 'yellowkeycard' then
        if Player.PlayerData.money.crypto < 300 then exports.qbx_core:Notify(src, 'You do not have enough QBit!', 'error') return end
        local usb = exports.ox_inventory:GetItem(src, 'yellowusb', nil, true)
        local card = exports.ox_inventory:GetItem(src, 'blank_card', nil, true)
        if not usb or usb<=0 then exports.qbx_core:Notify(src, 'You do not have a yellow USB!', 'error') return end
        if not card or card<=0 then exports.qbx_core:Notify(src, 'You do not have a blank card!', 'error') return end
        exports.qbx_core:RemoveMoney(src, 'crypto', 300, 'Purchased Yellow Keycard')
        exports.ox_inventory:RemoveItem(src, 'yellowusb', 1)
        exports.ox_inventory:RemoveItem(src, 'blank_card', 1)
        exports.ox_inventory:AddItem(src, 'yellowkeycard', 1)
    elseif item == 'redkeycard' then
        if Player.PlayerData.money.crypto < 400 then exports.qbx_core:Notify(src, 'You do not have enough QBit!', 'error') return end
        local usb = exports.ox_inventory:GetItem(src, 'redusb', nil, true)
        local card = exports.ox_inventory:GetItem(src, 'blank_card', nil, true)
        if not usb or usb<=0 then exports.qbx_core:Notify(src, 'You do not have a red USB!', 'error') return end
        if not card or card<=0 then exports.qbx_core:Notify(src, 'You do not have a blank card!', 'error') return end
        exports.qbx_core:RemoveMoney(src, 'crypto', 400, 'Purchased Red Keycard')
        exports.ox_inventory:RemoveItem(src, 'redusb', 1)
        exports.ox_inventory:RemoveItem(src, 'blank_card', 1)
        exports.ox_inventory:AddItem(src, 'redkeycard', 1)
    elseif item == 'purplekeycard' then
        if Player.PlayerData.money.crypto < 250 then exports.qbx_core:Notify(src, 'You do not have enough QBit!', 'error') return end
        local usb = exports.ox_inventory:GetItem(src, 'purpleusb', nil, true)
        local card = exports.ox_inventory:GetItem(src, 'blank_card', nil, true)
        if not usb or usb<=0 then exports.qbx_core:Notify(src, 'You do not have a purple USB!', 'error') return end
        if not card or card<=0 then exports.qbx_core:Notify(src, 'You do not have a blank card!', 'error') return end
        exports.qbx_core:RemoveMoney(src, 'crypto', 250, 'Purchased Purple Keycard')
        exports.ox_inventory:RemoveItem(src, 'purpleusb', 1)
        exports.ox_inventory:RemoveItem(src, 'blank_card', 1)
        exports.ox_inventory:AddItem(src, 'purplekeycard', 1)
    end
end)