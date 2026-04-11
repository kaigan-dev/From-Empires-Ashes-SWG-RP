/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RPRELOADCOMMAND_H_
#define RPRELOADCOMMAND_H_

#include "server/zone/borrie/BorCharacter.h"

class RpreloadCommand : public QueueCommand {
public:
	RpreloadCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		
	
		return SUCCESS;
	}
};

#endif // RPRELOADCOMMAND_H_