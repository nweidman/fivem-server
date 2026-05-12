RegisterServerEvent("fortislogs:server:addLog")
AddEventHandler("fortislogs:server:addLog", function(type, dataTable)
    addLog(type, dataTable)
end)

function addLog(type, dataTable)
    local apiData = {
        ["log_type"] = type,
        ["data"] = json.encode(dataTable)
    }

    PerformHttpRequest("", function(err, text, headers)
        if err ~= 200 then
            print("Something went wrong while adding a log...")
        end
    end, "POST", json.encode(apiData), {
        ['Content-Type'] = 'application/json',
        ['Authorization'] = 'Bearer '..Config.api_token
    })
end