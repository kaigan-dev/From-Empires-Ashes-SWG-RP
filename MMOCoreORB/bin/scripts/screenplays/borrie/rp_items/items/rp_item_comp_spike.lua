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
		local skillMod = math.floor(CreatureObject(pPlayer):getSkillMod("rp_computers"))
		local roll = math.floor(math.random(1,20))
		local result = roll + skillMod	+ 2

		local msg = CreatureObject(pPlayer):getFirstName().. " uses a computer spike, rolling Computers: \\#DBDBDB 1d20: " ..roll.. " + " ..skillMod.. " +2 (Item) = " ..result.. "\\#FFFFFF. Please delete your computer spike."
		
		
		--TangibleObject(pObject):decreaseUseCount() --Attempt to call a nil value.
		--TangibleObject(SceneObject(pObject)):decreaseUseCount(1, true)    --Still gives "attempt to call a nil value" even when provided parameters.
		--TangibleObject(pObject):decreaseUseCount(1, true)

		--SceneObject(pObject):getTangibleObject():decreaseUseCount()

		--SceneObject(pObject):getTangibleObject():decreaseUseCount(1, true)

		--SceneObject(pObject):broadcastDestroyPrivate()
		--SceneObject(pObject):broadcastDestroyPrivate()
		
		SceneObject(pObject):destroyObjectFromDatabase()

		--SceneObject(pObject):destroyObjectFromDatabase(true)
		--broadcastDestroy(false)

		broadcastMessageWithName(pPlayer, msg)
	end
	
	return 0
end