Settings = {}
CurrentFrequency = 0
OpenProps = {}
TalkProps = {}
IsOpen = false
CurrentVersion = 0
IsOnesyncInfinity = false
DisableShooting = false

if Shared.Framework == "qbcore" then
  Framework = exports["qb-core"]:GetCoreObject()
elseif Shared.Framework == "esx" then
  if not pcall(function()
        Framework = exports["es_extended"]:getSharedObject()
      end) then
    Citizen.CreateThread(function()
      while Framework == nil do
        TriggerEvent("esx:getSharedObject",
          function(obj) Framework = obj end)
        Wait(100)
      end
    end)
  end
end

local RADIO_ITEM = "radio"

local function HasRadioItem()
  if GetResourceState("ox_inventory") == "started" then
    local count = exports.ox_inventory:Search("count", RADIO_ITEM)
    return (count and count > 0) or false
  end
  return false
end

local function ForceRadioOff()
  if GetResourceState("pma-voice") == "started" then
    exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
    exports["pma-voice"]:setRadioChannel(0)
  elseif GetResourceState("mumble-voip") == "started" then
    exports["mumble-voip"]:SetRadioChannel(0)
  elseif GetResourceState("tokovoip_script") == "started" then
    exports["tokovoip_script"]:removePlayerFromRadio(CurrentFrequency)
  elseif GetResourceState("saltychat") == "started" then
    exports["saltychat"]:SetRadioChannel(nil, true)
  end

  CurrentFrequency = 0
  LocalPlayer.state:set('radioChannel', 0, true)
  TriggerServerEvent('dispatch:GetRadioChannel', 0)
end

local function DelayedForceOff()
  CreateThread(function()
    Wait(1500)
    ForceRadioOff()
  end)
end

AddEventHandler('onClientResourceStart', function(res)
  if res ~= GetCurrentResourceName() then return end
  DelayedForceOff()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  DelayedForceOff()
end)

RegisterNetEvent('esx:playerLoaded', function()
  DelayedForceOff()
end)

AddEventHandler('playerSpawned', function()
  CreateThread(function()
    Wait(2000)
    ForceRadioOff()
  end)
end)

Functions = {
  GetPlayerData = function()
    local plrdata = {}
    if Shared.Framework == "qbcore" then
      plrdata = Framework.Functions.GetPlayerData()
    elseif Shared.Framework == "esx" then
      plrdata = Framework.GetPlayerData()
    end
    return plrdata
  end,

  LeaveRadio = function()
    if GetResourceState("pma-voice") == "started" then
      exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
      exports["pma-voice"]:setRadioChannel(0)
    elseif GetResourceState("mumble-voip") == "started" then
      exports["mumble-voip"]:SetRadioChannel(0)
    elseif GetResourceState("tokovoip_script") == "started" then
      exports["tokovoip_script"]:removePlayerFromRadio(CurrentFrequency)
    elseif GetResourceState("saltychat") == "started" then
      exports["saltychat"]:SetRadioChannel(nil, true)
    end

    CurrentFrequency = 0
    LocalPlayer.state:set('radioChannel', 0, true)
    TriggerServerEvent('dispatch:GetRadioChannel', 0)
end,

  UpdateRadioVolume = function(newVolume)
    if GetResourceState("pma-voice") == "started" then
      exports["pma-voice"]:setRadioVolume(newVolume)
    elseif GetResourceState("tokovoip_script") == "started" then
      exports["tokovoip_script"]:setRadioVolume(newVolume)
    elseif GetResourceState("saltychat") == "started" then
      exports["saltychat"]:SetRadioVolume(newVolume / 100)
    end
  end,

  GetStatus = function()
    local ped = PlayerPedId()

    if ped then
      if IsPedInAnyVehicle(ped, false) then
        return _U("inVehicle")
      else
        return _U("onFoot")
      end
    else
      return _U("unknown")
    end
  end,

  GetRadioChannel = function()
    local id = PlayerId()

    if id then
      if GetResourceState("pma-voice") == "started" then
        if IsOnesyncInfinity == true then
          CurrentFrequency = tonumber(Player(-1).state.radioChannel)
        end
      elseif GetResourceState("mumble-voip") == "started" then
        local freq = exports["mumble-voip"]:GetPlayerRadioChannel(GetPlayerServerId(id))

        if freq then
          CurrentFrequency = tonumber(freq)
        end
      elseif GetResourceState("tokovoip_script") == "started" then
        CurrentFrequency = exports["tokovoip_script"]:getPlayerData(GetPlayerServerId(id), "radio:channel")
      elseif GetResourceState("saltychat") == "started" then
        CurrentFrequency = exports["saltychat"]:GetRadioChannel(true)
      end
    end
  end,

  ChangeRadioChannel = function(freq)
    if GetResourceState("pma-voice") == "started" then
      exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
      exports["pma-voice"]:setRadioChannel(freq)
    elseif GetResourceState("mumble-voip") == "started" then
      exports["mumble-voip"]:SetRadioChannel(freq)
    elseif GetResourceState("tokovoip_script") == "started" then
      exports["tokovoip_script"]:addPlayerToRadio(freq, true)
    elseif GetResourceState("saltychat") == "started" then
      exports["saltychat"]:SetRadioChannel(tostring(freq), true)
    end
  end,

  Notify = function(name, type)
    if Shared.Framework == "qbcore" then
      Framework.Functions.Notify(name, type)
    elseif Shared.Framework == "esx" then
      Framework.ShowNotification(name, type)
    elseif Shared.Framework == "standalone" then
      warn("No custom logic added to Functions.Notify...")
    end
  end,

  GetStreetName = function(pos)
    local s1, s2 = Citizen.InvokeNative(
      0x2EB41072B4C1E4C0,
      pos.x,
      pos.y,
      pos.z,
      Citizen.PointerValueInt(),
      Citizen.PointerValueInt()
    )

    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then
      streetLabel = streetLabel .. " " .. street2
    end

    return streetLabel
  end,

  PanicButton = function()
    local ped = PlayerPedId()
    if ped then
      local coords = GetEntityCoords(ped)

      if Shared.PanicButtonSound.Enabled == true then
        if GetResourceState("high_3dsounds") == "started" then
          local sound = exports["high_3dsounds"]:Play3DEntity(
            NetworkGetNetworkIdFromEntity(ped),
            20.0,
            Shared.PanicButtonSound.Name,
            1.0,
            true
          )

          CreateThread(function()
            Wait(Shared.PanicButtonSound.Duration * 1000)
            sound.destroy()
          end)
        elseif GetResourceState("sounity") == "started" then
          TriggerServerEvent("zerio-radio:server:playSounitySound")
        elseif GetResourceState("pmms") == "started" then
          TriggerServerEvent("zerio-radio:server:playPmmsSound")
        end
      end

      if GetResourceState("zerio-dispatch") == "started" then
        TriggerServerEvent("zerio-dispatch:server:addAlert", -1, {
          blipId = 161,
          position = { coords.x, coords.y, coords.z },
          sound = "adddispatch.mp3",
          description = _U("panic_alert_description"),
          top = {
            text = _U("panic_alert_header"),
            code = "10-22",
          },
          fields = {
            {
              text = Functions.GetStreetName(coords),
              icon = "mdi-earth",
            },
          },
        })
      elseif GetResourceState("lb-tablet") == "started" then
        TriggerServerEvent("zerio-radio:server:sendLbTabletMessage")
      elseif GetResourceState("ps-dispatch") == "started" then
        TriggerServerEvent("dispatch:server:notify", {
          dispatchcodename = "susactivity",
          dispatchCode = "10-90",
          firstStreet = Functions.GetStreetName(coords),
          gender = "unknown",
          priority = 2,
          origin = {
            x = coords.x,
            y = coords.y,
            z = coords.z,
          },
          dispatchMessage = _U("panic_alert_header"),
          job = { "police" },
        })
      end
    end
  end,

  OpenScanner = function()
    SetNuiFocus(true, true)
    SendNUIMessage({
      action = "openScanner",
    })
    SendNUIMessage({
      action = "updateData",
      data = {
        streetLabel = "",

        radioFrequency = CurrentFrequency,

        translations = Locales[Shared.Locale].ui,

        status = "",

        voiceScript = Shared.VoiceScript,
      },
    })
  end,

  LoadSettings = function()
    Settings = promise.new()
    TriggerServerEvent("zerio-radio:server:getsettings")

    Citizen.Await(Settings)
  end,

  Open = function()
    local ped = PlayerPedId()

    if ped then
      if not HasRadioItem() then
        return Functions.Notify("You need a radio to open the radio.", "error")
      end

      local coords = GetEntityCoords(ped)
      local waterRetVal, height = GetWaterHeight(coords.x, coords.y, coords.z)
      if
          Shared.DisconnectInWater ~= true or
          (
            IsEntityInWater(ped) == false or
            (
              (waterRetVal == false or waterRetVal == 0) and
              (
                Shared.MinimumWaterDepth == nil or
                Shared.MinimumWaterDepth == -1 or
                height >= Shared.MinimumWaterDepth
              )
            )
          )
      then
        Functions.LoadSettings()
        TriggerServerEvent("zerio-radio:server:fetchNewestReceivedMessage")

        if IsOpen == false then
          local plrData = Functions.GetPlayerData()

          if
              plrData
              and (
                GetEntityHealth(ped) > 0
                or (Shared.Framework == "qbcore" and plrData.metadata.isdead ~= true)
              )
          then
            if Shared.RemoveWeaponOnOpenRadio ~= false then
              if GetResourceState("ox_inventory") == "started" then
                TriggerEvent("ox_inventory:disarm")
              else
                SetCurrentPedWeapon(ped, GetHashKey("weapon_unarmed"), true)
              end
            end
            LocalPlayer.state:set("radio_open_prop", true, true)
            CreateOpenProp(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)), ped)

            IsOpen = true
            StartDataLoop()
            if Settings.value.useMouse == true then
              SetNuiFocus(true, true)
            end
            SendNUIMessage({
              action = "open",
              data = {
                ShowPlayerList = Shared.ShowPlayerList,
                DisableAnonymous = Shared.DisableAnonymous,
                EnablePanicButton = Shared.EnablePanicButton,
                AllowCallSigns = Shared.AllowCallSigns,
                Debug = Shared.Debug,
                DisplayRadioName = Shared.DisplayRadioName,
                Version = CurrentVersion,
              },
            })
          else
            Functions.Notify(_U("player_dead"))
          end
        end
      else
        Functions.Notify(_U("in_water"))
      end
    end
  end,
}

CreateThread(function()
  while true do
    Wait(3000)
    if (tonumber(CurrentFrequency) or 0) > 0 and not HasRadioItem() then
      ForceRadioOff()
      if Functions and Functions.Notify then
        Functions.Notify("Radio removed — disconnected.", "error")
      end
    end
  end
end)

if Shared.Framework == "standalone" then
  RegisterNetEvent("zerio-radio:client:showNotification", function(msg)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, true)
  end)
end

RegisterNetEvent("zerio-radio:client:open", Functions.Open)
exports("Open", Functions.Open)
RegisterNetEvent("__cfx_export_zerio-radio_Open", Functions.Open)

RegisterNetEvent("zerio-radio:client:openscanner", Functions.OpenScanner)
exports("OpenScanner", Functions.OpenScanner)
RegisterNetEvent("__cfx_export_zerio-radio_OpenScanner", Functions.OpenScanner)

RegisterKeyMapping('zerio_radio_channel_up', 'Zerio Radio - Channel Up', 'keyboard', 'PAGEUP')
RegisterKeyMapping('zerio_radio_channel_down', 'Zerio Radio - Channel Down', 'keyboard', 'PAGEDOWN')

local RANGE_MIN = 1
local RANGE_MAX = 999
local CHANNEL_STEP = 1
local DEBOUNCE_MS = 250

local lastPress = 0
local function canPress()
    local now = GetGameTimer()
    if now - lastPress < DEBOUNCE_MS then return false end
    lastPress = now
    return true
end

local function getJobName()
    local data = Functions.GetPlayerData()
    if not data then return nil end

    if Shared.Framework == "qbcore" then
        return data.job and data.job.name or nil
    elseif Shared.Framework == "esx" then
        if type(data.job) == "table" then
            return data.job.name
        end
        return data.job
    end

    return nil
end

local function isReservedChannel(channel)
    return Shared and Shared.Channels and Shared.Channels[channel] ~= nil
end

local function canUseReservedChannel(channel, jobName)
    local chData = Shared and Shared.Channels and Shared.Channels[channel]
    if not chData then return true end

    if not chData.jobs then return true end

    if not jobName then return false end
    for _, j in ipairs(chData.jobs) do
        if j == jobName then return true end
    end
    return false
end

local function getCurrentChannel()
    Functions.GetRadioChannel()
    return tonumber(CurrentFrequency) or 0
end

local function setChannel(channel)
    Functions.ChangeRadioChannel(channel)
    CurrentFrequency = channel

    LocalPlayer.state:set('radioChannel', channel, true)

    TriggerServerEvent('dispatch:GetRadioChannel', channel)

    local chData = Shared and Shared.Channels and Shared.Channels[channel]
    if chData and chData.label and chData.label ~= "" then
        Functions.Notify(("Radio Channel: %s (%s)"):format(channel, chData.label), "success")
    else
        Functions.Notify(("Radio Channel: %s"):format(channel), "success")
    end
end

local function findNextAllowedChannel(cur, direction)
    local jobName = getJobName()

    if cur < RANGE_MIN or cur > RANGE_MAX then
        if direction > 0 then
            cur = RANGE_MIN - CHANNEL_STEP
        else
            cur = RANGE_MAX + CHANNEL_STEP
        end
    end

    local tries = 0
    local candidate = cur

    while tries < (RANGE_MAX - RANGE_MIN + 2) do
        candidate = candidate + (direction * CHANNEL_STEP)

        if candidate > RANGE_MAX then candidate = RANGE_MIN end
        if candidate < RANGE_MIN then candidate = RANGE_MAX end

        if not isReservedChannel(candidate) or canUseReservedChannel(candidate, jobName) then
            return candidate
        end

        tries = tries + 1
    end

    return nil
end

local function stepChannel(direction)
    if not canPress() then return end

    if not HasRadioItem() then
        ForceRadioOff()
        return Functions.Notify("You need a radio to use radio channels.", "error")
    end

    local cur = getCurrentChannel()

    local nextCh = findNextAllowedChannel(cur, direction)
    if not nextCh then
        return Functions.Notify("No accessible radio channels.", "error")
    end

    setChannel(nextCh)
end

RegisterCommand('zerio_radio_channel_up', function()
    stepChannel(1)
end, false)

RegisterCommand('zerio_radio_channel_down', function()
    stepChannel(-1)
end, false)
