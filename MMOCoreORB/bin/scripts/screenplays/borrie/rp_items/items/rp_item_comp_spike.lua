--Computer Spike
BorRpItemComputerSpikeMenuComponent = {}

function BorRpItemComputerSpikeMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Roll Computer Skill")
end

function BorRpItemComputerSpikeMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		local skillMod = CreatureObject(pPlayer):getSkillMod("rp_computers")
		local roll = math.random(1,20)
		local result = roll + skillMod	+ 2

		local msg = CreatureObject(pPlayer):getFirstName().. " uses a computer spike, rolling Computers. \\#DBDBDB (1d20: " ..roll.. " + " ..skillMod.. " +2 (Item) = " .. result "\\#FFFFFF"

		broadcastMessageWithName(pPlayer, msg)
	end
	
	return 0
end