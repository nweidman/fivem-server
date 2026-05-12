-- Don't edit unless you know what you are doing

-- Called every time you start talking using megaphone
function onStartUsingMegaphone(isHandheld)
    TriggerEvent('cfx-megaphone:setTalkingMegaphone', isHandheld)
end

-- Called every time you stop using megaphone
function onStopUsingMegaphone(isHandheld)
    TriggerEvent('cfx-megaphone:stopUsingMegaphone', isHandheld)
end

-- Functions below are also accessible in this file
-- turnOnMegaphone()
-- turnOffMegaphone()
-- turnOnHandheld()
-- turnOffHandheld()

exports('toggleMegaphone', function(isHandheld)
    if isHandheld then
        toggleHandheldMegaphone() -- Toggle handheld megaphone
    else
        toggleMegaphone() -- Toggle vehicle megaphone
    end
end)


