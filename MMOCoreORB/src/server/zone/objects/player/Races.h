/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RACES_H_
#define RACES_H_

#include "system/lang.h"

const static char* Species[] = {
	"human", 	// human male
	"trandoshan", 	// trandoshan male
	"twilek", 	// twilek male
	"bothan", 	// bothan male
	"zabrak", 	// zabrak male
	"rodian", 	// rodian male
 	"moncal", 	// moncal male
	"wookiee", 	// wookiee male
	"sullustan", 	// sullustan male
	"ithorian",	// ithorian male
	//"hutt", 	// male hutt
	"human", 	// human female
	"trandoshan", 	// trandoshan female
	"twilek", 	// twilek female
	"bothan", 	// bothan female
	"zabrak", 	// zabrak female
	"rodian", 	// rodian female
	"moncal", 	// moncal female
	"wookiee", 	// wookiee female
	"sullustan", 	// sullustan female
	"ithorian",  	// ithorian female
	//"hutt", 	// female hutt
	"nautolan", 	// male Nautolan
	"togruta", 	// female Togruta
	"chiss", 	// male chiss
	"chiss", 	// female chiss
	"devaronian", 	// male devaronian
	"gran", 	// male gran
	"ishi_tib", 	// male ishi tib
	"nightsister", 	// female nightsister
	"nikto", 	// male nikto
	"quarren", 	// male quarren
	"smc", 		// female singing mountain clan witch
	"weequay" ,	// male weequay
	"aqualish",	// male aqualish
	"aqualish",	// female aqualish
	"bith",		// male bith
	"bith",		// female bith
	"gotal",	// male gotal
	//"talz",		// male talz

    "iktotchi", //male iktotchi
    "kel_dor", //male kel dor
    "zeltron", //male zeltron
    "zeltron", //female zeltron
    "arkanian", //male arkanian
    "arkanian", //female arkanian
    "arcona", //male arcona

	"togruta", //female togruta
	"devaronian", //female devaronian
	"kubaz", //male kubaz
	"jenet", //male jenet
	"zelosian", //male zelosian
	"zelosian", //female zelosian
	"miraluka", //male miraluka
	"miraluka", //female miraluka
	//"chadra_fan", //male chadra fan
	//"chadra_fan", //female chadra fan
	"rattataki", //male rattataki
	"rattataki", //female rattataki
	"arkanian_offshoot", //male arkanian_offshoot
	"arkanian_offshoot", //female arkanian_offshoot
	"nagai", //male nagai
	"nagai", //female nagai
	"firrerreo", //male Firrerreo
	"firrerreo", //female Firrerreo
	"anzati", //male anzati
	"anzati", //female anzati
	"feeorin", //male feeorin
	"kiffar", //male kiffar
	"kiffar", //female kiffar
	"echani", //male echani
	"echani", //female echani
	"chevin", //male chevin
	"drall", //male drall
	"drall", //female drall
	"kitonak", //male kitonak
	//"dug", //male dug
	"ortolan", //male ortolan
	//"geonosian", //male geonosian
	//"selonian", //male selonian
	//"selonian", //female selonian
	//"togorian", //male togorian
	//"toydarian", //male toydarian
	"ugnaught", //male ugnaught
	"whipihd", //male whipid
	"whipihd", //female whipid
};

const static int TemplateSpecies[] = { //hex code for species number
		0,
		2,
		6,
		5,
		7,
		1,
		3,
		4,
		0x31,
		0x21,
		//0x1f,   //Hutt male
		0,
		2,
		6,
		5,
		7,
		1,
		3,
		4,
		0x31,
		0x21,
		//0x1f,   //Hutt female
		0x2c,
		0x2d,
		0x34, //chiss
		0x34, //chiss
		0x35, //devaronian
		0x36, //gran
		0x37, //ishi tib
		0x38, //nightsister
		0x39, //nikto
		0x3a, //quarren
		0x3b, //smc
		0x3c, //weequay
		0x3d, // aqualish
		0x3e, // aqualish
		0x3f, // bith
		0x4, //bith
		0, //gotal
		//0, //talz
        0, //Iktotchi
        0, //Kel Dor
        0, //Zeltron
        0, //Zeltron
        0, //Arkanian
        0, //Arkanian
        0, //Arcona

		0, //female togruta
		0, //female devaronian
		0, //male kubaz
		0, //male jenet
		0, //male zelosian
		0, //female zelosian
		0, //male miraluka
		0, //female miraluka
		//0, //male chadra fan
		//0, //female chadra fan
		0, //male rattataki
		0, //female rattataki
		0, //male arkanian_offshoot
		0, //female arkanian_offshoot
		0, //male nagai
		0, //female nagai
		0, //male Firrerreo
		0, //female Firrerreo
		0, //male anzati
		0, //female anzati
		0, //male feeorin
		0, //male kiffar
		0, //female kiffar
		0, //male echani
		0, //female echani
		0, //male chevin
		0, //male drall
		0, //female drall
		0, //male kitonak
		//0, //male dug
		0, //male ortolan
		//0, //male geonosian
		//0, //male selonian
		//0, //female selonian
		//0, //male togorian
		//0, //male toydarian
		0, //male ugnaught
		0, //male whipid
		0, //female whipid
};

const static char* Gender[] = {
	"male", 	// human male
	"male", 	// trandoshan male
	"male", 	// twilek male
	"male", 	// bothan male
	"male", 	// zabrak male
	"male", 	// rodian male
	"male", 	// moncal male
	"male", 	// wookiee male
	"male", 	// sullustan male
	"male", 	// ithorian male
	//"male", 	// hutt male
	"female", 	// human female
	"female", 	// trandoshan female
	"female", 	// twilek female
	"female", 	// bothan female
	"female", 	// zabrak female
	"female", 	// rodian female
	"female", 	// moncal female
	"female", 	// wookiee female
	"female", 	// sullustan female
	"female", 	// ithorian female
	//"female", 	// hutt female
	"male", 	// nautolan male
	"female", 	// togruta female
	"male", 	// chiss male
	"female", 	// chiss female
	"male", 	// devaronian male
	"male", 	// gran male
	"male", 	// ishi tib male
	"female", 	// nightsister female
	"male", 	// nikto male
	"male", 	// quarren male
	"female", 	// smc female
	"male", 	// weequay male
	"male", 	// aqualish male
	"female", 	// aqualish female
	"male", 	// bith male
	"female", 	// bith female
	"male", 	// gotal male
	//"male", 	// talz male
    "male",     //male iktotchi
    "male",     //male kel dor
    "male",     //male zeltron
    "female",   //female zeltron
    "male",     //male arkanian
    "female",   //female arkanian
    "male",      //male arcona

	"female", //female togruta
	"female", //female devaronian
	"male", //male kubaz
	"male", //male jenet
	"male", //male zelosian
	"female", //female zelosian
	"male", //male miraluka
	"female", //female miraluka
	//"male", //male chadra fan
	//"female", //female chadra fan
	"male", //male rattataki
	"female", //female rattataki
	"male", //male arkanian_offshoot
	"female", //female arkanian_offshoot
	"male", //male nagai
	"female", //female nagai
	"male", //male Firrerreo
	"female", //female Firrerreo
	"male", //male anzati
	"female", //female anzati
	"male", //male feeorin
	"male", //male kiffar
	"female", //female kiffar
	"male", //male echani
	"female", //female echani
	"male", //male chevin
	"male", //male drall
	"female", //female drall
	"male", //male kitonak
	//"male", //male dug
	"male", //male ortolan
	//"male", //male geonosian
	//"male", //male selonian
	//"female", //female selonian
	//"male", //male togorian
	//"male", //male toydarian
	"male", //male ugnaught
	"male", //male whipid
	"female", //female whipid    
};

const static char* RaceStrs[] = {
	"object/creature/player/shared_human_male.iff", 	// human male
	"object/creature/player/shared_trandoshan_male.iff", 	// trandoshan male
	"object/creature/player/shared_twilek_male.iff", 	// twilek male
	"object/creature/player/shared_bothan_male.iff", 	// bothan male
	"object/creature/player/shared_zabrak_male.iff", 	// zabrak male
	"object/creature/player/shared_rodian_male.iff", 	// rodian male
	"object/creature/player/shared_moncal_male.iff", 	// moncal male
	"object/creature/player/shared_wookiee_male.iff", 	// wookiee male
	"object/creature/player/shared_sullustan_male.iff", 	// sullustan male
	"object/creature/player/shared_ithorian_male.iff", 	// ithorian male
	//"object/creature/player/shared_hutt_male.iff", 		// hutt male
	"object/creature/player/shared_human_female.iff", 	// human female
	"object/creature/player/shared_trandoshan_female.iff", 	// trandoshan female
	"object/creature/player/shared_twilek_female.iff", 	// twilek female
	"object/creature/player/shared_bothan_female.iff", 	// bothan female
	"object/creature/player/shared_zabrak_female.iff", 	// zabrak female
	"object/creature/player/shared_rodian_female.iff", 	// rodian female
	"object/creature/player/shared_moncal_female.iff", 	// moncal female
	"object/creature/player/shared_wookiee_female.iff", 	// wookiee female
	"object/creature/player/shared_sullustan_female.iff", 	// sullustan female
	"object/creature/player/shared_ithorian_female.iff",  	// ithorian female
	//"object/creature/player/shared_hutt_female.iff", 	// hutt female
	"object/creature/player/shared_nautolan_male.iff", 	// nautolan male
	"object/creature/player/shared_togruta_female.iff", 	// togruta female
	"object/creature/player/shared_chiss_male.iff", 	// chiss male
	"object/creature/player/shared_chiss_female.iff", 	// chiss female
	"object/creature/player/shared_devaronian_male.iff", 	// devaronian male
	"object/creature/player/shared_gran_male.iff", 		// gran male
	"object/creature/player/shared_ishi_tib_male.iff", 	// ishi tib male
	"object/creature/player/shared_nightsister_female.iff", // nightsister female
	"object/creature/player/shared_nikto_male.iff", 	// nikto male
	"object/creature/player/shared_quarren_male.iff", 	// quarren male
	"object/creature/player/shared_smc_female.iff", 	// smc female
	"object/creature/player/shared_weequay_male.iff", 	// weequay male
	"object/creature/player/shared_aqualish_male.iff", 	// aqualish male
	"object/creature/player/shared_aqualish_female.iff", 	// aqualish female
	"object/creature/player/shared_bith_male.iff", 		// bith male
	"object/creature/player/shared_bith_female.iff", 	// bith female
	"object/creature/player/shared_gotal_male.iff", 	// gotal male
	//"object/creature/player/shared_talz_male.iff", 		// talz male
    "object/creature/player/shared_iktotchi_male.iff", 	
    "object/creature/player/shared_kel_dor_male.iff", 	
    "object/creature/player/shared_zeltron_male.iff", 
    "object/creature/player/shared_zeltron_female.iff", 	
    "object/creature/player/shared_arkanian_male.iff", 	
    "object/creature/player/shared_arkanian_female.iff", 		
    "object/creature/player/shared_arcona_male.iff"	
	"object/creature/player/shared_togruta_female.iff", //female togruta
	"object/creature/player/shared_devaronian_female.iff", //female devaronian
	"object/creature/player/shared_kubaz_male.iff", //male kubaz
	"object/creature/player/shared_jenet_male.iff", //male jenet
	"object/creature/player/shared_zelosian_male.iff", //male zelosian
	"object/creature/player/shared_zelosian_female.iff", //female zelosian
	"object/creature/player/shared_miraluka_male.iff", //male miraluka
	"object/creature/player/shared_miraluka_female.iff", //female miraluka
	//"object/creature/player/shared_chadra_fan_male.iff", //male chadra fan
	//"object/creature/player/shared_chadra_fan_female.iff", //female chadra fan
	"object/creature/player/shared_rattataki_male.iff", //male rattataki
	"object/creature/player/shared_rattataki_female.iff", //female rattataki
	"object/creature/player/shared_arkanian_offshoot_male.iff", //male arkanian_offshoot
	"object/creature/player/shared_arkanian_offshoot_female.iff", //female arkanian_offshoot
	"object/creature/player/shared_nagai_male.iff", //male nagai
	"object/creature/player/shared_nagai_female.iff", //female nagai
	"object/creature/player/shared_firrerreo_male.iff", //male Firrerreo
	"object/creature/player/shared_firrerreo_female.iff", //female Firrerreo
	"object/creature/player/shared_anzati_male.iff", //male anzati
	"object/creature/player/shared_anzati_female.iff", //female anzati
	"object/creature/player/shared_feeorin_male.iff", //male feeorin
	"object/creature/player/shared_kiffar_male.iff", //male kiffar
	"object/creature/player/shared_kiffar_female.iff", //female kiffar
	"object/creature/player/shared_echani_male.iff", //male echani
	"object/creature/player/shared_echani_female.iff", //female echani
	"object/creature/player/shared_chevin_male.iff", //male chevin
	"object/creature/player/shared_drall_male.iff", //male drall
	"object/creature/player/shared_drall_female.iff", //female drall
	"object/creature/player/shared_kitonak_male.iff", //male kitonak
	//"object/creature/player/shared_dug_male.iff", //male dug
	"object/creature/player/shared_ortolan_male.iff", //male ortolan
	//"object/creature/player/shared_geonosian_male.iff", //male geonosian
	//"object/creature/player/shared_selonian_male.iff", //male selonian
	//"object/creature/player/shared_selonian_female.iff", //female selonian
	//"object/creature/player/shared_togorian_male.iff", //male togorian
	//"object/creature/player/shared_toydarian_male.iff", //male toydarian
	"object/creature/player/shared_ugnaught_male.iff", //male ugnaught
	"object/creature/player/shared_whipid_male.iff", //male whipid
	"object/creature/player/shared_whipid_female.iff" //female whipid
};

const static char* CCRaceStrs[] = {
	"object/creature/player/human_male.iff", 	// human male
	"object/creature/player/trandoshan_male.iff", 	// trandoshan male
	"object/creature/player/twilek_male.iff", 	// twilek male
	"object/creature/player/bothan_male.iff", 	// bothan male
	"object/creature/player/zabrak_male.iff", 	// zabrak male
	"object/creature/player/rodian_male.iff", 	// rodian male
	"object/creature/player/moncal_male.iff", 	// moncal male
	"object/creature/player/wookiee_male.iff", 	// wookiee male
	"object/creature/player/sullustan_male.iff", 	// sullustan male
	"object/creature/player/ithorian_male.iff", 	// ithorian male
	//"object/creature/player/hutt_male.iff", 	//hutt male
	"object/creature/player/human_female.iff", 	// human female
	"object/creature/player/trandoshan_female.iff", // trandoshan female
	"object/creature/player/twilek_female.iff", 	// twilek female
	"object/creature/player/bothan_female.iff", 	// bothan female
	"object/creature/player/zabrak_female.iff", 	// zabrak female
	"object/creature/player/rodian_female.iff", 	// rodian female
	"object/creature/player/moncal_female.iff", 	// moncal female
	"object/creature/player/wookiee_female.iff", 	// wookiee female
	"object/creature/player/sullustan_female.iff", 	// sullustan female
	"object/creature/player/ithorian_female.iff",  	// ithorian female
	//"object/creature/player/hutt_female.iff", 	//hutt female
	"object/creature/player/nautolan_male.iff", 	//nautolan male
	"object/creature/player/togruta_female.iff", 	//togruta female
	"object/creature/player/chiss_male.iff", 	//chiss male
	"object/creature/player/chiss_female.iff", 	//chiss female
	"object/creature/player/devaronian_male.iff", 	//devaronian male
	"object/creature/player/gran_male.iff", 	//gran male
	"object/creature/player/ishi_tib_male.iff", 	//ishi tib male
	"object/creature/player/nightsister_female.iff",//nightsister female
	"object/creature/player/nikto_male.iff", 	//nikto male
	"object/creature/player/quarren_male.iff", 	//quarren male
	"object/creature/player/smc_female.iff", 	//smc female
	"object/creature/player/weequay_male.iff", 	//weequay male
	"object/creature/player/aqualish_male.iff", 	//aqualish male
	"object/creature/player/aqualish_female.iff", 	//aqualish female
	"object/creature/player/bith_male.iff", 	//bith male
	"object/creature/player/bith_female.iff", 	//bith female
	"object/creature/player/gotal_male.iff", 	//gotal male
	//"object/creature/player/talz_male.iff", 	//talz male

    "object/creature/player/iktotchi_male.iff", 	
    "object/creature/player/kel_dor_male.iff", 	
    "object/creature/player/zeltron_male.iff", 
    "object/creature/player/zeltron_female.iff", 	
    "object/creature/player/arkanian_male.iff", 	
    "object/creature/player/arkanian_female.iff", 		
    "object/creature/player/arcona_male.iff",

	"object/creature/player/togruta_female.iff", //female togruta
	"object/creature/player/devaronian_female.iff", //female devaronian
	"object/creature/player/kubaz_male.iff", //male kubaz
	"object/creature/player/jenet_male.iff", //male jenet
	"object/creature/player/zelosian_male.iff", //male zelosian
	"object/creature/player/zelosian_female.iff", //female zelosian
	"object/creature/player/miraluka_male.iff", //male miraluka
	"object/creature/player/miraluka_female.iff", //female miraluka
	//"object/creature/player/chadra_fan_male.iff", //male chadra fan
	//"object/creature/player/chadra_fan_female.iff", //female chadra fan
	"object/creature/player/rattataki_male.iff", //male rattataki
	"object/creature/player/rattataki_female.iff", //female rattataki
	"object/creature/player/arkanian_offshoot_male.iff", //male arkanian_offshoot
	"object/creature/player/arkanian_offshoot_female.iff", //female arkanian_offshoot
	"object/creature/player/nagai_male.iff", //male nagai
	"object/creature/player/nagai_female.iff", //female nagai
	"object/creature/player/firrerreo_male.iff", //male Firrerreo
	"object/creature/player/firrerreo_female.iff", //female Firrerreo
	"object/creature/player/anzati_male.iff", //male anzati
	"object/creature/player/anzati_female.iff", //female anzati
	"object/creature/player/feeorin_male.iff", //male feeorin
	"object/creature/player/kiffar_male.iff", //male kiffar
	"object/creature/player/kiffar_female.iff", //female kiffar
	"object/creature/player/echani_male.iff", //male echani
	"object/creature/player/echani_female.iff", //female echani
	"object/creature/player/chevin_male.iff", //male chevin
	"object/creature/player/drall_male.iff", //male drall
	"object/creature/player/drall_female.iff", //female drall
	"object/creature/player/kitonak_male.iff", //male kitonak
	//"object/creature/player/dug_male.iff", //male dug
	"object/creature/player/ortolan_male.iff", //male ortolan
	//"object/creature/player/geonosian_male.iff", //male geonosian
	//"object/creature/player/selonian_male.iff", //male selonian
	//"object/creature/player/selonian_female.iff", //female selonian
	//"object/creature/player/togorian_male.iff", //male togorian
	//"object/creature/player/toydarian_male.iff", //male toydarian
	"object/creature/player/ugnaught_male.iff", //male ugnaught
	"object/creature/player/whipid_male.iff", //male whipid
	"object/creature/player/whipid_female.iff" //female whipid
};

//This is the CRC of the shared template path full name, CRC-32/BZIP2
static uint32 SharedRace[] = { //race CRC
	0xAF1DC1A1, // human male
	0x50C45B8F, // trandoshan male
	0xF280E27B, // twi'lek male
	0x5BF77F33, // bothan male
	0xE204A556, // zabrak male
	0x0BF9CD9C, // rodian male
	0xB9C855A8, // moncal male
	0x0564791D, // wookiee male
	0x0B9399A4, // sullustan male
	0x38BAC7C4, // ithorian male
	//0x916443F9, // hutt male
	0xFFFFBBE9, // human female
	0x183C24C6, // trandoshan female
	0x849752DC, // twi'lek female
	0x1D52730E, // bothan female
	0xA9E35FFD, // zabrak female
	0xC264245B, // rodian female
	0x982FBFDE, // moncal female
	0x0DAB65E2, // wookiee female
	0x1573341A, // sullustan female
	0xB3E08013, // ithorian female
	//0xE0B607C0, // hutt female
	0xAB03ACB1, // nautolan male
	0x3D953B50, // togruta female
	0x02F60EAC, // chiss male
	0x614A1B68, // chiss female
	0x68731058, // devaronian male
	0xC2872D34, // gran male
	0x809EF398, // ishi tib male
	0xC56D9790, // nightsister female
	0x59ECB38B, // nikto male
	0x3435F686, // quarren male
	0x82A138F9, // smc female
	0x4F0718B5, // weequay male
	0xCEF4B4A1, // aqualish male
	0xDE63F629, // aqualish female
	0x73C992FF, // bith male
	0xB2C9CBE0, // bith female
	0x30CFFED2, // gotal male
	//0xDBA89F7C, // talz male
    0xF9B11C30, //Iktotchi male
    0x66DCE6EE, //Kel Dor Male
    0xE8975526, //Zeltron Male
    0x5B779FE7, //Zeltron Female
    0xE4F2597C, //Arkanian Male
    0x232150E0, //Arkanian Female
    0xA2A87F6E, //Arcona Male
	0x3D953B50, //female togruta
	0x4A2817DA, //female devaronian
	0x6BB072FA, //male kubaz
	0x48B04347, //male jenet
	0x35AB1EA4, //male zelosian
	0x3F25E5F3, //female zelosian
	0x07BE9747, //male miraluka
	0x7D1266D2, //female miraluka
	//0xF9504963, //male chadra fan
	//0xC6B705B4, //female chadra fan
	0x1CD4393C, //male rattataki
	0xB8B4F101, //female rattataki
	0x4CB95F83, //male arkanian_offshoot
	0x1274461A, //female arkanian_offsho
	0x9C1F5DD7, //male nagai
	0x28127261, //female nagai
	0x6F6CFA05, //male Firrerreo
	0xE3E40F6D, //female Firrerreo
	0x58C46186, //male anzati
	0xA87D6794, //female anzati
	0x60EDEA05, //male feeorin
	0x9F70644F, //male kiffar
	0xF78B5698, //female kiffar
	0xAE13A827, //male echani
	0x78EEDA3F, //female echani
	0x885D70DF, //male chevin
	0xF4322BAA, //male drall
	0x1C2C5B6A, //female drall
	0x2F832D26, //male kitonak
//	0x696718D6, //male dug
	0x65FBE4A7, //male ortolan
	//0x0D506AEA, //male geonosian
	//0x3639ADAE, //male selonian
	//0xD25BBAD0, //female selonian
	//0xA4478797, //male togorian
	//0x3E751C09, //male toydarian
	0xED41E335, //male ugnaught
	0xE6F2BE54, //male whipid
	0x64FBCEEF //female whipid
};

const static char* MoodStr[][2]= {
	{"none", "neutral"},
	{"absentminded", "neutral"},
	{"amazed", "neutral"},
	{"amused", "happy"},
	{"angry", "angry"},
	{"approving", "neutral"},
	{"bitter", "neutral"},
	{"bloodthirsty", "neutral"},
	{"brave", "neutral"},
	{"callous", "neutral"},
	{"careful", "neutral"},
	{"careless", "neutral"},
	{"casual", "neutral"},
	{"clinical", "neutral"},
	{"cocky", "neutral"},
	{"cold", "neutral"},
	{"compassionate", "neutral"},
	{"condescending", "neutral"},
	{"confident", "neutral"},
	{"confused", "neutral"},
	{"content", "happy"},
	{"courtly", "neutral"},
	{"coy", "neutral"},
	{"crude", "neutral"},
	{"cruel", "neutral"},
	{"curious", "neutral"},
	{"cynical", "neutral"},
	{"defensive", "neutral"},
	{"depressed", "unhappy"},
	{"devious", "neutral"},
	{"dimwitted", "neutral"},
	{"disappointed", "unhappy"},
	{"discreet", "neutral"},
	{"disgruntled", "disgruntled"},
	{"disgusted", "neutral"},
	{"dismayed", "unhappy"},
	{"disoriented", "neutral"},
	{"distracted", "neutral"},
	{"doubtful", "neutral"},
	{"dramatic", "neutral"},
	{"dreamy", "neutral"},
	{"drunk", "neutral"},
	{"earnest", "neutral"},
	{"ecstatic", "happy"},
	{"embarrassed", "neutral"},
	{"emphatic", "neutral"},
	{"encouraging", "neutral"},
	{"enthusiastic", "neutral"},
	{"evil", "neutral"},
	{"exasperated", "disgruntled"},
	{"exuberant", "happy"},
	{"fanatical", "neutral"},
	{ "forgive", "neutral"},
	{"frustrated", "neutral"},
	{"guilty", "neutral"},
	{"happy", "happy"},
	{"honest", "neutral"},
	{"hopeful", "neutral"},
	{"hopeless", "neutral"},
	{"humble", "neutral"},
	{"hysterical", "neutral"},
	{"imploring", "neutral"},
	{"indifferent", "neutral"},
	{"indignant", "angry"},
	{"interested", "neutral"},
	{"jealous", "neutral"},
	{"joyful", "happy"},
	{"lofty", "neutral"},
	{"loud", "neutral"},
	{"loving", "neutral"},
	{"lustful", "neutral"},
    {"mean", "neutral"},
    {"mischievous", "neutral"},
    {"nervous", "neutral"},
    {"neutral", "neutral"},
    {"offended", "neutral"},
    {"optimistic", "neutral"},
    {"pedantic", "neutral"},
    {"pessimistic", "neutral"},
    {"petulant", "neutral"},
    {"philosophical", "neutral"},
    {"pitying", "neutral"},
    {"playful", "happy"},
    {"polite", "neutral"},
    {"pompous", "neutral"},
    {"proud", "neutral"},
    {"provocative", "neutral"},
    {"puzzled", "neutral"},
    {"regretful", "unhappy"},
    {"relieved", "neutral"},
    {"reluctant", "neutral"},
    {"resigned", "neutral"},
    {"respectful", "neutral"},
    {"romantic", "neutral"},
    {"rude", "neutral"},
    {"sad", "unhappy"},
    {"sarcastic", "neutral"},
    {"scared", "neutral"},
    {"scolding", "neutral"},
    {"scornful", "neutral"},
    {"serious", "neutral"},
    {"shameless", "neutral"},
    {"shocked", "neutral"},
    {"shy", "neutral"},
    {"sincere", "neutral"},
    {"sleepy", "neutral"},
    {"sly", "neutral"},
    {"smug", "neutral"},
    {"snobby", "neutral"},
    {"sorry", "neutral"},
    {"spiteful", "neutral"},
    {"stubborn", "neutral"},
    {"sullen", "neutral"},
    {"suspicious", "neutral"},
    {"taunting", "neutral"},
    {"terrified", "neutral"},
    {"thankful", "neutral"},
    {"thoughtful", "neutral"},
    {"tolerant", "neutral"},
    {"uncertain", "neutral"},
    {"unhappy", "unhappy"},
    {"unwilling", "neutral"},
    {"warm", "neutral"},
    {"whiny", "neutral"},
    {"wicked", "neutral"},
    {"wistful", "neutral"},
    {"worried", "worried"},
    {"tired", "neutral"},
    {"exhausted", "neutral"},
    {"friendly", "happy"},
    {"timid", "neutral"},
    {"lazy", "neutral"},
    {"surprised", "worried"},
    {"innocent", "happy"},
    {"wise", "neutral"},
    {"youthful", "neutral"},
    {"adventurous", "neutral"},
    {"annoyed", "angry"},
    {"perturbed", "unhappy"},
    {"sedate", "neutral"},
    {"calm", "neutral"},
    {"suffering", "unhappy"},
    {"hungry", "neutral"},
    {"thirsty", "neutral"},
    {"alert", "neutral"},
    {"shifty", "neutral"},
    {"relaxed", "neutral"},
    {"crotchety", "angry"},
    {"surly", "angry"},
    {"painful", "unhappy"},
    {"wounded", "unhappy"},
    {"bubbly", "happy"},
    {"heroic", "neutral"},
    {"quiet", "neutral"},
    {"remorseful", "unhappy"},
    {"grumpy", "angry"},
    {"logical", "neutral"},
    {"emotional", "neutral"},
    {"troubled", "unhappy"},
    {"panicked", "worried"},
    {"nice", "happy"},
    {"cheerful", "happy"},
    {"emotionless", "neutral"},
    {"gloomy", "unhappy"},
    {"ambivalent", "neutral"},
    {"envious", "neutral"},
    {"vengeful", "angry"},
    {"fearful", "worried"},
    {"enraged", "angry"},
    {"sheepish", "happy"},
    {"belligerent", "angry"},
    {"obnoxious", "neutral"},
    {"fastidious", "neutral"},
    {"squeamish", "unhappy"},
    {"dainty", "neutral"},
    {"dignified", "neutral"},
    {"haughty", "neutral"},
    {"obscure", "neutral"},
    {"goofy", "happy"},
    {"silly", "happy"},
    {"disdainful", "neutral"},
    {"contemptuous", "neutral"},
    {"diplomatic", "neutral"},
    {"wary", "neutral"},
    {"malevolent", "angry"},
    {"hurried", "neutral"},
    {"patient", "neutral"},
    {"firm", "neutral"},
    {"meditating", "meditating"},
	{"entertained", "entertained"}

};

static unsigned int attributeLimits[85][19] = { //HAM
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{550, 1250,	600,  800,	700,  800, 300,	1000, 300,  	450, 300,  400,	300, 1000, 300,	 500, 300,	600, 5550},
		{300, 1000,	300,  500,	550,  650, 550,	1250, 600,	750, 300,  400,	400, 1100, 300,	 500, 300,	500, 5400},
		{300, 1000,	300,  500,	300,  400, 600,	1300, 600,	750, 400,  500,	400, 1100, 400,	 600, 300,	500, 5400},
		{500, 1200,	300,  500,	300,  400, 600,	1300, 300,	450, 300,  400,	300, 1000, 300,	 500, 700,	900, 5400},
		{300, 1000,	300,  500,	300,  400, 300,	1200, 300,	650, 450,  850,	300, 1000, 300,	 500, 350,	550, 5400},
		{300, 1000,	300,  500,	300,  400, 300,	1000, 300,	450, 450,  550,	600, 1300, 600,	 800, 450,	650, 5400},
		{650, 1350,	650,  850,	450,  550, 500,	1200, 400,	550, 400,  500,	400, 1100, 450,	 650, 400,	600, 6100},
		{300, 1200,	300,  500,	300,  400, 600,	1400, 300,	750, 300,  500,	400, 1200, 400,	 600, 300,	600, 5400},
		{300, 1400,	300,  600,	300,  500, 600,	1100, 300,	750, 300,  500,	400, 1300, 400,	 600, 300,	500, 5400},
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},  /Hutt male
		{550, 1250,	600,  800,	700,  800, 300,	1000, 300,  	450, 300,  400,	300, 1000, 300,	 500, 300,	600, 5550},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},  //Hutt female
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
//		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},   //Talz
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Chadra fan male
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Chadra fam female
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Dug
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Geonosian
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Selonian
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Selonian
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Togorian
		//{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},	//Toydarin
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400}
};

class Races {
public:
	inline const static char* getRace(int raceid) {
		if (raceid < 0 || raceid > 85)
			return "";

		return RaceStrs[raceid];
	}

	inline static int getSpeciesID(int raceid) {
		if (raceid < 0 || raceid > 85)
			return 0;

		return TemplateSpecies[raceid];
	}

	inline const static char* getMood(int moodid) {
		if (moodid < 0 || moodid > 189)
			return "";

		return MoodStr[moodid][0];
	}

	inline const static char* getSpecies(int raceid) {
		if (raceid < 0 || raceid > 85)
			return "";

		return Species[raceid];
	}

	inline const static char* getGender(int raceid) {
		if (raceid < 0 || raceid > 85)
			return "";

		return Gender[raceid];
	}

	inline static uint32 getRaceCRC(int raceid) {
		if (raceid < 0 || raceid > 85)
			return 0;

		return SharedRace[raceid];
	}

	inline static const char* getCompleteRace(uint32 sharedRaceCRC) {
		int race = -1;
		for (int i = 0; i < 47; ++i) {
			if (SharedRace[i] == sharedRaceCRC) {
				race = i;
				break;
			}
		}

		if (race == -1)
			return "";
		else
			return CCRaceStrs[race];
	}

	inline static int getRaceID(const String& name) {
    	for (int i = 0; i < 85; i++) {
        	if (strcmp(name.toCharArray(), CCRaceStrs[i]) == 0)
            	return i;
    	}

    	return 0;
	}

	inline static int getMoodID(const String& name) {
    	for (int i = 0; i < 190; i++) {
        	if (strcmp(name.toCharArray(), MoodStr[i][0]) == 0)
            	return i;
    	}

    	return 0;
	}

	inline const static char* getMoodStr(const String& name) {
		for (int i = 0; i < 190; i++) {
			if (strcmp(name.toCharArray(), MoodStr[i][0]) == 0)
				return MoodStr[i][1];
		}

		return MoodStr[0][1];
	}

	inline static unsigned int * getAttribLimits(int raceid) {
		return attributeLimits[raceid % 10];
	}

};

#endif /*RACES_H_*/
