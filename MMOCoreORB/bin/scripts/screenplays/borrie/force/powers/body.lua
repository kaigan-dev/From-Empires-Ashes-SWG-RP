BorForce_Body = {
	name = "Force Body"	
}

function BorForce_Body:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a major action, roll Inward vs DC 12 to cleanse your body of physical status effects such as toxins, bleeding, or stun. This may be performed even when stunned or otherwise unable to move. Once per day, recover Action pool equal to Force points spent."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Body:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_body")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end


	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Body", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Body:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Body:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	local clientEffect = "clienteffect/pl_force_heal_self.cef"
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	--Begin Force Code
	local forceDieValue = math.random(1, 20)
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local forceTotal = math.floor(forceDieValue + skillValue)	
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. ", rolling 1d20: " .. forceDieValue .. " + " .. skillValue .. " = " .. forceTotal .. " vs DC 12."

	if(forceTotal >= 12) then
		message = message .. " They rejuvinate themselves, healing physical ailments! If they choose to use the once per day ability, they may also recover ".. fpi .." action points! (which the GM should provide manually)"
		CreatureObject(pPlayer):playEffect(clientEffect, "")	

		--Disabling automatic recovery. Retain for re-use or reference if needed. Cagnaith 4/13/26
		--CreatureObject(pPlayer):setHAM(3, math.min(CreatureObject(pPlayer):getHAM(3) + fpi * 2, CreatureObject(pPlayer):getMaxHAM(3)))
	else 
		message = message .. " Unfortunately, their focus is broken, and they fail to rejuvinate themselves."
	end
	
	broadcastMessageWithName(pPlayer, message)
	

	--Drain Force Pool Accordingly.
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end