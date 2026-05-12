local chairs = {}

lib.callback.register('mt-restaurants:server:isChairOccupied', function(source, chairId)
    return chairs[chairId] or false
end)

RegisterNetEvent('mt-restaurants:server:sitChair', function(chairId, value)
    chairs[chairId] = value
end)
