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
		self:callShip(pObject, pPlayer)
	end
	
	return 0
end

function RpShipCallerMenuComponent:callShip(pObject, pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("Getting ship ID from caller.")
	local shipID = SceneObject(pObject):getStoredLong("structure")
	CreatureObject(pPlayer):sendSystemMessage("Ship ID from caller is " .. shipID .. ". Getting shipBuilding from zone.")
	local shipBuilding = getZoneServer():getObject(shipID)
	CreatureObject(pPlayer):sendSystemMessage("Shipbuilding is " .. shipBuilding .. ". Calling landShip.")
	BorRpShip:landShip(shipBuilding, pPlayer)
end
