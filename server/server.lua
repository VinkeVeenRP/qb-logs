QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('qb-log:server:CreateLog')
AddEventHandler('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
	local Player = QBCore.Functions.GetPlayer(source)
	local playerid = Player.PlayerData.citizenid
    local EventID = Config.EventID[name] ~= nil and Config.EventID[name] or Config.EventID["default"]
    MySQL.insert('INSERT INTO logs (EventID, Player, Title, Event) VALUES (?, ?, ?)',{EventID, playerid, title, message})
    Citizen.Wait(100)

end)

QBCore.Commands.Add("testwebhook", "Test Your Discord Webhook For Logs (God Only)", {}, false, function(source, args)
    TriggerEvent("qb-log:server:CreateLog", "default", "TestWebhook", "default", "Triggered **a** test webhook :)")
end, "god")