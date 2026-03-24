npc_template = {

	title = "a rebel Recruiter",
	randomName = "human",
	baseTemplates = {"rp_human_male", "rp_human_female"},
	skillTemplates = {"stormtrooper"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/rebel/officer"}},
		{"rp_human_female", {"faction/rebel/officer"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.2},
	}
}