local QBX = exports.qbx_core
local config = require 'qbx_consumables.config'

---hotfix: remove when qbx_core issue #470 fixed https://github.com/Qbox-project/qbx_core/issues/470
---Enforces synchronization of player's hunger or thirst metadata with value from statebag
---@param source number
---@param amount number inverted, lower == more
---@param type string
local function metadataSyncHotfix(source, amount, type)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    player.Functions.SetMetaData(type, amount)
end
---hotfix

---Set player's hunger state to 'amount'
---@param source number
---@param amount number inverted, lower == more hungry
local function setHunger(source, amount)
    amount = lib.math.clamp(amount, 0, 100)
    Player(source).state.hunger = amount

    metadataSyncHotfix(source, amount, 'hunger')
end

---Increment player's hunger state by 'amount'
---@param source number
---@param amount number inverted, lower == more hungry
local function addHunger(source, amount)
    local hunger = Player(source).state.hunger or 0
    setHunger(source, hunger + amount)
end

---Set player's thirst state to 'amount'
---@param source number
---@param amount number inverted, lower == more thirsty
local function setThirst(source, amount)
    amount = lib.math.clamp(amount, 0, 100)
    Player(source).state.thirst = amount

    metadataSyncHotfix(source, amount, 'thirst')
end

---Increment player's thirst state by 'amount'
---@param source number
---@param amount number inverted, lower == more thirsty
local function addThirst(source, amount)
    local thirst = Player(source).state.thirst or 0
    setThirst(source, thirst + amount)
end

---Relieve a random amount of stress from the player's state
---@param source number
---@param min number lower limit for random generation
---@param max number upper limit for rancom generation
local function relieveStress(source, min, max)
    local playerState = Player(source).state
    local verifiedMin = (type(min) == "number" and min) or config.defaultStressRelief.min
    local verifiedMax = max or config.defaultStressRelief.max
    local amount = math.random(verifiedMin, verifiedMax)
    local newStress = (playerState.stress or 0) - amount
    newStress = lib.math.clamp(newStress, 0, 100)

    playerState:set("stress", newStress, true)
    if amount < 0 then
        exports.qbx_core:Notify(source, locale('error.stress_gain'), 'inform', 2500, nil, nil, { '#141517', '#ffffff' }, 'brain', '#C53030')
    else
        exports.qbx_core:Notify(source, locale('success.stress_relief'), 'inform', 2500, nil, nil, { '#141517', '#ffffff' }, 'brain', '#0F52BA')
    end
end

for alcohol, params in pairs(config.consumables.alcohol) do
    exports.qbx_core:CreateUseableItem(alcohol, function(source, item)
        local drank = lib.callback.await('consumables:client:DrinkAlcohol', source, params.alcoholLevel, params.anim, params.prop)
        if not drank then return end
        if not exports.ox_inventory:RemoveItem(source, item.name, 1, nil, item.slot) then return end

        local sustenance = math.random(params.min, params.max)
        relieveStress(source, params.stressRelief.min, params.stressRelief.max)

        addThirst(source, sustenance)
    end)
end

for drink, params in pairs(config.consumables.drink) do
    exports.qbx_core:CreateUseableItem(drink, function(source, item)
        local drank = lib.callback.await('consumables:client:Drink', source, params.anim, params.prop)
        if not drank then return end
        if not exports.ox_inventory:RemoveItem(source, item.name, 1, nil, item.slot) then return end

        local sustenance = math.random(params.min, params.max)
        relieveStress(source, params.stressRelief.min, params.stressRelief.max)

        addThirst(source, sustenance)
    end)
end

for food, params in pairs(config.consumables.food) do
    exports.qbx_core:CreateUseableItem(food, function(source, item)
        local ate = lib.callback.await('consumables:client:Eat', source, params.anim, params.prop)
        if not ate then return end
        if not exports.ox_inventory:RemoveItem(source, item.name, 1, nil, item.slot) then return end

        local sustenance = math.random(params.min, params.max)
        relieveStress(source, params.stressRelief.min, params.stressRelief.max)

        addHunger(source, sustenance)
    end)
end

exports.qbx_core:CreateUseableItem('joint', function(source)
    TriggerClientEvent('consumables:client:UseJoint', source)
end)

exports.qbx_core:CreateUseableItem('cokebaggy', function(source)
    TriggerClientEvent('consumables:client:Cokebaggy', source)
end)

exports.qbx_core:CreateUseableItem('crack_baggy', function(source)
    TriggerClientEvent('consumables:client:Crackbaggy', source)
end)

exports.qbx_core:CreateUseableItem('xtcbaggy', function(source)
    TriggerClientEvent('consumables:client:EcstasyBaggy', source)
end)

exports.qbx_core:CreateUseableItem('oxy', function(source)
    TriggerClientEvent('consumables:client:oxy', source)
end)

exports.qbx_core:CreateUseableItem('meth', function(source)
    TriggerClientEvent('consumables:client:meth', source)
end)

exports.qbx_core:CreateUseableItem('lockpick', function(source)
    TriggerClientEvent('lockpicks:UseLockpick', source, false)
    TriggerEvent('lockpicks:UseLockpick', source, false)
end)

exports.qbx_core:CreateUseableItem('advancedlockpick', function(source)
    TriggerClientEvent('lockpicks:UseLockpick', source, true)
    TriggerEvent('lockpicks:UseLockpick', source, true)
end)

lib.callback.register('consumables:server:usedItem', function(source, item)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    return exports.ox_inventory:RemoveItem(source, item, 1)
end)

---Set player's hunger state to 'amount'
---@param amount number
RegisterNetEvent('consumables:server:setHunger', function(amount)
    --Make sure this can only be triggered from the client
    if not GetInvokingResource() then setHunger(source, amount) end
end)

---Increment player's hunger state by 'amount'
---@param amount number new hunger level
RegisterNetEvent('consumables:server:addHunger', function(amount)
    local resource = GetInvokingResource()
    --handles calls from ox_inventory's QB bridge, using improper QB nomenclature
    --todo remove upon merger of a proper qbx bridge to ox_inventory
    if resource == 'ox_inventory' then
        setHunger(source, amount)
    --Make sure this can only be triggered from the client
    elseif not resource then
        addHunger(source, amount)
    end
end)

---Set player's thirst state to 'amount'
---@param amount number
RegisterNetEvent('consumables:server:setThirst', function(amount)
    --Make sure this can only be triggered from the client
    if not GetInvokingResource() then setThirst(source, amount) end
end)

---Increment player's thirst state by 'amount'
---@param amount number new thirst level
RegisterNetEvent('consumables:server:addThirst', function(amount)
    local resource = GetInvokingResource()
    --handles calls from ox_inventory's QB bridge, using improper QB nomenclature
    --todo remove upon merger of a proper qbx bridge to ox_inventory
    if resource == 'ox_inventory' then
        setThirst(source, amount)
    --Make sure this can only be triggered from the client
    elseif not resource then
        addThirst(source, amount)
    end
end)

---@deprecated use SetHunger instead
exports('setHunger', setHunger)
---@deprecated use AddHunger instead
exports('addHunger', addHunger)
---@deprecated use SetThirst instead
exports('setThirst', setThirst)
---@deprecated use AddThirst instead
exports('addThirst', addThirst)

exports('SetHunger', setHunger)
exports('AddHunger', addHunger)
exports('SetThirst', setThirst)
exports('AddThirst', addThirst)

    -- Mysterybo

-- QBX:CreateUseableItem("mysterybox", function(source, item)
--     TriggerClientEvent("consumables:client:useMysteryBox", source)
-- end)

-- RegisterNetEvent("consumables:server:mysteryReward", function()
--     local src = source
--     local Player = exports.qbx_core:GetPlayer(src)
--     if not Player then return end

--     if exports.ox_inventory:RemoveItem(src, "mysterybox", 1) then
--         local rewardPool = {
--             { name = "WEAPON_ZKKNIFE", count = 1 },
--             { name = "WEAPON_KATANA", count = 1 },
--             { name = "WEAPON_GLOW_BAT", count = 1 },
--             { name = "WEAPON_SLEDGEHAMMER", count = 1 },
--             { name = "WEAPON_KATANA2", count = 1 },
--             { name = "WEAPON_VALAXE", count = 1 },
--             { name = "WEAPON_VALCLEVER", count = 1 },
--             { name = "WEAPON_VALKNIFE", count = 1 },
--             { name = "WEAPON_VALSPIKEDBAT", count = 1 },
--         }

--         local reward = rewardPool[math.random(1, #rewardPool)]
--         local success = exports.ox_inventory:AddItem(src, reward.name, reward.count)

--         if success then
--             TriggerClientEvent('ox_lib:notify', src, {
--                 description = ('You received: %sx %s'):format(reward.count, reward.name),
--                 type = 'success'
--             })
--         else
--             TriggerClientEvent('ox_lib:notify', src, {
--                 description = 'Failed to add item, inventory full?',
--                 type = 'error'
--             })
--         end
--     end
-- end)

    -- Armor + Heavy Armor
exports.qbx_core:CreateUseableItem('kevlar', function(src)
    TriggerClientEvent('consumables:client:UseKevlar', src)
end)

RegisterNetEvent('consumables:server:useKevlar', function()
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    if Player.Functions.RemoveItem('kevlar', 1) then
        TriggerClientEvent('consumables:client:ApplyArmor', src, 15)
    else
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'You don’t have armor.' })
    end
end)

-- Armor (50)
exports.qbx_core:CreateUseableItem('armor', function(src)
    TriggerClientEvent('consumables:client:UseArmor', src)
end)

RegisterNetEvent('consumables:server:useArmor', function()
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    if Player.Functions.RemoveItem('armor', 1) then
        TriggerClientEvent('consumables:client:ApplyArmor', src, 50)
    else
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'You don’t have armor.' })
    end
end)

-- Heavy (100)
exports.qbx_core:CreateUseableItem('heavyarmor', function(src)
    TriggerClientEvent('consumables:client:UseHeavyArmor', src)
end)

RegisterNetEvent('consumables:server:useHeavyArmor', function()
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    if Player.Functions.RemoveItem('heavyarmor', 1) then
        TriggerClientEvent('consumables:client:ApplyArmor', src, 100)
    else
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'You don’t have heavy armor.' })
    end
end)

-- /CID

lib.addCommand('cid', {
    help = 'Shows your Citizen ID',
    restricted = false
}, function(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    local citizenid = player.PlayerData.citizenid
    TriggerClientEvent('ox_lib:notify', source, {
        type = 'inform',
        description = ('Your Citizen ID: %s'):format(citizenid)
    })
end)

    -- /propfix

lib.addCommand('propfix', {
    help = 'Detach & delete props attached to you',
    restricted = false,
}, function(source)
    TriggerClientEvent('os:propfix', source)
end)

-- server.lua
-- deps: ox_lib

local radialKeys = {
    shirt     = 'crm-clth-shirt',
    vest      = 'crm-clth-vest',
    bag       = 'crm-clth-bag',
    mask      = 'crm-clth-mask',
    hat       = 'crm-clth-hat',
    glasses   = 'crm-clth-glasses',
    earrings  = 'crm-clth-earrings',
    watch     = 'crm-clth-watch',
    bracelet  = 'crm-clth-bracelet',
}

--- Helper: add a command that relays to client radial toggle
local function addRadialCmd(name, help)
    lib.addCommand(name, { help = help or ('Toggle ' .. name), restricted = false }, function(source)
        local key = radialKeys[name]
        if key then
            TriggerClientEvent('dq:radial:toggle', source, key)

    -- Backpack
            if name == 'bag' then
                SetTimeout(1200, function()
                    TriggerClientEvent('dq:runFixBag', source)
                end)
            end
        end
    end)
end

-- Radial pass-through commands
addRadialCmd('shirt', 'Toggle shirt')
addRadialCmd('vest', 'Toggle vest')
addRadialCmd('bag', 'Toggle bag')
addRadialCmd('mask', 'Toggle mask')
addRadialCmd('hat', 'Toggle hat')
addRadialCmd('glasses', 'Toggle glasses')
addRadialCmd('earrings', 'Toggle earrings')
addRadialCmd('watch', 'Toggle watch')
addRadialCmd('bracelet', 'Toggle bracelet')

-- Stateful save/restore commands
lib.addCommand('pants', { help = 'Toggle pants', restricted = false }, function(source)
    TriggerClientEvent('dq:toggle:pants', source)
end)

lib.addCommand('shoes', { help = 'Toggle shoes', restricted = false }, function(source)
    TriggerClientEvent('dq:toggle:shoes', source)
end)

lib.addCommand('neck', { help = 'Toggle neck accessory', restricted = false }, function(source)
    TriggerClientEvent('dq:toggle:neck', source)
end)

lib.addCommand('gloves', { help = 'Toggle gloves', restricted = false }, function(source)
    TriggerClientEvent('dq:toggle:gloves', source)
end)

lib.addCommand('undershirt', { help = 'Toggle undershirt', restricted = false }, function(source)
    TriggerClientEvent('dq:toggle:undershirt', source)
end)

for _,v in pairs(config.ConsumablesFireworks) do
    exports.qbx_core:CreateUseableItem(v, function(source, item)
        local src = source
        TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "scr_indep_fireworks")
    end)
end

RegisterNetEvent('consumables:server:UseFirework', function(item)
    local Player = exports.qbx_core:GetPlayer(source)

    if not Player then return end

    local foundItem = nil

    for i = 1, #config.ConsumablesFireworks do
        if config.ConsumablesFireworks[i] == item then
            foundItem = config.ConsumablesFireworks[i]
            break
        end
    end

    if not foundItem then return end

    if exports.ox_inventory:Search(source, 'count', foundItem) >= 1 then
		exports.ox_inventory:RemoveItem(source, foundItem, 1)
	else
		TriggerEvent("jim-consumables:server:DupeWarn", foundItem, source)
	end
end)

    -- AMMO CASES

local OX  = exports.ox_inventory

local CASE_REWARDS = {
    pistol_case  = { { item='pistol_ammo',  count=12 } },
    hunting_case = { { item='hunting_ammo', count=10 } },
    rubber_case  = { { item='rubber_ammo',  count=10 } },
    smg_case     = { { item='smg_ammo',     count=30 } },
    rifle_case   = { { item='rifle_ammo',   count=30 } },
    shotgun_case = { { item='shotgun_ammo', count=12 } },
    snp_case     = { { item='snp_ammo',      count=5 } },
    paint_case   = { { item='paint_ammo',  count=100 } },
}

local PENDING = {}

local function notify(src, msg, typ)
    TriggerClientEvent('ox_lib:notify', src, { description = msg, type = typ or 'inform' })
end

local function canCarryAll(src, rewards)
    for i = 1, #rewards do
        local r = rewards[i]
        if not OX:CanCarryItem(src, r.item, r.count) then
            return false, r.item, r.count
        end
    end
    return true
end

for caseKey in pairs(CASE_REWARDS) do
    QBX:CreateUseableItem(caseKey, function(source, item)
        PENDING[source] = { caseKey = caseKey, slot = item and item.slot, ts = GetGameTimer() }
        TriggerClientEvent("consumables:client:useAmmoCase", source)
    end)
end

RegisterNetEvent("consumables:server:AmmoCase", function()
    local src = source
    local pend = PENDING[src]
    PENDING[src] = nil
    if not pend then
        notify(src, "No pending ammo case found.", "error")
        return
    end

    local caseKey, slot = pend.caseKey, pend.slot
    local rewards = CASE_REWARDS[caseKey]
    if not rewards then
        notify(src, "Unknown ammo case.", "error")
        return
    end

    local ok, blockItem, need = canCarryAll(src, rewards)
    if not ok then
        notify(src, ("Not enough space for %sx %s."):format(need, blockItem), "error")
        return
    end

    if not OX:RemoveItem(src, caseKey, 1, nil, slot) then
        notify(src, "No case found in that slot.", "error")
        return
    end

    for i = 1, #rewards do
        local r = rewards[i]
        OX:AddItem(src, r.item, r.count)
    end

end)

RegisterNetEvent("consumables:server:AmmoCaseCancel", function()
    PENDING[source] = nil
end)
