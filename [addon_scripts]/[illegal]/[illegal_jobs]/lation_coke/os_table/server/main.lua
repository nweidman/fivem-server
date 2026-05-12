local ox = exports.ox_inventory

local activeByTable = {}

local function notify(src, msg, t)
  TriggerClientEvent('ox_lib:notify', src, {
    title = locale('os_table.notify.title'),
    description = msg,
    type = t or 'inform'
  })
end

local function getGangName(src)
  if GetResourceState('qbx_core') == 'started' then
    local Player = exports.qbx_core:GetPlayer(src)
    return Player and Player.PlayerData and Player.PlayerData.gang and Player.PlayerData.gang.name or nil
  end

  if GetResourceState('qb-core') == 'started' then
    local QBCore = exports['qb-core']:GetCoreObject()
    local Player = QBCore.Functions.GetPlayer(src)
    return Player and Player.PlayerData and Player.PlayerData.gang and Player.PlayerData.gang.name or nil
  end

  return nil
end

local function allowed(src)
  local gang = getGangName(src)
  return gang and Config.AllowedGangs and Config.AllowedGangs[gang] == true
end

local function clamp(n, a, b)
  n = tonumber(n) or 0
  if n < a then return a end
  if n > b then return b end
  return n
end

local function invCount(src, item)
  return ox:Search(src, 'count', item) or 0
end

local function hasAnyItem(src, items)
  for _, name in ipairs(items or {}) do
    if invCount(src, name) > 0 then return name end
  end
  return nil
end

local function hasItem(src, item, qty)
  return invCount(src, item) >= qty
end

local function findFirstSlotByNames(src, names)
  local items = ox:GetInventoryItems(src)
  if not items then return nil end

  for slot, item in pairs(items) do
    if item and item.name then
      for _, n in ipairs(names or {}) do
        if item.name == n and (item.count or 0) > 0 then
          return slot, item, n
        end
      end
    end
  end

  return nil
end

local function removeFromSlot(src, itemName, qty, slot)
  return ox:RemoveItem(src, itemName, qty, nil, slot)
end

local function addItem(src, itemName, qty, meta)
  return ox:AddItem(src, itemName, qty, meta)
end

local function consumePetrolMeta(src, slot, item, percentUsed)
  percentUsed = clamp(percentUsed, 0, 100)
  if percentUsed <= 0 then return true end

  local md = item and item.metadata
  if type(md) ~= 'table' then
    return true
  end

  if md.fuel ~= nil then
    local fuel = clamp(md.fuel, 0, 100)
    if fuel < percentUsed then return false end
    md.fuel = fuel - percentUsed
    pcall(function() ox:SetMetadata(src, slot, md) end)
    return true
  end

  if md.durability ~= nil then
    local dur = clamp(md.durability, 0, 100)
    if dur < percentUsed then return false end
    md.durability = dur - percentUsed
    pcall(function() ox:SetMetadata(src, slot, md) end)
    return true
  end

  if md.ammo ~= nil then
    local ammo = math.max(0, math.floor(tonumber(md.ammo) or 0))
    local maxAmmo = math.max(1, math.floor(tonumber(md.maxAmmo) or 4500))
    local used = math.max(1, math.floor((percentUsed / 100.0) * maxAmmo))
    if ammo < used then return false end
    md.ammo = ammo - used
    pcall(function() ox:SetMetadata(src, slot, md) end)
    return true
  end

  return true
end

local function findSlot(src, itemName, requirePurity)
  local items = ox:GetInventoryItems(src)
  if not items then return nil end

  for slot, item in pairs(items) do
    if item and item.name == itemName and (item.count or 0) > 0 then
      if requirePurity then
        local p = item.metadata and item.metadata.purity
        if p ~= nil then
          return slot, item
        end
      else
        return slot, item
      end
    end
  end

  return nil
end

local function purityPenalty(amount, idealMin, idealMax, maxPenalty)
  if amount >= idealMin and amount <= idealMax then
    return 0
  end
  local dist = 0
  if amount < idealMin then dist = idealMin - amount end
  if amount > idealMax then dist = amount - idealMax end
  local scaled = (dist / 100.0) * maxPenalty
  return math.floor(scaled + 0.5)
end

local function purityToOutput(purity)
  purity = clamp(purity, 0, 100)
  local minOut, maxOut = Config.Package.min, Config.Package.max
  local out = math.floor(minOut + (purity / 100.0) * (maxOut - minOut) + 0.5)
  return clamp(out, minOut, maxOut)
end

local function tableBusy(tableIndex)
  local a = activeByTable[tableIndex]
  if not a then return false end
  if a.endAt and os.time() >= a.endAt then
    return false
  end
  return true
end

local function broadcastTableState(tableIndex, step, durationSeconds)
  TriggerClientEvent('os-coke:client:craftStarted', -1, tableIndex, step, durationSeconds)
end

local function broadcastTableEnded(tableIndex)
  TriggerClientEvent('os-coke:client:craftEnded', -1, tableIndex)
end

local function refundInputs(data)
  if not data or not data.refund then return end
  local src = data.src
  for _, r in ipairs(data.refund) do
    if r._restoreMeta and r.slot and r.meta then
      pcall(function() ox:SetMetadata(src, r.slot, r.meta) end)
    else
      addItem(src, r.item, r.qty, r.meta)
    end
  end
end

local function clearTable(tableIndex, doRefund)
  local data = activeByTable[tableIndex]
  if data and doRefund then
    refundInputs(data)
  end
  activeByTable[tableIndex] = nil
  broadcastTableEnded(tableIndex)
end

local function finishStep(tableIndex)
  local data = activeByTable[tableIndex]
  if not data then return end
  if os.time() < data.endAt then return end

  local src = data.src
  local step = data.step
  local payload = data.payload or {}
  local I = Config.Items

  local ok = false

  if step == 1 then
    ok = addItem(src, I.ground, 1, nil)
    if ok then notify(src, locale('os_table.notify.created_ground', locale(('os_table.items.%s'):format(I.ground))), 'success') end

  elseif step == 2 then
    ok = addItem(src, I.base_unf, 1, { purity = payload.purity or 0 })
    if ok then notify(src, locale('os_table.notify.created_with_purity', locale(('os_table.items.%s'):format(I.base_unf)), payload.purity or 0), 'success') end

  elseif step == 3 then
    ok = addItem(src, I.base, 1, { purity = payload.purity or 0 })
    if ok then notify(src, locale('os_table.notify.created_with_purity', locale(('os_table.items.%s'):format(I.base)), payload.purity or 0), 'success') end

  elseif step == 4 then
    ok = addItem(src, I.brick, 1, { purity = payload.purity or 0 })
    if ok then notify(src, locale('os_table.notify.created_with_purity', locale(('os_table.items.%s'):format(I.brick)), payload.purity or 0), 'success') end

  elseif step == 5 then
    ok = addItem(src, I.bag, payload.outQty or 0, { purity = payload.purity or 0 })
    if ok then notify(src, locale('os_table.notify.created_pack', payload.outQty or 0, locale(('os_table.items.%s'):format(I.bag)), payload.purity or 0), 'success') end
  end

  if not ok then
    notify(src, locale('os_table.notify.inv_full_refund'), 'error')
    refundInputs(data)
  end

  clearTable(tableIndex, false)
end

CreateThread(function()
  while true do
    Wait(1000)
    for tableIndex, _ in pairs(activeByTable) do
      finishStep(tableIndex)
    end
  end
end)

RegisterNetEvent('os-coke:server:startStep', function(tableIndex, step, amount)
  local src = source
  if not allowed(src) then
    notify(src, locale('os_table.notify.denied_desc'), 'error')
    return
  end

  tableIndex = tonumber(tableIndex)
  step = tonumber(step)

  if not tableIndex or not Config.Tables or not Config.Tables[tableIndex] then
    notify(src, locale('os_table.notify.invalid_table'), 'error')
    return
  end

  if not step or step < 1 or step > 5 then
    notify(src, locale('os_table.notify.invalid_step'), 'error')
    return
  end

  if tableBusy(tableIndex) then
    notify(src, locale('os_table.notify.busy_desc'), 'error')
    return
  end

  local I = Config.Items
  local payload, refund = {}, {}

  if step == 1 then
    local need = Config.Quantities.leavesToGround
    if not hasItem(src, I.leaf, need) then
      notify(src, locale('os_table.notify.need_item_qty', need, locale(('os_table.items.%s'):format(I.leaf))), 'error')
      return
    end
    if not ox:RemoveItem(src, I.leaf, need) then
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end
    table.insert(refund, { item = I.leaf, qty = need, meta = nil })

elseif step == 2 then
    local petrolSlot, petrolItem, petrolName = findFirstSlotByNames(src, I.gasoline)
    if not petrolSlot or not petrolItem then
      notify(src, locale('os_table.notify.need_petrolcan'), 'error')
      return
    end

    local needGround = Config.Quantities.groundToUnf
    if not hasItem(src, I.ground, needGround) then
      notify(src, locale('os_table.notify.need_item_qty', needGround, locale(('os_table.items.%s'):format(I.ground))), 'error')
      return
    end

    -- UNIQUE RATIO LOGIC (Base 10 - Sum of 100)
    local playerIdent = GetPlayerIdentifier(src, 0) or "1"
    local seed = 0
    for i = 1, #playerIdent do seed = seed + string.byte(playerIdent, i) end

    -- Gasoline target: {10, 20, 30, 40, 50, 60, 70, 80, 90}
    local secretGasTarget = ((seed % 9) * 10) + 10
    local targetMin = secretGasTarget - 5
    local targetMax = secretGasTarget + 5

    local gasAmt = clamp(amount, 0, 100)
    local purity = 100 
    local pen = purityPenalty(gasAmt, targetMin, targetMax, Config.Purity.gasolinePenaltyMax)
    purity = clamp(purity - pen, 0, 100)

    -- Item handling
    local petrolMetaSnapshot = petrolItem.metadata and table.clone(petrolItem.metadata) or nil
    if not consumePetrolMeta(src, petrolSlot, petrolItem, gasAmt) then
      notify(src, locale('os_table.notify.need_petrolcan'), 'error')
      return
    end

    if not ox:RemoveItem(src, I.ground, needGround) then
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end

    table.insert(refund, { item = petrolName, qty = 1, meta = petrolMetaSnapshot, slot = petrolSlot, _restoreMeta = true })
    table.insert(refund, { item = I.ground, qty = needGround, meta = nil })
    payload.purity = purity

  elseif step == 3 then
    if not hasItem(src, I.cement, 1) then
      notify(src, locale('os_table.notify.need_item', locale(('os_table.items.%s'):format(I.cement))), 'error')
      return
    end

    local slot, item = findSlot(src, I.base_unf, true)
    if not slot or not item then
      notify(src, locale('os_table.notify.need_item_purity', locale(('os_table.items.%s'):format(I.base_unf))), 'error')
      return
    end

    -- UNIQUE RATIO LOGIC (The balance to 100)
    local playerIdent = GetPlayerIdentifier(src, 0) or "1"
    local seed = 0
    for i = 1, #playerIdent do seed = seed + string.byte(playerIdent, i) end

    -- If Gas was 30, Cement is 70
    local secretGasTarget = ((seed % 9) * 10) + 10
    local secretCemTarget = 100 - secretGasTarget
    
    local targetMin = secretCemTarget - 6
    local targetMax = secretCemTarget + 6

    local cementAmt = clamp(amount, 0, 100)
    local originalPurity = clamp(item.metadata and item.metadata.purity or 0, 0, 100)
    
    local pen = purityPenalty(cementAmt, targetMin, targetMax, Config.Purity.cementPenaltyMax)
    local purity = clamp(originalPurity - pen, 0, 100)

    if not ox:RemoveItem(src, I.cement, 1) then
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end

    if not removeFromSlot(src, I.base_unf, 1, slot) then
      ox:AddItem(src, I.cement, 1)
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end

    table.insert(refund, { item = I.cement, qty = 1, meta = nil })
    table.insert(refund, { item = I.base_unf, qty = 1, meta = { purity = originalPurity } })
    payload.purity = purity

  elseif step == 4 then
    local slot, item = findSlot(src, I.base, true)
    if not slot or not item then
      notify(src, locale('os_table.notify.need_item_purity', locale(('os_table.items.%s'):format(I.base))), 'error')
      return
    end

    local purity = clamp(item.metadata and item.metadata.purity or 0, 0, 100)
    if not removeFromSlot(src, I.base, 1, slot) then
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end

    table.insert(refund, { item = I.base, qty = 1, meta = { purity = purity } })
    payload.purity = purity

  elseif step == 5 then

    local slot, item = findSlot(src, I.brick, true)
    if not slot or not item then
      notify(src, locale('os_table.notify.need_item_purity', locale(('os_table.items.%s'):format(I.brick))), 'error')
      return
    end

    local purity = clamp(item.metadata and item.metadata.purity or 0, 0, 100)
    local outQty = purityToOutput(purity)

    if not hasItem(src, I.empty_baggy, outQty) then
      notify(src, locale('os_table.notify.need_item_qty', outQty, locale(('os_table.items.%s'):format(I.empty_baggy))), 'error')
      return
    end

    if not ox:RemoveItem(src, I.empty_baggy, outQty) then
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end

    if not removeFromSlot(src, I.brick, 1, slot) then
      ox:AddItem(src, I.empty_baggy, outQty)
      notify(src, locale('os_table.notify.remove_failed'), 'error')
      return
    end

    table.insert(refund, { item = I.empty_baggy, qty = outQty, meta = nil })
    table.insert(refund, { item = I.brick, qty = 1, meta = { purity = purity } })
    payload.purity = purity
    payload.outQty = outQty
  end

  local keyMap = { [1] = 'processLeaves', [2] = 'addGasoline', [3] = 'addCement', [4] = 'heatAndDry', [5] = 'packageBrick' }
  local k = keyMap[step]
  local duration = tonumber(Config.StepTime[k]) or 5

  activeByTable[tableIndex] = {
    src = src,
    step = step,
    endAt = os.time() + duration,
    duration = duration,
    payload = payload,
    refund = refund
  }

  broadcastTableState(tableIndex, step, duration)
  notify(src, locale('os_table.notify.started', step, duration), 'success')
end)

AddEventHandler('playerDropped', function()
  local src = source
  for tableIndex, data in pairs(activeByTable) do
    if data.src == src then
      clearTable(tableIndex, true)
    end
  end
end)
