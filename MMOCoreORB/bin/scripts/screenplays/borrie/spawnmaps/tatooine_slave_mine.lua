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

	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1800.4, 112.2, 3244.8, -12, 0, "rp_rodian_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1796.4, 110.2, 3238.4, 90, 0, "rp_gotal_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")	
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1754, 92.3, 3221, 23, 0, "rp_nikto_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1740.4, 94.2, 3215.7, 91, 0, "rp_trandoshan_male", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1733.4, 94.2, 3217.1, -99, 0, "rp_trandoshan_female", "faction/hutt/grunt_army", "soldier", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1702.9, 90.7, 3233.1, 134, 0, "rp_human_female", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1700.3, 91.1, 3227.6, -42, 0, "rp_human_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
		pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1757.2, 92.7, 3221.4, 23, 0, "rp_rodian_male", "faction/hutt/trooper", "thug", "random") --Equip, Skill, Customization
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

	--Instrument Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 689.751, 0, 218.815, 89, 0, "rp_twilek_male", "xovros_hotel_receptionist", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Nayosan Yi'frit (an Instrument Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "music")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_instruments")

	--Speeder Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 666.118, 0, 243.782, 118, 0, "rp_rodian_male", "vehicle_dealer_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Sprei Ikiki (a Speeder Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")

	--Mount Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 491.48, 0, 316.591, 192, 0, "rp_gotal_male", "vendor_mount", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Pyvaln Rokk (a Mount Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mount")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mounts_tatooine")
	
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
	
	--Junker Ship Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 575.455, 	0, 	316.082, 324, 0, "rp_sullustan_male", "sulon_vendor_ranged_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Nedd Tarunng (a Junker Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship_cheap")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship_cheap")
	
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

	--Bartender of Chalmun's Cantina, Wuher
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 8.62285, 	-0.894992, 	0.447493, 	87, 	610008176, "wuher", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Wuher")
	
	--Mandalorian Scout
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 1199.24, 0, -63.3539, 131, 0, "rp_zabrak_male", "mando_vagabond", "default", "myok_scov", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kar'eyce (a Mandalorian Vagabond)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mando_noob")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mando_noob")
	
	--Transmog Vendor
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 0.07613, 0.611579, -6.57677, 335, 610009373, "rp_human_male", "vendor_transmog", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("Dyutine Hukchar (a Disguise Vendor)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "transmog")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_transmog")
	
	--Junk Dealer
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.99394, -0.478888, 2.17333, 282, 610009017, "dressed_armorsmith_trainer_01", "default", "default", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Orek Flyn (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "junkdealer")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_junkdealer")
	
	--Eisley Doctor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 454.824, 1.99121, 149.205, 241, 0, "rp_human_male", "eisley_doctor_rahar_mawolki", "default", "eisley_doctor_rahar_mawolki") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Dr. Rahar Mawolki")
	
	--The Dockmaster, Orroko Pimeub
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 1067.58, 0, 52.5186, 296, 0, "rp_gran_male", "eisley_dockmaster_orroko_pimeub", "default", "eisley_dockmaster_orroko_pimeub") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Orroko Pimeub (a Dockmaster)")
	
	--Moqeni, the Major Domo for the Hutts of Eisley
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -7.4215, 3.07248, -20.522, 26, 610008299, "rp_smc_female", "eisley_majordomo_moqeni", "default", "eisley_majordomo_moqeni") --Equip, Skill, Customization
	--SceneObject(pNpc):setCustomObjectName("Moqeni (a Majordomo)")
	
	--Eisley's Tailor, the Bith Doivo Cilea
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4.13958, 0.408271, 0.354657, 197, 610008132, "rp_bith_female", "eisley_tailor_doivo_cilea", "default", "eisley_tailor_doivo_cilea", "rp_eisley_tailor") --Tailor
	SceneObject(pNpc):setCustomObjectName("Doivo Cilea")
	
	--Backpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 958.619, 0, 134.246, 33, 0, "rp_human_male", "xovros_refugee_male9", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Fregg Cobbxor (a Backpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "backpacks")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_backpacks")
	
	--Luxury Vehicle Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 686.667, 0, 129.118, 83, 0, "rp_human_male", "tatooine_luxury_speeder_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Gregonory Dyljen (a Luxury Vehicle Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle_luxury")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles_luxury")
	
	--Silver Dawn Vendor
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 1188.15, 0, 382.792, 311, 0, "rp_human_male", "lirril/silver_servant", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Vendor")
	--SceneObject(pNpc):setStoredString("vendor:theme", "silver_dawn")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_silver_dawn")
	
	--Full Ship Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 6.4093, 0.40827, -8.98533, 0, 610009177, "rp_moncal_male", "eisley_dockmaster_orroko_pimeub", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Tiroir Ciouskar (a Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship")
	
	--Temporary Silver Dawn NPCs
	--Temporary in that they need to be official faction NPCs tied to a base. But for now, this should make Lirril, Samari and Ykeer happy.
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 847.32, 0, 177.202, 196, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 816.409, 0.3, 316.096, 239, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 765.047, 2.0752, 270.323, 272, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 724.046, 0, 154.989, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 702.913, 0, 154.147, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 1028.9, 0, 110.038, 319, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 1036.26, -0.5, 117.469, 307, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 1075.65, 0, 256.614, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 1236.33, 0, 316.577, 179, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 1243.52, 0, 373.891, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
--]]

end