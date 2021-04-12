local DataStoreService = game:GetService("DataStoreService")
local MyDataStore = DataStoreService:GetDataStore('MyDataStore')

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = 'leaderstats'

	local currency = Instance.new("IntValue", leaderstats)
	currency.Name = 'Crystals' 
	currency.Value = 0 

	local PlayerCrystalId = 'Crystals_'..player.UserId
	local CrystalData

	local s, err = pcall(function()
		CrystalData = MyDataStore:GetAsync(PlayerCrystalId)
	end)

	if s then
		currency.Value  = CrystalData
	else
		warn(err)
	end

end)

game.Players.PlayerRemoving:Connect(function(player)

	local PlayerCrystalId = 'Crystals_'..player.UserId

	local s, err = pcall(function()
		MyDataStore:SetAsync(PlayerCrystalId, player.leaderstats.Crystals.Value)
	end)

	if s then
		print('Stored all Player Data')
	else
		warn(err)
	end
end)
