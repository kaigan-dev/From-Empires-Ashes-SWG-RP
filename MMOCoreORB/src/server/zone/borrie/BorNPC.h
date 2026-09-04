#ifndef BORNPC_H_
#define BORNPC_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/borrie/BorCharacter.h"

//#include "templates/roleplay/RoleplayManager.h"

class BorNPC : public Logger {
public:
	static void ToggleCombat(CreatureObject* creature) {
		// Locker clock(target);
		// target->setDefender(target);
		// target->setCombatState();

		ManagedReference<CreatureObject*> target;
		Zone* zone = creature->getZone();
		CreatureManager* creatureManager = zone->getCreatureManager();
		float posX = creature->getPositionX(), posY = creature->getPositionY(), posZ = creature->getPositionZ();
		uint64 parID = creature->getParentID();
		String objName = "", tempName = "vicious_squall";
		uint32 templ = tempName.hashCode();
		uint32 objTempl = objName.length() > 0 ? objName.hashCode() : 0;
		target = creatureManager->spawnCreature(templ, objTempl, posX, posZ, posY, parID);
		if (target != nullptr)
			target->asAiAgent()->activateLoad("");
		Locker clocker(creature);
		Locker targetelocker(target);
		target->setDefender(creature);
		creature->setDefender(target);
		target->getThreatMap()->addAggro(creature, 999, 0);
		target->destroyObjectFromWorld(true);
	}

	static void StopCombat(CreatureObject* creature) {
		// creature->clearCombatState(true);
		Locker lock(creature);
		CombatManager::instance()->forcePeace(creature);
	}

	static void DisarmNPC(CreatureObject* creature) {
		if(creature->isPlayerCreature())
			return;

		WeaponObject* weapon = creature->getWeapon();
		// Null check, then goodbye existing weapon
        if (weapon != nullptr)
		{
			weapon->destroyObjectFromWorld(true);
			weapon->destroyObjectFromDatabase(true);
		}
	}

	static bool RemoveNPCArmor(CreatureObject* target, String slot, bool destroy = true) {
		if (target == nullptr || target->isPlayerCreature())
			return false;

		ManagedReference<SceneObject*> worn = target->getSlottedObject(slot);
		if (worn == nullptr || !worn->isTangibleObject())
			return false;

		Locker clocker(target);
		Locker ilocker(worn);

		// NPC templates use the plain ContainerComponent, so the wearables delta vector is normally
		// untouched for them. This is a no-op when the item is not listed, and keeps the client's
		// CREO6 wearables list correct for any creature template that does track it.
		target->removeWearableObject(worn->asTangibleObject(), true);

		// If the item is not being destroyed, try to transfer it to the NPC's inventory. If that fails, destroy it.
		if (!destroy) {
			ManagedReference<SceneObject*> inventory = target->getSlottedObject("inventory");
			if (inventory != nullptr && inventory->transferObject(worn, -1, true))
				return true;
		}

		worn->destroyObjectFromWorld(true);
		worn->destroyObjectFromDatabase(true);

		return true;
	}


	static void ToggleAlwaysOnAI(CreatureObject* target, CreatureObject* commander) {
		ManagedReference<AiAgent*> agent = target->asAiAgent();
		Locker alock(agent);
		if (agent->getCreatureBitmask() & CreatureFlag::ALWAYSON) {
			agent->clearCreatureBit(CreatureFlag::ALWAYSON);
			commander->sendSystemMessage("Target's AI is no longer always on.");
		} else {
			agent->setCreatureBit(CreatureFlag::ALWAYSON);
			commander->sendSystemMessage("Target's AI is Always On now.");
		}
	}

	static void SetAlwaysOnAI(CreatureObject* target, CreatureObject* commander, bool isOn, bool showMessage = false) {
		ManagedReference<AiAgent*> agent = target->asAiAgent();
		Locker alock(agent);
		if (isOn) {
			agent->clearCreatureBit(CreatureFlag::ALWAYSON);
			if (showMessage)
				commander->sendSystemMessage("Target's AI is no longer always on.");
		} else {
			agent->setCreatureBit(CreatureFlag::ALWAYSON);
			if (showMessage)
				commander->sendSystemMessage("Target's AI is Always On now.");
		}
	}

	static void ToggleAIWalks(CreatureObject* target, CreatureObject* commander) {
		ManagedReference<AiAgent*> agent = target->asAiAgent();
		Locker alock(agent);
		if (!target->isPlayerObject()) {
			if (agent->getCreatureBitmask() & CreatureFlag::TOGGLEWALK) {
				agent->clearCreatureBit(CreatureFlag::TOGGLEWALK);
				commander->sendSystemMessage("The target will run if need be.");
			} else {
				agent->setCreatureBit(CreatureFlag::TOGGLEWALK);
				commander->sendSystemMessage("The target is forced to walk.");
			}
		} else {
			commander->sendSystemMessage("The target must be an NPC.");
		}
	}

	static void SetAIAlwaysWalks(CreatureObject* target, CreatureObject* commander, bool isOn, bool showMessage = false) {
		ManagedReference<AiAgent*> agent = target->asAiAgent();
		Locker alock(agent);
		if (!target->isPlayerObject()) {
			if (isOn) {
				agent->clearCreatureBit(CreatureFlag::TOGGLEWALK);
				if (showMessage)
					commander->sendSystemMessage("The target will run if need be.");
			} else {
				agent->setCreatureBit(CreatureFlag::TOGGLEWALK);
				if (showMessage)
					commander->sendSystemMessage("The target is forced to walk.");
			}
		} else {
			commander->sendSystemMessage("The target must be an NPC.");
		}
	}

	static void SetNPCPosture(CreatureObject* target, int posture) {
		Locker clock(target);
		if (posture == 0)
			target->setPosture(CreaturePosture::UPRIGHT, true, true);
		else if (posture == 1)
			target->setPosture(CreaturePosture::CROUCHED, true, true);
		else if (posture == 2)
			target->setPosture(CreaturePosture::PRONE, true, true);
		else if (posture == 3)
			target->setPosture(CreaturePosture::SNEAKING, true, true);
		else if (posture == 4)
			target->setPosture(CreaturePosture::SITTING, true, true);
		else if (posture == 5)
			target->setPosture(CreaturePosture::KNOCKEDDOWN, true, true);
		else if (posture == 6)
			target->setPosture(CreaturePosture::DEAD, true, true);
		else if (posture == 7)
			target->setPosture(CreaturePosture::CROUCHED, false, true);
		else if (posture == 8)
			target->setPosture(CreaturePosture::CROUCHED, false, false);
	}

	static void SetNPCPosture(CreatureObject* target, String posture) {
		if(posture == "upright" || posture == "standing" || posture == "stand") {
			target->setPosture(CreaturePosture::UPRIGHT, true, true);
		} else if(posture == "kneeling" || posture == "kneel" || posture == "crouched") {
			target->setPosture(CreaturePosture::CROUCHED, true, true);
		} else if(posture == "prone") {
			target->setPosture(CreaturePosture::PRONE, true, true);
		} else if(posture == "sneaking" || posture == "sneak") {
			target->setPosture(CreaturePosture::SNEAKING, true, true);
		} else if(posture == "sitting" || posture == "sit" || posture == "sitdown") {
			target->setPosture(CreaturePosture::SITTING, true, true);
		} else if(posture == "knockdown" || posture == "knockeddown" || posture == "kd") {
			target->setPosture(CreaturePosture::KNOCKEDDOWN, true, true);
		} else if(posture == "dead" || posture == "corpse" || posture == "dying" || posture == "killed" || posture == "kill") {
			target->setPosture(CreaturePosture::DEAD, true, true);
		}
	}

	static void ToggleForceAICombat(CreatureObject* target, CreatureObject* commander) {
		ManagedReference<AiAgent*> agent = target->asAiAgent();
		Locker alock(agent);
		if (agent->getCreatureBitmask() & CreatureFlag::FORCECOMBAT) {
			agent->clearCreatureBit(CreatureFlag::FORCECOMBAT);
			commander->sendSystemMessage("Target is no longer forced into combat.");
		} else {
			agent->setCreatureBit(CreatureFlag::FORCECOMBAT);
			commander->sendSystemMessage("Target will now not peace out of combat.");
		}
	}

	static void ToggleDirectFollow(CreatureObject* target, CreatureObject* commander) {
		ManagedReference<AiAgent*> agent = target->asAiAgent();
		Locker alock(agent);
		if (!target->isPlayerObject()) {
			if (agent->getCreatureBitmask() & CreatureFlag::DIRECTFOLLOW) {
				agent->clearCreatureBit(CreatureFlag::DIRECTFOLLOW);
				commander->sendSystemMessage("Target will no longer tightly follow you.");
			} else {
				agent->setCreatureBit(CreatureFlag::DIRECTFOLLOW);
				commander->sendSystemMessage("Target will now tightly follow you.");
			}
		} else {
			commander->sendSystemMessage("The target must be an NPC.");
		}
	}

	static void SendCreatureToPosition(CreatureObject* master, CreatureObject* targetCreature) {
		//Logger::console.info("Starting send creature to position procedure", true);
		Locker nlocker(master);
		float x = master->getPositionX();
		float y = master->getPositionY();
		float z = master->getPositionZ();
		CellObject* cell = nullptr;
		if(master->getParent() != nullptr) {
			cell = master->getParent().get().castTo<CellObject*>();
		}
		Locker nlocker2(targetCreature);
		AiAgent* agent = targetCreature->asAiAgent();
		if(agent == nullptr) {
			master->sendSystemMessage("Your target is not an AiAgent.");
			return;
		}
		agent->setFollowObject(nullptr);
		agent->setTargetObject(nullptr);
		agent->setFollowState(AiAgent::PATROLLING);
		agent->clearSavedPatrolPoints();
		agent->stopWaiting();
		agent->setWait(0);
		agent->setHomeLocation(x,z,y,cell);
		agent->setNextPosition(x, z, y, cell);
		agent->activateMovementEvent();
		
	}

	static void SetCreaturePosition(CreatureObject* creature, CreatureObject* master) {
		Locker nlocker(master, creature);
		creature->setPosition(master->getPositionX(), master->getPositionZ(), master->getPositionY());
		creature->updateZone(false, false);
	}

	static void SetCreatureFollow(CreatureObject* follower, CreatureObject* leader) {
		Locker nlocker(follower, leader);
		follower->asAiAgent()->setFollowObject(leader);
		follower->asAiAgent()->storeFollowObject();
		follower->asAiAgent()->setFollowState(AiAgent::FOLLOWING);
		follower->asAiAgent()->stopWaiting();
		follower->asAiAgent()->setWait(0);
		follower->asAiAgent()->activateMovementEvent();
	}

	static void SetCreatureStay(CreatureObject* creature, CreatureObject* parent) {
		Locker nlocker(creature, parent);
		creature->asAiAgent()->setOblivious();
		creature->asAiAgent()->setFollowState(AiAgent::OBLIVIOUS);
		creature->asAiAgent()->storeFollowObject();
		creature->asAiAgent()->setHomeLocation(parent->getPositionX(), parent->getPositionZ(), parent->getPositionY(),
																			 parent->getParent().get().castTo<CellObject*>());
		creature->asAiAgent()->stopWaiting();
		creature->asAiAgent()->setWait(0);
		creature->asAiAgent()->activateMovementEvent();
	}

	static void FaceCreature(CreatureObject* looker, CreatureObject* target) {
		looker->faceObject(target, true);
	}

	static void EquipNPCWeapon(SceneObject* target, bool forceRanged) {
		if (target->isCreatureObject()) {
			if (target->asCreatureObject()->asAiAgent() != nullptr) {
				Locker nlocker(target);
				target->asCreatureObject()->asAiAgent()->selectWeapon(forceRanged);
			}
		}
	}

	static void SpeakThroughNPC(CreatureObject* creature, SceneObject* object, bool isAdmin, String speech, int chatType) {
		const ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		String prefix = "";
		bool isMine = false;

		if (object == nullptr) {
			creature->sendSystemMessage("ERROR: Target required for OtherSpeak commands. They cannot be another player.");
			return;
		}
		ManagedReference<CreatureObject*> targetCreature;
		if (object->isCreatureObject()) {
			targetCreature = object->asCreatureObject();
			if (targetCreature->getPlayerObject() != nullptr) {    //Is the target a player? If so, allow only other characters on their account to control them.
				//if (targetCreature->getPlayerObject()->getAccountID() == ghost->getAccountID() || isAdmin)
				if (targetCreature->getPlayerObject()->getAccountID() == ghost->getAccountID())
					isMine = true;
				else {
					creature->sendSystemMessage("ERROR: You can only speak through NPCs, characters or pets that you own.");
					return;
				}
			} else if (isAdmin) {   //If the target is not a player, allow admins to control them.
				//isMine = creature == targetCreature->getLinkedCreature().get();
				isMine = true;
			}
			/* Remove check which should never be relevant for GMusage, as it will interfere with player /comm command.
			else {   //If the target is not a player and the controller is not an admin, deny access. We shouldn't actually hit this step because of the earlier "else return".
				isMine = false;
			}
			*/
			
			if (!isMine) {
				//prefix = "[" + creature->getFirstName() + "] ";   //Old behavior. We don't want to let anyone speak through any creature. This will specify who is controlling the target creature if we wanted to use it somewhere though.
				creature->sendSystemMessage("ERROR: You can only speak through characters or pets that you own.");
				return;
			}
				

			Locker locker(targetCreature);
			creature->getZoneServer()->getChatManager()->broadcastChatMessage(targetCreature, prefix + speech, 0, chatType, creature->getMoodID(), 0);
		} else {
			creature->sendSystemMessage("ERROR: Only creatures can speak.");
			return;
		}
	}
 
	static int GetTargetDistance(CreatureObject* creature, SceneObject* object) {
		if (object == nullptr)
			return -1;
		return (int)creature->getDistanceTo(object);
	}
	
};

#endif /*BORNPC_H_*/