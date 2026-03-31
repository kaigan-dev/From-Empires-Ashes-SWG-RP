local Logger = require("utils.logger")

RpTatooineBestineScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineBestineScreenPlay",

	planet = "rp_tatooine",	
	
	walkpointList = {
		market_shopper1 = {
			{745.296, 0, 281.54, 180, 0,false, "none"},
			{748.047, 0, 279.843, 98, 0,true, "shop"},
			{750.615, 0, 267.862, 137, 0,true, "shop"},
			{743.498, 0, 254.154, 200, 0,false, "none"},
			{737.639, 0, 229.698, 214, 0,false, "none"},
			{719.56, 0, 223.706, 250, 0,false, "none"},
			{716.976, 0, 217.721, 177, 0,true, "shop"},
			{714.527, 0, 223.021, 336, 0,false, "none"},
			{678.21, 0, 226.482, 275, 0,false, "none"},
			{668.156, 0, 248.694, 339, 0,true, "shop"},
			{674.656, 0, 252.419, 68, 0,true, "shop"},
			{672.488, 0, 259.678, 263, 0,true, "shop"},
			{671.774, 0, 284.275, 354, 0,false, "none"},
			{680.253, -0.25, 301.799, 34, 0,false, "none"},
			{722.902, -0.25, 323.929, 40, 0,false, "none"},
			{781.809, -0.25, 314.541, 95, 0,false, "none"},
			{805.175, -0.25, 303.873, 146, 0,false, "none"},
			{767.391, -0.25, 302.339, 261, 0,false, "none"},
			{749.95, 0, 286.123, 206, 0,false, "none"},
		},
	}
	
	
}

registerScreenPlay("RpTatooineBestineScreenPlay",  true)

function RpTatooineBestineScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function RpTatooineBestineScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end

function RpTatooineBestineScreenPlay:spawnCivilians() 
	local waypointList = {
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		{883, 0, 6332, 100, 0, {"none"}},
		{877, 0, 6333, 260,0, {"social"}}
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function RpTatooineBestineScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", -11.7, 0.6, 51.7, 610027601, 1, 0, 0.5, 0)
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", -0.2, 0.6, 49.9, 610027601, 1, 0, 0.33, 0)
	
	
	--Signs
	local sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 495.6, 0, 6551.7, 0, 1, 0, 0.6, 0) --Weapon store Sign
	SceneObject(sObj):setCustomObjectName("Bestine Munitions")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 696.2, 0, 6638.5, 0, 1, 0, -0.1, 0) --tailors Sign
	SceneObject(sObj):setCustomObjectName("Tailors")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 502.9, 0, 6630.1, 0, 1, 0, -0.8, 0) --furniture Sign
	SceneObject(sObj):setCustomObjectName("Specialty store")
	
	
	--TAILOR--
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 8.3, 1.8, -14.8, 610027776, 0, 0, 0, 0) --Shirts
	-- sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 8.3, 1.8, -14.8, 610027776, 0.999983, 0, -0.8, 0) --Shirts Original
	SceneObject(sObj):setCustomObjectName("Shirts1")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")


	--sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 712.2, 1.8, 6675.4, 0, 0, 0, 0, 0) --Shirts
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 712.2, 1.8, 6675.4, 0, 0, 1, 0, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts2")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")

	--sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 715.2, 1.8, 6672.4, 610027776, 0, 0, 0, 0) --Shirts
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 715.2, 1.8, 6672.4, 610027776, 1, 0, 0, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts3")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")


	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 8.3, 1.8, -14.8, 610027776, 1, 0, 0, 0) --Shirts Original
	SceneObject(sObj):setCustomObjectName("Shirts4")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")


	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.9, 1.8, -14.8, 610027776, 0.999983, 0, -0.8, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 2.1, 1.8, -15.4, 610027776, 0.999983, 0, -0.8, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -2.1, 1.8, -15.4, 610027776, 0.999983, 0, -0.8, 0) --Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 0.0, 2.2, -15.4, 610027776, 0, 0, -0.8, 0) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 0, 3.1, -15.4, 610027776, 0, 0, -0.8, 0) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 0, 4, -15.4, 610027776, 0, 0, -0.8, 0) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -5.8, 1.8, -14.8, 610027776, 0, 0, -0.8, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -8.5, 1.8, -14.8, 610027776, 0, 0, -0.8, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.3, 2.2, -6.9, 610027776, 0, 0, 0.3, 0) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.3, 3.1, -6.9, 610027776, 0, 0, 0.3, 0) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 12.3, 4, -6.9, 610027776, 0, 0, 0.3, 0) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 12, 1.7, -12.8, 610027776, 0, 0, 0.3, 0) --Misc/Belts bro
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -12, 1.7, -2.5, 610027776, 0, 0, -0.3, 0) --Alien
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -12.3, 1.7, -6, 610027776, 0, 0, -0.3, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -12.3, 1.7, -8.1, 610027776, 0, 0, -0.3, 0)--Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -12, 1.7, -11.6, 610027776, 0, 0, -0.3, 0)--Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	
	--FURNITURE--
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 4.7, 610027708, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Cheap")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_cheap")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 6.2, 610027708, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Elegant")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_elegant")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 7.7, 610027708, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Modern")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_modern")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 9.2, 610027708, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plain")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plain")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1.7, 1, 4.7, 610027708, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Technical")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_technical")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1.7, 1, 6.2, 610027708, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Misc")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_misc")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.7, 1, 7.7, 610027708, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Decorative")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_decorative")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1.7, 1, 9.2, 610027708, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, City")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_city")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -4.8, 1, 10.4, 610027708, 0, 0, 0.3, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Paintings")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_paintings")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_chest_s01.iff", -2.2, 1, 10.4, 610027708, 0, 0, 0.3, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plants")
	
	--Jukebox--
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_jukebox.iff", 7.4, -0.5, -1.1, 610027840, 0, 0, 0.5, 0)

end

function RpTatooineBestineScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	local pNpc
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 936.5, 0, 6330.8, 310, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 883.2, 0, 6366, 350, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 883.5, 0, 6369.4, 190, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 871.3, 0, 6374.2, 195, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 636.4, 0, 6502.7, 275, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 851.1, 0, 6464.9, 220, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 702.1, 1.5, 6685.6, 20, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 705.2, 1.7, 6686.5, 245, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 701.2, 1.6, 6687.5, 288, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 810.7, 0.8, 6414.5, 75, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 909.7, 0, 6400.7, 270, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 794.7, 0.2, 6340.5, 280, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 791.4, 3.4, 6399.6, 10, 0, "le_repair_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4.2, -0.5, 2.0, 100, 610027840, "3po_protocol_droid_red", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")


	-- Tutorial NPCs removed, copy/paste from other repositorie needed again--
	

	--VENDORS--
	
	--Melee Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.8, 0.8, 1, 85, 610028829, "rp_moncal_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Okibam Rotso (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	--Ranged Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4.2, 0.1, -5.6, 48, 610028831, "rp_zabrak_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Gjolan (a Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")

	--Camping Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 446.6, 0, 6573.8, 350, 0, "rp_human_female", "xovros_vendor_camping", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Raphella Lees (a Camping Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")

	--Instrument Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 422.6, 0.5, 6581.5, 80, 0, "rp_twilek_male", "xovros_hotel_receptionist", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Nayosan Yi'frit (an Instrument Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "music")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_instruments")

	--Speeder Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 806, 0.8, 6415.1, 345, 0, "rp_rodian_male", "vehicle_dealer_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Sprei Ikiki (a Speeder Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")

	--Mount Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 515.5, 0, 6562.9, 225, 0, "rp_gotal_male", "vendor_mount", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Pyvaln Rokk (a Mount Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mount")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mounts_tatooine")
	
	--Cheap Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.8, 0.1, -7.3, 25, 610027685, "rp_gran_male", "xovros_nurse", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Horuuk Kyl (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	
	--Specialty Shop Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -0.8, 0.4, -8.5, 200, 610027707, "rp_rodian_male", "eisley_specialty_shop_beebo", "default", "eisley_specialty_shop_beebo", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Beebo (a Specialty Item Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")
	
	--Junker Ship Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 666.1, 5.2, 6726.5, 170, 0, "rp_sullustan_male", "sulon_vendor_ranged_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Nedd Tarunng (a Junker Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship_cheap")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship_cheap")
	
	--Armorsmith Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -15.2, 1.1, -0.2, 225, 610027646, "rp_ithorian_male", "eisley_armorsmith_biemio_faom", "default", "eisley_armorsmith_biemio_faom", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Biemio Faom (an Armorsmith Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")
	
	--Weaponsmith Vendor (Ranged)
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -2.7, 1.1, -8.7, 280, 610027648, "rp_quarren_male", "eisley_weaponsmith_kefarack_tajus", "default", "eisley_weaponsmith_kefarack_tajus", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kefarack Tajus (a Weaponsmith Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")
	
	--Weaponsmith Vendor (Melee)
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 13.9, 1.1, -13.1, 80, 610027647, "rp_trandoshan_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Rokk (a Weaponsmith Melee Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	--Bartender of Bestine starport cantina
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 8.4, -0.9, 	-0.5, 320, 	610027617, "rp_bith_male", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Keli Rhom")
	
	--Mandalorian Scout
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 446.3, 0, 6630.8, 220, 0, "rp_zabrak_male", "mando_vagabond", "default", "myok_scov", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kar'eyce (a Mandalorian Vagabond)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mando_noob")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mando_noob")
	
	--Transmog Vendor
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 0.07613, 0.611579, -6.57677, 335, 610009373, "rp_human_male", "vendor_transmog", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("Dyutine Hukchar (a Disguise Vendor)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "transmog")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_transmog")
	
	--Junk Dealer
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -0.2, -0.4, -1.4, 80, 6100288212, "dressed_armorsmith_trainer_01", "default", "default", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Orek Flyn (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "junkdealer")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_junkdealer")
	
	--Bestine Doctor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -5, 0.1, 7.2, 100, 610027685, "rp_human_male", "eisley_doctor_rahar_mawolki", "default", "eisley_doctor_rahar_mawolki") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Dr. Faust")
	
	--The Dockmaster, Phoron Klia
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 428, 0, 6738.3, 165, 0, "rp_gran_male", "eisley_dockmaster_orroko_pimeub", "default", "eisley_dockmaster_orroko_pimeub") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Phoron Klia (a Dockmaster)")
	
	--Moqeni, the Major Domo for the Hutts of Eisley
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -7.4215, 3.07248, -20.522, 26, 610008299, "rp_smc_female", "eisley_majordomo_moqeni", "default", "eisley_majordomo_moqeni") --Equip, Skill, Customization
	--SceneObject(pNpc):setCustomObjectName("Moqeni (a Majordomo)")
	
	--Bestine tailor stewardwess
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -4.4, 1.2, -0.7, 260, 610027776, "rp_bith_female", "eisley_tailor_doivo_cilea", "default", "eisley_tailor_doivo_cilea") --Tailor
	SceneObject(pNpc):setCustomObjectName("Rimul Montom")
	
	--Backpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 606.9, 0, 6655.5, 2, 0, "rp_human_male", "xovros_refugee_male9", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Fregg Cobbxor (a Backpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "backpacks")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_backpacks")
	
	--Luxury Vehicle Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 725, 0, 6627.1, 195, 0, "rp_human_male", "tatooine_luxury_speeder_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Gregonory Dyljen (a Luxury Vehicle Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle_luxury")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles_luxury")
	
	--Full Ship Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 2.9, 1.1, -8.9, 165, 610027658, "rp_moncal_male", "eisley_dockmaster_orroko_pimeub", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Tiroir Ciouskar (a Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship")
	

end