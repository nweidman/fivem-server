if Config.dispatchScript == "tk_dispatch" then
    function sendDispatchAlert(title, message, blipData, coords, Type)
        exports.tk_dispatch:addCall({
            title = title,
            code = 'C04',
            priority = 'Priority 3',
            coords = coords,
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = blipData.color,
                sprite = blipData.sprite,
                scale = 1.0,
            },
            jobs = {'police'},
        })
    end
end