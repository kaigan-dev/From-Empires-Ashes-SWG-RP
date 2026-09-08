/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RPFORCECOMMAND_H_
#define RPFORCECOMMAND_H_

#include "server/zone/borrie/BorUtil.h"

class RpForceCommand : public QueueCommand {
public:

	RpForceCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

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

		if (creature->getStoredInt("secretdm") == 1) {
			adminLevelCheck = 15;
		}

		StringTokenizer args(arguments.toString());

		try { 

			String command;

			if (args.hasMoreTokens()) {
				args.getStringToken(command);
			}

			command = command.toLowerCase();

			int forceLevel = creature->getRpForceLevel();

			if(command == "dm") {
				if(adminLevelCheck > 10) {
					BorUtil::CallScreenplayFunction(creature, "BorForce", "promptForceDMMenu");
				} else {
					creature->sendSystemMessage("You don't have permission to do that.");
				}
			} else if(command == "awaken") {
				if(forceLevel > 2) { //Initiated and beyond
					if(target != 0) {
						//BorUtil::CallScreenplayFunction(creature, "BorForce", "promptAwakenOther");
					} else {
						//creature->sendSystemMessage("You can awaken another at the expense of some experience.");
					}
				} else if(forceLevel > 0) {
					//BorUtil::CallScreenplayFunction(creature, "BorForce", "promptAwakenSelf");
				} else {
					//creature->sendSystemMessage("You reach out, trying to grasp at anything beyond your own mind and body, but all you feel is a light breeze.");
				}				
			} else if(command == "togglesaberschems") {
				if(forceLevel > 0) {
					BorUtil::CallScreenplayFunction(creature, "BorForce", "toggleLightsaberSchematics");
				}
			} else if(command == "meditate") {
				if(forceLevel > 0) {
					//BorUtil::CallScreenplayFunction(creature, "BorForce", "startForceMeditation");
				} else {
					//creature->sendSystemMessage("You clear your mind, but the only thing you can hear is your own thoughts and breathing.");
				}				
			} else if(command == "help") { 
				//creature->sendSystemMessage("This command allows you to interact with the force, if you are force sensitive. No arguments will prompt a menu.");
			} else {
				if(forceLevel > 0) {
					//BorUtil::CallScreenplayFunction(creature, "BorForce", "promptForceMenu");
				} else {
					//creature->sendSystemMessage("The Force does not speak to you.");
				}
				
			}

		} catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for RpForce command. Help: /RpForce help");
		}
		return SUCCESS;

	}

};

#endif //RPFORCECOMMAND_H_

