-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local textUI = false

function showTextUI(msg, options)
    -- msg: string
    -- options: {
    --   position = 'right-center' | 'left-center' | 'top-center' | 'bottom-center',
    --   icon = string,
    --   iconColor = string,
    --   textColor = string,
    --   backgroundColor = string,
    --   iconAnimation = 'pulse', -- (not used by ox_lib)
    -- }

    if type(msg) ~= 'string' or msg == '' then return end
    options = options or {}

    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print('^0[^3WARNING^0] ^1ox_lib^0 is not running, cannot use showTextUI.^0')
        return
    end

    exports.ox_lib:showTextUI(msg, {
        position = options.position or 'left-center',
        icon = options.icon,
        style = {
            backgroundColor = options.backgroundColor,
            color = options.textColor,
        },
        iconStyle = options.iconColor and { color = options.iconColor } or nil,
    })

    textUI = msg
end

function hideTextUI()
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then return end

    exports.ox_lib:hideTextUI()
    textUI = false
end

function isTextUIOpen()
    return textUI and true or false, textUI or false
end

if WSB then
    WSB.showTextUI   = showTextUI
    WSB.hideTextUI   = hideTextUI
    WSB.isTextUIOpen = isTextUIOpen
end

exports('showTextUI', showTextUI)
exports('hideTextUI', hideTextUI)
exports('isTextUIOpen', isTextUIOpen)
