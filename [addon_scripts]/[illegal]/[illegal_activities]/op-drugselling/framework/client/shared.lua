Framework = nil
Fr = {}
ScriptFunctions = {}

local drugsCache = { data = nil, expiresAt = 0 }
local cacheTime = 10000

ScriptFunctions.GetInventoryDrugs = function()
    local playerData = Fr.GetPlayerData()
    local drugsList = {}

    local now = GetGameTimer() or 0
    if drugsCache.data and now < drugsCache.expiresAt then
        return drugsCache.data
    end
    
    if ESX then
        local items = playerData.inventory
        if not items then 
            return {} 
        end
        
        for k, v in pairs(items) do
            if v and Config.DrugSelling.availableDrugs[v.name] and v.count > 0 then
                local drugInfo = Config.DrugSelling.availableDrugs[v.name]
                table.insert(drugsList, {
                    icon = drugInfo.icon,
                    spawn_name = v.name,
                    label = drugInfo.label,
                    amount = v.count,
                    normalPrice = drugInfo.optimalPrice,
                    priceRangeMin = drugInfo.minimumPrice,
                    priceRangeMax = drugInfo.maximumPrice,
                })
            end
        end
    elseif QBCore or QBox then
        local items = playerData.items
        if not items then 
            return {} 
        end
        local cops = lib.callback.await('op-drugselling:CountCops', false)
        for k, v in pairs(items) do
            if v and Config.DrugSelling.availableDrugs[v.name] and (v.amount or v.count > 0) then
                local drugInfo = Config.DrugSelling.availableDrugs[v.name]
                local optimalPrice = drugInfo.optimalPrice
                local minimumPrice = drugInfo.minimumPrice
                local maximumPrice = drugInfo.maximumPrice
                if cops >= Config.CopsNeededForMultiplier then
                    optimalPrice = drugInfo.optimalPrice * Config.CopMultiplier
                    minimumPrice = drugInfo.minimumPrice * Config.CopMultiplier
                    maximumPrice = drugInfo.maximumPrice * Config.CopMultiplier
                end
                table.insert(drugsList, {
                    icon = drugInfo.icon,
                    spawn_name = v.name,
                    label = drugInfo.label,
                    amount = v.amount or v.count,
                    normalPrice = optimalPrice,
                    priceRangeMin = minimumPrice,
                    priceRangeMax = maximumPrice,
                })
            end
        end
    end

    drugsCache.data = drugsList
    drugsCache.expiresAt = now + cacheTime
    
    debugPrint("drugsList", json.encode(drugsList))
    return drugsList
end