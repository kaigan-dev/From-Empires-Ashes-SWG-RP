BorForce_Flash = {
	name = "Force Flash",
	range = 20
}

function BorForce_Flash:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Emits a bright light from your hand. Target must roll Awareness against a DC of your Control skill and <ForcePointInput>."
	helpMessage =  helpMessage .. "Failure to do so means the target is blinded for 1d4 turns."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Flash:execute(pPlayer)
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_flash")
	
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
		CreatureObject(pPlayer):sendSystemMessage("It's generally advised not to blind yourself. If you are looking for such an effect, please look at the sun.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.range) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Flash", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Flash:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Flash:performAbility(pPlayer, fpi)
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
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.range) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
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
	
	local rollString = " (1d20 = " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. yourTotal  .. " vs 1d20 = " .. targetRoll .. " + " .. targetSkillValue .. " = " .. theirTotal .. ")" 
	
	CreatureObject(pPlayer):doCombatAnimation(pPlayer, pTarget, "force_mind_blast_1_particle_level_1_light")
	
	if(yourTotal > theirTotal) then
		local blindDuration = math.floor(math.random(1,4))
		local blindCount = SceneObject(pTarget):getStoredInt("state_blind_duration")
		SceneObject(pTarget):setStoredInt("state_blind_duration", blindDuration + blindCount)
		message = message .. " From their palm, a flash of light shines out, and blinds " .. targetName .. " for " .. tonumber(blindDuration) .. " turns! "
		CreatureObject(pTarget):setState(BLINDED)
	else 
		message = message.. " From their palm, a flash of light shines out, but " .. targetName .. " managed to look away just in time! "
	end
	
	message = message .. rollString

	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end