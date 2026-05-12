-- exports.lua

-- Get weapon recoil
exports('GetWeaponRecoil', function(weaponHash)
    return GetWeaponRecoil_internal(weaponHash)
end)

-- Set weapon recoil for a specific weapon
exports('SetWeaponRecoil', function(weaponHash, recoilSettings)
    SetWeaponRecoil_internal(weaponHash, recoilSettings)
end)

-- Reset specific weapon recoil to config default
exports('ResetWeaponRecoil', function(weaponHash)
    ResetWeaponRecoil_internal(weaponHash)
end)

-- Multiply general recoil
exports('MultiplyGeneralRecoil', function(multiplier)
    MultiplyGeneralRecoil_internal(multiplier)
end)

-- Reset general recoil multiplication
exports('ResetGeneralRecoil', function()
    ResetGeneralRecoil_internal()
end)

-- Get general recoil multiplication data
exports('GetGeneralRecoilData', function()
    return GetGeneralRecoilData_internal()
end)

exports('GetWeaponTemperature', function(weaponHash)
    return GetWeaponTemperature_internal(weaponHash)
end)

-- Set weapon temperature
exports('SetWeaponTemperature', function(weaponHash, temperature)
    SetWeaponTemperature_internal(weaponHash, temperature)
end)

-- Reset weapon temperature
exports('ResetWeaponTemperature', function(weaponHash)
    ResetWeaponTemperature_internal(weaponHash)
end)

-- Get weapon overheat threshold
exports('GetWeaponOverheatThreshold', function(weaponHash)
    return GetWeaponOverheatThreshold_internal(weaponHash)
end)

-- Set weapon overheat threshold
exports('SetWeaponOverheatThreshold', function(weaponHash, threshold)
    SetWeaponOverheatThreshold_internal(weaponHash, threshold)
end)

-- Check if weapon is overheated
exports('IsWeaponOverheated', function(weaponHash)
    return IsWeaponOverheated_internal(weaponHash)
end)

exports('ResetWeaponOverheatThreshold', function(weaponHash)
    ResetWeaponOverheatThreshold_internal(weaponHash)
end)

-- Get weapon smoke level
exports('GetWeaponSmokeLevel', function(weaponHash)
    return GetWeaponSmokeLevel_internal(weaponHash)
end)

-- Toggle jump spam prevention
exports('ToggleJumpSpamPrevention', function(enabled)
    ToggleJumpSpamPrevention_internal(enabled)
end)

-- Set time between allowed jumps
exports('SetJumpSpamPreventionTime', function(time)
    SetJumpSpamPreventionTime_internal(time)
end)

-- Get jump spam prevention status
exports('GetJumpSpamPreventionStatus', function()
    return GetJumpSpamPreventionStatus_internal()
end)

-- Toggle roll prevention
exports('ToggleRollPrevention', function(enabled)
    ToggleRollPrevention_internal(enabled)
end)

-- Get roll prevention status
exports('GetRollPreventionStatus', function()
    return GetRollPreventionStatus_internal()
end)

exports('GetCrosshairSettings', function()
    return GetCrosshairSettings_internal()
end)

-- Set crosshair settings
exports('SetCrosshairSettings', function(settings)
    SetCrosshairSettings_internal(settings)
end)

-- Reset crosshair settings to default
exports('ResetCrosshairSettings', function()
    ResetCrosshairSettings_internal()
end)

-- Get crosshair presets
exports('GetCrosshairPresets', function()
    return GetCrosshairPresets_internal()
end)

-- Set crosshair preset
exports('SetCrosshairPreset', function(presetName)
    return SetCrosshairPreset_internal(presetName)
end)

-- Toggle crosshair visibility
exports('ToggleCrosshair', function(enabled)
    ToggleCrosshair_internal(enabled)
end)

exports('OpenCrosshairEditor', function()
    OpenCrosshairEditor_internal()
end)

exports('CopyCrosshair', function(targetPlayerId)
    CopyCrosshair_internal(targetPlayerId)
end)

exports('ResetCrosshairToDefault', function()
    ResetCrosshairToDefault_internal()
end)

-- Weapon Damage
exports('SetWeaponDamage', function(weaponName, damageMultiplier)
    SetWeaponDamage_internal(weaponName, damageMultiplier)
end)

exports('GetWeaponDamage', function(weaponName)
    return GetWeaponDamage_internal(weaponName)
end)

exports('ResetWeaponDamage', function(weaponName)
    ResetWeaponDamage_internal(weaponName)
end)

-- Remove Whipping
exports('ToggleRemoveWhipping', function(enabled)
    ToggleRemoveWhipping_internal(enabled)
end)

exports('GetRemoveWhippingStatus', function()
    return GetRemoveWhippingStatus_internal()
end)

-- Melee One-Shot Prevention
exports('ToggleMeleeOneShotPrevention', function(enabled)
    ToggleMeleeOneShotPrevention_internal(enabled)
end)

exports('GetMeleeOneShotPreventionStatus', function()
    return GetMeleeOneShotPreventionStatus_internal()
end)

-- Triggerbot
exports('ToggleTriggerBot', function(enabled)
    ToggleTriggerBot_internal(enabled)
end)

exports('SetTriggerBotMaxRange', function(range)
    SetTriggerBotMaxRange_internal(range)
end)

exports('SetTriggerBotRefreshRate', function(rate)
    SetTriggerBotRefreshRate_internal(rate)
end)

exports('GetTriggerBotStatus', function()
    return GetTriggerBotStatus_internal()
end)

exports('ToggleHeadshotRemoval', function(enabled)
    ToggleHeadshotRemoval_internal(enabled)
end)

exports('GetHeadshotRemovalStatus', function()
    return GetHeadshotRemovalStatus_internal()
end)