--Adhesive
BorRpItemAdhesiveMenuComponent = {}

function BorRpItemAdhesiveMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	--menuResponse:addRadialMenuItem(20, 3, "Use Adhesive")
end

function BorRpItemAdhesiveMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	--[[
	if (selectedID == 20) then 
		CreatureObject(pPlayer):sendSystemMessage("DEV: Work in progress, sorry! - Borrie")
	end
	--]]
	
	return 0
end