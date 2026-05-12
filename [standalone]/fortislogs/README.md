# Example usage:

```lua
local logsTable = {
    ["steamname"] = steamname, -- This could be a Lua variable in your script
    ["amount"] = amount, -- This could be a Lua variable in your script
    ["action"] = "added", -- You can also just enter raw strings
    ["reason"] = reason -- This could be a Lua variable in your script
}

exports["fortislogs"]:addLog("money", logsTable)
```

Change the "money" (first parameter in the addLog function) to the log name in the log panel (log type name)