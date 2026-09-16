DantooineWildsScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "DantooineWildsScreenPlay",
    
	planet = "rp_dantooine",	

    walkpointList = {
		
	}
}

registerScreenPlay("DantooineWildsScreenPlay", true)

function DantooineWildsScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
	end
end

function DantooineWildsScreenPlay:spawnMobiles()

spawnMobile("rp_dantooine", "rp_base_npc", 1, 2614.19, 4.5318, 1207.55, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2597.88, 2.05264, 1198.22, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2588.26, 2.44953, 1189.69, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2552.03, 0.394909, 1207.42, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2545.98, 0.482804, 1206.37, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2540.49, 0.687528, 1201.83, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2554.88, 0.354666, 1174.44, 118, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2551.49, 0.304173, 1172.69, 204, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2549.4, 0.277665, 1174.51, 265, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2547.11, 0.216567, 1169.1, 128, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2520.79, 1.21218, 1137.29, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2517.82, 1.08688, 1141.4, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2492.31, 0.864702, 1178.93, 0, 0)
spawnMobile("rp_dantooine", "rp_base_npc", 1, 2499.03, 0.601516, 1177.53, 0, 0)
end
