--Bandage
BorRpItemBandageMenuComponent = {}

function BorRpItemBandageMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	--menuResponse:addRadialMenuItem(20, 3, "Use Bandage")
end

function BorRpItemBandageMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
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