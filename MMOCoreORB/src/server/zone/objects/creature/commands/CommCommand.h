/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef COMMCOMMAND_H_
#define COMMCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
//#include "server/zone/objects/transaction/TransactionLog.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"

#include "server/zone/borrie/BorCharacter.h"
#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorNPC.h"

//#include "server/zone/objects/creature/sui/CommCommandSuiCallback.h"

class CommCommand : public QueueCommand {
public:

	CommCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		try {

			ManagedReference<CreatureObject*> player = nullptr;

			StringTokenizer args(arguments.toString());
			String firstName;
			if(args.hasMoreTokens()) {
				args.getStringToken(firstName);
				creature->sendSystemMessage("Debug: More tokens detected. Target name is " + firstName);
				player = server->getZoneServer()->getPlayerManager()->getPlayer(firstName);
			}
			else {
				creature->sendSystemMessage("Debug: No name token detected");
			}

			if (player == nullptr) {
				creature->sendSystemMessage("No target name detected. Comm command syntax is:  /comm firstName message");
				return GENERALERROR;
			}

			Locker clocker(player, creature);

			String messageString;

			if(args.hasMoreTokens()) {
				//args.getStringToken(messageString);
				messageString = arguments.toString().subString(1 + firstName.length(), arguments.toString().length());
				creature->sendSystemMessage("Debug: More tokens detected. Message is " + messageString);
			}
			else {
				creature->sendSystemMessage("No message passed. Comm command syntax is:  /comm firstName message");
				return GENERALERROR;
			}

			BorNPC::SpeakThroughNPC(creature, creature->asSceneObject(), false, messageString, 0);

			messageString = "[" + creature->getFirstName() + " <C> " + messageString;
			player->sendSystemMessage(messageString);
			}

		catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for /comm command.");
		}

		return SUCCESS;
	}

};

#endif //COMMCOMMAND_H_