local Logger = require("utils.logger")

RpTatooineBestineScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineBestineScreenPlay",

	planet = "rp_tatooine",	
	
	walkpointList = {

	}
	
	
}

registerScreenPlay("RpTatooineBestineScreenPlay",  true)

function RpTatooineBestineScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		--self:spawnJunkPiles()
	end
end

--[[
function RpTatooineBestineScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end
--]]




function RpTatooineBestineScreenPlay:spawnCivilians() 
	local waypointList = {
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		-- NPC civilians at Bestine entrance,
		{879.7, 0, 6332.4, 100, 0, {"none"}},
		{881.4, 0, 6331.8, 260, 0, {"social"}},
	    {899.5, 0, 6363.1, 266, 0, {"tech"}},
        {936.4, 0, 6345.5, 205, 0, {"ssocial"}},
		{933.1, 0, 6333.7, 100, 0, {"social"}},
		{901.5, 0, 6410.9, 270, 0, {"sit"}},
		{871.8, 0, 6377.8, 300, 0, {"none"}},
		{794.3, 0, 6331, 25, 0, {"none"}},
		{855, 0, 6348.1, 5, 0, {"tech"}},
		{856.8, 0, 6344.1, 5, 0, {"crouch"}},
		--Theatre and govenors palace plaza civilians,
		{737.4, 0.5, 6514.2, 170, 0, {"social"}},
		{740, 0.5, 6513.7, 205, 0, {"none"}},
		{737.2, 0.5, 6510.2, 1, 0, {"social"}},
		{735.1, 0.5, 6511.1, 10, 0, {"social"}},
		{733.6, 0.5, 6513, 42, 0, {"none"}},
		{762.9, 0.5, 6493.7, 9, 0, {"none"}},
		{765.1, 0.5, 6498.2, 270, 0, {"social"}},
		{762.1, 0.5, 6500.5, 159, 0, {"none"}},
		{692.1, 1, 6489.6, 339, 0, {"social"}},
		{676, 0, 6557.6, 320, 0, {"none"}},
		{656.8, 0.2, 6578.8, 355, 0, {"none"}},
		{655.3, 0.2, 6580, 19, 0, {"none"}},
		{653.4, 0.2, 6581.2, 28, 0, {"none"}},
		{651.5, 0.2, 6582.1, 71, 0, {"none"}},
		{652, 0.2, 6570, 254, 0, {"none"}},
		{650.8, 0.2, 6571.8, 229, 0, {"none"}},
		{647.6, 0.2, 6574.3, 117, 0, {"social"}},
		{647.3, 0.2, 6569.6, 22, 0, {"none"}},
		{656.6, 0, 6533.3, 44, 0, {"none"}},
		{659.1, 0, 6536, 231, 0, {"none"}},
		{636.9, 0, 6555.2, 152, 0, {"none"}},
		{635.1, 0, 6545.9, 18, 0, {"social"}},
		{637.7, 0, 6553.3, 310, 0, {"none"}},
		{755.3, 0.5, 6587.2, 210, 0, {"none"}},
		{753.9, 0.5, 6585.2, 33, 0, {"social"}},
		-- palace-side cantina internal npcs,
		{4.2, -0.5, -1.7, 4, 610029524, {"drinker"}},
		{2.3, -0.5, 6, 101, 610029524, {"None"}},
		{-2.6, -0.5, -6.1, 350, 610029524, {"sittable"}},
		{-3.9, -0.5, -3.1, 141, 610029524, {"sittable"}},
		{4.6, -0.5, -4.2, 37, 610029524, {"drinker"}},
		{6.2, -0.5, -2.6, 210, 610029524, {"none"}},
		{2.1, -0.5, 5.2, 88, 610029524, {"sittable"}},
		
		-- Market street civilians,
		{543.5, 0, 6506.9, 36, 0, {"sit"}},
		{547.3, 0, 6505.6, 305, 0, {"none"}},
		{509, 0, 6584.4, 120, 0, {"none"}},
		{508.7, 0, 6582.7, 146, 0, {"none"}},
		{506.6, 0, 6580.6, 226, 0, {"none"}},
		{504.1, 0, 6580.8, 94, 0, {"social"}},
		{498.1, 0, 6605.1, 168, 0, {"none"}},
		{495.2, 0, 6601.2, 306, 0, {"none"}},
		{502.9, 0, 6600.2, 269, 0, {"social"}},
		{501.2, 0, 6598.1, 332, 0, {"none"}},
		{497.6, 0, 6599.5, 109, 0, {"none"}},
		{499.3, 0, 6600.8, 141, 0, {"none"}},
		{501.6, 0, 6601.6, 206, 0, {"none"}},
		{473.7, 0, 6620.2, 202, 0, {"none"}},
		{471, 0, 6605.9, 109, 0, {"social"}},
		{473.2, 0, 6604.8, 290, 0, {"none"}},
		{475.2, 0, 6614.7, 311, 0, {"sittable"}},
		{472.9, 0, 6615.3, 78, 0, {"sittable"}},
		{473.9, 0, 6616.9, 162, 0, {"sittable"}},
		{463.4, 0, 6611.2, 56, 0, {"none"}},
		{464.9, 0, 6612.2, 216, 0, {"social"}},
		{450, 0, 6620.1, 143, 0, {"social"}},
		{452, 0, 6618.2, 327, 0, {"social"}},
		{452.2, 0, 6617.1, 323, 0, {"none"}},
		{452.6, 0, 6615.5, 29, 0, {"none"}},
		{452.8, 0, 6614.1, 283, 0, {"none"}},
		{450.3, 0, 6614.4, 87, 0, {"social"}},
		{470.4, 0, 6601.6, 291, 0, {"none"}},
		{468.6, 0, 6599.5, 200, 0, {"tech"}},
		{461.7, 0, 6598.8, 128, 0, {"none"}},
		{464.2, 0, 6596.7, 316, 0, {"social"}},
		{422.3, 0, 6661.3, 224, 0, {"social"}},
		{403.4, 0.1, 6616.6, 69, 0, {"sittable"}},
		{401.6, 0, 6621.8, 78, 0, {"none"}},
		{402.9, 0, 6621.2, 337, 0, {"none"}},
		{407.5, 0, 6618.4, 34, 0, {"none"}},
		{407.1, 0, 6614.5, 168, 0, {"social"}},
		{407, 0, 6612.6, 8, 0, {"none"}},
		{408.9, 0, 6612.9, 0, {"none"}},
		{410.9, 0, 6612.2, 292, 0, {"none"}},
		{410.2, 0, 6614.2, 236, 0, {"none"}},
		{399.8, 0, 6615.8, 222, 0, {"none"}},
		{387.1, 0.5, 6620.7, 352, 0, {"sit"}},
		{412.4, 0, 6606.7, 36, 0, {"none"}},
		{423.5, 0, 6608.2, 220, 0, {"social"}},
		{421.1, 0, 6609.7, 175, 0, {"none"}},
		{450.3, 0, 6577.3, 187, 0, {"none"}},
		{419.3, 0.5, 6592.2, 100, 0, {"none"}},
		{420.5, 0.5, 6593.7, 132, 0, {"none"}},
		{422.4, 0.5, 6592.7, 280, 0, {"none"}},
		{421.6, 0.5, 6590.6, 308, 0, {"social"}},
		{420.4, 0.5, 6589.2, 327, 0, {"none"}},
	



		{8.6, -0.9, 0.4, 86, 610030372, {"social"}} --[[replacement Bestine starport cantina npc]],
		-- starport cantina npcs
		{-4, -0.9, -4.8, 6, 610030372, {"drinker"}},
		{-2.2, -0.9, -5, 2, 610030372, {"none"}},
		{-0.3, -0.9, -4.8, 305, 610030372, {"social"}},
		{2.3, -0.9, -4.8, 5, 610030372, {"drinker"}},
		{3.8, -0.9, -4.8, 354, 610030372, {"drinker"}},
		{4.8, -0.9, -4.8, 345, 610030372, {"none"}},
		{5.3, -0.9, 5.7, 195, 610030372, {"social"}},
		{3.7, -0.9, 5.9, 280, 610030372, {"social"}},
		{1.9, -0.9, 6.2, 93, 610030372, {"none"}},
		{0.7, -0.9, 5.7, 159, 610030372, {"drinker"}},
		{-1.8, -0.9, 5.7, 197, 610030372, {"none"}},
		{-3.3, -0.9, 5.7, 154, 610030372, {"drinker"}},
		{-5.1, -0.9, 6.8, 77, 610030372, {"none"}},
		{-3.1, -0.9, 7.4, 251, 610030372, {"social"}},
		{9.8, -0.9, 16.3, 234, 610030376, {"sittable"}},
		{6.4, -0.9, 14.3, 59, 610030376, {"sittable"}},
		{13.7, -0.9, -10.5, 251, 610030372, {"sittable"}},
		{12.3, -0.9, -8.8, 171, 610030372, {"sittable"}},
		{10.8, -0.9, -10.4, 78, 610030372, {"sittable"}},
		{36, 0.1, 0.7, 310, 610030371, {"sittable"}},
		{35.7, 0.1, 3.1, 217, 610030371, {"sittable"}},
		{25.7, -0.9, -18.7, 256, 610030373, {"sittable"}},
		{25.7, -0.9, -19.6, 256, 610030373, {"sittable"}},
		{22.1, -0.9, -19.6, 68, 10030373, {"sittable"}},
		{21.9, -0.9, -18.3, 106, 610030373, {"social"}},
		{22.7, -0.9, -17.4, 137, 610030373, {"sittable"}},
		{24.2, -0.9, -21, 359, 610030373, {"sittable"}},

	}
	

	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function RpTatooineBestineScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", -0.7, 0.6, 50.1, 610030334, 1, 0, 0, 0) 
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", -0.4, 0.6, 50.2, 610030356, 1, 0, 0, 0)
	
	
	--Signs
	local sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 492.4, 0, 6544.1, 0, 1, 0, 0.2, 0) --Weapon store Sign
	SceneObject(sObj):setCustomObjectName("Bestine Munitions")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 691.4, 0, 6631.3, 0, 1, 0, -0.1, 0) --tailors Sign
	SceneObject(sObj):setCustomObjectName("Tailors")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 502.9, 0, 6630.1, 0, 1, 0, -0.8, 0) --furniture/special Sign
	SceneObject(sObj):setCustomObjectName("Specialty store")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 642.5, 0, 6488.1, 0, 1, 0, -0.8, 0) --medical clinic Sign
	SceneObject(sObj):setCustomObjectName("Bestine clinic")
sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 43.6, 60.4, 6467.3, 0, 1, 0, -0.8, 0) --junkyard Sign blah
	SceneObject(sObj):setCustomObjectName("Good as new")

	--Test
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.4, 0.5, -11, 610027663, 0.999983, 0, 0.3, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	
	--TAILOR--
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -8.4, 2.2, -16.9, 610029850, 0, 0, 0.8, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -5.4, 2.2, -16.9, 610029850, 0, 0, 0.8, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -2.4, 2.2, -16.9, 610029850, 0, 0, 0.8, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 0.4, 2.2, -16.9, 610029850, 0, 0, 0.8, 0) --Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 3.4, 2.2, -16.9, 610029850, 0, 0, 0.8, 0) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 3.4, 3.7, -16.9, 610029850, 0, 0, 0.8, 0) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 3.4, 5.2, -16.9, 610029850, 0, 0, 0.8, 0) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 6.4, 2.2, -16.9, 610029850, 0, 0, 0.8, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -9.4, 2.2, -21.5, 610029850, 0, 0, -0.9, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", -6.4, 2.2, -21.5, 610029850, 0, 0, -0.9, 0) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", -6.4, 3.7, -21.5, 610029850, 0, 0, -0.9, 0) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", -6.4, 5.2, -21.5, 610029850, 0, 0, -0.9, 0) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -3.4, 2.2, -21.5, 610029849, 0, 0, -0.9, 0) --Misc/Belts bro
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 0.4, 2.2, -21.5, 610029850, 0, 0, -0.9, 0) --Alien
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 3.4, 2.2, -21.5, 610029850, 0, 0, -0.9, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 6.4, 2.2, -21.5, 610029850, 0, 0, -0.9, 0)--Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 9.4, 2.2, -21.5, 610029850, 0, 0, -0.9, 0)--Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	
	--FURNITURE--
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 4.7, 610029601, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Cheap")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_cheap")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 6.2, 610029601, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Elegant")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_elegant")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 7.7, 610029601, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Modern")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_modern")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -9.4, 1, 9.2, 610029601, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plain")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plain")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1.7, 1, 4.7, 610029601, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Technical")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_technical")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1.7, 1, 6.2, 610029601, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Misc")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_misc")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_chest_s01.iff", 1.7, 1, 7.7, 610029601, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Decorative")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_decorative")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 1.7, 1, 9.2, 610029601, 0, 0, -0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, City")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_city")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -4.8, 1, 10.4, 610029601, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Paintings")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_paintings")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_chest_s01.iff", -1.7, 1, 10.4, 610029601, 0, 0, 0.8, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plants")
	
	--Jukebox--
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_jukebox.iff", 7.4, -0.5, -1.1, 610029524, 0, 0, -0.8, 0)

end

function RpTatooineBestineScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	local pNpc
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 936.5, 0, 6330.8, 310, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 883.2, 0, 6366, 350, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 883.5, 0, 6367.4, 190, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 947.3, 0, 6391.3, 212, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 946.5, 0, 6389.9, 336, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 944.3, 0, 6391.3, 38, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 702.1, 0, 6471.7, 44, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 704.1, 0, 6471.5, 343, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 594.9, 0, 6520.7, 302, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 592.5, 0, 6522, 115, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 581.1, 0, 6576, 346, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 580.2, 0, 6578.3, 155, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 579.9, 0, 6575.7, 53, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 582.6, 0, 6577.4, 244, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 513.4, 0, 6613.1, 314, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 510.2, 0, 6615.6, 124, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 435.5, 0, 6650.5, 222, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 436.6, 0, 6649.7, 221, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 434.7, 0, 6651, 223, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 328, 0, 6756.6, 170, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 330.4, 0, 6764.3, 315, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 327.9, 0, 6764.3, 5, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 369.4, 0, 6706.2, 167, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 370.4, 0, 6703, 332, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 517.3, 0, 6778.9, 314, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 518.8, 0, 6780.3, 243, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 569.5, 0, 6745.2, 16, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 565.5, 0, 6743.5, 51, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 571, 0, 6668.5, 159, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 571.5, 0, 6666.7, 357, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 573.3, 0, 6664.4, 285, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 573.1, 0, 6668.7, 292, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 573, 0, 6670.7, 228, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 772.8, 0, 6638, 127, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 774.9, 0, 6636.6, 304, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 35, 61.3, 6526.6, 254, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 32.9, 61.4, 6526.1, 54, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 35, 61.2, 6525.7, 354, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 342.3, 0, 6578.7, 127, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 343.9, 0, 6577.7, 316, 0, "jawa", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 523.6, 0, 6557.7, 303, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 871.3, 0, 6374.2, 195, 0, "ronto", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Ronto")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 636.4, 0, 6502.7, 275, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 331.7, 0, 6636.2, 120, 0, "dewback", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Dewback")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 851.1, 0, 6464.9, 220, 0, "wed_treadwell", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 703.8, 2.1, 6689.8, 20, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 706.3, 2.4, 6690.8, 245, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 700.7, 2.3, 6693.4, 288, 0, "nuna", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Nuna")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 807.5, 0.8, 6415.9, 75, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 2.2, 0.3, 5.6, 144, 610029899, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 909.7, 0, 6400.7, 270, 0, "eg6_power_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 794.7, 0.2, 6340.5, 280, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 793.1, 0, 6326.7, 128, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 796.5, 0, 6320.3, 168, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 801.2, 0, 6319, 220, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 785.7, 0, 6320.6, 240, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 785.6, 0, 6321.1, 225, 0, "pit_droid", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Pit Droid")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 791.4, 3.4, 6399.6, 10, 0, "le_repair_droid", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4.1, -0.5, 1.8, 280, 610029524, "3po_protocol_droid_red", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po") --palace cantina bar droid
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 501.5, 0, 6746.2, 323, 0, "3po_protocol_droid_silver", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	-- Bestine imp garrison
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 819.2, 0, 6452.2, 171, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-338")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 830.3, 0, 6446.4, 216, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-294")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 814.2, 0, 6514.8, 296, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-156")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 807.8, 0, 6504.1, 296, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-723")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 876.7, 7, 6492.3, 150, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-481")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 832.9, 7, 6489.6, 256, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-257")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 854.5, 0, 6529.3, 33, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-319")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 873.9, 0.2, 6568.2, 209, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-148")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 913.4, 1.1, 6529.4, 292, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-647")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 911.9, 1.1, 6534.8, 169, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-473")
	-- general trooper security
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 850.3, 0.1, 6588, 31, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-326")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 837.6, 0.1, 6596.7, 40, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-769")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 635.7, 0, 6634.1, 28, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-415")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 574.3, 0, 6630.7, 313, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-282")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 537.1, 0, 6597.1, 20, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-751")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 493.4, 0, 6559, 27, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-510")
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 421.5, 0, 6629.2, 127, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-106")
	 pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 373.3, 0, 6728.2, 115, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-299")
	 pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 381, 0, 6739.3, 80, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-842")
	 pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 537.4, 0, 6742.1, 126, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-405")
	 pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 541.6, 0, 6690.5, 312, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-785")
	 pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 627.7, 0, 6517.3, 135, 0, "stormtrooper", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("TK-299")


	-- Tutorial NPCs removed, copy/paste from other repositories needed agains--
	

	--VENDORS--
	
	--Melee Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.8, 0.8, 1, 330, 610029732, "rp_moncal_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Okibam Rotso (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	--Ranged Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -0.2, 0.8, 0.6, 360, 610029732, "rp_zabrak_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper")
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
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 3.8, 0.1, -7.3, 25, 610029510, "rp_gran_male", "xovros_nurse", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Horuuk Kyl (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	
	--Specialty Shop Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -0.8, 0.4, -8.5, 200, 610029600, "rp_rodian_male", "eisley_specialty_shop_beebo", "default", "eisley_specialty_shop_beebo", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Beebo (a Specialty Item Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")
	
	--Junker Ship Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 666.1, 5.2, 6726.5, 170, 0, "rp_sullustan_male", "sulon_vendor_ranged_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Nedd Tarunng (a Junker Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship_cheap")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship_cheap")
	
	--Armorsmith Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -15.1, 1.1, -0.8, 30, 610029662, "rp_ithorian_male", "eisley_armorsmith_biemio_faom", "default", "eisley_armorsmith_biemio_faom", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Biemio Faom (an Armorsmith Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")
	
	--Weaponsmith Vendor (Ranged)
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -3, 1.1, -8.5, 80, 610029664, "rp_quarren_male", "eisley_weaponsmith_kefarack_tajus", "default", "eisley_weaponsmith_kefarack_tajus", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Kefarack Tajus (a Weaponsmith Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")
	
	--Weaponsmith Vendor (Melee)
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -14.1, 1.1, -8.5, 105, 610029692, "rp_trandoshan_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Rokk (a Weaponsmith Melee Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	--[[Bartender of Bestine starport cantina is spawning naked???
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 8.4, -0.9, 	-0.5, 320, 	610029707, "rp_bith_male", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Keli Rhom")]]
	
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
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -0.3, -0.4, -1.4, 170, 610029908, "dressed_armorsmith_trainer_01", "default", "default", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Orek Flyn (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "junkdealer")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_junkdealer")
	
	--Bestine Doctor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -5, 0.1, 7.2, 100, 610029510, "rp_human_male", "eisley_doctor_rahar_mawolki", "default", "eisley_doctor_rahar_mawolki") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Dr. Faust")
	
	--The Dockmaster, Phoron Klia
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 428, 0, 6738.3, 165, 0, "rp_gran_male", "eisley_dockmaster_orroko_pimeub", "default", "eisley_dockmaster_orroko_pimeub") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Phoron Klia (a Dockmaster)")
	
	--Moqeni, the Major Domo for the Hutts of Eisley
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -7.4215, 3.07248, -20.522, 26, 610008299, "rp_smc_female", "eisley_majordomo_moqeni", "default", "eisley_majordomo_moqeni") --Equip, Skill, Customization
	--SceneObject(pNpc):setCustomObjectName("Moqeni (a Majordomo)")
	
	--Bestine tailor stewardwess
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -4.4, 1.2, -0.7, 80, 610029849, "rp_bith_female", "eisley_tailor_doivo_cilea", "default", "eisley_tailor_doivo_cilea") --Tailor
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
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4.1, 0.8, 1.3, 345, 610029559, "rp_moncal_male", "eisley_dockmaster_orroko_pimeub", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Tiroir Ciouskar (a Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship")
	

end