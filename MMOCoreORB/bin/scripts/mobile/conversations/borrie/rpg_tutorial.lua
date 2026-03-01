rpg_tutorial= ConvoTemplate:new {
  initialScreen = "greeting",
  templateType = "Lua",
  luaClassHandler = "rpg_tutorial_convo_handler",
  screens = {}
}




--[[ That's what I'd like to say
greeting = ConvoScreen:new {
		id="greeting",
		customDialogText = "Welcome to FEA. There are a few steps you'll want to take in order to create a character.",
		stopConversation="false",
		options = {
			{"What should I do first?", "firstthing"},
			{"And after that?", "secondthing"},
			{"What else needs to be done to finish up?", "thirdthing"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(greeting);

	firstthing = ConvoScreen:new {
		id="firstthing",
		CustomDialogText = "The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.",
		stopConversation="false",
		options = {
			{"And after that?", "secondthing"},
			{"I don't need to hear any more.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(firstthing);


	secondthing = ConvoScreen:new {
		id="secondthing",
		CustomDialogText = "Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.",
		stopConversation="false",
		options = {
			{"I'm feeling a bit underprepared still.", "thirdthing"},
			{"I don't need to hear any more.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(secondthing);



	thirdthing = ConvoScreen:new {
		id="thirdthing",
		CustomDialogText = "When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.",
		stopConversation="false",
		options = {
			{"What else needs to be done in order to be prepared?", "fourththing"},
			{"I don't need to hear any more.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(thirdthing);


	fourththing = ConvoScreen:new {
		id="fourththing",
		CustomDialogText = "Finally, take a moment to rest and recover before stepping out into the world. Use the /rest command to do fill your health, action, and will pools.",
		stopConversation="false",
		options = {
			{"Can you explain some of that again?", "greeting"},
			{"Thanks! I'll get started right away.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(fourththing);


	abort = ConvoScreen:new {
		id = "abort",
		customDialogText = "Farewell, traveller",
		stopConversation = "true",
		options = {}
	}
	rpg_tutorial_convo_handler:addScreen(abort);
--]]


greeting = ConvoScreen:new {
  id = "greeting",
  customDialogText = "Welcome to FEA! There are a few steps you'll want to take in order to create a character.",
  stopConversation = "false",
  options = {
      {"What should I do first?", "firstthing"},
			{"And after that?", "secondthing"},
			{"What else needs to be done to finish up?", "thirdthing"},
      {"What else needs to be done in order to be prepared?", "fourththing"},
      {"I don't need to hear any more.", "abort"},
  }
}
rpg_tutorial:addScreen(greeting)

browse = ConvoScreen:new {
  id = "browse",
  customDialogText = "The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.",
  stopConversation = "false",
  options = {
    {"[Example Category]", "items"},
    {"Nevermind.", "abort"},
  }
}
rpg_tutorial:addScreen(browse)

items = ConvoScreen:new {
  id = "items",
  customDialogText = "Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.",
  stopConversation = "false",
  options = {
    {"[Example Item]", "shop"},
    {"Let's go back.", "browse"},
  }
}
rpg_tutorial:addScreen(items)


shop = ConvoScreen:new {
  id = "shop",
  customDialogText = "When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.",
  stopConversation = "true",
  options = {
  }
}
rpg_tutorial:addScreen(shop)

abort = ConvoScreen:new {
  id = "abort",
  customDialogText = "Come back anytime!",
  stopConversation = "true",
  options = {
  }
}
rpg_tutorial:addScreen(abort)

firstthing = ConvoScreen:new {
		id="firstthing",
		CustomDialogText = "The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.",
		stopConversation="false",
		options = {
			{"And after that?", "secondthing"},
			{"I don't need to hear any more.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(firstthing);


secondthing = ConvoScreen:new {
		id="secondthing",
		CustomDialogText = "Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.",
		stopConversation="false",
		options = {
			{"I'm feeling a bit underprepared still.", "thirdthing"},
			{"I don't need to hear any more.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(secondthing);



thirdthing = ConvoScreen:new {
		id="thirdthing",
		CustomDialogText = "When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.",
		stopConversation="false",
		options = {
			{"What else needs to be done in order to be prepared?", "fourththing"},
			{"I don't need to hear any more.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(thirdthing);


fourththing = ConvoScreen:new {
		id="fourththing",
		CustomDialogText = "Finally, take a moment to rest and recover before stepping out into the world. Use the /rest command to do fill your health, action, and will pools.",
		stopConversation="false",
		options = {
			{"Can you explain some of that again?", "greeting"},
			{"Thanks! I'll get started right away.", "abort"},
		}
	}
	rpg_tutorial_convo_handler:addScreen(fourththing);




addConversationTemplate("rpg_tutorial", rpg_tutorial);
