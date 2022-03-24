fx_version 'cerulean'
games { 'gta5' }

author 'skrim'
description 'steeeeeaaaaaaaallll that shhoooeeeeeeee'
version '1.0.0'

client_scripts {
    '/client/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '/server/server.lua',
}

lua54 'yes'
