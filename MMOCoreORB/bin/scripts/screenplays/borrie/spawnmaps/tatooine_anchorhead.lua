TatooineAnchorheadScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TatooineAnchorheadScreenPlay",

	planet = "rp_tatooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("TatooineAnchorheadScreenPlay",  true)

function TatooineAnchorheadScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function TatooineAnchorheadScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		{-709.24, 0, -1796.84, 0, 1, 0, 0, 0},
		{-722.07, 0, -1808.72, 0, 1, 0, 0, 0},
		{-659.876, 0, -1805.45, 0, -0.0348994, 0, 0.999391, 0},
		{-635.092, 0, -1813.18, 0, 1, 0, 0, 0},
		{-666.428, 0, -1830.3, 0, 1, 0, 0, 0},
		{-668.263, 0, -1831.58, 0, -0.809017, 0, -0.587785, 0},
		{-689.538, 0, -1833.24, 0, 1, 0, 0, 0},
		{-706.491, 0, -1803.02, 0, 0.566406, 0, 0.824126, 0},
		{-771.729, 0, -1830.74, 0, 1, 0, 0, 0},
		{-791.999, 0, -1851.19, 0, 1, 0, 0, 0},
		{-754.409, 0, -2040.04, 0, 1, 0, 0, 0},
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function TatooineAnchorheadScreenPlay:spawnCivilians() 
	local waypointList = {
		{-723.728, 0, -1852.69, 115, 0,{"social"}},
		{-722.765, 0, -1853.31, 299, 0,{"social"}},
		{-713.57, 0, -1854.74, 192, 0,{"sit"}},
		{-714.883, 0, -1854.27, 163, 0,{"sit"}},
		{-703.985, 0.176758, -1850.87, 298, 0,{"none"}},
		{-692.643, 0, -1835.7, 74, 0,{"tech"}},
		{-670.494, 0, -1838.37, 230, 0,{"social"}},
		{-671.627, 0, -1839.32, 43, 0,{"social"}},
		{-668.526, 0, -1813.2, 80, 0,{"social"}},
		{-667.354, 0, -1812.84, 251, 0,{"none"}},
		{-634.892, 0, -1812.2, 103, 0,{"tech"}},
		{-618.192, 0, -1795.68, 156, 0,{"sit"}},
		{-618.209, 0, -1813.91, 59, 0,{"none"}},
		{-617.917, 0, -1814.54, 60, 0,{"none"}},
		{-541.855, 0, -1775.22, 38, 0,{"social"}},
		{-541.015, 0, -1774.2, 217, 0,{"social"}},
		{-540.726, 0, -1770.78, 298, 0,{"tech"}},
		{-624.896, 0, -1786.27, 30, 0,{"social"}},
		{-624.112, 0, -1785.31, 216, 0,{"social"}},
		{-643.389, 0, -1813.75, 231, 0,{"social"}},
		{-645.301, 0, -1815.28, 49, 0,{"social"}},
		{-645.501, 0, -1814.22, 87, 0,{"social"}},
		{-642.75, 0, -1815.13, 295, 0,{"none"}},
		{-664.441, 0, -1822.47, 263, 0,{"sit"}},
		{-691.413, 0, -1815.96, 337, 0,{"none"}},
		{-720.709, 0, -1802.24, 93, 0,{"none"}},
		{-720.786, 0, -1803.44, 48, 0,{"sit"}},
		{-710.719, 0, -1790.62, 86, 0,{"tech"}},
		{-677.222, 0, -1759, 161, 0,{"sit"}},
		{-675.477, 0, -1759.12, 183, 0,{"sit"}},
		{-674.102, 0, -1759.67, 207, 0,{"sit"}},
		{-744.183, 0, -1814.02, 266, 0,{"none"}},
		{-745.099, 0, -1815.72, 313, 0,{"none"}},
		{-746.514, 0, -1813.73, 104, 0,{"social"}},
		{-744.534, 0, -1812.67, 228, 0,{"social"}},
		{-761.809, 0, -1855.44, 38, 0,{"sittable"}},

		--Small Bar
		{-2.9, 0.4, -5.8, 58, 610013857,{"none"}},
		{4.7, 0.4, -9.7, -179, 610013857,{"tech"}},
		{-0.8, 0.4, -10.0, -93, 610013857,{"sitchair"}},
		{9.6, 0.4, -1.0, 90, 610013857,{"drinker"}},

		--Cantina
		{9.6, 0.8, 0.4, -22, 610013872,{"sitchair"}},
		{8.9, 0.7, 2.5, 160, 610013872,{"sittable"}},
		{5.8, -0.2, -11.3, -137, 610013872,{"sitchair"}},
		{-1.5, -0.2, -9.0, 156, 610013872,{"drinker"}},
	}	
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_tatooine", waypointList, self.walkpointList, "tatooine", "tatooine")
end

function TatooineAnchorheadScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_tatooine", "object/tangible/terminal/terminal_travel_rp.iff", -552.436, 0, -1784.65, 0, 0.992546, 0, -0.121869, 0)

	
	--Signs
	
	--TAILOR--
	
	--VENDORS--

	--Cheap Stimpack Vendor
	pNpc = spawnRoleplayMobile("rp_tatooine", "rp_convo_npc", 1, -16.0, 0.2, -1.5, 123, 610032853, "dressed_medic_trainer_02", "default", "default", "random", "rpg_shopkeeper")
	SceneObject(pNpc):setCustomObjectName("Del Vreerr (a Stimpack Vendor)")
	SceneObject(pNpc):setStoredString("vendor:theme", "medicine")
	SceneObject(pNpc):setStoredString("vendor:shopList", "shop_medicine_novice")

end

function TatooineAnchorheadScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization
	
end