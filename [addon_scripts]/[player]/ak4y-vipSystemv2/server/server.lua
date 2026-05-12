RegisterServerCallback('ak4y-vipSystemv2:getPlayerData:server', function(source, cb, isFirst)
    local source = source
    local playerName, profileImage = nil, nil
    local callbackData = {}
    local xPlayer = getXPlayer(source)
    local citizenId = getCitizenId(xPlayer)
    if isFirst then 
        playerName = getName(xPlayer)
        profileImage = getPlayerAvatar(source) 
    end
    local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..citizenId.."'")
    if result[1] then 
        callbackData = {
            coinAmount = result[1].coinAmount,
            playerName = playerName,
            profileImage = profileImage,
        }
    else
        callbackData = {
            coinAmount = 0,
            playerName = playerName,
            profileImage = profileImage,
        }
    end
    cb(callbackData)
end)

RegisterServerCallback('ak4y-vipSystemv2:buyItem:server', function(source, cb, itemData)
    local source = source
    local xPlayer = getXPlayer(source)
    local itemCategory = getCorrectCategoryForItem(itemData.pageValue)
    local phone_exists = false
    if itemCategory == nil then return end
    local correctionMoney = moneyCorrectionForItem(itemData, itemCategory)
    if correctionMoney then 
        local citizenId = getCitizenId(xPlayer)
        local totalAmountOfItem = correctionMoney * itemData.quantity

        if itemData.itemType == Settings.SqlVehicleType or
        itemData.itemType == Settings.SqlAirType or
        itemData.itemType == Settings.SqlBoatType then
            if itemData.customPlate ~= nil and itemData.customPlate.plateState then
                totalAmountOfItem = totalAmountOfItem + itemData.customPlate.platePrice
                itemData.carData.plate = itemData.customPlate.plateNumber:upper()
            end
        end
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..citizenId.."'")
        if result[1] then 
            if result[1].coinAmount >= totalAmountOfItem then
                local newCoinAmount = result[1].coinAmount - totalAmountOfItem
                if itemData.itemName == nil then itemData.itemName = "null" end
                if itemData.itemType == "item" then 
                    addItemToPlayer(xPlayer, itemData.itemName, itemData.quantity * itemData.itemCount)
                    SendToDiscord("Item Purchase","**Character: **"..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname.."\n**CitizenID: **"..citizenId.."\n**Purchased: **"..itemData.label.."\n**Quantity: **"..itemData.quantity.."\n**For: **"..totalAmountOfItem.."\n**New Coin Amount: **"..newCoinAmount.."")
                elseif itemData.itemType == "money" then 
                    giveServerMoney(xPlayer, itemData.quantity * itemData.itemCount)
                elseif itemData.itemType == "job" then 
                    setJobToPlayer(xPlayer, itemData.itemName, itemData.jobGrade)
                elseif itemData.itemType == "weapon" then 
                    addWeaponToPlayer(xPlayer, itemData.itemName, itemData.quantity * itemData.itemCount)
                elseif itemData.itemType == Settings.SqlVehicleType or
                itemData.itemType == Settings.SqlAirType or
                itemData.itemType == Settings.SqlBoatType then
                    addVehicleToGarage(xPlayer, itemData)
                    SendToDiscord("Vehicle Purchase","**Character:** "..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname.."\n**CitizenID:** "..citizenId.."\n**Purchased:** "..itemData.label.."\n**Quantity:** "..itemData.quantity.."\n**For:** "..totalAmountOfItem.."\n**New Coin Amount:** "..newCoinAmount.."")
                elseif itemData.itemType == "bundle" then
                    for k,v in pairs(itemData.giveItems) do 
                        if v.itemType == "item" then 
                            addItemToPlayer(xPlayer, v.itemName, v.itemCount)
                        elseif v.itemType == "money" then 
                            giveServerMoney(xPlayer, v.itemCount)
                        elseif v.itemType == "job" then 
                            setJobToPlayer(xPlayer, v.itemName, v.jobGrade)
                        elseif v.itemType == "weapon" then 
                            addWeaponToPlayer(xPlayer, v.itemName, v.itemCount)
                        elseif v.itemType == Settings.SqlVehicleType or
                        v.itemType == Settings.SqlAirType or
                        v.itemType == Settings.SqlBoatType then
                            addVehicleToGarage(xPlayer, v)
                        end
                    end
                    SendToDiscord("Bundle Purchase","**Character:** "..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname.."\n**CitizenID:** "..citizenId.."\n**Purchased:** "..itemData.label.."\n**Quantity:** "..itemData.quantity.."\n**For:** "..totalAmountOfItem.."\n**New Coin Amount:** "..newCoinAmount.."")
                elseif itemData.itemType == "number" then 
                    local newNumber = itemData.customizePopUp.phoneNumber
                    local checkedNumber = checkPhoneNumber(newNumber)
                    if not checkedNumber then 
                        SendToDiscord("Phone Number Purchase","**Character:** "..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname.."\n**CitizenID:** "..citizenId.."\n**Purchased:** "..itemData.label.."\n**Quantity:** "..itemData.quantity.."\n**For:** "..totalAmountOfItem.."\n**New Coin Amount:** "..newCoinAmount.."\n**Old Phone:** "..xPlayer.PlayerData.charinfo.phone.."\n**New Phone:** "..newNumber.."")
                        DropPlayer(source, "[ak4y-vipSystemv2] ".. AK4Y.Translate.phoneNumberChanged)
                        Wait(5000)
                        givePhoneNumber(citizenId, newNumber)
                    else
                        cb("Phone Number Already exists.")
                        phone_exists = true
                    end
                elseif itemData.itemType == "plate" then 
                    local oldPlateCheck = plateOwnerCheck(citizenId, itemData.oldPlate)
                    if oldPlateCheck then 
                        updatePlate(itemData.oldPlate, itemData.customizePopUp.plateNumber, oldPlateCheck)
                        SendToDiscord("Custom Plate Purchase","**Character:** "..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname.."\n**CitizenID:** "..citizenId.."\n**Purchased:** "..itemData.label.."\n**Quantity:** "..itemData.quantity.."\n**For:** "..totalAmountOfItem.."\n**New Coin Amount:** "..newCoinAmount.."\n**Old Plate:** "..itemData.oldPlate.."\n**New Plate:** "..itemData.customizePopUp.plateNumber.."")
                    else
                        cb(AK4Y.Translate.plateHasOwnerText)
                        return
                    end
                elseif itemData.itemType == "house" then 
                    TriggerClientEvent('ak4y-vipSystemv2:houseBought', source, itemData)
                end
                if not phone_exists then
                    ExecuteSql("UPDATE ak4y_vipsystemv2 SET coinAmount = coinAmount - '"..totalAmountOfItem.."' WHERE citizenid = '"..citizenId.."'")
                -- sendNotifyToDc(source, citizenId, itemData.itemName or itemData.itemType, itemData.quantity, totalAmountOfItem, newCoinAmount)
                cb(true)
                end
            else
                cb(AK4Y.Translate.youDontHaveEnoughCoinText)
            end
        else
            cb(AK4Y.Translate.youDontHaveEnoughCoinText)
        end
    else
        cb(AK4Y.Translate.priceHasChangedText)
    end
    cb(false)
end)

getCorrectCategoryForItem = function(page)
    if page == "specialOffer" then 
        if AK4Y.specialOffer.pageValue == page then 
            return AK4Y.specialOffer
        end
    end
    for k,v in pairs(AK4Y.Categories) do 
        if v.pageValue == page then 
            return v
        end
    end
    return nil
end

moneyCorrectionForItem = function(uiData, configData)
    if configData.pageValue == "specialOffer" then 
        if configData.discount.state then 
            if configData.discount.newPrice == uiData.price then 
                return configData.discount.newPrice
            else
                return false
            end
        else
            if configData.price == uiData.price then 
                return configData.price
            else
                return false
            end
        end
    end

    for k,v in pairs(configData.items) do 
        if v.id == uiData.id then 
            if v.discount.state then 
                if v.discount.newPrice == uiData.price then 
                    return v.discount.newPrice
                else
                    return false
                end
            else
                if v.price == uiData.price then 
                    return v.price
                else
                    return false
                end
            end
        end
    end
end

function addCredit(player, creditCount)
    local src = tonumber(player)
    local xPlayer = getXPlayer(src)
    if xPlayer then 
        local citizenId = getCitizenId(xPlayer)
        local deger = tonumber(creditCount)
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..citizenId.."'")
        if result[1] ~= nil then 
            ExecuteSql("UPDATE ak4y_vipsystemv2 SET coinAmount = coinAmount + '"..deger.."' WHERE citizenid = '"..citizenId.."'")
            return true
        else
            ExecuteSql("INSERT INTO ak4y_vipsystemv2 (citizenid, coinAmount) VALUES ('"..citizenId.."', '"..deger.."')")
            return true
        end
    else
        return false
    end 
end

function removeCredit(player, creditCount)
    local src = tonumber(player)
    local xPlayer = getXPlayer(src)
    if xPlayer then 
        local citizenId = getCitizenId(xPlayer)
        local deger = tonumber(creditCount)
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..citizenId.."'")
        if result[1] ~= nil then 
            ExecuteSql("UPDATE ak4y_vipsystemv2 SET coinAmount = coinAmount - '"..deger.."' WHERE citizenid = '"..citizenId.."'")
            return true
        else
            return true
        end
    else
        return false
    end 
end


-------------------------------------------------------------

-- redeem code callback
local progressBuy = false
RegisterServerCallback('ak4y-vipSystemv2:redeemCode:server', function(source, cb, code)
    local code = code.code
    while progressBuy do
        Wait(1000)
    end
    progressBuy = true
    local source = source
    local xPlayer = getXPlayer(source)
    local citizenId = getCitizenId(xPlayer)
    local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2_codes WHERE code = '"..code.."'")
    if result[1] then 
        local newCoinAmount = result[1].coinAmount
        ExecuteSql("DELETE FROM ak4y_vipsystemv2_codes WHERE code = '"..code.."'")
        addCredit(source, newCoinAmount)
        local totalCredits = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..citizenId.."'")[1].coinAmount
        SendToDiscord2("Code Redeemed","**Redeeming Player's Name: **"..xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname.."\n**Citizen ID: **"..citizenId.."\n**Code:** ``"..code.."``\n**Credits Received:** ``"..newCoinAmount.."``\n**New Credit Amount: **"..totalCredits.."",16711680)
        progressBuy = false
        cb(newCoinAmount)
    else
        progressBuy = false
        cb(AK4Y.Translate.codeNotFoundText)
    end
end)


RegisterCommand('vipsystemv2_credit_purchase', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local credit = tonumber(dec.credit)
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2_codes WHERE code = '"..tbxid.."'")
        if result[1] == nil then
            ExecuteSql("INSERT INTO ak4y_vipsystemv2_codes (code, coinAmount) VALUES ('"..tbxid.."', '"..credit.."')")
            SendToDiscord2("Code Created","**Code:** ``"..tbxid.."``\n**Credits:** ``"..credit.."``\n",65280)
        end
        inProgress = false
    end
end)


-------------------------------------------------------------

function setNewVehiclePlate(oldPlate, newPlate)
    if Settings.Framework == "qb" then
        local oldPlateCheck = plateCheck(oldPlate)
        if oldPlateCheck then
            local newPlateCheck = plateCheck(newPlate)
            if newPlateCheck == nil then
                local jsonData = json.decode(oldPlateCheck.mods) or json.decode(oldPlateCheck.vehicle)
                if jsonData.plate then
                    jsonData.plate = newPlate
                    updatePlate(oldPlate, newPlate, jsonData)
                else
                    updatePlate(oldPlate, newPlate)
                end
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

sendNotifyToDc = function(source, citizenId, itemName, quantity, totalAmountOfItem, newCoinAmount)
    SendToDiscord(">**Source: **"..source.."\n>**CitizenID: **"..citizenId.."\n>**Get: **"..itemName.."\n>**Quantity: **"..quantity.."\n>**For: **"..totalAmountOfItem.."\n>**New Coin Amount: **"..newCoinAmount.."")
end

-------------------------------------------------------------

function getPlayerAvatar(src)
    if AK4Y.ProfilePhotos == "discord" then 
        local discord = nil
        local avatar = nil
        for i = 0, GetNumPlayerIdentifiers(src) - 1 do
            local license = GetPlayerIdentifier(src, i)
            if string.sub(license, 1, string.len("discord:")) == "discord:" then
                discord = license
            end
        end
        if discord then
            discord = string.sub(discord, 9, string.len(discord))
            local p = promise.new()
            PerformHttpRequest("https://discordapp.com/api/users/" .. discord, function(statusCode, data)
                if statusCode == 200 then
                    data = json.decode(data or "{}")
                    if data.avatar then
                        local animated = data.avatar:gsub(1, 2) == "a_"

                        avatar = "https://cdn.discordapp.com/avatars/" ..
                            discord .. "/" .. data.avatar .. (animated and ".gif" or ".png")
                    end
                end
                p:resolve()
            end, "GET", "", {
                Authorization = "Bot " .. DiscordBotToken
            })
            Citizen.Await(p)
        end
        local resultAvatar = avatar or "assets/default.png"
        return resultAvatar
    elseif AK4Y.ProfilePhotos == "steam" then
        local hex = tonumber(string.gsub(GetPlayerIdentifier(src, 0), 'steam:', ''), 16)
        local avatar = nil
        if hex then
            local p = promise.new()
            PerformHttpRequest('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=' .. SteamApiKey .. '&steamids=' .. hex, function(error, result)
                local result = json.decode(result)
                avatar = result.response.players[1].avatarfull
                p:resolve()
            end)
            Citizen.Await(p)
        end
        local resultAvatar = avatar or "assets/default.png"
        return avatar
    else
        return "assets/default.png"
    end     
end


-------------------------------------------------------------

local DISCORD_NAME = Discord_Bot_Username
local DISCORD_IMAGE = Discord_Bot_Avatar
DiscordWebhook = DiscordWebhook
function SendToDiscord(name, message, color)
	if DiscordWebhook == "CHANGE_WEBHOOK" then
	else
		local connect = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                ["text"] = "ak4y development",
                },
            },
	    }
		PerformHttpRequest(DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	end
end

DiscordWebhook2 = DiscordWebhook2
function SendToDiscord2(name, message, color)
	if DiscordWebhook2 == "CHANGE_WEBHOOK" then
	else
		local connect = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                ["text"] = "ak4y development",
                },
            },
	    }
		PerformHttpRequest(DiscordWebhook2, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	end
end