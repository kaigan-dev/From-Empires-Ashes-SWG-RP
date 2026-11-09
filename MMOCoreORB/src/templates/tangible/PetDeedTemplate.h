/*
 * PetDeedTemplate.h
 *
 *  Created on: August 17, 2013
 *      Author: washu
 */

#ifndef PETDEEDTEMPLATE_H_
#define PETDEEDTEMPLATE_H_

#include "templates/tangible/DeedTemplate.h"

class PetDeedTemplate : public DeedTemplate {
private:
	String controlDeviceObjectTemplate;
	String mobileTemplate;
	String skillTemplate;
	String equipmentTemplate;
	String petRarity;
	int mountable = 0;
	int healCost = 20;
	int babyFlag = 0;
	int powerAttackFlag = 0;
	int flurryAttackFlag = 0;
	int attackType3Flag = 0;
	int attackType4Flag = 0;
	int attackType5Flag = 0;

public:
	PetDeedTemplate() {

	}

	~PetDeedTemplate() {

	}

	void readObject(LuaObject* templateData) {
		DeedTemplate::readObject(templateData);
		controlDeviceObjectTemplate = templateData->getStringField("controlDeviceObjectTemplate");
		mobileTemplate = templateData->getStringField("mobileTemplate");
		skillTemplate = templateData->getStringField("skillTemplate");
		equipmentTemplate = templateData->getStringField("equipmentTemplate");
		mountable = templateData->getIntField("isMountable");
		babyFlag = templateData->getIntField("babyFlag");
		healCost = templateData->getIntField("healCost");
		petRarity = templateData->getStringField("rarity");
		powerAttackFlag = templateData->getIntField("canPowerAttack");
		flurryAttackFlag = templateData->getIntField("canFlurryAttack");
		attackType3Flag = templateData->getIntField("attackType3Flag");
		attackType4Flag = templateData->getIntField("attackType4Flag");
		attackType5Flag = templateData->getIntField("attackType5Flag");
    }

	String getControlDeviceObjectTemplate() {
		return controlDeviceObjectTemplate;
	}

	String getMobileTemplate() {
		return mobileTemplate;
	}

	String getSkillTemplate() const {
		return skillTemplate;
	}

	String getEquipmentTemplate() const {
		return equipmentTemplate;
	}

	int isMountable() const {
		return mountable;
	}

	int isBaby() const {
		return babyFlag;
	}

	int checkHealCost() const {
		return healCost;
	}

	String checkRarity() const {
		return petRarity;
	}


	int canPowerAttack () const {
		return powerAttackFlag ;
	}

	int canFlurryAttack() const {
		return flurryAttackFlag ;
	}

	int canAttack3() const {
		return attackType3Flag ;
	}

	int canAttack4() const {
		return attackType4Flag ;
	}

	int canAttack5() const {
		return attackType5Flag ;
	}


};


#endif /* PETDEEDTEMPLATE_H_ */


