local QBCore = exports['qb-core']:GetCoreObject()

local function GetClosestPlayer() -- interactions, job, tracker
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
    local retval = GetPedDrawableVariation(player, 6)
      if player ~= -1 and distance < 2.5 and retval ~= nil then
        local playerId = GetPlayerServerId(player)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            --if PlayerData.job.name == "police" then
                TriggerServerEvent("skm-stealshoes:server:stealshoes", playerId)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
                Wait(1000)
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                GiveShoe()
            --end
        end)
    else
    QBCore.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('skm-stealshoes:client:stealshoesc')
AddEventHandler('skm-stealshoes:client:stealshoesc', function()
    local ad = "missheist_agency2ahelmet"
    loadAnimDict(ad)
    RequestAnimDict(dict)
    Wait(600)
    ClearPedSecondaryTask(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end
