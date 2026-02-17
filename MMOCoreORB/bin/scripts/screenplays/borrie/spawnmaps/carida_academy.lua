CaridaAcademyScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "CaridaAcademyScreenPlay",

	planet = "rp_carida",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("CaridaAcademyScreenPlay",  true)

function CaridaAcademyScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
	end
end

function CaridaAcademyScreenPlay:spawnCivilians() 
	local waypointList = {
		{50.4997, 320, 2932.61, 220, 0,{"social"}},
		{49.3382, 320, 2931.36, 41, 0,{"social"}},
		{9.84966, 320, 2937.68, 179, 0,{"social"}},
		{9.25351, 320, 2936.19, 357, 0,{"none"}},
		{9.8871, 320, 2936.17, 357, 0,{"none"}},
		{9.8871, 320, 2936.17, 358, 0,{"none"}},
		{10.5416, 320, 2936.2, 331, 0,{"none"}},
		{-9.96834, 320, 2951.5, 0, 0,{"none"}},
		{-9.93449, 320, 2952.79, 179, 0,{"social"}},
		{-41.0097, 320, 2950.81, 41, 0,{"social"}},
		{-39.8103, 320, 2950.71, 316, 0,{"social"}},
		{-39.1229, 320, 2952.34, 229, 0,{"none"}},
		{-40.3712, 320, 2953.14, 170, 0,{"none"}},
		{-14.8186, 320, 2999.42, 265, 0,{"none"}},
		{-14.9363, 320, 3000.44, 198, 0,{"none"}},
		{-30.2984, 320, 3034.93, 119, 0,{"social"}},
		{-29.1096, 320, 3033.87, 308, 0,{"social"}},
		{12.6137, 320, 3051.37, 106, 0,{"social"}},
		{13.6132, 320, 3049.84, 339, 0,{"social"}},
		{14.9406, 320, 3051.23, 257, 0,{"social"}},
		{14.6298, 320, 3050.33, 293, 0,{"none"}},
		{33.5437, 320, 3077, 360, 0,{"sit"}},
		{34.0836, 320, 3078.5, 206, 0,{"none"}},
		{33.1321, 320, 3078.44, 160, 0,{"social"}},
		{32.0093, 320.198, 3080.48, 262, 0,{"tech"}},
		{95.8229, 320, 3007, 131, 0,{"tech"}},
		{95.2655, 320, 3006.2, 77, 0,{"none"}},
		{100.751, 320.005, 2999.63, 330, 0,{"none"}},
		{91.1066, 320, 2980.56, 358, 0,{"sit"}},
		{89.1278, 320, 3021.75, 37, 0,{"social"}},
		{90.2106, 320, 3023.22, 216, 0,{"social"}},
		{89.5348, 320, 3023.35, 169, 0,{"none"}},
		{66.5572, 322.501, 3045.21, 220, 0,{"sit"}},
		{65.9212, 322.501, 3045.87, 220, 0,{"sit"}},
		{59.922, 320, 3040.74, 52, 0,{"social"}},
		{27.0625, 320, 2970.87, 326, 0,{"none"}},
		{26.5597, 320, 2971.88, 153, 0,{"social"}},
		{28.1192, 320, 2972.8, 217, 0,{"none"}},
		{16.7349, 320, 2910.6, 122, 0,{"none"}},
		{17.1146, 320, 2909.16, 345, 0,{"none"}},
		{18.2537, 320, 2910.22, 278, 0,{"none"}},
		{5.57807, 320.129, 2898.31, 287, 0,{"social"}},
		{3.61506, 320.107, 2898.73, 259, 0,{"none"}},
		{4.59186, 320.106, 2898.82, 116, 0,{"none"}},
		{2.46393, 320.117, 2898.32, 63, 0,{"social"}},
		{3.25138, 320.082, 2899.47, 214, 0,{"none"}},
		{-62.5628, 320.042, 2917.8, 328, 0,{"sit"}},
		{-60.194, 320.008, 2921.07, 171, 0,{"tech"}},
		{-103.035, 320.271, 2932.67, 245, 0,{"none"}},
		{-102.185, 320.343, 2934.6, 140, 0,{"none"}},
		{-101.242, 320.27, 2933.51, 318, 0,{"social"}},
		{65.3491, 320, 2975.07, 145, 0,{"none"}},
		{66.9304, 320, 2974.14, 344, 0,{"social"}},
		{66.1936, 320, 2973.62, 329, 0,{"social"}},
		{66.6421, 320, 2975.26, 163, 0,{"social"}},
		{56.4206, 320, 2961.89, 260, 0,{"none"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_carida", waypointList, self.walkpointList, "carida", "carida")
end

function CaridaAcademyScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_carida", "object/tangible/terminal/terminal_travel_rp.iff", 28.23, 320.51, 2895.22, 1, 0, 0, 0, 0)
	
	--Signs
	
	
	--TAILOR--
	

end

function CaridaAcademyScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	--Imperial Requisition Vendor
	--local pNpc = spawnRoleplayMobile("rp_carida", "rp_convo_npc", 1, 32.6488, 320, 3087.64, 95, 0, "rp_human_male", "faction/imperial/officer_navy", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("Semptimarn Xaxill (an Imperial Quartermaster)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "imperial")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_imperial")

end