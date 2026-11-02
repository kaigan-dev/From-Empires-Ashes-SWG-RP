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
		{-40.6, 2.5, 2214, 279, 0,{"none"}},
		{-40.6, 2.3, 2216.1, 184, 0,{"social"}},
		{-41, 1.7, 2239.8, 131, 0,{"none"}},
		{-40.9, 1.7, 2237.2, 74, 0,{"social"}},
		{-38.5, 1.5, 2239.9, 173, 0,{"none"}},
		{-36.8, 1.4, 2238.7, 246, 0,{"social"}},
		{-73.3, 4.6, 2212.6, 285, 0,{"none"}},
		{-72.4, 4.5, 2218.2, 240, 0,{"social"}},
		{-84.3, 7.5, 2180.9, 94, 0,{"sit"}},
		{-82.4, 6.5, 2179.7, 285, 0,{"social"}},
		{-82.3, 6.4, 2181.5, 287, 0,{"none"}},
		{-8.9, 2.3, 2194.8, 292, 0,{"none"}},
		{-10.9, 2.5, 2195.6, 103, 0,{"social"}},
		{-8.4, 2.3, 2194, 351, 0,{"none"}},
		{-42.4, 6.4, 2162.2, 5, 0,{"none"}},
		{-42.9, 6, 2164.6, 159, 0,{"social"}},
		{-74.6, 7, 2189.6, 34, 0,{"none"}},
		{-73.8, 7, 2191.3, 164, 0,{"social"}},

	}

	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dantooine", waypointList, self.walkpointList, "dantooine", "dantooine")
end

function DantooineTaikahaScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_dantooine", "object/tangible/terminal/terminal_travel_rp.iff", -75.9, 2.6, 2269, 0, math.rad(90))
end

function DantooineTaikahaScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization

	local pNpc
 pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -28.1, 7, 2098.3, 166, 0, "rp_human_male", "faction/pentastar/trooper_a", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("PE-647")
	 pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -29.3, 6.9, 2099, 94, 0, "rp_human_male", "faction/pentastar/trooper_a", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("PE-258")
	 pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -2.6, 1.2, 2115.2, 123, 0, "rp_human_male", "faction/pentastar/trooper_a", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("PE-862")
	 pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 18.3, 2.1, 2184, 167, 0, "rp_human_male", "faction/pentastar/trooper_a", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("PE-311")
	 pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -51.6, 1.4, 2292.5, 326, 0, "rp_human_male", "faction/pentastar/trooper_a", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("PE-763")
	 pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -75.7, 1.9, 2283.6, 2, 0, "rp_human_male", "faction/pentastar/trooper_a", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("PE-647")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -78.6, 1.8, 2284, 6, 0, "naboo_stonewall_labs_battledroid_blue", "battledroid", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Pentastar Battledroid")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -73.1, 1.9, 2281.9, 354, 0, "naboo_stonewall_labs_battledroid_blue", "battledroid", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Pentastar Battledroid")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 42.1, 0.9, 2246.2, 24, 0, "naboo_stonewall_labs_battledroid_blue", "battledroid", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Pentastar Battledroid")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 45, 0.6, 2245.3, 4, 0, "naboo_stonewall_labs_battledroid_blue", "battledroid", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Pentastar Battledroid")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -53, 8.5, 2115.7, 265, 0, "naboo_stonewall_labs_battledroid_blue", "battledroid", "factional/common/trooper", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Pentastar Battledroid")


 	


end