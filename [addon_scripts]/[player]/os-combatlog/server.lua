local QBX = exports.qbx_core
local Ghosts = {}
local LastAppearance = {} -- [citizenid] = appearance table from crm-appearance

local function resolveReason(reason)
    local r = (reason or ''):lower()
    if Config.ReasonList then
        for k, v in pairs(Config.ReasonList) do
            if r:find(k) then
                return v, reason
            end
        end
    end
    return 'Disconnected', reason
end

local function broadcastSpawn(data)
  TriggerClientEvent('combatghost:client:spawnGhost', -1, data)
end

local function broadcastRemove(cid)
  TriggerClientEvent('combatghost:client:removeGhost', -1, cid)
end

RegisterNetEvent('combatghost:server:updateAppearance', function(appearance)
  local src = source
  local player = QBX:GetPlayer(src)
  if not player then return end

  if type(appearance) ~= 'table' then return end
  local cid = player.PlayerData.citizenid
  LastAppearance[cid] = appearance
end)

AddEventHandler('playerDropped', function(reason)
  local src = source
  local player = QBX:GetPlayer(src)
  if not player then return end

  if Config.IgnoreIfDead and (player.PlayerData.metadata and player.PlayerData.metadata.isdead) then return end

  local ped = GetPlayerPed(src)
  if ped == 0 then return end

  local coords = GetEntityCoords(ped)
  local heading = GetEntityHeading(ped)
  local model = GetEntityModel(ped)

  local cid = player.PlayerData.citizenid
  local name = ((player.PlayerData.charinfo and player.PlayerData.charinfo.firstname) or 'Unknown') .. ' ' .. ((player.PlayerData.charinfo and player.PlayerData.charinfo.lastname) or '')

  local dropType, rawReason = resolveReason(reason)

  Ghosts[cid] = {
    cid = cid,
    name = name,
    coords = coords,
    heading = heading,
    model = model,
    dropType = dropType,
    rawReason = rawReason,
    time = os.time(),
    appearance = LastAppearance[cid]
  }

  broadcastSpawn(Ghosts[cid])

  SetTimeout(Config.DespawnTime * 1000, function()
    if Ghosts[cid] then
      Ghosts[cid] = nil
      broadcastRemove(cid)
    end
  end)
end)

AddEventHandler('qbx_core:server:playerLoaded', function(player)
  local cid = player.PlayerData.citizenid
  if Ghosts[cid] then
    Ghosts[cid] = nil
    broadcastRemove(cid)
  end
end)

AddEventHandler('onResourceStop', function(res)
  if res ~= GetCurrentResourceName() then return end
  Ghosts = {}
  TriggerClientEvent('combatghost:client:removeAllGhosts', -1)
end)

if Config.EnableTestCommands then
  RegisterCommand(Config.TestCommand or 'testghost', function(source, args)
    local src = source
    if src == 0 then return end

    local player = QBX:GetPlayer(src)
    if not player then return end

    local ped = GetPlayerPed(src)
    if ped == 0 then return end

    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local model = GetEntityModel(ped)

    local cid = player.PlayerData.citizenid
    local name = ((player.PlayerData.charinfo and player.PlayerData.charinfo.firstname) or 'Unknown') .. ' ' .. ((player.PlayerData.charinfo and player.PlayerData.charinfo.lastname) or '')

    local arg = (args[1] or 'exiting'):lower()
    local label = Config.ReasonList[arg] or 'Test'

    local data = {
      cid = cid,
      name = name,
      coords = coords,
      heading = heading,
      model = model,
      dropType = label,
      rawReason = 'TEST:' .. arg,
      time = os.time(),
      appearance = LastAppearance[cid]
    }

    Ghosts[cid] = data
    broadcastSpawn(data)
  end, false)

  RegisterCommand(Config.ClearCommand or 'clearghosts', function(source)
    local src = source
    if src == 0 then
      Ghosts = {}
      TriggerClientEvent('combatghost:client:removeAllGhosts', -1)
      return
    end

    local player = QBX:GetPlayer(src)
    if not player then return end

    local cid = player.PlayerData.citizenid
    Ghosts[cid] = nil
    broadcastRemove(cid)
  end, false)
end
