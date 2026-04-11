RpTatooineJabbaPalaceScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineJabbaPalaceScreenPlay",

	planet = "rp_tatooine",	
	

	
	walkpointList = {
		market_shopper1 = {
			--[[
			{745.296, 0, 281.54, 180, 0,false, "none"},
			--]]
		},
	}
	
	
}

registerScreenPlay("RpTatooineJabbaPalaceScreenPlay",  true)

function RpTatooineJabbaPalaceScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end



function RpTatooineJabbaPalaceScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end


function RpTatooineJabbaPalaceScreenPlay:spawnCivilians() 
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



function RpTatooineJabbaPalaceScreenPlay:spawnSceneObjects() 
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

function RpTatooineJabbaPalaceScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	

	
	local pNpc

	--Foyer
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -4.6, 0.2, 111.8, -5, 610009469, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4.1, 0.2, 111.9, 0, 610009469, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 10.6, 0.2, 141.2, -93, 610009469, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 10.6, 0.2, 142.9, -93, 610009469, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -10.8, 0.2, 143.4, 90, 610009469, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -10.8, 0.2, 143.4, 90, 610009469, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")


pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -11, 5.8, 71.8, 81, 610009472, "rp_human_male", "faction/hutt/officer", "officer", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -9.2, 5.8, 71.8, -94, 610009472, "rp_weequay_male", "faction/hutt/trooper_swamp", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	



pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.8, 5.8, 65.1, -145, 610009473, "rp_human_male", "faction/hutt/trooper_swamp", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 11.4, 5.8, 62.9, -86, 610009473, "rp_weequay_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 7.4, 5.8, 59.8, -20, 610009473, "rp_weequay_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4.6, 5.8, 62.6, 87, 610009473, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 6.4, 5.8, 64.9, 142, 610009473, "rp_rodian_female", "faction/hutt/trooper_swamp", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")



--Kitchen - Come back to give this one a distinct look. Can we give a droid a chef hat?
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -40.2, 3, 62.9, -95, 610009480, "gamorrean", "default", "soldier_strong", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Cookie")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -44.5, 3, 60, 176, 610009480, "21b_surgical_droid", "default", "droid", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Klank")




	--Basement Workshop
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 12.6, 0.2, 89.3, 2, 610009482, "rp_gran_male", "faction/hutt/tech", "mechanic", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "chiss")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.0, 0.2, 80, -102, 610009482, "rp_rodian_male", "faction/hutt/tech", "mechanic", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")



	--Kennels
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -27.8, 0.2, 85, 150, 610009478, "rp_human_male", "faction/hutt/officer_commander", "bountyhunter", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Asrewi (a beast tamer)")




	--Speeder garage
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 31.2, 0.2, 11.2, -83, 610009502, "rp_zabrak_female", "faction/hutt/tech", "mechanic", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 38.5, 0.2, 7, 24, 610009502, "rp_zabrak_male", "faction/hutt/tech", "mechanic", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 37, 0.2, 8.7, 84, 610009502, "wed_treadwell", "default", "droid", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 43.4, 0.2, -15.1, 170, 610009502, "rp_chiss_male", "faction/hutt/tech", "mechanic", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "chiss")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 43, 0.2, -8.2, -34, 610009502, "eg6_power_droid", "default", "droid", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")





	--Throne room
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -18.3, 2.6, 51.7, 86, 610009490, "rp_nautolan_male", "faction/hutt/elite", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -18.3, 2.6, 36.3, 86, 610009490, "rp_nikto_male", "faction/hutt/elite", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -25.5, 3.6, 40.2, 92, 610009490, "rp_human_female", "faction/hutt/elite", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -25.5, 3.6, 47.4, 92, 610009490, "rp_weequay_male", "faction/hutt/elite", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	


pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.8, 2, 29.1, -86, 610009490, "rp_rodiany_male", "bountyhunter", "bountyhunter", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.8, 2, 27.3, -60, 610009490, "rp_twilek_male", "bountyhunter", "bountyhunter", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")


	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.4, 2, 41.9, -135, 610009490, "rp_trandoshan_male", "faction/hutt/grunt_navy", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 7.2, 2, 41.9, 122, 610009490, "rp_weequay_female", "faction/hutt/grunt_army", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 6.9, 2, 39.9, 82, 610009490, "rp_nautolan_female", "faction/hutt/officer", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.8, 2, 40.3, -94, 610009490, "rp_trandoshan_female", "faction/hutt/officer_navy", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")	


	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.8, 2, 36.7, -105, 610009490, "rp_nikto_male", "faction/hutt/trooper_snow", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 9.8, 2, 35.5, -102, 610009490, "rp_nikto_male", "faction/hutt/trooper_snow", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 6.8, 2, 35.9, 94, 610009490, "rp_nikto_male", "faction/hutt/trooper_snow", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	

		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -10.7, 2, 44, 93, 610009490, "dancer", "dancer", "civilian", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	

		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 8.2, 2, 39.3, 4, 610009490, "rp_bothan_female", "slave1", "civilian", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "bothan")
	

	--Jabba's Bedroom
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -34, 3, 58.9, -2, 610009491, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -30.1, 3, 58.2, -2, 610009491, "gamorrean", "gamorrean", "soldier_strong", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")

	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -52.5, 3, 41.7, -92, 610009484, "rp_trandoshan_female", "faction/hutt/elite", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -52.5, 3, 38.7, -92, 610009484, "rp_chiss_female", "faction/hutt/elite", "soldier_strong", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "chiss")	

	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -42.1, 3, 38.6, 1, 610009489, "dancer", "dancer", "civilian", "default") --Equip, Skill, Customization
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