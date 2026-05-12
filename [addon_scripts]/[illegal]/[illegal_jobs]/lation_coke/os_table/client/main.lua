local activeCraftsByTable = {} -- [tableIndex] = { stepKey=string, stepLabel=string, endTimeMs=number }

local StepMeta = {
  [1] = { key = 'processLeaves', label = locale('os_table.steps.processLeaves') },
  [2] = { key = 'addGasoline',  label = locale('os_table.steps.addGasoline') },
  [3] = { key = 'addCement',    label = locale('os_table.steps.addCement') },
  [4] = { key = 'heatAndDry',   label = locale('os_table.steps.heatAndDry') },
  [5] = { key = 'packageBrick', label = locale('os_table.steps.packageBrick') }
}

local function ItemLabel(itemName)
  if not itemName or itemName == '' then return '' end

  if GetResourceState('ox_inventory') == 'started' then
    local ok, item = pcall(function()
      return exports.ox_inventory:Items(itemName)
    end)
    if ok and item and item.label and item.label ~= '' then
      return item.label
    end
  end

  local key = ('items.%s'):format(itemName)
  local loc = locale(key)
  if loc and loc ~= key then
    return loc
  end

  return itemName
end


local function InvCount(itemName)
  if not itemName or itemName == '' then return 0 end
  if GetResourceState('ox_inventory') ~= 'started' then return 0 end
  local ok, count = pcall(function()
    return exports.ox_inventory:Search('count', itemName)
  end)
  if not ok then return 0 end
  return tonumber(count) or 0
end

local function CanStartStep(step)
  local I = Config.Items
  if step == 1 then
    return InvCount(I.leaf) >= (Config.Quantities.leavesToGround or 0)
  elseif step == 2 then
    local hasGas = false
    for _, g in ipairs(I.gasoline or {}) do
      if InvCount(g) > 0 then hasGas = true break end
    end
    return hasGas and InvCount(I.ground) >= (Config.Quantities.groundToUnf or 0)
  elseif step == 3 then
    return InvCount(I.cement) >= 1 and InvCount(I.base_unf) >= 1
  elseif step == 4 then
    return InvCount(I.base) >= 1
  elseif step == 5 then
    return InvCount(I.empty_baggy) >= 1 and InvCount(I.brick) >= 1
  end
  return false
end

local function MissingItemsNotify(step)
  local I = Config.Items
  if step == 1 then
    return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item_qty', Config.Quantities.leavesToGround, ItemLabel(I.leaf)), type = 'error' })
  elseif step == 2 then
    return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item_qty', Config.Quantities.groundToUnf, ItemLabel(I.ground)), type = 'error' })
  elseif step == 3 then
    if InvCount(I.cement) < 1 then
      return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item', ItemLabel(I.cement)), type = 'error' })
    end
    return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item', ItemLabel(I.base_unf)), type = 'error' })
  elseif step == 4 then
    return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item', ItemLabel(I.base)), type = 'error' })
  elseif step == 5 then
    if InvCount(I.empty_baggy) < 1 then
      return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item', ItemLabel(I.empty_baggy)), type = 'error' })
    end
    return lib.notify({ title = locale('os_table.notify.title'), description = locale('os_table.notify.need_item', ItemLabel(I.brick)), type = 'error' })
  end
end
local function isAllowedGang()
  local pdata = exports.qbx_core:GetPlayerData()
  local gang = pdata and pdata.gang and pdata.gang.name
  return gang and Config.AllowedGangs[gang] == true
end

local function requestAnim(dict)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Wait(10)
  end
end

local function playStepAnim(stepKey)
  local cfg = Config.Anim and Config.Anim[stepKey]
  if not cfg or not cfg.dict or not cfg.name then return end
  requestAnim(cfg.dict)
  TaskPlayAnim(cache.ped, cfg.dict, cfg.name, 2.0, 2.0, -1, cfg.flag or 49, 0.0, false, false, false)
end

local function stopAnim()
  ClearPedTasks(cache.ped)
end

local function doProgress(label)
  local seconds = Config.ProgressBarSeconds or 5
  return lib.progressBar({
    duration = seconds * 1000,
    label = label,
    useWhileDead = false,
    canCancel = true,
    disable = { move = true, car = true, combat = true },
  })
end

local function formatTimeLeft(msLeft)
  local s = math.max(0, math.floor(msLeft / 1000))
  local m = math.floor(s / 60)
  local r = s % 60
  return string.format('%02d:%02d', m, r)
end

local function draw3DText(x, y, z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  if not onScreen then return end
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x, _y)
  local factor = (string.len(text)) / 370
  DrawRect(_x, _y + 0.012, 0.015 + factor, 0.03, 0, 0, 0, 90)
end

CreateThread(function()
  while true do
    Wait(0)
    if not Config.TimerText.enabled then goto continue end

    local pedCoords = GetEntityCoords(cache.ped)
    for i, tbl in ipairs(Config.Tables) do
      local craft = activeCraftsByTable[i]
      if craft then
        local dist = #(pedCoords - tbl.coords)
        if dist <= (Config.TimerText.maxDistance or 3.0) then
          local left = craft.endTimeMs - GetGameTimer()
          if left > 0 then
            local txt = ('%s %s'):format(
              (Config.TimerText.showStepName and (craft.stepLabel .. ' ') or ''),
              formatTimeLeft(left)
            )
            draw3DText(tbl.coords.x, tbl.coords.y, tbl.coords.z + (Config.TimerText.zOffset or 0.35), txt)
          else
            activeCraftsByTable[i] = nil
          end
        end
      end
    end

    ::continue::
  end
end)

-- NOTE: We do NOT trust server GetGameTimer(). Server sends durationSeconds.
RegisterNetEvent('os-coke:client:craftStarted', function(tableIndex, step, durationSeconds)
  local meta = StepMeta[step]
  if not meta then return end
  durationSeconds = tonumber(durationSeconds) or 0
  activeCraftsByTable[tableIndex] = {
    stepKey = meta.key,
    stepLabel = meta.label,
    endTimeMs = GetGameTimer() + (durationSeconds * 1000),
  }
end)

RegisterNetEvent('os-coke:client:craftEnded', function(tableIndex)
  activeCraftsByTable[tableIndex] = nil
end)

local function openTableMenu(tableIndex)
  if not isAllowedGang() then
    return lib.notify({ title = locale('os_table.notify.denied_title'), description = locale('os_table.notify.denied_desc'), type = 'error' })
  end

  local craft = activeCraftsByTable[tableIndex]
  if craft and craft.endTimeMs > GetGameTimer() then
    return lib.notify({ title = locale('os_table.notify.busy_title'), description = locale('os_table.notify.busy_desc'), type = 'error' })
  end

  lib.registerContext({
    id = 'os_coke_table_menu',
    title = locale('os_table.menu.title'),
    options = {
      {
        title = locale('os_table.menu.step1_title'),
        description = locale('os_table.menu.step1_desc', Config.Quantities.leavesToGround, ItemLabel(Config.Items.leaf), ItemLabel(Config.Items.ground)),
        icon = 'fas fa-mortar-pestle',
        onSelect = function()
          if not CanStartStep(1) then MissingItemsNotify(1) return end
          local step = 1
          local meta = StepMeta[step]
          playStepAnim(meta.key)
          if not doProgress(locale('os_table.progress.generic', meta.label)) then stopAnim() return end
          stopAnim()
          TriggerServerEvent('os-coke:server:startStep', tableIndex, step)
        end
      },
      {
        title = locale('os_table.menu.step2_title'),
        description = locale('os_table.menu.step2_desc', Config.Quantities.groundToUnf, ItemLabel(Config.Items.ground), ItemLabel(Config.Items.base_unf)),
        icon = 'fas fa-gas-pump',
        onSelect = function()
          if not CanStartStep(2) then MissingItemsNotify(2) return end
          local input = lib.inputDialog(locale('os_table.dialog.gas_title'), {
            { type = 'number', label = locale('os_table.dialog.gas_label'), required = true, min = 0, max = 100 }
          })
          if not input then return end
          local step = 2
          local meta = StepMeta[step]
          playStepAnim(meta.key)
          if not doProgress(locale('os_table.progress.generic', meta.label)) then stopAnim() return end
          stopAnim()
          TriggerServerEvent('os-coke:server:startStep', tableIndex, step, tonumber(input[1]))
        end
      },
      {
        title = locale('os_table.menu.step3_title'),
        description = locale('os_table.menu.step3_desc', ItemLabel(Config.Items.cement), ItemLabel(Config.Items.base_unf), ItemLabel(Config.Items.base)),
        icon = 'fas fa-trowel-bricks',
        onSelect = function()
          if not CanStartStep(3) then MissingItemsNotify(3) return end
          local input = lib.inputDialog(locale('os_table.dialog.cement_title'), {
            { type = 'number', label = locale('os_table.dialog.cement_label'), required = true, min = 0, max = 100 }
          })
          if not input then return end
          local step = 3
          local meta = StepMeta[step]
          playStepAnim(meta.key)
          if not doProgress(locale('os_table.progress.generic', meta.label)) then stopAnim() return end
          stopAnim()
          TriggerServerEvent('os-coke:server:startStep', tableIndex, step, tonumber(input[1]))
        end
      },
      {
        title = locale('os_table.menu.step4_title'),
        description = locale('os_table.menu.step4_desc', ItemLabel(Config.Items.base), ItemLabel(Config.Items.brick)),
        icon = 'fas fa-fire',
        onSelect = function()
          if not CanStartStep(4) then MissingItemsNotify(4) return end
          local step = 4
          local meta = StepMeta[step]
          playStepAnim(meta.key)
          if not doProgress(locale('os_table.progress.generic', meta.label)) then stopAnim() return end
          stopAnim()
          TriggerServerEvent('os-coke:server:startStep', tableIndex, step)
        end
      },
      {
        title = locale('os_table.menu.step5_title'),
        description = locale('os_table.menu.step5_desc', ItemLabel(Config.Items.empty_baggy), ItemLabel(Config.Items.brick), ItemLabel(Config.Items.bag)),
        icon = 'fas fa-hammer',
        onSelect = function()
          if not CanStartStep(5) then MissingItemsNotify(5) return end
          local step = 5
          local meta = StepMeta[step]
          playStepAnim(meta.key)
          if not doProgress(locale('os_table.progress.generic', meta.label)) then stopAnim() return end
          stopAnim()
          TriggerServerEvent('os-coke:server:startStep', tableIndex, step)
        end
      },
    }
  })

  lib.showContext('os_coke_table_menu')
end

CreateThread(function()
  for idx, t in ipairs(Config.Tables) do
    exports.ox_target:addSphereZone({
      coords = t.coords,
      radius = t.radius,
      debug = false,
      options = {
        {
          name = 'os_coke_table_' .. idx,
          label = t.label,
          icon = 'fa-solid fa-flask',
          onSelect = function()
            openTableMenu(idx)
          end,
          canInteract = function()
            local craft = activeCraftsByTable[idx]
            local busy = craft and craft.endTimeMs > GetGameTimer()
            return isAllowedGang() and not busy
          end
        }
      }
    })
  end
end)
