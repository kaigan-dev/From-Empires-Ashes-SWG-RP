BorForce_Meditate = {
	name = "Force Meditation",
}

function BorForce_Meditate:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Spend a will point to regenerate half of your force bar as a short rest. Can only be done in a safe space. "
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Meditate:execute(pPlayer)
	--[[ Remove Force prereqs
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_inward_novice")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	-]]
	
	self:performAbility(pPlayer)
end

function BorForce_Meditate:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if(CreatureObject(pPlayer):isRidingMount()) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot do this while mounted.")
		return
	end

	if (pGhost == nil) then
		return
	end
	--[[ Disable Meditate outside of the rest menu
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	local forcePowerMax = math.floor(PlayerObject(pGhost):getForcePowerMax())
	
	local willPoints = CreatureObject(pPlayer):getHAM(6)
	
	if(willPoints < 2) then
		CreatureObject(pPlayer):sendSystemMessage("Meditating now will incapacitate you. You cannot find the peace of mind required.")
		return
	end
	
	local clientEffect = "clienteffect/pl_force_meditate_self.cef"
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "! In the cover of safety, they regenerate their force pool by " .. tonumber(forcePowerMax / 2) .. " points!"
	
	CreatureObject(pPlayer):setMoodString("meditating")
	CreatureObject(pPlayer):setPosture(POSTURESITTING)
	CreatureObject(pPlayer):playEffect(clientEffect, "")
	
	local forcePowerPoints = math.max(forcePowerMax, forcePower + (forcePowerMax / 2))
	
	PlayerObject(pGhost):setForcePower(forcePowerPoints)
	CreatureObject(pPlayer):setHAM(6, CreatureObject(pPlayer):getHAM(6) - 1)	
	
	broadcastMessageWithName(pPlayer, message)
	--]]
end