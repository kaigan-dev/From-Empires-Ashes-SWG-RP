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
	int mountable = 0;

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
		mountable = templateData->getIntField("isMountable");
    }

	String getControlDeviceObjectTemplate() {
		return controlDeviceObjectTemplate;
	}

	String getMobileTemplate() {
		return mobileTemplate;
	}

	String getskillTemplate() const {
		return skillTemplate;
	}

	int isMountable() const {
		return mountable;
	}

};


#endif /* PETDEEDTEMPLATE_H_ */
