local themeTag = "tutorial"

rpg_vt_general = {
	dialog = {
		greeting = "Welcome to FEA. There are a few steps you'll want to take in order to create a character.", --1
		firstthing = "The first thing to do is allocate your attributes. These serve as soft maximums for your skills, in addition to providing direct benefits such as increasing your health. If the window for training isn't already open, enter /train.", --2
		secondthing = "Next you should allocate skills. This is also done from the /train menu. I would not recommend raising any skills above their parent attribute right now, as it will cost significantly more experience.", --2
		thirdthing = "Lastly, you need to equip your character. There are vendors across the hall who can sell you weapons, armor, and stimpacks. On your starting budget, you will mostly be limited to Marauder armor and other cheap items.", --3
		abort = "Farewell, traveller.", --4
	}
}

RPGVendorThemes:addTheme(themeTag, rpg_vt_general)