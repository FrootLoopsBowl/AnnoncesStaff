ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function Scaleform(title, text, sec)
	local scaleform = RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
	PushScaleformMovieMethodParameterString("~r~"..title)
	PushScaleformMovieMethodParameterString(text)
	EndScaleformMovieMethod()

	while sec > 0 do
		Citizen.Wait(1)
		sec = sec - 0.01

		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
	end

	SetScaleformMovieAsNoLongerNeeded(scaleform)
end

RegisterCommand("annonces", function(source, args, rawCommand)
    if (ESX.GetPlayerData()['group'] ~= "user") then
        local text = args[1]
        Scaleform("Annonces", text, 5)
    end
end, false)
