RpProfessionDisk = {
	professions = {
		"rp_training_military",
		"rp_training_officer",
		"rp_training_pilot",
		"rp_training_mando",
		"rp_training_bh",
		"rp_training_tka",
		"rp_training_medical",
		"rp_training_surgeon",
		"rp_training_researcher",
		"rp_training_engineer",
		"rp_training_weaponsmith",
		"rp_training_armorsmith",
		"rp_training_diplomatic",
		"rp_training_spy",
		"rp_training_assassin",
		"rp_training_saboteur",
		"rp_training_smuggler",
		"rp_training_conart",
		"rp_training_enforcer",
		"rp_training_tka",
		"rp_training_scout",
		"rp_training_jedi",
		"rp_training_jedi_sentinel",
		"rp_training_jedi_consular",
		"rp_training_sith",
		"rp_training_dkr_sorceror",
	},
	
	professionNames = {
		["rp_training_military"] = "Soldier",
		["rp_training_officer"] = "Officer",
		["rp_training_pilot"] = "Pilot",
		["rp_training_mando"] = "Mandalorian",
		["rp_training_bh"] = "Bounty Hunter",
		["rp_training_tka"] = "Teras Kasi Artist",
		["rp_training_medical"] = "Medic",
		["rp_training_surgeon"] = "Surgeon",
		["rp_training_researcher"] = "Researcher",
		["rp_training_engineer"] = "Ship Engineer",
		["rp_training_weaponsmith"] = "Weaponsmith",
		["rp_training_armorsmith"] = "Armorsmith",
		["rp_training_diplomatic"] = "Diplomat",
		["rp_training_spy"] = "Spy",
		["rp_training_assassin"] = "Assassin",
		["rp_training_saboteur"] = "Saboteur",
		["rp_training_smuggler"] = "Smuggler",
		["rp_training_conart"] = "Con Artist",
		["rp_training_enforcer"] = "Enforcer",
		["rp_training_scout"] = "Scout",
		["rp_training_jedi"] = "Jedi Guardian",
		["rp_training_jedi_sentinel"] = "Jedi Sentinel",
		["rp_training_jedi_consular"] = "Jedi Consular",
		["rp_training_sith"] = "Dark Jedi Warrior",
		["rp_training_drk_sorceror"] = "Dark Jedi Sorceror",
		--[[ Borrie's professions
		["rp_training_military"] = "Military",
		["rp_training_mando"] =  "Mandalorian",
		["rp_training_tka"] = "Teräs Käsi Artist",
		["rp_training_medical"] = "Medical",
		["rp_training_engineer"] = "Engineer",
		["rp_training_diplomatic"] = "Diplomatic",
		["rp_training_spy"] = "Espionage",
		["rp_training_criminal"] = "Criminal",
		--]]
	}
}

function RpProfessionDisk:initializeDisk(pObject, isBeginner) 
	--Pick a random skill to assign this holocron
	local skillName = self:getRandomProfession()
	local displayName = self.professionNames[skillName]	
		
	--Set internal data
	SceneObject(pObject):setStoredString("skill", skillName)
	local minSkill = math.random(1,5)
	local maxSkill = math.random(minSkill + 1,12)
	
	if(isBeginner) then
		minSkill = 1
		maxSkill = 3
	end
	
	SceneObject(pObject):setStoredInt("skill_min", minSkill)
	SceneObject(pObject):setStoredInt("skill_max", maxSkill)
	
	--Set Name of Scroll to show what skill it can do. 
	SceneObject(pObject):setCustomObjectName(displayName .. " Training Disk (" .. self:intToRoman(minSkill) .. " - " .. self:intToRoman(maxSkill) ..")")
	
end

function RpProfessionDisk:openDiskMenu(pPlayer, pObject)

end

function RpProfessionDisk:getRandomProfession()	
	return self.professions[math.random(#self.professions)]
end

function RpProfessionDisk:intToRoman(num)
    local roman = {
        {1000, "M"},
        {900, "CM"},
        {500, "D"},
        {400, "CD"},
        {100, "C"},
        {90, "XC"},
        {50, "L"},
        {40, "XL"},
        {10, "X"},
        {9, "IX"},
        {5, "V"},
        {4, "IV"},
        {1, "I"}
    }
 
    local result = ""
    for i = 1, #roman do
        local val, letter = table.unpack(roman[i])
 
        while num >= val do
            num = num - val
            result = result .. letter
        end
    end
    return result
end