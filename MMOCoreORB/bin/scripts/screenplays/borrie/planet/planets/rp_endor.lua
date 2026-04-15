planet = {
	name = "Endor",
	zone = "rp_endor",
	startingFaction = "empire",
	startingFactionControl = 100,
	bases = {
		"imperial_landing",
		"rebel_landing",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		--{"endor_imperial_landing", "Imperial Landing Point", "rp_endor", 3201, 24, -3485, 0, 0, true},
		{"endor_rebel_landing", "Rebel Landing Point", "rp_endor", 6060, 262, -2513, 0, 0, true},
	}	
}

BorPlanetManager:addPlanet(planet)