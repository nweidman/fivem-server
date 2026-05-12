local customCommands = require('config.commands').customs
local errNotify = require('lua.commands.modules.errorMessage')
local addCustomCommand = lib.addCommand

local function addChatMessage(target, data)
    TriggerClientEvent('chat:addMessage', target, data)
end

local function getDisplayName(src)
    local QBX = exports.qbx_core
    local Player = QBX and QBX:GetPlayer(src)
    if Player and Player.PlayerData and Player.PlayerData.charinfo then
        local ci = Player.PlayerData.charinfo
        local fn = ci.firstname or ci.firstName
        local ln = ci.lastname or ci.lastName
        if fn and ln then return (fn .. ' ' .. ln) end
        if fn then return fn end
    end
    if GetPlayerFirstName then
        local first = GetPlayerFirstName(src)
        if first and first ~= '' then return first end
    end
    local rockstar = GetPlayerName and GetPlayerName(src)
    return rockstar or ('ID ' .. tostring(src))
end

local function isLeoOnDuty(src)
    local QBX = exports.qbx_core
    local Player = QBX and QBX:GetPlayer(src)
    if not Player then return false end
    local job = Player.PlayerData and Player.PlayerData.job
    if not job then return false end
    local isLeo = (job.type == 'leo') or (job.name == 'police')
    local onDuty = (job.onduty == true) or (job.duty == true) or (job.onDuty == true)
    return isLeo and onDuty
end

-- ===========================
-- /ad (paid global ad)
-- ===========================

do
    local cfgVal = customCommands and customCommands['ad']
    if cfgVal then
        local adCfg = (cfgVal == true) and {} or cfgVal
        if type(adCfg) ~= 'table' then adCfg = {} end

        local restricted  = adCfg.restricted or adCfg.permission 
        local COOLDOWN_MS = tonumber(adCfg.cooldown_ms) or 15000
        local PRICE       = tonumber(adCfg.price) or 5000
        local lastSent    = {}

        addCustomCommand('ad', {
            help = ('Send a global advertisement ($%d fee)'):format(PRICE),
            params = {
                { name = 'message', type = 'longString', help = 'Your announcement' }
            },
            restricted = restricted
        }, function(source, args)
            if not source then return end
            local src = source
            local raw = args['message'] or ''
            if #raw < 1 then return end

            local now = GetGameTimer()
            local last = lastSent[src] or 0
            local remain = COOLDOWN_MS - (now - last)
            if remain > 0 then
                local left = math.ceil(remain / 1000)
                return errNotify(src, { title = 'Slow down', message = ('Please wait %ss before sending another ad.'):format(left) })
            end

            local msg = tostring(raw):gsub('[~<].-[>~]', '')
            if #msg == 0 then
                return errNotify(src, { title = 'Error!', message = 'Empty message.' })
            end

            local QBX = exports.qbx_core
            local Player = QBX and QBX:GetPlayer(src)
            if not Player then
                return errNotify(src, { title = 'Error!', message = 'Player data not ready. Try again.' })
            end

            local bank = (Player.PlayerData and Player.PlayerData.money and Player.PlayerData.money.bank) or 0
            if bank < PRICE then
                return errNotify(src, { title = 'Insufficient funds', message = ('You need $%d in the bank to post an ad.'):format(PRICE) })
            end

            local ok = Player.Functions.RemoveMoney('bank', PRICE, 'um-chat:ad-broadcast')
            if not ok then
                return errNotify(src, { title = 'Error!', message = 'Could not process payment.' })
            end

            local name = getDisplayName(src)
            local payload = {
                args = msg,
                title = name,
                tag = { name = '💰 Advertisement', background = '#4ade80' }
            }

            addChatMessage(-1, payload)

			addChatMessage(src, {
				args = ('-$%d taken from bank'):format(PRICE),
				title = 'Ad sent!',
				tag = { name = 'Advertisement', background = '#4ade80' }
			})

            lastSent[src] = now
        end)
    end
end

-- ===========================
-- /police (LEO-only)
-- ===========================

do
    local cfgVal = customCommands and customCommands['police']
    if cfgVal then
        local policeCfg = (cfgVal == true) and {} or cfgVal
        if type(policeCfg) ~= 'table' then policeCfg = {} end

        local TO = (policeCfg.to == 'leo') and 'leo' or 'everyone'
        local COOLDOWN_MS = tonumber(policeCfg.cooldown_ms) or 10000
        local lastSent = {}

        addCustomCommand('police', {
            help = (TO == 'leo') and 'Police announcement to on-duty LEOs' or 'Police announcement to everyone',
            params = {
                { name = 'message', type = 'longString', help = 'Your announcement' }
            },
        }, function(source, args)
            if not source then return end
            local src = source

            if not isLeoOnDuty(src) then
                return errNotify(src, { title = 'Not authorized', message = 'You must be on-duty LEO to use /police.' })
            end

            local raw = args['message'] or ''
            if #raw < 1 then return end

            local now = GetGameTimer()
            local last = lastSent[src] or 0
            local remain = COOLDOWN_MS - (now - last)
            if remain > 0 then
                local left = math.ceil(remain / 1000)
                return errNotify(src, { title = 'Slow down', message = ('Please wait %ss before sending another announcement.'):format(left) })
            end

            local msg = tostring(raw):gsub('[~<].-[>~]', '')
            if #msg == 0 then
                return errNotify(src, { title = 'Error!', message = 'Empty message.' })
            end

            local name = getDisplayName(src)
            local payload = {
                args = msg,
                title = name,  
                tag = {
                    name = '🚨 Police Announcement',
                    background = '#60a5fa' 
                }
            }

            if TO == 'leo' then
                for _, id in ipairs(GetPlayers()) do
                    local idNum = tonumber(id)
                    if idNum and isLeoOnDuty(idNum) then
                        addChatMessage(idNum, payload)
                    end
                end
            else
                addChatMessage(-1, payload)
            end

            lastSent[src] = now
        end)
    end
end

-- ===========================
-- /ems (EMS-only)
-- ===========================

do
    local cfgVal = customCommands and customCommands['ems']
    if cfgVal then
        local emsCfg = (cfgVal == true) and {} or cfgVal
        if type(emsCfg) ~= 'table' then emsCfg = {} end

        local TO = (emsCfg.to == 'ems') and 'ems' or 'everyone'
        local COOLDOWN_MS = tonumber(emsCfg.cooldown_ms) or 10000
        local lastSent = {}

        local function isEmsOnDuty(src)
            local QBX = exports.qbx_core
            local Player = QBX and QBX:GetPlayer(src)
            if not Player then return false end
            local job = Player.PlayerData and Player.PlayerData.job
            if not job then return false end
            local isEMS = (job.type == 'ems') or (job.name == 'ambulance')
            local onDuty = (job.onduty == true) or (job.duty == true) or (job.onDuty == true)
            return isEMS and onDuty
        end

        addCustomCommand('ems', {
            help = (TO == 'ems') and 'EMS announcement to on-duty EMS' or 'EMS announcement to everyone',
            params = {
                { name = 'message', type = 'longString', help = 'Your announcement' }
            },
        }, function(source, args)
            if not source then return end
            local src = source

            if not isEmsOnDuty(src) then
                return errNotify(src, { title = 'Not authorized', message = 'You must be on-duty EMS to use /ems.' })
            end

            local raw = args['message'] or ''
            if #raw < 1 then return end

            local now = GetGameTimer()
            local last = lastSent[src] or 0
            local remain = COOLDOWN_MS - (now - last)
            if remain > 0 then
                local left = math.ceil(remain / 1000)
                return errNotify(src, { title = 'Slow down', message = ('Please wait %ss before sending another announcement.'):format(left) })
            end

            local msg = tostring(raw):gsub('[~<].-[>~]', '')
            if #msg == 0 then
                return errNotify(src, { title = 'Error!', message = 'Empty message.' })
            end

            local name = getDisplayName(src)
            local payload = {
                args = msg,
                title = name,
                tag = {
                    name = '🚑 EMS Announcement',
                    background = '#f87171'
                }
            }

            if TO == 'ems' then
                for _, id in ipairs(GetPlayers()) do
                    local idNum = tonumber(id)
                    if idNum then
                        if isEmsOnDuty(idNum) then
                            addChatMessage(idNum, payload)
                        end
                    end
                end
            else
                addChatMessage(-1, payload)
            end

            lastSent[src] = now
        end)
    end
end
