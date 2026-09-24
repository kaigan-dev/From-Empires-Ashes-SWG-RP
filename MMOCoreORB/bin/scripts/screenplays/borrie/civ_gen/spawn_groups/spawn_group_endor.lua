local spawnGroupTag = "endor"

spawn_group = {
	organic = {
		--{"rp_human_male", 10},
		--{"rp_human_female", 10},
		--{"rp_ewok_male", 10},  --These don't work.
		--{"rp_ewok_female", 10},
		{"dressed_ewok_f_01", 10},
		{"dressed_ewok_m_01", 10},
		{"dressed_ewok_f_02", 10},
		{"dressed_ewok_m_02", 10},
		{"dressed_ewok_f_03", 10},
		{"dressed_ewok_m_03", 10},
		{"dressed_ewok_f_04", 10},
		{"dressed_ewok_m_04", 10},
		{"dressed_ewok_f_05", 10},
		{"dressed_ewok_m_05", 10},
		{"dressed_ewok_f_06", 10},
		{"dressed_ewok_m_06", 10},
		{"dressed_ewok_f_07", 10},
		{"dressed_ewok_m_07", 10},
		{"dressed_ewok_f_08", 10},
		{"dressed_ewok_m_08", 10},
		{"dressed_ewok_f_09", 10},
		{"dressed_ewok_m_09", 10},
		{"dressed_ewok_f_10", 10},
		{"dressed_ewok_m_10", 10},
		{"dressed_ewok_f_11", 10},
		{"dressed_ewok_m_11", 10},
		{"dressed_ewok_f_12", 10},
		{"dressed_ewok_m_12", 10},

	},
	droid = {
		{"r5", 10},
		{"r4", 10},
	}	
}

CivSpawnGroups:addCivSpawnGroup(spawnGroupTag, spawn_group)