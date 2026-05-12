local function normPlate(plate)
  if not plate then return nil end
  plate = tostring(plate):gsub("^%s+", ""):gsub("%s+$", "")
  return plate:upper()
end

local function notify(src, msg, ntype)
  TriggerClientEvent('ox_lib:notify', src, {
    title = 'Harness',
    description = msg,
    type = ntype or 'inform',
    duration = 4500
  })
end

local function setHarnessValue(plate, value)
  local q = ('UPDATE `%s` SET `%s` = ? WHERE `%s` = ?'):format(
    Config.Table, Config.Column, Config.PlateColumn
  )
  return MySQL.update.await(q, { value, plate })
end

local function getHarnessValue(plate)
  local q = ('SELECT `%s` as installed FROM `%s` WHERE `%s` = ? LIMIT 1'):format(
    Config.Column, Config.Table, Config.PlateColumn
  )
  local row = MySQL.single.await(q, { plate })
  return row and tonumber(row.installed) == 1 or false
end

lib.callback.register('qbx_harness:server:isInstalled', function(_src, plate)
  plate = normPlate(plate)
  if not plate then return false end
  return getHarnessValue(plate)
end)

RegisterNetEvent('qbx_harness:server:syncStatebag', function(netId, plate)
  plate = normPlate(plate)
  if not plate or not netId or netId == 0 then return end

  local veh = NetworkGetEntityFromNetworkId(netId)
  if not veh or veh == 0 or not DoesEntityExist(veh) then return end

  local installed = getHarnessValue(plate)
  Entity(veh).state:set('harnessInstalled', installed, true)
end)

RegisterNetEvent('qbx_harness:server:install', function(netId, plate)
  local src = source
  plate = normPlate(plate)

  if not plate or not netId or netId == 0 then
    notify(src, 'Install failed (bad vehicle).', 'error')
    return
  end

  if getHarnessValue(plate) then
    notify(src, 'Harness already installed on this vehicle.', 'inform')
    return
  end

  local count = exports.ox_inventory:Search(src, 'count', Config.HarnessItem)
  if (count or 0) < 1 then
    notify(src, 'You do not have a harness item.', 'error')
    return
  end

  local updated = setHarnessValue(plate, 1)
  if not updated or updated < 1 then
    notify(src, 'Plate not found in DB.', 'error')
    return
  end

  local removed = exports.ox_inventory:RemoveItem(src, Config.HarnessItem, 1)
  if not removed then
    setHarnessValue(plate, 0) -- rollback
    notify(src, 'Inventory error removing item.', 'error')
    return
  end

  local veh = NetworkGetEntityFromNetworkId(netId)
  if veh and DoesEntityExist(veh) then
    Entity(veh).state:set('harnessInstalled', true, true)
  end

  notify(src, 'Harness installed.', 'success')
end)

RegisterNetEvent('qbx_harness:server:remove', function(netId, plate)
  local src = source
  plate = normPlate(plate)

  if not plate or not netId or netId == 0 then
    notify(src, 'Remove failed (bad vehicle).', 'error')
    return
  end

  if not getHarnessValue(plate) then
    notify(src, 'No harness installed on this vehicle.', 'inform')
    return
  end

  local updated = setHarnessValue(plate, 0)
  if not updated or updated < 1 then
    notify(src, 'Plate not found in DB.', 'error')
    return
  end

  if Config.ReturnItemOnRemove then
    exports.ox_inventory:AddItem(src, Config.HarnessItem, 1)
  end

  local veh = NetworkGetEntityFromNetworkId(netId)
  if veh and DoesEntityExist(veh) then
    Entity(veh).state:set('harnessInstalled', false, true)
  end

  notify(src, 'Harness removed.', 'success')
end)
