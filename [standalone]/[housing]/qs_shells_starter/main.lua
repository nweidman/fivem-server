if GetResourceState('qs-housing') == 'started' then
    local shells = {
        {model = 'qs_shell_high01', stash = {maxweight = 800000, slots = 4}},
        {model = 'qs_shell_high02', stash = {maxweight = 1000000, slots = 5}},
        {model = 'qs_shell_high03', stash = {maxweight = 2000000, slots = 10}},
        {model = 'qs_shell_high04', stash = {maxweight = 1500000, slots = 8}},
        {model = 'qs_shell_high05', stash = {maxweight = 800000, slots = 4}},
        {model = 'qs_shell_high06', stash = {maxweight = 2500000, slots = 12}},
        {model = 'qs_shell_high07', stash = {maxweight = 1200000, slots = 6}}
    }
    
    for _, shell in ipairs(shells) do
        exports['qs-housing']:AddShell({
            model = shell.model,
            stash = shell.stash
        })
    end
    print("[DEBUG]: Import of qs_shells_starter completed")
end