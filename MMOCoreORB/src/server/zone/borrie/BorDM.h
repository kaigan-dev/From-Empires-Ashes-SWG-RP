#ifndef BORDM_H_
#define BORDM_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/borrie/BorChat.h"

//#include "templates/roleplay/RoleplayManager.h"

class BorDM : public Logger {
public:
	static void sendMessage(CreatureObject* creature, const uint64& target, int adminLevelCheck, String arguments) {
		ManagedReference<SceneObject*> object = creature->getZoneServer()->getObject(target, false);
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (object == nullptr) {
			creature->sendSystemMessage("Target required for /dm msg commands");
			return;
		}

		if (object->asCreatureObject()->getPlayerObject() == nullptr) {
			creature->sendSystemMessage("Target must be a player.");
			return;
		}

		if (adminLevelCheck < 1) {
			creature->sendSystemMessage("You don't have permission to do that.");
			return;
		}

		object->asCreatureObject()->sendSystemMessage(arguments.subString(4, arguments.length()));
		creature->sendSystemMessage("[" + object->asCreatureObject()->getFirstName() + "] recieved: " + arguments.subString(4, arguments.length()));
	}

	static void SendDungeonMasterOOC(CreatureObject* creature, String command, String arguments) {
		String message;
		if(command == "ooc") {
			message = arguments.subString(4, arguments.length());
		} else if(command == "//") {
			message = arguments.subString(3, arguments.length());
		} else if(command == "(") {
			message = arguments.subString(2, arguments.length());
		}

		if(message == "") {
			creature->sendSystemMessage("Something went wrong with your message. What command did you use?");
			return;
		}

		UnicodeString message1("[\\#00FFFFDM " + creature->getFirstName() + "\\#FFFFFF]: " + message);
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATONLY);
		creature->broadcastMessage(msg, true);
	}

	static void SendDungeonMasterIC(CreatureObject* creature, String command, String arguments) {
		String message;
		if(command == "ic") {
			message = arguments.subString(3, arguments.length());
		} else if(command == "--") {
			message = arguments.subString(3, arguments.length());
		} else if(command == "[") {
			message = arguments.subString(2, arguments.length());
		}

		if(message == "") {
			creature->sendSystemMessage("Something went wrong with your message. What command did you use?");
			return;
		}

		UnicodeString message1(message);
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATANDSCREEN);
		creature->broadcastMessage(msg, true);

		BorChat::PrintDMMessageToDiscord(creature, message1);
	}
	
	static void SetSecretDM(CreatureObject* creature, CreatureObject* target) {
		int secretDMState = creature->getStoredInt("secretdm");
		if (secretDMState == 0) {
			creature->setStoredInt("secretdm", 1);
			creature->sendSystemMessage("Target is now a secret DM.");
		} else {
			creature->setStoredInt("secretdm", 0);
			creature->sendSystemMessage("Target is no longer a secret DM.");
		}
	}

	static void GrantLanguageSkills(CreatureObject* creature, CreatureObject* target) {
		creature->sendSystemMessage(target->getFirstName() + " has been taught all language related skills.");
		SkillManager::instance()->awardSkill("social_language_basic_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_basic_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_rodian_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_rodian_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_trandoshan_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_trandoshan_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_moncalamari_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_moncalamari_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_wookiee_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_wookiee_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_bothan_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_bothan_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_twilek_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_twilek_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_zabrak_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_zabrak_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_lekku_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_lekku_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_ithorian_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_ithorian_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_sullustan_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_sullustan_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_mistryl_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_mistryl_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_huttese_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_huttese_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_esselean_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_esselean_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_miralukese_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_miralukese_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_sephi_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_sephi_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_ewok_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_ewok_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_binary_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_binary_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_astromech_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_astromech_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_jawatrade_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_jawatrade_comprehend", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_mandoa_speak", target, true, true, true, true, 1);
		SkillManager::instance()->awardSkill("social_language_mandoa_comprehend", target, true, true, true, true, 1);


	}

	
	

	/*
	static void ModifyAttribute(CreatureObject* dm, const uint64& target, String attribute, int amount) {
		ManagedReference<SceneObject*> object = dm->getZoneServer()->getObject(target, false);
		if (object == nullptr) {
			dm->sendSystemMessage("Target required for /dm msg commands");
			return;
		}

		if (object->asCreatureObject()->getPlayerObject() == nullptr) {
			dm->sendSystemMessage("Target must be a player.");
			return;
		}
		String previous = object->asCreatureObject()->getLocalData(attribute);
		SovSync::AddSyncVar(object->asCreatureObject(), attribute, amount);

		dm->sendSystemMessage("Changed " + object->asCreatureObject()->getFirstName() + "'s '" + attribute + "' variable from " + previous + " to " +
							  String::valueOf((Integer::valueOf(previous) + amount)));
	} */
};

#endif /*BORDM_H_*/