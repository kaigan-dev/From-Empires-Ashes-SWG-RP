RpTatooineWayfarScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineWayfarScreenPlay",

	planet = "rp_tatooine",	
	

	
	walkpointList = {
		market_shopper1 = {
			--[[
			{745.296, 0, 281.54, 180, 0,false, "none"},
			--]]
		},
	}
	
	
}

registerScreenPlay("RpTatooineWayfarScreenPlay",  true)

function RpTatooineWayfarScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end



function RpTatooineWayfarScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end


function RpTatooineWayfarScreenPlay:spawnCivilians() 
	local waypointList = {
		--[[
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		{786.172, 0, 191.22, 228, 0,{"none"}},
		{1073.37, 0, 95.1716, 195, 0,{"sit"}},
		{921.788, 0, 173.653, 27, 0,{"social"}},
		{-13.4973, -0.894867, -17.2896, 137, 610008181,{"sittable"}},
		{48.5378, 0.105, -0.69122, 270, 610008174,{"sitchair"}},
		{16.8917, -0.894992, -3.9489, 271, 610008176,{"drinker"}},
		--]]
		{4631.4, 3.2, -6852.9, 149, 0,{"none"}},
        {4639.6, 3, -6850.3, 230, 0, {"social"}},
        {4638.7, 3, -6851.6, 22, 0, {"none"}}, 
        {4634.6, 1.6, -6872.2, 118, 0, {"none"}},
        {4630.5, 1.5, -6876.3, 202, 0, {"none"}},
        {4626.5, 1.5, -6877.3, 59, 0, {"social"}},
        {4627.9, 1.4, -6878, 320, 0, {"none"}},
        {4635.3, 1.3, -6877, 22, 0, {"none"}},
        {4636.6, 1.3, -6875.4, 221, 0, {"social"}},
        {4636.8, 1.2, -6877.1, 320, 0, {"none"}},
        {4735.9, 2, -6839.8, 212, 0, {"none"}},
        {4739.5, 1.7, -6843.3, 237, 0, {"sit"}},
        {4692.1, 2.6, -6846.6, 358, 0, {"tech"}},
        {4633.2, 0, -6903.3, 350, 0, {"sit"}},
        {4603.1, 0.8, -6896.1, 245, 0, {"tech"}},
        {4622.9, 1.5, -6879.6, 300, 0, {"none"}},
        {4571.7, 7.6, -6861.1, 89, 0, {"none"}},
        {4575.6, 6.9, -6861.9, 324, 0, {"social"}},
        {4575.4, 7.4, -6859, 190, 0, {"none"}},
        {4570.8, 7.9, -6859.8, 117, 0, {"none"}},
        {4582.7, 2.8, -6885.1, 199, 0, {"sit"}},
        {4576.8, 3.1, -6884.8, 171, 0, {"sit"}},
        {4569.4, 3.5, -6886.1, 0, 0, {"tech"}},
        {4517, 5.6, -6897.2, 287, 0, {"none"}},
        {4514.9, 6.4, -6894.9, 122, 0, {"social"}},
        {4472, 5.1, -6905.6, 150, 0, {"sit"}},
		{4672.8, 0.8, -6846.5, 102, 0, {"social"}}, 
		{4597.3, 7, -6839.7, 106, 0, {"sit"}},

		--Wayfar cantina
		{-0.5, 0.8, 4.4, 196, 610030783, {"none"}},
		{-6.3, 0.7, 1.7, 257, 610030783, {"sittable"}},
		{-9.6, 0.7, 1.1, 91, 610030783, {"sittable"}},
		{-7.7, 0.7, -0.5, 347, 610030783, {"sittable"}},
		{2.8, 0.7, 3.3, 42, 610030783, {"drinker"}},
		{3.6, 0.7, 3.8, 294, 610030783, {"sittable"}},

		-- wayfar hotel
		{-22, 1.6, 10.2, 118, 610030418, {"none"}},
		{-21.1, 1.6, -5, 253, 610030422, {"sittable"}},
		{-25.7, 1.6, -11.1, 92, 610030422, {"sit"}},
		{-24.2, 1.6, -12.8, 320, 610030422, {"social"}},
		{20.5, 1.6, 12.7, 177, 610030417, {"none"}},
		{22.1, 1.3, 5.5, 139, 610030417, {"sittable"}},
		{24.3, 1.3, 3.3, 306, 610030417, {"sittable"}},

		-- Wayfar Misty Dragon Spice Den
		{11.8, 0.6, 7.2, 183, 610030520, {"sittable"}},
		{11.1, 0.6, 7.2, 183, 610030520, {"sittable"}},

		{5.5, 0.6, -6.7, 157, 610030527, {"sit"}},
		{8.7, 0.6, -13, 45, 610030527, {"sittable"}},

		{-8.6, 0.6, -12.5, 351, 610030526, {"sit"}},
		{-7.7, 0.6, -12.5, 346, 610030526, {"sit"}},
		{-5.3, 0.6, -3.4, 167, 610030526, {"sittable"}},
	
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end
    


function RpTatooineWayfarScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", 4454.3, 8.3, -6846, 0, math.rad(180))
	
end

function RpTatooineWayfarScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	

	
	local pNpc



	
	--	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 3, -63.4, -230.2, 98, 610029999, "rp_trandoshan_male", "slave1", "thug", "random") --Equip, Skill, Customization
	--setRandomCreatureName(pNpc, "trandoshan")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4471.7, 10.8, -6866.1, 329, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4470, 10.6, -6866.1, 2, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4545.8, 0.2, -6925.7, 350, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4547.3, 5.8, -6880.4, 345, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4546.1, 6, -6879, 158, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4720.5, 0.5, -6870.4, 358, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4719.8, 0.5, -6870.7, 1, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4718.8, 0.5, -6870.6, 11, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4675, 0.7, -6847.2, 42, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")




	--Bottom room
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -92.3, -100.8, -149.7, 18, 610030000, "cll8_binary_load_lifter", "default", "droid", "default") --Equip, Skill, Customization
	--SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")


	--[[
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1800.4, 112.2, 3244.8, -12, 0, "rp_human_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		--]]

	--VENDORS--
	
	--Melee Vendor Light
	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4555.3, 1.2, -6907.3, 191, 0, "rp_human_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Hibo Spiti (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	--Ranged Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4566.4, 1.5, -6898.7, 98, 0, "rp_zabrak_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Trebo cope (a Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")

	--Camping Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4475.5, 11, -6869.2, 43, 0, "rp_human_female", "xovros_vendor_camping", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Kealleete (a Camping Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")
	
	--Cheap Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 7.2, 0.2, -1.5, 264, 610030514, "rp_gran_male", "xovros_nurse", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Givy Peco (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	
		--Junk Dealer
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4456.4, 4.5, -6909.5, 150, 0, "dressed_armorsmith_trainer_01", "default", "default", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Tafonae Goho (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "junkdealer")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_junkdealer")


       --Speeder vendor
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4684.5, 0.4, -6879.8, 333, 0, "rp_rodian_male", "vehicle_dealer_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Caka (a Speeder Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")
	

	-- Misty Dragon Spice Den
	createTemplatedRoleplayNPC("faction/hutt/grunt_army", 12.5, 0.6, 5.5, -101, 610030520 ,"rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_army", -1.5, 5.1, 2.1, -3, 610030520 ,"rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_army", 8.6, 5.1, 2.1, -5, 610030520 ,"rp_tatooine")

	createTemplatedRoleplayNPC("faction/hutt/grunt_army", -7.2, 5.1, 8.2, 89, 610030522 ,"rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_army", -13.8, 5.1, 4.4, -7, 610030522 ,"rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_army", -12.8, 5.1, 4.5, -5, 610030522 ,"rp_tatooine")

	createTemplatedRoleplayNPC("faction/hutt/grunt_navy", 0.6, 5.1, -10.7, 107, 610030525 ,"rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/tech_medic", -7.2, 5.1, -10.4, -159, 610030525 ,"rp_tatooine")
	createTemplatedRoleplayNPC("faction/hutt/grunt_navy", -3.9, 5.1, -2.8, 22, 610030525 ,"rp_tatooine")


end