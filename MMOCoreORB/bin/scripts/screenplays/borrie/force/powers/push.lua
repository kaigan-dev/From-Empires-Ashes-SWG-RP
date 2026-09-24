BorForce_Push = {
	name = "Force Push",
	animationName = "force_push",
	maxRange = 60
}

function BorForce_Push:showHelp(pPlayer)
		local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a major action, roll Telepinesis + FPI vs Strength to push one object or creature within 60 meters by a number of meters equal to 1/3 of the roll's result. Large or heavy objects may not move as far at GM discretion."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Push:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_push")
	
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Push", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Push:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Push:performAbility(pPlayer, fpi)
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	--Begin Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_telekinesis"))
	local forceTotal = math.floor(forceDieValue + skillValue +  fpi)
	local distanceMoved = math.floor(forceTotal / 3)

	local defenderDieValue = math.floor(math.random(1, 20))
	local defenderStrength = math.floor(tonumber(CreatureObject(pTarget):getSkillMod("rp_strength")))
	local defenderTotal = math.floor(defenderDieValue + defenderStrength)

	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " + " .. fpi
	message = message .. " = " .. forceTotal .. " vs 1d20: " .. defenderDieValue .. " + " .. defenderStrength .. " = " .. defenderTotal
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	if(forceTotal > defenderTotal) then
		message = message .. ". " .. targetName .. " is pushed " .. distanceMoved .. " meters away from them!"
	
		CreatureObject(pPlayer):doAnimation("force_choke_1_particle_level_1")	
		broadcastMessageWithName(pPlayer, message)
	end
	if (forceTotal <= defenderTotal) then
		message = message .. ". But they fail to affect " .. targetName .. "!"
	
		CreatureObject(pPlayer):doAnimation("force_choke_1_particle_level_1")	
		broadcastMessageWithName(pPlayer, message)
	end
	
	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end