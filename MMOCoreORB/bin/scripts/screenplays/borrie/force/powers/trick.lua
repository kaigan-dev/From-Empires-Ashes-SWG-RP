BorForce_Trick = {
	name = "Mind Trick"
}

function BorForce_Trick:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Roll Control + FPI vs DC 18. On a success, your current social roll against the target is considered to be a natural 20."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Trick:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_trick")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot target yourself with this ability.")
		return
	end
		
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Trick", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Trick:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	spent = tonumber(spent)
	
	if(spent < 1) then
		CreatureObject(pPlayer):sendSystemMessage("You need to commit at least one force point to use this ability.")
		return
	end
	
	self:performAbility(pPlayer, spent)
end

function BorForce_Trick:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("Sadly, you cannot use the Force to convince yourself to make what is probably a bad decision.")
		return
	end
	
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	
	--Execute Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local forceTotal = math.floor(forceDieValue + skillValue + fpi)	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi .. " = " .. forceTotal .. " vs DC 18."

	if(forceTotal >= 18) then
		message = message .. " Their current social roll is considered a natural 20!"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	

	else 
		message = message .. " But their focus is broken, and they fail to influence the target's mind."
	end
	
	broadcastMessageWithName(pPlayer, message)
	
	--Drain Force Pool
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end