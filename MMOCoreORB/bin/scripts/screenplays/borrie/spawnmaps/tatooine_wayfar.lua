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

--[[
function RpTatooineWayfarScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end
--]]

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
		{4575.4, 7.4, -6859, 190, 0, {"none"}},
		{4570.8, 7.9, -6859.8, 117, 0, {"none"}},
		{4582.7, 2.8, -6885.1, 199, 0, {"sit"}},
		{4576.8, 3.1, -6884.8, 171, 0, {"sit"}},
		{4569.4, 3.5, -6886.1, 0, 0, {"tech"}},
		{4517, 5.6, -6897.2, 287, 0, {"none"}},
		{4514.9, 6.4, -6894.9, 122, 0, {"social"}},
		{4472, 5.1, -6905.6, 150, 0, {"sit"}},
		
		
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function RpTatooineWayfarScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", 4460.1, 11.4, -6843.6, 0, 1, 0, 0.5, 0)
	
	
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