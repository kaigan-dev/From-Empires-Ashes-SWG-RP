endor_start = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "endor_start",

	planet = "rp_endor",	
	

	
	walkpointList = {

	}
	
	
}

registerScreenPlay("endor_start",  true)

function endor_start:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		--self:spawnJunkPiles()
	end
end


--[[
function endor_start:spawnJunkPiles() 
	local spawnPoints = {
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		{538.877, -0.25, 223.016, 0, -0.0348994, 0, 0.999391, 0},
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end
--]]


function endor_start:spawnCivilians() 
	local waypointList = {
		
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		--So this is all going to be Ewoks because this is Endor. Yub yub.
		--Test Ewoks
		{0, 9, 0, 0, 0,{"none"}},
		{1, 9, 1, 0, 0,{"none"}},
		{2, 9, 2, 0, 0,{"none"}},
		{3, 9, 3, 0, 0,{"none"}},
		{4, 9, 4, 0, 0,{"none"}},
		{5, 9, 5, 0, 0,{"none"}},
		{6.7, 9.0, -25, 27, 0,{"sit"}},
		--{1072.39, 0, 96.3649, 217, 0,{"sit"}},
		--{1073.37, 0, 95.1716, 195, 0,{"sit"}},
		--Bright Tree Village

		{4765.2, 50.7, -2460.8, 161, 0,{"none"}},
		{4765.9, 50.7, -2465.2, 11, 0,{"none"}},
		{4746.7, 43.6, -2415.7, -150, 0,{"none"}},
		{4745.4, 43.6, -2418.0, -21, 0,{"none"}},
		{4742.5, 42.0, -2416.0, 89, 0,{"none"}},
		{4744.9, 42.0, -2413.3, 178, 0,{"none"}},
		{4750.1, 42.2, -2465.6, -67, 0,{"none"}},
		{4738.3, 44.0, -2404.7, -11, 0,{"none"}},
		{4714.5, 40.2, -2477.2, 15, 0,{"none"}},
		{4713.8, 40.2, -2473.1, -50, 0,{"none"}},
		{4740.3, 52.8, -2441.5, -58, 0,{"none"}},
		{4736.6, 52.8, -2439.5, 114, 0,{"none"}},
		{4738.9, 52.8, -2428.7, -173, 0,{"none"}},
		{4736.6, 52.8, -2439.5, 114, 0,{"none"}},
		{4740.0, 62.8, -2456.8, 142, 0,{"none"}},
		{4738.0, 62.8, -2443.1, 119, 0,{"none"}},
		{4739.6, 62.8, -2444.3, -56, 0,{"none"}},
		{4741.4, 62.8, -2449.3, 11, 0,{"none"}},
		{4741.5, 62.8, -2447.6, 173, 0,{"none"}},
		{4745.1, 62.9, -2440.4, -28, 0,{"none"}},
		{4730.0, 62.8, -2447.7, -175, 0,{"none"}},
		{4729.9, 62.8, -2449.8, -11, 0,{"none"}},
		{4730.2, 62.8, -2447.7, -150, 0,{"none"}},
		{4723.3, 62.8, -2442.4, -126, 0,{"none"}},
		{4723.3, 62.8, -2442.4, -126, 0,{"none"}},
		{4708.5, 60.7, -2409.7, 56, 0,{"none"}},
		{4710.1, 60.7, -2408.8, -135, 0,{"none"}},
		{4713.1, 60.7, -2407.1, 135, 0,{"none"}},
		{4716.6, 60.7, -2406.7, 109, 0,{"none"}},
		{4716.0, 60.7, -2408.3, 108, 0,{"none"}},
		{4698.8, 60.9, -2395.6, -32, 0,{"none"}},
		{4699.0, 50.7, -2407.9, 78, 0,{"none"}},
		{4700.0, 50.7, -2407.8, -77, 0,{"none"}},
		{4700.5, 50.7, -2406.0, -153, 0,{"none"}},
		{4678.2, 50.7, -2427.9, -7, 0,{"none"}},
		{4678.1, 50.7, -2425.8, 162, 0,{"none"}},
		{4674.6, 50.7, -2422.0, 1, 0,{"none"}},
		{4669.3, 50.7, -2426.6, 176, 0,{"none"}},
		{4668.8, 50.7, -2426.3, 8, 0,{"none"}},
		{4664.0, 50.7, -2432.8, -150, 0,{"none"}},
		{4663.0, 50.7, -2432.4, 174, 0,{"none"}},
		{4679.3, 50.7, -2433.5, 166, 0,{"none"}},
		{4679.6, 50.7, -2426.2, -103, 0,{"none"}},
		{4677.7, 50.7, -2425.8, -162, 0,{"none"}},
		{4678.2, 50.7, -2427.9, 22, 0,{"none"}},
		{4677.0, 50.7, -2438.6, -126, 0,{"none"}},
		{4702.0, 57.7, -2487.6, 147, 0,{"none"}},
		{4701.2, 57.7, -2489.7, 91, 0,{"none"}},
		{4701.9, 57.7, -2490.8, 57, 0,{"none"}},
		{4704.1, 57.7, -2491.7, -17, 0,{"none"}},
		{4705.4, 57.7, -2491.7, -81, 0,{"none"}},
		{4704.6, 57.7, -2488.2, -139, 0,{"none"}},
		{4703.6, 57.7, -2487.8, -169, 0,{"none"}},
		{4705.5, 57.7, -2482.5, -74, 0,{"none"}},
		{4725.0, 57.7, -2479.0, -153, 0,{"none"}},
		{4725.4, 57.7, -2480.6, -100, 0,{"none"}},
		{4724.8, 57.7, -2479.0, 129, 0,{"none"}},
		{4727.4, 57.7, -2482.0, -136, 0,{"none"}},
		{4723.3, 57.7, -2473.5, -3, 0,{"none"}},
		{4735.0, 57.7, -2469.1, 87, 0,{"none"}},
		{4736.7, 57.7, -2470.1, -6, 0,{"none"}},
		{4737.1, 57.7, -2468.3, -136, 0,{"none"}},
		{4735.4, 57.7, -2468.1, 115, 0,{"none"}},
		{4729.0, 57.7, -2467.7, 162, 0,{"none"}},

		
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_endor", waypointList, self.walkpointList, "endor", "endor")
end



function endor_start:spawnSceneObjects() 
	--Travel Terminals
	
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610008050, 1, 0, 0.332372, 0)
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 610008050, 1, 0, 0, 0)
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 610008050, 1, 0, 0, 0)
	--Rebel base camp travel terminal:
	--spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5965.8, 246.5, -2489.7, 0, 1, 0, 0, 0)
	
	--spawnSceneObject("rp_dathomir", "object/tangible/terminal/terminal_travel_rp.iff", 1520.12, 127, 1489.68, 0, 0.953717, 0, -0.300706, 0)

	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5965.8, 246.5, -2489.7, 0, 0.653717, 0, -0.300706, 0)
	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5960.7, 246.6, -2490.2, 0, 0.953717, 0, -0.300706, 0)
	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5957.8, 247, -2489.7, 0, 0.353717, 0, -0.300706, 0)
	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5954.7, 247, -2489.6, 0, 0.953717, 0, -0.600706, 0)
	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5954.7, 247, -2490, 0, 0.953717, 0, -0.900706, 0)

end

function endor_start:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	--Rebels at Bright Tree Village
	local pNpc
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4763.9, 50.7, -2463.1, 76, 0, "rp_human_female", "faction/rebel/grunt_army", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
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