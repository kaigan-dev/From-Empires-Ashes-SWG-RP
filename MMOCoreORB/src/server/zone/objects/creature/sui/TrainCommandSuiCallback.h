#ifndef TRAINCOMMANDSUICALLBACK_H_
#define TRAINCOMMANDSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"

class TrainCommandSuiCallback : public SuiCallback {
private:
	int state;
	int selection;

public:
	TrainCommandSuiCallback(ZoneServer* server, int _state, int _selection) : SuiCallback(server) {
		state = _state;
		selection = _selection;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		PlayerManager* playerManager = player->getZoneServer()->getPlayerManager();
 
		if (playerManager == nullptr)
			return;

		if (args->size() < 1)
			return;

		int index = Integer::valueOf(args->get(0).toString());

		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");

		if (state == -1) {//Top Menu
			OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 0) { //Primary Menu		
			if (cancelPressed) {
				return;
			} else if(index == 0) {
				OpenAttributeSelectionMenu(player, suiBox, eventIndex, args, state, selection);
			} else if(index == 1) {
				OpenSkillSelectionMenu(player, suiBox, eventIndex, args, state, selection);
			} else if(index == 2) {

			}
		} else if (state == 1) { //Select Attribute
			if (cancelPressed) {
				OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}				

			OpenConfirmAttributeSelectionWindow(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 2) { //Select Skill
			if (cancelPressed) {
				OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}				
			
			OpenConfirmSkillSelectionWindow(player, suiBox, eventIndex, args, state, selection);			
		} else if (state == 3) { //Train a Attribute
			if (cancelPressed) {
				OpenAttributeSelectionMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}				
			
			TrainAttribute(player, suiBox, eventIndex, args, state, selection);

			OpenAttributeSelectionMenu(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 4) { //Train a Skill
			if (cancelPressed) {
				OpenSkillSelectionMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}			
			
			TrainSkill(player, suiBox, eventIndex, args, state, selection);

			OpenSkillSelectionMenu(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 5) { //Convert Exp: Show possiblities
			if (cancelPressed) {
				OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}
		} else if(state == 6) { //Convert Exp: Select Attribute
			if (cancelPressed) {
				OpenConversionTypeDialogue(player, suiBox, eventIndex, args, state, selection);
				return;
			}

			OpenConversionAttributeList(player, suiBox, eventIndex, args, state, selection);

		} else if(state == 7) { //Convert Exp: Select SKill
			if (cancelPressed) {
				OpenConversionTypeDialogue(player, suiBox, eventIndex, args, state, selection);
				return;
			}

			OpenConversionSkillList(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 8) { //Convert Exp: Select the amount: ATTRIBUTE
			if (cancelPressed) {
				OpenConversionAttributeList(player, suiBox, eventIndex, args, state, selection);
				return;
			}


		} else if (state == 9) { //Convert Exp: Select the amount: SKILL
			if (cancelPressed) {
				OpenConversionSkillList(player, suiBox, eventIndex, args, state, selection);
				return;
			}

		}
	}

	String GetAttributeStringFromID(int id) {
		if (id == 0)
			return "awareness";
		else if (id == 1)
			return "charisma";
		else if (id == 2)
			return "constitution";
		else if (id == 3)
			return "dexterity";
		else if (id == 4)
			return "intelligence";
		else if (id == 5)
			return "mindfulness";
		else if (id == 6)
			return "precision";
		else if (id == 7)
			return "strength";
		else
			return "";
	}

	String GetSkillStringFromID(int id) {
		if (id == 0)
			return "armorer";
		else if (id == 1)
			return "athletics";
		else if (id == 2)
			return "bluff";
		else if (id == 3)
			return "composure";
		else if (id == 4)
			return "computers";
		else if (id == 5)
			return "defending";
		else if (id == 6)
			return "demolitions";
		else if (id == 7)
			return "engineering";
		else if (id == 8)
			return "intimidation";
		else if (id == 9)
			return "investigation";
		else if (id == 10)
			return "larceny";
		else if (id == 11)
			return "maneuverability";
		else if (id == 12)
			return "mechanics";
		else if (id == 13)
			return "medicine";
		else if (id == 14)
			return "melee";
		else if (id == 15)
			return "persuasion";
		else if (id == 16)
			return "piloting";
		else if (id == 17)
			return "ranged";
		else if (id == 18)
			return "resolve";
		else if (id == 19)
			return "science";
		else if (id == 20)
			return "slicing";
		else if (id == 21)
			return "stealth";
		else if (id == 22)
			return "survival";
		else if (id == 23)
			return "throwing";
		else if (id == 24)
			return "unarmed";
		else if (id == 25)
			return "sense";
		else if (id == 26)
			return "lightning";
		else if (id == 27)
			return "telekinesis";
		else if (id == 28)
			return "control";
		else if (id == 29)
			return "alter";
		else if (id == 30)
			return "inward";
		else
			return "";
	}

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

	void OpenExpConversionTopMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {

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
			suibox->setPromptText("You are not currently eligible to train this attribute. You do not have enough experience points.");
			suibox->setCallback(new TrainCommandSuiCallback(server, -1, state));
			suibox->setCancelButton(true, "Go Back");
		}	
		player->getPlayerObject()->addSuiBox(suibox);
		player->sendMessage(suibox->generateMessage());
	}

	void OpenConfirmSkillSelectionWindow(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
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
			player->sendSystemMessage("OpenConfirmSkillSelectionWindow: The difference between the skill rank and parent rank is " + std:to_string(parentDifference) + " and the costMultiplier is " + std:to_string(costMultiplier));
		}

		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skillName, skillParent, costMultiplier)) {
			suibox->setPromptTitle("Confirm training?"); 
			//Can train!
			suibox->setPromptText("Are you sure you want to train this skill?");
			suibox->setCallback(new TrainCommandSuiCallback(server, 4, index));
			suibox->setOkButton(true, "Confirm");
			suibox->setCancelButton(true, "Go Back");
		} else {
			suibox->setPromptTitle("Not eligible for training.");
			//Failure. Can't train.
			suibox->setPromptText("You are not currently eligible to train this skill. You do not have enough experience points.");
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

	void OpenConversionTypeDialogue(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCallback(new TrainCommandSuiCallback(server, 0, 0));
		box->setPromptTitle("Training Menu");
		
		box->setPromptText("What type of experience would you like to convert?");	
		box->setCancelButton(true, "@cancel");
		//box->setOkButton(false, "@");
		box->addMenuItem("Convert to Attribute Experience");
		box->addMenuItem("Convert to Skill Experience");
		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenConversionAttributeList(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int index = Integer::valueOf(args->get(0).toString());
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCancelButton(true, "Back");
		box->setCallback(new TrainCommandSuiCallback(server, 10, index));

		box->setPromptTitle("Converting to Attribute Experience");
		box->setPromptText("What attribute would you like to convert experience for? Attribute Rate: 100:1");				
		box->addMenuItem("Awareness");
		box->addMenuItem("Charisma");
		box->addMenuItem("Constitution");
		box->addMenuItem("Dexterity");
		box->addMenuItem("Intelligence");
		box->addMenuItem("Mindfulness");
		box->addMenuItem("Precision");
		box->addMenuItem("Strength");
		
		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenConversionSkillList(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {

	}

	void OpenConversionTransferBox(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int delegateRatioFrom = 1;
		int delegateRatioTo = 1;

		if(state == 6) { //Attribute Conversion
			delegateRatioFrom = 100;
		} else if(state == 7) { //Skill Conversion
			delegateRatioFrom = 10;
		}

		ManagedReference<SuiTransferBox*> sui = new SuiTransferBox(player, SuiWindowType::DELEGATE_TRANSFER);
		//sui->setCallback(new TrainCommandSuiCallback(server, -1, index));
		sui->setPromptTitle("@player_structure:select_amount"); //Select Amount
		sui->setPromptText("Current general roleplayer experience:" + String::valueOf(0));
		sui->addFrom("Total amount", String::valueOf(1), String::valueOf(1), String::valueOf(delegateRatioFrom));
		sui->addTo("Converted amount", "0", "0", String::valueOf(delegateRatioTo));

		player->getPlayerObject()->addSuiBox(sui);
		player->sendMessage(sui->generateMessage());
	}
	

};

#endif /* TRAINCOMMANDSUICALLBACK_H_ */