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
			box->setCallback(new DMGrantProfCommandSuiCallback(server, 1, index));
			//box->setCallback(new DMGrantProfCommandSuiCallback(server, 1, 0));

			box->setPromptTitle("Profession Training");
			box->setPromptText("What profession would you like to grant?");

			if(index == 0) {
				forceProfFlag = true;
				box->addMenuItem("Jedi Guardian"); // 0
				box->addMenuItem("Jedi Sentinel"); // 1
				box->addMenuItem("Jedi Consular"); // 2
				box->addMenuItem("Dark Jedi Warrior"); // 3
				box->addMenuItem("Dark Jedi Sorcerer"); // 4
			}
			else {
				box->addMenuItem("Soldier"); // 1
				box->addMenuItem("Mandalorian"); // 2
				box->addMenuItem("Teras Kasi"); // 3
				box->addMenuItem("Medic"); // 4
				box->addMenuItem("Engineer"); // 5
				box->addMenuItem("Diplomat"); // 6
				box->addMenuItem("Spy"); // 7
				box->addMenuItem("Smuggler"); // 8
				box->addMenuItem("Officer"); // 9
				box->addMenuItem("Pilot"); // 10
				box->addMenuItem("Surgeon"); // 11
				box->addMenuItem("Researcher"); // 12
				box->addMenuItem("Weaponsmith"); // 13
				box->addMenuItem("Armorsmith"); // 14
				box->addMenuItem("Assassin"); // 15
				box->addMenuItem("Saboteur"); // 16
				box->addMenuItem("Con Artist"); // 17
				box->addMenuItem("Enforcer"); // 18
				box->addMenuItem("Bounty Hunter"); // 19
				box->addMenuItem("Scout"); // 20
			}
		
			player->getPlayerObject()->addSuiBox(box);
			player->sendMessage(box->generateMessage());
	}
	else if (state == 1) {
			ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::TEACH_OFFER);
			box->setPromptTitle("Profession Training");
			String profName = "Undefined";
			int trainingLevel = 0;
			
			if(forceProfFlag) {
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
		player->sendSystemMessage("Debug: Reached Train Step using index " + selection);
		storedTarget->sendSystemMessage("Debug: Reached Train Step using index " + selection);
		int profCode = selection;
		int trainingLevel = 0;
		String skillName, profName;
		if(selection > 100) { //If forceProfFlag
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
		
		skillManager->awardSkill(fullSkillName, storedTarget, true, true, true);
	}

		player->sendSystemMessage("Debug: We have reached the end of the UI call");
		storedTarget->sendSystemMessage("Debug: We have reached the end of the UI call");
	}

/*
	String GetSkillNumeral(int value) {
		if(value == 0) return "[None]";
		else if(value == 1) return "I";
		else if(value == 2) return "II";
		else if(value == 3) return "III";
		else if(value == 4) return "IV";
		else if(value == 5) return "V";
		else if(value == 6) return "VI";
		else if(value == 7) return "VII";
		else if(value == 8) return "VIII";
		else if(value == 9) return "IX";
		else if(value == 10) return "X";
		else if(value > 10) return "[MAXED OUT]";
		else return "[Unknown]";
	}

	void OpenTopMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCallback(new TrainCommandSuiCallback(server, 0, 0));
		box->setPromptTitle("Training Menu");
		if(freeSkillPoints > 0 || freeAttrPoints > 0) {
			box->setPromptText("What would you like to do?\n\nFree Attribute Boxes: " + String::valueOf(freeAttrPoints));
			//+ "\nFree Skill Boxes: " + String::valueOf(freeSkillPoints));
		} else box->setPromptText("What would you like to do?");	
		box->setCancelButton(true, "@cancel");
		//box->setOkButton(false, "@");
		box->addMenuItem("Train an Attribute");
		box->addMenuItem("Train a Skill");
		//box->addMenuItem("Convert General Roleplay XP");
		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenAttributeSelectionMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCancelButton(true, "Back");
		box->setCallback(new TrainCommandSuiCallback(server, 1, index));

		box->setPromptTitle("Training Attribute Menu");
		if(freeAttrPoints > 0) {
			box->setPromptText("What attribute would you like to rank up?\n\nFree Attribute Boxes: " + String::valueOf(freeAttrPoints));
		} else box->setPromptText("What attribute would you like to rank up?");					
		box->addMenuItem("Awareness " + 		GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "awareness")+1));
		box->addMenuItem("Charisma " + 			GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "charisma")+1));
		box->addMenuItem("Constitution " + 		GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "constitution")+1));
		box->addMenuItem("Dexterity " + 		GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "dexterity")+1));
		box->addMenuItem("Intelligence " + 		GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "intelligence")+1));
		box->addMenuItem("Mindfulness " + 		GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "mindfulness")+1));
		box->addMenuItem("Precision " + 		GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "precision")+1));
		box->addMenuItem("Strength " + 			GetSkillNumeral(BorSkill::GetRealSkillLevel(player, "strength")+1));
		
		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenSkillSelectionMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCancelButton(true, "Back");
		box->setCallback(new TrainCommandSuiCallback(server, 2, index));

		box->setPromptTitle("Training Skill Menu");
		if(freeSkillPoints > 0) {
			box->setPromptText("What skill would you like to rank up? Remember that skills cost considerably more when they are raised above their associated attribute's rank.");
				 // \n\nFree Skill Boxes: " + String::valueOf(freeSkillPoints));
		} else {
			box->setPromptText("What skill would you like to rank up? Remember that skills cost considerably more when they are raised above their associated attribute's rank.");
		}

		box->addMenuItem("Armorer " +				GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"armorer")+1));
		box->addMenuItem("Athletics " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"athletics")+1));
		box->addMenuItem("Bluff " +				GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"bluff")+1));
		box->addMenuItem("Composure " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"composure")+1));
		box->addMenuItem("Computers " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"computers")+1));
		box->addMenuItem("Defending " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"defending")+1));
		box->addMenuItem("Demolitions " +		GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"demolitions")+1));
		box->addMenuItem("Engineering " +		GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"engineering")+1));
		box->addMenuItem("Intimidation " +		GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"intimidation")+1));
		box->addMenuItem("Investigation " +		GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"investigation")+1));
		box->addMenuItem("Larceny " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"larceny")+1));
		box->addMenuItem("Maneuverability " +	GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"maneuverability")+1));
		box->addMenuItem("Mechanics " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"mechanics")+1));
		box->addMenuItem("Medicine " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"medicine")+1));
		box->addMenuItem("Melee " +				GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"melee")+1));
		box->addMenuItem("Persuasion " +		GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"persuasion")+1));
		box->addMenuItem("Piloting " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"piloting")+1));
		box->addMenuItem("Ranged " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"ranged")+1));
		box->addMenuItem("Resolve " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"resolve")+1));
		box->addMenuItem("Science " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"science")+1));
		box->addMenuItem("Slicing " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"slicing")+1));
		box->addMenuItem("Stealth " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"stealth")+1));
		box->addMenuItem("Survival " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"survival")+1));
		box->addMenuItem("Throwing " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"throwing")+1));
		box->addMenuItem("Unarmed " +			GetSkillNumeral(BorSkill::GetRealSkillLevel(player,"unarmed")+1));

		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenConfirmAttributeSelectionWindow(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		//Get index as skill
		String skillName = GetAttributeStringFromID(index);
		//Check to see what the next level of that skill is
		//See if they quality for that skill
		int currentRank = BorSkill::GetRealSkillLevel(player, skillName);
		// Give them a new SUI box option either confirming, or informing that they can't train that right now. 
		ManagedReference<SuiMessageBox*> suibox = new SuiMessageBox(player, SuiWindowType::TEACH_OFFER);
		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skillName)) {
			suibox->setPromptTitle("Confirm training?"); 
			//Can train!
			suibox->setPromptText("Are you sure you want to train this attribute?");
			suibox->setCallback(new TrainCommandSuiCallback(server, 3, index));
			suibox->setOkButton(true, "Confirm");
			suibox->setCancelButton(true, "Go Back");
		} else {
			suibox->setPromptTitle("Not eligible for training.");
			//Failure. Can't train.
			suibox->setPromptText("You are not currently eligible to train this attribute. You do not have enough experience points or have already raised your total attributes to 48.");
			suibox->setCallback(new TrainCommandSuiCallback(server, -1, state));
			suibox->setCancelButton(true, "Go Back");
		}	
		player->getPlayerObject()->addSuiBox(suibox);
		player->sendMessage(suibox->generateMessage());
	}

	void OpenConfirmSkillSelectionWindow(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		//int freeSkillPoints = player->getStoredInt("starter_skill_points");
				int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		String skillName = GetSkillStringFromID(index);
		String skillParent = BorSkill::GetSkillParent(skillName);
		//String skillAltParent = BorSkill::GetSkillAltParent(skillName);
		int currentRank = BorSkill::GetRealSkillLevel(player, skillName);
		ManagedReference<SuiMessageBox*> suibox = new SuiMessageBox(player, SuiWindowType::TEACH_OFFER);
		
		int parentLevel = BorSkill::GetRealSkillLevel(player, skillParent);
		float costMultiplier = 1;
		if(parentLevel < currentRank + 1) {
			int parentDifference = currentRank + 1 - parentLevel;
			costMultiplier = 2 * parentDifference;
			//player->sendSystemMessage("OpenConfirmSkillSelectionWindow: The difference between the skill rank and parent rank is " + std::to_string(parentDifference) + " and the costMultiplier is " + std::to_string(costMultiplier));
		}

		int modifiedXpCost = static_cast<int>(BorSkill::getSkillCost(player, skillName, currentRank+1) * costMultiplier);
		//player->sendSystemMessage("OpenConfirmSkillSelectionWindow: modified XP cost is " + std::to_string(modifiedXpCost));

		
		String textColor = "\\#.";
		if(costMultiplier > 1.0)
		{
			if(costMultiplier > 4.0){
				textColor = "\\#FF0000";
			}
			else{
				textColor = "\\#FFFF00";
			}
		}
		

		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skillName, skillParent, costMultiplier)) {

			//Can train!
			if(parentLevel < currentRank + 1)
			{
				//player->sendSystemMessage("OpenConfirmSkillSelectionWindow: CanTrainNextSkill returned true.");
				suibox->setPromptTitle("Confirm training?"); 
				suibox->setPromptText("Because this will exceed your " + skillParent + ", training " + skillName + " will cost an increased " + textColor + std::to_string(modifiedXpCost) + "\\#. XP. Are you sure you want to train this skill?");
				suibox->setCallback(new TrainCommandSuiCallback(server, 4, index));
				suibox->setOkButton(true, "Confirm");
				suibox->setCancelButton(true, "Go Back");
			}
			else{
				//player->sendSystemMessage("OpenConfirmSkillSelectionWindow: CanTrainNextSkill returned true.");
				suibox->setPromptTitle("Confirm training?"); 
				suibox->setPromptText("Training " + skillName + " will cost " + std::to_string(modifiedXpCost) + " XP. Are you sure you want to train this skill?");
				suibox->setCallback(new TrainCommandSuiCallback(server, 4, index));
				suibox->setOkButton(true, "Confirm");
				suibox->setCancelButton(true, "Go Back");
			}
			
		} else {
			//player->sendSystemMessage("OpenConfirmSkillSelectionWindow: CanTrainNextSkill returned false.");
			suibox->setPromptTitle("Not eligible for training.");
			//Failure. Can't train.
			suibox->setPromptText("You do not have enough experience points to train this skill.");
			suibox->setCallback(new TrainCommandSuiCallback(server, -1, state));
			suibox->setCancelButton(true, "Go Back");
		}	
		player->getPlayerObject()->addSuiBox(suibox);
		player->sendMessage(suibox->generateMessage());
	}

	void TrainAttribute(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		String skill = GetAttributeStringFromID(selection);
		int currentRank = BorSkill::GetRealSkillLevel(player, skill);
		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skill)) {
			//Train it
			SkillManager* skillManager = SkillManager::instance();
			int freePoints = player->getStoredInt("starter_attr_points");
			if(freePoints > 0) {
				player->setStoredInt("starter_attr_points", freePoints - 1);
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, true, 1);
				player->sendSystemMessage("You've gained a point in " + skill + ". You have " + String::valueOf(freePoints - 1) + " remaining free attribute points.");
			} else {
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, false, 1);
				player->sendSystemMessage("You've gained a point in " + skill + ".");
			}
		} else {
			//Something happened
			player->sendSystemMessage("ERROR: Something happened. You were eligible for the attribute you selected when you selected it, but you are no longer eligible.");
		}
	}

	void TrainSkill(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		String skill = GetSkillStringFromID(selection);
		String skillParent = BorSkill::GetSkillParent(skill);
		//String skillAltParent = BorSkill::GetSkillAltParent(skill);
		int currentRank = BorSkill::GetRealSkillLevel(player, skill);
		int parentLevel = BorSkill::GetRealSkillLevel(player, skillParent);

		float costMultiplier = 1;
		if(parentLevel < currentRank + 1) {
			int parentDifference = currentRank + 1 - parentLevel;
			//costMultiplier = 1.75 * parentDifference;
			costMultiplier = 2 * parentDifference;
		}

		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skill, skillParent, costMultiplier)) {
			//Train it
			SkillManager* skillManager = SkillManager::instance();
						
			int freePoints = player->getStoredInt("starter_skill_points");
			if(freePoints > 0) {
				player->setStoredInt("starter_skill_points", freePoints - 1);
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, true, false, costMultiplier);
				player->sendSystemMessage("You've gained a point in " + skill + "! You have " + String::valueOf(freePoints - 1) + " remaining free skill points.");
			} else {
				bool awardResult = skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, false, false, costMultiplier);
				if(awardResult) {
				} else {
				}
				player->sendSystemMessage("You've gained a point in " + skill + "!");
			}
		} else {
			//Something happened
			player->sendSystemMessage("ERROR: Something happened. You were eligible for the skill you selected when you selected it, but you are no longer eligible.");
		}
	}

};
*/

#endif /* DMGrantProfCOMMANDSUICALLBACK_H_ */