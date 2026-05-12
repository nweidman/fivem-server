RegisterNetEvent("prp-policeutils:client:flashExp", function(grenadeCoords, weaponName)
    local src = source
    Scopes.TriggerScopeEvent("prp-policeutils:client:flashExplode", src, grenadeCoords, nil, weaponName)
end)