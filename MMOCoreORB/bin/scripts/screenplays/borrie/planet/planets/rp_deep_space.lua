planet = {
	name = "Deep Space",
	zone = "rp_space",
	startingFaction = "empire",
	startingFactionControl = 100,
	bases = {
		"space_tansarii_main",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		{"tansarii_point_station", "Tansarii Point Station", "rp_space", 52.3, 0.9, 27.8, 0, 808251, false},
		--{"corellian_corvette_public", "Corellian Corvette", "rp_space", -34.8, 0, 0.1, 0, 808180,false},
		--{"star_destroyer_public", "Star Destroyer", "rp_space", 109.3, 173.8, 142.9, 0, 808038, false},
	}	
}

BorPlanetManager:addPlanet(planet)