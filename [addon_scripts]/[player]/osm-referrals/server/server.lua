QBCore = exports['qb-core']:GetCoreObject()

local DISCORD_WEBHOOK = Config.DiscordWebhook
local timePlayed = {}

RegisterServerEvent('osm-referrals:Server:MainTrigger')
AddEventHandler('osm-referrals:Server:MainTrigger', function(src)
  -- local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local license = Player.PlayerData.license
  local name = Player.PlayerData.name
  local cid = Player.PlayerData.citizenid

  if license ~= nil and Player ~= nil then 
    local result = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
    if result[1] then
      if result[1].redeemed ~= 1 then
        local code = result[1].code
        local code = code:upper()
        TriggerClientEvent('osm-referrals:Client:MainTrigger', src, code)
      else
        TriggerClientEvent('qb-clothes:client:CreateFirstCharacter', src)
      end
    else
      local length = -(Config.CodeLength)
      local code = string.sub(license, length)
      local code = code:upper()
      local name = Player.PlayerData.name
      Citizen.Wait(100)
      MySQL.Async.insert("INSERT INTO `osmreferral` (`cid`, `license`, `name`, `code`, `uses`, `pendingrew`, `redeemed`) VALUES (?, ?, ?, ?, ?, ?, ?)",{cid, license, name, code, 0, 0, 0})
      TriggerClientEvent('osm-referrals:Client:MainTrigger', src, code)
      local connect = {
        {
          ["color"] = "5814783",
          ["title"] = "Code Generated",
          ["description"] = "**New Code** - `"..code.."` generated for\n**License** - `"..license.."`\n**Name** - `"..name.."`",
          ["footer"] = {
            ["text"] = "OSM-REFERRALS | discord.io/osmfx | https://osmfx.tebex.io/",
          },
        }
      }
      if DISCORD_WEBHOOK ~= "" then 
        PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "OsmReferrals User Logs",  avatar_url = "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/error-512.png", embeds = connect}), {['Content-Type'] = 'application/json'})
      end
    end
  end
end)

RegisterServerEvent('osm-referrals:PostSubmit')
AddEventHandler('osm-referrals:PostSubmit', function(data)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)

  local license = Player.PlayerData.license
  local name = Player.PlayerData.name
  local cid = Player.PlayerData.citizenid

  if license ~= nil and Player ~= nil then
    local result = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
    if result[1] then
      local code = result[1].code
      if data.code ~= nil or data.code ~= '' or data.code ~= 'NULL' then
        local entcode = data.code
        entcode = entcode:upper()
        if code == entcode then
          TriggerClientEvent('QBCore:Notify', src, "You used your own code. No Rewards will be Credited.")
        else
          if Config.ReasonSystem then
            MySQL.Async.insert("UPDATE `osmreferral` SET reason = ? WHERE `license` = ?", {data.reason, license})
          end
          MySQL.Async.insert("UPDATE `osmreferral` SET redeemed = ? WHERE `license` = ?", {1, license})
          MySQL.Async.insert("UPDATE `osmreferral` SET usedcode = ? WHERE `license` = ?", {entcode, license})
          TriggerEvent('osm-referrals:Redeem', src, entcode)
        end
        local connect = {
          {
            ["color"] = "5814783",
            ["title"] = "Code Used",
            ["description"] = "**Code** - `"..entcode.."` used by\n\n**LICENSE** - `"..license.."`\n\n**Name** - `"..name.."`\n**Citizen ID** - `"..cid.."`",
            ["footer"] = {
              ["text"] = "OSM-REFERRALS | discord.io/osmfx | https://osmfx.tebex.io/",
            },
          }
        }
        if DISCORD_WEBHOOK ~= "" then 
          PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "OsmReferrals User Logs",  avatar_url = "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/error-512.png", embeds = connect}), { ['Content-Type'] = 'application/json' })
        end
      end
    end
  end
  Wait(1000)
  TriggerClientEvent('qb-clothes:client:CreateFirstCharacter', src)
end)

RegisterServerEvent('osm-referrals:Redeem')
AddEventHandler('osm-referrals:Redeem', function(src, code)
  local entcode = code
  local result = MySQL.query.await("SELECT * FROM `osmreferral` WHERE `code` = ?", {entcode})
  if result[1] then
    TriggerClientEvent('QBCore:Notify', src, "Your Rewards will be Added after Playing for "..Config.WaitTime.." Minutes!")
    TriggerClientEvent('osm-referrals:StartWaiting', src, result[1])
  else
    TriggerClientEvent('QBCore:Notify', src, "Invalid Referral Code was Entered!")
  end
end)

RegisterServerEvent('osm-referrals:Server:RewardsPayout')
AddEventHandler('osm-referrals:Server:RewardsPayout', function(res)
  local uses = res.uses + 1
  local rew = math.floor(res.pendingrew + Config.Rewards.CodeOwner)
  local license = res.license
  MySQL.Async.insert("UPDATE `osmreferral` SET uses = ?, pendingrew = ? WHERE `license` = ?", {uses, rew, license})
  local src = source
  Player = QBCore.Functions.GetPlayer(src)
  local rent = Config.Rewards.CodeUser
	if Player ~= nil then
		Player.Functions.AddMoney("bank", rent, 'referrals reward')
    TriggerClientEvent('QBCore:Notify', src, "You've received your referral rewards!")
  end
end)

QBCore.Commands.Add("referrals", "Check your Pending Referral Points", {}, false, function(src, args)
  local Player = QBCore.Functions.GetPlayer(src)
  local license = Player.PlayerData.license
  local result = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
  
  local refMenu = {}

  if result[1] then
    refMenu = {
      {
          header = "Referrals Management",
          icon = "fa-solid fa-circle-info",
          isMenuHeader = true,
      },
      {
        header = "Your Referral Code",
        icon = "fa-solid fa-list",
        txt = string.upper(result[1].code),
        params = {
        },
        isMenuHeader = true,
      },
      {
          header = "Claim Referrals Rewards",
          icon = "fa-solid fa-list",
          txt = "$"..result[1].pendingrew,
          params = {
              event = "osm-referrals:client:ClaimPendingRew",
              args = {
                pendingrew = result[1].pendingrew
              }
          }
      },
      {
        header = "Leaderboards",
        icon = "fa-solid fa-list",
        txt = "Lets see who has the Max. Reach!",
        params = {
          event = "osm-referrals:client:GetLeaderboardMenu",
        }
    },
  }
  end
  
  TriggerClientEvent("osm-referrals:openRefMenu", src, refMenu)
end)

RegisterServerEvent("osm-referrals:Server:ReturnToMainMenu", function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local license = Player.PlayerData.license
  local result = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
  
  local refMenu = {}

  if result[1] then
    refMenu = {
      {
          header = "Referrals Management",
          icon = "fa-solid fa-circle-info",
          isMenuHeader = true,
      },
      {
        header = "Your Referral Code",
        icon = "fa-solid fa-list",
        txt = string.upper(result[1].code),
        isMenuHeader = true,
        params = {
        }

      },
      {
          header = "Claim Referrals Rewards",
          icon = "fa-solid fa-list",
          txt = "$"..result[1].pendingrew,
          params = {
              event = "osm-referrals:client:ClaimPendingRew",
              args = {
                pendingrew = result[1].pendingrew
              }
          }
      },
      {
        header = "Leaderboards",
        icon = "fa-solid fa-list",
        txt = "Lets see who has the Max. Reach!",
        params = {
          event = "osm-referrals:client:GetLeaderboardMenu",
        }
    },
  }
  end
  
  TriggerClientEvent("osm-referrals:openRefMenu", src, refMenu)
end)

RegisterServerEvent('osm-referrals:Server:ClaimPendingRew')
AddEventHandler('osm-referrals:Server:ClaimPendingRew', function(data)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local license = Player.PlayerData.license
  local name = Player.PlayerData.name
  local result = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
  if result[1] then
    if result[1].pendingrew == data.pendingrew and result[1].pendingrew > 0 then
      TriggerClientEvent('QBCore:Notify', src, "Your Referral Payout is $"..result[1].pendingrew, "success")
      Player.Functions.AddMoney("bank", result[1].pendingrew, 'added-referral-reward')
      MySQL.Async.insert("UPDATE `osmreferral` SET pendingrew = ? WHERE `license` = ?", {0, license} )
      local connect = {
        {
          ["color"] = "5814783",
          ["title"] = "Rewards Payout",
          ["description"] = "Rewards Payout Initiated from your Server\n\n**License** `"..license.."`\n**Name** - `"..name.."`\n\n**AMOUNT** - `$"..result[1].pendingrew.."`",
          ["footer"] = {
            ["text"] = "OSM-REFERRALS | discord.io/osmfx | https://osmfx.tebex.io/",
          },
        }
      }
      if DISCORD_WEBHOOK ~= "" then 
        PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "OsmReferrals User Logs",  avatar_url = "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/error-512.png", embeds = connect}), { ['Content-Type'] = 'application/json' })
      end
    else
      TriggerClientEvent('QBCore:Notify', src, "You Seem to have No Referral Points!", "error")
    end
  end
end)

RegisterServerEvent('osm-referrals:Server:GetLeaderboardMenu')
AddEventHandler('osm-referrals:Server:GetLeaderboardMenu', function()

  local src = source

  local leadersTable = {}
  local resultAll = MySQL.query.await('SELECT * FROM osmreferral')

  for k, v in pairs(resultAll) do
    if v.uses ~= 0 then 
      table.insert(leadersTable, v)
      table.sort(leadersTable, function(a, b) return a.uses > b.uses end)
    end
  end

  refMenu = {
    {
        header = "Referrals Leaderboard",
        icon = "fa-solid fa-circle-info",
        isMenuHeader = true,
    },
  }

  for k,v in ipairs(leadersTable) do
    if k < 6 then 
      refMenu[#refMenu+1] = {
        header = k..". "..v.name,
        icon = "fa-solid fa-list",
        txt = v.uses.." Referrals",
      }
    else
      break
    end
  end
  
  refMenu[#refMenu+1] = {
    header = "Return to Main Menu",
    icon = "fa-solid fa-list", 
    txt = "",
    params = {
      event = "osm-referrals:client:ReturnToMainMenu",
    }
  }
  TriggerClientEvent("osm-referrals:openRefMenu", src, refMenu)
end)

RegisterServerEvent('osm-referrals:Server:CheckCode')
AddEventHandler('osm-referrals:Server:CheckCode', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local license = Player.PlayerData.license
  local name = Player.PlayerData.name
  local cid = Player.PlayerData.citizenid

  if license ~= nil and Player ~= nil then 
    local result = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
    if result[1] then
      local result2 = MySQL.query.await('SELECT * FROM osmreferral WHERE license = ?', {license})
        if result[1].redeemed and result[1].timeplayed and result[1].timeplayed <= Config.WaitTime then 
          timePlayed[src] = {time = result[1].timeplayed, session = os.time(), code = result[1].usedcode} 
          local result2 = MySQL.query.await('SELECT * FROM osmreferral WHERE code = ?', {result[1].usedcode})
          TriggerClientEvent('osm-referrals:StartWaiting', src, result2[1]) end
        return
    else
      local length = -(Config.CodeLength)
      local code = string.sub(license, length)
      local code = code:upper()
      local name = Player.PlayerData.name
      MySQL.Async.insert("INSERT INTO `osmreferral` (`cid`, `license`, `name`, `code`, `uses`, `pendingrew`, `redeemed`, `timeplayed`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      {cid, license, name, code, 0, 0, 0, 0})
      timePlayed[src] = {time = 0, session = os.time()}
    end
  end
end)

AddEventHandler('playerDropped', function(reason)
  local src = source
  if not timePlayed[src] then return end
  local license = GetPlayerIdentifierByType(src, "license2")
  local session = os.time() - (timePlayed[src].session)
  local minutes = math.floor(session / 60)
  MySQL.Async.insert("UPDATE `osmreferral` SET timeplayed = ? WHERE `license` = ?", {timePlayed[src].time + minutes, license})
end)