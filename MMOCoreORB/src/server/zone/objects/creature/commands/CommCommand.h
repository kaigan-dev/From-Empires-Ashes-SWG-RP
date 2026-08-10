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
			ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

			StringTokenizer args(arguments.toString());
			String firstName;
			if(args.hasMoreTokens()) {
				args.getStringToken(firstName);
				player = server->getZoneServer()->getPlayerManager()->getPlayer(firstName);
			}

			if (player == nullptr) {
				creature->sendSystemMessage("The Name is not a valid player character or no name was detected. Alternatively, this can also happen if the charcter is nearby, in which case it can be worked around by duplicating their name in the command, eg. '/comm FirstName FirstName message'");
				return GENERALERROR;
			}

			if (player->getZone() == nullptr) {
				creature->sendSystemMessage("This player is not online.");
				return GENERALERROR;
			}

			Locker clocker(player, creature);

			String messageString;

			if(args.hasMoreTokens()) {
				messageString = arguments.toString().subString(1 + firstName.length(), arguments.toString().length());
			}
			else {
				creature->sendSystemMessage("No message passed. Comm command syntax is:  /comm firstName message");
				return GENERALERROR;
			}

			//BorNPC::SpeakThroughNPC(creature, creature->asSceneObject(), false, messageString, 0);
			creature->getZoneServer()->getChatManager()->broadcastChatMessage(creature, "<C> " + messageString, 0, 1, creature->getMoodID(), 0U, ghost->getLanguageID());

			bool knowsLanguage = false;

			if(ghost->getLanguageID() == 9 || ghost->getLanguageID() == 18) {
				creature->sendSystemMessage("You cannot speak in comms using a non-verbal language.");
			}

			if(ghost->getLanguageID() == 1) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 2 && player->getSkillMod("language_rodian_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 3 && player->getSkillMod("language_trandoshan_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 4 && player->getSkillMod("language_moncalamari_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 5 && player->getSkillMod("language_wookiee_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 6 && player->getSkillMod("language_bothan_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 7 && player->getSkillMod("language_twilek_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 8 && player->getSkillMod("language_zabrak_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 10 && player->getSkillMod("language_ithorian_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 11 && player->getSkillMod("language_sullustan_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 12 && player->getSkillMod("language_mistryl_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 13 && player->getSkillMod("language_huttese_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 14 && player->getSkillMod("language_esselean_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 15 && player->getSkillMod("language_miralukese_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 15 && player->getSkillMod("language_miralukese_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 16 && player->getSkillMod("language_sephi_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 17 && player->getSkillMod("language_ewok_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 19 && player->getSkillMod("language_astromech_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 20 && player->getSkillMod("language_jawatrade_comprehend") > 0) {
				knowsLanguage = true;
			}
			else if(ghost->getLanguageID() == 21 && player->getSkillMod("language_mandoa_comprehend") > 0) {
				knowsLanguage = true;
			}


			if(!knowsLanguage) {
				messageString = "[" + creature->getFirstName() + "] <C> Speaks in a language you do not understand";
				player->sendSystemMessage(messageString);
			}
			else {
				messageString = "[" + creature->getFirstName() + "] <C> " + messageString;
				player->sendSystemMessage(messageString);
			}


		}

		catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for /comm command.");
		}

		return SUCCESS;
	}

};

#endif //COMMCOMMAND_H_