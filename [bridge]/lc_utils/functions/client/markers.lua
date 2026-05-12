Utils.Markers = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- Markers
-----------------------------------------------------------------------------------------------------------------------------------------
function Utils.Markers.drawMarker(marker_type, x, y, z, scale, r, g, b, a)
    scale = scale or 0.3
    r = r or 166 
    g = g or 113
    b = b or 254
    a = a or 180

    -- use chevron and flip it so it points DOWN
    marker_type = marker_type or 2 -- 2 = thick chevron up
    local rotX, rotY, rotZ = 180.0, 0.0, 0.0
    if marker_type == 39 then rotX = 0 end
    -- place it right on the coord (no -0.6 sink)
    DrawMarker(
        marker_type,
        x, y, z,
        0.0, 0.0, 0.0,
        rotX, rotY, rotZ,
        scale, scale, scale,
        r, g, b, a,
        false,   -- bobUpAndDown
        false,   -- faceCamera
        0,       -- p19
        true,    -- rotate
        nil, nil,
        false
    )
end

function Utils.Markers.drawText3D(x,y,z, text)
    if Config.marker_style == 1 then
        local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)
        local px,py,pz = table.unpack(GetFinalRenderedCamCoord())
        local dist = #(vector3(px,py,pz) - vector3(x,y,z))
        local fov = (1/GetGameplayCamFov())*100
        local scale = fov*(1/dist)*2
        if onScreen then
            SetTextScale(0.0*scale, 0.35*scale)
            SetTextFont(0)
            SetTextProportional(true)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextCentre(true)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandDisplayText(_x,_y)
        end
    else
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(true)
        SetTextColour(255, 255, 255, 215)
        BeginTextCommandDisplayText("STRING")
        SetTextCentre(true)
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(x,y,z, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        local factor = string.len(text) / 370
        DrawRect(0.0, 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
        ClearDrawOrigin()
    end
end

function Utils.Markers.drawText2D(text,font,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x,y)
end

-- call with our arrow by default (no cylinder)
function Utils.Markers.createMarkerInCoords(location_id, x, y, z, marker_text, onControlIsPressedCallback, callbackData, distance)
    distance = distance or #(GetEntityCoords(PlayerPedId()) - vector3(x,y,z))

    -- lift the arrow slightly so its tip points at your spot
    Utils.Markers.drawMarker(2, x, y, z + -0.25)   -- 2 = chevron, rotated to DOWN inside drawMarker

    if distance <= 1.0 then
        Utils.Markers.drawText3D(x, y, z + 0.1, marker_text)
        if IsControlJustPressed(0, 38) then
            onControlIsPressedCallback(location_id, callbackData)
        end
    end
end

function Utils.Markers.showHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry('lcutilsHelpNotification', msg)
    if thisFrame then
        DisplayHelpTextThisFrame('lcutilsHelpNotification', false)
    else
        if beep == nil then beep = true end
        BeginTextCommandDisplayHelp('lcutilsHelpNotification')
        EndTextCommandDisplayHelp(0, false, beep, duration or -1)
    end
end
