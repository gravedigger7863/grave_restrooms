fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'GraveDigger7863'
description 'Restroom System with ox_target'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',  -- Import ESX
    '@ox_lib/init.lua',           -- Import ox_lib
    'config/*.lua',               -- Load all config files in the config directory
}

server_scripts {
    'server/*.lua'                -- Load all Lua scripts in the server directory
}

client_scripts {
    '@ox_target/client.lua',       -- Load ox_target
    'client/*.lua'                 -- Load all Lua scripts in the client directory
}

dependencies {
    'es_extended',                -- Ensure ESX is loaded
    'ox_lib',                     -- Ensure ox_lib is loaded
    'ox_target',                  -- Ensure ox_target is loaded
}
