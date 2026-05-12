ChatLoaded = false
local mouse = false
local config = require('config.chat')
local commandGeneral = config.commandGeneral
local chatOpen = false

local nuiQueue = {}

local function sendNUI(data)
  if ChatLoaded then
    SendNUIMessage(data)
    return
  end
  nuiQueue[#nuiQueue + 1] = data
end

local function flushQueue()
  ChatLoaded = true

  for i = 1, #nuiQueue do
    SendNUIMessage(nuiQueue[i])
  end

  nuiQueue = {}
end

local function exportHandler(exportName, func)
  AddEventHandler(('__cfx_export_chat_%s'):format(exportName), function(setCB)
    setCB(func)
  end)

  exports(exportName, func) -- support modern exports
end

-- RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:addMode')
RegisterNetEvent('chat:removeMode')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')

-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')

RegisterNetEvent('_chat:messageEntered')

-- --deprecated, use chat:addMessage
-- AddEventHandler('chatMessage', function(author, color, text, tagData)
--   if not ChatLoaded then return end

--   Debug('chatMessage event', 'info')

--   local args = { text }

--   if author ~= "" then
--     table.insert(args, 1, author)
--   end

--   SendNUIMessage({
--     type = 'ON_MESSAGE',
--     data = {
--       args = args,
--       mode = '_global',
--     }
--   })
-- end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
  print(msg)

  Debug('serverPrint event', 'info')

  if msg == '' or msg == nil then return end

  sendNUI({
    type = 'ON_MESSAGE',
    data = {
      templateId = 'print',
      multiline = true,
      args = { msg },
      mode = '_global'
    }
  })
end)

-- addMessage
local addMessage = function(message)
  Debug('Adding message', 'info')

  if type(message) == 'string' then
    message = {
      args = { message }
    }
  end

  if type(message) ~= 'table' then return end

  if message.args ~= nil and type(message.args) ~= 'table' then
    message.args = { tostring(message.args) }
  end

  Debug(message)

  sendNUI({
    type = 'ON_MESSAGE',
    data = message
  })
end

exportHandler('addMessage', addMessage)
AddEventHandler('chat:addMessage', addMessage)

-- addSuggestion
local addSuggestion = function(name, help, params)
  if not name then return end

  sendNUI({
    type = 'ON_SUGGESTION_ADD',
    data = {
      name = name,
      help = help or '',
      params = type(params) == 'table' and params or nil
    }
  })
end

exportHandler('addSuggestion', addSuggestion)
AddEventHandler('chat:addSuggestion', addSuggestion)

AddEventHandler('chat:addSuggestions', function(suggestions)
  Debug('Adding suggestions', 'info')

  if type(suggestions) ~= 'table' then
    Debug('Invalid suggestions type: ' .. type(suggestions), 'error')
    Debug(suggestions, 'error')
    return
  end

  for _, suggestion in ipairs(suggestions) do
    if type(suggestion) == 'table' and suggestion.name then
      sendNUI({
        type = 'ON_SUGGESTION_ADD',
        data = {
          name = suggestion.name,
          help = suggestion.help or '',
          params = type(suggestion.params) == 'table' and suggestion.params or nil,
        }
      })
    end
  end
end)


AddEventHandler('chat:removeSuggestion', function(name)
  sendNUI({
    type = 'ON_SUGGESTION_REMOVE',
    data = name
  })
end)

AddEventHandler('chat:addMode', function(mode)
  sendNUI({
    type = 'ON_MODE_ADD',
    mode = mode
  })
end)

AddEventHandler('chat:removeMode', function(name)
  sendNUI({
    type = 'ON_MODE_REMOVE',
    name = name
  })
end)

AddEventHandler('chat:clear', function()
  SendNUIMessage({
    type = 'ON_CLEAR'
  })
end)

RegisterCommand(config.clearCommand, function()
  SendNUIMessage({
    type = 'ON_CLEAR'
  })
end)

local function dataMessageExecute(msg)
  if #msg <= 1 then return end

  if msg:sub(1, 1) == commandGeneral.forwardSlash then
    ExecuteCommand(msg:sub(2))
    Debug('/Command entered: ' .. msg, 'info')
    return
  end

  if commandGeneral.onlyCommand.status then return end
  ExecuteCommand(commandGeneral.onlyCommand.executeChat .. ' ' .. tostring(msg))
  Debug('Message entered: ' .. msg, 'info')
end

local function typingDot(state)
  if not commandGeneral.typingDot.status then return end

  if GetEntityAlpha(cache.ped) == 51 then return end

  local pedCoords = GetEntityCoords(cache.ped)
  local nearbyPlayers = lib.getNearbyPlayers(pedCoords, 3, false)

  if #nearbyPlayers == 0 then return end

  TriggerServerEvent('um-chat:callback:typing', state)
end

local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()

    local suggestions = {}

    for _, command in ipairs(registeredCommands) do
      if IsAceAllowed(('command.%s'):format(command.name)) and command.name ~= 'openChat' then
        suggestions[#suggestions + 1] = {
          name = '/' .. command.name,
          help = ''
        }
      end
    end

    TriggerEvent('chat:addSuggestions', suggestions)
  end
end


AddEventHandler('onClientResourceStart', function(resName)
  Wait(500)
  refreshCommands()
end)

AddEventHandler('onClientResourceStop', function(resName)
  Wait(500)
  refreshCommands()
end)

RegisterNUICallback('getConfig', function(_, cb)
  local nuiData = require('config.nui')
  local lang = lib.loadJson(('locales/%s'):format(config.lang))
  cb({ data = nuiData, lang = lang })
  Wait(100)
  TriggerServerEvent('chat:init')
  refreshCommands()
  flushQueue()
  Debug('Loaded', 'info')
end)

RegisterNUICallback('chatResult', function(data, cb)
  cb(1)
  mouse, chatOpen = false, false
  SetNuiFocus(false, false)
  dataMessageExecute(data.message)
  typingDot(false)
end)

RegisterNUICallback('chatClose', function(_, cb)
  cb(1)
  mouse, chatOpen = false, false
  SetNuiFocus(false, false)
  Debug('Chat closed', 'info')
  typingDot(false)
end)

RegisterNUICallback('openMouse', function(_, cb)
  cb(1)
  mouse = not mouse
  SetNuiFocus(true, mouse)
  Debug('Mouse: ' .. tostring(mouse), 'info')
end)

RegisterKeyMapping('openChat', 'Open Chat', 'keyboard', 't')

RegisterCommand('openChat', function()
  if chatOpen or IsPauseMenuActive() then return end

  if not ChatLoaded then
    return Debug('Chat waiting for nui', 'warn')
  end

  if IsNuiFocused() or IsNuiFocusKeepingInput() then
    return Debug('Different nui focus state', 'warn')
  end

  SetNuiFocus(true, false)
  SendNUIMessage({ type = 'ON_OPEN' })

  Debug('Chat opened', 'info')

  chatOpen = true
  typingDot(true)
end, false)

SetTextChatEnabled(false)
SetNuiFocus(false, false)
