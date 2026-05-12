local QBCore = exports['qb-core']:GetCoreObject()

local PlayerData = nil
local currentWalkingStyle, currentMood

local isCrouched = false
local lastAppliedWalkingStyle = nil

local function notify(desc, nType)
    if lib and lib.notify then
        lib.notify({ description = desc, type = nType or 'inform' })
    else
        QBCore.Functions.Notify(desc, nType or 'primary')
    end
end

RegisterNetEvent('crouchprone:client:CrouchState', function(state)
    local wasCrouched = isCrouched
    isCrouched = state and true or false
    if wasCrouched and not isCrouched then
        CreateThread(function()
            Wait(80)
            if currentWalkingStyle and currentWalkingStyle ~= '' then
                lastAppliedWalkingStyle = nil
                SetWalkingStyle()
            end
        end)
    end
end)

local function _myBag(b) return b == ('player:' .. GetPlayerServerId(PlayerId())) end
AddStateBagChangeHandler('isCrouched', nil, function(bag, k, value)
    if not _myBag(bag) then return end
    local wasCrouched = isCrouched
    isCrouched = value and true or false
    if wasCrouched and not isCrouched then
        CreateThread(function()
            Wait(80)
            if currentWalkingStyle and currentWalkingStyle ~= '' then
                lastAppliedWalkingStyle = nil
                SetWalkingStyle()
            end
        end)
    end
end)

function SetWalkingStyle()
    if not currentWalkingStyle or currentWalkingStyle == '' then return end

    if isCrouched then
        TriggerEvent('crouchprone:client:SetWalkSet', currentWalkingStyle)
        return
    end

    if lastAppliedWalkingStyle == currentWalkingStyle then
        TriggerEvent('crouchprone:client:SetWalkSet', currentWalkingStyle)
        return
    end

    local ped = PlayerPedId()
    RequestAnimSet(currentWalkingStyle)
    local t = GetGameTimer()
    while not HasAnimSetLoaded(currentWalkingStyle) do
        Wait(10)
        if GetGameTimer() - t > 7500 then break end
    end
    if HasAnimSetLoaded(currentWalkingStyle) then
        SetPedMovementClipset(ped, currentWalkingStyle, 1.0)
        TriggerEvent('crouchprone:client:SetWalkSet', currentWalkingStyle)
        lastAppliedWalkingStyle = currentWalkingStyle
    end
end
exports('SetWalkingStyle', SetWalkingStyle)

local function ClearWalkingStyle()
    ResetPedMovementClipset(PlayerPedId(), 0.0)
    lastAppliedWalkingStyle = nil
end

function SetMood()
    if not currentMood or currentMood == '' then return end
    local ped = PlayerPedId()
    ClearFacialIdleAnimOverride(ped)
    SetFacialIdleAnimOverride(ped, currentMood, 0)
end
exports('SetMood', SetMood)

local function ClearMood()
    ClearFacialIdleAnimOverride(PlayerPedId())
end

local function SaveWalkingStyle()
    TriggerServerEvent('is-playerstyles:server:SaveStyle', 'walkingStyle', currentWalkingStyle)
    notify(Locale[Config.Language]['walking_style_set_success'], 'success')
end

local function SaveMood()
    TriggerServerEvent('is-playerstyles:server:SaveStyle', 'mood', currentMood)
    notify(Locale[Config.Language]['mood_set_success'], 'success')
end

local function SetAndSaveWalkingStyle(walkingStyle)
    currentWalkingStyle = walkingStyle
    SetWalkingStyle()
    SaveWalkingStyle()
end

local function SetAndSaveMood(mood)
    currentMood = mood
    SetMood()
    SaveMood()
end

local function getDefaultWalkingStyle()
    local gender = (PlayerData and PlayerData.charinfo and PlayerData.charinfo.gender) or 0 -- 0=male, 1=female
    return (gender == 0 and Config.DefaultWalkingStyles.Male or Config.DefaultWalkingStyles.Female)
end

local function ReapplyFromServer()
    QBCore.Functions.TriggerCallback('is-playerstyles:server:GetSavedStyles', function(data)
        Wait(tonumber(Config.ApplyDelay) or 500)

        if not data then
            currentWalkingStyle = getDefaultWalkingStyle()
            currentMood         = Config.DefaultMood
        else
            currentWalkingStyle = (data.walkingStyle and data.walkingStyle ~= '') and data.walkingStyle or getDefaultWalkingStyle()
            currentMood         = (data.mood and data.mood ~= '') and data.mood or Config.DefaultMood
        end

        lastAppliedWalkingStyle = nil
        SetWalkingStyle()
        SetMood()
    end)
end

local function Init()
    PlayerData = QBCore.Functions.GetPlayerData()
    ReapplyFromServer()
end

RegisterNetEvent('drool:client:ResetWalkStyle', function()
    Init()
end)

local function OpenWalkingStylesMenu()
    local options = {
        {
            title = Locale[Config.Language]['menu_go_back'],
            icon = 'arrow-left',
            onSelect = function() TriggerEvent('is-playerstyles:client:OpenStylesMenu') end
        },
        {
            title = Locale[Config.Language]['walking_styles'],
            description = Locale[Config.Language]['walking_styles_desc'],
            icon = 'walking',
            disabled = true
        }
    }

    for _, v in pairs(Config.WalkingStyles) do
        local isCurrent = (currentWalkingStyle == v.Style)
        options[#options+1] = {
            title = v.Name,
            description = isCurrent and 'Current' or nil,
            icon = isCurrent and 'check-circle' or 'circle',
            onSelect = function() SetAndSaveWalkingStyle(v.Style) end
        }
    end

    lib.registerContext({
        id = 'isps_menu_walk',
        title = Locale[Config.Language]['walking_styles'],
        options = options
    })
    lib.showContext('isps_menu_walk')
end

local function OpenMoodsMenu()
    local options = {
        {
            title = Locale[Config.Language]['menu_go_back'],
            icon = 'arrow-left',
            onSelect = function() TriggerEvent('is-playerstyles:client:OpenStylesMenu') end
        },
        {
            title = Locale[Config.Language]['moods'],
            description = Locale[Config.Language]['moods_desc'],
            icon = 'face-smile',
            disabled = true
        }
    }

    for _, v in pairs(Config.Moods) do
        local isCurrent = (currentMood == v.Mood)
        options[#options+1] = {
            title = v.Name,
            description = isCurrent and 'Current' or nil,
            icon = isCurrent and 'check-circle' or 'circle',
            onSelect = function() SetAndSaveMood(v.Mood) end
        }
    end

    lib.registerContext({
        id = 'isps_menu_mood',
        title = Locale[Config.Language]['moods'],
        options = options
    })
    lib.showContext('isps_menu_mood')
end

function OpenStylesMenu()
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        notify(Locale[Config.Language]['cannot_open_in_vehicle'], 'error')
        return
    end

    lib.registerContext({
        id = 'isps_menu_root',
        title = Locale[Config.Language]['player_styles'],
        options = {
            {
                title = Locale[Config.Language]['walking_style'],
                description = Locale[Config.Language]['walking_styles_desc'],
                icon = 'walking',
                onSelect = OpenWalkingStylesMenu
            },
            {
                title = Locale[Config.Language]['mood'],
                description = Locale[Config.Language]['moods_desc'],
                icon = 'face-smile',
                onSelect = OpenMoodsMenu
            }
        }
    })
    lib.showContext('isps_menu_root')
end

AddEventHandler('onResourceStart', function(res)
    if res == GetCurrentResourceName() then
        Wait(500)
        Init()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Init()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = nil
    ClearWalkingStyle()
    ClearMood()
end)

AddEventHandler('playerSpawned', function()
    Wait(500)
    ReapplyFromServer()
end)

RegisterNetEvent('is-playerstyles:client:OpenStylesMenu', OpenStylesMenu)

RegisterNetEvent('is-playerstyles:client:ResetWalkingStyle', function()
    SetAndSaveWalkingStyle(getDefaultWalkingStyle())
end)

RegisterNetEvent('is-playerstyles:client:ResetMood', function()
    SetAndSaveMood(Config.DefaultMood)
end)

for _, v in pairs(Config.WalkingStyleEvents) do
    RegisterNetEvent(v.Name, function()
        Wait(v.Delay or 0)
        SetWalkingStyle()
    end)
end

for _, v in pairs(Config.WalkingStyles) do
    RegisterNetEvent('is-playerstyles:client:SetWalkingStyle:' .. v.Name, function()
        SetAndSaveWalkingStyle(v.Style)
    end)
end

for _, v in pairs(Config.Moods) do
    RegisterNetEvent('is-playerstyles:client:SetMood:' .. v.Name, function()
        SetAndSaveMood(v.Mood)
    end)
end
