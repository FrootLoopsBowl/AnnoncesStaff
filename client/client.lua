function Scaleform(title, text, sec)
	local scaleform = RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	BeginScaleformMovieMethod(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
	PushScaleformMovieMethodParameterString(Config.Color..title)
	PushScaleformMovieMethodParameterString(text)
	EndScaleformMovieMethod()

	while sec > 0 do
		Citizen.Wait(1)
		sec = sec - 0.01

		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
	end

	SetScaleformMovieAsNoLongerNeeded(scaleform)
end

RegisterNetEvent("Froot:Scaleform")
AddEventHandler("Froot:Scaleform", function(text)
	Scaleform(Config.Title, text, Config.Time)
end)
