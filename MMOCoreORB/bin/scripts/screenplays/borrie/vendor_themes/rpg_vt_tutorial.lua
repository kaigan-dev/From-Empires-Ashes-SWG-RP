local themeTag = "rpg_tutorial"

rpg_tutorial = {
	dialog = {
		greeting = "Why travel in something that just gets the job done, when you can travel in style? In comfort? Perhaps in a fine high class airspeeder...?", --1
		browse = "Only the finest Corellian leather is used in the seating of some of our vehicles. Extra fees may or may not apply, my friend...", --2
		items = "You cannot beat the comfort given by just being in one of our finest vehicles...", --2
		startShopping = "We can only guarantee the finest engineering. Some of the designs were lifted from luxury yachts in the Old Republic, you know.", --3
		abort = "Goodbye.", --4
	}
}
 

RPGVendorThemes:addTheme(themeTag, rpg_tutorial)