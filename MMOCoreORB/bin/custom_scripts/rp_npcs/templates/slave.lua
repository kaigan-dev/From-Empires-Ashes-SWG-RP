npc_template = {

	randomName = "human",
	title = "a slave",
	baseTemplates = {
		"rp_human_male", "rp_human_female", "rp_human_male", "rp_human_female","rp_human_male", "rp_human_female",
		"rp_bothan_male", "rp_bothan_female", 
		"rp_chiss_male", "rp_chiss_female", 
		"rp_rodian_male", "rp_rodian_female",
		"rp_trandoshan_male", "rp_trandoshan_female",
		"rp_twilek_male", "rp_twilek_female", "rp_twilek_male", "rp_twilek_female", 
		"rp_zabrak_male", "rp_zabrak_female","rp_zabrak_male", "rp_zabrak_female",
		"rp_gran_male",
		"rp_wookiee_male", "rp_wookiee_female",
	},

	skillTemplates = {
			"civilian"
	},
	
	
	equipmentTemplates = {
		{"rp_human_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_human_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_bothan_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_bothan_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_chiss_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_chiss_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_rodian_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_rodian_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_trandoshan_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_trandoshan_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_twilek_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_twilek_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_zabrak_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_zabrak_female", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_gran_male", {"slave1", "slave2", "slave3", "slave4"}},
		{"rp_wookiee_male", {"slave_wookiee"}},
		{"rp_wookiee_female", {"slave_wookiee"}},
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
		{"rp_wookiee_male", {"random"}},
		{"rp_wookiee_female", {"random"}},
	},

		customVarOverrides = {
		{"/shared_owner/blend_skinny", 50},
		{"/shared_owner/blend_fat", 0},
	}

	--armor = "stormtrooper",
}