local spawnGroupTag = "endor"

spawn_group = {
	organic = {
		{"ewok", 10},
	},
	droid = {
		{"r5", 10},
		{"r4", 10},
	}	
}

CivSpawnGroups:addCivSpawnGroup(spawnGroupTag, spawn_group)