RpTestingScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTestingScreenPlay",

	planet = "rp_testing",	
	

	
	walkpointList = {
		market_shopper1 = {
			--[[
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
			--]]
		},
	}
	
	
}

registerScreenPlay("RpTestingScreenPlay",  true)

function RpTestingScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end



function RpTestingScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		{538.877, -0.25, 223.016, 0, -0.0348994, 0, 0.999391, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end


function RpTestingScreenPlay:spawnCivilians() 
	local waypointList = {
		--[[
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		{786.172, 0, 191.22, 228, 0,{"none"}},
		{929.494, 0.25, 148.493, 354, 0,{"sit"}},
		{1072.39, 0, 96.3649, 217, 0,{"sit"}},
		{1073.37, 0, 95.1716, 195, 0,{"sit"}},
		--]]
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_testing", waypointList, self.walkpointList, "tatooine", "tatooine")
end



function RpTestingScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	--[[
	spawnSceneObject("rp_testing", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 610008050, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_testing", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 610008050, 1, 0, 0, 0)
	spawnSceneObject("rp_testing", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 610008050, 1, 0, 0, 0)
	spawnSceneObject("rp_testing", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 610008050, 0.909306, 0, -0.416129, 0)
	--]]

	
	--Signs
	--[[
	local sObj = spawnSceneObject("rp_testing", "object/tangible/sign/all_sign_city_s03.iff", 947.255, 0, 139.882, 0, 0.97237, 0, 0.233445, 0) --Tailor Sign
	SceneObject(sObj):setCustomObjectName("Eisley Tailoring")
	sObj = spawnSceneObject("rp_testing", "object/tangible/swsovrp/prop2/thm_sign_welcome_hanging.iff", -1437.4, 190, 1942.8, 125, 0, 0, 1, 0) --Beware of Dog
	SceneObject(sObj):setCustomObjectName("Beware of Dog")
--]]
	--TAILOR--
	Obj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -7.7, 0, 33.6, 141, 0, 0, -0.00579456, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -7.7, 2, 33.6, 141, 0, 0.999983, 0, -0.00579456, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -5.7, 0, 33.6, 141, 0, 0.999983, 0, -0.00579456, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -5.7, 2, 33.6, 141, 0, 0.999983, 0, -0.00579456, 0) --Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/chest_modern_style_01.iff", -3.7, 0, 33.6, 141, 0, 0.707104, 0.707105, -0.00133156, 0.00133156) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/chest_modern_style_01.iff", -3.7, 2, 33.6, 141, 0, 0.707104, 0.707105, -0.00133156, 0.00133156) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/chest_modern_style_01.iff", -1.7, 0, 33.6, 141, 0, 0.707104, 0.707105, -0.00133156, 0.00133156) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -1.7, 2, 33.6, 141, 0, -0.702997, 0, 0.711192, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 1.7, 0, 33.6, 141, 0, -0.702997, 0, 0.711192, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/chest_modern_style_01.iff", 1.7, 2, 33.6, 141, 0, 0.707104, 0.707105, -0.00133156, 0.00133156) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/chest_modern_style_01.iff", 3.7, 0, 33.6, 141, 0, 0.707104, 0.707105, -0.00133156, 0.00133156) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/chest_modern_style_01.iff", 3.7, 2, 33.6, 141, 0, 0.707104, 0.707105, -0.00133156, 0.00133156) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.7, 0, 33.6, 141, 0, -0.702997, 0, 0.711192, 0) --Misc/Belts
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.7, 2, 33.6, 141, 0, -0.702997, 0, 0.711192, 0) --Alien
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 7.7, 0, 33.6, 141, 0, -0.702997, 0, 0.711192, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 7.7, 2, 33.6, 141, 0, -0.702997, 0, 0.711192, 0)--Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 9.7, 0, 33.6, 141, 0, -0.702997, 0, 0.711192, 0)--Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	

--WEAPON BOXES--
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 24.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Melee Common/Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("melee_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 24.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Melee Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("melee_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 22.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Pistols Common/Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("pistol_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 22.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Pistols Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("pistol_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 20.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Carbines Common/Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("carbine_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 20.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Carbines Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("carbine_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 18.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Rifles Common/Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("rifle_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 18.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Rifles Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("rifle_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 16.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Shotgun/Sniper/Repeater Common/Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("other_ranged_common_uncommmon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 16.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Shotgun/Sniper/Repeater Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("other_ranged_rare")




--ARMOR BOXES--
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 12.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Light Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("light_armor")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 12.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Medium Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("medium_armor")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 12.4, -94, 0, -0.702997, 0, 0.711192, 0)
	SceneObject(sObj):setCustomObjectName("Heavy Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("heavy_armor")

	--FURNITURE--
	--[[
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.694885, -3.97117, -10.4214, 610008483, 0.707259, 0, -0.706924, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Cheap")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_cheap")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.691284, -3.97117, -8.90924, 610008483, 0.70769, 0, -0.706407, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Elegant")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_elegant")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.690125, -3.97117, -7.39197, 610008483, 0.707785, 0, -0.706293, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Modern")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_modern")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.688965, -3.97117, -5.8797, 610008483, 0.707853, 0, -0.706212, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plain")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plain")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.688354, -3.97117, -4.35455, 610008483, 0.707903, 0, -0.706152, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Technical")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_technical")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.686218, -3.97117, -2.82239, 610008483, 0.708018, 0, -0.706014, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Misc")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_misc")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_chest_s01.iff", 0.73291, -3.97117, -1.45932, 610008483, 0.70727, 0, -0.706911, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Decorative")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_decorative")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", -7.53796, -3.97117, -5.85431, 610008483, 0.70797, 0, 0.706071, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, City")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_city")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_armoire_s01.iff", -7.53625, -3.97117, -7.39255, 610008483, 0.707887, 0, 0.706171, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Paintings")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_paintings")
	
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/plain/plain_chest_s01.iff", -5.59229, -3.97117, -7.88876, 610008483, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plants")
	
	--Jukebox--
	spawnSceneObject("rp_testing", "object/tangible/terminal/terminal_jukebox.iff", 27.0829, -0.894995, 8.68511, 610008176, -0.707107, 0, 0.707107, 0)
--]]
end

function RpTestingScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	

	
	local pNpc
	--[[
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1048, 0, 58.6983, 104, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1006.88, 0, 120.202, 88, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1009.15, 0, 118.872, 0, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1003.97, 0, 124.102, 128, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1004.04, 0, 123.296, 31, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1015.13, 0, 109.634, 127, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1016.19, 0, 109.7, 178, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1019.08, 0, 112.424, 6, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 996.454, 0, 156.619, 158, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 927.062, 0, 176.94, 219, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 827.661, 0, 185.862, 278, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 826.763, 0, 186.541, 124, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 824.342, 0, 193.96, 163, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 784.537, 0, 189.978, 97, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 805.457, 0.0521921, 148.683, 227, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 744.463, 0, 131.521, 215, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 744.391, 0, 123.51, 335, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 612.202, 0, 170.174, 118, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 628.829, 0.3, 141.032, 245, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 627.593, 0, 141.133, 127, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 628.028, 0.3, 139.64, 300, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 509.489, 0, 110.317, 141, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 511.334, 0, 110.163, 263, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 502.688, 0.3, 161.276, 131, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 447.169, 0, 161.999, 100, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 418.697, 0, 130.05, 248, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 647.104, 0, 125.541, 162, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 652.651, 0, 122.754, 240, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 676.389, 0, 49.131, 300, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 675.213, 0, 51.7731, 169, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 662.93, 0, 22.3811, 129, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 661.526, 0, 20.4032, 225, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 663.211, 0, 19.7971, 321, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 621.731, 0, -42.8493, 0, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 620.874, 0, -43.9168, 294, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 586.441, 0.3, -71.7516, 75, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 609.683, 0.3, -104.207, 316, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 609.789, 0.3, -102.846, 268, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 633.818, 0.3, -139.467, 62, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 708.75, 0, -166.679, 216, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 675.021, 0, -156.163, 237, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 813.286, 0, -122.393, 66, 0, "dewback", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 820.748, 0, -119.175, 218, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 881.388, 0, -78.9323, 322, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 881.584, 0, -77.7988, 274, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 880.384, 0, -78.6436, 4, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 880.562, 0, -76.7914, 186, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 901.492, 0, -63.3507, 279, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 829.183, 0, -43.7441, 35, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 815.421, 0, 32.8535, 125, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 837.793, 0, 82.4542, 101, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 838.24, 0, 81.1182, 81, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 759.982, 0, 238.435, 288, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 739.514, 0, 267.415, 181, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 740.048, 0, 266.856, 212, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 740.216, 0, 265.608, 0, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 708.338, 0, 216.865, 269, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 708.917, 0, 217.712, 239, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 707.807, 0, 228.082, 222, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 716.827, 0, 208.189, 25, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 706.866, 0, 208.148, 52, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 643.372, 0, 264.919, 336, 0, "le_repair_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 648.857, 0.3, 195.831, 0, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 648.647, 0.3, 198.091, 128, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 705.521, 0, 320.413, 113, 0, "r4", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 632.025, 0, 281.805, 0, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 633.893, 0, 282.546, 0, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 625.238, 0, 278.203, 34, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 565.31, 0, 266.194, 52, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 569.579, 0, 264.918, 0, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 561.838, 0, 382.036, 254, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 493.453, 0, 319.212, 190, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 489.637, 0, 320.001, 169, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 544.159, 0, 259.951, 222, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 607.371, 0, 259.385, 0, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 583.329, 0, 365.666, 317, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 664.016, 0, 243.901, 50, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 689.399, 0, 207.474, 47, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 649.766, 0, 152.591, 44, 0, "3po_protocol_droid_red", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 682.719, 0, 181.581, 257, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 682.719, 0, 181.581, 257, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 682.329, 0, 182.406, 196, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 681.456, 0, 181.357, 82, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 604.364, 0, 125.199, 271, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 651.064, 0, -22.5284, 124, 0, "r4", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 742.859, 0, 105.685, 300, 0, "3po_protocol_droid_silver", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 703.607, 0, 115.519, 0, 0, "3po_protocol_droid_red", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 687.482, 0, 100.856, 39, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 853.693, 0, 128.676, 134, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 838.244, 0, -84.0254, 192, 0, "r2", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r2")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 838.654, 0, -86.347, 332, 0, "le_repair_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 935.544, 0, -115.692, 238, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1028, 0, -161.267, 287, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1026.95, 0, -161.771, 318, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1030.18, 0, -160.16, 272, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1264.89, 0, 65.9058, 0, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1257.25, 0, 365.025, 8, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1165.9, 0, 305.198, 126, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1114.37, 0.3, 255.425, 1, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1115.35, 0.3, 255.706, 296, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1113.49, 0.3, 256.174, 89, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 951.653, 0, 281.706, 260, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 935.664, 0, 309.411, 0, 0, "r2", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r2")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 896.042, 0.3, 317.786, 104, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 896.871, 0.3, 317.767, 209, 0, "3po_protocol_droid_red", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 897.543, 0.3, 317.073, 305, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 993.75, 0, 402.952, 0, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 964.967, 0, 416.164, 32, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 963.806, 0, 416.162, 60, 0, "r4", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 964.551, 0, 417.05, 94, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 990.522, 0, 467.993, 336, 0, "3po_protocol_droid_red", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 943.218, 0.3, 254.092, 0, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 922.842, 0, 305.332, 219, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 950.81, 0, 138.817, 75, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1066.87, 0, 53.6383, 219, 0, "le_repair_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1058.91, 0, 81.2596, 164, 0, "r3", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r3")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1051.22, 0, 104.356, 174, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1068.83, 0, 37.2625, 293, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1067.66, 0, 37.4098, 51, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1034.59, 0, 33.3862, 97, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1054.84, 0, 111.016, 28, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1074.55, 0, 89.9502, 21, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1075.29, 0, 90.7819, 230, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 776.632, 0, -39.4721, 140, 0, "cll8_binary_load_lifter", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")
	
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, -1381.7, 179.5, 1924.2, -165, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, -1382.5, 179.7, 1922.0, -7, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
--]]
	--VENDORS--
	
	--Melee Vendor Light
--[[
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, -1476.1, 180.1, 1942.5, 44, 610021764, "rp_human_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Madman (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_me-7.1le37.9Sc-31.9ec7(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, -7.1, 37.9, -31.9, 74, 610021764, "rp_human_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Madman (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	--Ranged Vendor Light
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 750.769, 0, 275.276, 222, 0, "rp_zabrak_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Gjolan (a Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")

	--Camping Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 738.375, 0, 275.533, 90, 0, "rp_human_female", "xovros_vendor_camping", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Raphella Lees (a Camping Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")

	--Instrument Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 689.751, 0, 218.815, 89, 0, "rp_twilek_male", "xovros_hotel_receptionist", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Nayosan Yi'frit (an Instrument Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "music")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_instruments")

	--Speeder Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 666.118, 0, 243.782, 118, 0, "rp_rodian_male", "vehicle_dealer_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Sprei Ikiki (a Speeder Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")

	--Mount Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 491.48, 0, 316.591, 192, 0, "rp_gotal_male", "vendor_mount", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Pyvaln Rokk (a Mount Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mount")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mounts_tatooine")
	
	--Cheap Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 482.509, 0, 131.549, 330, 0, "rp_gran_male", "xovros_nurse", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Horuuk Kyl (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	
	--Specialty Shop Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 4.5236, 0.408271, 0.665532, 87, 610008479, "rp_rodian_male", "eisley_specialty_shop_beebo", "default", "eisley_specialty_shop_beebo", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Beebo (a Specialty Item Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")
	
	--Junker Ship Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 575.455, 	0, 	316.082, 324, 0, "rp_sullustan_male", "sulon_vendor_ranged_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Nedd Tarunng (a Junker Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship_cheap")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship_cheap")
	
	--Armorsmith Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 3.78393, 	-0.378217, 	-5.28738, 	275, 	610008471, "rp_ithorian_male", "eisley_armorsmith_biemio_faom", "default", "eisley_armorsmith_biemio_faom", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Biemio Faom (an Armorsmith Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")
	
	--Weaponsmith Vendor (Ranged)
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 3.84223, 0.75,  -0.247093, 358, 610009368, "rp_quarren_male", "eisley_weaponsmith_kefarack_tajus", "default", "eisley_weaponsmith_kefarack_tajus", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kefarack Tajus (a Weaponsmith Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")
	
	--Weaponsmith Vendor (Melee)
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, -0.467513, 0.75, -0.458854, 0, 610009368, "rp_trandoshan_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Rokk (a Weaponsmith Melee Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	--Bartender of Chalmun's Cantina, Wuher
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 8.62285, 	-0.894992, 	0.447493, 	87, 	610008176, "wuher", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Wuher")
	
	--Mandalorian Scout
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 1199.24, 0, -63.3539, 131, 0, "rp_zabrak_male", "mando_vagabond", "default", "myok_scov", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kar'eyce (a Mandalorian Vagabond)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mando_noob")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mando_noob")
	
	--Transmog Vendor
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 0.07613, 0.611579, -6.57677, 335, 610009373, "rp_human_male", "vendor_transmog", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("Dyutine Hukchar (a Disguise Vendor)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "transmog")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_transmog")
	
	--Junk Dealer
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 3.99394, -0.478888, 2.17333, 282, 610009017, "dressed_armorsmith_trainer_01", "default", "default", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Orek Flyn (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "junkdealer")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_junkdealer")
	
	--Eisley Doctor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 454.824, 1.99121, 149.205, 241, 0, "rp_human_male", "eisley_doctor_rahar_mawolki", "default", "eisley_doctor_rahar_mawolki") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Dr. Rahar Mawolki")
	
	--The Dockmaster, Orroko Pimeub
	pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1067.58, 0, 52.5186, 296, 0, "rp_gran_male", "eisley_dockmaster_orroko_pimeub", "default", "eisley_dockmaster_orroko_pimeub") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Orroko Pimeub (a Dockmaster)")
	
	--Moqeni, the Major Domo for the Hutts of Eisley
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, -7.4215, 3.07248, -20.522, 26, 610008299, "rp_smc_female", "eisley_majordomo_moqeni", "default", "eisley_majordomo_moqeni") --Equip, Skill, Customization
	--SceneObject(pNpc):setCustomObjectName("Moqeni (a Majordomo)")
	
	--Eisley's Tailor, the Bith Doivo Cilea
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 4.13958, 0.408271, 0.354657, 197, 610008132, "rp_bith_female", "eisley_tailor_doivo_cilea", "default", "eisley_tailor_doivo_cilea", "rp_eisley_tailor") --Tailor
	SceneObject(pNpc):setCustomObjectName("Doivo Cilea")
	
	--Backpack Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 958.619, 0, 134.246, 33, 0, "rp_human_male", "xovros_refugee_male9", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Fregg Cobbxor (a Backpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "backpacks")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_backpacks")
	
	--Luxury Vehicle Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 686.667, 0, 129.118, 83, 0, "rp_human_male", "tatooine_luxury_speeder_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Gregonory Dyljen (a Luxury Vehicle Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle_luxury")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles_luxury")
	
	--Silver Dawn Vendor
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 1188.15, 0, 382.792, 311, 0, "rp_human_male", "lirril/silver_servant", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Vendor")
	--SceneObject(pNpc):setStoredString("vendor:theme", "silver_dawn")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_silver_dawn")
	
	--Full Ship Vendor
	pNpc = spawnRoleplayMobile("rp_testing", "rp_convo_npc", 1, 6.4093, 0.40827, -8.98533, 0, 610009177, "rp_moncal_male", "eisley_dockmaster_orroko_pimeub", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Tiroir Ciouskar (a Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship")
	
	--Temporary Silver Dawn NPCs
	--Temporary in that they need to be official faction NPCs tied to a base. But for now, this should make Lirril, Samari and Ykeer happy.
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 847.32, 0, 177.202, 196, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 816.409, 0.3, 316.096, 239, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 765.047, 2.0752, 270.323, 272, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 724.046, 0, 154.989, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 702.913, 0, 154.147, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1028.9, 0, 110.038, 319, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1036.26, -0.5, 117.469, 307, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1075.65, 0, 256.614, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1236.33, 0, 316.577, 179, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
	--pNpc = spawnRoleplayMobile("rp_testing", "rp_base_npc", 1, 1243.52, 0, 373.891, 0, 0, "rp_human_male", "lirril/silvertrooper", "factional/common/trooper", "default", "default")
	--SceneObject(pNpc):setCustomObjectName("a Silver Dawn Trooper")
--]]

end