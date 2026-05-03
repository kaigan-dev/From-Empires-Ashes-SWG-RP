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
		{4790.1, 40.1, -2362.4, 32, 0,{"none"}},
		{4679.3, 40.1, -2361.6, 105, 0,{"none"}},
		{4681.3, 40.1, -2361.7, 38, 0,{"none"}},
		{4692.0, 40.1, -2365.4, -125, 0,{"none"}},
		{4692.8, 40.1, -2369.8, -38, 0,{"none"}},
		{4684.3, 40.1, -2376.8, -88, 0,{"none"}},
		{4670.9, 33.6, -2408.9, -124, 0,{"none"}},
		{4686.7, 43.3, -2400.8, -176, 0,{"none"}},
		{4677.3, 43.3, -2396.3, 112, 0,{"none"}},
		{4678.4, 43.3, -2394.9, 171, 0,{"none"}},
		{4671.5, 53.3, -2402.5, 23, 0,{"none"}},
		{4672.2, 53.3, -2400.4, 123, 0,{"none"}},
		{4678.2, 53.3, -2398.7, 165, 0,{"none"}},
		{4671.0, 53.3, -2406.6, 102, 0,{"none"}},
		{4672.7, 53.3, -2407.4, -98, 0,{"none"}},
		{4674.6, 53.3, -2406.2, -11, 0,{"none"}},
		{4669.1, 53.3, -2404.6, -94, 0,{"none"}},
		{4672.3, 53.6, -2396.1, -90, 0,{"none"}},
		{4728.2, 47.7, -2466.6, 67, 0,{"none"}},
		{4718.6, 47.7, -2471.6, -67, 0,{"none"}},
		{4722.9, 47.7, -2475.9, 26, 0,{"none"}},
		{4722.9, 47.7, -2474.3, 153, 0,{"none"}},
		{4713.9, 47.7, -2482.4, 149, 0,{"none"}},
		{4715.4, 47.7, -2483.5, -94, 0,{"none"}},
		{4707.7, 47.7, -2481.4, -33, 0,{"none"}},
		{4701.9, 47.7, -2491.8, -157, 0,{"none"}},
		{4620.6, 10.4, -2398.9, -118, 0,{"none"}},
		{4614.9, 10.4, -2396.8, 147, 0,{"none"}},
		{4601.6, 10.4, -2390.4, -147, 0,{"none"}},
		{4584.5, 10.4, -2396.2, -10, 0,{"none"}},
		{4583.3, 10.4, -2423.2, 85, 0,{"none"}},
		{4591.7, 10.4, -2429.3, 96, 0,{"none"}},
		{4594.4, 10.4, -2431.3, -38, 0,{"none"}},
		{4610.0, 10.4, -2426.5, 100, 0,{"none"}},
		{4617.1, 10.4, -2422.1, -90, 0,{"none"}},
		{4690.5, 35.0, -2432.0, 42, 0,{"none"}},
		{4693.4, 35.8, -2433.6, -23, 0,{"none"}},
		{4695.1, 35.6, -2430.5, -89, 0,{"none"}},
		{4692.4, 35.0, -2428.4, -174, 0,{"none"}},
		{4694.0, 30.9, -2523.7, -106, 0,{"none"}},
		{4690.1, 30.9, -2522.9, -176, 0,{"none"}},
		{4692.2, 30.9, -2533.3, -145, 0,{"none"}},
		{4657.0, 31.0, -2495.6, -116, 0,{"none"}},
		{4745.9, 40.8, -2525.3, 160, 0,{"none"}},
		{4742.2, 40.8, -2516.6, 1, 0,{"none"}},
		{4743.8, 40.8, -2512.7, -125, 0,{"none"}},
		{4769.3, 51.7, -2493.1, 70, 0,{"none"}},
		{4789.1, 57.8, -2420.1, 18, 0,{"none"}},
		{4764.3, 46.9, -2357.9, 18, 0,{"none"}},
		{4746.3, 42.1, -2346.6, -122, 0,{"none"}},
		{4744.7, 42.1, -2353.3, 150, 0,{"none"}},
		{4635.9, 32.0, -2356.9, -43, 0,{"none"}},
		{4643.5, 20.0, -2358.2, -49, 0,{"none"}},
		{4538.7, 19.0, -2387.6, -66, 0,{"none"}},
		{4542.7, 19.9, -2385.3, 150, 0,{"none"}},
		{4554.0, 30.0, -2453.0, 120, 0,{"none"}},
		{4560.1, 30.0, -2454.0, -92, 0,{"none"}},
		{4550.1, 30.0, -2454.0, -24, 0,{"none"}},
		{4542.1, 30.0, -2457.0, 134, 0,{"none"}},
		{4544.2, 30.0, -2469.3, 166, 0,{"none"}},
		{4544.6, 30.0, -2476.2, 67, 0,{"none"}},
		{4557.8, 30.0, -2488.4, 139, 0,{"none"}},
		{4529.2, 29.7, -2444.5, 41, 0,{"none"}},



		
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
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4763.9, 50.7, -2463.1, 76, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4787.9, 57.7, -2417.0, 86, 0, "rp_zabrak_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4764.4, 46.9, -2458.1, 21, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4670.0, 40.6, -2356.7, -83, 0, "rp_sullustan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4669.0, 43.3, -2404.7, -79, 0, "rp_zabrak_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4672.0, 53.3, -2395.4, -81, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4687.2, 53.3, -2412.5, -129, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4683.9, 53.3, -2409.1, -155, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4683.9, 53.3, -2409.1, -155, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4688.6, 30.9, -2433.8, -174, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4556.2, 20.0, -2457.5, -22, 0, "rp_zabrak_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4526.8, 30.0, -2451.0, -74, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 4566.4, 29.9, -2484.0, 157, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	


	--Rebels at FOB
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5805.5, 215.0, -2461.4, -21, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5801.6, 215.0, -2463.5, -14, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5804.2, 215.0, -2463.6, -18, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5761.5, 231.2, -2470.9, -49, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5773.2, 231.2, -2476.2, -34, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5760.9, 231.2, -2475.2, -80, 0, "rp_zabrak_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5783.5, 232.5, -2526.6, 91, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5794.1, 232.5, -2535.6, 112, 0, "rp_zabrak_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5787.0, 232.5, -2528.9, -46, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5699.2, 247.2, -2528.1, -90, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5719.5, 247.2, -2532.2, 155, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5708.5, 247.2, -2518.9, -33, 0, "rp_sullustan_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5758.5, 222.7, -2538.9, -32, 0, "rp_zabrak_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5755.4, 222.6, -2539.9, -28, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5858.8, 222.7, -2563.6, 32, 0, "rp_sullustan_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5863.8, 222.7, -2534.5, 173, 0, "rp_sullustan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5880.5, 224.8, -2539.9, -100, 0, "rp_bothan_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5826.2, 215.0, -2469.5, -109, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5827.5, 215.0, -2470.6, -160, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6119.3, 265.0, -2431.8, 75, 0, "rp_human_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6122.7, 265.0, -2435.5, 43, 0, "rp_zabrak_female", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6118.7, 265.0, -2434.8, 40, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6130.9, 264.9, -2436.1, 20, 0, "rp_sullustan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6050.8, 261.8, -2476.9, -172, 0, "rp_sullustan_male", "faction/rebel/officer", "factional/common/officer_army", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6051.2, 261.7, -2473.3, -1, 0, "rp_moncal_male", "faction/rebel/officer", "factional/common/officer_army", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6057.4, 261.5, -2472.5, 154, 0, "rp_human_male", "faction/rebel/officer", "factional/common/officer_army", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6057.2, 261.5, -2474.4, 56, 0, "rp_human_female", "faction/rebel/officer", "factional/common/officer_army", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6061.0, 261.5, -2479.2, 98, 0, "rp_human_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6064.9, 263.0, -2445.7, -171, 0, "rp_human_female", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6067.9, 263.0, -2445.5, 166, 0, "rp_human_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5979.0, 249.8, -2490.9, -133, 0, "rp_moncal_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5821.7, 217.1, -2518.4, 121, 0, "rp_human_female", "faction/rebel/officer", "factional/common/officer_army", "random") --Equip, Skill, Customization
		SceneObject(pNpc):setCustomObjectName("Sukoi (an Alliance Adjutant)")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5834.0, 215.0, -2491.7, 7, 0, "rp_bothan_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5832.6, 215.0, -2490.0, -179, 0, "rp_sullustan_male", "faction/rebel/pilot", "pilot", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5964.5, 246.1, -2489.7, 142, 0, "rp_human_female", "faction/rebel/pilot", "pilot", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6054.6, 261.7, -2482.1, 177, 0, "rp_human_male", "faction/rebel/pilot", "pilot", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 6112.0, 265.0, -2473.8, 36, 0, "rp_sullustan_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5844.3, 215.0, -2489.9, 54, 0, "rp_human_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5829.0, 215.0, -2491.5, -46, 0, "rp_human_female", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5834.0, 215.0, -2496.0, -170, 0, "rp_human_female", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5830.3, 215.0, -2496.5, -168, 0, "rp_zabrak_female", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5806.7, 215.0, -2494.5, -18, 0, "rp_sullustan_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "sullustan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5805.1, 215.0, -2492.4, 113, 0, "rp_moncal_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5806.8, 215.0, -2491.4, -179, 0, "rp_human_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5815.2, 215.3, -2451.4, -11, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5827.3, 215.0, -2485.1, 93, 0, "rp_human_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5824.9, 215.0, -2485.4, 75, 0, "rp_human_female", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5823.5, 215.0, -2486.2, 57, 0, "rp_zabrak_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5857.8, 222.5, -2538.3, -40, 0, "rp_bothan_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5855.8, 222.5, -2539.6, -28, 0, "rp_human_male", "faction/rebel/endor_trooper_a", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5829.3, 215.0, -2485.1, 98, 0, "rp_moncal_female", "faction/rebel/pilot", "pilot", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "moncal")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5826.1, 215.0, -2485.1, 84, 0, "rp_human_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5852.0, 214.9, -2492.7, -140, 0, "rp_human_female", "faction/rebel/navy_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")

	--Vendors at FOB
	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5982.5, 250.0, -2513.3, 33, 0, "rp_human_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Ando Carlo (a Ranged Weapon Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5991.3, 250.0, -2519.4, -57, 0, "rp_wookiee_female", "default", "soldier_strong", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Karraka (a Melee Weapon Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5853.8, 215.0, -2481.2, -112, 0, "rp_sullustan_female", "faction/rebel/endor_trooper", "factional/common/trooper", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Nunai (a Camping Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5832.7, 215, -2472.7, 137, 0, "rp_moncal_female", "faction/rebel/officer", "factional/common/officer_army", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Dulcinea (a Stimpack Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5980.0, 250.0, -2523.0, -142, 0, "rp_zabrak_male", "faction/rebel/endor_trooper", "factional/common/trooper", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Shorn (an Armour Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 5842.9, 214.4, -2510.1, 71, 0, "rp_rodian_female", "faction/rebel/officer", "factional/common/officer_army", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Zyzzy (a Vehicle Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")

	pNpc = spawnRoleplayMobile("rp_endor", "rp_convo_npc", 1, 6034.5, 260.0, 2509.8, 160, 0, "rp_twilek_male", "faction/rebel/navy_trooper", "factional/common/trooper", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Putta Mame (a General Goods Quartermaster)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")


	--Imperial PoWs at FOB
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5872.0, 222.6, -2543.7, 84, 0, "rp_human_female", "faction/imperial/officer", "factional/common/officer", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5867.6, 222.6, -2538.0, -140, 0, "rp_human_male", "faction/imperial/officer", "factional/common/officer", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5863.6, 222.6, -2542.3, 76, 0, "rp_human_male", "faction/imperial/officer", "factional/common/officer", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5865.6, 222.6, -2541.9, -106, 0, "rp_human_male", "faction/imperial/officer", "factional/common/officer", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5870.6, 222.7, -2552.4, -11, 0, "rp_human_female", "faction/imperial/officer", "factional/common/officer", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5872.7, 222.6, -2548.1, -101, 0, "rp_human_male", "faction/imperial/officer", "factional/common/officer", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5867.5, 222.6, -2548.1, -102, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5866.1, 222.6, -2540.1, -92, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5869.8, 222.6, -2540.6, -34, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5872.3, 222.6, -2540.1, -118, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5868.3, 222.6, -2543.7, -51, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5866.6, 222.6, -2543.2, 95, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5863.9, 222.6, -2543.8, 173, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5863.3, 222.6, -2545.5, 41, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5865.1, 222.6, -2545.0, -78, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5857.7, 222.6, -2543.9, -84, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5862.4, 222.6, -2540.3, -15, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5870.4, 222.6, -2546.2, 121, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5866.7, 222.6, -2549.8, 164, 0, "rp_human_male", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
		setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_endor", "rp_base_npc", 1, 5862.9, 222.6, -2554.0, 0, 0, "rp_human_female", "faction/imperial/trooper_bs", "factional/common/trooper", "random") --Equip, Skill, Customization
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