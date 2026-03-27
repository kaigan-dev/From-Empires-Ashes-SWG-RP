--Hydrospanner
BorRpItemHydrospannerMenuComponent = {}

function BorRpItemHydrospannerMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Roll Mechanics Skill")
end

function BorRpItemHydrospannerMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then 
		--CreatureObject(pPlayer):sendSystemMessage("DEV: Work in progress, sorry! - Borrie")

		local skillMod = CreatureObject(pPlayer):getSkillMod("rp_mechanics")
		local roll = math.random(1,20)
		local result = roll + skillMod	+ 2
		
		local msg = CreatureObject(pPlayer):getFirstName().. " uses a hydrospanner, rolling Mechanics 1d20 +" ..skillMod.. " +2 (Item). Result: " .. result

		broadcastMessageWithName(pPlayer, msg)
	end
	
	return 0
end