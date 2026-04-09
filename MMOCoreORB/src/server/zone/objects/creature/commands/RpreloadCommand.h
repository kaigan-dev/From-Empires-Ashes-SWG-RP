/*
				Copyright <SWGEmu>
			Command written by BorrieBoBaka
		See file COPYING for copying conditions.*/

#ifndef RPRELOADCOMMAND_H_
#define RPRELOADCOMMAND_H_

#include "server/zone/borrie/BorCharacter.h"

class RpreloadCommand : public QueueCommand {
public:
	RpreloadCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		/*
		StringTokenizer args(arguments.toString());

		try {
			bool isMoving = creature->getStoredInt("rp_moving") == 1;
			if (isMoving) {
				//Confirm
				BorCharacter::ConfirmRoleplayMove(creature);
				creature->deleteStoredInt("rp_moving");
			} else {
				//Initialize
				BorCharacter::InitializeRoleplayMove(creature);
				creature->setStoredInt("rp_moving", 1);
			}
		} catch (Exception& e) {
			creature->sendSystemMessage("Something went wrong.");
		}
			*/
		creature->sendSystemMessage("The reload command does not exist yet. Luckily, neither does ammunition.");
		return SUCCESS;
	}
};

#endif // RPRELOADCOMMAND_H_