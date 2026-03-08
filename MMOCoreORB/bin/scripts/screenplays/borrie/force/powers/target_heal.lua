BorForce_TargetHeal = {
	name = "Force Heal Other",
	maxRange = 16
}

function BorForce_TargetHeal:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Heal target within 8 meters range with DC:15 (Alter Roll + 1d20) to heal their health pool for <ForcePointInput> * 2."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_TargetHeal:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_alter_a04")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	-]]
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability. Use Force Heal.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.maxRange) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_TargetHeal", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_TargetHeal:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_TargetHeal:performAbility(pPlayer, fpi)
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
		CreatureObject(pPlayer):sendSystemMessage("Invalid target. You cannot target yourself with this ability. Use Force Heal.")
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
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local roll = math.floor(math.random(1,20))	
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 
	if(skillValue + roll >= 15) then
		message = message .. " They heal ".. targetName .." for ".. fpi * 2 .." health points! (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: 15)"
		CreatureObject(pPlayer):doCombatAnimation(pPlayer, pTarget, "force_healing_1")
		CreatureObject(pTarget):setHAM(0, math.min(CreatureObject(pTarget):getHAM(0) + fpi * 2, CreatureObject(pTarget):getMaxHAM(0)))
	else 
		message = message .. " Unfortunately, their focus is broken, and they fail to heal ".. targetName ..". (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: 15)"
	end
	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end