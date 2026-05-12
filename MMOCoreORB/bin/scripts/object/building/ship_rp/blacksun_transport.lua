object_building_ship_rp_blacksun_transport = object_building_ship_rp_shared_blacksun_transport:new {
	--entrancePoint = {-5.4,-18.0},
	entrancePoint = {0, -7.4},
	entranceCell = 15,
	--If boarding doesn't work after the change, try incrementing the cell number by 19ish. It went from cell ...17114 to ...17133
	
	publicStructure = 1,
	baseMaintenanceRate = 0,
	
	--17114
	childObjects = {
		{templateFile = "object/tangible/ship/roleplay/terminal_navicomputer.iff", cellid =1, x = -0.0402446, z = 2.9, y = -9.78017, 		ow = 0, 			ox  = 0, oy = 1, 		oz =0, containmentType = -1 },
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", 	cellid =2, 			x = 0.0433849, z = -2.8, y = -25.0001, 		ow = 1, 			ox  = 0, oy = 0, 		oz =0, containmentType = -1 },
		{templateFile = "object/tangible/terminal/terminal_elevator.iff",  	cellid =2, 			x = 0.0433849, z = 2.2, y = -25.0001, 		ow = 1, 			ox  = 0, oy = 0, 		oz =0, containmentType = -1 },
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", 	cellid =7, 			x = 6.28659, z = -8.38437, y = -30.0501, 	ow = -0.707107, 	ox  = 0, oy = 0.707107, oz =0, containmentType = -1 },
		{templateFile = "object/tangible/terminal/terminal_elevator.iff", 	cellid =7, 			x = 6.28659, z = -2.9, y = -30.0501, 		ow = -0.707107, 	ox  = 0, oy = 0.707107, oz =0, containmentType = -1 },
		{templateFile = "object/tangible/ship/roleplay/terminal_ship_exit.iff",  cellid =20, 	x = 1.48601, z = -7.31794, y = 4.00146, 	ow = -4.37114e-08, 	ox  = 0, oy = 1, 		oz =0, containmentType = -1 },
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", cellid=1, 	x=6.02866, 	 z=1.91448, y=-21.4675, 		ow=1, 				ox=0, 	 oy=0, 		    oz =0, containmentType = -1 },
	},
}
ObjectTemplates:addTemplate(object_building_ship_rp_blacksun_transport, "object/building/ship_rp/blacksun_transport.iff")
