if GetResourceState('qbx_core') ~= 'started' then return end

Licence = {

  Licences = { -- These are the standard licences, if you've got more on your server, then simply add them here, for them to show in the MDT
    -- Don't know what licences you have? You can check at (qb-core>server>player.lua>line:121)
    { value = "driver",  label = "Driver Licence",  enabled = true, grant = true, revoke = true },
    { value = "weapon",  label = "Weapon Licence",  enabled = true, grant = true, revoke = true },
    { value = "pilot",   label = "Pilot Licence",   enabled = true, grant = true, revoke = true },
    { value = "hunting", label = "Hunting Licence", enabled = true, grant = true, revoke = true },
    { value = "fishing", label = "Fishing Licence", enabled = true, grant = true, revoke = true }
  },

  ---Get all licences for a player
  ---@param stateid string The player state id
  getLicences = function(stateid)
    local query = [[
      SELECT
        JSON_UNQUOTE(JSON_EXTRACT(p.`metadata`, '$.licences')) as licences
      FROM
        `drx_mdt_player_link` player_link
      JOIN
        %s p ON p.%s = player_link.`identifier`
      WHERE
        player_link.`stateid` = ?
    ]]

    query = query:format(Framework.tables.players, Framework.columns.players.identifier)

    return MySQL.single.await(query, { stateid })
  end,

  ---@param identifier string The player framework identifier
  ---@param type string The licence type
  ---@param licence string The licence to manage
  ---@param executor number The player id who executed the action
  manageLicence = function(identifier, type, licence, executor)
    local Player = Framework.getPlayerByIdentifier(identifier)
    local l = true
    if type == 'revoke' then
      l = false
    end

    local executorPlayer = nil
    if executor and Framework.getPlayerBySource then
      executorPlayer = Framework.getPlayerBySource(executor)
    end
  
    local targetName = 'Unknown'
    local targetStateId = 'Unknown'
  
    if Player then
      targetName = Player.fullname or 'Unknown'
    else
      local fullNameQuery = ("SELECT %s AS fullname FROM %s p WHERE p.%s = ? LIMIT 1"):format(
        Framework.columns.players.fullname,
        Framework.tables.players,
        Framework.columns.players.identifier
      )
    
      local targetData = MySQL.single.await(fullNameQuery, { identifier })
      if targetData and targetData.fullname then
        targetName = targetData.fullname
      end
    end
  
    local linkedPlayer = MySQL.single.await(
      'SELECT stateid FROM drx_mdt_player_link WHERE identifier = ? LIMIT 1',
      { identifier }
    )
  
    if linkedPlayer and linkedPlayer.stateid then
      targetStateId = linkedPlayer.stateid
    end
  
    if Player then
    Player.PlayerData.metadata.licences[licence] = l
    Player.Functions.SetMetaData('licences', Player.PlayerData.metadata.licences)
    Player.Functions.Save()
  else
    MySQL.update.await(("UPDATE %s SET metadata = JSON_SET(metadata, '$.licences.%s', %s) WHERE %s = ?"):format(
      Framework.tables.players,
      licence,
      l,
      Framework.columns.players.identifier
    ), { identifier })
  end
  
    if licence == 'weapon' or licence == 'driver' then
      local officerName = executorPlayer and executorPlayer.fullname or 'Unknown'
      local webhook = Config.Webhooks and Config.Webhooks.WeaponLicense
      local actionText = l and 'Granted' or 'Revoked'
      local embedTitle = ('Licence %s'):format(actionText)
      local embedColor = l and 65280 or 16711680
    
      local payload = {
        username = 'DRX MDT',
        embeds = {
          {
            title = embedTitle,
            color = embedColor,
            fields = {
              {
                name = 'Officer',
                value = tostring(officerName),
                inline = true
              },
              {
                name = 'Target',
                value = ('%s\nState ID: %s'):format(tostring(targetName), tostring(targetStateId)),
                inline = true
              },
              {
                name = 'Identifier',
                value = tostring(identifier),
                inline = false
              },
              {
                name = 'Licence Type',
                value = tostring(licence),
                inline = true
              },
              {
                name = 'Action',
                value = actionText,
                inline = true
              }
            },
            footer = {
              text = 'DRX MDT'
            },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ')
          }
        }
      }
    
      if Logger and Logger.discord then
        Logger.discord(webhook, payload)
      elseif webhook and webhook ~= '' then
        PerformHttpRequest(webhook, function(statusCode, responseBody, headers)
          if statusCode ~= 200 and statusCode ~= 204 then
            print(('[drx_mdt] licence webhook failed: %s %s'):format(
              tostring(statusCode),
              tostring(responseBody or 'nil')
            ))
          end
        end, 'POST', json.encode(payload), {
          ['Content-Type'] = 'application/json'
        })
      end
    end
  end,
}