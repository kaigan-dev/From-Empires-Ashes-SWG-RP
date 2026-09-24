planet = {
	name = "Carida",
	zone = "rp_carida",
	startingFaction = "empire",
	startingFactionControl = 100,
	bases = {
		"carida_academy_embassy",
		"carida_academy_intel_hq",
		"carida_academy_main",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		--{"carida_academy", "Imperial Academy", "rp_carida", 8, 320, 2916, 0, 0, true},
	}	
}

BorPlanetManager:addPlanet(planet)