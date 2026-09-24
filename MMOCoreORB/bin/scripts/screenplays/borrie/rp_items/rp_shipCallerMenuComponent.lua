RpShipCallerMenuComponent = {}

function RpShipCallerMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
		
	menuResponse:addRadialMenuItem(24, 3, "Land Ship")
	menuResponse:addRadialMenuItem(25, 3, "Send Ship Away")
end

function RpShipCallerMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 24) then 
		local pShip = getShipFromControlDevice(pObject)
		local shipID = SceneObject(pShip):getObjectID()
		BorRpShip:landShip(pShip, pPlayer)
	end

	if (selectedID == 25) then 
		local pShip = getShipFromControlDevice(pObject)
		local shipID = SceneObject(pShip):getObjectID()
		BorRpShip:takeOffShip(pObject, pPlayer, false)
	end

	return 0
end

