local Escape = Config.Escape.ThirdParty

AddEventHandler('prompt_prison_escape:playerEscaped', function(source)
    if not Escape["prompt_prison_escape_dlc"] then
        return
    end

    local scriptName = Escape and Escape["prompt_prison_escape_dlc"].ScriptName or "prompt_prison_escape"
    local mapName = Escape and Escape["prompt_prison_escape_dlc"].MapName or "prompt_prison_escape_dlc"
    local pathWay = Escape and Escape["prompt_prison_escape_dlc"].PathWay or "TOILETS"

    if GetInvokingResource() ~= scriptName then
        dbg.critical("Prison break: Cannot set a state since %s is not running", scriptName)
        return 
    end

    if not isResourcePresentProvideless(mapName) then
        dbg.critical("Prison break: Cannot set a state since %s is not running!", mapName)
        return 
    end
    
    if not source then
        return
    end

    local prisoner = PrisonService.CheckForAnySentence(source)

    if not prisoner then
        return
    end

    dbg.debug('Player (%s) has escaped from prison via %s, setting his escape state now. (%s)', GetPlayerName(source), pathWay, scriptName)

    PrisonService.SetPrisonerEscapeState(source, true, {
        path = pathWay,
        script = scriptName
    })
end)

AddEventHandler('rcore_prison:server:playerUnloaded', function(playerId)
    local prisonerData = PrisonService.getPlayer(playerId)

    if not prisonerData then
        return
    end

    if prisonerData and prisonerData.jailbreak and prisonerData.jailbreak.state then
        dbg.debug("Player named %s was prisoner which escaped, removing jail state for him since he logout.", prisonerData.name)
        PrisonService.Unjail(playerId, false, true)
    end
end)