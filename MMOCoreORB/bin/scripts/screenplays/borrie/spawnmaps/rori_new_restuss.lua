RoriNewRestussScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RoriNewRestussScreenPlay",

	planet = "rp_rori",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("RoriNewRestussScreenPlay",  true)

function RoriNewRestussScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function RoriNewRestussScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function RoriNewRestussScreenPlay:spawnCivilians() 
	local waypointList = {
		{-945.409, 83, 1543.78, 359, 0,{"social"}},
		{-945.344, 83, 1544.93, 221, 0,{"social"}},
		{-907.962, 83, 1612.26, 90, 0,{"tech"}},
		{-880.327, 83, 1630.82, 141, 0,{"social"}},
		{-879.064, 83, 1629.42, 318, 0,{"social"}},
		{-880.906, 83, 1628.75, 40, 0,{"none"}},
		{-816.514, 83.5, 1662.86, 265, 0,{"sit"}},
		{-829.66, 83, 1690.56, 50, 0,{"social"}},
		{-827.801, 83, 1691.72, 234, 0,{"social"}},
		{-828.103, 83, 1692.56, 219, 0,{"none"}},
		{-828.631, 83, 1689.64, 355, 0,{"none"}},
		{-985.831, 83, 1677.7, 175, 0,{"tech"}},
		{-987.056, 83, 1681.11, 325, 0,{"tech"}},
		{-983.816, 83, 1684.86, 185, 0,{"none"}},
		{-983.137, 83, 1678.15, 318, 0,{"none"}},
		{-1034.16, 83, 1699.6, 196, 0,{"social"}},
		{-1105.51, 83, 1761.6, 10, 0,{"social"}},
		{-1105.11, 83, 1763.25, 188, 0,{"social"}},
		{-1116.18, 83, 1748.65, 134, 0,{"social"}},
		{-1114.25, 83, 1747.51, 302, 0,{"none"}},
		{-1114.86, 83, 1747.06, 317, 0,{"none"}},
		{-1115.57, 83, 1746.8, 348, 0,{"none"}},
		{-1173.18, 83, 1713.31, 135, 0,{"sit"}},
		{-1175.59, 83, 1643.04, 268, 0,{"none"}},
		{-1166.83, 83, 1662.17, 156, 0,{"social"}},
		{-1166.14, 83, 1660.16, 338, 0,{"social"}},
		{-1161.42, 83, 1603.76, 225, 0,{"sittable"}},
		{-1162.16, 83, 1601.45, 0, 0,{"sittable"}},
		{-1163.11, 83, 1603.42, 135, 0,{"sittable"}},
		{-1166.93, 83, 1613.56, 92, 0,{"social"}},
		{-1164.2, 83, 1613.5, 269, 0,{"social"}},
		{-1168.07, 83, 1612.75, 72, 0,{"none"}},
		{-1090.15, 83, 1577.89, 133, 0,{"social"}},
		{-1089.08, 83, 1576.86, 315, 0,{"social"}},
		{-1034.39, 83, 1547.89, 345, 0,{"sit"}},
		{-1068.07, 83, 1496.12, 274, 0,{"tech"}},
		{-1066.24, 83, 1497.74, 244, 0,{"none"}},
		{-1066.15, 83, 1517.19, 89, 0,{"sit"}},
		{-1039.51, 83, 1373.98, 225, 0,{"social"}},
		{-1040.91, 83, 1372.61, 46, 0,{"social"}},
		{-1041.43, 83, 1374.01, 124, 0,{"social"}},
		{-984.652, 83, 1349.42, 5, 0,{"social"}},
		{-956.836, 83, 1389.41, 2, 0,{"tech"}},
		{-856.542, 83.6006, 1408.06, 39, 0,{"social"}},
		{-855.435, 83.5996, 1409.2, 223, 0,{"social"}},
		{-849.39, 83.6006, 1407.74, 124, 0,{"social"}},
		{-847.248, 83.5977, 1405.84, 308, 0,{"social"}},
		{-846.991, 83.5996, 1407.17, 258, 0,{"social"}},
		{-850.188, 83.5977, 1406.15, 57, 0,{"none"}},
		{-849.675, 83.5996, 1405.25, 38, 0,{"none"}},
		{-830.333, 83.6006, 1399.66, 106, 0,{"social"}},
		{-829.035, 83.5986, 1399.33, 284, 0,{"social"}},
		{-803.141, 83, 1467.38, 266, 0,{"sit"}},
		{-942.597, 83, 1459.03, 179, 0,{"social"}},
		{-942.794, 83, 1457.89, 172, 0,{"social"}},
		{-942.082, 83, 1455.95, 345, 0,{"social"}},
		{-938.042, 83, 1470.04, 270, 0,{"sit"}},
		{-967.296, 83, 1521.01, 274, 0,{"social"}},
		{-968.833, 83, 1520.86, 83, 0,{"social"}},
		{-1019.75, 83, 1531.1, 331, 0,{"social"}},
		{-1021.08, 83, 1533.99, 153, 0,{"social"}},
		{-1019.17, 83, 1534.14, 203, 0,{"sit"}},
		{-1026.68, 83, 1631.31, 295, 0,{"social"}},
		{-1028.82, 83, 1632.14, 109, 0,{"social"}},
		{-1073.19, 83, 1658.45, 307, 0,{"social"}},
		{-1074.56, 83, 1658.94, 93, 0,{"social"}},
		{-1073.89, 83, 1660.34, 177, 0,{"social"}},
		{-976.97, 83, 1747.71, 0, 0,{"tech"}},
		{-993.504, 83, 1785.55, 349, 0,{"sit"}},
		{-936.594, 83, 1644.92, 235, 0,{"social"}},
		{-937.469, 83, 1644.25, 51, 0,{"social"}},
		{-923.221, 83, 1581.83, 358, 0,{"sitchair"}},
		{-934.667, 83, 1481.83, 307, 0,{"social"}},
		{-935.599, 83, 1483.59, 151, 0,{"none"}},
		{-936.241, 83, 1482.39, 109, 0,{"none"}},
		{-997.44, 83, 1381.53, 318, 0,{"social"}},
		{-998.72, 83, 1383.13, 149, 0,{"social"}},
		{-995.772, 83, 1383.06, 248, 0,{"none"}},
		{-996.318, 83, 1383.82, 226, 0,{"none"}},
		{-1159.23, 83, 1405.49, 358, 0,{"social"}},
		{-1159.05, 83, 1409.32, 183, 0,{"social"}},
		{-1157.35, 83, 1408.68, 224, 0,{"social"}},
		{-1156.37, 83, 1406.04, 105, 0,{"none"}},
		{-1154.97, 83, 1405.66, 286, 0,{"social"}},
		{-1161.3, 83, 1409.2, 113, 0,{"none"}},
		{-1161.98, 83, 1407.83, 105, 0,{"none"}},
		{-1221.66, 83, 1438.68, 227, 0,{"social"}},
		{-1223.11, 83, 1437.42, 46, 0,{"social"}},
		{-1194.4, 83, 1332.43, 228, 0,{"sit"}},
		{-1193.89, 83, 1331.73, 223, 0,{"sit"}},
		{-1127.13, 83, 1478.53, 320, 0,{"social"}},
		{-1129.14, 83, 1480.39, 132, 0,{"social"}},
		{-1127.79, 83, 1481.86, 166, 0,{"social"}},
		{-1144.4, 83, 1512.14, 178, 0,{"none"}},
		{-1207.84, 83, 1466.1, 136, 0,{"none"}},
		{-1242.11, 83, 1604.02, 2, 0,{"social"}},
		{-1242.09, 83, 1605.35, 181, 0,{"social"}},
		{-1037.59, 83.3145, 1763.21, 178, 0,{"sit"}},
		{-1037.65, 83, 1761.26, 1, 0,{"social"}},
		{-975.676, 83.0008, 1718.33, 270, 0,{"sitchair"}},
		{-850.434, 83, 1571.01, 224, 0,{"social"}},
		{-851.49, 83, 1569.67, 37, 0,{"social"}},
		{-849.912, 83, 1569.65, 303, 0,{"social"}},
		{-828.729, 83, 1550.93, 115, 0,{"tech"}},
		{-805.104, 83, 1576.48, 313, 0,{"tech"}},
		{-802.327, 83, 1583.08, 313, 0,{"none"}},
		{-804.212, 83, 1580.95, 258, 0,{"social"}},
		{-787.87, 83, 1515.68, 145, 0,{"social"}},
		{-787.243, 83, 1514.24, 335, 0,{"social"}},
		{-782.083, 83, 1498.74, 271, 0,{"tech"}},
		{-769.918, 83, 1472.48, 149, 0,{"social"}},
		{-769.013, 83, 1470.15, 337, 0,{"social"}},
		{-768.066, 83, 1471.7, 252, 0,{"social"}},
		{-754.569, 83, 1450.38, 95, 0,{"none"}},
		{-755.11, 83, 1449.44, 78, 0,{"none"}},
		{-738.324, 80.3023, 1450.87, 265, 0,{"social"}},
		{-783.32, 83, 1632.79, 151, 0,{"social"}},
		{-782.346, 83, 1630.75, 330, 0,{"social"}},
		{-780.889, 83, 1630.1, 317, 0,{"none"}},
		{-781.554, 83, 1629.78, 330, 0,{"none"}},
		{-908.894, 83, 1557.47, 291, 0,{"social"}},
		{-910.172, 83, 1558.02, 113, 0,{"social"}},
		{-910.763, 83.5811, 1555.99, 0, 0,{"none"}},
		{-993.09, 83, 1610.51, 30, 0,{"drinker"}},
		{-992.058, 83, 1611.56, 221, 0,{"social"}},
		{-967.973, 83, 1339.57, 49, 0,{"tech"}},
		{-967.341, 83, 1343.94, 189, 0,{"social"}},
		{-890.989, 86.3735, 1363.09, 0, 0,{"sittable"}},
		{-892.237, 86.3735, 1364.2, 99, 0,{"sittable"}},
		{-890.1, 86.3735, 1364.96, 214, 0,{"sittable"}},
		{-890.203, 86.377, 1363.54, 305, 0,{"drinker"}},
		{-855.571, 83, 1364.61, 148, 0,{"none"}},
		{-971.331, 85.4874, 1441.87, 146, 0,{"sittable"}},
		{-971.518, 85.4874, 1439.46, 41, 0,{"sittable"}},
		{-969.279, 85.4874, 1439.74, 304, 0,{"sittable"}},
		{-883.195, 83, 1589.04, 178, 0,{"none"}},
		{-820.343, 83, 1634.67, 224, 0,{"social"}},
		{-821.419, 83, 1633.58, 43, 0,{"social"}},
		{-820.599, 83, 1633.08, 357, 0,{"social"}},
		{-821.915, 83, 1635.85, 150, 0,{"social"}},
		{-797.939, 83, 1527.7, 64, 0,{"none"}},
		{-797.674, 83, 1526.77, 63, 0,{"sit"}},
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_rori", waypointList, self.walkpointList, "humanocentric", "rori")
end

function RoriNewRestussScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	--spawnSceneObject("rp_rori", "object/tangible/terminal/terminal_travel_rp.iff", -552.436, 0, -1784.65, 0, 0.992546, 0, -0.121869, 0)
	spawnSceneObject("rp_rori", "object/tangible/terminal/terminal_travel_rp.iff", -799.243, 83, 1599.14, 0, 0.707107, 0, 0.707107, 0)
	spawnSceneObject("rp_rori", "object/tangible/terminal/terminal_travel_rp.iff", -799.134, 83, 1601.98, 0, 0.707107, 0, 0.707107, 0)

	
	--Signs
	local sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s03.iff", -939.875, 86.7324, 1316.07, 0, 1, 0, 0, 0) --BoBaka Shipping
	SceneObject(sObj):setCustomObjectName("BoBaka Shipping Corporation")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s01.iff", -1002.91, 87.5703, 1620.8, 0, 1, 0, 0, 0) --Inferno
	SceneObject(sObj):setCustomObjectName("Club Inferno")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s01.iff", -839.785, 83, 1552.83, 0, 1, 0, 0, 0) --Vehicles
	SceneObject(sObj):setCustomObjectName("New Restuss Transportation")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s03.iff", -757.044, 83.5, 1483.39, 0, 0.707107, 0, 0.707107, 0) --Tailor
	SceneObject(sObj):setCustomObjectName("Tailoring by Tilaytha")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s02.iff", -772.616, 83, 1458.42, 0, 0.707107, 0, 0.707107, 0) --Junk
	SceneObject(sObj):setCustomObjectName("Starport Junk Dump")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s01.iff", -802.604, 87.8486, 1600.42, 0, 1, 0, 0, 0) -- Port Authority
	SceneObject(sObj):setCustomObjectName("New Restuss Port Authority")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s01.iff", -938.517, 83, 1466.43, 0, 1, 0, 0, 0) --Diner
	SceneObject(sObj):setCustomObjectName("Vik's Swoop'n'eat Diner")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s02.iff", -972.971, 85.5, 1428.26, 0, 0.707107, 0, 0.707107, 0) --Flats
	SceneObject(sObj):setCustomObjectName("Tranquility Terrace Apartments")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s03.iff", -927.874, 83, 1443.19, 0, 0.707107, 0, 0.707107, 0) --Wep and Armor
	SceneObject(sObj):setCustomObjectName("New Restuss Defense Depot")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s02.iff", -882.649, 83, 1369.25, 0, 1, 0, 0, 0) --Frostbite Cantina
	SceneObject(sObj):setCustomObjectName("The Frostbite Cantina")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s03.iff", -1122, 84.001, 1582.83, 0, 1, 0, 0, 0) --Hotel
	SceneObject(sObj):setCustomObjectName("The O'Hafi Hotel")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s02.iff", -1029.71, 83, 1673.85, 0, 0.382683, 0, 0.923879, 0) --Medical
	SceneObject(sObj):setCustomObjectName("Illstrike Clinic")
	sObj = spawnSceneObject("rp_rori", "object/tangible/sign/all_sign_city_s03.iff", -1269.24, 83, 1503.69, 0, 0.707107, 0, 0.707107, 0) --Garrison	
	SceneObject(sObj):setCustomObjectName("New Restuss Garrison")

	
	--TAILOR--
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", 7.05383, 0.875, -0.493469, 610026251, 0.999979, 0, -3.42709e-07, 0)
	SceneObject(sObj):setCustomObjectName("Shirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_shirts")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", 5.63281, 0.875, -0.493469, 610026251, 0.999974, 0, -3.42705e-07, 0)
	SceneObject(sObj):setCustomObjectName("Pants")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_pants")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", 4.19421, 0.875, -0.493469, 610026251, 0.999969, 0, -3.42701e-07, 0)
	SceneObject(sObj):setCustomObjectName("Footwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_footwear")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", 2.7384, 0.875, -0.493469, 610026251, 0.999963, 0, -3.42696e-07, 0)
	SceneObject(sObj):setCustomObjectName("Jacket")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jackets")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", 1.27209, 0.875, -0.493469, 610026251, 0.999957, 0, -3.42691e-07, 0)
	SceneObject(sObj):setCustomObjectName("Vest")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_vests")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/armoire_elegant_s01.iff", -0.16626, 0.875, -0.493469, 610026251, 0.999939, 0, -3.42676e-07, 0)
	SceneObject(sObj):setCustomObjectName("Robes")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_robes")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/chest_s01.iff", 6.41907, 3.52966, -1.0202, 610026251, 0.5, 0.49992, 0.49992, 0.5)
	SceneObject(sObj):setCustomObjectName("Bodysuits")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_bodysuits")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/chest_s01.iff", 4.9856, 3.52966, -1.0202, 610026251, 0.5, 0.499928, 0.499928, 0.5)
	SceneObject(sObj):setCustomObjectName("Skirts")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_skirts")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/chest_s01.iff", 3.45667, 3.52966, -1.0202, 610026251, 0.5, 0.499937, 0.499937, 0.5)
	SceneObject(sObj):setCustomObjectName("Women's Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_women")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/chest_s01.iff", 2.01807, 3.52966, -1.0202, 610026251, 0.5, 0.499945, 0.499945, 0.5)
	SceneObject(sObj):setCustomObjectName("Headwear & Goggles")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_headwear")
	SceneObject(sObj):populateInventoryFromContentList("tailor_goggles")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/chest_s01.iff", 0.587769, 3.52966, -1.0202, 610026251, 0.5, 0.499955, 0.499955, 0.5)
	SceneObject(sObj):setCustomObjectName("Handwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_handwear")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/cabinet_s01.iff", -0.30542, 0.875, 6.09491, 610026251, 3.42698e-07, 0, 0.999966, 0)
	SceneObject(sObj):setCustomObjectName("Jewelry")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_jewelry")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/cabinet_s01.iff", 0.769897, 0.875, 6.09491, 610026251, 3.42705e-07, 0, 0.999974, 0)
	SceneObject(sObj):setCustomObjectName("Belts, Bandoliers & Aprons")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_misc")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/cabinet_s01.iff", 1.9364, 0.875, 6.09491, 610026251, 3.4271e-07, 0, 0.99998, 0)
	SceneObject(sObj):setCustomObjectName("Alienwear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_alien")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/cabinet_s01.iff", 3.04443, 0.875, 6.09491, 610026251, 3.42711e-07, 0, 0.999981, 0)
	SceneObject(sObj):setCustomObjectName("Wookiee Wear")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_wookiee")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/cabinet_s01.iff", 4.19739, 0.875, 6.09491, 610026251, 3.42719e-07, 0, 0.99999, 0)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear I")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian1")
	sObj = spawnSceneObject("rp_rori", "object/tangible/furniture/elegant/cabinet_s01.iff", 5.38525, 0.875, 6.09491, 610026251, 3.42722e-07, 0, 0.999995, 0)
	SceneObject(sObj):setCustomObjectName("Ithorian Wear II")
	SceneObject(sObj):setPublicContainer(true)
	SceneObject(sObj):setDispenserContainer(true)
	SceneObject(sObj):populateInventoryFromContentList("tailor_ithorian2")

	

end

function RoriNewRestussScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	--Vendors
	local pNPC
	--Vehicle Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -836.293, 83, 1550.58, 0, 0,			"rp_moncal_male", "xovros_refugee_male2", "default", "random", "rpg_shopkeeper") --Vehicle
	SceneObject(pNpc):setCustomObjectName("Mirl Torka (a Speeder Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles")

	--Luxury Vehicle Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -833.546, 83, 1547.87, 0, 0,			"rp_human_male", "tatooine_luxury_speeder_vendor", "default", "random", "rpg_shopkeeper") --Luxury Vehicle
	SceneObject(pNpc):setCustomObjectName("Galen Dravenmere (a Luxury Speeder Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "vehicle_luxury")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_vehicles_luxury")

	--Armor Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -2.79661, 0.7, -5.54038, 0, 610014460,	"rp_human_female", "xovros_refugee_male3", "default", "random", "rpg_shopkeeper") --Armor
	SceneObject(pNpc):setCustomObjectName("Seraphina Forj (an Armorsmith)")
	SceneObject(pNpc):setStoredString("vendor:theme", "armorsmith")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_armor_tier1")

	--Weaponsmith, Ranged
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, 5.5842, 0.7, -0.634388, 269, 610014461,	"rp_human_female", "xovros_refugee_male4", "default", "random", "rpg_shopkeeper") -- Wep Ranged
	SceneObject(pNpc):setCustomObjectName("Novvah Vex (a Ranged Weaponsmith)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_ranged")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_ranged_tier1")

	--Weaponsmith, Melee
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, 2.81123, 0.7, -3.15372, 0, 610014461,	"rp_zabrak_male", "xovros_refugee_male5", "default", "random", "rpg_shopkeeper") -- Wep Melee
	SceneObject(pNpc):setCustomObjectName("Daelus Thornblade (a Melee Weaponsmith)")
	SceneObject(pNpc):setStoredString("vendor:theme", "novice_melee")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_weaponsmith_melee_tier1")

	--Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -1034.75, 83, 1697.08, 46, 0,			"rp_bothan_male", "xovros_nurse", "default", "random", "rpg_shopkeeper") --Stims
	SceneObject(pNpc):setCustomObjectName("Rylan Vi'rek (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")

	--Camping Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -810.856, 79.8538, 1797.08, 193, 0,		"rp_human_female", "xovros_refugee_male6", "default", "random", "rpg_shopkeeper") --Camp
	SceneObject(pNpc):setCustomObjectName("Mathala Wildeth (a Camping Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "camping")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_camping")

	--Specialty Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -806.455, 83, 1580.62, 98, 0,			"rp_trandoshan_female", "eisley_specialty_shop_beebo", "default", "random", "rpg_shopkeeper") --Specialty
	SceneObject(pNpc):setCustomObjectName("Talza Skanneer (a Specialty Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "specialty")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_specialty")

	--Ship Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -790.585, 83, 1519.69, 49, 0,			"rp_moncal_male", "eisley_dockmaster_orroko_pimeub", "default", "random", "rpg_shopkeeper") --Ship
	SceneObject(pNpc):setCustomObjectName("Marok Quillen (a Ship Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship")

	--Junk Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -783.903, 83, 1449.81, 245, 0,			"rp_rodian_female", "xovros_refugee_male7", "default", "random", "rpg_shopkeeper") --Junk
	SceneObject(pNpc):setCustomObjectName("Lokra Lexa (a Junk Dealer)")
	SceneObject(pNpc):setStoredString("vendor:theme", "ship_cheap")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_ship_cheap")

	--Mount Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -891.383, 83, 1308.04, 141, 0,			"rp_human_female", "xovros_refugee_male8", "default", "random", "rpg_shopkeeper") --Mount
	SceneObject(pNpc):setCustomObjectName("Anjil Jace (a Mount Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "mount")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_mounts_naboo")

	--Instrument Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -882.772, 83.5986, 1487.55, 273, 0,		"rp_twilek_female", "xovros_hotel_receptionist", "default", "random", "rpg_shopkeeper") --Instrument
	SceneObject(pNpc):setCustomObjectName("Rylla Noami (an Instrument Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "music")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_instruments")

	--Backpack Vendor
	pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -904.266, 83, 1479.51, 87, 0,			"rp_moncal_female", "xovros_refugee_male9", "default", "random", "rpg_shopkeeper") --Backpack
	SceneObject(pNpc):setCustomObjectName("Ibbsakar Mist (a Backpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "backpacks")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_backpacks")

	--Disguise Vendor
	--pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -979.093, 83, 1715.85, 228, 0,			"rp_zabrak_male", "vendor_transmog", "default", "random", "rpg_shopkeeper") --Disguise
	--SceneObject(pNpc):setCustomObjectName("Mel (a Disguise Vendor)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "transmog")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_transmog")

	--Imperial Vendor
	--pNpc = spawnRoleplayMobile("rp_rori", "rp_convo_npc", 1, -1253.86, 83, 1528.2, 127, 0,			"rp_human_male", "faction/imperial/officer_navy", "default", "random", "rpg_shopkeeper") --Imperial
	--SceneObject(pNpc):setCustomObjectName("Uphinizo Reir (an Imperial Quartermaster)")
	--SceneObject(pNpc):setStoredString("vendor:theme", "imperial")
	--SceneObject(pNpc):setStoredString("vendor:shopList", "shop_imperial")
	
	--Special
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, 8.09042, 0.749981, 2.36658, 235, 610014332,	"le_repair_droid", "default", "default", "default") --Ignitor
	SceneObject(pNpc):setCustomObjectName("IG-N1-T0R")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -2.36116, 0.7, 2.05802, 225, 610014466,		"8d8", "default", "default", "default") --Diner Droid
	SceneObject(pNpc):setCustomObjectName("8D-8B")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, 4.71356, 0.7, -5.83059, 182, 610014465,		"npe/npc_dressed_meat_chef", "default", "default", "default") --Diner Droid Cook
	SceneObject(pNpc):setCustomObjectName("Squrn Tondalo (a Cook)")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1.04571, 0.750001, 4.42632, 207, 610014605,	"rp_wookiee_female", "default", "default", "rori/frostbite_barkeep") --Frostbite Bartender
	SceneObject(pNpc):setCustomObjectName("Rhowtharra")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, 0.124397, 2.5, 7.05092, 179, 610014452,		"3po_protocol_droid_silver", "default", "default", "default") --Apartment Receptionist
	SceneObject(pNpc):setCustomObjectName("TC-29")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, 19.7848, 1.56616, 12.2854, 182, 610014474,	"rp_zabrak_male", "tatooine_luxury_speeder_vendor", "default", "default") --Hotel Bartender
	SceneObject(pNpc):setCustomObjectName("Rork Spune")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -807.38, 87.8477, 1597.4, 0, 0,				"rp_twilek_male", "faction/imperial/officer_navy", "default", "default") --Dockmaster
	SceneObject(pNpc):setCustomObjectName("Taralor Me'ern (a Dockmaster)")
	
	--Animals
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -815.919, 83, 1323.5, 312, 0,		"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -849.565, 83, 1325.43, 0, 0,		"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -912.614, 83, 1385, 95, 0,			"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -997.906, 83, 1414.9, 70, 0,			"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -996.231, 83, 1415.47, 252, 0,		"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1033.48, 83, 1568.86, 319, 0,		"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -940.198, 83, 1709.17, 99, 0,		"squall", "default", "default", "default")--Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -939.811, 83, 1712.26, 243, 0,		"squall", "default", "default", "default")--Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -937.372, 83, 1711.83, 0, 0,			"squall", "default", "default", "default")--Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -800.94, 81.0394, 1735.96, 25, 0,	"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -800.38, 81.1882, 1738.52, 134, 0,	"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -772.447, 83, 1668.46, 160, 0,		"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -708.945, 83, 1537.52, 294, 0,		"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -710.417, 83, 1536.87, 3, 0,			"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -773.086, 83, 1449.79, 124, 0,		"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -894.372, 83, 1308.35, 114, 0,		"kaadu", "default", "default", "default") --Kaadu
	SceneObject(pNpc):setCustomObjectName("a Kaadu")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -828.857, 80.656, 1280.65, 90, 0,	"tusk_cat_hue", "default", "default", "default") --Tusk Cat
	SceneObject(pNpc):setCustomObjectName("a Tusk Cat")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -940.786, 83, 1275.57, 319, 0,		"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1196.24, 83, 1357.47, 244, 0,		"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1238.63, 83, 1398.29, 221, 0,		"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1239.88, 83, 1396.05, 0, 0,			"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Squall")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1349.2, 81.2544, 1543.12, 121, 0,	"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1348.26, 80.8966, 1539.92, 12, 0,	"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1346.38, 81.3387, 1542.82, 246, 0,	"chuba_hue", "default", "default", "default") --Chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1151.46, 83, 1749.04, 187, 0,		"chuba_hue", "default", "default", "default") --chuba
	SceneObject(pNpc):setCustomObjectName("a Chuba")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1152.09, 83, 1750.61, 267, 0,		"kaadu", "default", "default", "default") --Kaadu
	SceneObject(pNpc):setCustomObjectName("a Kaadu")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1246.75, 81.6114, 1784.87, 214, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1247.29, 81.6727, 1780.84, 234, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1251.04, 81.4422, 1781.42, 195, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1281.54, 83, 1621.73, 31, 0,		"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1383.29, 81.4884, 1394.08, 188, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1383.14, 79.5615, 1384.15, 217, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1380.58, 80.0546, 1389.52, 209, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1380.44, 81.6374, 1397.85, 195, 0,	"ikopi", "default", "default", "default") --Ikopi
	SceneObject(pNpc):setCustomObjectName("an Ikopi")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1296.4, 83, 1388.16, 65, 0,			"squall", "default", "default", "default") --Squall
	SceneObject(pNpc):setCustomObjectName("a Kaadu")
	
	--SavSec Officers
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -807.9, 83, 1557.5, 75, 0				,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -988.272, 83, 1522.53, 44, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -838.684, 83, 1348.11, 179, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -984.423, 83, 1350.65, 181, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1073.69, 83, 1553.85, 178, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1195.6, 83, 1574.33, 87, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1187.83, 83, 1426.27, 269, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1225.3, 83, 1328.99, 190, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1156.43, 83, 1445.34, 90, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1013.25, 83, 1667.41, 354, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -1161.5, 83, 1729.71, 316, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -818.087, 83, 1711.19, 47, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -697.409, 83, 1555.62, 91, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -788.665, 83, 1506.26, 199, 0			,"rp_rori")
	createTemplatedRoleplayNPC("planet/rori/savsec_officer",  -805.883, 87.8477, 1603.59, 114, 0	,"rp_rori")
	
	--Droids
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -789.517, 83, 1518.49, 0, 0, "r2", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r2")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -807.697, 83, 1582.12, 123, 0, "r4", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -884.087, 83.5811, 1590.96, 180, 0, "3po_protocol_droid_silver", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -957.86, 83, 1515.98, 91, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1018.69, 83, 1532.11, 297, 0, "3po_protocol_droid_silver", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1066.4, 83, 1491.64, 88, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1039.56, 83, 1372.6, 314, 0, "cz_protocol_droid", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("CZ-912")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -962.902, 83.5986, 1347.13, 259, 0, "r3", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r3")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -962.832, 83.5986, 1346.11, 269, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -962.746, 83.5986, 1345.11, 278, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -932.402, 83, 1368.02, 165, 0, "le_repair_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -897.631, 83, 1448.66, 225, 0, "3po_protocol_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -850.673, 83.5986, 1419.64, 0, 0, "3po_protocol_droid_red", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -860.237, 83, 1303.43, 0, 0, "dz70_fugitive_tracker_droid", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("DZ-70-621")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1019.79, 83, 1356.93, 188, 0, "eg6_power_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -804.393, 83, 1374.38, 249, 0, "eg6_power_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -774.57, 83, 1463.23, 178, 0, "eg6_power_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -780.466, 83, 1639.22, 251, 0, "le_repair_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -834.613, 83, 1675.34, 272, 0, "r4", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1035.65, 83, 1695.79, 216, 0, "21b_surgical_droid", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("2-1B-V2Z")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -987.516, 83, 1674.78, 272, 0, "r4", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1099.48, 83, 1543.06, 53, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1163.09, 83, 1598.68, 321, 0, "3po_protocol_droid_silver", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1161.91, 83, 1664.04, 175, 0, "3po_protocol_droid_silver", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1160.87, 83, 1663.93, 175, 0, "3po_protocol_droid_red", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "3po")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1169.84, 83, 1713.45, 0, 0, "eg6_power_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "eg6")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1091.72, 83, 1778.87, 125, 0, "cll8_binary_load_lifter", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -921.559, 83, 1666.92, 121, 0, "r2", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r2")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -839.057, 83, 1551.06, 206, 0, "le_repair_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "le")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -803.319, 83, 1551.43, 0, 0, "wed_treadwell", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -781.822, 83, 1447.75, 313, 0, "wed_treadwell", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "wed")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -768.531, 83, 1434.17, 341, 0, "cll8_binary_load_lifter", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -743.499, 83, 1529.19, 200, 0, "cll8_binary_load_lifter", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -781.315, 83, 1643.71, 142, 0, "cll8_binary_load_lifter", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Binary Load Lifter")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1271.06, 83, 1475.98, 0, 0, "r5", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r5")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1271.04, 83, 1477, 180, 0, "ra7_bug_droid", "default", "default", "random") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "ra7")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1203.26, 83, 1317.88, 232, 0, "r4", "default", "default", "default") --Equip, Skill, Customization
	setRandomCreatureName(pNpc, "r4")
	pNpc = spawnRoleplayMobile("rp_rori", "rp_base_npc", 1, -1412.28, 81.2582, 1558.16, 0, 0, "probot", "default", "default", "random") --Equip, Skill, Customization
	SceneObject(pNpc):setCustomObjectName("a Probot")
	
end