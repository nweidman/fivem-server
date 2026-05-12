local buckled = false
local buckleBusy = false
local lastVeh = 0

local function notify(msg, ntype)
  lib.notify({
    title = 'Harness',
    description = msg,
    type = ntype or 'inform',
    duration = 4500
  })
end

local function normPlate(p)
  if not p then return nil end
  return p:gsub("^%s+", ""):gsub("%s+$", ""):upper()
end

local function getDriverVehicle()
  local ped = PlayerPedId()

  if not IsPedInAnyVehicle(ped, false) then
    return nil
  end

  local veh = GetVehiclePedIsIn(ped, false)
  if veh == 0 or GetPedInVehicleSeat(veh, -1) ~= ped then
    return nil
  end

  if not NetworkGetEntityIsNetworked(veh) then
    return nil
  end

  local plate = normPlate(GetVehicleNumberPlateText(veh))
  if not plate then
    return nil
  end

  return veh, plate
end

local function doBar(label, duration)
  return lib.progressBar({
    duration = duration,
    label = label,
    useWhileDead = false,
    canCancel = true,
    disable = {
      move = false,
      car = false,
      combat = true,
      mouse = false,
    }
  })
end

local function refreshInstalled(veh, plate)
  if not veh or veh == 0 then return false end

  local st = Entity(veh).state
  if st and st.harnessInstalled ~= nil then
    return st.harnessInstalled == true
  end

  local ok = lib.callback.await('qbx_harness:server:isInstalled', false, plate)
  return ok == true
end

CreateThread(function()
  while true do
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
      local veh = GetVehiclePedIsIn(ped, false)
      if veh ~= lastVeh then
        lastVeh = veh
        buckled = false
      end
      Wait(250)
    else
      lastVeh = 0
      buckled = false
      Wait(500)
    end
  end
end)

CreateThread(function()
  while true do
    if Config.DisableExitWhileBuckled and buckled then
      local ped = PlayerPedId()
      if IsPedInAnyVehicle(ped, false) then
        DisableControlAction(0, 75, true)
        DisableControlAction(27, 75, true)
        Wait(0)
      else
        Wait(200)
      end
    else
      Wait(200)
    end
  end
end)

CreateThread(function()
  while true do
    local veh, plate = getDriverVehicle()
    if veh and veh ~= 0 then
      TriggerServerEvent('qbx_harness:server:syncStatebag', VehToNet(veh), plate)
      Wait(2500)
    else
      Wait(1200)
    end
  end
end)

local function buckleFromExternal()
  if buckleBusy then return false end
  buckleBusy = true

  local veh, plate = getDriverVehicle()
  if not veh then
    buckleBusy = false
    return false
  end

  if not refreshInstalled(veh, plate) then
    buckleBusy = false
    return false
  end

  if buckled then
    buckleBusy = false
    return true
  end

  local ok = doBar('Buckling harness...', Config.Times.Buckle or 1200)
  if ok then
    buckled = true
    -- notify('Harness buckled.', 'success')
  end

  Wait(150)
  buckleBusy = false
  return ok == true
end

local function unbuckleFromExternal()
  if buckleBusy then return false end
  buckleBusy = true

  local veh, plate = getDriverVehicle()
  if not veh then
    buckleBusy = false
    return false
  end

  if not refreshInstalled(veh, plate) then
    buckled = false
    buckleBusy = false
    return true
  end

  if not buckled then
    buckleBusy = false
    return true
  end

  local ok = doBar('Unbuckling harness...', Config.Times.Unbuckle or 800)
  if ok then
    buckled = false
    -- notify('Harness unbuckled.', 'inform')
  end

  Wait(150)
  buckleBusy = false
  return ok == true
end

exports('enableSeatbelt', buckleFromExternal)
exports('disableSeatbelt', unbuckleFromExternal)
exports('seatBeltOn', function() return buckled end)

RegisterNetEvent('qbx_harness:client:useHarness', function()
  local veh, plate = getDriverVehicle()
  if not veh then
    notify('Must be in the driver seat to install.', 'error')
    return
  end

  local ok = doBar('Installing harness...', Config.Times.Install or 4500)
  if not ok then
    notify('Cancelled.', 'error')
    return
  end

  TriggerServerEvent('qbx_harness:server:install', VehToNet(veh), plate)
end)

RegisterNetEvent('qbx_harness:client:removeHarness', function()
  local veh, plate = getDriverVehicle()
  if not veh then
    notify('Must be in the driver seat to remove.', 'error')
    return
  end

  local ok = doBar('Removing harness...', Config.Times.Remove or 3500)
  if not ok then
    notify('Cancelled.', 'error')
    return
  end

  buckled = false
  TriggerServerEvent('qbx_harness:server:remove', VehToNet(veh), plate)
end)

RegisterCommand('removeharness', function()
  TriggerEvent('qbx_harness:client:removeHarness')
end, false)
