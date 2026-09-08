npc_template = {

	randomName = "human",
	title = "an Alliance SpecForce Operator",
	baseTemplates = {"rp_human_male", "rp_human_female","rp_human_male", "rp_human_female",
	"rp_bothan_male", "rp_bothan_female",
	"rp_moncal_male", "rp_moncal_female",
	"rp_sullustan_male", "rp_sullustan_female",
	"rp_zabrak_male", "rp_zabrak_female", "rp_aqualish_male", "rp_aqualish_female",
},
	skillTemplates = {"specops_strong"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/rebel/specforce"}},
		{"rp_human_female", {"faction/rebel/specforce"}},
		{"rp_bothan_male", {"faction/rebel/specforce"}},
		{"rp_bothan_female", {"faction/rebel/specforce"}},
		{"rp_moncal_male", {"faction/rebel/specforce"}},
		{"rp_moncal_female", {"faction/rebel/specforce"}},
		{"rp_sullustan_male", {"faction/rebel/specforce"}},
		{"rp_sullustan_female", {"faction/rebel/specforce"}},
		{"rp_zabrak_male", {"faction/rebel/specforce"}},
		{"rp_zabrak_female", {"faction/rebel/specforce"}},
		{"rp_aqualish_male", {"faction/rebel/specforce"}},
		{"rp_aqualish_female", {"faction/rebel/specforce"}},

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
		{"rp_zabrak_male", {"random"}},
		{"rp_zabrak_female", {"random"}},
		{"rp_aqualish_male", {"random"}},
		{"rp_aqualish_female", {"random"}},
	},	
	
	customVarOverrides = {
		{"/shared_owner/blend_skinny", 71},
		{"/shared_owner/blend_muscle", 100},
		{"/shared_owner/blend_fat", 0},
	}
}