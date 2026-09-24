--Disguise Kit
BorRpItemDisguiseKitMenuComponent = {}

function BorRpItemDisguiseKitMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	--menuResponse:addRadialMenuItem(20, 3, "Disguise Self")
end

function BorRpItemDisguiseKitMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
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