local coolDowns = {}

local function updateHygiene(newHygiene)
    TriggerServerEvent('hygiene:updateHygiene', newHygiene)
end

local function handleRestroomAction(playerPed, propData)
    if propData.animation then
        TaskStartScenarioInPlace(playerPed, propData.animation, 0, true)
        Wait(5000)  -- Adjust the wait time as needed for the animation
        ClearPedTasks(playerPed)
    end

    if propData.stressRelief then
        -- Example: Reducing stress (adjust as per your system)
        TriggerEvent('myStressSystem:reduceStress', propData.stressRelief)
    end

    if propData.hygieneIncrease then
        TriggerServerEvent('hygiene:getHygiene')  -- Request current hygiene level
        RegisterNetEvent('hygiene:sendHygiene')
        AddEventHandler('hygiene:sendHygiene', function(currentHygiene)
            local newHygiene = math.min(100, currentHygiene + propData.hygieneIncrease)
            updateHygiene(newHygiene)
            exports.ox_lib:notify({
                type = 'success',
                description = 'Hygiene increased by ' .. propData.hygieneIncrease .. '. Current hygiene: ' .. newHygiene .. '%',
            })
        end)
    end

    -- Trigger cooldown
    local playerId = PlayerId()
    coolDowns[playerId] = GetGameTimer() + (propData.coolDown * 1000)
end

local function canInteract(playerPed, prop)
    local playerId = PlayerId()

    if coolDowns[playerId] and GetGameTimer() < coolDowns[playerId] then
        local remainingTime = math.ceil((coolDowns[playerId] - GetGameTimer()) / 1000)
        exports.ox_lib:notify({
            type = 'error',
            description = 'You need to wait ' .. remainingTime .. ' seconds before using this again.',
        })
        return false
    end

    return true
end

Citizen.CreateThread(function()
    for propName, propData in pairs(Config.RestroomProps) do
        exports.ox_target:addModel(propName, {
            options = {
                {
                    name = propName,
                    label = 'Use ' .. propData.action,  -- e.g., Use Restroom
                    icon = 'fas fa-toilet',
                    canInteract = function(entity, distance, coords, name)
                        return canInteract(PlayerPedId(), propName)
                    end,
                    onSelect = function()
                        handleRestroomAction(PlayerPedId(), propData)
                    end,
                },
            },
            distance = 2.0,  -- Interaction distance
        })
    end
end)
