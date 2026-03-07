BorForce_Stealth = {
	name = "Force Stealth",
}

function BorForce_Stealth:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Roll against DC:20 (Control + FPI + 1d20) to enter stealth immediately without regards of cover or line of sight. "
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Stealth:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_control_a04")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	-]]
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Stealth", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Stealth:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Stealth:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	local clientEffect = "clienteffect/pl_force_resist_disease_self.cef"
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local roll = math.floor(math.random(1,20))	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "! "
	
	if(roll + skillValue + fpi >= 20) then
		message = message .. CreatureObject(pPlayer):getFirstName() .. " seemingly vanishes into thin air! They've instantly gone to stealth and cannot be spotted this round. Afterwards, base stealth rules apply. "
	else 
		message = message .. CreatureObject(pPlayer):getFirstName() .. " seems to fade briefly from view before shimmering back. They fail to hide themselves. "
	end
	
	local rollMessage = "(1d20: " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. roll + skillValue + fpi .. " vs DC: 20)"
	
	message = message .. rollMessage
	
	CreatureObject(pPlayer):doAnimation("force_illusion")	
	CreatureObject(pPlayer):playEffect(clientEffect, "")	

	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
end
