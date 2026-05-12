
fx_version 'cerulean'
games { 'gta5' }

author 'Nomad'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'client/utils/shared.lua',
    'client/audio/disable_sound.lua',
    'client/player/hair_toggle.lua',
    'client/weapons/paintball.lua',
    'client/vehicle/flip_vehicle.lua',
    'client/vehicle/door_commands.lua',
    'client/vehicle/seat_command.lua',
    'client/vehicle/jim_mechanic_check.lua',
    'client/vehicle/air_control.lua',
    'client/vehicle/keep_door_open.lua',
    'client/player/piggyback_client.lua',
    'client/player/sticky_hat.lua',
    'client/audio/disable_radio.lua',
    'client/vehicle/speed_limiter.lua',
    'client/freecam/freecam.lua',
    'config.lua',
}

server_script {
   'server/main.lua',
   'server/backpack.lua',
}

lua54 'yes'
