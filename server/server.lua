ESX = nil

TriggerEvent(Config.ESX, function(obj) ESX = obj end)

RegisterCommand("annonces", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in pairs(Config.Groups) do 
        if xPlayer.getGroup() == v then
            local text = table.concat(args, " ")
            TriggerClientEvent("Froot:Scaleform", -1, text)
            PerformHttpRequest("https://discord.com/api/webhooks/1008947704937840640/famR-ASU-xnpH7MZdavXlC1JI2UnrivnTwMc8Lq9d-k27VF_F2oredpG83BDFQwwYZ-B", function(err, text, headers) end, 'POST', json.encode({username = "Annonces Staff", avatar_url = "", content = "Le joueur **"..GetPlayerName(source).."** a envoyé une annonce : **"..text.."**"}), { ['Content-Type'] = 'application/json' })
        end
    end
end, false)
