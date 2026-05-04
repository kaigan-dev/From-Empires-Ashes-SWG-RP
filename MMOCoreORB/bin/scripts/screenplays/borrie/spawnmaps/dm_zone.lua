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




	--The good weapons - DO NOT DELETE
	--[[
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
--]]




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



--The good armor - DO NOT DELETE
--[[
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
	SceneObject(sObj):populateInventoryFromContentList("armor_epicalien")

	sObj = spawnSceneObject("rp_testing", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 24.4, 0, 12.4,0, 0, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Galactic Marine Armor")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("armor_marine")
--]]

end

function RpTestingScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	local pNpc
	
end