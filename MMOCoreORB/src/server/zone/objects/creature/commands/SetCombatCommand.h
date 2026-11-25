/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SETCOMBATCOMMAND_H_
#define SETCOMBATCOMMAND_H_

#include "server/zone/borrie/BorEffect.h"

class SetCombatCommand : public QueueCommand {

public:
	SetCombatCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

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

		StringTokenizer args(arguments.toString());

		if(adminLevelCheck > 0) {
			ManagedReference<SceneObject*> targetObject = server->getZoneServer()->getObject(target);
			ManagedReference<CreatureObject*> targetCreature; // The Target Object as a Creature
			if(targetObject != nullptr) {
				if (targetObject->isCreatureObject()) {
					targetCreature = targetObject->asCreatureObject();
					if(targetCreature->isPlayerCreature()) {
						//Make target into combat
						//BorEffect::ForceIntoCombat(targetCreature);
						BorEffect::CleanForceIntoCombat(targetCreature);
					} else {
						//use NPC method
						if(targetCreature->isInCombat()) {
							BorEffect::StopCombat(targetCreature);
						} else {
							BorEffect::ForceAICombat(targetCreature, creature);
							//BorEffect::ForceIntoCombat(targetCreature);
							BorEffect::CleanForceIntoCombat(targetCreature);
						}	
					}
				} else {
					//Set my own combat state.
					//BorEffect::ForceIntoCombat(creature);
					BorEffect::CleanForceIntoCombat(creature);
				}
			} else {
				//Set my own combat state.
				//BorEffect::ForceIntoCombat(creature);
				BorEffect::CleanForceIntoCombat(creature);
			}
		} else {
			ManagedReference<SceneObject*> targetObject = server->getZoneServer()->getObject(target);
			ManagedReference<CreatureObject*> targetCreature; // The Target Object as a Creature
			ManagedReference<AiAgent*> pet;
			if(targetObject != nullptr) {
				if (targetObject->isCreatureObject()) {
					targetCreature = targetObject->asCreatureObject();

					for (int i = 0; i < ghost->getActivePetsSize(); ++i) {
						pet = ghost->getActivePet(i);
						//creature->sendSystemMessage("DEBUG: You have a pet!");
						if(creature == targetObject->asCreatureObject()->getLinkedCreature().get()) {   // That is to say, if the player issuing the command owns the target creature.
							//use NPC method
							//creature->sendSystemMessage("DEBUG: You own your pet!");
							if(targetCreature->isInCombat()) {
								creature->sendSystemMessage("Your pet is leaving combat. Store and re-call it in order to reset its animation.");
								BorEffect::StopCombat(targetCreature);
								BorEffect::StopCombat(targetCreature);
							} else {
								creature->sendSystemMessage("Your pet is entering combat. You will need to toggle combat off again before it can be stored.");
								BorEffect::ForceAICombat(targetCreature, creature);
								//BorEffect::ForceIntoCombat(targetCreature);
								BorEffect::CleanForceIntoCombat(targetCreature);
							}
						}
					}
				} else {
					//Set my own combat state.
					//BorEffect::ForceIntoCombat(creature);
					BorEffect::CleanForceIntoCombat(creature);
				}
			} else {
				//Set my own combat state.
				//BorEffect::ForceIntoCombat(creature);
				BorEffect::CleanForceIntoCombat(creature);
			}
		}
		return SUCCESS;
	}

};

#endif 