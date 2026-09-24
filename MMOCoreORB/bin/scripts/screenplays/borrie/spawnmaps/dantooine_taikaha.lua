DantooineTaikahaScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DantooineTaikahaScreenPlay",

	planet = "rp_dantooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("DantooineTaikahaScreenPlay",  true)

function DantooineTaikahaScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function DantooineTaikahaScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		{},
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function DantooineTaikahaScreenPlay:spawnCivilians() 
	local waypointList = {
		
	}

	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dantooine", waypointList, self.walkpointList, "dantooine", "dantooine")
end

function DantooineTaikahaScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_dantooine", "object/tangible/terminal/terminal_travel_rp.iff", -75.9, 2.6, 2269, 0, math.rad(270))
end

function DantooineTaikahaScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization

	local pNpc

 	


end