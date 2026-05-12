local isGameActive = false
local gameResult = nil

local defaultConfig = {
    timeLimit = 30,
    words = {'house', 'car', 'cat', 'sun', 'sea', 'book', 'pizza', 'music', 'soccer', 'friend', 'school', 'family', 'work', 'phone', 'computer', 'ocean', 'hack', 'moon', 'service'},
    maxErrors = 3,
    totalWords = 15
}

exports('startWordMemory', function(config, callback)
    if isGameActive then
        if callback then callback(false, "Minigame alredy showed") end
        return
    end
    
    local gameConfig = {}
    for k, v in pairs(defaultConfig) do
        gameConfig[k] = (config and config[k]) or v
    end
    
    isGameActive = true
    gameResult = nil
    
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        action = "startGame",
        config = gameConfig
    })
    
    while isGameActive do
        Citizen.Wait(100)
    end
    SetNuiFocus(false, false)
    
    if callback then
        callback(gameResult.success, gameResult)
    end
    
    return gameResult
end)

RegisterNUICallback('gameResult', function(data, cb)
    gameResult = data
    isGameActive = false
    cb('ok')
end)

RegisterNUICallback('closeGame', function(data, cb)
    isGameActive = false
    SetNuiFocus(false, false)
    cb('ok')
end)


-- TEST COMMAND
RegisterCommand('testwordmemory', function()
    exports['hh_wordmemory']:startWordMemory({
        timeLimit = 15,
        maxErrors = 1,
        totalWords = 10
    }, function(success, result)
        if success then
            print("Minigame completed! Words: " .. result.wordsCompleted .. "/" .. result.totalWords)
        else
            print("Failed minigame: " .. (result.reason or "Unknown"))
        end
    end)
end)