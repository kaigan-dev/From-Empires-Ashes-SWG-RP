BorForce_Sight = {
	name = "Force Sight"
}

function BorForce_Sight:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "Anyone in stealth must make a stealth DC roll against target’s sense + FPI, otherwise they are pulled out of stealth."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Sight:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_sense_novice")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	-]]
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Sight", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Sight:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Sight:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local yourTotal = skillValue + fpi
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
			
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		--Regular Force Sight
		message = message .. " They look through the Force, to see that which the eyes cannot percieve, with a score of " .. yourTotal .. "."
	else 
		--Destealthing Force Sight
		local targetName = CreatureObject(pTarget):getFirstName() 
		local targetSkillValue = math.floor(CreatureObject(pTarget):getSkillMod("rp_stealth"))
		local targetRoll = math.floor(math.random(1,20))
		local theirTotal = targetSkillValue + targetRoll
		
		local rollString = " (1d20 = " .. skillValue .. " + " .. fpi .. " = " .. yourTotal .. " vs 1d20 = " .. targetRoll .. " + " .. targetSkillValue .. " = " .. theirTotal .. ")" 
		
		if(theirTotal < yourTotal) then
			message = message .. " They look through the Force, and can clearly see " .. CreatureObject(pTarget):getFirstName() .. " regardless of whether or not they are in stealth."
		else 
			message = message .. " They look through the Force to try and see " .. CreatureObject(pTarget):getFirstName() .. ", but " .. CreatureObject(pTarget):getFirstName() .. " eludes them."
		end
		
		message = message .. rollString
	end
	
	CreatureObject(pPlayer):doAnimation("force_persuasion")	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end