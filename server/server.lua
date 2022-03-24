local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('skm-stealshoes:server:stealshoes')
AddEventHandler('skm-stealshoes:server:stealshoes', function(playerId)
    local MaskedPlayer = QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent("skm-stealshoes:client:stealshoesc", MaskedPlayer.PlayerData.source)
end)
