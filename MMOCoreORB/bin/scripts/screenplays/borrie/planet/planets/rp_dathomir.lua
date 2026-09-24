planet = {
	name = "Dathomir",
	zone = "rp_dathomir",
	startingFaction = "empire",
	startingFactionControl = 60,
	bases = {
		"dathomir_prison",
		"nightsister_stronghold",
		"smc_enclave",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		--{"dathomir_lz", "Dathomir Primary Landing Zone", "rp_dathomir", 1509, 127, 1492, 0, true},
	}	
}

BorPlanetManager:addPlanet(planet)