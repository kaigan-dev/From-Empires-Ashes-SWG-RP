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
	end
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
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1629.4, 49.7, -1840.9, 56, 0, "rp_human_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Maximus Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1636.9, 52.5, -1850.6, 312, 0, "rp_human_female", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Rael Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1637.9, 52.3, -1848.5, 138, 0, "rp_rodian_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Vorpi Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1635.4, 51.4, -1871, 129, 0, "rp_trandoshan_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Quill Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1636.4, 51.5, -1876.2, 130, 0, "rp_zabrak_female", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Radok Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1676.4, 58.7, -1922.3, 306, 0, "rp_sullustan_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Gunjack Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1678.8, 58.7, -1919.4, 153, 0, "rp_gotal_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Natra Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1704.7, 59.1, -1834.3, 324, 0, "rp_human_female", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Agate Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1648.4, 53, -1879.7, 305, 0, "rp_gran_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Freran Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1651, 52.8, -1878.5, 142, 0, "rp_human_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Lumar Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1679.7, 56.7, -1848, 284, 0, "rp_devaronian_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Dazine Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1681.3, 57.1, -1845.3, 141, 0, "rp_bothan_female", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Saffre Gedyc")
pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, -1680.9, 56.6, -1849.4, 40, 0, "rp_bith_male", "factional/common/elite", "faction/mando/gedyc", "default") --Equip, Skill, Customization
SceneObject(pNpc):setCustomObjectName("Kabadons Gedyc")

end




