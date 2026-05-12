-- This function gets triggered when a player finishes cooking meth
-- You could use this to modify the item giving function, add xp, skill level, etc.
function OnCookingFinished(player, methItem, methAmount, metaData)
    exports.kq_link:AddPlayerItem(player, methItem, methAmount, metaData)
end

function OnAbuseDetected(message, player)
    -- This function gets triggered when a player is suspected of cheating (sending fake events or using glitches)
end
