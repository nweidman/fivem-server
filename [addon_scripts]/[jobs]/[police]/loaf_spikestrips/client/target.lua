local SPIKE_MODEL = `p_ld_stinger_s`

AddEventHandler('onClientResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end

    exports.ox_target:addModel(SPIKE_MODEL, {
        {
            name = 'loaf_spikestrips:remove',
            icon = 'fa-solid fa-road-spikes',
            label = 'Remove Spikestrips',
            distance = 3.0,
            onSelect = function(data)
                RemoveStingerEntity(data.entity)
            end
        }
    })
end)
