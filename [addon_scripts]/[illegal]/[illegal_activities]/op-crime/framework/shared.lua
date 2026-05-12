Locales = {}

function trim(s)
    if s then
        return (s:gsub("^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

TranslateIt = function(...)
    return Translate(...)
end

function Translate(str, ...) -- Translate string
    if not str then
        print(("[^1ERROR^7] Resource ^5%s^7 You did not specify a parameter for the Translate function or the value is nil!"):format(GetInvokingResource() or GetCurrentResourceName()))
        return "Given translate function parameter is nil!"
    end
    local loc = string.lower(Config.Locale)
    if Locales[loc] then
        if Locales[loc][str] then
            return string.format(Locales[loc][str], ...)
        elseif loc ~= "en" and Locales["en"] and Locales["en"][str] then
            return string.format(Locales["en"][str], ...)
        else
            return "Translation [" .. loc .. "][" .. str .. "] does not exist"
        end
    elseif loc ~= "en" and Locales["en"] and Locales["en"][str] then
        return string.format(Locales["en"][str], ...)
    else
        return "Locale [" .. loc .. "] does not exist"
    end
end

function tableContains(tbl, element)
    for _, value in pairs(tbl) do
        if value == element then
            return true
        end
    end
    return false
end

function debugPrint(...)
    if not Config.Debug then return end
    local args <const> = { ... }

    local appendStr = ''
    for _, v in ipairs(args) do
        appendStr = appendStr .. ' ' .. tostring(v)
    end
    local msgTemplate = '^3[debuglog]^0%s'
    local finalMsg = msgTemplate:format(appendStr)
    print(finalMsg)
end

function DeepCopyShared(original, seen)
    if type(original) ~= "table" then
        return original
    end

    if seen and seen[original] then
        return seen[original]
    end

    local copy = {}
    seen = seen or {}
    seen[original] = copy

    for k, v in pairs(original) do
        copy[DeepCopyShared(k, seen)] = DeepCopyShared(v, seen)
    end

    return setmetatable(copy, getmetatable(original))
end