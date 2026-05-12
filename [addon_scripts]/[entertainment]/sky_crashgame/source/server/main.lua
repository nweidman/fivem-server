local resourceName = GetCurrentResourceName()
logs = nil
Sky.CheckVersion(resourceName)
if Config.Logging then logs = Sky.Log:new(resourceName) end

function addToLogs(message, level, user)
    if Config.Logging then
        logs:Add(message, level, user)
    end
end

Sky.Cb.Register("sky_crashgame:server:GetPlayerMoney", function(source, cb)
    return Sky.FW.GetAccountMoney(source, "money")
end)

local playersInGame = {}
local nextRoundBets = {}
local currentBets = {}
local isGameRunning = false

-- used for stats
local totalPaidInAmountThisGame = 0
local totalPaidOutAmountThisGame = 0

local startTime = 0
local timeElapsed = 0
local currentMultiplier = 0
local crashMultiplier = 0

function table.copy(t)
    local u = { }
    if type(t) ~= 'table' then return t end
    for k, v in pairs(t) do u[k] = v end
    return setmetatable(u, getmetatable(t))
  end

-- Register players opening and closing the UI
Sky.Cb.Register("sky_crashgame:playerJoined", function(source) 
    if source > 0 then
        for id, player in ipairs(playersInGame) do
            if id == tostring(source) then
                return
            end
        end
        playersInGame[tostring(source)] = {
            name = Sky.FW.GetName(source),
            amount = 0,
            color = "gray"
        }
        eventToAllInGamePlayers("sky_crashgame:updatePlayers", playersInGame)
        return playersInGame
    end
end)

RegisterNetEvent("sky_crashgame:playerLeft", function()
    if playersInGame[tostring(source)] ~= nil then 
        playersInGame[tostring(source)] = nil
        eventToAllInGamePlayers("sky_crashgame:updatePlayers", playersInGame)
    end
end)

Sky.Cb.Register("sky_crashgame:getInGamePlayers", function(source)
    return playersInGame
end)

-- Send event to all players that have the UI open
function eventToAllInGamePlayers(event, parameter) 
    for id, player in pairs(playersInGame) do 
        TriggerClientEvent(event, tonumber(id), parameter)
    end
end

Sky.Cb.Register("sky_crashgame:placeBet", function(source, bet)
    addToLogs("Player wants to place a bet "..bet, "user_action_started", source)
    if bet > Config.Game.maximumBet then bet = Config.Game.maximumBet end 
    if nextRoundBets[tostring(source)] == nil then
        local moneyGotRemoved = Sky.FW.RemoveAccountMoney(source, "money", bet) 
        if moneyGotRemoved then
            nextRoundBets[tostring(source)] = bet 
            totalPaidInAmountThisGame = totalPaidInAmountThisGame + bet
            if playersInGame[tostring(source)].color == "gray" then
                playersInGame[tostring(source)].amount = bet
                eventToAllInGamePlayers("sky_crashgame:updatePlayers", playersInGame)
            end
            addToLogs("Player placed a bet "..bet, "user_action_successed", source)
            return true
        else
            addToLogs("Player couldnt place a bet because he has not enough money", "user_action_failed", source)
            return false
        end
    else
        addToLogs("Player couldnt place a bet because he already placed one", "user_action_failed", source)
        return false
    end
end)

Sky.Cb.Register("sky_crashgame:cashOut", function(source)
    addToLogs("Player wants to cash out", "user_action_started", source)
    if currentBets[tostring(source)] ~= nil then
        
        local bettedAmount = currentBets[tostring(source)]
        local wonAmount = math.floor(bettedAmount * currentMultiplier)
        if wonAmount - bettedAmount > Config.Game.maximumProfit then 
            wonAmount = bettedAmount + Config.Game.maximumProfit 
        end

        currentBets[tostring(source)] = nil
        playersInGame[tostring(source)].amount = wonAmount - bettedAmount
        playersInGame[tostring(source)].color = "green"
        Sky.FW.AddAccountMoney(source, "money", wonAmount)
        totalPaidOutAmountThisGame = totalPaidOutAmountThisGame + wonAmount
        eventToAllInGamePlayers("sky_crashgame:updatePlayers", playersInGame)
        addToLogs("Player cashed out "..wonAmount, "user_action_successed", source)
        return {multiplier = math.floor(currentMultiplier * 100) / 100, won = wonAmount}
    else
        addToLogs("Player couldnt cashout because he has no active bet for this round", "user_action_failed", source)
        -- Because of a rare bug (1 out of 1000 games) the callback gets triggered 3 times within a second and returns here as last even if it succeeded first time.
        -- Hack: let the frontend think everything got well even if it didnt 
        return {multiplier = math.floor(currentMultiplier * 100) / 100}
    end 
end)


function updateStats(crashMultiplier) 
    local stats = Sky.File.ReadJson("sky_crashgame", "stats")
    if stats then 
        stats.total_games_played = stats.total_games_played + 1
        if crashMultiplier > stats.biggest_multiplier then
            stats.biggest_multiplier = crashMultiplier
        end

        stats.total_amount_paid_in = stats.total_amount_paid_in + totalPaidInAmountThisGame
        stats.total_amount_paid_out = stats.total_amount_paid_out + totalPaidOutAmountThisGame
        
        stats.house_edge_percent = ((stats.total_amount_paid_in - stats.total_amount_paid_out) / stats.total_amount_paid_in) * 100

        Sky.File.SaveJson("sky_crashgame", "stats", stats)

        totalPaidInAmountThisGame = 0
        totalPaidOutAmountThisGame = 0
    end
end

CreateThread(function()
    while Config.Game.syncEachSeconds > 0 do
        Wait(Config.Game.syncEachSeconds * 1000)
        eventToAllInGamePlayers("sky_crashgame:sync", timeElapsed)
    end
end)

CreateThread(function() 
    while true do
        Wait(100)
        if next(playersInGame) ~= nil then
            if not isGameRunning then 
                isGameRunning = true
                crashMultiplier = getCrashMultiplier()
                currentBets = table.copy(nextRoundBets)
                nextRoundBets = {}
                eventToAllInGamePlayers("sky_crashgame:gameStarted")

                for id, player in pairs(playersInGame) do 
                    if currentBets[id] ~= nil then
                        player.amount = currentBets[id]
                        player.color = "orange"
                    else
                        player.amount = 0
                        player.color = "gray"
                    end
                end
                eventToAllInGamePlayers("sky_crashgame:updatePlayers", playersInGame)

                startTime = os.clock()

                addToLogs("Game started", "game_started")
            else
                timeElapsed = os.clock() - startTime
                currentMultiplier = 1.0024 * (1.0718 ^ timeElapsed)

                if currentMultiplier >= crashMultiplier then

                    for id, player in pairs(playersInGame) do
                        if player.color ~= "green" then 
                            player.color = "red"
                            player.amount = player.amount * -1
                        end
                    end

                    eventToAllInGamePlayers("sky_crashgame:gameCrashed", crashMultiplier)
                    eventToAllInGamePlayers("sky_crashgame:updatePlayers", playersInGame)

                    isGameRunning = false
                    currentMultiplier = 0
                    timeElapsed = 0

                    addToLogs("Game ended on "..crashMultiplier, "game_ended")
                    if Config.Logging then
                        logs:Save()
                    end

                    updateStats(crashMultiplier)

                    Wait(5000)
                end
            end
        end
    end
end)

