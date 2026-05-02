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

	spawnSceneObject("rp_endor", "object/tangible/terminal/terminal_travel_rp.iff", 5965.8, 246.5, -2489.7, 0, math.rad(180))
	

end

function endor_start:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	--Rebels at Bright Tree Village
	local pNpc
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4763.9, 50.7, -2463.1, 76, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")

	--Rebels at FOB
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5805.5, 215.0, -2461.4, -21, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5801.6, 215.0, -2463.5, -14, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5804.2, 215.0, -2463.6, -18, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5761.5, 231.2, -2470.9, -49, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5773.2, 231.2, -2476.2, -34, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5760.9, 231.2, -2475.2, -80, 0, "rp_zabrak_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5783.5, 232.5, -2526.6, 91, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5783.5, 232.5, -2526.6, 91, 0, "rp_zabrak_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5787.0, 232.5, -2528.9, -46, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5699.2, 247.2, -2528.1, -90, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5719.5, 247.2, -2532.2, 155, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5708.5, 247.2, -2518.9, -33, 0, "rp_sullustan_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5758.5, 222.7, -2538.9, -32, 0, "rp_zabrak_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5755.4, 222.6, -2539.9, -28, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5858.8, 222.7, -2563.6, 32, 0, "rp_sullustan_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5863.8, 222.7, -2534.5, 173, 0, "rp_sullustan_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5880.5, 224.8, -2539.9, -100, 0, "rp_bothan_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5826.2, 215.0, -2469.5, -109, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5827.5, 215.0, -2470.6, -160, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6210.2, 265.0, -2431.7, 41, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6122.7, 265.0, -2435.5, 43, 0, "rp_zabrak_female", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6118.7, 265.0, -2434.8, 40, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6130.9, 264.9, -2436.1, 20, 0, "rp_sullustan_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6050.8, 261.8, -2476.9, -172, 0, "rp_sullustan_male", "faction/rebel/officer", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6051.2, 261.7, -2473.3, -1, 0, "rp_moncal_male", "faction/rebel/officer", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6057.4, 261.5, -2472.5, 154, 0, "rp_human_male", "faction/rebel/officer", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6057.2, 261.5, -2474.4, 56, 0, "rp_human_female", "faction/rebel/officer", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6061.0, 261.5, -2479.2, 98, 0, "rp_human_male", "faction/rebel/navy_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6064.9, 263.0, -2445.7, -171, 0, "rp_human_female", "faction/rebel/navy_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6067.9, 263.0, -2445.5, 166, 0, "rp_human_male", "faction/rebel/navy_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5979.0, 249.8, -2490.9, -133, 0, "rp_moncal_male", "faction/rebel/navy_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5821.7, 217.1, -2518.4, 121, 0, "rp_human_female", "faction/rebel/officer", "default", "random") --Equip, Skill, Customization
		SceneObject(pNpc):setCustomObjectName("Sukoi (an Alliance Adjutant)")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5834.0, 215.0, -2491.7, 7, 0, "rp_bothan_male", "faction/rebel/navy_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5832.6, 215.0, -2490.0, -179, 0, "rp_sullustan_male", "faction/rebel/pilot", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5864.5, 246.4, -2489.7, 142, 0, "rp_human_female", "faction/rebel/pilot", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6054.6, 261.7, -2482.1, 177, 0, "rp_human_male", "faction/rebel/pilot", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6112.0, 265.0, -2473.8, 36, 0, "rp_sullustan_male", "faction/rebel/navy_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5844.3, 215.0, -2489.9, 54, 0, "rp_human_male", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5829.0, 215.0, -2491.5, -46, 0, "rp_human_female", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5829.0, 215.0, -2491.5, -46, 0, "rp_human_female", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5830.3, 215.0, -2496.5, -168, 0, "rp_zabrak_female", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5806.7, 215.0, -2494.5, -18, 0, "rp_sullustan_male", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5805.1, 215.0, -2492.4, 113, 0, "rp_moncal_male", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5806.8, 215.0, -2491.4, -179, 0, "rp_human_male", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5815.2, 215.3, -2451.4, -11, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5827.3, 215.0, -2485.1, 93, 0, "rp_human_male", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5824.9, 215.0, -2485.4, 75, 0, "rp_human_female", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5823.5, 215.0, -2486.2, 57, 0, "rp_zabrak_male", "faction/rebel/endor_trooper", "default", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")

	--Vendors at FOB
	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5983.2, 250.0, -2315.2, 40, 0, "rp_human_male", "faction/rebel/endor_trooper", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Ando Carlo (a Ranged Weapon Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5991.3, 250.0, -2519.4, -57, 0, "rp_wookiee_female", "faction/rebel/endor_trooper", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Karraka (a Melee Weapon Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5853.8, 215.0, -2481.2, -112, 0, "rp_sullustan_female", "faction/rebel/endor_trooper", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Nunai (a Camping Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5832.7, 215, -2472.7, 137, 0, "rp_moncal_female", "faction/rebel/officer", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Dulcinea (a Stimpack Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5980.0, 250.0, -2523.0, -142, 0, "rp_zabrak_male", "faction/rebel/endor_trooper", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Shorn (an Armour Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5842.9, 214.4, -2510.1, 71, 0, "rp_rodian_female", "faction/rebel/officer", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Zyzzy (a Vehicle Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 6034.5, 260.0, 2509.8, 160, 0, "rp_twilek_male", "faction/rebel/navy_trooper", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Putta Mame (a General Goods Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")


	--Imperial PoWs at FOB


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