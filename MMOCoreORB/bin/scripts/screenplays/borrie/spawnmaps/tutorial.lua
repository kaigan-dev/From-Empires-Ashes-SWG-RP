TutorialScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TutorialScreenPlay",

	planet = "tutorial",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("TutorialScreenPlay",  true)
function TutorialScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end


function TutorialScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{2.73541, -31.6821, -6.07325, 808260, -0.819152, 0, 0.573576, 0},
		{0.365212, -31.6821, -6.436, 808260, 1, 0, 0, 0},
		{-10.1142, -30, 20.7242, 808260, 1, 0, 0, 0},
		{-21.0167, -30, -7.50548, 808260, 1, 0, 0, 0},
		{-15.1334, -30, -17.8551, 808260, 1, 0, 0, 0},
		{0.467863, -31.6821, -1.302, 808260, -0.819152, 0, 0.573576, 0},
		{-21.084, -30, 10.5064, 808260, 1, 0, 0, 0},
		{7.91104, -30, 20.7406, 808260, 1, 0, 0, 0},
		{20.7994, -30, -7.6261, 808260, 1, 0, 0, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end



function TutorialScreenPlay:spawnCivilians() 
	local waypointList = {
		--[[
		{4.72347, -0.5, -5.64394, 317, 808246,{"drinker"}},
		{5.16871, -0.5, -4.7897, 292, 808246,{"drinker"}},
		{-2.34479, -0.5, -6.59509, 16, 808246,{"drinker"}},
		{-1.66772, -0.5, -6.81508, 10, 808246,{"drinker"}},
		{-1.3325, -0.5, 7.21832, 171, 808246,{"sitchair"}},
		{0.686315, -0.5, 7.06318, 178, 808246,{"sittable"}},
		{16.6843, -2.57464e-09, -14.7855, 22, 808246,{"sittable"}},
		{17.9099, -2.57464e-09, -13.558, 229, 808246,{"sittable"}},
		{19.2601, -3.44896e-09, -7.6628, 299, 808246,{"sittable"}},
		{18.0739, -3.86062e-09, -6.21071, 164, 808246,{"sittable"}},
		{9.11884, -1, 12.3299, 50, 808246,{"drinker"}},
		{11.7922, -1, 9.66497, 24, 808246,{"drinker"}},
		{10.8356, -1, 9.87871, 33, 808246,{"drinker"}},
		{15.3872, -1, 3.89547, 181, 808246,{"social"}},
		{15.31, -1, 2.95853, 1, 808246,{"social"}},
		{11.2558, -1, -9.25548, 250, 808246,{"social"}},
		{10.116, -1, -9.64896, 69, 808246,{"social"}},
		{10.4231, -1, -8.57665, 161, 808246,{"drinker"}},
		{-1.99823, -3, -25.9422, 89, 808248,{"sit"}},
		{-11.2828, -1, -10.9945, 38, 808246,{"social"}},
		{-10.1251, -1, -10.6472, 268, 808246,{"social"}},
		{-10.6164, -1, -9.41771, 197, 808246,{"social"}},
		{-16.3073, -2.57464e-09, 14.2885, 53, 808246,{"social"}},
		{-15.5088, -2.57464e-09, 16.1947, 172, 808246,{"drinker"}},
		{-14.4285, -2.57464e-09, 16.0058, 218, 808246,{"sittable"}},
		{-13.8865, -2.57464e-09, 14.7121, 276, 808246,{"none"}},
		{-14.2782, -2.57464e-09, 13.9832, 308, 808246,{"social"}},
		{-20.543, -2.57464e-09, 11.4226, 304, 808246,{"tech"}},
		{-19.7999, -2.57464e-09, 12.4818, 305, 808246,{"tech"}},
		{-18.1834, -2.57464e-09, 14.7859, 309, 808246,{"tech"}},
		{-12.6017, -1, 8.03268, 60, 808246,{"social"}},
		{-12.4996, -1, 9.33907, 129, 808246,{"none"}},
		{-11.3016, -1, 9.34907, 208, 808246,{"social"}},
		{-11.0994, -1, 7.95844, 309, 808246,{"social"}},
		{-2.62996, -1, 15.6796, 77, 808246,{"social"}},
		{-1.96422, -1, 15.8506, 255, 808246,{"drinker"}},
		{6.78271, -1, 11.0116, 67, 808246,{"drinker"}},
		{0.918975, -3, 25.4032, 44, 808250,{"social"}},
		{1.83442, -3, 26.0279, 238, 808250,{"social"}},
		{29.9479, -0.992545, -3.67403, 88, 808249,{"sit"}},
		{30.0727, -0.992545, -4.36748, 85, 808249,{"sit"}},
		{29.9169, 0.8, -16.7865, 192, 808249,{"tech"}},
		{51.2, 0.8, -21.4462, 97, 808253,{"tech"}},
		{33.1273, 0.8, -39.5241, 62, 808253,{"social"}},
		{34.0682, 0.8, -39.1692, 249, 808253,{"social"}},
		{33.9856, 0.8, -38.208, 206, 808253,{"none"}},
		{20.4654, 0.8, -27.7743, 234, 808249,{"social"}},
		{19.6018, 0.8, -28.3345, 55, 808249,{"none"}},
		{7.74799, 0.8, -29.0519, 251, 808249,{"sit"}},
		{4.35528, -0.992545, -30.6631, 63, 808248,{"social"}},
		{-15.0002, 0.8, -31.4016, 195, 808248,{"tech"}},
		{-8.50873, 0.766885, -42.5563, 106, 808259,{"tech"}},
		{-16.5073, 0.720971, -41.8899, 45, 808259,{"social"}},
		{-15.6689, 0.725997, -41.3797, 240, 808259,{"none"}},
		{-22.4643, 0.8, -25.1135, 239, 808248,{"none"}},
		{-23.4708, 0.8, -25.5648, 61, 808248,{"social"}},
		{-34.3797, -0.992938, -4.21887, 351, 808247,{"social"}},
		{-34.4331, -0.993271, -3.55227, 174, 808247,{"social"}},
		{-60.3216, -1.05359, 6.09337, 88, 808257,{"sitchair"}},
		{-58.9153, -1.03699, 6.74352, 245, 808257,{"social"}},
		{-59.0383, -1.06294, 5.72683, 284, 808257,{"none"}},
		{-41.7592, -0.958373, -6.27834, 30, 808257,{"social"}},
		{-40.5611, -0.96184, -4.88811, 217, 808257,{"social"}},
		{-39.6933, -0.947741, -4.01912, 222, 808257,{"none"}},
		{-39.6059, -0.945237, -3.05026, 186, 808257,{"none"}},
		{-29.5759, 0.8, 16.8525, 315, 808247,{"none"}},
		{-16.7337, 0.8, 24.946, 232, 808247,{"social"}},
		{-18.1217, 0.8, 23.9622, 49, 808247,{"social"}},
		{-18.1666, 0.8, 25.1282, 119, 808247,{"social"}},
		{24.1734, 0.8, 24.937, 131, 808250,{"social"}},
		{25.4673, 0.8, 23.5957, 310, 808250,{"sit"}},
		{23.6433, 0.8, 24.1009, 98, 808250,{"none"}},
		{29.5144, 0.8, 8.19157, 305, 808250,{"social"}},
		{28.8957, 0.8, 8.8373, 150, 808250,{"social"}},
		{34.5003, -0.994018, 2.02662, 262, 808249,{"sit"}},
		{34.4981, -0.99347, 3.17084, 265, 808249,{"sit"}},
		{34.5001, -0.992943, 4.27417, 261, 808249,{"sit"}},
		{34.5, -30.9926, -5.07182, 347, 808263,{"none"}},
		{24.3948, -29.2, 17.9181, 150, 808264,{"social"}},
		{23.9301, -29.2, 18.0134, 144, 808264,{"none"}},
		{9.53284, -29.2, 28.5997, 15, 808264,{"sit"}},
		{10.3434, -29.2, 28.189, 3, 808264,{"sit"}},
		{9.82328, -29.2, 33.0846, 183, 808264,{"sit"}},
		{10.8794, -29.2, 32.7412, 198, 808264,{"sit"}},
		{12.4315, -29.2, 32.2367, 116, 808264,{"sit"}},
		{-25.7644, -29.2, 23.2139, 215, 808261,{"social"}},
		{-26.5533, -29.2, 22.1471, 36, 808261,{"soc-4ia3589{-34.1866, -30.9928, 3.1299, 271, 808261,{"tech"}},
		{-13.0452, -29.2, -31.5625, 230, 808262,{"tech"}},
		{-14.1627, -29.2, -30.272, 149, 808262,{"social"}},
		{-3.42804, -30.9925, -29.9479, 184, 808262,{"sit"}},
		--]]
	}

	CivillianGenerator:spawnCivillians(self.screenplayName, "tutorial", waypointList, self.walkpointList, "generic", "spacer")
end


function TutorialScreenPlay:spawnSceneObjects() 
	
	--Travel Terminals
	--spawnSceneObject("tutorial", "object/tangible/terminal/terminal_travel_rp.iff", 37.7034, 0.8, 18.2259, 808251, 0.891006, 0, 0.453991, 0)
	
	--Signs
	
	
	--TAILOR--
	local sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -4.2, -168.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -2.2, -168.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -0.2, -168.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -4.2, -166.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -2.2, -166.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -0.2, -166.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -4.2, -164.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -2.2, -164.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -0.2, -164.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -4.2, -162.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 13.8, -2.2, -162.3, 0, 281474993981515, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 13.8, -0.2, -162.3, 80, 281474993981515, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 13.8, -4.2, -160.3, 80, 281474993981515, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 13.8, -2.2, -160.3, 80, 281474993981515, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 13.8, -0.2, -160.3, 80, 281474993981515, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 13.8, -4.2, -158.3, 80, 281474993981515, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 13.8, -2.2, -158.3, 80, 281474993981515, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	

    sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -4, 2751, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -2, 2751, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, 0, 2751, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -4, 2753, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -2, 2753, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, 0, 2753, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -4, 2755, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -2, 2755, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, 0, 2755, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 4847, -4, 2757, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1869, -2, 2757, 808274, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 1869, 0, 2757, 808274, 0, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 1869, -4, 2759, 808274, 0, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 1869, -2, 2759, 808274, 0, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 1869, 0, 2759, 808274, 0, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 1869, -4, 2761, 808274, 0, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("tutorial", "object/tangible/furniture/plain/plain_chest_s01.iff", 1869, -2, 2761, 808274, 0, 0, 1, 0)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")

end

function SpaceTansariiPointStationScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization

	--Armorsmith
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 40.8, -4.2, -154.4, -92, 281474993981515, "rp_zabrak_male", "tsp_vendor_armorsmith", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("An Armorsmith")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")
	
	--Weaponsmith (Melee)
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 40.8, -4.2, -157.4, -92, 281474993981515, "rp_rodian_male", "tsp_vendor_weaponsmith_melee", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Melee Weaponsmith")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")
	
	--Weaponsmith (Ranged)	
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 40.8, -4.2, -160.4, -92, 281474993981515, "rp_bothan_male", "tsp_vendor_weaponsmith_ranged", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Ranged Weaponsmith")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")
	
	--Vehicle Vendor
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 40.8, -4.2, -163.4, -92, 281474993981515, "rp_human_male", "tsp_vendor_vehicle", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Vehicle Vendor")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")
	

	--Stimpack Vendor
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 40.8, -4.2, -166.4, -92, 281474993981515, "rp_moncal_male", "outpost_doctor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Stimpack Vendor")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	



    --Armorsmith
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 4874, -4, 2765, 37, 808256, "rp_zabrak_male", "tsp_vendor_armorsmith", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("An Armorsmith")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")
	
	--Weaponsmith (Melee)
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 4874, -4, 2762, 267, 808256, "rp_rodian_male", "tsp_vendor_weaponsmith_melee", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Melee Weaponsmith")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")
	
	--Weaponsmith (Ranged)	
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 4874, -4, 2759, 121, 808247, "rp_bothan_male", "tsp_vendor_weaponsmith_ranged", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Ranged Weaponsmith")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")
	
	--Vehicle Vendor
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 4874, -4, 2756, 166, 808251, "rp_human_male", "tsp_vendor_vehicle", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Vehicle Vendor")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")
	

	--Stimpack Vendor
	local pNpc = spawnRoleplayMobile("tutorial", "rp_convo_npc", 1, 4874, -4, 2753, 0.168145, 271, 808257, "rp_moncal_male", "outpost_doctor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("A Stimpack Vendor")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")

end