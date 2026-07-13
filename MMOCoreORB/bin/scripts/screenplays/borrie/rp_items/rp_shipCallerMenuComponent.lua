RpShipCallerMenuComponent = {}

function RpShipCallerMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
		
	--menuResponse:addRadialMenuItem(20, 3, "Call Ship")

	local pShip = getShipFromControlDevice(pSceneObject)
	local shipID = SceneObject(pShip):getObjectID()
	local eventID = readData(shipID .. ":landShip:shipStatus")
	if(eventID ~= 2 and eventID ~= 3) then
		menuResponse:addRadialMenuItem(20, 3, "Land Ship")
	elseif(eventID == 3) then
		menuResponse:addRadialMenuItem(21, 3, "Send Ship Away")
	end


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

	if (selectedID == 21) then 
		local pShip = getShipFromControlDevice(pObject)
		local shipID = SceneObject(pShip):getObjectID()
		BorRpShip:takeOffShip(pObject, pPlayer, true)
	end

	return 0
end

