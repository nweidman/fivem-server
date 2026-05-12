local _registerCommand = RegisterCommand

---@param commandName string
---@param callback fun(source, args, raw)
---@param restricted boolean?
function RegisterCommand(commandName, callback, restricted)
    _registerCommand(commandName, function(source, args, raw)
        if not restricted or lib.callback.await('ox_lib:checkPlayerAce', 100, ('command.%s'):format(commandName)) then
            callback(source, args, raw)
        end
    end)
end

RegisterNUICallback('getConfig', function(_, cb)
    cb({
        primaryColor = GetConvar('ox:primaryColor', 'violet'),
        primaryShade = GetConvarInt('ox:primaryShade', 5),
        darkMode = true, -- I LIKE THEM DARK
    })
end)

RegisterCommand('checkfocus', function()
    local currentFocus = IsNuiFocused()
    local currentKeepInput = IsNuiFocusKeepingInput()
    local oxLibHasFocus = lib._oxLibHasFocus or false

    print("=== NUI Focus Debug ===")
    print(string.format("IsNuiFocused: %s", tostring(currentFocus)))
    print(string.format("IsNuiFocusKeepingInput: %s", tostring(currentKeepInput)))
    print(string.format("ox_lib has focus flag: %s", tostring(oxLibHasFocus)))
    print("=====================")
end, false)
