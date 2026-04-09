/*
				Copyright <SWGEmu>
			Command written by Borrie BoBaka
		See file COPYING for copying conditions.*/

#ifndef RPRELOADCOMMAND_H_
#define RPRELOADCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"

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

		creature->sendSystemMessage("Reload does not yet exist. Luckily, neither does ammo consumption. Check back later!");

	/*  The below is a continuation of the /rpsetstance command and only resembles what we actually want in the vaguest imaginabel way. Remove it when actually implementing the reload command. 
	// A target is passed into it because DMs can perform /rpsetstance on NPCs, so much of that logic may not be necessary if NPCs don't actually consume ammo, which they probably should not.

		int adminLevelCheck = ghost->getAdminLevel();

		StringTokenizer args(arguments.toString());

		ManagedReference<CreatureObject*> targetCreature;

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		}

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
			String command, selectionName = "";
			if (args.hasMoreTokens()) {
				args.getStringToken(command);

				if(command == "none" || command == "clear") {
					targetCreature->setStoredInt("reaction_stance", 0);
					selectionName = "No Action";
				} else if(command == "defend" || command == "defense") {
					targetCreature->setStoredInt("reaction_stance", 1);
					selectionName = "Defend";
				} else if(command == "parry") {
					targetCreature->setStoredInt("reaction_stance", 2);
					selectionName = "Parry";
				} else if(command == "dodge") {
					targetCreature->setStoredInt("reaction_stance", 3);
					selectionName = "Dodge";
				} else if(command == "deflect" || command == "lsdeflect") {
					if(targetCreature->hasSkill("rp_frc_defense")) {
						targetCreature->setStoredInt("reaction_stance", 4);
						selectionName = "Deflect";
					} else {
						creature->sendSystemMessage("You can't use that stance.");
						return GENERALERROR;
					}					
				} else if(command == "fdeflect" || command == "forcedeflect") {
						if(targetCreature->hasSkill("rp_frc_deflect")) {
						targetCreature->setStoredInt("reaction_stance", 5);
						selectionName = "Force Deflect";
					} else {
						creature->sendSystemMessage("You can't use that stance.");
						return GENERALERROR;
					}					
				} else if(command == "absorb" || command == "forceabsorb") {
					if(targetCreature->hasSkill("rp_frc_absorb")) {
						targetCreature->setStoredInt("reaction_stance", 6);
						selectionName = "Force Absorb";
					} else {
						creature->sendSystemMessage("You can't use that stance.");
						return GENERALERROR;
					}					
				} else {
					creature->sendSystemMessage("That is not a valid combat stance. Valid stances are: 'none', 'parry', 'dodge', 'deflect', 'forcedeflect', and 'absorb'.");
				}

				if(selectionName != "") {
					if(targetCreature == creature) creature->sendSystemMessage("You've set your combat reaction stance to: " + selectionName);
					else creature->sendSystemMessage("You've set "+targetCreature->getFirstName()+"'s combat reaction stance to: " + selectionName);
				}
			} else {
				//Pop up a Menu
				ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);
				box->setCallback(new ReactionStanceSuiCallback(creature->getZoneServer(), 0, 0));
				box->setPromptTitle("Reaction Stance Menu");
				box->setPromptText("Select the reaction stance you'd like to take. A reaction stance determines how you'll respond when attacked. Most actions beyond \"None\" will cost action points to execute.");
				box->setCancelButton(true, "@cancel");
				box->addMenuItem("None");
				box->addMenuItem("Defend");
				box->addMenuItem("Parry");
				box->addMenuItem("Dodge");
				if(targetCreature->hasSkill("rp_frc_defense")) box->addMenuItem("Lightsaber Deflect");
				if(targetCreature->hasSkill("rp_frc_deflect")) box->addMenuItem("Force Deflect");
				if(targetCreature->hasSkill("rp_frc_absorb")) box->addMenuItem("Force Absorb");
				creature->getPlayerObject()->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
			}


		} catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for RpSetStanceCommand command.");
		}

	*/
		return SUCCESS;
	}
		
};

#endif // RPRELOADCOMMAND_H_