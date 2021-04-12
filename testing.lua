local db = true
script.Parent.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") ~= nil then
		if db == true then
			db = false
			script.Parent.Transparency = 1
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			player.leaderstats.Crystals.Value = player.leaderstats.Crystals.Value + 1
			script.Sound:Play()
			wait(1)
			script.Parent:Remove()
		end
	end	
end)
