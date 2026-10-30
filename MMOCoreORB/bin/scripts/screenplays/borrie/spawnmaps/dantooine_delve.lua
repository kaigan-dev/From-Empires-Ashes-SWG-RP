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
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5776.1, 6.2, 639, 108, 0, "rp_human_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5775.3, 6.4, 636.6, 88, 0, "rp_sullustan_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5793.1, 8.4, 21.3, 296, 0, "rp_twilek_female", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5818, 8.4, 605.8, 333, 0, "rp_zabrak_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5817.1, 8.4, 609.2, 159, 0, "rp_bothan_female", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "bothan")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5761.2, 1.6, 703.5, 333, 0, "rp_gran_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "gran")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5770.1, 0.9, 706.9, 343, 0, "rp_moncal_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5778.5, 5.9, 650.6, 215, 0, "rp_rodian_female", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5797.7, 4.9, 653.7, 104, 0, "rp_human_male", "faction/delve/elite", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5840, 0.5, 649.3, 8, 0, "rp_weequay_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5840.4, 0.5, 652.8, 178, 0, "rp_bothan_female", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "bothan")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5737.5, 11.3, 629.6, 160, 0, "rp_human_female", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
    pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5746.2, 11.3, 639.1, 287, 0, "rp_gotal_male", "faction/delve/bindit_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

	--bindit checkpoint group

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5697.6, 0.1, 381.4, 317, 0, "rp_chiss_female", "faction/delve/bindit_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5690, 0.7, 376.6, 320, 0, "rp_human_male", "faction/delve/bindit_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5699.1, 0.3, 371.6, 62, 0, "rp_moncal_male", "faction/delve/bindit_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5701.7, 0.7, 371.9, 298, 0, "rp_gotal_male", "faction/delve/bindit_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5700.5, 0.7, 371.8, 192, 0, "rp_trandoshan_female", "faction/delve/bindit_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5709.4, 5.5, 397.5, 299, 0, "rp_zabrak_male", "faction/delve/bindit_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5710, 5.5, 391.7, 296, 0, "rp_rodian_female", "faction/delve/bindit_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5746.2, 11.3, 639.1, 287, 0, "rp_human_female", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5720.5, 1.9, 390.7, 300, 0, "rp_gran_male", "faction/delve/bindit_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "gran")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5718.2, 1.8, 391.7, 113, 0, "rp_zabrak_female", "faction/delve/bindit_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")

	--rustacean camp

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5949.7, 2.7, 479.4, 64, 0, "rp_rodian_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5946.1, 2.6, 482.4, 138, 0, "rp_human_female", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5935.7, 2.3, 496.6, 261, 0, "rp_weequay_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "zabrak")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5984.4, 0.2, 517.8, 5, 0, "rp_nikto_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5988.3, 0.2, 517.8, 295, 0, "rp_sullustan_female", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5985.6, 0.3, 521, 168, 0, "rp_human_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5986.9, 0.2, 511.9, 336, 0, "rp_trandoshan_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5976.3, 0.3, 508.4, 172, 0, "rp_nautolan_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5996.7, 0.3, 490.1, 110, 0, "rp_moncal_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5998.2, 0.2, 489, 323, 0, "rp_human_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5971.6, 2.3, 476.1, 308, 0, "rp_trandoshan_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5927.5, 2.7, 467.8, 163, 0, "rp_rodian_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5927.3, 2.7, 465.5, 105, 0, "rp_twilek_female", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5930.9, 2.5, 463.9, 334, 0, "rp_gotal_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5929.6, 2.6, 462.6, 328, 0, "rp_human_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5924.6, 3, 472.8, 49, 0, "rp_rodian_female", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "rodian")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5926.2, 3, 474.3, 223, 0, "rp_twilek_male", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5915.8, 3.5, 519.9, 353, 0, "rp_human_female", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5914.4, 3.3, 524.5, 172, 0, "rp_trandoshan_female", "faction/delve/rust_trooper", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")

	--rustacean checkpoint 

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5769.4, 0.5, 301.4, 172, 0, "rp_human_female", "faction/delve/rust_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5759.1, 0.5, 300.2, 145, 0, "rp_nikto_male", "faction/delve/rust_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5779.7, 0.6, 304.2, 85, 0, "rp_gotal_male", "faction/delve/rust_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5783.1, 0.9, 305.2, 255, 0, "rp_twilek_male", "faction/delve/rust_trooper_m", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "twilek")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5750.2, 0.3, 306.1, 218, 0, "rp_bothan_female", "faction/delve/rust_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5748.3, 0.5, 304.1, 34, 0, "rp_devaronian_male", "faction/delve/rust_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5745.3, 4.3, 302, 135, 0, "rp_human_male", "faction/delve/rust_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5742.1, 4.3, 299.8, 141, 0, "rp_trandoshan_male", "faction/delve/rust_trooper_r", "factional/common/trooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "trandoshan")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5763.7, 0.5, 302, 162, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")


	-- jump trooper nest #1
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5770.3, 3, 433.9, 303, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5770.1, 3, 437.1, 172, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5765.8, 3, 436.9, 122, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5766.6, 3.3, 434.1, 71, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

	--jump trooper nest #2

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5950.9, 7.9, 643.3, 127, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5951.9, 7.9, 641, 332, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5940, 7.9, 644.1, 336, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5938.7, 7.9, 647, 130, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 5941.1, 7.9, 638.5, 226, 0, "rp_human_male", "faction/delve/jump_trooper", "factional/common/jumptrooper", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")

	-- Skeet's elite compound

	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6084.9, 9, 573.9, 55, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6087.5, 9, 574.2, 282, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6100.7, 9.7, 569.3, 186, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6103.5, 18.7, 621.3, 208, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6063.4, 9.8, 609.6, 252, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6117.9, 0.4, 689, 100, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6114.9, 1.2, 682.8, 155, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")
	pNpc = spawnRoleplayMobile("rp_dantooine", "rp_base_npc", 1, 6104.4, 4.5, 654.2, 244, 0, "rp_human_male", "faction/delve/elite", "factional/common/elite", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "human")



end