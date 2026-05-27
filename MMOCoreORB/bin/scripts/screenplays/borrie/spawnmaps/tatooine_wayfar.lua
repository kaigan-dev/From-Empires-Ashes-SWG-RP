RpTatooineWayfarScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpTatooineWayfarScreenPlay",

	planet = "rp_tatooine",	
	

	
	walkpointList = {
		market_shopper1 = {
			--[[
			{745.296, 0, 281.54, 180, 0,false, "none"},
			--]]
		},
	}
	
	
}

registerScreenPlay("RpTatooineWayfarScreenPlay",  true)

function RpTatooineWayfarScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end



function RpTatooineWayfarScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		--[[
		{542.818, 0, 210.997, 0, 1, 0, 0, 0},
		--]]
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end


function RpTatooineWayfarScreenPlay:spawnCivilians() 
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

function RpTatooineWayfarScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	

	
	local pNpc



	--Mining room 2
	--	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, 3, -63.4, -230.2, 98, 610029999, "rp_trandoshan_male", "slave1", "thug", "random") --Equip, Skill, Customization
	--setRandomCreatureName(pNpc, "trandoshan")	




	--Bottom room
	--pNpc = spawnRoleplayMobile("rp_tatooine", "rp_base_npc", 1, -92.3, -100.8, -149.7, 18, 610030000, "cll8_binary_load_lifter", "default", "droid", "default") --Equip, Skill, Customization
	--SceneObject(pNpc):setCustomObjectName("a CLL-8 Binary Load Lifter")


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

	

--]]

end