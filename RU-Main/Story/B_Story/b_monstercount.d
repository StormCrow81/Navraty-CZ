

func void b_monstercount()
{
	var string concatText;

	if(SPECIESKILLED[4] >= 1)
	{
		concatText = " Meat bugs: " ;
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[1]));
		concatText = ConcatStrings(concatText,"\nОвец: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[2]));
		concatText = ConcatStrings(concatText,"\nГоблинов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[3]));
		concatText = ConcatStrings(concatText, " \n Black Goblins: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[4]));
		concatText = ConcatStrings(concatText, " \n Goblin Skeletons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[5]));
		concatText = ConcatStrings(concatText, " \n Summoned Goblin Skeletons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[6]));
		concatText = ConcatStrings(concatText,"\nПадальщиков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[7]));
		concatText = ConcatStrings(concatText, " \n Meadow Scavengers/Rats: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[8]));
		concatText = ConcatStrings(concatText, " \n Field Beetles: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[9]));
		concatText = ConcatStrings(concatText, " \n Bloodhornets: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[10]));
		concatText = ConcatStrings(concatText,"\nВаранов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[11]));
		concatText = ConcatStrings(concatText, " \n Fire Lizards: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[12]));
		concatText = ConcatStrings(concatText,"\nВолков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[13]));
		concatText = ConcatStrings(concatText,"\nВаргов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[14]));
		concatText = ConcatStrings(concatText, " \n Summoned Wolves: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[15]));
		concatText = ConcatStrings(concatText,"\nПолзунов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[16]));
		concatText = ConcatStrings(concatText, " \n Crawler Warriors: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[17]));
		concatText = ConcatStrings(concatText,"\nШныгов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[18]));
		concatText = ConcatStrings(concatText,"\nСкелетов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[19]));
		concatText = ConcatStrings(concatText, " \n Called skeletons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[20]));
		concatText = ConcatStrings(concatText, " \n Skeleton Mages: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[21]));
		concatText = ConcatStrings(concatText,"\nЗомби: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[22]));
		concatText = ConcatStrings(concatText,"\nГлорхов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[23]));
		concatText = ConcatStrings(concatText, " \n Dragon Snappers: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[24]));
		concatText = ConcatStrings(concatText,"\nМракорисов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[25]));
		concatText = ConcatStrings(concatText, " \n Darkness of the Undead: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[26]));
		concatText = ConcatStrings(concatText,"\nГарпий: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[27]));
		concatText = ConcatStrings(concatText, " \n Stone Golems: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[28]));
		concatText = ConcatStrings(concatText, " \n Fire Golems: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[29]));
		concatText = ConcatStrings(concatText, " \n Ice Golems: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[30]));
		concatText = ConcatStrings(concatText, " \n Summoned Golems: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[31]));
		concatText = ConcatStrings(concatText,"\nДемонов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[32]));
		concatText = ConcatStrings(concatText, " \n Called daemons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[33]));
		concatText = ConcatStrings(concatText, " \n Demon Lords: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[34]));
		concatText = ConcatStrings(concatText,"\nТроллей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[35]));
		concatText = ConcatStrings(concatText, " \n Black Trolls: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[36]));
		concatText = ConcatStrings(concatText,"\nБолотожоров: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[37]));
		concatText = ConcatStrings(concatText, " \n Fire Dragons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[38]));
		concatText = ConcatStrings(concatText, " \n Ice Dragons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[39]));
		concatText = ConcatStrings(concatText, " \n Stone Dragons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[40]));
		concatText = ConcatStrings(concatText, " \n Swamp Dragons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[41]));
		concatText = ConcatStrings(concatText, " \n Undead Dragons: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[42]));
		concatText = ConcatStrings(concatText,"\nКротокрысов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[43]));
		concatText = ConcatStrings(concatText, " \n Orc Warriors: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[44]));
		concatText = ConcatStrings(concatText, " \n Orc Shamans: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[45]));
		concatText = ConcatStrings(concatText, " \n Elite Orcs: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[46]));
		concatText = ConcatStrings(concatText,"\nОрков нежитей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[47]));
		concatText = ConcatStrings(concatText, " \n Dragon Lizards: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[48]));
		concatText = ConcatStrings(concatText,"\nОгоньков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[49]));
		concatText = ConcatStrings(concatText,"\nАллигаторов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[50]));
		concatText = ConcatStrings(concatText, " \n Swamp Golems: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[51]));
		concatText = ConcatStrings(concatText, " \n Stone Guard: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[52]));
		concatText = ConcatStrings(concatText, " \n Fire Spirits: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[53]));
		concatText = ConcatStrings(concatText,"\nВурдалаков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[54]));
		concatText = ConcatStrings(concatText, " \n Ice Wolves: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[55]));
		concatText = ConcatStrings(concatText,"\nКусачей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[56]));
		concatText = ConcatStrings(concatText,"\nБритвозубов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[57]));
		concatText = ConcatStrings(concatText,"\nУтопленников: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[58]));
		concatText = ConcatStrings(concatText, " \n Swamp Rats: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[59]));
		concatText = ConcatStrings(concatText,"\nБогомолов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[60]));
		concatText = ConcatStrings(concatText, " \n Summoned Stone Guards: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[61]));
		concatText = ConcatStrings(concatText, " \n Called Zombies: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[62]));
		concatText = ConcatStrings(concatText,"\nКабанов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[63]));
		concatText = ConcatStrings(concatText, " \n Venomous Swamp Flies: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[64]));
		concatText = ConcatStrings(concatText, " \n Forest Goblins: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[65]));
		concatText = ConcatStrings(concatText,"\nПум: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[66]));
		concatText = ConcatStrings(concatText, " \n Runic Swampflies: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[67]));
		concatText = ConcatStrings(concatText,"\nЛюциан: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[70]));
		concatText = ConcatStrings(concatText, " \n Orc Crossbowmen: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[71]));
		concatText = ConcatStrings(concatText, " \n Azgalor, Black Dragon: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[72]));
		concatText = ConcatStrings(concatText, " \n Red Dragon: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[73]));
		concatText = ConcatStrings(concatText, " \n Guardian Zombie: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[74]));
		concatText = ConcatStrings(concatText,"\nИщущих: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[75]));
		concatText = ConcatStrings(concatText, " \n Undead Shamans: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[76]));
		concatText = ConcatStrings(concatText,"\nПризраков рудокопа: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[78]));
		concatText = ConcatStrings(concatText,"\nДемоникон: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[79]));
		concatText = ConcatStrings(concatText, " \n Orc Warriors: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[80]));
		concatText = ConcatStrings(concatText,"\nДуши: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[81]));
		concatText = ConcatStrings(concatText, " \n Converted Warriors and Lords: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[82]));
		concatText = ConcatStrings(concatText, " \n Sea Turtles: " );
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[83]));
		Log_CreateTopic( " Heroic achievements " , LOG_NOTE );
		Log_AddEntry( " Heroic achievements " ,concatText);
		EXP_MADE_AKT = 25;
	};
};

func void b_reportcount()
{
	var int gameeff;
	var int gametime;
	var int monstctime;
	var string concatText;

	gametime = (TIME_HOUR * 3600) + (TIME_MINUTES * 60);

	if (chapter ==  1 )
	{
		concatText = " - General statistics of the game - " ;
	};

	concatText = ConcatStrings(concatText,"\n\nГлава: ");
	concatText = ConcatStrings(concatText,IntToString(Kapitel));

	if(hero.guild == GIL_NDW)
	{
		concatText = ConcatStrings(concatText, " \n Waterbender Apprentice " );
	}
	else  if (hero.guild ==  GIL_KDW )
	{
		concatText = ConcatStrings(concatText,"\nМаг Воды");
	}
	else if(hero.guild == GIL_KDF)
	{
		concatText = ConcatStrings(concatText,"\nМаг Огня");
	}
	else  if (hero.guild ==  GIL_KDM )
	{
		concatText = ConcatStrings(concatText,"\nТемный маг");
	}
	else  if (hero.guild ==  GIL_GUR )
	{
		concatText = ConcatStrings(concatText, " \n Guru Bratstva " );
	}
	else if(hero.guild == GIL_TPL)
	{
		concatText = ConcatStrings(concatText, " \n Strazh Bratstva " );
	}
	else if(hero.guild == GIL_SLD)
	{
		concatText = ConcatStrings(concatText,"\nНаемник");
	}
	else if(hero.guild == GIL_DJG)
	{
		concatText = ConcatStrings(concatText,"\nДраконоборец");
	}
	else if(hero.guild == GIL_PAL)
	{
		concatText = ConcatStrings(concatText,"\nПаладин");
	};
	if(SBMODE == 1)
	{
		concatText = ConcatStrings(concatText, " \n Difficulty: Hard " );
	}
	else if(SBMODE == 2)
	{
		concatText = ConcatStrings(concatText, " \n nDifficulty Level: Normal " );
	}
	else if(SBMODE == 4)
	{
		concatText = ConcatStrings(concatText, " \n nDifficulty level: Easy " );
	};

	concatText = ConcatStrings(concatText, " \n Matchday: " );
	concatText = ConcatStrings(concatText,IntToString(Wld_GetDay()));
	concatText = ConcatStrings(concatText, " \n Game time (hours:minutes): " );

	if(TIME_HOUR < 10)
	{
		concatText = ConcatStrings(concatText,"0");
	};

	concatText = ConcatStrings(concatText,IntToString(TIME_HOUR));
	concatText = ConcatStrings(concatText," : ");

	if(TIME_MINUTES < 10)
	{
		concatText = ConcatStrings(concatText,"0");
	};

	concatText = ConcatStrings(concatText,IntToString(TIME_MINUTES));
	concatText = ConcatStrings(concatText, " \n Monsters killed: " );

	if (chapter ==  1 )
	{
		Log_CreateTopic(TOPIC_HEROIC,LOG_NOTE);
	};

	Log_AddEntry(TOPIC_HEROIC,concatText);
};
