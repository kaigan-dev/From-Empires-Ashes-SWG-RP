DantooineTokareScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DantooineTokareScreenPlay",

	planet = "rp_dantooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("DantooineTokareScreenPlay",  true)

function DantooineTokareScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function DantooineTokareScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		{},
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function DantooineTokareScreenPlay:spawnCivilians() 
	local waypointList = {
		{-114.6, 4.5, 3461.1, 100, 0,{"social"}},
        {-113.5, 4.4, 3461.8, -141, 0,{"social"}},
        {-113.6, 4.4, 3460.5, -28, 0,{"none"}},
        {-119.6, 5.6, 3487.6, -120, 0,{"sit"}},
        {-121.3, 5.8, 3488.1, 167, 0,{"sit"}},
        {-109.7, 8.5, 3508.3, -168, 0,{"none"}},
        {-109.9, 8.1, 3506.9, 7, 0,{"none"}},
        {-86.3, 13.3, 3572.7, -167, 0,{"social"}},
        {-86.6, 13.3, 3571.5, 17, 0,{"none"}},
        {-142.1, 9.6, 3567.4, 132, 0,{"sit"}},
        {-88.0, 5.2, 3459.3, -36, 0,{"sit"}},
        {-87.1, 5.2, 3460.3, -74, 0,{"sit"}},
        {-173.6, 5.5, 3494.3, 168, 0,{"sit"}},
        {-172.9, 5.7, 3494.7, 149, 0,{"sit"}},
        {-173.7, 5.6, 3493.3, 23, 0,{"social"}},
        {-172.8, 5.8, 3493.5, -23, 0,{"none"}},
        {-172.1, 5.9, 3494.1, -61, 0,{"none"}},
        {-142.4, 4.3, 3442.7, -93, 0,{"social"}},
        {-143.6, 4.2, 3442.7, 99, 0,{"none"}},
        {-88.8, 5.2, 3494.5, 160, 0,{"sit"}},
        {-52.5, 0.6, 3500.0, 125, 0,{"sit"}},
        {-51.6, 0.5, 3500.7, 150, 0,{"sit"}},
        {-50.4, 20.2, 3567.7, 136, 0,{"sit"}},
        {-103.0, 13.3, 3559.0, -71, 0,{"sitchair"}},
        {-103.8, 13.3, 3575.4, 15, 0,{"none"}},
        {-95.9, 13.3, 3552.3, -62, 0,{"sit"}},
        {-126.3, 11.7, 3590.0, 73, 0,{"social"}},
        {-125.5, 11.7, 3590.5, -124, 0,{"none"}},
        {-94.8, 11.1, 3589.0, -142, 0,{"sit"}},
        {-95.9, 11.2, 3589.3, 178, 0,{"none"}},
        {-143.3, 8.0, 3544.8, 152, 0,{"none"}},
        {-143.4, 8.2, 3542.7, 6, 0,{"social"}},
        {-142.1, 8.3, 3543.5, -86, 0,{"social"}},
        {-152.9, 7.7, 3500.0, -30, 0,{"sit"}},
        {-176.2, 5.5, 3462.8, 87, 0,{"none"}},
        {-174.5, 5.6, 3462.9, 91, 0,{"social"}},
        {-149.3, 7.5, 3483.6, 138, 0,{"drinker"}},
        {-104.8, 3.8, 3432.2, 87, 0,{"none"}},
        {-91.9, 0.8, 3418.7, 175, 0,{"sit"}},
        {-146.2, 7.4, 3515.0, 66, 0,{"sit"}},
        {-31.3, 9.6, 3597.6, -155, 0,{"social"}},
        {-31.8, 9.5, 3596.3, -16, 0,{"none"}},
        {-65.8, 10.5, 3592.1, 106, 0,{"none"}},
        {-65.0, 10.5, 3591.5, -47, 0,{"social"}},
        {-66.0, 10.5, 3591.0, 9, 0,{"none"}},
        {-71.1, 9.1, 3559.6, -85, 0,{"none"}},
        {-97.3, 11.6, 3601.8, -122, 0,{"none"}},
        {-19.6, 0.5, 3546.5, 116, 0,{"social"}},
        {-25.8, 9.9, 3624.2, 39, 0,{"social"}},
        {-25.1, 9.9, 3625.4, 128, 0,{"social"}},
        {-24.3, 9.9, 3624.8, -101, 0,{"none"}},
        {-13.2, 8.2, 3644.6, 136, 0,{"sit"}},
        {-29.3, 11.9, 3648.3, 79, 0,{"none"}},
        {14.3, 0.3, 3636.6, 3, 0,{"tech"}},
        {14.3, 0.4, 3637.8, -177, 0,{"tech"}},
        {-101.4, 11.0, 3540.5, 18, 0,{"drinker"}},

        --Bar
        {-8.9, 1.8, 9.2, 90, 610042947, {"none"}},  --Bar Entrance
        {12.1, 1.0, -5.1, -33, 610042950,{"sitchair"}}, --Bar Main Area
        {13.3, 1.0, -3.4, -76, 610042950,{"sittable"}},
        {11.8, 1.0, -0.9, -150, 610042950,{"sitchair"}},
        {10.9, 1.0, -1.9, 135, 610042950,{"none"}},
        {-5.1, -0.2, -12.3, 104, 610042950,{"sitchair"}},
        {4.7, -0.2, -8.3, 85, 610042950,{"sitchair"}},
        {5.7, -0.2, -7.2, -179, 610042950,{"sitchair"}},
        {6.5, -0.2, -8.9, -41, 610042950,{"drinker"}},
        {-9.0, 0.7, 1.9, 128, 610042950,{"none"}},
        {-9., 0.7, 1.2, 107, 610042950,{"social"}},
        {-7.6, -0.2, -10.6, -89, 610042950,{"tech"}},
        {-1.3, -0.2, -8.4, 161, 610042950,{"drinker"}},

        --Town Hall
        {-14.5, 2.0, 12.0, 31, 610043129, {"none"}}, --Town Hall Right Entrance
        {3.9, 1.4, 1.5, -179, 610043131, {"sitchair"}}, --Town Hall Centre Room
        {-0.8, 1.4, -0.4, 179, 610043131, {"sitchair"}},
        {-1.4, 1.4, -0.4, 178, 610043131, {"sitchair"}},
        {-2.1, 1.4, -0.4, 175, 610043131, {"sitchair"}},
        {-5.1, 1.4, -2.6, 160, 610043131, {"sitchair"}},
        {2.6, 2.0, -9.5, -2, 610043131, {"sitchair"}},
        {-8.9, 2.0, -5.8, 130, 610043131, {"none"}},
        {0.8, 2.0, 14.9, 177, 610043131, {"none"}},
        {18.4, 2.0, -2.3, -146, 610043331, {"sitchair"}}, --Town Hall Library
        {19.4, 2.0, -3.4, -118, 610043331, {"sitchair"}},
        {20.9, 2.0, -8.4, -179, 610043331, {"none"}},
        {12.6, 2.0, -6.4, -88, 610043331, {"tech"}},
        {12.0, 2.0, 8.0, 126, 610043331, {"sit"}},
        {17.5, 2.0, 5.3, 90, 610043331, {"none"}},
        {15.3, 2.0, 0.2, 0, 610043331, {"none"}},
        {19.4, 2.0, 6.3, -90, 610043331, {"none"}},

        --Triple Shop
        {6.8, 0.9, 0.9, 167, 610043370, {"tech"}}, --Triple Shop Shop Room
        {4.8, 0.9, 5.1, -2, 610043370, {"none"}},

        --Hospital
        {6.9, 0-.2, 9.0, 175, 610036718, {"none"}}, --Hospital Entrance
        {-1.5, 0.2, -9.2, -91, 610036719, {"sitchair"}}, --Hospital Main Room
        {-4.6, 0.2, -6.5, 90, 610036719, {"sitchair"}},

	}

	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dantooine", waypointList, self.walkpointList, "dantooine", "dantooine")
end

function DantooineTokareScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_dantooine", "object/tangible/terminal/terminal_travel_rp.iff", -30.1, 11.9, 3634.2, 0, 0.992546, 0, -0.121869, 0)
end

function DantooineTokareScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization

	local pNpc
 	
	
	--Signs
	
	--TAILOR--
	
	--VENDORS--

    --Melee Vendor Light
	
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_convo_npc", 1, 0.4, 0.9, 0.2, 73, 610043370, "rp_trandoshan_female", "tokare_vendor_melee_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Hartam Dyssk (a Melee Weapons Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_melee_novice")

    --Ranged Vendor Light

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_convo_npc", 1, 0.3, 0.9, 5.6, 103, 610043370, "rp_trandoshan_male", "tokare_vendor_ranged_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Bhokhssushk Dyssk (a Ranged Weapon Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weapons_ranged_novice")

    --Cheap Stimpack Vendor

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_convo_npc", 1, 6.1, 0.2, -0.3, -88, 6100346719, "dressed_medic_trainer_03", "default", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Sherpfu Ombusosch (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")

    --Armorsmith Vendor

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_convo_npc", 1, 9.7, 0.9, 3.3, -106, 610043370, "rp_trandoshan_female", "tokare_vendor_armor_01", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Mhohssa Dyssk (an Armorsmith Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")


end