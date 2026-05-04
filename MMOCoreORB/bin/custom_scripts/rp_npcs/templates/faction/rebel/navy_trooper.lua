npc_template = {

	randomName = "human",
	
	baseTemplates = {
		"rp_human_male", 50, "rp_human_female", 30,
		"rp_sullustan_male", 5, "rp_sullustan_female", 2,
		"rp_zabrak_male", 15, "rp_zabrak_female", 15,
		"rp_mirialan_male", 10, "rp_mirialan_female", 10,
		"rp_moncal_male", 5, "rp_moncal_female", 2,
		"rp_twilek_male", 15, "rp_twilek_female", 10,
	},
	
	skillTemplates = {"common/soldier"},
	
	equipmentTemplates = {
		{"rp_human_male", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_human_female", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_sullustan_male", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_sullustan_female", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_zabrak_male", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_zabrak_female", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_mirialan_male", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_mirialan_female", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_moncal_male", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_moncal_female", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_twilek_male", {"faction/rebel/EQT_alliance_navy_soldier"}},
		{"rp_twilek_female", {"faction/rebel/EQT_alliance_navy_soldier"}},
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