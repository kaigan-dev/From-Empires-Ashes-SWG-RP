npc_template = {

	randomName = "human",
	baseTemplates = {"rp_human_male", "rp_human_female","rp_human_male", "rp_human_female",
	"rp_bothan_male", "rp_bothan_female",
	"rp_moncal_male", "rp_moncal_female",
	"rp_sullustan_male", "rp_sullustan_female",
	"rp_twilek_male", "rp_twilek_female",
	"rp_zabrak_male", "rp_zabrak_female",
},
	skillTemplates = {"factional/common/officer_intelligence"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/rebel/officer_intelligence"}},
		{"rp_human_female", {"faction/rebel/officer_intelligence"}},
		{"rp_bothan_male", {"faction/rebel/officer_intelligence"}},
		{"rp_bothan_female", {"faction/rebel/officer_intelligence"}},
		{"rp_moncal_male", {"faction/rebel/officer_intelligence"}},
		{"rp_moncal_female", {"faction/rebel/officer_intelligence"}},
		{"rp_sullustan_male", {"faction/rebel/officer_intelligence"}},
		{"rp_sullustan_female", {"faction/rebel/officer_intelligence"}},
		{"rp_twilek_male", {"faction/rebel/officer_intelligence"}},
		{"rp_twilek_female", {"faction/rebel/officer_intelligence"}},
		{"rp_zabrak_male", {"faction/rebel/officer_intelligence"}},
		{"rp_zabrak_female", {"faction/rebel/officer_intelligence"}},

	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
		{"rp_bothan_male", {"random"}},
		{"rp_bothan_female", {"random"}},
		{"rp_moncal_male", {"random"}},
		{"rp_moncal_female", {"random"}},
		{"rp_sullustan_male", {"random"}},
		{"rp_sullustan_female", {"random"}},
		{"rp_twilek_male", {"random"}},
		{"rp_twilek_female", {"random"}},
		{"rp_zabrak_male", {"random"}},
		{"rp_zabrak_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 0},
		{"/shared_owner/blend_fat", 0},
	}
}