#ifndef BORSKILL_H_
#define BORSKILL_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "engine/util/u3d/Coordinate.h"

//#include "templates/roleplay/RoleplayManager.h"

#include "server/db/ServerDatabase.h"

class BorSkill : public Logger {
public:
	static bool GetStringIsAttribute(String input) {
		if (input == "strength")
			return true;
		else if (input == "precision")
			return true;
		else if (input == "dexterity")
			return true;
		else if (input == "awareness")
			return true;
		else if (input == "intelligence")
			return true;
		else if (input == "charisma")
			return true;
		else if (input == "constitution")
			return true;
		else if (input == "mindfulness")
			return true;
		else
			return false;
	}

	static String GetSkillParent(String skill) {
		if (skill == "melee")
			return "dexterity";
		else if (skill == "intimidation")
			return "constitution";
		else if (skill == "unarmed")
			return "dexterity";
		else if (skill == "lightsaber")
			return "strength";
		else if (skill == "ranged")
			return "precision";
		else if (skill == "mechanics")
			return "precision";
		else if (skill == "demolitions")
			return "precision";
		else if (skill == "engineering")
			return "intelligence";
		else if (skill == "larceny")
			return "dexterity";
		else if (skill == "stealth")
			return "awareness";
		else if (skill == "maneuverability")
			return "dexterity";
		else if (skill == "throwing")
			return "precision";
		else if (skill == "investigation")
			return "awareness";
		else if (skill == "piloting")
			return "awareness";
		else if (skill == "survival")
			return "awareness";
		else if (skill == "sense")
			return "mindfulness";
		else if (skill == "slicing")
			return "intelligence";
		else if (skill == "computers")
			return "intelligence";
		else if (skill == "medicine")
			return "intelligence";
		else if (skill == "science")
			return "intelligence";
		else if (skill == "persuasion")
			return "charisma";
		else if (skill == "bluff")
			return "charisma";
		else if (skill == "composure")
			return "mindfulness";
		else if (skill == "resolve")
			return "mindfulness";
		else if (skill == "athletics")
			return "constitution";
		else if (skill == "lightning")
			return "constitution";
		else if (skill == "armor")
			return "constitution";
		else if (skill == "defending")
			return "strength";
		else if (skill == "telekinesis")
			return "mindfulness";
		else if (skill == "control")
			return "mindfulness";
		else if (skill == "alter")
			return "mindfulness";
		else if (skill == "inward")
			return "mindfulness";
		else
			return "";
	}

	static String GetSkillAltParent(String skill) {
		if (skill == "melee")
			return "strength";
		else if (skill == "intimidation")
			return "constitution";
		else if (skill == "unarmed")
			return "strength";
		else if (skill == "lightsaber")
			return "dexterity";
		else if (skill == "ranged")
			return "dexterity";
		else if (skill == "mechanics")
			return "intelligence";
		else if (skill == "demolitions")
			return "awareness";
		else if (skill == "engineering")
			return "precision";
		else if (skill == "larceny")
			return "charisma";
		else if (skill == "stealth")
			return "dexterity";
		else if (skill == "maneuverability")
			return "awareness";
		else if (skill == "throwing")
			return "strength";
		else if (skill == "investigation")
			return "intelligence";
		else if (skill == "piloting")
			return "intelligence";
		else if (skill == "survival")
			return "constitution";
		else if (skill == "sense")
			return "awareness";
		else if (skill == "slicing")
			return "precision";
		else if (skill == "computers")
			return "precision";
		else if (skill == "medicine")
			return "precision";
		else if (skill == "science")
			return "mindfulness";
		else if (skill == "persuasion")
			return "awareness";
		else if (skill == "bluff")
			return "intelligence";
		else if (skill == "composure")
			return "awareness";
		else if (skill == "resolve")
			return "constitution";
		else if (skill == "athletics")
			return "dexterity";
		else if (skill == "lightning")
			return "intelligence";
		else if (skill == "armor")
			return "strength";
		else if (skill == "defending")
			return "constitution";
		else if (skill == "telekinesis")
			return "precision";
		else if (skill == "control")
			return "charisma";
		else if (skill == "alter")
			return "strength";
		else if (skill == "inward")
			return "intelligence";
		else
			return "";
	}

	static bool GetStringIsSkill(String skill) {
		if (skill == "melee")
			return true;
		else if (skill == "intimidation")
			return true;
		else if (skill == "unarmed")
			return true;
		else if (skill == "lightsaber")
			return true;
		else if (skill == "ranged")
			return true;
		else if (skill == "mechanics")
			return true;
		else if (skill == "demolitions")
			return true;
		else if (skill == "engineering")
			return true;
		else if (skill == "larceny")
			return true;
		else if (skill == "stealth")
			return true;
		else if (skill == "maneuverability")
			return true;
		else if (skill == "throwing")
			return true;
		else if (skill == "investigation")
			return true;
		else if (skill == "piloting")
			return true;
		else if (skill == "survival")
			return true;
		else if (skill == "sense")
			return true;
		else if (skill == "slicing")
			return true;
		else if (skill == "computers")
			return true;
		else if (skill == "medicine")
			return true;
		else if (skill == "science")
			return true;
		else if (skill == "persuasion")
			return true;
		else if (skill == "bluff")
			return true;
		else if (skill == "composure")
			return true;
		else if (skill == "resolve")
			return true;
		else if (skill == "athletics")
			return true;
		else if (skill == "lightning")
			return true;
		else if (skill == "armor")
			return true;
		else if (skill == "defending")
			return true;
		else if (skill == "telekinesis")
			return true;
		else if (skill == "control")
			return true;
		else if (skill == "alter")
			return true;
		else if (skill == "inward")
			return true;
		else
			return false;
	}

	static bool GetStringIsForceSkill(String skill) {
		if (skill == "telekinesis")
			return true;
		else if (skill == "control")
			return true;
		else if (skill == "alter")
			return true;
		else if (skill == "inward")
			return true;
		else if (skill == "lightning")
			return true;
		else if (skill == "lightsaber")
			return true;
		else if (skill == "sense")
			return true;
		else 
			return false;
	}

	static bool GetSkillIsForceSkill(String skill) {
		if(skill.contains("telekinesis"))
			return true;
		else if(skill.contains("control"))
			return true;
		else if(skill.contains("alter"))
			return true;
		else if(skill.contains("inward"))
			return true;
		else if(skill.contains("lightning"))
			return true;
		else if(skill.contains("lightsaber"))
			return true;
		else if(skill.contains("sense"))
			return true;
		else return false;
	}

	static String GetSkillRealName(String input) {
		StringTokenizer args(input);
		String output;
		args.setDelimeter("_");
		if (!args.hasMoreTokens())
			return "invalid";
		else {
			args.getStringToken(output);
			if(args.hasMoreTokens()) {
				args.getStringToken(output);
				return output;
			}
			else return "invalid";
		}
	}

	static String GetSkillSuffixFromValue(int value) {
		if (value == 1)
			return "novice";
		else if (value == 2)
			return "a01";
		else if (value == 3)
			return "a02";
		else if (value == 4)
			return "a03";
		else if (value == 5)
			return "a04";
		else if (value == 6)
			return "b01";
		else if (value == 7)
			return "b02";
		else if (value == 8)
			return "b03";
		else if (value == 9)
			return "b04";
		else if (value == 10)
			return "master";
		else
			return "novice";
	}

	static int GetSkillLevelFromString(String input) {
		StringTokenizer args(input);
		String value;
		args.setDelimeter("_");
		if (!args.hasMoreTokens())
			return -1;
		else {
			args.getStringToken(value);
			if (args.hasMoreTokens()) { //skill name
				args.getStringToken(value);
				if (args.hasMoreTokens()) { //Skill Value
					args.getStringToken(value);
					if (value == "novice")
						return 1;
					else if (value == "a01")
						return 2;
					else if (value == "a02")
						return 3;
					else if (value == "a03")
						return 4;
					else if (value == "a04")
						return 5;
					else if (value == "b01")
						return 6;
					else if (value == "b02")
						return 7;
					else if (value == "b03")
						return 8;
					else if (value == "b04")
						return 9;
					else if (value == "master")
						return 10;
					else
						return 0;
				} else {
					return -1;
				}
			} else
				return -1;
		}
	}

	static int GetRealSkillLevel(CreatureObject* player, String input) {
		if(player->hasSkill("rp_" + input + "_master")) {
			return 10;
		} else if(player->hasSkill("rp_" + input + "_b04")) {
			return 9;
		} else if(player->hasSkill("rp_" + input + "_b03")) {
			return 8;
		} else if(player->hasSkill("rp_" + input + "_b02")) {
			return 7;
		} else if(player->hasSkill("rp_" + input + "_b01")) {
			return 6;
		} else if(player->hasSkill("rp_" + input + "_a04")) {
			return 5;
		} else if(player->hasSkill("rp_" + input + "_a03")) {
			return 4;
		} else if(player->hasSkill("rp_" + input + "_a02")) {
			return 3;
		} else if(player->hasSkill("rp_" + input + "_a01")) {
			return 2;
		} else if(player->hasSkill("rp_" + input + "_novice")) {
			return 1;
		} else {
			return 0;
		}
	}

	static bool CanTrainNextSkill(CreatureObject* creature, int rank, String skill, String parentAttribute = "", String altParentAttribute = "") {
		if(rank > 10) return false;
		if(skill == "") return false;
		String skillName = "rp_" + skill + "_" + GetSkillSuffixFromValue(rank);
		SkillManager* skillManager = SkillManager::instance();
		bool hasXP = skillManager->canLearnSkill(skillName, creature, false);
		int points = creature->getStoredInt("starter_attr_points");
		if (parentAttribute != "" && altParentAttribute != "") {
			points = creature->getStoredInt("starter_skill_points");
			//creature->sendSystemMessage("Trying to train skill");
			int parentValue = GetRealSkillLevel(creature, parentAttribute);
			int altParentValue = GetRealSkillLevel(creature, altParentAttribute);
			String skillRealName = GetSkillRealName(skill);
			if(parentValue < rank && altParentValue < rank) {
				return false;
			} 				
		} else {
			//creature->sendSystemMessage("Trying to train attribute");
		}

		if(points > 0) return true;
		
		return hasXP;
	}

	static bool GetQualifiedForSkill(CreatureObject* creature, String skill) {
		String skillName = GetSkillRealName(skill);
		if (GetStringIsSkill(skillName)) {
			if(GetStringIsForceSkill(skillName)) {
				//See if they have Force Aware at the very least.
				if(!creature->hasSkill("rp_force_prog_rank_01")) //Force Aware
					return false;
			}
			int desiredLevel = GetSkillLevelFromString(skill);
			if (desiredLevel == -1)
				return false;
			String parent = GetSkillParent(skillName);
			String altParent = GetSkillAltParent(skillName);
			int parentLevel = GetRealSkillLevel(creature, parent);
			int altParentLevel = GetRealSkillLevel(creature, altParent);
			if(parentLevel < desiredLevel && altParentLevel < desiredLevel) {
				return false;
			} else {
				return true;
			}
			
		} else {
			return true;
		}
	}
};

#endif /*BORSKILL_H_*/