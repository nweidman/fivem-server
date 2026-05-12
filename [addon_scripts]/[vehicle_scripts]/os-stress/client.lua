local Config = lib.load('config')

local PlayerData = nil
local StressLevel = 0

RegisterNetEvent('os-stress:client:UpdateStressLevel', function()
  PlayerData = exports.qbx_core:GetPlayerData()
  local tier = 0

  if PlayerData
    and PlayerData.metadata
    and PlayerData.metadata.skills
    and PlayerData.metadata.skills.levels
    and PlayerData.metadata.skills.levels.stress
    and PlayerData.metadata.skills.levels.stress.tier
  then
    tier = PlayerData.metadata.skills.levels.stress.tier
  end

  StressLevel = tier or 0
end)

local function DebugPrint(fmt, ...)
  if Config.Debug then
    print(('[DEBUG] ' .. fmt):format(...))
  end
end

local function loadframework()
  local frameworks = {
    { name = 'esx', resource = 'es_extended' },
    { name = 'qbx', resource = 'qbx_core' },
    { name = 'qb',  resource = 'qb-core' }
  }

  for _, fw in ipairs(frameworks) do
    if GetResourceState(fw.resource) == 'started' then
      DebugPrint('Framework found: %s', fw.name)
      return fw.name
    end
  end

  DebugPrint('No framework detected')
  return nil
end

local framework = loadframework()
local FrameworkObject = nil

if framework == 'esx' then
  DebugPrint('Loading ESX object')
  FrameworkObject = exports['es_extended']:getSharedObject()
elseif framework == 'qb' then
  DebugPrint('Loading QB-Core object')
  FrameworkObject = exports['qb-core']:GetCoreObject()
end

-- Speed units & ranges

local speedMultiplier = Config.UseMPH and 2.23694 or 3.6
DebugPrint('Speed multiplier set to %.2f', speedMultiplier)

local SPEED_RANGES = Config.Stress and Config.Stress.speedRanges or {}

-- If UseMPH = false, convert the mph-configured ranges to km/h
if not Config.UseMPH and SPEED_RANGES and #SPEED_RANGES > 0 then
  local scaled = {}
  for i, r in ipairs(SPEED_RANGES) do
    scaled[i] = {
      min = (r.min and (r.min * 1.60934)) or nil,
      max = (r.max and (r.max * 1.60934)) or nil,
      multiplier = r.multiplier or 1.0
    }
  end
  SPEED_RANGES = scaled
end

local function getRangeMultiplier(speed)
  if not SPEED_RANGES or #SPEED_RANGES == 0 then return 1.0 end

  for _, r in ipairs(SPEED_RANGES) do
    local rmin = r.min or -math.huge
    local rmax = r.max

    if rmax then
      if speed >= rmin and speed <= rmax then
        return r.multiplier or 1.0
      end
    else
      if speed >= rmin then
        return r.multiplier or 1.0
      end
    end
  end

  return 1.0
end

-- Stress helpers

local function getStress()
  local state = LocalPlayer and LocalPlayer.state
  local val = (state and state.stress) or 0
  DebugPrint('Current stress: %s', tostring(val))
  return val
end

local function isJobWhitelisted()
  if not Config.WhitelistedJobs then return false end

  local currentJob = nil

  if framework == 'esx' and FrameworkObject and FrameworkObject.GetPlayerData then
    local pd = FrameworkObject.GetPlayerData()
    if pd and pd.job and pd.job.name then
      currentJob = pd.job.name
    end
    DebugPrint('Job (esx): %s', tostring(currentJob))

  elseif framework == 'qbx' then
    local pd = exports.qbx_core:GetPlayerData()
    if pd and pd.job and pd.job.name then
      currentJob = pd.job.name
    end
    DebugPrint('Job (qbx): %s', tostring(currentJob))

  elseif framework == 'qb' and FrameworkObject and FrameworkObject.Functions and FrameworkObject.Functions.GetPlayerData then
    local pd = FrameworkObject.Functions.GetPlayerData()
    if pd and pd.job and pd.job.name then
      currentJob = pd.job.name
    end
    DebugPrint('Job (qb): %s', tostring(currentJob))
  end

  if not currentJob then return false end
  return lib.table.contains(Config.WhitelistedJobs, currentJob) == true
end

local function gainStress(amount)
  if isJobWhitelisted() then
    DebugPrint('Skipped stress gain due to whitelist')
    return
  end

  local amt = tonumber(amount) or 0
  if amt <= 0 then return end

  -- If your server is QB-HUD style, keep this:
  TriggerServerEvent('hud:server:GainStress', amt)

  -- Keep client state accurate immediately (prevents "nil/newStress" issues)
  local current = getStress()
  local newStress = math.max(0, math.min(100, current + amt))

  if LocalPlayer and LocalPlayer.state then
    LocalPlayer.state:set('stress', newStress, true)
  end

  DebugPrint('Stress increased by %s, new value: %s', amt, newStress)

  -- Only enable these if you *actually* have handlers for them:
  -- TriggerServerEvent('updateStress', newStress)
end

local function resetStress()
  DebugPrint('Resetting stress to 0')
  if LocalPlayer and LocalPlayer.state then
    LocalPlayer.state:set('stress', 0, true)
  end
  TriggerServerEvent('updateStress', 0)
end

local function SetStressLevel(amount)
  amount = math.max(0, math.min(100, tonumber(amount) or 0))
  DebugPrint('Setting stress level to: %s', amount)
  if LocalPlayer and LocalPlayer.state then
    LocalPlayer.state:set('stress', amount, true)
  end
end

-- Seatbelt / Harness

local function getBeltState(veh)
  if not veh or veh == 0 then return false, 0 end

  local harnessInstalled = false
  local ent = Entity(veh)
  if ent and ent.state and ent.state.harnessInstalled == true then
    harnessInstalled = true
  end

  local harnessBuckled = false
  if exports['qbx_harness'] and exports['qbx_harness'].seatBeltOn then
    harnessBuckled = exports['qbx_harness']:seatBeltOn() == true
  end

  local regularBelt = (LocalPlayer and LocalPlayer.state and LocalPlayer.state.seatbelt == true) or false

  local buckled = regularBelt or harnessBuckled

  local harnessLevel = harnessInstalled and 1 or 0

  DebugPrint('Belt state -> buckled:%s harnessInstalled:%s harnessBuckled:%s harnessLevel:%s',
    tostring(buckled), tostring(harnessInstalled), tostring(harnessBuckled), tostring(harnessLevel))

  return buckled, harnessLevel
end

-- Keep this event so other scripts can still toggle seatbelt state
RegisterNetEvent('os-stress:seatbelt', function(state)
  if LocalPlayer and LocalPlayer.state then
    local enabled = state and true or false
    LocalPlayer.state:set('seatbelt', enabled, true)
    DebugPrint('Seatbelt state set to %s via event', enabled and 'ON' or 'OFF')
  end
end)

-- Vehicle speeding → Stress

local function startVehicleStressThread()
  DebugPrint('Starting vehicle stress thread')

  CreateThread(function()
    Wait(1)

    while cache.vehicle do
      if not isJobWhitelisted() then
        local vehClass = GetVehicleClass(cache.vehicle)
        local speed = GetEntitySpeed(cache.vehicle) * speedMultiplier
        DebugPrint('Vehicle class: %s | Speed: %.2f', tostring(vehClass), speed)

        if vehClass ~= 13 and vehClass ~= 14 and vehClass ~= 15 and vehClass ~= 16 and vehClass ~= 21 then
          local buckled, harnessLevel = getBeltState(cache.vehicle)

          local threshold = buckled and Config.Stress.minForSpeeding or Config.Stress.minForSpeedingUnbuckled
          if not Config.UseMPH then
            threshold = threshold * 1.60934
          end

          DebugPrint('[STRESS] jobWhitelisted=%s vehClass=%s speed=%.1f threshold=%.1f useMPH=%s',
            tostring(isJobWhitelisted()), tostring(vehClass), speed, threshold, tostring(Config.UseMPH))

          if speed >= threshold then
            local base = math.random(1, 2)

            local bm = Config.Stress.beltMultipliers or {}
            local beltMult
            if not buckled then
              beltMult = bm.unbuckled or 1.0
            elseif harnessLevel > 0 then
              beltMult = bm.harness or 1.0
            else
              beltMult = bm.buckled or 1.0
            end

            local speedMult = getRangeMultiplier(speed)
            local amount = math.max(1, math.floor(base * speedMult * beltMult))

            DebugPrint('[STRESS] APPLY speed=%.1f thr=%.1f | base=%s x speedMult=%.2f x beltMult=%.2f -> +%s',
              speed, threshold, base, speedMult, beltMult, amount)

            gainStress(amount)
          else
            DebugPrint('[STRESS] Skipped: speed below threshold (%.1f < %.1f)', speed, threshold)
          end
        end
      end

      -- Your tier-based pacing
      if not StressLevel or StressLevel == 0 then
        Wait(2000)
      elseif StressLevel == 1 then
        Wait(3500)
      elseif StressLevel == 2 then
        Wait(5000)
      elseif StressLevel == 3 then
        Wait(6000)
      elseif StressLevel == 4 then
        Wait(7000)
      elseif StressLevel == 5 then
        Wait(8000)
      else
        Wait(3500)
      end
    end

    DebugPrint('Exited vehicle stress loop')
  end)
end

lib.onCache('vehicle', function(vehicle)
  DebugPrint('Vehicle cache updated: %s', vehicle and tostring(vehicle) or 'nil')
  if not vehicle then return end
  startVehicleStressThread()
end)

CreateThread(function()
  if cache.vehicle then
    DebugPrint('Vehicle cache present at start, starting stress thread')
    startVehicleStressThread()
  end
end)

-- Weapon shooting → Stress

local function isWhitelistedWeaponStress(weapon)
  local list = Config.Stress and Config.Stress.whitelistedWeapons or {}
  local result = lib.table.contains(list, weapon) == true
  DebugPrint('Weapon whitelist check: %s -> %s', tostring(weapon), tostring(result))
  return result
end

local currentWeaponThread = nil

local function startWeaponStressThread(weapon)
  currentWeaponThread = weapon -- token id

  if isWhitelistedWeaponStress(weapon) then
    DebugPrint('Weapon %s is whitelisted, skipping thread', tostring(weapon))
    return
  end

  DebugPrint('Starting weapon stress thread for: %s', tostring(weapon))

  CreateThread(function()
    local token = weapon
    Wait(1)

    while cache.weapon and currentWeaponThread == token do
      if not isWhitelistedWeaponStress(cache.weapon)
        and IsPedShooting(cache.ped)
        and math.random() <= (Config.Stress.chance or 0.0)
      then
        DebugPrint('Player shooting with non-whitelisted weapon: %s', tostring(cache.weapon))
        gainStress(math.random(1, 5))
      end

      Wait(0)
    end

    DebugPrint('Weapon stress thread exited')
  end)
end

lib.onCache('weapon', function(weapon)
  DebugPrint('Weapon cache updated: %s', weapon or 'nil')

  if not weapon then
    currentWeaponThread = nil
    DebugPrint('Weapon cleared, killed weapon thread')
    return
  end

  startWeaponStressThread(weapon)
end)

CreateThread(function()
  if cache.weapon then
    DebugPrint('Weapon cache present at start, starting weapon stress thread')
    startWeaponStressThread(cache.weapon)
  end
end)

-- Visual effects from Stress

local function getBlurIntensity(stresslevel)
  local blur = Config.Stress and Config.Stress.blurIntensity or {}
  for _, v in pairs(blur) do
    if lib.math.clamp(stresslevel, v.min, v.max) == stresslevel then
      DebugPrint('Blur intensity matched for stress %s: %s', stresslevel, v.intensity)
      return v.intensity
    end
  end
  DebugPrint('No blur match found for stress %s, defaulting', stresslevel)
  return 1500
end

local function getEffectInterval(stresslevel)
  local ints = Config.Stress and Config.Stress.effectInterval or {}
  for _, v in pairs(ints) do
    if lib.math.clamp(stresslevel, v.min, v.max) == stresslevel then
      DebugPrint('Effect interval matched for stress %s: %s', stresslevel, v.timeout)
      return v.timeout
    end
  end
  DebugPrint('No interval match found for stress %s, defaulting', stresslevel)
  return 60000
end

CreateThread(function()
  DebugPrint('Starting stress effects loop')

  while true do
    local stress = getStress()
    local effectInterval = getEffectInterval(stress)

    if not isJobWhitelisted() then
      if IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_YOGA") then
        if exports.qbx_core and exports.qbx_core.Notify then
          exports.qbx_core:Notify("You are slowly feeling less stressed.")
        end
        TriggerServerEvent('hud:server:RelieveStress', 5)
      end

      if stress >= 100 then
        DebugPrint('Stress >= 100, triggering full effect')
        local blurIntensity = getBlurIntensity(stress)
        local fallRepeat = math.random(2, 4)
        local ragdollTimeout = fallRepeat * 1750

        TriggerScreenblurFadeIn(1000.0)
        Wait(blurIntensity)
        TriggerScreenblurFadeOut(1000.0)

        if not IsPedRagdoll(cache.ped)
          and IsPedOnFoot(cache.ped)
          and not IsPedSwimming(cache.ped)
        then
          local forwardVector = GetEntityForwardVector(cache.ped)
          DebugPrint('Applying ragdoll fall effect')
          SetPedToRagdollWithFall(
            cache.ped,
            ragdollTimeout, ragdollTimeout,
            1,
            forwardVector.x, forwardVector.y, forwardVector.z,
            1.0,
            0.0, 0.0, 0.0, 0.0, 0.0, 0.0
          )
        end

        Wait(1000)

        for _ = 1, fallRepeat do
          Wait(750)
          DoScreenFadeOut(200); Wait(1000); DoScreenFadeIn(200)
          TriggerScreenblurFadeIn(1000.0); Wait(blurIntensity); TriggerScreenblurFadeOut(1000.0)
        end

      elseif stress >= (Config.Stress.minForShaking or 0) then
        DebugPrint('Stress >= %s, applying screen blur only', tostring(Config.Stress.minForShaking))
        local blurIntensity = getBlurIntensity(stress)
        TriggerScreenblurFadeIn(1000.0)
        Wait(blurIntensity)
        TriggerScreenblurFadeOut(1000.0)
      end
    else
      DebugPrint('Player is whitelisted, skipping visual effects')
    end

    Wait(effectInterval)
  end
end)

-- Exports

exports('getStress', getStress)                         -- exports['os-stress-addon']:getStress()
exports('gainStress', gainStress)                       -- exports['os-stress-addon']:gainStress(amount)
exports('isPlayerJobWhitelisted', isJobWhitelisted)     -- exports['os-stress-addon']:isPlayerJobWhitelisted()
exports('resetStress', resetStress)                     -- exports['os-stress-addon']:resetStress()
exports('setStressLevel', SetStressLevel)               -- exports['os-stress-addon']:setStressLevel(amount)
