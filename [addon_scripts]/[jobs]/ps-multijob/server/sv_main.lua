local QBCore = exports['qb-core']:GetCoreObject()
local QBX = exports.qbx_core

local function debugPrint(...)
    if Config.Debug then
        print('[ps-multijob]', ...)
    end
end

-- local function getMaxJobsForSource(src)
--     local base = Config.MaxJobs or GetConvarInt('qbx:max_jobs_per_player', 3)

--     if src and src ~= 0 and QBCore.Functions.HasPermission(src, 'group.admin') then
--         return math.huge
--     end

--     return base
-- end

-- local function countNonIgnoredJobs(jobs)
--     local count = 0
--     for name, _ in pairs(jobs) do
--         if not Config.IgnoredJobs[name] then
--             count += 1
--         end
--     end
--     return count
-- end

local function GetJobs(citizenid)
    local jobs = {}

    if not citizenid then
        return jobs
    end

    local player = QBX:GetPlayerByCitizenId(citizenid) or QBX:GetOfflinePlayer(citizenid)
    if not player or not player.PlayerData then
        return jobs
    end

    local pd = player.PlayerData

    return pd.jobs
end
exports('GetJobs', GetJobs)

local function AddJob(citizenid, job, grade)
    QBX:AddPlayerToJob(citizenid, job, grade)
    debugPrint(('Added/updated job %s grade %d for %s'):format(job, grade, citizenid))
    return true
end
exports('AddJob', AddJob)

local function UpdateJobRank(citizenid, job, grade)
    QBX:AddPlayerToJob(citizenid, job, grade)
    debugPrint(('Updated job %s -> grade %d for %s'):format(job, grade, citizenid))
end
exports('UpdateJobRank', UpdateJobRank)

local function RemoveJob(citizenid, job)
    QBX:RemovePlayerFromJob(citizenid, job)
    debugPrint(('Removed job %s from %s'):format(job, citizenid))
end
exports('RemoveJob', RemoveJob)

QBCore.Functions.CreateCallback('ps-multijob:getJobs', function(source, cb)
    local player = QBX:GetPlayer(source)
    if not player then
        return cb({ whitelist = {}, civilian = {} })
    end

    local citizenid = player.PlayerData.citizenid
    local jobs = GetJobs(citizenid)
    local sharedJobs = QBX:GetJobs()

    local multijobs = {
        whitelist = {},
        civilian = {},
    }

    for jobName, grade in pairs(jobs) do
        local jobData = sharedJobs[jobName]
        if not jobData then
            print(('[ps-multijob] Job "%s" is missing from qbx_core shared jobs.'):format(jobName))
        else
            grade = tonumber(grade) or 0
            local gradeData = jobData.grades[grade]

            if not gradeData then
                print(('[ps-multijob] Grade %d not found for job "%s".'):format(grade, jobName))
            else
                local onDutyCount = 0
                local count = QBX:GetDutyCountJob(jobName)
                if type(count) == 'number' then
                    onDutyCount = count
                end

                local jobInfo = {
                    name        = jobName,
                    grade       = grade,
                    description = Config.Descriptions[jobName] or '',
                    icon        = Config.FontAwesomeIcons[jobName] or '',
                    label       = jobData.label or jobName,
                    gradeLabel  = gradeData.name or 'Unknown',
                    salary      = gradeData.payment or 0,
                    active      = onDutyCount,
                }

                if Config.WhitelistJobs[jobName] then
                    multijobs.whitelist[#multijobs.whitelist + 1] = jobInfo
                else
                    multijobs.civilian[#multijobs.civilian + 1] = jobInfo
                end
            end
        end
    end

    cb(multijobs)
end)

RegisterNetEvent('ps-multijob:changeJob', function(cjob, cgrade)
    local src = source
    local player = QBX:GetPlayer(src)
    if not player then return end

    local citizenid = player.PlayerData.citizenid
    exports.qbx_core:SetPlayerPrimaryJob(citizenid, cjob)
end)

RegisterNetEvent('ps-multijob:removeJob', function(job)
    local src = source
    local player = QBX:GetPlayer(src)
    if not player then return end

    local citizenid = player.PlayerData.citizenid
    exports.qbx_core:RemovePlayerFromJob(citizenid, job)
end)

-- AddEventHandler('QBCore:Server:OnJobUpdate', function(src, job)
--     local player = QBX:GetPlayer(src)
--     if not player or not job then return end

--     local citizenid = player.PlayerData.citizenid
--     local jobs = GetJobs(citizenid)
--     local total = countNonIgnoredJobs(jobs)
--     local maxJobs = getMaxJobsForSource(src)

--     if Config.IgnoredJobs[job.name] then return end

--     debugPrint(('OnJobUpdate %s -> %s (total jobs: %d / %d)'):format(citizenid, job.name, total, maxJobs))

--     if total > maxJobs then
--         QBX:RemovePlayerFromJob(citizenid, job.name)
--         exports.qbx_core:Notify(src,
--             ('You can only have %d jobs. The last job (%s) was removed.'):format(maxJobs, job.name),
--             'error'
--         )
--         debugPrint(('Removed overflow job %s from %s due to max limit'):format(job.name, citizenid))
--     end
-- end)

-- QBCore.Commands.Add('removejob', 'Remove Multi Job (Admin Only)', {
--     { name = 'id',  help = 'ID of player' },
--     { name = 'job', help = 'Job Name' }
-- }, false, function(source, args)
--     local src = source
--     if src == 0 then return end

--     local targetId = tonumber(args[1] or 0)
--     local jobName = args[2]

--     if not targetId or not jobName then
--         TriggerClientEvent('QBCore:Notify', src, 'Usage: /removejob [id] [job]', 'error')
--         return
--     end

--     local target = QBX:GetPlayer(targetId)
--     if not target then
--         TriggerClientEvent('QBCore:Notify', src, 'Player not online.', 'error')
--         return
--     end

--     RemoveJob(target.PlayerData.citizenid, jobName)
--     TriggerClientEvent('QBCore:Notify', src, ('Removed job %s from %s'):format(jobName, targetId), 'success')
-- end, 'group.mod')

-- QBCore.Commands.Add('addjob', 'Add Multi Job (Admin Only)', {
--     { name = 'id',    help = 'ID of player' },
--     { name = 'job',   help = 'Job Name' },
--     { name = 'grade', help = 'Job Grade' }
-- }, false, function(source, args)
--     local src = source
--     if src == 0 then return end

--     local targetId = tonumber(args[1] or 0)
--     local jobName  = args[2]
--     local grade    = tonumber(args[3] or 0) or 0

--     if not targetId or not jobName or args[3] == nil then
--         TriggerClientEvent('QBCore:Notify', src, 'Usage: /addjob [id] [job] [grade]', 'error')
--         return
--     end

--     local target = QBX:GetPlayer(targetId)
--     if not target then
--         TriggerClientEvent('QBCore:Notify', src, 'Player not online.', 'error')
--         return
--     end

--     local ok, err = AddJob(target.PlayerData.citizenid, jobName, grade)
--     if not ok then
--         TriggerClientEvent('QBCore:Notify', src, err or 'Failed to add job.', 'error')
--         return
--     end

--     TriggerClientEvent('QBCore:Notify', src, ('Added job %s (grade %d) to %s'):format(jobName, grade, targetId), 'success')
-- end, 'group.mod')
