npc_template = {

	title = "a rebel Recruiter",
	randomName = "human",
	baseTemplates = {"rp_human_male", "rp_human_female","rp_human_male", "rp_human_female",
	"rp_bothan_male", "rp_bothan_female",
	"rp_moncal_male", "rp_moncal_female",
	"rp_sullustan_male", "rp_sullustan_female",
	"rp_twilek_male", "rp_twilek_female",
	"rp_zabrak_male", "rp_zabrak_female",
},
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