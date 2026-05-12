--- @param source number The players source.
--- @return table | nil # Returns a table containing the player's gang information, or nil if the integration is not available. 
function GetCustomGang(source)
    if Cfg.Gang == 'none' then return end

    if Cfg.Gang == 'rcore_gangs' then
        local ok, gang = pcall(function()
            return exports['rcore_gangs']:GetPlayerGang(source)
        end)

        if not ok or type(gang) ~= 'table' then
            return
        end

        return {
            name = gang.name:lower(),
            label = gang.name,
            grade = tonumber(gang.rank)
        }

    elseif Cfg.Gang == 'av_gangs' then
        local ok, gang = pcall(function()
            return exports['av_gangs']:getGang(source)
        end)

        if not ok or type(gang) ~= 'table' then
            return nil
        end

        return {
            name = gang.name,
            label = gang.label,
            grade = tonumber(gang.level)
        }

    elseif Cfg.Gang == 'other' then
        -- Add custom gang integration here
    end

    return
end
