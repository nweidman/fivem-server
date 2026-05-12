QBCore = exports['qb-core']:GetCoreObject()


function Notification(msg)
    QBCore.Functions.Notify(msg, "success")
end

function ExtraFunctionInZone() -- you can add extra funcation here, This will trigger when player is inside the zone
   --If you are not a developer then please ignore this section
end