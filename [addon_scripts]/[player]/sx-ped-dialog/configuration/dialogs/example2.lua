local farmerDialogFlow = function (create, close)
  create({
    message = "Hey there, I'm Gl1tch, a hacker. Looking to buy some top notch software?",
    buttons = {
      { text = 'I\'d like to purchase something', action = 'buy' },
      { text = 'Close', action = 'close' },
    },
    typeWriter = {
      duration = 1000,
      disableButtons = false,
    }
  }, function(action)
    if action == 'buy' then
      create({
        message = "I've got all sorts of software for sale, just let me know what you need!",
        buttons = {
          { text = 'Malicious Code', action = 'buy-maliciouscode-1' },
          { text = 'White Keycard', action = 'buy-whitekeycard-1' },
          { text = 'Black Keycard', action = 'buy-blackkeycard-1' },
          { text = 'Yellow Keycard', action = 'buy-yellowkeycard-1' },
          { text = 'Red Keycard', action = 'buy-redkeycard-1' },
          { text = 'Purple Keycard', action = 'buy-purplekeycard-1' },
          { text = 'Not interested', action = 'close' },
        },
        typeWriter = {
          enabled = true,
          duration = 1000,
          disableButtons = false,
        }
      }, function(action2)
        if action2 ~= 'close' then
          if action2 == 'buy-maliciouscode-1' then
            create({
              message = "Are you sure you want to buy Malicious Code? It will cost you 50 QBit.",
              buttons = {
                { text = 'Yes', action = 'confirm' },
                { text = 'No Thanks', action = 'close' },
              },
              typeWriter = {
                enabled = true,
                duration = 1000,
                disableButtons = false,
              }
            }, function(action3)
              if action3 ~= 'close' then
                local _, item, count = string.strsplit('-', action2)
                TriggerServerEvent('sx-hackerexchange:giveItem', item, count)
              end
              create({
                message = "Pleasure doing business with you!",
                buttons = {
                  { text = 'Close', action = 'close' },
                },
                typeWriter = {
                  duration = 1000,
                  disableButtons = false,
                }
              }, function(action4)

              end)
            end)
          elseif action2 == 'buy-whitekeycard-1' then
            create({
              message = "Are you sure you want to buy a White Key Card? It will cost you 100 QBit and a white USB.",
              buttons = {
                { text = 'Yes', action = 'confirm' },
                { text = 'No Thanks', action = 'close' },
              },
              typeWriter = {
                enabled = true,
                duration = 1000,
                disableButtons = false,
              }
            }, function(action3)
              if action3 ~= 'close' then
                local _, item, count = string.strsplit('-', action2)
                TriggerServerEvent('sx-hackerexchange:giveItem', item, count)
              end
              create({
                message = "Pleasure doing business with you!",
                buttons = {
                  { text = 'Close', action = 'close' },
                },
                typeWriter = {
                  duration = 1000,
                  disableButtons = false,
                }
              }, function(action4)

              end)
            end)
          elseif action2 == 'buy-blackkeycard-1' then
            create({
              message = "Are you sure you want to buy a Black Key Card? It will cost you 500 QBit and a black USB.",
              buttons = {
                { text = 'Yes', action = 'confirm' },
                { text = 'No Thanks', action = 'close' },
              },
              typeWriter = {
                enabled = true,
                duration = 1000,
                disableButtons = false,
              }
            }, function(action3)
              if action3 ~= 'close' then
                local _, item, count = string.strsplit('-', action2)
                TriggerServerEvent('sx-hackerexchange:giveItem', item, count)
              end
              create({
                message = "Pleasure doing business with you!",
                buttons = {
                  { text = 'Close', action = 'close' },
                },
                typeWriter = {
                  duration = 1000,
                  disableButtons = false,
                }
              }, function(action4)

              end)
            end)
          elseif action2 == 'buy-yellowkeycard-1' then
            create({
              message = "Are you sure you want to buy a Yellow Key Card? It will cost you 300 QBit and a yellow USB.",
              buttons = {
                { text = 'Yes', action = 'confirm' },
                { text = 'No Thanks', action = 'close' },
              },
              typeWriter = {
                enabled = true,
                duration = 1000,
                disableButtons = false,
              }
            }, function(action3)
              if action3 ~= 'close' then
                local _, item, count = string.strsplit('-', action2)
                TriggerServerEvent('sx-hackerexchange:giveItem', item, count)
              end
              create({
                message = "Pleasure doing business with you!",
                buttons = {
                  { text = 'Close', action = 'close' },
                },
                typeWriter = {
                  duration = 1000,
                  disableButtons = false,
                }
              }, function(action4)

              end)
            end)
          elseif action2 == 'buy-redkeycard-1' then
            create({
              message = "Are you sure you want to buy a Red Key Card? It will cost you 400 QBit and a red USB.",
              buttons = {
                { text = 'Yes', action = 'confirm' },
                { text = 'No Thanks', action = 'close' },
              },
              typeWriter = {
                enabled = true,
                duration = 1000,
                disableButtons = false,
              }
            }, function(action3)
              if action3 ~= 'close' then
                local _, item, count = string.strsplit('-', action2)
                TriggerServerEvent('sx-hackerexchange:giveItem', item, count)
              end
              create({
                message = "Pleasure doing business with you!",
                buttons = {
                  { text = 'Close', action = 'close' },
                },
                typeWriter = {
                  duration = 1000,
                  disableButtons = false,
                }
              }, function(action4)

              end)
            end)
          elseif action2 == 'buy-purplekeycard-1' then
            create({
              message = "Are you sure you want to buy a Purple Key Card? It will cost you 250 QBit and a purple USB.",
              buttons = {
                { text = 'Yes', action = 'confirm' },
                { text = 'No Thanks', action = 'close' },
              },
              typeWriter = {
                enabled = true,
                duration = 1000,
                disableButtons = false,
              }
            }, function(action3)
              if action3 ~= 'close' then
                local _, item, count = string.strsplit('-', action2)
                TriggerServerEvent('sx-hackerexchange:giveItem', item, count)
              end
              create({
                message = "Pleasure doing business with you!",
                buttons = {
                  { text = 'Close', action = 'close' },
                },
                typeWriter = {
                  duration = 1000,
                  disableButtons = false,
                }
              }, function(action4)

              end)
            end)
          end
        end
      end)
    end
  end)
end

Citizen.CreateThread(function ()
  CreatePedDialog({
    ped_model = 'hc_hacker',
    ped_name = 'Gl1tch',
    ped_group = 'Hacker',
    interaction  = {
      useKeyInteraction = true,
      showLabelOverHead = false,
      distCanInteract = 1.5,
      distShowLabel = 5.0,
      textOverHead = 'Gl1tch [~p~Hacker~w~]',
      interactionText = 'Press  ~INPUT_CONTEXT~to talk to ~p~Gl1tch~s~',
    },
    cam = {
      enabled = true,
      offset = vector3(0.0, 1.2, 1.0),
      pointZOffset = 0.4,
    },
    pos = {
      coords = vector3(-251.5116, -2210.2249, 9.0587),
      heading = 326.0920
    },
    -- blip = {
    --   -- sprite = 1,
    --   -- color = 1,
    --   -- scale = 0.6,
    --   -- name = 'Gl1tch | Hacker',
    --   -- shortRange = true
    -- },
    animations = {
      idleAnim = {
        -- dict = 'misscarsteal4@actor',
        -- name = 'actor_berating_loop',
        scenario = 'WORLD_HUMAN_SMOKING'
      },
      openAnim = {
        dict = 'random@street_race',
        name = '_car_b_lookout',
        duration = 9000,
      },
      -- closeAnim = {
      --   dict = 'amb@world_human_hang_out_street@male_b@base',
      --   name = 'base',
      --   duration = 5000,
      -- },
    },
    dialog = farmerDialogFlow,
  }, function(data)
    -- print('Ped dialog created with data: ', data.id, data.ped)
  end)
end)