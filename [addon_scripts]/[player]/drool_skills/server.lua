progress = {}

-- open from command
lib.addCommand("skills", {
    help = "Open the Skills Menu"
}, function(source)
    while progress[source] == nil do
        Wait(100)
    end
    TriggerClientEvent('drool_skills:client:openUI', source)
end)

lib.addCommand("skills_level", {
    help = "See your Skills level"
}, function(source)
    local src = source
    TriggerClientEvent("QBCore:Notify", src, "Your level is: "..progress[src].level.." ("..progress[src].xp.."/"..Config.Levels[progress[src].level +1].requiredXP.." XP)")
    TriggerClientEvent("QBCore:Notify", src, "You currently have: "..progress[src].perkpoints.." perk points!")
end)

lib.addCommand("skills_add_level", {
    help = "Add skills levels to a player id",
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
        {
            name = 'levels',
            type = 'number',
            help = 'Amount of levels to give to the player',
        },
    },
    restricted = 'group.admin'
}, function(source, args)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if tonumber(progress[src].level) + tonumber(args.levels) <= 100 then
        local perkPointsToAdd = 0
        local xpToAdd = 0
        for i= tonumber(progress[src].level) + 1, tonumber(progress[src].level) + tonumber(args.levels) do
            perkPointsToAdd = perkPointsToAdd + Config.Levels[i].addperkpoints
        end
        progress[src].perkpoints = progress[src].perkpoints + perkPointsToAdd
        progress[src].level = tonumber(progress[src].level) + tonumber(args.levels)
        progress[src].xp = Config.Levels[progress[src].level].requiredXP
        Player.Functions.SetMetaData('skills', progress[src])
            TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src])
        TriggerClientEvent("QBCore:Notify", src, "Successfully added "..args.levels.." levels to player "..args.target, 'success')
    else
        TriggerClientEvent("QBCore:Notify", src, "Player's level can not pass 100", 'error')
    end
end)

lib.addCommand("skills_set_level", {
    help = "Add skills levels to a player id",
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id',
        },
        {
            name = 'level',
            type = 'number',
            help = 'The level to set the player to. This will reset their skill points.',
        },
    },
    restricted = 'group.admin'
}, function(source, args)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local perkPoints = 0
    progress[src].level = tonumber(args.level)
    progress[src].xp = Config.Levels[progress[src].level].requiredXP
    for i= 1, tonumber(progress[src].level) do
        perkPoints = perkPoints + Config.Levels[i].addperkpoints
    end
    for k, v in pairs(progress[src].levels) do
        progress[src].levels[k] = {tier=0}
    end
    progress[src].perkpoints = perkPoints
    Player.Functions.SetMetaData('skills', progress[src])
    TriggerClientEvent("QBCore:Notify", src, "Successfully set player "..args.target.."\'s level to "..args.level, 'success')
    TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src])
end)

RegisterNetEvent('drool_skills:server:getProgress', function()
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)

    if not Player then return end
    progress[src] = Player.PlayerData.metadata['skills']
    local newPerksAdded = false
    --Remove metadata for old skills
    if progress[src].perks then
        progress[src].perks = nil
    end

    -- Create skills metadata if it does not exists.
    if progress[src].levels == nil then
        progress[src].levels = {}
        local myPerks = {}
        for k, v in pairs(Config.SkillCategories) do
            myPerks[v.key] = {tier = 0}
        end
        progress[src].levels = myPerks
        newPerksAdded = true
    end

    -- Check for any new skills added and add to metadata.
    
    for k, v in pairs(Config.SkillCategories) do
        if not progress[src].levels[v.key] then
            progress[src].levels[v.key] = {tier = 0}
            newPerksAdded = true
        end
    end

    if newPerksAdded then
        Player.Functions.SetMetaData('skills', progress[src])
        TriggerClientEvent("QBCore:Notify", src, "New skills have been added, check them out with /skills")
    end

    TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src])
end)

RegisterNetEvent('drool_skills:server:purchaseTier', function(data)
    local src = source
    progress[src].levels[data.key].tier = data.tier
    progress[src].perkpoints = progress[src].perkpoints - data.cost
    local Player = exports.qbx_core:GetPlayer(src)
    Player.Functions.SetMetaData('skills', progress[src])
    TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src])
end)

RegisterNetEvent('drool_skills:server:resetSkillPoints', function()
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local perkPointsToAdd = 0
    local bank = Player.PlayerData.money["bank"] or 0

    if bank >= Config.ResetSkillsPrice then
        Player.Functions.RemoveMoney('bank', Config.ResetSkillsPrice, "Skills Reset")
        for i= 1, tonumber(progress[src].level) do
            perkPointsToAdd = perkPointsToAdd + Config.Levels[i].addperkpoints
        end

        for k, v in pairs(progress[src].levels) do
            progress[src].levels[k] = {tier=0}
        end

        progress[src].perkpoints = perkPointsToAdd

        Player.Functions.SetMetaData('skills', progress[src])
        TriggerClientEvent("QBCore:Notify", src, "You have successfully reset your skill points!", 'success')
        TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src])
    else
        TriggerClientEvent("QBCore:Notify", src, "You don\'t have enough money!", 'error')
    end
end)

-- GYM
RegisterNetEvent('drool_skills:server:AddXP', function(amount)
    local src = source
    if not src or not amount then return end

    if Config.DoubleXP then
        amount = amount * 2
    end

    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end

    if not progress[src] then
        progress[src] = Player.PlayerData.metadata['skills']
    else
        progress[src].xp = progress[src].xp + amount
        local levelbeforexp = progress[src].level

        while progress[src].xp >= (Config.Levels[progress[src].level + 1] and Config.Levels[progress[src].level + 1].requiredXP or math.huge) do
            progress[src].level = progress[src].level + 1
            if Config.Levels[progress[src].level] then
                progress[src].perkpoints = progress[src].perkpoints + Config.Levels[progress[src].level].addperkpoints
            end
        end
        if levelbeforexp < progress[src].level then
            TriggerClientEvent("QBCore:Notify", src, "You have leveled up! Check your skills menu with /skills", "success")
            TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src], false)
        end
    end
    Player.Functions.SetMetaData('skills', progress[src])
end)

function addXP(src, amount)
    local src = source
    if not src or not amount then return end

    if Config.DoubleXP then
        amount = amount * 2
    end

    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end

    if not progress[src] then
        progress[src] = Player.PlayerData.metadata['skills']
    else
        progress[src].xp = progress[src].xp + amount
        local levelbeforexp = progress[src].level

        while progress[src].xp >= (Config.Levels[progress[src].level + 1] and Config.Levels[progress[src].level + 1].requiredXP or math.huge) do
            progress[src].level = progress[src].level + 1
            if Config.Levels[progress[src].level] then
                progress[src].perkpoints = progress[src].perkpoints + Config.Levels[progress[src].level].addperkpoints
            end
        end
        if levelbeforexp < progress[src].level then
            TriggerClientEvent("QBCore:Notify", src, "You have leveled up! Check your skills menu with /skills", "success")
            TriggerClientEvent("drool_skills:client:refreshSkills", src, progress[src], false)
        end
    end
    Player.Functions.SetMetaData('skills', progress[src])
end
exports('addXP', addXP)

RegisterServerEvent('drool_skills:server:attemptMembershipPurchase', function(paymentType, Premium)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    progress[src] = Player.PlayerData.metadata['skills']
    
    local timePassed = os.time() - progress[src].gymcooldown
    local cooldownTime = Config.Gym.gym_cooldown * 3600

    if timePassed >= cooldownTime then
        if Premium then
            if paymentType == "cash" then
                if Player.PlayerData.money.cash >= Config.PremiumMembership.entrance_fee then
                    Player.Functions.RemoveMoney('cash', Config.PremiumMembership.entrance_fee, 'gym membership')
                    TriggerClientEvent('QBCore:Notify', src, 'You have paid for a gym membership in cash', 'success')
                    TriggerClientEvent('drool_skills:client:addGymMembership', src, true)
                    progress[src].gymcooldown = os.time()
                    Player.Functions.SetMetaData('skills', progress[src])
                else
                    TriggerClientEvent('QBCore:Notify', src, "You don't have enough money on your card, you need $".. Config.Gym.entrance_fee .. " to buy a membership", 'error')
                end
            else
                if Player.PlayerData.money.bank >= Config.PremiumMembership.entrance_fee then
                    Player.Functions.RemoveMoney('bank', Config.PremiumMembership.entrance_fee, 'gym membership')
                    TriggerClientEvent('QBCore:Notify', src, 'You have paid for a gym membership by card', 'success')
                    TriggerClientEvent('drool_skills:client:addGymMembership', src, true)
                    progress[src].gymcooldown = os.time()
                    Player.Functions.SetMetaData('skills', progress[src])
                else
                    TriggerClientEvent('QBCore:Notify', src, "You don't have enough money on your card, you need $".. Config.Gym.entrance_fee .. " to buy a membership", 'error')
                end
            end
        else
            if paymentType == "cash" then
                if Player.PlayerData.money.cash >= Config.Gym.entrance_fee then
                    Player.Functions.RemoveMoney('cash', Config.Gym.entrance_fee, 'gym membership')
                    TriggerClientEvent('QBCore:Notify', src, 'You have paid for a gym membership in cash', 'success')
                    TriggerClientEvent('drool_skills:client:addGymMembership', src, false)
                    progress[src].gymcooldown = os.time()
                    Player.Functions.SetMetaData('skills', progress[src])
                else
                    TriggerClientEvent('QBCore:Notify', src, "You don't have enough money on your card, you need $".. Config.Gym.entrance_fee .. " to buy a membership", 'error')
                end
            else
                if Player.PlayerData.money.bank >= Config.Gym.entrance_fee then
                    Player.Functions.RemoveMoney('bank', Config.Gym.entrance_fee, 'gym membership')
                    TriggerClientEvent('QBCore:Notify', src, 'You have paid for a gym membership by card', 'success')
                    TriggerClientEvent('drool_skills:client:addGymMembership', src, false)
                    progress[src].gymcooldown = os.time()
                    Player.Functions.SetMetaData('skills', progress[src])
                else
                    TriggerClientEvent('QBCore:Notify', src, "You don't have enough money on your card, you need $".. Config.Gym.entrance_fee .. " to buy a membership", 'error')
                end
            end
        end
    else
        local timeLeft = cooldownTime - timePassed
        local minutesLeft = math.ceil(timeLeft / 60)

        TriggerClientEvent('QBCore:Notify', src, "You have already visited the gym today! Check back in " .. minutesLeft .. " minutes", 'error')
    end
end)