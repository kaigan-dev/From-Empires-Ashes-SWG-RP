object_building_ship_rp_y8 = object_building_ship_rp_shared_y8:new {
	--entrancePoint = {0, 17, -35.9},
	entrancePoint = {0, 18.1, -35.9},
	entranceCell = 13,

	PublicStructure = 1,
	baseMaintenanceRate = 0,

	childObjects = {
	{templateFile = "object/tangible/ship/roleplay/terminal_navicomputer.iff", "", cellid=1, x = 7.42163, z = 28.6979, y = 26.18, ow=1, ox =0, oy = 0, oz = 0, containmentType = -1 },
    {templateFile = "object/tangible/ship/roleplay/terminal_ship_exit.iff", "", cellid=13, x = 0.0520539, z = 18.2915, y = -36.9037, ow=1, ox =0, oy = 0, oz = 0, containmentType = -1 },
    {templateFile = "object/tangible/terminal/terminal_elevator.iff", "Elevator Button", cellid=14, x = 0.00850027, z = 27.933, y = 22.1467, ow=1, ox =0, oy = 0, oz = 0, containmentType = -1 },
    {templateFile = "object/tangible/terminal/terminal_elevator.iff", "Elevator Button", cellid=14, x = -0.022691, z = 18.2296, y = 25.7733, ow=-4.37114e-08, ox =0, oy = 1, oz = 0, containmentType = -1 },
	{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 1.7, z = 27.8, y = 20.3, ow = 0, ox = 0, oy = 0, oz = 0, cellid = 2, containmentType = -1},

	--[[
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 1.7, z = 27.8, y = 20.3, ow = 0, ox = 0, oy = 0, oz = 0, cellid = 2, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_ship_exit.iff", x = 0, z = 18, y = -35.9, ow = 0, ox = 0, oy = 0, oz = 0, cellid = 13, containmentType = -1},
		{templateFile = "object/tangible/ship/roleplay/terminal_navicomputer.iff", x = 7.3, z = 27.8, y = 26.9, ow = 0, ox = 0, oy = 0, oz = 0, cellid = 1, containmentType = -1},
		
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 0, z = 27.9,  y = 22.5, cellid = 14, ow = 0, ox = 0, oy = 0, oz = 0, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", x = 0, z = 18.2, y = 22.5, cellid = 14, ow = 0, ox = 0, oy = 0, oz = 0, containmentType = -1},
--]]
	}
}
ObjectTemplates:addTemplate(object_building_ship_rp_y8, "object/building/ship_rp/y8.iff")

