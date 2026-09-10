npc_template = {

	randomName = "zabrak",
	title = "a Dantooine militia soldier",
	baseTemplates = {
		"rp_human_male", "rp_human_female", "rp_human_male", "rp_human_female","rp_human_male", "rp_human_female",
		"rp_bothan_male", "rp_bothan_female", 
		"rp_chiss_male", "rp_chiss_female", 
		"rp_rodian_male", "rp_rodian_female",
		"rp_trandoshan_male", "rp_trandoshan_female",
		"rp_twilek_male", "rp_twilek_female", "rp_twilek_male", "rp_twilek_female", 
		"rp_zabrak_male", "rp_zabrak_female","rp_zabrak_male", "rp_zabrak_female",
		"rp_gran_male",
	},

	skillTemplates = {
			"soldier"
	},
	
	
	equipmentTemplates = {
		{"rp_human_male", {"planet/dantooine/militia"}},
		{"rp_human_female", {"planet/dantooine/militia"}},
		{"rp_bothan_male", {"planet/dantooine/militia"}},
		{"rp_bothan_female", {"planet/dantooine/militia"}},
		{"rp_chiss_male", {"planet/dantooine/militia"}},
		{"rp_chiss_female", {"planet/dantooine/militia"}},
		{"rp_rodian_male", {"planet/dantooine/militia"}},
		{"rp_rodian_female", {"planet/dantooine/militia"}},
		{"rp_trandoshan_male", {"planet/dantooine/militia"}},
		{"rp_trandoshan_female", {"planet/dantooine/militia"}},
		{"rp_twilek_male", {"planet/dantooine/militia"}},
		{"rp_twilek_female", {"planet/dantooine/militia"}},
		{"rp_zabrak_male", {"planet/dantooine/militia"}},
		{"rp_zabrak_female", {"planet/dantooine/militia"}},
		{"rp_gran_male", {"planet/dantooine/militia"}},
	},	
	
	customizationTemplates = {
		{"rp_human_male", {"random"}},
		{"rp_human_female", {"random"}},
		{"rp_bothan_male", {"random"}},
		{"rp_bothan_female", {"random"}},
		{"rp_chiss_male", {"random"}},
		{"rp_chiss_female", {"random"}},
		{"rp_rodian_male", {"random"}},
		{"rp_rodian_female", {"random"}},
		{"rp_trandoshan_male", {"random"}},
		{"rp_trandoshan_female", {"random"}},
		{"rp_twilek_male", {"random"}},
		{"rp_twilek_female", {"random"}},
		{"rp_zabrak_male", {"random"}},
		{"rp_zabrak_female", {"random"}},
		{"rp_gran_male", {"random"}},
	},

		customVarOverrides = {
		{"/shared_owner/blend_skinny", 50},
		{"/shared_owner/blend_fat", 0},
	}

	--armor = "stormtrooper",
}