local function getPlayerHygiene(identifier, cb)
    MySQL.Async.fetchScalar('SELECT hygiene_level FROM player_hygiene WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(hygiene)
        if hygiene == nil then
            -- If no entry, insert default hygiene level
            MySQL.Async.execute('INSERT INTO player_hygiene (identifier, hygiene_level) VALUES (@identifier, @hygiene)', {
                ['@identifier'] = identifier,
                ['@hygiene'] = 100
            })
            cb(100)
        else
            cb(hygiene)
        end
    end)
end

local function setPlayerHygiene(identifier, hygiene)
    MySQL.Async.execute('UPDATE player_hygiene SET hygiene_level = @hygiene WHERE identifier = @identifier', {
        ['@identifier'] = identifier,
        ['@hygiene'] = hygiene
    })
end

RegisterServerEvent('hygiene:getHygiene')
AddEventHandler('hygiene:getHygiene', function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    getPlayerHygiene(identifier, function(hygiene)
        TriggerClientEvent('hygiene:sendHygiene', src, hygiene)
    end)
end)

RegisterServerEvent('hygiene:updateHygiene')
AddEventHandler('hygiene:updateHygiene', function(newHygiene)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    setPlayerHygiene(identifier, newHygiene)
end)
