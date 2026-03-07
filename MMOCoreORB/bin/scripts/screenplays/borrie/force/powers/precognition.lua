BorForce_Precognition = {
	name = "Precognition"
}

function BorForce_Precognition:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage = helpMessage .. "Contextual to RP. Roll 1d20 + sense + FPI to potentially get a hint of the future from a DM, or get a prophecy.  "
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Precognition:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_sense_b03")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	-]]
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Precognition", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Precognition:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Precognition:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local roll = math.floor(math.random(1,20))
	local yourTotal = skillValue + fpi + roll
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	
	message = message .. " They try to peer into the future, trying to get some hint as to what may come."
	
	local rollString = " (1d20 = " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. yourTotal .. ")" 
	
	broadcastMessageWithName(pPlayer, message .. rollString)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end