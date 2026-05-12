Logger = {
  enableDebug = false,

  info = function(message, ...)
    print(('[^4INFO^7] ' .. tostring(message)):format(...))
  end,

  warn = function(message, ...)
    print(('[^3WARNING^7] ' .. tostring(message)):format(...))
  end,

  error = function(message, ...)
    error((tostring(message)):format(...))
  end,

  debug = function(message, ...)
    if not Logger.enableDebug then return end
    print(('[^6DEBUG^7] ' .. tostring(message)):format(...))
  end,

  discord = function(webhook, data)
    if not webhook or webhook == '' then
      Logger.warn('Discord webhook missing, skipping log. Please set it in drx_mdt/configurables/server.lua')
      return
    end

    PerformHttpRequest(
      webhook,
      function(statusCode, responseBody, headers)
        if statusCode ~= 200 and statusCode ~= 204 then
          Logger.warn(
            'Discord webhook failed with status %s. Response: %s',
            tostring(statusCode),
            tostring(responseBody or 'nil')
          )
        end
      end,
      'POST',
      json.encode(data),
      {
        ['Content-Type'] = 'application/json'
      }
    )
  end
}