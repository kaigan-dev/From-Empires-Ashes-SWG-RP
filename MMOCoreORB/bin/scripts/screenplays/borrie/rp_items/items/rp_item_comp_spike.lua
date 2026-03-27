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
		CreatureObject(pPlayer):sendSystemMessage("Utility items are coming soon!")
	end
	
	return 0
end