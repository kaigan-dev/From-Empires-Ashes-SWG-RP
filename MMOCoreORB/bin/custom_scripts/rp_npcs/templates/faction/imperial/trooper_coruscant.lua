npc_template = {

	randomName = "stormtrooper",
	baseTemplates = {"rp_human_male",},
	skillTemplates = {"soldier_strong"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/imperial/trooper"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 100},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.3},
	}
}