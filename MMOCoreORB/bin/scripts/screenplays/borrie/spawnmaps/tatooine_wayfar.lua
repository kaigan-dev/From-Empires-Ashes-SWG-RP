local Logger = require("utils.logger")

RpTatooineWayfarScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineWayfarScreenPlay",

	planet = "rp_tatooine",	
	
	walkpointList = {
		
	}
	
	
}

registerScreenPlay("RpTatooineWayfarScreenPlay",  true)

function RpTatooineWayfarScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		--self:spawnJunkPiles()
	end
end

--[[function RpTatooineMosEisleyScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		{538.877, -0.25, 223.016, 0, -0.0348994, 0, 0.999391, 0},
		{524.885, -0.25, 217.145, 0, 1, 0, 0, 0},
		{542.914, -0.25, 246.141, 0, 1, 0, 0, 0},
		{561.785, 0, 228.346, 0, 0.694658, 0, 0.71934, 0},
		{564.54, 0, 250.432, 0, 0.694658, 0, 0.71934, 0},
		{533.383, 0, 243.447, 0, 1, 0, 0, 0},
		{522.524, 0, 231.014, 0, 1, 0, 0, 0},
		{550.866, -0.25, 228.395, 0, -0.743145, 0, 0.669131, 0},
		{561.204, 0, 222.933, 0, -0.743145, 0, 0.669131, 0},
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end]]

function RpTatooineWayfarScreenPlay:spawnCivilians() 
	local waypointList = {
		--{741.764, 0, 291.229, 178, 0,{"walker_market_shopper1"},"r5"},
		{4631.4, 3.2, -6852.9, 149, 0,{"none"}},
		{4639.6, 3, -6850.3, 230, 0, {"social"}},
		{4638.7, 3, -6851.6, 22, 0, {"none"}}, 
		{4634.6, 1.6, -6872.2, 118, 0, {"none"}},
		{4630.5, 1.5, -6876.3, 202, 0, {"none"}},
		{4626.5, 1.5, -6877.3, 59, 0, {"social"}},
		{4627.6, 1.4, -6886, 320, 0, {"none"}},
		{4635.3, 1.3, -6877, 22, 0, {"none"}},
		{4636.6, 1.3, -6875.4, 221, 0, {"social"}},
		{4636.8, 1.2, -6877.1, 320, 0, {"none"}},
		{4735.9, 2, -6839.8, 212, 0, {"none"}},
		{4739.5, 1.7, -6843.3, 237, 0, {"sit"}},
		{4692.1, 2.6, -6846.6, 358, 0, {"tech"}},
		{4633.2, 0, -6903.3, 350, 0, {"sit"}},
		{4603.1, 0.8, -6896.1, 245, 0, {"tech"}},
		{4622.9, 1.5, -6879.6, 300, 0, {"none"}},
		{4571.7, 7.6, -6861.1, 89, 0, {"none"}},
		{4575.6, 6.9, -6861.9, 324, 0, {"social"}},
		{4575.4, 7.4, -6859, 190, o, {"none"}},
		{4570.8, 7.9, -6859.8, 117, 0, {"none"}},
		{4582.7, 2.8, -6885.1, 199, 0, {"sit"}},
		{4576.8, 3.1, -6884.8, 171, 0, {"sit"}},
		{4569.4, 3.5, -6886.1, 0, 0, {"tech"}},
		{4517, 5.6, -6897.2, 287, 0, {"none"}},
		{4514.9, 6.4, -6894.9, 122, 0, {"social"}},
		{4472, 5.1, -6905.6, 150, 0, {"sit"}},
		{}
		
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function RpTatooineWayfarScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", 4460.1, 11.4, -6843.6, 0, 1, 0, 0.5, 0)
	
	
	--Signs
	--[[local sObj = spawnSceneObject("rp_tatooine", "object/tangible/sign/all_sign_city_s03.iff", 947.255, 0, 139.882, 0, 0.97237, 0, 0.233445, 0) --Tailor Sign
	SceneObject(sObj):setCustomObjectName("Eisley Tailoring")
	]]
	
	
	
	--[[TAILOR--
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 8.78601, 0.403271, -11.165, 610008132, 0.999983, 0, -0.00579456, 0) --Shirts
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 5.04968, 0.403271, -11.2072, 610008132, 0.999983, 0, -0.00579456, 0) --Pants
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 0.719971, 0.403271, -11.2594, 610008132, 0.999983, 0, -0.00579456, 0) --Footwear
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", -2.97528, 0.403271, -11.304, 610008132, 0.999983, 0, -0.00579456, 0) --Jacket
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", -1.10101, 3.09675, -11.3878, 610008132, 0.707104, 0.707105, -0.00133156, 0.00133156) --Vest
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", -1.10065, 2.22375, -11.3878, 610008132, 0.707104, 0.707105, -0.00133156, 0.00133156) --Robes
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", -1.10065, 1.30945, -11.3878, 610008132, 0.707104, 0.707105, -0.00133156, 0.00133156) --Bodysuits
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.202, 0.403271, -8.65625, 610008132, -0.702997, 0, 0.711192, 0) --Skirts
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.1785, 0.403271, -6.46765, 610008132, -0.702997, 0, 0.711192, 0) --Women
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 6.92175, 3.09675, -11.3584, 610008132, 0.707104, 0.707105, -0.00133156, 0.00133156) --Heaad & Goggle
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 6.91962, 2.22375, -11.3592, 610008132, 0.707104, 0.707105, -0.00133156, 0.00133156) --Handwear
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/chest_modern_style_01.iff", 6.91962, 1.33228, -11.3592, 610008132, 0.707104, 0.707105, -0.00133156, 0.00133156) --Jewelry
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.1545, 0.403271, -4.3006, 610008132, -0.702997, 0, 0.711192, 0) --Misc/Belts
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.1304, 0.403271, -2.12482, 610008132, -0.702997, 0, 0.711192, 0) --Alien
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.1044, 0.403271, 0.171387, 610008132, -0.702997, 0, 0.711192, 0) --Wookiee
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.0788, 0.403271, 2.50256, 610008132, -0.702997, 0, 0.711192, 0)--Ithorian 1
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/modern/armoire_modern_style_01.iff", 11.1247, 0.403271, 4.60206, 610008132, -0.702997, 0, 0.711192, 0)--Ithorian 2
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")
	]]
	--[[ FURNITURE--
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.694885, -3.97117, -10.4214, 610008483, 0.707259, 0, -0.706924, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Cheap")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_cheap")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.691284, -3.97117, -8.90924, 610008483, 0.70769, 0, -0.706407, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Elegant")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_elegant")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.690125, -3.97117, -7.39197, 610008483, 0.707785, 0, -0.706293, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Modern")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_modern")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.688965, -3.97117, -5.8797, 610008483, 0.707853, 0, -0.706212, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plain")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plain")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.688354, -3.97117, -4.35455, 610008483, 0.707903, 0, -0.706152, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Technical")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_technical")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", 0.686218, -3.97117, -2.82239, 610008483, 0.708018, 0, -0.706014, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Misc")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_misc")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_chest_s01.iff", 0.73291, -3.97117, -1.45932, 610008483, 0.70727, 0, -0.706911, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Decorative")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_decorative")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -7.53796, -3.97117, -5.85431, 610008483, 0.70797, 0, 0.706071, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, City")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_city")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_armoire_s01.iff", -7.53625, -3.97117, -7.39255, 610008483, 0.707887, 0, 0.706171, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Paintings")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_paintings")
	
	sObj = spawnSceneObject("rp_tatooine", "object/tangible/furniture/plain/plain_chest_s01.iff", -5.59229, -3.97117, -7.88876, 610008483, 1, 0, 0, 0)
	SceneObject(sObj):setCustomObjectName("Furniture, Plants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("furniture_plants")
	]]
	--[[Jukebox--
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_jukebox.iff", 27.0829, -0.894995, 8.68511, 610008176, -0.707107, 0, 0.707107, 0)
]]
end

function RpTatooineWayfarScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
	local pNpc
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 4444.4, 0, -6943.5, 287, 0, "bantha", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Bantha")

	--VENDORS--
	
	--Melee Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4555.5, 1.2, -6907.4, 197, 0, "rp_nikto_male", "sulon_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Redi (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

	--Ranged Vendor Light
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4566.8, 1.4, -6898.6, 47, 0, "rp_zabrak_male", "xovros_ranged_vendor", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Koliarae (a Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")

	--Camping Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4617.6, 1.3, -6884.3, 157, 0, "rp_human_female", "xovros_vendor_camping", "default", "random", "rpg_shopkeeper") 
	SceneObject(pNpc):setCustomObjectName("Caemu Sipeu (a Camping Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")


	--Cheap Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 5.9, 0.2, -6.4, 352, 610030514, "rp_gran_male", "xovros_nurse", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Doctor Vospee (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")
	
	
	--Bartender of Wayfar
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -1.1, 0.8, 4.4, 193, 610030783, "wuher", "default", "default", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Jewlz")
	

	
	--Transmog Vendor
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 0.07613, 0.611579, -6.57677, 335, 610009373, "rp_human_male", "vendor_transmog", "default", "random", "rpg_shopkeeper")
	--SceneObject(pNpc):setCustomObjectName("Dyutine Hukchar (a Disguise Vendor)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "transmog")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_transmog")
	
	--Junk Dealer
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4456.1, 4.6, 6909.2, 170, 0, "dressed_armorsmith_trainer_01", "default", "default", "default", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Lirki Bosta (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "junkdealer")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_junkdealer")
	
	--Backpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, 4497.4, 12.2, -6852.4, 259, 0, "rp_human_male", "xovros_refugee_male9", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Shispa Ovi (a Backpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "backpacks")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_backpacks")
	
	

end