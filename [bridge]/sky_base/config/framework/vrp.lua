if Sky.Config.framework == "vrp" then
    Sky.FW = {}
    local Tunnel = module("vrp", "lib/Tunnel")
    local Proxy = module("vrp", "lib/Proxy")
    local vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
    local itemsConfig = module("vrp", "cfg/items")

    vRP = Proxy.getInterface("vRP")

    if IsDuplicityVersion() then goto server end 
    -- Client Side from here

    -- Entered / Exited Vehicle
    Citizen.CreateThread(function()
        local currentVehicle = {}
        local isInVehicle = false
        while true do
            local playerPed = PlayerPedId()

            if not isInVehicle and not IsPlayerDead(PlayerId()) then
                if IsPedInAnyVehicle(playerPed, false) then
                    isInVehicle = true
                    currentVehicle.vehicle = GetVehiclePedIsUsing(playerPed)
                    currentVehicle.seat = GetPedVehicleSeat(playerPed, currentVehicle.vehicle)
                    currentVehicle.plate = GetVehicleNumberPlateText(currentVehicle.vehicle)
                    TriggerEvent("sky_base:enteredVehicle", currentVehicle.vehicle, currentVehicle.plate, currentVehicle.seat)
                end
            elseif isInVehicle then
                if not IsPedInAnyVehicle(playerPed, false) or IsPlayerDead(PlayerId()) then
                    TriggerEvent("sky_base:exitedVehicle", currentVehicle.vehicle, currentVehicle.plate, currentVehicle.seat)
                    currentVehicle = {}
                    isInVehicle = false
                end
            end
            Citizen.Wait(200)
        end
    end)

    ::server::
    if not IsDuplicityVersion() then return end
    -- Server Side from here

    function Sky.FW.RegisterUsableItem(name, callback)
        vRP.defInventoryItem(name, name, "Custom desc", nil, 0.5)
    end

    function Sky.FW.IsPlayerOnline(sourceOrIdentifier)
        local user_id = vRP.getUserId({sourceOrIdentifier})
        if user_id ~= nil then
            return user_id
        else
            return false
        end
    end

    function Sky.FW.GetIdentifier(source)
        if source ~= nil then
            return vRP.getUserId({source})
        else
            return false
        end
    end

    function Sky.FW.GetName(source)
        return Sky.String.SanitizeForSQL(GetPlayerName(source))
    end

    function Sky.FW.GetFirstname(source)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            if not user_id or not vRP.getUserIdentity then return nil end
            local identity = vRP.getUserIdentity({user_id})
            if identity then
                return Sky.String.SanitizeForSQL(identity.firstname or identity.first_name)
            end
        end
        return nil
    end

    function Sky.FW.GetLastname(source)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            if not user_id or not vRP.getUserIdentity then return nil end
            local identity = vRP.getUserIdentity({user_id})
            if identity then
                return Sky.String.SanitizeForSQL(identity.lastname or identity.last_name or identity.name)
            end
        end
        return nil
    end

    function Sky.FW.GetBirthdate(source)
        return nil
    end

    function Sky.FW.GetAccountMoney(source, account)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            if account == "bank" then
                return vRP.getBankMoney({user_id})
            else
                return vRP.getMoney({user_id})
            end
            return 0
        end
        return 0
    end

    function Sky.FW.AddAccountMoney(source, account, amount)
        local user_id = vRP.getUserId({source})
        vRP.giveBankMoney({user_id, amount})
    end

    function Sky.FW.RemoveAccountMoney(source, account, amount)
        local user_id = vRP.getUserId({source})
        if vRP.tryBankPayment({user_id, amount}) then
            return true
        end
        return false
    end

    function Sky.FW.GetInventoryItems(source)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            local data = vRP.getUserDataTable({user_id})
            return data.inventory
        else
            return false
        end
    end

    function Sky.FW.GetItems()
        if vRP and vRP.items then
            return vRP.items
        end

        if itemsConfig then
            return itemsConfig.items or itemsConfig
        end

        return {}
    end

    function Sky.FW.GetInventoryItem(source, item)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            return vRP.getInventoryItemAmount({user_id, item, true})
        else
            return false
        end
    end

    function Sky.FW.HasItem(source, item, amount)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            if vRP.getInventoryItemAmount({user_id, item, true}) > 0 then
                return true
            end
        else
            return false
        end
    end

    function Sky.FW.RemoveItem(source, item, amount)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            return vRP.tryGetInventoryItem({user_id, item, amount, true})
        else
            return false
        end
    end

    function Sky.FW.AddItem(source, item, amount, force)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            return vRP.giveInventoryItem({user_id, item, amount, true})
        else
            return false
        end
    end

    function Sky.FW.GetItemLabel(item)
        return vRP.getItemName({item})
    end

    function Sky.FW.GetJob(source)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            return vRP.getUserFaction({user_id})
        else
            return false
        end
    end

    function Sky.FW.GetGroup(source)
        if source ~= nil then
            local user_id = vRP.getUserId({source})
            return vRP.getUserGroupByType({user_id, "job"})
        else
            return false
        end
    end

    function Sky.FW.GetPlayers()
        return vRP.getUsers({})
    end

    function Sky.FW.IsVehicleOwnedByPlayer(source, plate)
        -- Here u need to make a custom logic
    end

    function Sky.FW.ChangePlayerName(source, firstname, lastname)
        -- Here u need to make a custom logic
    end
end
