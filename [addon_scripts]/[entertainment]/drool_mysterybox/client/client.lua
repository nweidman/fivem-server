-- client.lua
local nuiOpen = false
local resourceName = GetCurrentResourceName()

local function startHoldingBox()
    ExecuteCommand('e box')
end

local function stopHoldingBox()
    ExecuteCommand('e c')
end

RegisterNetEvent('mysterybox:client:OpenUI', function(data)
    local boxName = data.boxName
    local rewards = Config.MysteryBoxes[data.box].Rewards
    local rarities = Config.MysteryBoxes[data.box].Rarities
    local reward = data.reward

    startHoldingBox()

    SetNuiFocus(true, true)
    nuiOpen = true

    SendNUIMessage({
        action = 'open',
        resource = resourceName,
        rewards = rewards,
        rarities = rarities,
        chosen = {
            reward = reward.reward,
            rarity = data.rarity,
            displayName = data.label,
            image = data.img
        },
        box = boxName
    })
end)

RegisterNUICallback('claim', function(data, cb)
    stopHoldingBox()

    TriggerServerEvent('mysterybox:server:Claim', data.reward)

    SetNuiFocus(false, false)
    nuiOpen = false
    cb({ ok = true })
end)

RegisterNUICallback('close', function(_, cb)
    stopHoldingBox()

    SetNuiFocus(false, false)
    nuiOpen = false
    cb('ok')
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= resourceName then return end

    if nuiOpen then
        SetNuiFocus(false, false)
        nuiOpen = false
    end

    stopHoldingBox()
end)
