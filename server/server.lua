ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("annonces", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    if xPlayer.getGroup() ~= "user" then
        local text = table.concat(args, " ")
            for i=1, #xPlayers, 1 do
                local xPlayerz = ESX.GetPlayerFromId(xPlayers[i])
                TriggerClientEvent("Froot:Scaleform", xPlayerz, text)
            end
        PerformHttpRequest("https://discord.com/api/webhooks/1079526539047206984/NM4Nf6aQ7xW5dPDTkXQfETmWrMxQ7m09u_kpUwVAkZw0Sw6IRPK_I54a_uKV0RddNmkm", function(err, text, headers) end, 'POST', json.encode({username = "Annonces Staff", avatar_url = "", content = "Le joueur **"..GetPlayerName(source).."** a envoyé une annonce : **"..text.."**"}), { ['Content-Type'] = 'application/json' })
    end
end, false)
