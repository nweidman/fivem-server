Trace = function(...)
    if not Config.Debug then
        return
    end

    local logLine = ""
    local logString = { ... }

    if IsDuplicityVersion() then
        logLine = os.date('%Y-%m-%d %H:%M:%S', os.time())
    end

    logLine = logLine .. " [" .. (GetCurrentResourceName() or "LOG") .. "] "

    for i = 1, #logString do
        logLine = logLine .. tostring(logString[i]) .. " "
    end

    print(logLine)
end

function SelectRandomItem(lootTable)
    local totalChance = 0
    for _, item in pairs(lootTable) do
        totalChance = totalChance + item.chance
    end

    local randomChance = math.random(1, totalChance)

    local cumulativeChance = 0
    for _, item in pairs(lootTable) do
        cumulativeChance = cumulativeChance + item.chance
        if randomChance <= cumulativeChance then
            return item
        end
    end
end

Translate = function(key, args)
    if not Config.Locale then
        return key
    end

    local translation = Locales[Config.Locale][key]

    if not translation then
        return key
    else
        if args then
            for i = 1, #args do
                translation = translation:gsub("%%s", args[i], 1)
            end
        end
    end

    return translation
end

IsResourceStartedOrStarting = function(resource)
    local state = GetResourceState(resource)
    return state == "started" or state == "starting"
end

if Config.Framework == "auto" then
    Trace("Detecting framework")
    print(IsResourceStartedOrStarting("qbx_core"), IsResourceStartedOrStarting("qb-core"), IsResourceStartedOrStarting("es_extended"))
    if IsResourceStartedOrStarting("es_extended") then
        Config.Framework = "esx"
    elseif IsResourceStartedOrStarting("qbx_core") then
        Config.Framework = "qbox"
    elseif IsResourceStartedOrStarting("qb-core") then
        Config.Framework = "qbcore"
    end
    Trace("Detected framework: " .. Config.Framework)
end

TableLength = function(table)
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end

