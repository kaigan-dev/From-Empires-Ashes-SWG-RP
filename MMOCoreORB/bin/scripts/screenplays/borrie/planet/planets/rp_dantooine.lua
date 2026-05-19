planet = {
	name = "Dantooine",
	zone = "rp_dantooine",
	startingFaction = "firestar",
	startingFactionControl = 60,
	bases = {
		"dant_fort_evir",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		{"dantooine_damarise_outpost", "Damarise Outpost", "rp_dantooine", 1380, 4, 3403, 0, true},
	}	
}

BorPlanetManager:addPlanet(planet)