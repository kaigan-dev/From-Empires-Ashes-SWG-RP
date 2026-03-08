BorForce_Jump = {
	name = "Force Jump"	
}

function BorForce_Jump:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Jump to any location within a <Force Point Input> * 4 meter range. Removes any movement impairing effect."
	helpMessage = helpMessage .. " If your landing location is not an immediately flat surface, such as jumping over a wall, you need to incorporate that distance into your jump's range."
	helpMessage = helpMessage .. " If you do not, you take the meters fallen * 2 as health damage."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Jump:execute(pPlayer)

	local hasPower = CreatureObject(pPlayer):hasSkill("rp_frc_jump")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end

	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Jump", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Jump:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Jump:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	fpi = math.floor(fpi)
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
		
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	message = message .. " They can jump up to " .. fpi * 4 .. " meters! If their destination is not solid ground, they need to incorporate that into range, or take Distance * 2 fall damage!"
	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
	local clientEffect = "clienteffect/pl_force_jump.cef"
	CreatureObject(pPlayer):playEffect(clientEffect, "")	
	CreatureObject(pPlayer):doAnimation("jump")
end
