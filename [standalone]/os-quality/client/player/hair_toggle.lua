local savedHairStyles = {}
QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('hathair:toggleHair2', function()
    local ped = PlayerPedId()
    local gender = IsPedMale(ped) and 0 or 1 -- Determine the player's gender

    if not savedHairStyles[GetPlayerServerId(PlayerId())] then
        -- Save the current hairstyle and texture
        local currentHair = {
            drawable = GetPedDrawableVariation(ped, 2), -- Component index for hair
            texture = GetPedTextureVariation(ped, 2)
        }
        
        -- Save the player's current hair to restore later
        savedHairStyles[GetPlayerServerId(PlayerId())] = currentHair
        
        -- If male, set hair to 0 (bald)
        if gender == 0 then
            SetPedComponentVariation(ped, 2, 77, 0, 2) -- Set hair drawable to 0 (bald)
            QBCore.Functions.Notify("You put on a hat and your hair disappeared!!", "success")
        else
            QBCore.Functions.Notify("This command is only for male characters.", "error")
        end
    else
        -- Restore the saved hairstyle
        local savedHair = savedHairStyles[GetPlayerServerId(PlayerId())]
        SetPedComponentVariation(ped, 2, savedHair.drawable, savedHair.texture, 2) -- Restore the saved hair drawable and texture
        savedHairStyles[GetPlayerServerId(PlayerId())] = nil
        QBCore.Functions.Notify("You took off the hat and your hair is back!", "success")
    end
end)

RegisterCommand('damon', function()
    TriggerServerEvent('hathair:toggle2')
end)

RegisterNetEvent('hathair:toggleHair', function()
    local ped = PlayerPedId()
    local gender = IsPedMale(ped) and 0 or 1 -- 0 = male, 1 = female

    local playerId = GetPlayerServerId(PlayerId())

    if not savedHairStyles[playerId] then
        -- Save current hairstyle
        savedHairStyles[playerId] = {
            drawable = GetPedDrawableVariation(ped, 2),
            texture = GetPedTextureVariation(ped, 2)
        }

        if gender == 0 then
            -- Set male ped to bald
            SetPedComponentVariation(ped, 2, 0, 0, 2) -- drawable 0 = bald, texture 0
            QBCore.Functions.Notify("You put on a hat and your hair disappeared!", "success")
        else
            QBCore.Functions.Notify("This command is only for male characters.", "error")
        end
    else
        -- Restore saved hairstyle
        local hair = savedHairStyles[playerId]
        SetPedComponentVariation(ped, 2, hair.drawable, hair.texture, 2)
        savedHairStyles[playerId] = nil
        QBCore.Functions.Notify("You took off the hat and your hair is back!", "success")
    end
end)

RegisterCommand('hair', function()
    TriggerEvent('hathair:toggleHair')
end)
