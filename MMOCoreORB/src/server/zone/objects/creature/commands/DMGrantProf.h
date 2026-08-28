#ifndef DMGRANTPROF_H_
#define DMGRANTPROF_H_

#include "server/zone/borrie/BorDM.h"
#include "server/zone/borrie/BorrieRPG.h"

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"

#include "server/zone/borrie/BorCharacter.h"

#include "server/zone/objects/creature/sui/DMGrantProfCommandSuiCallback.h"

class DmGrantProfCommand : public QueueCommand {

public:
	DmGrantProfCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		if(adminLevelCheck == 0)
			return GENERALERROR;

		StringTokenizer args(arguments.toString());

		//String targetID = std::to_string(target);
		//creature->setStoredString("dm_grant_prof_target", targetID);

		ManagedReference<SceneObject*> targetSceneObject;
		if (target != 0) {
			targetSceneObject = server->getZoneServer()->getObject(target, false);
		}
		else {
			creature->sendSystemMessage("You must target a character in order to grant them a profession.");
			return GENERALERROR;
		}

		BorrieRPG::SaveTarget(creature, targetSceneObject);
		

		try {
			ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);
			box->setCallback(new DMGrantProfCommandSuiCallback(creature->getZoneServer(), 0, 0));
			box->setPromptTitle("Offer Profession Training");
			box->setPromptText("What profession would you like to train for the target?");			
			box->setCancelButton(true, "@cancel");
			box->setOkButton(false, "@");
			box->addMenuItem("Offer training in a Force Profession");
			box->addMenuItem("Offer training in a Non-Force Profession");
			creature->getPlayerObject()->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
		} catch (Exception& e) {
			creature->sendSystemMessage("Error encountered when using DM Grant Profession command.");
		}
		return SUCCESS;
	}

};

#endif