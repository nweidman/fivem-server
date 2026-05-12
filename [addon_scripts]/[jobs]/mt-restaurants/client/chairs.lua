local sitting = false
local tpCoords = nil

---@param coords vector
---@param chairId string
sitChair = function(coords, chairId)
    if sitting then return end

    local occupied = lib.callback.await('mt-restaurants:server:isChairOccupied', false, chairId)
    if occupied then return end

    TriggerServerEvent('mt-restaurants:server:sitChair', chairId, true)

    tpCoords = GetEntityCoords(cache.ped)
    local currentScenario = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'
    TaskStartScenarioAtPosition(cache.ped, currentScenario, coords.x, coords.y, coords.z, coords.w, 0, true, true)

    sitting = true
    CreateThread(function()
        while sitting do
            Wait(0)
            showTextUI(locale('textui_sit_get_up'), Config.textuiPos)
            if IsControlJustPressed(0, Config.sitsGetUpKey) or (not IsPedUsingScenario(cache.ped, currentScenario)) then
               sitting = false
               hideTextUI()
               ClearPedTasks(cache.ped)
               SetEntityCoords(cache.ped, tpCoords.x, tpCoords.y, tpCoords.z - 0.3, true, false, false, false)
               TriggerServerEvent('mt-restaurants:server:sitChair', chairId, false)
               break
            end
        end
    end)
end