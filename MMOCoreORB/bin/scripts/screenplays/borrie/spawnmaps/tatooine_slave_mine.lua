RpTatooineSlaveMineScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineSlaveMineScreenPlay",

	planet = "rp_tatooine",	
	

	
	walkpointList = {
		market_shopper1 = {
			--[[
			{745.296, 0, 281.54, 180, 0,false, "none"},
			--]]
		},
	}
	
	
}

registerScreenPlay("RpTatooineSlaveMineScreenPlay",  true)

function RpTatooineSlaveMineScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end



function RpTatooineSlaveMineScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end


function RpTatooineSlaveMineScreenPlay:spawnCivilians() 
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
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end



function RpTatooineSlaveMineScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	--[[
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610008050, 1, 0, 0.332372, 0)
	--]]

	
	--Signs
	--[[
	local sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 947.255, 0, 139.882, 0, 0.97237, 0, 0.233445, 0) --Tailor Sign
	SceneObject(sObj):setCustomObjectName("Eisley Tailoring")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/swsovrp/prop2/thm_sign_welcome_hanging.iff", -1437.4, 190, 1942.8, 125, 0, 0, 1, 0) --Beware of Dog
	SceneObject(sObj):setCustomObjectName("Beware of Dog")
	--]]
end

function RpTatooineSlaveMineScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	

	
	local pNpc

	--Outside
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1800.4, 112.2, 3244.8, -12, 0, "rp_rodian_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1796.4, 110.2, 3238.4, 90, 0, "rp_gotal_male", "faction/hutt/trooper_snow", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1753.2, 92.1, 3220.6, 48, 0, "rp_nikto_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1737.4, 91.8, 3216.4, 44, 0, "rp_trandoshan_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1733.4, 94.2, 3217.1, -99, 0, "rp_trandoshan_female", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1703.8, 91.4, 3232.1, 126, 0, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1700.3, 91.1, 3227.6, -42, 0, "rp_human_male", "faction/hutt/trooper_swamp", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1757.2, 92.7, 3221.4, 23, 0, "rp_rodian_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1727.1, 118.2, 3193.6, -41, 0, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	



	--Break Room and mining room 1
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -13.2, -44, -135.9, 83, 610029997, "rp_zabrak_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -13.1, -44, -138.7, 69, 610029997, "rp_gotal_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -10.2, -44.7, -141.1, -39, 610029997, "rp_nikto_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -12.9, -44, -141.0, 28, 610029997, "rp_chiss_male", "faction/hutt/trooper_swamp", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "chiss")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -2.9, -46.2, -152.1, -11, 610029997, "rp_twilek_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 3.2, -44.6, -137.4, -103, 610029997, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 28, -58.9, -163.5, 31, 610029997, "rp_nikto_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 71.4, -46.2, -127.6, -102, 610029997, "rp_nikto_male", "faction/hutt/trooper_swamp", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 53.7, -46.1, -116, -155, 610029997, "rp_weequay_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 44.9, -56.4, -187.3, -11, 610029997, "cll8_binary_load_lifter", "default", "droid", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")




	--Mining room 2
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 3, -63.4, -230.2, 98, 610029999, "rp_trandoshan_male", "slave1", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")	
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -0.9, -63.6, -233.7, 102, 610029999, "rp_human_male", "slave2", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -0.6, -64.6, -240.3, 85, 610029999, "rp_wookiee_female", "slave3", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wookiee")	
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -16.7, -63.4, -260, -179, 610029999, "human", "slave", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -21.9, -62.9, -261, -156, 610029999, "rp_twilek_female", "slave4", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")	

	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 0.8, -64.1, -208.1, -138, 610029999, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -22.6, -64.7, -209.2, 139, 610029999, "rp_zabrak_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -9.2, -64.4, -223.1, 132, 610029999, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -19.8, -65.6, -242.9, 61, 610029999, "rp_nikto_male", "faction/hutt/trooper_swamp", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "chiss")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -19.7, -65.5, -245.1, 175, 610029999, "rp_weequay_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")



	--Bottom room
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -92.3, -100.8, -149.7, 18, 610030000, "cll8_binary_load_lifter", "default", "droid", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")

	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -80.1, -100.6, -111.5, -79, 610030003, "rp_zabrak_male", "slave1", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -10.2, -44.7, -141.1, -39, 610030003, "rp_twilek_male", "slave2", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -98.7, -100.2, -114.4, 19, 610030003, "rp_zabrak_female", "slave3", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -100.8, -100.8, -96.1, 107, 610030003, "rp_twilek_female", "slave4", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -100.4, -99.9, -89.6, -18, 610030003, "rp_bothan_male", "slave1", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "bothan")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -82.3, -99.4, -88.8, 8, 610030003, "rp_human_female", "slave3", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -79.1, -99.1, -96.9, -117, 610030003, "rp_weequay_male", "faction/hutt/officer_intelligence", "bountyhunter", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -80.2, -99.4, -95.3, -103, 610030003, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -79.3, -99.4, -99.9, -118, 610030003, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")

		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -77.4, -100.1, -126.1, -86, 610030003, "rp_human_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -76.5, -99.5, -116.4, -106, 610030003, "rp_gotal_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -87.8, -98.9, -87.3, -177, 610030003, "rp_twilek_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -95.4, -99.6, -88.7, 164, 610030003, "rp_rodian_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -104, -99.6, -97.4, 76, 610030003, "rp_zabrak_male", "faction/hutt/trooper_swamp", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -103.7, -98.6, -110, 102, 610030003, "rp_nikto_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

	--[[
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1800.4, 112.2, 3244.8, -12, 0, "rp_human_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		--]]

	--VENDORS--
	
	--Melee Vendor Light
	--[[
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -7.1, 37.9, -31.9, 74, 610021764, "rp_human_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Madman (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	--Ranged Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 750.769, 0, 275.276, 222, 0, "rp_zabrak_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Gjolan (a Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")

	--Camping Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 738.375, 0, 275.533, 90, 0, "rp_human_female", "xovros_vendor_camping", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Raphella Lees (a Camping Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")
	
	--Cheap Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 482.509, 0, 131.549, 330, 0, "rp_gran_male", "xovros_nurse", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Horuuk Kyl (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	
	--Specialty Shop Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4.5236, 0.408271, 0.665532, 87, 610008479, "rp_rodian_male", "eisley_specialty_shop_beebo", "default", "eisley_specialty_shop_beebo", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Beebo (a Specialty Item Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")
	
	--Armorsmith Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.78393, 	-0.378217, 	-5.28738, 	275, 	610008471, "rp_ithorian_male", "eisley_armorsmith_biemio_faom", "default", "eisley_armorsmith_biemio_faom", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Biemio Faom (an Armorsmith Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")
	
	--Weaponsmith Vendor (Ranged)
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.84223, 0.75,  -0.247093, 358, 610009368, "rp_quarren_male", "eisley_weaponsmith_kefarack_tajus", "default", "eisley_weaponsmith_kefarack_tajus", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kefarack Tajus (a Weaponsmith Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")
	
	--Weaponsmith Vendor (Melee)
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -0.467513, 0.75, -0.458854, 0, 610009368, "rp_trandoshan_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Rokk (a Weaponsmith Melee Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	

--]]

end