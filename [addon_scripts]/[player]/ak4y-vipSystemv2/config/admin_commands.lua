if Settings.Framework == "qb" then   
    lib.addCommand('', {
        help = 'Add Donate Credit (Admin Only)',
        params = { { name = 'id', type = 'number', help = 'ID of player', optional = false },
                    { name = 'amount', type = 'number', help = 'Amount of to add', optional = false} },
        restricted = 'group.mod'
    }, function(source, args)
        if args.id and args.amount then
            addCredit(args.id, args.amount)
            local XPlayer = exports.qbx_core:GetPlayer(tonumber(args.id))
            local Player = exports.qbx_core:GetPlayer(source)
            local totalCredits = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..XPlayer.PlayerData.citizenid.."'")[1].coinAmount
            SendToDiscord2("Add Credits","\n**__PLAYER__**\n**Name: **".. XPlayer.PlayerData.name .."\n**Character Name: **"..XPlayer.PlayerData.charinfo.firstname.." "..XPlayer.PlayerData.charinfo.lastname.."\n**CitizenID: **"..XPlayer.PlayerData.citizenid.."\n**License: **"..XPlayer.PlayerData.license.."\n\n**__CREDITS__**\n**Added Quantity: **"..args.amount.."\n**New Total Credits: **"..totalCredits.."\n\n**__ADMIN__**\n**Name: **".. Player.PlayerData.name .."\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**Citizen ID: **"..Player.PlayerData.citizenid.."\n**License: **"..Player.PlayerData.license.."",65280)
        end
    end)
    
    lib.addCommand('', {
        help = 'Remove Donate Credit (Admin Only)',
        params = { { name = 'id', type = 'number', help = 'ID of player', optional = false },
                    { name = 'amount', type = 'number', help = 'Amount of to remove', optional = false} 
                },
        restricted = 'group.mod'
    }, function(source, args)
        if args.id and args.amount then
            removeCredit(args.id, args.amount)
            local XPlayer = exports.qbx_core:GetPlayer(tonumber(args.id))
            local Player = exports.qbx_core:GetPlayer(source)
            local totalCredits = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE citizenid = '"..XPlayer.PlayerData.citizenid.."'")[1].coinAmount
            SendToDiscord2("Remove Credits","\n**__PLAYER__**\n**Name: **".. XPlayer.PlayerData.name .."\n**Character Name: **"..XPlayer.PlayerData.charinfo.firstname.." "..XPlayer.PlayerData.charinfo.lastname.."\n**CitizenID: **"..XPlayer.PlayerData.citizenid.."\n**License: **"..XPlayer.PlayerData.license.."\n\n**__CREDITS__**\n**Removed Quantity: **"..args.amount.."\n**New Total Credits: **"..totalCredits.."\n\n**__ADMIN__**\n**Name: **".. Player.PlayerData.name .."\n**Character Name: **"..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.."\n**Citizen ID: **"..Player.PlayerData.citizenid.."\n**License: **"..Player.PlayerData.license.."",16711680)
        end
    end)
else
    Framework.RegisterCommand('', 'group.mod', function(xPlayer, args, showError)
        addCredit(args.player.source, args.credit)
    end, true, {help = "", validate = true, arguments = {
        {name = 'player', help = "Player Source", type = 'player'},
        {name = 'credit', help = "Credit Count", type = 'number'}
    }})
    
    Framework.RegisterCommand('', 'group.mod', function(xPlayer, args, showError)
        removeCredit(args.player.source, args.credit)
    end, true, {help = "", validate = true, arguments = {
        {name = 'player', help = "Player Source", type = 'player'},
        {name = 'credit', help = "Credit Count", type = 'number'}
    }})
end
