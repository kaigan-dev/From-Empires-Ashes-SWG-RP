DantooineKhoondaScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DantooineKhoondaScreenPlay",

	planet = "rp_dantooine",	
	
	walkpointList = {
		
	}
}

registerScreenPlay("DantooineKhoondaScreenPlay",  true)

function DantooineKhoondaScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function DantooineKhoondaScreenPlay:spawnJunkPiles() 
	local spawnPoints = {
		{},
	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, false)
end

function DantooineKhoondaScreenPlay:spawnCivilians() 
	local waypointList = {

        -- northside
		{798.1, 0.2, -1018.5, 204, 0,{"social"}},
        {796.8, 0.2, -1020.7, 20, 0,{"social"}},
        {825.9, 2.3, -993.2, 82, 0,{"none"}},
        {827.3, 2.3, -991.2, 227, 0,{"social"}},
        {828.8, 2.5, -993.4, 258, 0,{"social"}},
        {829.9, 2.5, -996.2, 294, 0,{"none"}},
        {880.5, 1.5, -968.8, 255, 0,{"sit"}},
        {879.9, 1.4, -970.3, 57, 0,{"social"}},
        {858.9, 2.2, -954.1, 69, 0,{"sit"}},
        {858.6, 2.2, -953.5, 116, 0,{"sit"}},
        {869.1, 3.3, -916, 342, 0,{"none"}},
        {869.6, 3.4, -913.7, 187, 0,{"social"}},
        {867.9, 3.2, -914, 151, 0,{"social"}},
        {889.4, 2.2, -1093.6, 43, 0,{"social"}},
        {891.9, 2.1, -1091.3, 240, 0,{"social"}},
        {915.5, 1.6, -1052, 244, 0,{"sit"}},
        {977.7, 2.8, -1059.6, 246, 0,{"none"}},
        {978.1, 2.9, -1062.2, 242, 0,{"social"}},
        {974.1, 2.8, -1057.7, 95, 0,{"none"}},
        {973.6, 2.8, -1060.2, 51, 0,{"social"}},
        {974.3, 2.9, -1062.1, 56, 0,{"none"}},
        {975.6, 2.9, -1063.6, 31, 0,{"none"}},
        {973, 6.6, -1127, 124, 0,{"sit"}},
        {971.2, 6.6, -1129.1, 147, 0,{"sit"}},
        {830.4, 0.8, -1102.2, 34, 0,{"none"}},
        {830.6, 0.8, -1099.9, 164, 0,{"none"}},
        {832, 0.7, -1102.1, 254, 0,{"social"}},
        {854, 3.2, -1078.9, 261, 0,{"sit"}},
        {859.6, 3.2, -1085.9, 170, 0,{"none"}},
        {860, 3.2, -1087.7, 355, 0,{"social"}},
        {863.1, 3.2, -1103.6, 287, 0,{"none"}},
        {856.6, 1.3, -1094.1, 229, 0,{"social"}},
        {855.1, 0.9, -1095.4, 42, 0,{"none"}},
        {850.9, 3.5, -1048.6, 120, 0,{"social"}},
        {852.8, 3.5, -1050.4, 340, 0,{"none"}},
        {855.1, 3.5, -1067.3, 284, 0,{"sit"}},
        {811.1, 2.1, -1088.3, 10, 0,{"social"}},
        {809.3, 2.2, -1087, 29, 0,{"none"}}, --wants dantooine equal of dewback companion
        {785, 3.5, -1080.7, 8, 0,{"sit"}},
        {782.8, 3.9, -1080.7, 9, 0,{"sit"}},
        {786.2, 2.1, -1053.7, 262, 0,{"none"}},
        -- central
        {1013.2, 4.1, -1116.8, 116, 0,{"none"}},
        {1014.5, 4.1, -1117.8, 316, 0,{"social"}},
        {1015.7, 4.6, -1148.3, 141, 0,{"social"}},
        {1017.8, 4.6, -1149.9, 302, 0,{"none"}},
        {1014.9, 4.6, -1150.5, 29, 0,{"social"}},
        {981.4, 2.5, -1168, 270, 0,{"none"}},
        {979.3, 2.5, -1167.8, 84, 0,{"social"}},
        {1039.8, 0.4, -1110.8, 222, 0,{"sit"}},
        {1059.7, 2.3, -1117.8, 80, 0,{"social"}},
        {1063.1, 2.3, -1118.1, 253, 0,{"none"}},
        {1062.4, 2.3, -1121.3, 320, 0,{"none"}},
        {1059.9, 2.3, -1123, 10, 0,{"social"}},
        {1044.3, 0.3, -1125, 143, 0,{"social"}},
        {1045.4, 0.3, -1127.2, 27, 0,{"none"}},
        {991.2, 3.9, -1130.8, 240, 0,{"none"}}, --wants a droid companion
        {1025.4, 0.2, -1197.1, 117, 0,{"social"}},
        {1027.8, 0.1, -1198.4, 4, 0,{"social"}},
        {1029.8, 0.1, -1197.8, 331, 0,{"none"}},
        {1033.1, 0.1, -1196.6, 338, 0,{"none"}},
        {1035.2, 0.1, -1198.9, 285, 0,{"social"}},
        {1034.4, 0.1, -1191.1, 229, 0,{"none"}},
        {1031.5, 0.2, -1190.2, 163, 0,{"none"}},
        {1029.1, 0.2, -1191.3, 165, 0,{"social"}},
        {1075.6, 3.3, -1240, 12, 0,{"social"}},
        {1076.5, 3.4, -1236.5, 89, 0,{"none"}},
        {1078.1, 3.4, -1234.9, 201, 0,{"social"}},
        {1079.2, 3.4, -1237.7, 221, 0,{"none"}},
        {1059.2, 0.4, -1266.1, 239, 0,{"none"}},
        {1056.8, 0.3, -1267, 48, 0,{"social"}},
        {1073.6, 2.9, -1262.7, 291, 0,{"none"}},
        {1064.6, 0.1, -1190.4, 18, 0,{"social"}},
        {1066, 0.1, -1185.4, 174, 0,{"none"}},
        {1069.2, 0.1, -1187.3, 211, 0,{"none"}},

       

	}

	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_dantooine", waypointList, self.walkpointList, "dantooine", "dantooine")
end

function DantooineKhoondaScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_dantooine", "object/tangible/terminal/terminal_travel_rp.iff", -0.4, 0.6, 49.5, 610037024, 0.992546, 0, -0.121869, 0)
end

function DantooineKhoondaScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization

	local pNpc
 	
	
	--Signs
	
	--TAILOR--
	
	--VENDORS--

    --Melee Vendor Light
	
end