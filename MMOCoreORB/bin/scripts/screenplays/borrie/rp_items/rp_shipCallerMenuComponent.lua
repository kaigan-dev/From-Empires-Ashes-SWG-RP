RpShipCallerMenuComponent = {}

function RpShipCallerMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	menuResponse:addRadialMenuItem(20, 3, "Call Ship")

end

function RpShipCallerMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		local pShip = getShipFromControlDevice(pObject)
		local shipID = SceneObject(pShip):getObjectID()
		BorRpShip:landShip(pShip, pPlayer)
	end

	return 0
end

