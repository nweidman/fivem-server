local ActionTypesList = {
    [HEARTBEAT_EVENTS.PRISONER_LOADED] = PRISON_OUTFITS.PRISONER,
    [HEARTBEAT_EVENTS.PRISONER_NEW] = PRISON_OUTFITS.PRISONER,
    [HEARTBEAT_EVENTS.PRISONER_RELEASED] = PRISON_OUTFITS.CITIZEN,
}

RegisterNetEvent('ZSX_Multicharacter:Listener:SwappedCharacter')
AddEventHandler('ZSX_Multicharacter:Listener:SwappedCharacter', function(characterData, characterId)
    if GetInvokingResource() ~= "ZSX_Multicharacter" then return end
    TriggerServerEvent("rcore_prison:server:requestPlayerLogout")
    TriggerEvent("rcore_prison:client:playerLogout")
end)

AddEventHandler("rcore_prison:client:characterLoaded", function()
    if GetInvokingResource() ~= GetCurrentResourceName() then return end
    DoScreenFadeIn(0)
end)

NetworkService.EventListener('heartbeat', function(eventType, data)
    local actionType = ActionTypesList[eventType]

    if not actionType then
        return
    end

    if Config.DisableClothing then
        return
    end

    if actionType == PRISON_OUTFITS.CITIZEN then
        if not Config.Outfits.RestorePlayerOutfitOnRelease then
            return
        end

        RestoreCivilOutfit()
    elseif actionType == PRISON_OUTFITS.PRISONER then
        ApplyOutfit(Outfits)
    end
end)

local function SafeMode(on)
    local player = PlayerPedId()
    SetEntityInvincible(player, on)
    SetPlayerInvincible(PlayerId(), on)
    SetPedCanRagdoll(player, not on)
end

AddEventHandler("rcore_prison:client:restoreOutfitInit", function()
    if GetInvokingResource() ~= GetCurrentResourceName() then return end

    SafeMode(true)

    if isResourcePresentProvideless("osp_ambulance") then
        TriggerEvent("osp_ambulance:appearanceEnter")
    end

    if isResourcePresentProvideless("wasabi_ambulance") and doesExportExistInResource("wasabi_ambulance", "disableKnockoutLoop") then
        exports.wasabi_ambulance:disableKnockoutLoop(true)
    end
end)

AddEventHandler("rcore_prison:client:restoreOutfitFinished", function()
    if GetInvokingResource() ~= GetCurrentResourceName() then return end

    SafeMode(false)

    if isResourcePresentProvideless("osp_ambulance") then
        TriggerEvent("osp_ambulance:appearanceExit")
    end

   if isResourcePresentProvideless("wasabi_ambulance") and doesExportExistInResource("wasabi_ambulance", "disableKnockoutLoop") then
        exports.wasabi_ambulance:disableKnockoutLoop(false)
    end

   if isResourcePresentProvideless("wasabi_ambulance") and doesExportExistInResource("wasabi_ambulance", "clearPlayerInjury") then
        exports.wasabi_ambulance:clearPlayerInjury(true)
    end
end)

function GetOutfitByGender(data)
    if not data then
        return
    end

    local plyPed = PlayerPedId()
    local model = GetEntityArchetypeName(plyPed)
    local isMale = 'mp_m_freemode_01' == model
    local gender = isMale and 'male' or 'female'

    return data[gender] or nil
end