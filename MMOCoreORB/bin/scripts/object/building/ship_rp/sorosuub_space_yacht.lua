object_building_ship_rp_sorosuub_space_yacht = object_building_ship_rp_shared_sorosuub_space_yacht:new {
	--entrancePoint = {0,0},
	entrancePoint = {4.9, 22.1, -5.7},
	entranceCell = 2,
	
	publicStructure = 1,
	baseMaintenanceRate = 0,
	
	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 1.29997, z = -6.06955, y = 22.3475, ow = 0.707107, ox = 0, oy = 0.707107, oz = 0, cellid = 2, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_ship_exit.iff", x = 6.25243, z = -5.66955, y = 22.0239, ow = -0.687569, ox = 0.165071, oy = 0.687569, oz = 0.165071, cellid = 2, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_navicomputer.iff", x = -0.664788, z = 1.03045, y = 17.2, ow = 1, ox = 0, oy = 0, oz = 0, cellid = 1, containmentType = -1},

		
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = -2.1, z = -3.7,  y = -16.8, cellid = 6, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = -2.1, z = 1.3, y = -16.8, cellid = 6, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 5, z = 1.3, y = -7.5, cellid = 6, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 2.2, z = 1.2, y = -22.8, cellid = 11, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 2.2, z = 5.3,  y = -22.8, cellid = 11, ow = 1, ox = 0, oy = 0, oz = 0, containmentType = -1},
	},
}
ObjectTemplates:addTemplate(object_building_ship_rp_sorosuub_space_yacht, "object/building/ship_rp/sorosuub_space_yacht.iff")
