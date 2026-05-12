Functions = {}

function Functions.ShowNotification(title, message, type, time) 
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName("("..title..") "..message)
    DrawNotification(false, true)
end

function Functions.ShowHelpNotification(msg, key)
    if GetResourceState("ox_lib") == "started" then
        Sky.Show.RegisterToggle("helpNotify", {
            key = key,
            msg = msg,
            show = function(self)
                exports.ox_lib:showTextUI("["..self.key.."] "..self.msg)
            end,
            hide = function(self)
                exports.ox_lib:hideTextUI()
            end
        })
    else
        if key == "E" then key = "~INPUT_CONTEXT~" end
        BeginTextCommandDisplayHelp("STRING")
        AddTextComponentSubstringPlayerName(key.." "..msg)
        EndTextCommandDisplayHelp(0, 0, 1, -1)
    end
end

function Functions.IsPlayerDead()
    if GetResourceState("osp_ambulance") == "started" then
        return exports["osp_ambulance"]:isDead()
    elseif GetResourceState("wasabi_ambulance") == "started" then
        return exports["wasabi_ambulance"]:isPlayerDead()
    elseif GetResourceState("brutal_ambulancejob") == "started" then
        return exports["brutal_ambulancejob"]:IsDead()
    elseif Sky.Config.framework == "mythic" then
        return LocalPlayer.state.isDead
    else
        return IsPlayerDead(PlayerId())
    end
end