-- CONFIGURATION
local resourcesToDelay = { -- list of resources to delay
    "fortzancudo",
    "cargoship",
    "aircraftcarrier",
    "kq_airdrop"
}

-- Delay settings (in minutes)
local minDelayMinutes = 15     -- minimum delay after restart
local maxDelayMinutes = 30    -- maximum delay after restart

-- Convert to milliseconds
local function minutesToMs(minutes)
    return minutes * 60 * 1000
end

-- MAIN
CreateThread(function()
    Wait(10000)
    for _, resource in ipairs(resourcesToDelay) do
        -- Random delay per resource
        local delayMinutes = math.random(minDelayMinutes, maxDelayMinutes)
        local delayMs = minutesToMs(delayMinutes)
        if GetResourceState(resource) == "started" then
            print(("Stopping resource '%s' for delayed start"):format(resource))
            StopResource(resource)
        else
            print(("Resource '%s' is not running on startup (state: %s)"):format(resource, GetResourceState(resource)))
        end

        print(("Delaying start of resource '%s' by %d minute(s)"):format(resource, delayMinutes))

        SetTimeout(delayMs, function()
            if GetResourceState(resource) == "missing" then
                print(("Resource '%s' not found, skipping."):format(resource))
                return
            end
            if GetResourceState(resource) ~= "started" then
                print(("Starting resource '%s' after %d minute(s) delay"):format(resource, delayMinutes))
                StartResource(resource)
            end
        end)
    end
end)
