local rewards = require 'config'.rewards

local function rewardFinishedTutorial(source)
    local player = GetPlayerBridge(source)
    if not player then return end

    for _, item in ipairs(rewards.items) do
        AddItemBridge(source, item.name, item.amount)
    end
end

lib.callback.register('um-tutorial:server:doneTutorial', function(source)
    if not rewards.status then return end

    local player = GetPlayerBridge(source)
    if not player then return end

    local license = GetPlayerIdentifierByType(source, 'license2')
    if not license or license == '' then return end

    local check = MySQL.single.await('SELECT * FROM um_tutorial_rewards WHERE license = ? LIMIT 1',
        { license })
    if check then return end

    local result = MySQL.insert.await('INSERT INTO um_tutorial_rewards (license) VALUES (?)',
        { license })
    if not result then return end

    rewardFinishedTutorial(source)
end)

lib.addCommand('test_tutorial', {
    help = 'Starts Tutorial for testing purposes',
    restricted = 'group.admin',
}, function(source)
    TriggerClientEvent('um-tutorial:client:openTutorial', source)
end)

if rewards.status then
    MySQL.ready(function()
        MySQL.execute([[
        CREATE TABLE IF NOT EXISTS um_tutorial_rewards (
            id INT AUTO_INCREMENT PRIMARY KEY,
            license VARCHAR(50) NOT NULL UNIQUE
        )
    ]])
    end)
end
