local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
PlayerJob = {}
local hasBodycam = false

local acik = false
local editingBodycam = false
local timeThreadRunning = false

local utcOffset = 0.0 -- default

RegisterNUICallback("sendTimezoneOffset", function(data, cb)
    utcOffset = tonumber(data.offset) or 0.0
    cb("ok")
end)

-- 🔄 Check inventory for bodycam
local function CheckForBodycam()
    local items = exports.ox_inventory:Search('count', 'bodycam')
    return (items and items > 0)
end

-- 🔥 Toggle based on inventory state
local function UpdateBodycamState()
    local hasNow = CheckForBodycam()

    if hasNow and not hasBodycam then
        TriggerEvent("dog-bodycam:openBoy", nil, GetClockHours(), GetClockMinutes(), GetClockSeconds())
    elseif not hasNow and acik then
        TriggerEvent("dog-bodycam:openBoy", nil, GetClockHours(), GetClockMinutes(), GetClockSeconds())
    end

    hasBodycam = hasNow
end

RegisterNUICallback("uiReady", function(_, cb)
    local x = GetResourceKvpString("bodycam_pos_x")
    local y = GetResourceKvpString("bodycam_pos_y")

    if x and y then
        SendNUIMessage({
            action = "applyPosition",
            x = tonumber(x),
            y = tonumber(y)
        })
    end

    cb("ok")
end)

-- 🟢 Called when player logs in
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1000)
    UpdateBodycamState()
end)

-- 📦 Called when inventory updates (OX event)
AddEventHandler('ox_inventory:itemCount', function(itemName, totalCount)
    if itemName ~= 'bodycam' then return end
    UpdateBodycamState()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

local year, month, day, hour, minute, second = GetLocalTime()
RegisterNetEvent("bodycam:time")
AddEventHandler("bodycam:time", function (h,m,s)
    local formattedOffset = (utcOffset >= 0 and "+" .. utcOffset or tostring(utcOffset))
    SendNUIMessage({
        action = "zamanguncelle",
        zaman = month.."/"..day.."/"..year.." - "..h..":"..m..":"..s.." UTC"..formattedOffset,
    })
end)

-- 🔥 Bodycam toggle logic
RegisterNetEvent("dog-bodycam:openBoy")
AddEventHandler("dog-bodycam:openBoy", function (item, h,m,s)
    local Player = QBCore.Functions.GetPlayerData()
    local gender

    if Player.charinfo.gender == "0" then
        gender = Config.Gender2
    else
        gender = Config.Gender1
    end

    -- Turning OFF
    if acik then
        acik = false
        timeThreadRunning = false

        SendNUIMessage({
            action = "hidebodycam"
        })

        if Config.okokNotify then
            exports['okokNotify']:Alert('Success', 'You stopped your Body Camera!', 5000, 'info')
        elseif Config.QBNotify then
            TriggerEvent("QBCore:Notify", "Successfully you stopped your Body Camera!", "success", 2500)
        end

        TriggerServerEvent("booleanuodate", false)

    -- Turning ON
    else
        local formattedOffset = (utcOffset >= 0 and "+" .. utcOffset or tostring(utcOffset))
        local callsign = tostring(Player.metadata.callsign or "")
        local isBCSO = tostring(Player.metadata.callsign or ""):find("17%-") ~= nil
        SendNUIMessage({
            action = "showbodycam",
            player = Player.job.grade.name.. " "..Player.charinfo.firstname.." "..Player.charinfo.lastname,
            callsign = "["..Player.metadata['callsign'].."]",
            tarih = month.."/"..day.."/"..year.." - "..h..":"..m..":"..s.." UTC"..formattedOffset,
            dept = isBCSO and 'Blaine County Sheriff\'s Office' or 'Los Santos Police Department'
        })

        if Config.okokNotify then
            exports['okokNotify']:Alert('Success', 'You turned on your Body Camera!', 5000, 'info')
        elseif Config.QBNotify then
            TriggerEvent("QBCore:Notify", "Success you turned on your Body Camera!", "success", 2500)
        end

        TriggerServerEvent("booleanuodate", true)
        acik = true

        -- Start EST time updater
        if not timeThreadRunning then
            timeThreadRunning = true

            CreateThread(function()
                local formattedOffset = (utcOffset >= 0 and "+" .. utcOffset or tostring(utcOffset))
                while timeThreadRunning do
                    local y, mo, d, hh, mm, ss = GetLocalTime()
                    
                    -- zero pad helper
                    local function pad(n)
                        return (n < 10 and "0" .. n or n)
                    end

                    SendNUIMessage({
                        action = "zamanguncelle",
                        zaman = pad(mo).."/"..pad(d).."/"..y.." - "..pad(hh)..":"..pad(mm)..":"..pad(ss).." UTC"..formattedOffset
                    })

                    Wait(1000)
                end
            end)
        end
    end
end)

-- 🔧 Edit mode command
RegisterCommand("editbodycam", function()
    if editingBodycam and not acik then
        return
    end

    editingBodycam = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        action = "editMode",
        enable = true
    })
end)

-- 🔄 Reset to default position
RegisterCommand("resetbodycam", function()
    DeleteResourceKvp("bodycam_pos_x")
    DeleteResourceKvp("bodycam_pos_y")

    SendNUIMessage({
        action = "applyPosition",
        x = 0,
        y = 0
    })

    QBCore.Functions.Notify("Bodycam UI position reset to default.", "success", 3000)
end)

-- 🔚 Save new position
RegisterNUICallback("finishEdit", function(data, cb)
    local x = data.x
    local y = data.y

    SetResourceKvp("bodycam_pos_x", tostring(x))
    SetResourceKvp("bodycam_pos_y", tostring(y))

    SetNuiFocus(false, false)
    editingBodycam = false

    cb("ok")
end)
