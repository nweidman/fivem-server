local Target = {}

function Target.addLocalEntity(entities, options)
    if shared.isResourceStart('ox_target') then
        exports.ox_target:addLocalEntity(entities, options)
    elseif shared.isResourceStart('qb-target') then
        for key, option in pairs(options) do
            option.job = option.groups
            option.action = option.onSelect
        end
        exports['qb-target']:AddTargetEntity(entities, {
            options = options,
        })
    else
        -- ? Use your target script export
    end
    return true
end

function Target.removeLocalEntity(entities)
    if shared.isResourceStart('ox_target') then
        exports.ox_target:removeLocalEntity(entities)
    elseif shared.isResourceStart('qb-target') then
        exports['qb-target']:RemoveTargetEntity(entities)
    else
        -- ? Use your target script export
    end
    return true
end

function Target.addModel(models, options, key)
    if shared.isResourceStart('ox_target') then
        exports.ox_target:addModel(models, options)
    elseif shared.isResourceStart('qb-target') then
        for _, option in pairs(options) do
            option.job = option.groups
            option.gang = option.groups
            option.action = option.onSelect
        end
        exports['qb-target']:AddTargetModel(models,
            { options = options })
    else
        -- ? Use your target script export
    end
    return true
end

function Target.removeModel(models)
    if shared.isResourceStart('ox_target') then
        exports.ox_target:removeModel(models)
    elseif shared.isResourceStart('qb-target') then
        exports['qb-target']:RemoveTargetModel(models)
    else
        -- ? Use your target script export
    end
    return true
end

return Target
