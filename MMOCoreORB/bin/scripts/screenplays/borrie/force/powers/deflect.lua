BorForce_Deflect = {
	
}

function BorForce_Deflect:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a defensive reaction, attempt to deflect a ranged attack at a cost of 3 Force. The defender rolls Lightsaber against the attack roll, harmlessly deflecting the shot if successful."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Deflect:execute(pPlayer)
	
end