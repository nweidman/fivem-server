local sharedConfig = require 'config.shared'

local ox_inventory = exports.ox_inventory

function NewMetaDataLicense(src, itemName)
    local newMetaDataItem = ox_inventory:Search(src, 1, itemName)
    for _, v in pairs(newMetaDataItem) do --luacheck: ignore
        newMetaDataItem = v
        break
    end
    newMetaDataItem.metadata.mugShot = lib.callback.await('um-idcard:client:callBack:getMugShot', src)
    ox_inventory:SetMetadata(src, newMetaDataItem.slot, newMetaDataItem.metadata)
end

RegisterNetEvent('um-idcard:server:sendData', function(src, item, metadata)
    if metadata.mugShot then
        local source = src

        lib.callback('um-idcard:client:callBack:getClosestPlayer', src, function(players)
            -- players will be a table now: {player1, player2, player3, ...}

            if players and #players > 0 then
                -- Notify the source player (person showing the ID)
                TriggerClientEvent('um-idcard:client:notifyOx', src, {
                    title = 'You showed your ID Card',
                    desc = ('You are showing your ID Card to %s nearby players'):format(#players),
                    icon = 'id-card',
                    iconColor = 'green'
                })

                -- Fetch player data once
                local data = exports.qbx_core:GetPlayer(source).PlayerData.charinfo
                data.sex = data.gender == 0 and 'Male' or 'Female'
                data.cardtype = item or "id_card"
                data.mugShot = metadata.mugShot

                -- Send the ID card to every player found
                for _, target in ipairs(players) do
                    TriggerClientEvent('um-idcard:client:sendData', target, data)
                end
                TriggerClientEvent('um-idcard:client:startAnim', src, item)
            else
                -- No players in range
                TriggerClientEvent('um-idcard:client:notifyOx', src, {
                    title = 'No one nearby',
                    desc = 'There is no one nearby.',
                    icon = 'xmark',
                    iconColor = 'red'
                })
            end
        end)
        
    else
        NewMetaDataLicense(src, item)
    end
end)

for k,_ in pairs(sharedConfig.licenses) do
    CreateRegisterItem(k)
end