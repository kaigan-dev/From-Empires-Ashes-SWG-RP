BorForce_Deflect = {
		name = "Force Deflect",
}

function BorForce_Deflect:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "As a defensive reaction, attempt to deflect a ranged attack at a cost of 3 Force. The defender rolls Lightsaber against DC 15, harmlessly deflecting the shot if successful."
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Deflect:execute(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("Use the /rpsetstance menu to enable the telekinetic Deflect defensive reaction.")
end