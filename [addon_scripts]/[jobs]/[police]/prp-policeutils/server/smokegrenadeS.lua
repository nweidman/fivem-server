RegisterNetEvent("prp-policeutils:client:smokeExp", function(grenadeCoords, weapon)
    local src = source
    Scopes.TriggerScopeEvent("prp-policeutils:client:smokeExplode", src, grenadeCoords, weapon)
end)