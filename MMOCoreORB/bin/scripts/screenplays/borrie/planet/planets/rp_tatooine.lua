planet = {
	name = "Tatooine",
	zone = "rp_tatooine",
	startingFaction = "empire",
	startingFactionControl = 70,
	bases = {
		--"eisley_base_main",
		"eisley_bounty_office",
		"eisley_employment_office",
		"eisley_governors_palace",
		"eisley_lab",
		"eisley_slum_hideout",
		"eisley_adventure_guild_hall",
	},
	
	landing_points = {
		--Tag, Name, Zone, x, z, y, angle, cell, shipVisible
		{"anchorhead_starport", "Anchorhead", "rp_tatooine", -535, 0, -1708, -45, 0, true},
		{"eisley_spaceport", "Mos Eisley Spaceport", "rp_tatooine", 1110, 0, -63, -45, 0, true},
		{"eisley_outskirts_west", "Mos Eisley Outskirts, West", "rp_tatooine", 100, 0, 500, -45, 0, true},
		{"eisley_outskirts_east", "Mos Eisley Outskirts, East", "rp_tatooine", 1535, 0, -200, -45, 0, true},
		{"jabbas_palace", "Hutt Palace", "rp_tatooine", 3399, 50, -6817, -90, 0, true},
		--{"sarlacc_pit", "Sarlacc Pit", "rp_tatooine", 6126, 20, -3783, -90, 0, true},
		--{"jundland_wastes", "Jundland Waste", "rp_tatooine", -4400, 0, -70, -90, 0, true},
	}	
}

BorPlanetManager:addPlanet(planet)