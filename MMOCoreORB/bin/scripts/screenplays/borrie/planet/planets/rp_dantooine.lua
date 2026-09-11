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
		--[[
		{"dantooine_khoonda_starport", "Khoonda City Starport", "rp_dantooine", 896, 1, -1498, 0, true},
		{"dantooine_khoonda_outskirts_east", "Khoonda City Outskirts East", "rp_dantooine", 1475, 0, -1367, 0, true},
		{"dantooine_khoonda_outskirts_north", "Khoonda City Outskirts North", "rp_dantooine", 1136, 0, -820, 0, true},
		--]]
		{"dantooine_damarise_outpost", "Damarise Outpost", "rp_dantooine", 1380, 4, 3403, 0, true},
	}	
}
BorPlanetManager:addPlanet(planet)