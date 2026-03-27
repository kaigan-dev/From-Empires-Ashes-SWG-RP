--Security Spike
BorRpItemSecuritySpikeMenuComponent = {}

function BorRpItemSecuritySpikeMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Roll Slicing Skill")
end

function BorRpItemSecuritySpikeMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		local skillMod = math.floor(CreatureObject(pPlayer):getSkillMod("rp_slicing"))
		local roll = math.floor(math.random(1,20))
		local result = roll + skillMod	+ 2

		local msg = CreatureObject(pPlayer):getFirstName().. " uses a security spike, rolling Slicing. \\#DBDBDB (1d20: " ..roll.. " + " ..skillMod.. " +2 (Item) = " ..result.. "\\#FFFFFF"

		broadcastMessageWithName(pPlayer, msg)
	end
	
	return 0
end