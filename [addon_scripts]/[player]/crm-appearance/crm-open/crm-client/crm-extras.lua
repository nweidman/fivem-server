-- crm-core - wait for core to load modules.

crm_core_ready()

-- crm-appearance -

local crm_extra = {
    ['crm-hat'] = nil,
    ['crm-mask'] = nil,
    ['crm-glasses'] = nil,
    ['crm-ears'] = nil,
    ['crm-watch'] = nil,
    ['crm-bracelet'] = nil,
}

local crm_extras = function(crm_stl, crm_type, crm_id)
    if (crm_stl=='crm-prop') then
        if (crm_extra[crm_type]==nil) then
            if (GetPedPropIndex(crm_cache.crm_ped, crm_id)~=-1) then
                crm_extra[crm_type] = {crm_style = GetPedPropIndex(crm_cache.crm_ped, crm_id), crm_texture = GetPedPropTextureIndex(crm_cache.crm_ped, crm_id)}
                ClearPedProp(crm_cache.crm_ped, crm_id)
            end
        else
            SetPedPropIndex(crm_cache.crm_ped, crm_id, crm_extra[crm_type].crm_style, crm_extra[crm_type].crm_texture, 0)
            crm_extra[crm_type] = nil
        end
    else
        if (crm_extra[crm_type]==nil) then
            if (GetPedDrawableVariation(crm_cache.crm_ped, crm_id)~=0) then
                crm_extra[crm_type] = {crm_style = GetPedDrawableVariation(crm_cache.crm_ped, crm_id), crm_texture = GetPedTextureVariation(crm_cache.crm_ped, crm_id)}
                SetPedComponentVariation(crm_cache.crm_ped, crm_id, 0, 0, false)
            end
        else
            SetPedComponentVariation(crm_cache.crm_ped, crm_id, crm_extra[crm_type].crm_style, crm_extra[crm_type].crm_texture, false)
            crm_extra[crm_type] = nil
        end
    end
end

if (crm_config.crm_extras.crm_enable) then
    RegisterCommand(crm_config.crm_extras.crm_mask, function()
        crm_extras('crm-comp', 'crm-mask', 1)
    end, false)
    RegisterCommand(crm_config.crm_extras.crm_hat, function()
        crm_extras('crm-prop', 'crm-hat', 0)
    end, false)
    RegisterCommand(crm_config.crm_extras.crm_glasses, function()
        crm_extras('crm-prop', 'crm-glasses', 1)
    end, false)
    RegisterCommand(crm_config.crm_extras.crm_ears, function()
        crm_extras('crm-prop', 'crm-ears', 2)
    end, false)
    RegisterCommand(crm_config.crm_extras.crm_watch, function()
        crm_extras('crm-prop', 'crm-watch', 6)
    end, false)
    RegisterCommand(crm_config.crm_extras.crm_bracelet, function()
        crm_extras('crm-prop', 'crm-bracelet', 7)
    end, false)
end