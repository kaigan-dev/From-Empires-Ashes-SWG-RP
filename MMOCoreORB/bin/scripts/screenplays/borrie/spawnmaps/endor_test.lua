endor_test = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "endor_test",

	planet = "rp_endor",	
	

	
	walkpointList = {

	}
	
	
}

registerScreenPlay("endor_test",  true)

function endor_test:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end



function endor_test:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		{538.877, -0.25, 223.016, 0, -0.0348994, 0, 0.999391, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end


function endor_test:spawnCivilians() 
	local waypointList = {
		
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		{0, 9, 0, 0, 0,{"none"}},
		{1, 9, 1, 0, 0,{"none"}},
		{2, 9, 2, 0, 0,{"none"}},
		{3, 9, 3, 0, 0,{"none"}},
		{4, 9, 4, 0, 0,{"none"}},
		{5, 9, 5, 0, 0,{"none"}},
		{6.7, 9.0, -25, 27, 0,{"sit"}},
		--{1072.39, 0, 96.3649, 217, 0,{"sit"}},
		--{1073.37, 0, 95.1716, 195, 0,{"sit"}},
		
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_endor", waypointList, self.walkpointList, "endor", "endor")
end



function endor_test:spawnSceneObjects() 
	--Travel Terminals
	
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610008050, 1, 0, 0.332372, 0)
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 610008050, 1, 0, 0, 0)
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 610008050, 1, 0, 0, 0)
	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 20.6, 9.0, 1.9, -125, 0, 0, 0, 0)
	

	
end

function endor_test:spawnMobiles()
	--Species, Equipment, Skills, Customization
	

	
	local pNpc
	
	
	--[[
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 1006.88, 0, 120.202, 88, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 1009.15, 0, 118.872, 0, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 1003.97, 0, 124.102, 128, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 1004.04, 0, 123.296, 31, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 1015.13, 0, 109.634, 127, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, -1381.7, 179.5, 1924.2, -165, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, -1382.5, 179.7, 1922.0, -7, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
--]]


end