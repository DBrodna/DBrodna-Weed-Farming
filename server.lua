QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent("hell_mushroomfarmer:sell")
AddEventHandler("hell_mushroomfarmer:sell", function()
	  local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local money = math.random(50,100)
    local letcount = math.random(3,5)
    Player.Functions.AddMoney("cash", money)
    TriggerClientEvent('QBCore:Notify', src, 'here is some money for the job $'..money..'& here is a joint for your work too.')
    Player.Functions.AddItem('joint', letcount)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint'], "add")
end)