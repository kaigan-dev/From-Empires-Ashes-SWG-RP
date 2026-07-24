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

	int doQueueCommand(CreatureObject* creature, const UnicodeString& arguments) const {

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
				player = server->getZoneServer()->getPlayerManager()->getPlayer(firstName);
			}

			if (player == nullptr) {
				creature->sendSystemMessage("Comm command syntax is:  /comm firstName message");
				return GENERALERROR;
			}

			Locker clocker(player, creature);

			String messageString;
			args.getStringToken(messageString);

			if(args.hasMoreTokens()) {
				args.getStringToken(messageString);
			}
			else {
				creature->sendSystemMessage("Comm command syntax is:  /comm firstName message");
				return GENERALERROR;
			}

			player->sendSystemMessage("<C>" + messageString);

			else if (BorrieRPG::GetChatTypeID(command) != -1) {
						//String speech = arguments.toString().subString(1 + command.length(), arguments.toString().length());
						BorNPC::SpeakThroughNPC(creature, server->getZoneServer()->getObject(target, false), true, messageString, BorrieRPG::GetChatTypeID(command));
					} else {
						creature->sendSystemMessage("Invalid speech type.");
					}
				}

		return SUCCESS;
	}

};

#endif //COMMCOMMAND_H_





/* Reference material
class HpCommand : public QueueCommand {

public:
	HpCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		StringTokenizer args(arguments.toString());

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		}

		ManagedReference<CreatureObject*> targetCreature;

		if (adminLevelCheck > 0) {
			if (object != nullptr) {
				if (object->isCreatureObject()) {
					targetCreature = object->asCreatureObject();
				} else {
					targetCreature = creature;
				}
			} else {
				targetCreature = creature;
			}			
		} else {
			targetCreature = creature;
		}

		try {
			String command, subCommand;
			if (args.hasMoreTokens()) {
				args.getStringToken(command);
				// Direct Edit
				if (args.hasMoreTokens()) {
					args.getStringToken(subCommand);
					if (BorCharacter::GetStringIsPool(command)) {
						if (subCommand == "fill" || subCommand == "max") {
							BorCharacter::FillPool(targetCreature, command);
						} else {
							BorCharacter::ModPool(targetCreature, command, Integer::valueOf(subCommand));
						}
					} else {
						creature->sendSystemMessage("Invalid arguments for HP command. Requires value to edit pool with.");
					}
				} else {
					if (command == "max" || command == "fill" || command == "rest" || command == "reset") {
						BorCharacter::FillAllPools(targetCreature);
					} else {
						creature->sendSystemMessage("Invalid arguments for HP command. Requires you to specify a pool you wish to modify, and the value to modify it by, or 'fill' to max out all values.");
					}
					
				}

			} else {
				// Open Menu, tell them who is the target. If I am at all privledged, make the target your target. Otherwise, target is yourself.
				ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);
				box->setCallback(new HpCommandSuiCallback(creature->getZoneServer(), target, 0, 0, adminLevelCheck));
				if (adminLevelCheck > 0)
					box->setPromptTitle("HP Pool Menu, Target: " + targetCreature->getFirstName());
				else {
					box->setPromptTitle("HP Pool Menu");
				}
				box->setPromptText("Modify your pools with the HP command. Which action would you like to perform?");
				box->setCancelButton(true, "@cancel");
				box->addMenuItem("Modify a single pool");
				box->addMenuItem("Max out and fill a single pool");
				box->addMenuItem("Max out all pools");
				creature->getPlayerObject()->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
			}

			

		} catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for HP command.");
		}

		



		return SUCCESS;
	}

};

#endif 
*/