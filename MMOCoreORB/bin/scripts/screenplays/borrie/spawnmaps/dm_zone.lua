RpTestingScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTestingScreenPlay",

	planet = "rp_testing",	
	

	
	walkpointList = {

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
	local sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -7.7, 0, 33.7, 0, 1, 0, 0, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -7.7, 2, 33.7, 0, 1, 0, 0, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -5.7, 0, 33.7, 0, 1, 0, 0, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -5.7, 2, 33.7, 0, 1, 0, 0, 0) --Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -3.7, 0, 33.7, 0, 1, 0, 0, 0) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -3.7, 2, 33.7, 0, 1, 0, 0, 0) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -1.7, 0, 33.7, 0, 1, 0, 0, 0) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -1.7, 2, 33.7, 0, 1, 0, 0, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 1.7, 0, 33.7, 0, 1, 0, 0, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 1.7, 2, 33.7, 0, 1, 0, 0, 0) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 3.7, 0, 33.7, 0, 1, 0, 0, 0) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 3.7, 2, 33.7, 0, 1, 0, 0, 0) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.7, 0, 33.7, 0, 1, 0, 0, 0) --Misc/Belts
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.7, 2, 33.7, 0, 1, 0, 0, 0) --Alien
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 7.7, 0, 33.7, 0, 1, 0, 0, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 7.7, 2, 33.7, 0, 1, 0, 0, 0)--Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 9.7, 0, 33.7, 0, 1, 0, 0, 0)--Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	

--WEAPON BOXES--
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 34.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Melee Common and Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("melee_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 34.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Melee Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("melee_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 32.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Pistols Common and Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("pistol_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 32.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Pistols Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("pistol_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 30.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Carbines Common and Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("carbine_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 30.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Carbines Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("carbine_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 28.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Rifles Common and Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("rifle_common_uncommon")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 28.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Rifles Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("rifle_rare")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 26.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Shotgun/Sniper/Repeater Common and Uncommon")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("ranged_other_common")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 26.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Shotgun/Sniper/Repeater Rare")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("ranged_other_rare")




	--The good weapons--
		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 26.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Shotgun/Sniper/Repeater Epic and Legendary")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("ranged_other_epicplus")

sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 28.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Rifles Epic and Legendary")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("rifle_epicplus")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 30.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Carbines Epic and Legendary")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("carbine_epicplus")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 32.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Pistols Epic and Legendary")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("pistol_epicplus")

			sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 34.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Melee Epic and Legendary")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("melee_epicplus")





--ARMOR BOXES--
	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 22.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Light Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_light")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 20.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Light Rebel Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_light_rebel")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 18.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Light Imperial Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_light_imperial")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 22.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Medium Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_medium")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 20.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Medium Rebel and Alien Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_medium_rebel_alien")

		sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 18.4, 0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Medium Imperial Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_medium_imperial")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 22.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Heavy Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_heavy")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 4, 20.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Heavy Rebel Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_heavy_rebel")



--The good armor--
sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 16.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Epic and Legendary Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_epicplus")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 16.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Imperial Assault Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_impassault")

sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 14.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Mandalorian Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_mando")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 2, 14.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Epic Alien Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_eplicalien")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 12.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Epic Alien Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_marine")










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

--]]

end