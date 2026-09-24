force_locs = {
	--Zone, X, Y, Range, Message
	--[[  Set Force Locations to an empty list in order to disable automation of Force progression.
	{"rp_dantooine", -975, 3865, 90}, --Dantooine Enclave Ruins
	{"rp_dantooine", 381, -3946, 128}, --Dantooine Ruined Islands
	{"rp_tatooine", 4649, 5590, 64}, --Tatooine Enclave
	{"rp_tatooine", 7113, 1524, 64}, --Tatooine Crystal Cave
	{"rp_yavin4", -2717, -168, 16}, --Yavin Dark Shrine
	{"rp_yavin4", 5076, 5538, 64}, --Yavin Exar Kun Temple
	{"rp_yavin4", -3085, -2959, 128}, --Yavin Massassi Temple
	{"rp_dathomir", 157, 4519, 128}, --Dathomir Singing Mountain
	{"rp_dathomir", 5272, -4136, 128}, --Dathomir Ruins of Aurillia
	{"rp_dathomir", -4051, -173, 128}, --Dathomir Nightsister Stronghold
	{"rp_dathomir", 3067, 1340, 16}, --Dathomir Misty Falls
	--]]
}

for i,v in pairs(force_locs) do
    BorForce:addForceRichLocations(v)
end