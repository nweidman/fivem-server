local MS = MissionShared

local isInSellDrugMission = false
local totalSold = 0
local sellDrugsTarget = 50

function startSellingDrugsMission()
    isInSellDrugMission = true
    totalSold = 0
    lib.alertDialog({
        header = TranslateIt('sellDrugsMission_header'),
        content = TranslateIt('sellDrugsMission_desc'),
        centered = true,
        cancel = false,
        labels = { confirm = TranslateIt('sellDrugsMission_Okay') }
    })
end

RegisterNetEvent('op-crime:onDrugSold', function()
    if not isInSellDrugMission then return end
    totalSold = totalSold + 1
    if totalSold >= sellDrugsTarget then
        TriggerServerEvent('op-crime:endMission', "sell_drugs")
        isInSellDrugMission = false
        totalSold = 0
    end
end)

