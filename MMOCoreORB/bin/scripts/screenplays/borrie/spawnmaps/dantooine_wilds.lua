DantooineWildsScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "DantooineWildsScreenPlay",
    
	planet = "rp_dantooine",	

    walkpointList = {
		
	}
}

registerScreenPlay("DantooineWildsScreenPlay", true)

function DantooineWildsScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnCivilians()
	end
end

function DantooineWildsScreenPlay:spawnCivilians() 
	local waypointList = {
		{4142.9, 6.4, -1116.4, -163, 0,{"none"}}, --Small Town East of The House of Aurodium
		{4141.4, 6.4, -1116.3, 124, 0,{"social"}},
		{4093.8, 8.3, -1107.7, 141, 0,{"sit"}},
		{4113.8, 7.2, -1336.7, 1, 0,{"sit"}},
		{4136.1, 6.9, -1133.9, 151, 0,{"social"}},
		{4137.7, 6.9, -1134.7, -36, 0,{"social"}},
		{4122.4, 7.0, -1156.7, -74, 0,{"none"}},
		{4121.6, 7.1, -1156.5, 101, 0,{"none"}},
		{4122.4, 7.1, -1155.6, -168, 0,{"social"}},
		{4092.5, 7.6, -1161.1, 81, 0,{"social"}},
		{4093.4, 7.5, -1161.6, 30, 0,{"none"}},
		{4094.4, 7.5, -1161.2, -32, 0,{"social"}},
		{4094.4, 7.5, -1160.4, -125, 0,{"none"}},
		{4093.4, 7.5, -1160.0, 175, 0,{"social"}},
		{4092.6, 7.6, -1160.4, 122, 0,{"social"}},
		{4098.7, 8.5, -1120.4, 109, 0,{"none"}},
		{4098.7, 8.5, -1121.2, -72, 0,{"social"}},
		{4165.9, 3.0, -1134.3, 175, 0,{"tech"}},
		{4192.8, 0.8, -1125.6, 97, 0,{"social"}},
		{4194.1, 1.0, -1126.2, -67, 0,{"social"}},
		{4196.0, 0.6, -1164.3, -59, 0,{"sit"}},
		{4140.9, 2.2, -1205.8, -27, 0,{"none"}},
		{4140.1, 2.3, -1205.4, 121, 0,{"social"}},
		{4141.0, 2.1, -1204.7, -158, 0,{"none"}},
		{4148.3, 5.7, -1147.2, -45, 0,{"none"}},
		{4148.0, 5.8, -1146.5, 146, 0,{"none"}},
		{4085.6, 9.2, -1124.5, 95, 0,{"none"}},
		{4124.8, 6.8, -1138.0, 94, 0,{"none"}},
		{4126.1, 6.7, -1137.8, -92, 0,{"social"}},
		{4156.2, 4.8, -1118.7, 177, 0,{"none"}},
		{4187.3, 5.2, -1183.7, -176, 0,{"social"}},
		{4187.0, 5.2, -1185.0, 10, 0,{"none"}},
		{4167.5, 1.2, -1089.2, -66, 0,{"social"}},
		{4166.3, 1.5, -1088.7, 103, 0,{"social"}},
		{4167.1, 1.2, -1087.9, -168, 0,{"none"}},

		{-2691.9, 5.0, -933.9, 7, 0,{"none"}}, --Mining Town
		{-2689.3, 4.9, 936.5, 52, 0,{"none"}},
		{-2670.4, 6.4, -913.4, -25, 0,{"none"}},
		{-2686.2, 8.4, -899.5, -104, 0,{"none"}},
		{-2687.3, 8.4, -899.8, 74, 0,{"social"}},
		{-2735.4, 11.8, -924.4, -121, 0,{"tech"}},
		{-2719.7, 6.2, -943.0, 99, 0,{"none"}},
		{-2716.7, 5.7, -943.6, -79, 0,{"none"}},
		{-2712.1, 5.0, -959.7, 167, 0,{"sit"}},
		{-2727.5, 3.5, -979.3, -49, 0,{"social"}},
		{-2728.4, 3.5, -978.7, 113, 0,{"none"}},
		{-2727.3, 3.5, -978.3, -134, 0,{"social"}},
		{-2692.9, 4.3, -956.6, -101, 0,{"none"}},
		{-2694.0, 4.2, -957.0, 64, 0,{"social"}},
		{-2701.9, 0.9, -975.6, 79, 0,{"none"}},
		{-2618.1, 15.2, -997.0, 76, 0,{"tech"}},
		{-2608.5, 15.6, -1037.2, 55, 0,{"none"}},
		{-2613.7, 15.4, -1074.6, -149, 0,{"none"}},
		{-2614.1, 15.4, -1075.4, 28, 0,{"none"}},
		{-2670.9, 9.9, -1088.8, -108, 0,{"none"}},
		{-2672.0, 9.9, -1089.1, 73, 0,{"social"}},
		{-2671.8, 10.0, -1088.0, 73, 0,{"none"}},
		{-2687.7, 12.4, -1051.3, -57, 0,{"none"}},
		{-2688.4, 12.4, -1050.9, 127, 0,{"social"}},
		{-2731.1, 15.8, -1056.4, 176, 0,{"sit"}},
		{ -2730.4, 15.8, -1056.4, 176, 0,{"sit"}},
		{-2769.5, -16.3, -1071.7, -90, 0,{"tech"}},
		{-2718.8, 15.6, -1109.7, 138, 0,{"none"}},
		{-2717.6, 15.6, -1109.6, -167, 0,{"tech"}},
		{-2681.2, 16.0, -1122.4, -25, 0,{"sit"}},
		{-2657.6, 12.3, -1114.3, -34, 0,{"none"}},
		{-2648.5, 12.7, -1113.5, 2, 0,{"social"}},
		{-2648.5, 12.6, -1112.6, 179, 0,{"social"}},
		{-2630.7, 15.2, -1101.6, -54, 0,{"none"}},
		{-2685.8, 12.9, -1007.9, 7, 0,{"none"}},
		{-2699.7, 14.0, -1020.7, 104, 0,{"none"}},
		{-2698.5, 13.8, -1020.7, -89, 0,{"none"}},
		{-2684.8, 5.1, -936.1, -106, 0,{"none"}},
		{-2642.5, 11.7, -921.3, -22, 0,{"tech"}},
		{-2643.6, 11.4, -921.6, 58, 0,{"social"}},
		{-2757.3, 15.3, -1093.1, -116, 0,{"none"}},
		{-2756.7, 15.2, -1094.1, -34, 0,{"none"}},
		{-2699.3, 5.6, -932.2, 165, 0,{"none"}},

	}

end

function DantooineWildsScreenPlay:spawnMobiles()

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2614.19, 4.5318, 1207.55, 0, 0,"piket", "creature_large", "creatures/medium", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2597.88, 2.05264, 1198.22, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2588.26, 2.44953, 1189.69, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2552.03, 0.394909, 1207.42, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2545.98, 0.482804, 1206.37, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2540.49, 0.687528, 1201.83, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2554.88, 0.354666, 1174.44, 118, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2551.49, 0.304173, 1172.69, 204, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2549.4, 0.277665, 1174.51, 265, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2547.11, 0.216567, 1169.1, 128, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2520.79, 1.21218, 1137.29, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2517.82, 1.08688, 1141.4, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2492.31, 0.864702, 1178.93, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 2499.03, 0.601516, 1177.53, 0, 0,"piket", "creature_large", "creatures/medium", "default")
	SceneObject(pNpc):setCustomObjectName("a Piket")



	--Iron fang Mando gydyc compound
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1629.4, 49.7, -1840.9, 56, 0, "rp_human_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Maximus Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1636.9, 52.5, -1850.6, 312, 0, "rp_human_female", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Rael Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1637.9, 52.3, -1848.5, 138, 0, "rp_rodian_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Vorpi Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1635.4, 51.4, -1871, 129, 0, "rp_trandoshan_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Quill Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1636.4, 51.5, -1876.2, 130, 0, "rp_zabrak_female", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Radok Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1676.4, 58.7, -1922.3, 306, 0, "rp_sullustan_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Gunjack Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1678.8, 58.7, -1919.4, 153, 0, "rp_gotal_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Natra Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1704.7, 59.1, -1834.3, 324, 0, "rp_human_female", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Agate Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1648.4, 53, -1879.7, 305, 0, "rp_gran_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Freran Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1651, 52.8, -1878.5, 142, 0, "rp_human_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Lumar Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1679.7, 56.7, -1848, 284, 0, "rp_devaronian_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Dazine Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1681.3, 57.1, -1845.3, 141, 0, "rp_bothan_female", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Saffre Gedyc")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1680.9, 56.6, -1849.4, 40, 0, "rp_bith_male", "faction/mando/gedyc", "factional/common/elite", "default") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("Kabadons Gedyc")

	--Mining Town
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -2689.9, 10.4, -898.8, 165, 0, "dressed_slooni_long", "default", "default", "default") --Fat Bastard of a corporate overseer.

end




