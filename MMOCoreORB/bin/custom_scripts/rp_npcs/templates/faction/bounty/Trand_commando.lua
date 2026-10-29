npc_template = {
	randomName = "trandoshan",
	baseTemplates = {"rp_trandoshan_male", "rp_trandoshan_female",
},
	skillTemplates = {"factional/common/elite"},
	
	equipmentTemplates = {
		{"rp_trandoshan_male", {"faction/bounty/trand_commando"}},
		{"rp_trandoshan_female", {"faction/bounty/trand_commando"}},
		
	},	
	
	customizationTemplates = {
		{"rp_trandoshan_male", {"random"}},
		{"rp_trandoshan_female", {"random"}},
	
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 50},
		{"/shared_owner/blend_fat", 0},
	}
}