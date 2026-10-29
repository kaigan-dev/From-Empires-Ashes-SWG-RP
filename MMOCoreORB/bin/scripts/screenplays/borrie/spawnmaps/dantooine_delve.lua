DantooineDelveScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DantooineDelveScreenPlay",

	planet = "rp_dantooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("DantooineDelveScreenPlay",  true)

function DantooineDelveScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function DantooineDelveScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
	
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end

function DantooineDelveScreenPlay:spawnCivilians() 
	local waypointList = {
    }
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dantooine", waypointList, self.walkpointList, "dantooine", "dantooine")
end

function DantooineDelveScreenPlay:spawnSceneObjects() 
	--Travel Terminals

	--Signs
	
	
	--TAILOR--
	
	--Jukebox--
	

end

function DantooineDelveScreenPlay:spawnMobiles()

	--Species, Equipment, Skills, Customization
	--Mount
    --bindit camp
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5776.1, 6.2, 639, 108, 0, "rp_human_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5775.3, 6.4, 636.6, 88, 0, "rp_sullustan_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5793.1, 8.4, 21.3, 296, 0, "rp_twilek_female", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5818, 8.4, 605.8, 333, 0, "rp_zabrak_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5817.1, 8.4, 609.2, 159, 0, "rp_bothan_female", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5761.2, 1.6, 703.5, 333, 0, "rp_gran_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "gran")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5770.1, 0.9, 706.9, 343, 0, "rp_moncal_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5778.5, 5.9, 650.6, 215, 0, "rp_rodian_female", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5797.7, 4.9, 653.7, 104, 0, "rp_human_male", "faction/delve/elite", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5840, 0.5, 649.3, 8, 0, "rp_weequay_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5840.4, 0.5, 652.8, 178, 0, "rp_bothan_female", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "bothan")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5737.5, 11.3, 629.6, 160, 0, "rp_human_female", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5746.2, 11.3, 639.1, 287, 0, "rp_gotal_male", "faction/delve/bindit_trooper", "factional_common_trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

end