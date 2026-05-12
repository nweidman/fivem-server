local lastTextUiText = ''

--- @param state boolean   -- true to show, false to hide. 
function SetHudVisibility(state)
    DisplayHud(state)
    DisplayRadar(state)
    if Cfg.Hud == 'none' then return end

    lastTextUiText = DrawTextUI(state and 'show' or 'hide', lastTextUiText)

    if Cfg.hud == 'cd_carhud' then
        TriggerEvent('cd_carhud:ToggleHud')

    elseif Cfg.Hud == 'cd_playerhud' then
        local s = state and 'open' or 'close'
        TriggerEvent('cd_playerhud:OpenWatchUI', s)

    elseif Cfg.Hud == 'Codem-BlackHUDV2' then
        TriggerEvent('codem-blackhudv2:SetForceHide', not state, not state)

    elseif Cfg.Hud == 'esx_hud' then
        TriggerEvent('esx_hud:HudToggle', state)

    elseif Cfg.Hud == 'izzy-hudv5' then
        exports['izzy-hudv5']:setDisplay(state)

    elseif Cfg.Hud == 'izzy-hudv6' then
        exports['izzy-hudv6']:setDisplay(state)

    elseif Cfg.Hud == 'izzy-hudv7' then
        if state then
            TriggerEvent('izzy-hud:client:showHUD')
        else
            TriggerEvent('izzy-hud:client:hideHUD')
        end

    elseif Cfg.hud == 'jg-hud' then
        exports['jg-hud']:toggleHud(state)

    elseif Cfg.Hud == 'mHud' then
        if state then
            TriggerEvent('mHud:ShowHud')
        else
            TriggerEvent('mHud:HideHud')
        end

    elseif Cfg.Hud == 'tgiann-lumihud' then
        TriggerEvent('tgiann-lumihud:ui', state)

    elseif Cfg.Hud == 'vms_hud' then
        exports['vms_hud']:Display(state)

    elseif Cfg.Hud == 'wais-hudv6' then
        exports["wais-hudv6"]:showRadar(state)

    elseif Cfg.Hud == '0r-hud-v3' then
        exports['0r-hud-v3']:ToggleVisible(state)

    elseif Cfg.Hud == '17mov_Hud' then
        TriggerEvent('17mov_Hud:ToggleDisplay', state)

    elseif Cfg.Hud == 'other' then
        -- Hide your hud here.
    end
end