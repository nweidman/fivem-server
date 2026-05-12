-- REPORTS
-- @param reportId: number
-- @param reportTitle: string
-- @param playerId: number - the player who created the report
function api_onReportCreate(reportId, reportTitle, playerId)

end

-- @param reportId: number
-- @param playerId: number - the player who closed the report
function api_onReportClose(reportId, playerId)

end

-- @param reportId: number
-- @param adminId: number - the admin who opened the report
function api_onReportAdminJoin(reportId, adminId)

end

-- @param reportId: number
-- @param adminId: number - the admin who left the report
function api_onReportAdminLeave(reportId, adminId)

end

-- @param reportId: number
-- @param adminId: number - the admin who added the player to the report
-- @param playerId: number - the player who has been added to the report
function api_onReportPlayerAdded(reportId, adminId, playerId)

end

-- @param reportId: number
-- @param adminId: number - the player who removed the player from the report
-- @param playerId: number - the player who has been removed from the report
function api_onReportPlayerRemoved(reportId, adminId, playerId)

end

-- @param reportId: number
-- @param playerId: number - the player who changed the title
-- @param newTitle: string
function api_onReportTitleChange(reportId, playerId, newTitle)

end

-- @param reportId: number
-- @param adminid: number - the admin who changed the report to in resolve state
function api_onReportInResolveChange(reportId, adminId)

end

-- REPORT MESSAGES
-- @param reportId: number
-- @param playerId: number
-- @param message: string
-- @param imageUrl: string | nil
-- @param parentMessageId: number | nil
function api_onReportMessageAdd(reportId, playerId, message, imageUrl, parentMessageId)

end

-- @param reportId: number
-- @param adminId: number
-- @param messageId: number
function api_onReportMessageHide(reportId, adminId, messageId)

end

-- Called when admin reveal the hidden message in chat
-- @param reportId: number
-- @param adminId: number
-- @param messageId: number
function api_onReportMessageShow(reportId, adminId, messageId)

end

-- ADMIN CHAT
-- @param adminId: number
-- @param message: string
function api_onAdminChatMessageAdd(adminId, message)

end