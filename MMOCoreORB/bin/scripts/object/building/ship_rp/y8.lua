object_building_ship_rp_y8 = object_building_ship_rp_shared_y8:new {
	entrancePoint = {0, 18, -35.9},
	entranceCell = 13,

	PublicStructure = 1,
	baseMaintenanceRate = 0,

		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 1.7, z = 27.8, y = 20.3, ow = 0, ox = 0, oy = 0, oz = 0, cellid = 2, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_ship_exit.iff", x = 0, z = 18, y = -35.9, ow = 0, ox = 0, oy = 0, oz = 0, cellid = 13, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_navicomputer.iff", x = 7.3, z = 27.8, y = 26.9, ow = 1, ox = 0, oy = 0, oz = 0, cellid = 1, containmentType = -1},
		
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 0, z = 27.9,  y = 22.5, cellid = 14, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 0, z = 18.2, y = 22.5, cellid = 14, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
}
ObjectTemplates:addTemplate(object_building_ship_rp_y8, "object/building/ship_rp/y8.iff")

