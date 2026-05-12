CFunctions = {
  -- Keep in mind this is called every frame, don`t add heavy logic here.
  DrawTextEveryTick = function (text, coords)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(2, false, false, 0)
    SetFloatingHelpTextStyle(1, 1, 2, 191, 3, 0)
    SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z + 1.0)
  end,
  ShowText = function (text, coords)
    -- Add your logic here
  end,
  HideText = function ()
    -- Add your logic here
  end,
}