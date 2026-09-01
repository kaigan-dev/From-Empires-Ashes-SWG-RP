npc_template = {

	randomName = "darktrooper",
	baseTemplates = {"rp_human_male", "rp_human_male", "rp_human_male", "rp_human_male", "rp_human_male", "rp_human_male", "rp_human_male", "rp_human_male", "rp_human_male", "rp_human_female"},
	skillTemplates = {"factional/common/elite"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/imperial/elite_eidolon"}},
		{"rp_human_female", {"faction/imperial/elite_eidolon"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 100},
		{"/shared_owner/blend_muscle", 100},
		{"/shared_owner/blend_fat", 0},
		{"height", 1.5},
	}
}

--Cybernetic parts need to be manually added to the npc after spawning, as they are not part of the customization templates.