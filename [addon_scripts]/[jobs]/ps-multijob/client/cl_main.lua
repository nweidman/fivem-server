local QBCore = exports['qb-core']:GetCoreObject()

local function GetJobs()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('ps-multijob:getJobs', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

local function OpenUI()
    local playerData = QBCore.Functions.GetPlayerData()
    local job = playerData.job

    SetNuiFocus(true, true)

    SendNUIMessage({
        action    = 'sendjobs',
        activeJob = job.name,
        onDuty    = job.onduty,
        jobs      = GetJobs(),      -- { whitelist = {}, civilian = {} } from qbox server
        side      = Config.Side,
    })
end

RegisterNUICallback('selectjob', function(data, cb)
    TriggerServerEvent("ps-multijob:changeJob", data.name, data.grade)

    local onDuty = false
    if data.name ~= "police" and QBCore.Shared.Jobs[data.name] then
        onDuty = exports.qbx_core:GetJobs()[data.name].defaultDuty or false
    end

    cb({ onDuty = onDuty })
end)

RegisterNUICallback('closemenu', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)

RegisterNUICallback('removejob', function(data, cb)
    TriggerServerEvent("ps-multijob:removeJob", data.name)

    local jobs = GetJobs()
    cb(jobs)
end)

RegisterNUICallback('toggleduty', function(_, cb)
    cb({})

    local jobName = exports.qbx_core:GetPlayerData().job.name

    if Config.DenyDuty[jobName] then
        TriggerEvent("QBCore:Notify", 'Not allowed to use this station for clock-in.', 'error')
        return
    end

    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    SendNUIMessage({
        action      = 'updatejob',
        name        = JobInfo.name,
        label       = JobInfo.label,
        onDuty      = JobInfo.onduty,
        gradeLabel  = JobInfo.grade.name,
        grade       = JobInfo.grade.level,
        salary      = JobInfo.payment,
        isWhitelist = Config.WhitelistJobs[JobInfo.name] or false,
        description = Config.Descriptions[JobInfo.name] or "",
        icon        = Config.FontAwesomeIcons[JobInfo.name] or "",
    })
end)

RegisterCommand("jobmenu", OpenUI, false)
RegisterKeyMapping('jobmenu', "Show Job Management", "keyboard", "J")

TriggerEvent('chat:removeSuggestion', '/jobmenu')