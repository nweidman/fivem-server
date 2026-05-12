IsSeatbeltOn = true
local seatbeltThreadCreated = false

---@param vehicle integer
---@return boolean
local function canVehicleClassHaveSeatbelt(vehicle)
  if not Config.EnableSeatbelt then return false end
  if not vehicle or not DoesEntityExist(vehicle) then return false end

  local vehicleClass = GetVehicleClass(vehicle)

  local seatbeltCompatibleClasses = {
    [0] = true,  -- Compacts
    [1] = true,  -- Sedans
    [2] = true,  -- SUVs
    [3] = true,  -- Coupes
    [4] = true,  -- Muscle
    [5] = true,  -- Sports Classics
    [6] = true,  -- Sports
    [7] = true,  -- Super
    [9] = true,  -- Off-road
    [10] = true, -- Industrial
    [11] = true, -- Utility
    [12] = true, -- Vans
    [17] = true, -- Service
    [18] = true, -- Emergency
    [19] = true, -- Military
    [20] = true, -- Commercial
  }

  return seatbeltCompatibleClasses[vehicleClass] or false
end

---@param vehicle integer
---@return boolean
local function isSeatbeltAllowed(vehicle)
  if not Config.EnableSeatbelt then return false end
  if not vehicle then return false end
  if not canVehicleClassHaveSeatbelt(vehicle) then return false end

  if Config.DisablePassengerSeatbelts and cache.seat ~= -1 then
    return false
  end

  if Config.DisableSeatbeltInEmergencyVehicles then
    local vehicleClass = GetVehicleClass(vehicle)
    if vehicleClass == 18 then return false end
  end

  return true
end

---Built-in ejection logic
---@param willBeYeeted boolean
local function setWhetherPedWillFlyThroughWindscreen(willBeYeeted)
  local min = willBeYeeted and Config.MinSpeedMphEjectionSeatbeltOff or Config.MinSpeedMphEjectionSeatbeltOn
  local minConverted = min / 2.237

  SetFlyThroughWindscreenParams(minConverted, 0.0, 0.0, 10.0)
  SetPedConfigFlag(cache.ped, 32, willBeYeeted)
end

---Is harness installed on this vehicle?
---@param vehicle integer
---@return boolean
local function isHarnessInstalled(vehicle)
  if not vehicle or not DoesEntityExist(vehicle) then return false end
  local st = Entity(vehicle).state
  return st and st.harnessInstalled == true or false
end

---Toggle seatbelt
---@param vehicle integer
---@param toggle boolean
function ToggleSeatbelt(vehicle, toggle)
  if not vehicle or not isSeatbeltAllowed(vehicle) then return end

  local hasHarness = (GetResourceState("qbx_harness") == "started")
    and Entity(vehicle).state
    and Entity(vehicle).state.harnessInstalled == true

  if Config.UseCustomSeatbeltIntegration and hasHarness then
    local ok
    if toggle then
      ok = exports["qbx_harness"]:enableSeatbelt() == true
    else
      ok = exports["qbx_harness"]:disableSeatbelt() == true
    end
    if not ok then return end
  end

  -- Ejection rule:
  -- No harness => always ejectable
  -- Harness => buckled controls ejection
  local willBeYeeted = true
  if hasHarness then
    willBeYeeted = (not toggle)
  end

  setWhetherPedWillFlyThroughWindscreen(willBeYeeted)

  IsSeatbeltOn = toggle
  LocalPlayer.state:set("seatbelt", toggle)
end

---Prevent exiting while buckled
local function startSeatbeltExitPreventionThread()
  if not Config.PreventExitWhileBuckled then return end
  if seatbeltThreadCreated then return end
  seatbeltThreadCreated = true

  CreateThread(function()
    while cache.vehicle do
      if IsSeatbeltOn then
        DisableControlAction(0, 75, true)
        DisableControlAction(27, 75, true)
      end
      Wait(1)
    end
    seatbeltThreadCreated = false
  end)
end

---On vehicle entry
---@param vehicle integer
local function onEnterVehicle(vehicle)
  if not isSeatbeltAllowed(vehicle) then
    setWhetherPedWillFlyThroughWindscreen(false)
    IsSeatbeltOn = true
    return
  end

  IsSeatbeltOn = false
  LocalPlayer.state:set("seatbelt", false)

  setWhetherPedWillFlyThroughWindscreen(true)
  startSeatbeltExitPreventionThread()
end

if Config.EnableSeatbelt then
  lib.onCache("vehicle", onEnterVehicle)

  CreateThread(function()
    if cache.vehicle then
      onEnterVehicle(cache.vehicle)
    end
  end)
end

-- Keybind
if Config.EnableSeatbelt and Config.SeatbeltKeybind then
  RegisterCommand("toggle_seatbelt", function()
    ToggleSeatbelt(cache.vehicle, not IsSeatbeltOn)
  end, false)

  RegisterKeyMapping("toggle_seatbelt", "Toggle vehicle seatbelt", "keyboard", Config.SeatbeltKeybind or "B")
end
