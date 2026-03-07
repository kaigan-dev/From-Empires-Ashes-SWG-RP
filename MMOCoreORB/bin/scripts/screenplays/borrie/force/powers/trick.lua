BorForce_Trick = {
	name = "Mind Trick"
}

function BorForce_Trick:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "If the target's Mindfulness is less than 8, duel roll with Control against the target's resolve."
	helpMessage =  helpMessage .. "Add input ForcePointInput to control check. If successful, any bluff, persuasion, or intimidation check is considered to be a nat 20."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Trick:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_control_a02")
	
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
		CreatureObject(pPlayer):sendSystemMessage("Sadly, you cannot use the Force to convince yourself to make what is probably a bad decision.")
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
	
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice") or tonumber(CreatureObject(pTarget):getSkillMod("rp_mindfulness")) > 7) then
		CreatureObject(pPlayer):doAnimation("force_persuasion")			
		broadcastMessageWithName(pPlayer, CreatureObject(pPlayer):getFirstName() .. " tried to mind trick " .. CreatureObject(pTarget):getFirstName() .. ", but ".. CreatureObject(pTarget):getFirstName() .." seems unaffected.")
		PlayerObject(pGhost):setForcePower(forcePower - fpi)
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local roll = math.floor(math.random(1,20))
	local yourTotal = skillValue + roll + fpi
	
	local targetSkillValue = math.floor(CreatureObject(pTarget):getSkillMod("rp_resolve"))
	local targetRoll = math.floor(math.random(1,20))
	local theirTotal = targetSkillValue + targetRoll
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	local rollString = " (1d20 = " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. yourTotal .. " vs 1d20 = " .. targetRoll .. " + " .. targetSkillValue .. " = " .. theirTotal .. ")" 
	
	if(yourTotal > theirTotal) then
		message = message .. " For the very next social persuasion, bluff, or intimidation check against " .. targetName .. ", their roll will be considered a natural 20!"
	else 
		message = message .. " However, " .. targetName .. " is able to resist " .. CreatureObject(pPlayer):getFirstName() .. "'s control."
	end
	
	message = message .. rollString

	CreatureObject(pPlayer):doAnimation("force_persuasion")	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end