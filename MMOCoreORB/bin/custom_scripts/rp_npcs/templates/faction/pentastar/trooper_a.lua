npc_template = {

	randomName = "zabrak",
	baseTemplates = {"rp_human_male", "rp_human_female", "rp_rodian_male", "rp_rodian_female", "rp_zabrak_male", "rp_zabrak_female", "rp_trandoshan_male", "rp_trandoshan_female", "rp_aqualish_male", "rp_aqualish_female"},
	skillTemplates = {"factional/common/trooper"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/pentastar/trooper_a"}},
		{"rp_human_female", {"faction/pentastar/trooper_a"}},
		{"rp_rodian_male", {"faction/pentastar/trooper_a"}},
		{"rp_rodian_female", {"faction/pentastar/trooper_a"}},
		{"rp_zabrak_male", {"faction/pentastar/trooper_a"}},
		{"rp_zabrak_female", {"faction/pentastar/trooper_a"}},
		{"rp_trandoshan_male", {"faction/pentastar/trooper_a"}},
		{"rp_trandoshan_female", {"faction/pentastar/trooper_a"}},
		{"rp_aqualish_male", {"faction/pentastar/trooper_a"}},
		{"rp_aqualish_female", {"faction/pentastar/trooper_a"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
		{"rp_rodian_male" , {"random"}},
		{"rp_rodian_female" , {"random"}},
		{"rp_zabrak_male" , {"random"}},
		{"rp_zabrak_female" , {"random"}},
		{"rp_trandoshan_male" , {"random"}},
		{"rp_trandoshan_female" , {"random"}},
		{"rp_aqualish_male" , {"random"}},
		{"rp_aqualish_female" , {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.2},
	}
}