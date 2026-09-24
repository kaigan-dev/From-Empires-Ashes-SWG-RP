npc_template = {

	randomName = "human",
	title = "a Mistryl Shadow Guard",
	baseTemplates = {
		"rp_human_female",
	},

	skillTemplates = {
			"specops_strong"
	},
	
	
	equipmentTemplates = {
		{"rp_human_female", {"mistryl"}},
	},	
	
	customizationTemplates = {
		{"rp_human_female", {"random"}},
	},

	customVarOverrides = {
		{"/shared_owner/blend_skinny", 100},
		{"/shared_owner/blend_fat", 0},
	}
}