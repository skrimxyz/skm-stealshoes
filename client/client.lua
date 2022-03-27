local QBCore = exports['qb-core']:GetCoreObject()

local function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

local GiveShoe = function()
    TriggerServerEvent("QBCore:Server:AddItem", "weapon_shoe", 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["weapon_shoe"], "add")
end

RegisterNetEvent('skm-stealshoes:client:stealshoes')
AddEventHandler('skm-stealshoes:client:stealshoes', function()
    local player, distance = GetClosestPlayer(playerId)
    local retval = GetPedDrawableVariation(playerPed, 6)
    local playerPed = GetPlayerPed(player)
      if player ~= -1 and distance < 2.5 and retval ~= nil and IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_base", 3) then
        local playerId = GetPlayerServerId(player)
        QBCore.Functions.GetPlayerData(function(PlayerData)
                TriggerServerEvent("skm-stealshoes:server:stealshoes", playerId)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
                Wait(1000)
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                GiveShoe()
        end)
    else
    end
end)

RegisterNetEvent('skm-stealshoes:client:stealshoesc')
AddEventHandler('skm-stealshoes:client:stealshoesc', function()
    SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
end)
