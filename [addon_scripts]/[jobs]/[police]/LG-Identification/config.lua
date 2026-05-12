local QBCore = exports['qb-core']:GetCoreObject()

Config = {}
Config.Data = {}

Config.Data.DisplayTimer = 3
Config.Data.DisplayDistance = 4.0
Config.Data.Departments = { 
    --["sast"] = {
    --    label = "San Andreas State Troopers",
    --    background_image = "https://i.postimg.cc/x18QkmTx/sast-badge.webp",
    --    background_color = "rgb(59, 76, 58)",
    --    description = "<h3>San Andreas State Troopers</h3><p>The person displaying this badge is a law enforcement officer.</p><p>Los Santos, CA</p>",
    --    colors= {
    --        text = "white",
    --        underline = "white",
    --        photo = "black",
    --    }
    --},
    ["doj"] = {
        label = "Department of Justice",
        background_image = "https://i.postimg.cc/c170PZbm/dojlogo-1.png",
        background_color = "rgb(40, 40, 60)",
        description = "<h3>Department of Justice</h3><p>The person displaying this badge is a legal representative.</p><p>Los Santos, CA</p>",
        colors= {
            text = "white",
            underline = "white",
            photo = "black",
        }
    },
    ["lspd"] = {
        label = "Los Santos Police Department",
        background_image = "https://r2.fivemanage.com/pub/8wliymvnbxqj.png",
        background_color = "rgb(0, 0, 255)",
        description = "<h3>Los Santos Police Department</h3><p>The person displaying this badge is a law enforcement officer.</p><p>Los Santos, CA</p>",
        colors= {
            text = "white",
            underline = "white",
            photo = "black",
         }
    },
    ["bcso"] = {
        label = "Blaine County Sheriff's Office",
        background_image = "https://i.postimg.cc/cJ2hDCS3/sast-badge-1.webp",
        background_color = "rgb(31, 139, 76)",
        description = "<h3>Blaine County Sheriff's Office</h3><p>The person displaying this badge is a law enforcement officer.</p><p>Los Santos, CA</p>",
        colors = {
            text = "white",
            underline = "white",
            photo = "white",
        }
     },
    ["medic"] = {
        label = "San Andreas Medical",
        background_image = "https://nremt.org/icon.png",
        background_color = "rgb(60, 40, 40)",
        description = "<h3>San Andreas Medical</h3><p>The person displaying this badge is a medical professional.</p><p>Los Santos, CA</p>",
        colors = {
            text = "white",
            underline = "white",
            photo = "white",
        }
    },
}
Config.Functions = {}

Config.Functions.CanDisplayIdentity = function() -- Client Check to see if the player can show their identity
    local PlayerData = QBCore.Functions.GetPlayerData()
        if (PlayerData.job.name == "police" or PlayerData.job.name == "sheriff" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "doj") then
            return true 
        else 
            return false
        end
end

Config.Functions.CanEditIdentity = function() -- Client Check to see if the player can edit their identity
    local PlayerData = QBCore.Functions.GetPlayerData()
    if (PlayerData.job.name == "police" or PlayerData.job.name == "sheriff" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "doj") then
        return true 
    else 
        return false
    end
end

Config.Functions.OnEditSubmit = function(data) -- Client handler for when the player submits their edited identity
    --[[ Example: I dont want to allow the player to edit their name
    if (CurrentData.name ~= data.name) then 
        data.name = CurrentData.name
    end
    ]]--
    return data
end