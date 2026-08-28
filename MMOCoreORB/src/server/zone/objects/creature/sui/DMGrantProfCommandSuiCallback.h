#ifndef DMGRANTPROFCOMMANDSUICALLBACK_H_
#define DMGRANTPROFCOMMANDSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"


class DMGrantProfCommandSuiCallback : public SuiCallback {
private:
	int state;
	int selection;

public:
	DMGrantProfCommandSuiCallback(ZoneServer* server, int _state, int _selection) : SuiCallback(server) {
		state = _state;
		selection = _selection;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);
		if (cancelPressed)
			return;

		PlayerManager* playerManager = player->getZoneServer()->getPlayerManager();
 
		if (playerManager == nullptr)
			return;

		
		if (args->size() < 1)
			return;

		int index = Integer::valueOf(args->get(0).toString());
		
		bool forceProfFlag = false;

		ManagedReference<CreatureObject*> storedTarget = BorrieRPG::GetStoredCreature(player);

		SkillManager* skillManager = storedTarget->getZoneServer()->getSkillManager();


		if(state == 0 || state == -1) {
			ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
			
			box->setCancelButton(true, "Cancel");
			box->setPromptTitle("Profession Training");
			box->setPromptText("What profession would you like to grant?");

			if(index == 0) {
				forceProfFlag = true;
				selection=0;
				box->addMenuItem("Jedi Guardian"); // 0
				box->addMenuItem("Jedi Sentinel"); // 1
				box->addMenuItem("Jedi Consular"); // 2
				box->addMenuItem("Dark Jedi Warrior"); // 3
				box->addMenuItem("Dark Jedi Sorcerer"); // 4
			}
			else {
				selection=1;
				box->addMenuItem("Soldier"); // 0
				box->addMenuItem("Mandalorian"); // 1
				box->addMenuItem("Teras Kasi"); // 2
				box->addMenuItem("Medic"); // 3
				box->addMenuItem("Engineer"); // 4
				box->addMenuItem("Diplomat"); // 5
				box->addMenuItem("Spy"); // 6
				box->addMenuItem("Smuggler"); // 7
				box->addMenuItem("Officer"); // 8
				box->addMenuItem("Pilot"); // 9
				box->addMenuItem("Surgeon"); // 10
				box->addMenuItem("Researcher"); // 11
				box->addMenuItem("Weaponsmith"); // 12
				box->addMenuItem("Armorsmith"); // 13
				box->addMenuItem("Assassin"); // 14
				box->addMenuItem("Saboteur"); // 15
				box->addMenuItem("Con Artist"); // 16
				box->addMenuItem("Enforcer"); // 17
				box->addMenuItem("Bounty Hunter"); // 18
				box->addMenuItem("Scout"); // 19
			}
		
			box->setCallback(new DMGrantProfCommandSuiCallback(server, 1, selection));
			player->getPlayerObject()->addSuiBox(box);
			player->sendMessage(box->generateMessage());
	}
	else if (state == 1) {
			ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::TEACH_OFFER);
			box->setPromptTitle("Profession Training");
			String profName = "Undefined";
			int trainingLevel = 0;
			
			if(selection == 0) {
				forceProfFlag = true;
				if(index == 0) {
					profName = "Jedi Guardian";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_jedi");
				}
				else if (index == 1) {
					profName = "Jedi Sentinel";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_jedi_sentinel");
				}
				else if (index == 2) {
					profName = "Jedi Consular";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_jedi_consular");
				}
				else if (index == 3) {
					profName = "Dark Jedi Warrior";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_sith");
				}
				else if (index == 4) {
					profName = "Dark Jedi Sorcerer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_drk_sorceror");
				}
			}
			else {
				if(index == 0) {
					profName = "Soldier";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_military");
				}
				else if (index == 1) {
					profName = "Mandalorian";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_mando");
				}
				else if (index == 2) {
					profName = "Teras Kasi";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_tka");
				}
				else if (index == 3) {
					profName = "Medic";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_medical");
				}
				else if (index == 4) {
					profName = "Engineer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_engineer");
				}
				else if (index == 5) {
					profName = "Diplomat";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_diplomatic");
				}
				else if (index == 6) {
					profName = "Spy";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_spy");
				}
				else if (index == 7) {
					profName = "Smuggler";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_smuggler");
				}
				else if (index == 8) {
					profName = "Officer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_officer");
				}
				else if (index == 9) {
					profName = "Pilot";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_pilot");
				}
				else if (index == 10) {
					profName = "Surgeon";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_surgeon");
				}
				else if (index == 11) {
					profName = "Researcher";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_researcher");
				}
				else if (index == 12) {
					profName = "Weaponsmith";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_weaponsmith");
				}
				else if (index == 13) {
					profName = "Armorsmith";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_armorsmith");
				}
				else if (index == 14) {
					profName = "Assassin";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_assassin");
				}
				else if (index == 15) {
					profName = "Saboteur";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_saboteur");
				}
				else if (index == 16) {
					profName = "Con Artist";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_conart");
				}
				else if (index == 17) {
					profName = "Enforcer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_enforcer");
				}
				else if (index == 18) {
					profName = "Bounty Hunter";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_bh");
				}
				else if (index == 19) {
					profName = "Scout";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_scout");
				}
			}

			trainingLevel += 1;  //The target level will always be current level +1
			box->setPromptText("Train target in " + profName + " Profession rank " + trainingLevel + "?");
			int modifiedIndex = index;
			if(forceProfFlag)
				modifiedIndex += 100;
			box->setCallback(new DMGrantProfCommandSuiCallback(server, 2, modifiedIndex));
			box->setPromptTitle("Confirm training?"); 
			box->setOkButton(true, "Confirm");
			box->setCancelButton(true, "Cancel");

			player->getPlayerObject()->addSuiBox(box);
			player->sendMessage(box->generateMessage());
	}
	else if (state == 2) {
		int profCode = selection;
		int trainingLevel = 0;
		String skillName, profName;

		//player->sendSystemMessage("Debug: In final step we have Index: " + String::valueOf(index) + ".");
		//player->sendSystemMessage("Debug: In final step we have Selection: " + String::valueOf(selection) + ".");

		if(profCode > 100) { //If forceProfFlag
			profCode -= 100;
			if(profCode == 0) {
					profName = "Jedi Guardian";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_jedi");
					skillName = "rp_training_jedi";
				}
				else if (profCode == 1) {
					profName = "Jedi Sentinel";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_jedi_sentinel");
					skillName = "rp_training_jedi_sentinel";
				}
				else if (profCode == 2) {
					profName = "Jedi Consular";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_jedi_consular");
					skillName = "rp_training_jedi_consular";
				}
				else if (profCode == 3) {
					profName = "Dark Jedi Warrior";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_sith");
					skillName = "rp_training_sith";
				}
				else if (profCode == 4) {
					profName = "Dark Jedi Sorcerer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_drk_sorceror");
					skillName = "rp_training_drk_sorceror";
				}
		}
		else {  //If not forceProfFlag
			if(profCode == 0) {
					profName = "Soldier";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_military");
					skillName = "rp_training_military";
				}
				else if (profCode == 1) {
					profName = "Mandalorian";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_mando");
					skillName = "rp_training_mando";
				}
				else if (profCode == 2) {
					profName = "Teras Kasi";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_tka");
					skillName = "rp_training_tka";
				}
				else if (profCode == 3) {
					profName = "Medic";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_medical");
					skillName = "rp_training_medical";
				}
				else if (profCode == 4) {
					profName = "Engineer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_engineer");
					skillName = "rp_training_engineer";
				}
				else if (profCode == 5) {
					profName = "Diplomat";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_diplomatic");
					skillName = "rp_training_diplomatic";
				}
				else if (profCode == 6) {
					profName = "Spy";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_spy");
					skillName = "rp_training_spy";
				}
				else if (profCode == 7) {
					profName = "Smuggler";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_smuggler");
					skillName = "rp_training_smuggler";
				}
				else if (profCode == 8) {
					profName = "Officer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_officer");
					skillName = "rp_training_officer";
				}
				else if (profCode == 9) {
					profName = "Pilot";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_pilot");
					skillName = "rp_training_pilot";
				}
				else if (profCode == 10) {
					profName = "Surgeon";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_surgeon");
					skillName = "rp_training_surgeon";
				}
				else if (profCode == 11) {
					profName = "Researcher";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_researcher");
					skillName = "rp_training_researcher";
				}
				else if (profCode == 12) {
					profName = "Weaponsmith";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_weaponsmith");
					skillName = "rp_training_weaponsmith";
				}
				else if (profCode == 13) {
					profName = "Armorsmith";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_armorsmith");
					skillName = "rp_training_armorsmith";
				}
				else if (profCode == 14) {
					profName = "Assassin";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_assassin");
					skillName = "rp_training_assassin";
				}
				else if (profCode == 15) {
					profName = "Saboteur";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_saboteur");
					skillName = "rp_training_saboteur";
				}
				else if (profCode == 16) {
					profName = "Con Artist";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_conart");
					skillName = "rp_training_conart";
				}
				else if (profCode == 17) {
					profName = "Enforcer";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_enforcer");
					skillName = "rp_training_enforcer";
				}
				else if (profCode == 18) {
					profName = "Bounty Hunter";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_bh");
					skillName = "rp_training_bh";
				}
				else if (profCode == 19) {
					profName = "Scout";
					trainingLevel = skillManager->getTrainingSkillRank(storedTarget, "rp_training_scout");
					skillName = "rp_training_scout";
				}
		}
		
		String fullSkillName;
		if(trainingLevel == 0) {
			fullSkillName = skillName + "_novice";
		}
		else if (trainingLevel == 9) {
			fullSkillName = skillName + "_master";
		}
		else {
			fullSkillName = skillName + "_rank_0" + trainingLevel;
		}

		player->sendSystemMessage("Granting " + fullSkillName);
		skillManager->awardSkill(fullSkillName, storedTarget, true, true, true);
	}
	}
};


#endif /* DMGrantProfCOMMANDSUICALLBACK_H_ */