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
		--CreatureObject(pPlayer):sendSystemMessage("Getting ship ID from caller.")
		--local shipID = SceneObject(pObject):getStoredLong("structure")
		--CreatureObject(pPlayer):sendSystemMessage("Ship ID from caller is " .. shipID .. ". Getting shipBuilding from zone.")
		CreatureObject(pPlayer):sendSystemMessage("Getting ship from caller.")
		local pShip = getShipFromControlDevice(pObject)
		CreatureObject(pPlayer):sendSystemMessage("Ship from caller retrieved. Getting shipID.")
		local shipID = SceneObject(pShip):getObjectID()
		CreatureObject(pPlayer):sendSystemMessage("Ship ID caller is " .. shipID .. ". Attempting landing by ship.")
		BorRpShip:landShip(pShip, pPlayer)
		--CreatureObject(pPlayer):sendSystemMessage("Attempting landing by ship ID.")
		--BorRpShip:landShip(shipID, pPlayer)
	end

	return 0
end

