-- Test results from simulated games
-- Configured house edge: 3%
-- 1 million bets on 1.05x = 2.74543% loss
-- 1 million bets on 2.0x = 3.143% loss
-- 1 million bets on 5.0x = 3.515% loss
-- 1 million bets on 10.0x = 4.0585% loss


local game_crash_values = {}

function getCrashMultiplier()
    local two_power_52 = math.pow(2, 52)
    local multiplier

    local U = math.random() * two_power_52

    if U == 0 then
        -- Ensure U is not zero since the formula involves division by U
        U = math.random() * two_power_52
    end
    
    multiplier = (((100 * two_power_52) - U) / (two_power_52 - U)) / 100

    -- Floor the crash value to 2 decimal places
    game_crash_value = math.floor(multiplier * 100) / 100

    if (game_crash_value * 100) % math.floor(100 / Config.Game.houseEdgePercentage) == 0 then
        -- crash instantly to ensure the house edge 
        game_crash_value = 1 
    end

    return game_crash_value
end


function calculateOutcome(results, multiplier)
    local countLessThanMultiplier = 0
    local countGreaterThanOrEqualToMultiplier = 0
    local totalResults = #results

    -- Loop through each result and count based on condition
    for i, result in ipairs(results) do
        if result < multiplier then
            countLessThanMultiplier = countLessThanMultiplier + 1
        elseif result >= multiplier then
            countGreaterThanOrEqualToMultiplier = countGreaterThanOrEqualToMultiplier + 1
        end
    end

    -- Calculate the mean values based on conditions
    local meanLessThanMultiplier = countLessThanMultiplier / totalResults
    local meanGreaterThanOrEqualToMultiplier = countGreaterThanOrEqualToMultiplier / totalResults

    -- Calculate final result using the formula
    local result = (meanLessThanMultiplier * -1) + (multiplier - 1) * meanGreaterThanOrEqualToMultiplier
    return result
end

function findMaxValue(arr)
    if #arr == 0 then
        return nil  -- Return nil for an empty array (or handle it as needed)
    end

    local max_value = arr[1]  -- Assume the first element is the maximum

    for i = 2, #arr do
        if arr[i] > max_value then
            max_value = arr[i]  -- Update max_value if a larger number is found
        end
    end

    return max_value
end

-- local i = 0
-- while i < 1000000 do 
--     i = i + 1
--     local crash_value = calculateCrashValue()
--     table.insert(game_crash_values, crash_value)
-- end

-- print(findMaxValue(game_crash_values))
-- print(calculateOutcome(game_crash_values, 2.0))
