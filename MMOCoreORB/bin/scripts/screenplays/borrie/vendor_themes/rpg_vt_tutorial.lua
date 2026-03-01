local themeTag = "rpg_tutorial"

rpg_tutorial = {
	dialog = {
		greeting = "Welcome to FEA! There are a few steps you'll want to take in order to create a character.", --1
		abort = "Farewell, traveller.", --4
		firstthing = "The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.",
		secondthing = "Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.",
		thirdthing = "When you leave this room, step across the hall to speak to the vendors there. Many of their offers will be too expensive for your starting budget. Marauder armor is quite affordable if you want it, and some cheap weapons and stims are also available. Additionally, clothes are freely available upstairs.",
		fourththing = "Finally, take a moment to rest and recover before stepping out into the world. Use the /rest command to do fill your health, action, and will pools.",
	}
}
 

RPGVendorThemes:addTheme(themeTag, rpg_tutorial)