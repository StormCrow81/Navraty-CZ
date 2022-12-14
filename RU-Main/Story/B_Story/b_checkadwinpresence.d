
func void b_checkadwinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKADW = FALSE;
	}
	else
	{
		CHECKADW = TRUE;
	};
};

func void b_checkoldworldinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKOLDW = FALSE;
	}
	else
	{
		CHECKOLDW = TRUE;
	};
};

instance ITWR_MAP_NEWWORLD_1(C_Item)
{
	name = "Карта Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};

instance ItWr_Map_AdanosValley_1(C_Item)
{
	name = "Древняя плитка астронома";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_Map_AdanosValley;
	description = name;
	text[4] = "Начертания на плитке практически стерты...";
	inv_animate = 1;
};

func void Use_Map_AdanosValley()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AdanosValley.tga",TRUE);
	Doc_SetLevel(Document,"AddonWorld\AdanosValley.zen");
	Doc_Show(Document);
};

instance ITWR_MAP_ORCCITY_1(C_Item)
{
	name = "Схема пещер";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_map_orccity;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Схема пещер подземного города орков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_map_orccity()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_orccity_2.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\ORCCITY.zen");
	Doc_SetLevelCoords(Document,-13000,18300,16800,-19200);
	Doc_Show(Document);
};


instance ITWR_MAP_NEWWORLD_CITY_1(C_Item)
{
	name = "Карта города Хоринис";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_City;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_City()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-6900,11800,21600,-9400);
	Doc_Show(Document);
};


instance ITWR_MAP_OLDWORLD_1(C_Item)
{
	name = "Карта Долины Рудников";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_OldWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ITWR_MAP_OLDWORLD_FOREST_1(C_Item)
{
	name = "Полная карта Долины Рудников";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 450;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_map_oldworld_forest;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_map_oldworld_forest()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorldF.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ITWR_MAP_PSICAMP(C_Item)
{
	name = "Старая карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_PsiCamp;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Карта старого лагеря Братства Спящего...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_PsiCamp()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_PsiCamp.tga",TRUE);
	Doc_Show(Document);
};

instance ITWR_MAP_ORCTEMPEL(C_Item)
{
	name = "Очень старая карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_ORCTEMPEL;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Орочья карта подземного Храма Спящего...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_ORCTEMPEL()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetLevel(Document,"ORCTEMPEL.ZEN");
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_Temple.tga",1);
	Doc_Show(Document);
};

var int Lerne_Einhand;
var int Lerne_Zweihand;

instance ItWr_EinhandBuch(C_Item)
{
	name = "Оборона южных земель";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Оборона южных земель";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseEinhandBuch;
	inv_animate = 1;
};

func void UseEinhandBuch()
{
	var int nDocID;
	var int rnd;

	if (Learn_one-hand ==  FALSE )
	{
		DoLearn1H = TRUE;
		learn_one-hand = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_34 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_34 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Defense of the southern lands " );
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Warriors in the northern part of the country, when facing southern opponents, fight against the agility of the southerners, not their strength. In hot climates, fighters prefer light weapons that provide greater mobility. Because of this, a special style of battle has been developed , which differs significantly from that used in the north. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " A well-known southern warrior maneuver is a one-handed block with a step back. Thanks to the step back, it is possible to reduce the strength of the enemy's attack and, thus, seize an advantageous position that is convenient to use for a counterattack. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItWr_ZweihandBuch(C_Item)
{
	name = " double block " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Double Block " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseZweihandBuch;
	inv_animate = 1;
};

func void UseZweihandBuch()
{
	var int nDocID;
	var int rnd;

	if (Learn_two-hands ==  FALSE )
	{
		DoLearn2H = TRUE;
		Learn_two-hand = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_35 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_35 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Double block " );
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Blocking an opponent's blade with a two-handed weapon is only used when strong enough to stop the attack and force the opponent to break the combo. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Then, in most cases, the enemy's subsequent stop is used to take over the attack and completely bring down the lingering enemy. " );
	Doc_Show(nDocID);
};


instance ITWR_OREBARONARMORLETTER(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_orebaronarmorletter;
	scemeName = "MAP";
	description = " Zapiska " ;
	inv_animate = 1;
};


func void use_orebaronarmorletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I certify that this armor has been repaired. I give permission to take it out of the castle. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				Гомез");
	Doc_Show(nDocID);
};


instance TAGEBUCHOT(C_Item)
{
	name = " Diary " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Diary " ;
	text[ 0 ] = " An old tattered book. " ;
	text[ 1 ] = " It's missing pages. " ;
	on_state[0] = usetagebuchot;
	inv_animate = 1;
};


func void usetagebuchot()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"День 23.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID, 0 , " I've lost track of time. " );
	Doc_PrintLines(nDocID, 0 , " I think it's been twenty-three days since we were captured by orcs and forced to work. " );
	Doc_PrintLines(nDocID, 0 , " The work is very hard, and these creatures do not know mercy. Those who are weak, have long been in the grave! " );
	Doc_PrintLines(nDocID, 0 , " I'll run away from here, they can't stop me! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"День 28.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID, 0 , " We should continue to dig deeper into the mountain. " );
	Doc_PrintLines(nDocID, 0 , " We've already dug a huge cave, but I still don't know what all this is for. " );
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"День 67.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID, 1 , " Someone told me these orc shamans don't have hearts anymore, but how do they live then? " );
	Doc_PrintLines(nDocID, 1 , " I also saw the sword that shamans are so afraid of. How I wish I could pierce them all with this sword. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"День 78.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID, 1 , " The sword lies in one of the halls in front of the temple. It is guarded by one of the shamans. " );
	Doc_PrintLines(nDocID, 1 , " I'll get out of here. I'm going to leave this diary here. Maybe it will be useful to someone. " );
	Doc_Show(nDocID);
};


instance ITWR_BLOODFLY_01(C_Item)
{
	name = "Шершни";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Шершни";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_bloodfly_01;
	inv_animate = 1;
};


func void useitwr_bloodfly_01()
{
	var int nDocID;
	var int cost;
	var int rnd;

	if(READ_BLOODFLY == FALSE)
	{
		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		READ_BLOODFLY = TRUE;
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print( " Learned the skill of cutting prey - 'Cut the sting' " );
		B_LogEntry(TOPIC_TalentAnimalTrophy, " ...cut the stingers off the blood hornets. " );
		Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_36 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_36 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Шершни");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID, 0 , " Oh hornets. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " But where the earth is flooded with water and the air is heavy, huge hornets live, attracted by the smell of a living body. They kill their prey with poison and drink its blood. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Removing the sting from the hornet's body is quite difficult, but a good hunter should be able to do it. You need to make a deep incision to separate it from the surrounding tissues with a knife, and carefully remove it. You can use it after the blood has drained. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ASTRONOMIE(C_Item)
{
	name = " Ancient Astronomy " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Ancient astronomy " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = useastronomie_s1;
	inv_animate = 1;
};

func void useastronomie_s1()
{
	var int nDocID;
	var int rnd;

	if(ASTRAL_ONCE == FALSE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,2);
		AI_Print(PRINT_READASTRAL);
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		ASTRAL_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_37 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_37 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " In the center of everything is Morgrad and its four elements: Darkness, Stone, Water and Fire. The celestial sphere covers the whole world. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " In the hierarchy of creations, a person takes the place of a successor. The soul connects him with the higher being, the divine spirit, and the transient body consists of the matter of Morgrad. It reflects the picture of the whole world. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " After the battle of the gods, Darkness is separated from Morgrad. The abode of death and its patron Beliar hide in the depths of inexpressible darkness that which is disgusting to the living. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " At the behest of Beliar, Darkness casts its guides into Morgrad. Adanos watches over the preservation of life and balance in the world. The will of Innos bestows light and warmth on the world. " );
	Doc_Show(nDocID);
};


instance ITWR_DEMONLANG(C_Item)
{
	name = " Demon Language " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Demon Language " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_demonlang_s1;
	inv_animate = 1;
};


func void use_demonlang_s1()
{
	var int nDocID;
	var int rnd;

	if (( KNOWDEMENTORLANGUAGE  ==  FALSE ) && (hero.lp >=  10 )) ;
	{
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		PLAYER_TALENT_FOREIGNLANGUAGE[3] = TRUE;
		AI_Print( " Learned ancient demon language... " );
		B_LogEntry(TOPIC_Language,LOGTEXT_ADDON_LANGUAGE_4);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		KNOWDEMENTORLANGUAGE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		hero.lp = hero.lp - 10;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else if((KNOWDEMENTORLANGUAGE == FALSE) && (hero.lp < 10))
	{
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(hero,hero,"$DONTREADYFORTHIS");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if(KNOWDEMENTORLANGUAGE == TRUE)
	{
		if((BookBonus_38 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_38 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " What is called the Demon Language is not really such. Those who know it are able to understand and speak with the highest representatives of this species. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " But its true value is that the deepest mysteries, dating back to the creation of the world, are written exclusively in this language. Each of these texts is a real treasure, if you understand its meaning. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " In addition, this is the language of the Dark God. All creatures created by Beliar and subject to him are able to understand ancient speech. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " Because it speaks to the strongest subjects and carries its divine will into their minds, it is called the Demon Tongue. " );
		Doc_Show(nDocID);
	};
};

var int god1_once;
var int god2_once;
var int god3_once;

instance TEACHING_DER_GOETTER1 (C_Item)
{
	name = " Teachings of the Gods - Volume 1 " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Teachings of the gods " ;
	text[0] = "Том 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = uselehren_der_goetter1_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter1_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD1_ONCE == FALSE)
	{
		GOD1_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
		B_GivePlayerXP(100);

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_39 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_39 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Hear the words of the gods, for it is their will that the words be heard. Follow the teachings of the gods, for it is their will that the teachings be followed. Listen to the priests, for they have been chosen. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Words of Innos: Do not doubt the words of the priests, even if you cannot understand their meaning, this will become evidence of truth and wisdom. I am the rising sun, light and life. To go against the sun means to go against me. Those who do so bring upon themselves a curse. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Words of Adanos: Work and live, for the day was created for man to work. Learn and seek knowledge to pass on to others, for such is the nature of man. The lazy and idle bring upon themselves a curse. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Words of Beliar: Those who act against the laws of justice and the will of the gods will be punished by me. His body will know pain, suffering and death, and the spirit will remain forever in the realm of shadows. " );
	Doc_Show(nDocID);
};


instance TEACHING_DER_GOETTER2 (C_Item)
{
	name = " Teachings of the Gods - Volume 2 " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Teachings of the gods " ;
	text[0] = "Том 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = uselehren_der_goetter2_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter2_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD2_ONCE == FALSE)
	{
		GOD2_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_40 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_40 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " There was neither day nor night, and nothing living burdened the world. But then Innos appeared to the world, and his light illuminated everything. Innos gave life to the world. But nothing living could live in the light of Innos, and then he created the sun. But his light was still too strong. Then Innos separated a part of himself and created Beliar. Beliar brought the world night. And then people came into the world. Innos separated another part from himself and created Adanos. Adanos gave people many desires, knowledge, curiosity and courage. And Innos was pleased with his creations. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " And he decided to transfer people under the protection of Adanos and rested from his deeds. Beliar was angry with people, because they did not want to see him as their patron and rested at night when his time came. And then he created a man for himself But this man was no different from other people. Anger filled the heart of Beliar, and he killed the man he created and so said: "They do not worship me, so let the thought of me fill them with horror." And he created death and took from people their lives. " );
	Doc_Show(nDocID);
};


instance TEACHING_DER_GOETTER3 (C_Item)
{
	name = " Teachings of the Gods - Volume 3 " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Teachings of the gods " ;
	text[0] = "Том 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter3_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter3_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD3_ONCE == FALSE)
	{
		GOD3_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_41 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_41 = TRUE ;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Innos gave people the ability to hear him and talk to him. Some of them he gave the ability to perform great miracles. He called it magic. With its help, people could change the world at will, and initially this desire was nothing unlimited. So people got access to the divine powers of creation. But they were all equal among themselves, and they did not like it. And then he took the power of those who were dissatisfied. Those few who were grateful for the magical gift, put Innos is higher than the other gods. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " These people were respected and feared and were called priests. But even many of them were dissatisfied with the abilities of the strongest. And then they called on Adanos, and he let them forget about their abilities. The group of priests broke up, and the countless wars. Memories of the power of the gods became nothing more than a myth. So the priests divided. Those who followed Adanos were called the magicians of Water, and the chosen ones of Innos were called fire magicians. " );
	Doc_Show(nDocID);
};


var int magicore_once;

instance THE_MAGIC_ORE (C_Item)
{
	name = " Magic Ore " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Magic ore " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = usedas_magic_ore_s1;
	inv_animate = 1;
};


func void usedas_magic_ore_s1()
{
	var int nDocID;
	var int rnd;

	if ( READ_MAGIC_ORE  ==  FALSE )
	{
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 5;
		READ_MAGICAL_ERZ = TRUE ;
	};
	if((MAGICORE_ONCE == FALSE) && (KNOWHOWPICKORE == FALSE))
	{
		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};
		if(HERO_HACKCHANCEORE >= 90)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,4);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,3);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,2);
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,1);
		};

		AI_Print(PRINT_LEARNPICKORE);
		Npc_SetTalentValue(self,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		MAGICORE_ONCE = TRUE;
		KNOWHOWPICKORE = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");

		if(ORE_TOPIC_EXIST == TRUE)
		{
			B_LogEntry( TOPIC_MAGICORE , " Now I can mine magic ore from rock. " );
		}
		else
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			B_LogEntry( TOPIC_MAGICORE , " Now I can mine magic ore from rock. " );
			ORE_TOPIC_EXIST = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " Magic ore " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The best ore for swords is without a doubt found in the mines of Khorinis. It is the purest ore in the world. It contains magical energy, has unsurpassed durability, and at the same time is easy to process. From this ore, mined in the dark depths of the mines of Khorinis, the best weapons are being forged, with which no blade forged from ordinary steel can be compared. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " There is no shield or armor that can withstand it. The kings and heroes of ancient times carried weapons made of the best steel of Khorinis, and they were highly valued throughout Myrtana. But magic ore is very expensive. A lot strength is spent on its extraction. It seems as if the ore itself does not want to leave the bowels of the earth. " );
	Doc_Show(nDocID);
};

instance ItWr_GoldMake(C_Item)
{
	name = " Smelting Gold " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Smelting Gold " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_GoldMake;
	inv_animate = 1;
};

func void Use_ItWr_GoldMake()
{
	var int nDocID;
	var int rnd;

	if(KNOWHOWTOOREFUSGOLD == FALSE)
	{
		KNOWHOWTOOREFUSGOLD = TRUE;
		AI_Print( " Learned : gold smelting " );
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		B_LogEntry( TOPIC_STEELDRAW , " Now I can smelt gold into bars. Twenty-five gold nuggets are required to get it. " );
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " Gold smelting " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " It takes about a quarter of a hundred gold nuggets to produce one ingot. Gold is placed in a forge, brought to the desired temperature and poured into a mold through a sieve. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

var int warrant1_once;
var int warrant2_once;

instance BATTLE_UM_VARANT1 (C_Item)
{
	name = " Battle of Varant " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Battle of Varant " ;
	text[0] = "Том 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = useschlacht_um_varant1_s1;
	inv_animate = 1;
};


func void useschlacht_um_varant1_s1()
{
	var int nDocID;
	var int rnd;

	if ( VARANT1_ONCE  ==  FALSE )
	{
		VARANT1_ONCE = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(500);
		B_Say(self,self,"$HOWINTEREST");

		if((VARANT1_ONCE == TRUE) && (VARANT2_ONCE == TRUE))
		{
			DoLearn1H = TRUE;
			DoLearn2H = TRUE;
			Snd_Play("Levelup");
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_43 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_43 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... but King Rhobar decided to attack first. He gathered his troops and sent all his forces to the weakened left flank of the enemy army. He decided not to waste time and arrows, and the swords of his troops easily dealt with the enemies. He sent his soldiers further, to the borders of Varant.He knew that in order to win this battle, it was necessary to divide the enemy army and make sure that the forces of Hellon and Lukkor could not ... " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " ... teamed up and dealt him a crushing blow. He needed to call for reinforcements immediately, otherwise the victory would have gone to the enemy... " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " ...Gellon was killed, his army was defeated, his soldiers fled from the battlefield. But Rhobar did not want to give the defeated a single chance to gather together and ordered to destroy all who remained alive. " );
	Doc_Show(nDocID);
};


instance BATTLE_UM_VARANT2 (C_Item)
{
	name = " Battle of Varant " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Battle of Varant " ;
	text[0] = "Том 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = useschlacht_um_varant2_s1;
	inv_animate = 1;
};


func void useschlacht_um_varant2_s1()
{
	var int nDocID;
	var int rnd;

	if ( VARANT2_ONCE  ==  FALSE )
	{
		VARANT2_ONCE = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
		B_GivePlayerXP(500);

		if((VARANT1_ONCE == TRUE) && (VARANT2_ONCE == TRUE))
		{
			DoLearn1H = TRUE;
			DoLearn2H = TRUE;
			Snd_Play("Levelup");
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_44 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_44 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The outcome of the war was known. Varant, captured by foreigners, was completely plundered. King Rhobar decided not to stay on the fields of Varant, but ordered his generals to deal with the remaining enemies themselves. There were still troops in the defeated state, led by Lukkor , the most capable commander of Varant. He fought many brilliant battles. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " But now his army was ambushed. The enemy soldiers were preparing to attack. Li, one of Myrtana's best generals, had him trapped. Varant's heavy cavalry could not fight in the wetlands. The entire valley was surrounded by the general's soldiers Lee, who attacked the enemies and killed them one by one. Desperate attempts to get out of the trap were unsuccessful. He was defeated. " );
	Doc_Show(nDocID);
};


instance ITWR_SOULRIVER(C_Item)
{
	name = " Sacrificial Souls " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_soulriver_open;
	inv_animate = 1;
};


func void use_soulriver_open()
{
	var int nDocID;
	var int rnd;

	if(READ_SOULRIVER == FALSE)
	{
		B_LogEntry( TOPIC_MORIUSTEST , " I read the book that Morius was talking about. It tells how to extract from the soul. After preparing this extract, it should be sprinkled on one of the altars of the deity to whom I want to sacrifice. " );
		B_LogEntry_Quiet( TOPIC_MORIUSTEST , " To make a soul extract, I need an orb that stores the creature's soul, sulfur, aquamarine, black pearl, mana essence and swamp grass shoot. Next, you need to mix all the ingredients on the alchemy table, then heat it in a laboratory flask and distill it in a separate vessel extract of the solution I received. " );
		READ_SOULRIVER = TRUE;
		SOULRIVER = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_45 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_45 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Since ancient times, the soul of any creature of this world was considered one of the most valuable offerings to the gods. Those who offered it, the gods usually showed their divine mercy and protection. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Sometimes even the most serious sins were forgiven if the apostate sacrificed such a gift. In addition, it was necessary to have the knowledge to extract the soul of a creature without damaging its divine essence and structure. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " To make this offering, it is necessary to prepare an extract from the soul of the creature that will serve as a sacrifice. Then, it was necessary to say a prayer to the deity and sprinkle his sacred altar. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " To prepare an extract, the following ingredients are needed: an orb that stores the creature's soul, aquamarine, sulfur, black pearl, mana essence and swamp grass shoot as a reagent. " );
	Doc_Show(nDocID);
};

instance ItWr_Azgolor(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[ 4 ] = " The book has strange symbols that look like spells. " ;
	on_state[0] = Use_Azgolorbook_Open;
	inv_animate = 1;
};

func void Use_Azgolorbook_Open()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(READ_AZGOLORBOOK == FALSE)
	{
		READ_AZGOLORBOOK = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		SEEKAZGOLOR = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		if(KNOWDEMENTORLANGUAGE == TRUE)
		{
			if(READ_AZGOLOR == FALSE)
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"I found a strange book in an underground temple. Apparently the text of the book is written in the language of demons - ...(the lessons of the guardians were not in vain for me). It tells how to use an ancient artifact called the Eye of Wrath to summon to this world of the powerful black dragon, Azgalor - the lord of demons. Apparently, first of all, it is necessary to awaken the Eye itself from sleep. To do this is simple - on the alchemy table, you need to select the essence from the blood of an orc and a demon, adding five lumps of sulfur, and after the resulting solution sprinkle the artifact itself.After awakening, a sacred ritual should be performed and with the help of the Words of Power and the power of the artifact, the creation of darkness will come to the call of the caster.");
				READ_AZGOLOR = TRUE;
			};
			if((BookBonus_46 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{	
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print( " Intelligence + 1 " );
				BookBonus_46 = TRUE ;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , "The Eye of Wrath is a powerful ancient artifact that can be used to summon a sinister creature of darkness into this world - a powerful black dragon, Azgalor, the demon lord. " );
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID, 0 , " If someone intends to do this, he must first awaken the Eye itself, filling it with demonic power, the call of which no creature of darkness can withstand. " );
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " In order to restore magical power to an artifact, you need to select an essence from the blood of an orc and a demon, adding five lumps of sulfur to it, and then sprinkle the Eye of Wrath itself with the resulting solution. " );
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID, 1 , " After awakening the Eye of Wrath, it is necessary to perform a sacred ritual and summon the Great Shadow to this world, using the Words of Power and the power of the artifact. " );
			Doc_Show(nDocID);
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
			B_LogEntry( TOPIC_URNAZULRAGE , " I found a strange book in an underground temple, written in a language I don't understand. I'll have to look for someone who can read it. " );
		};
	};
};


instance ITWR_INNOSPRAY(C_Item)
{
	name = " Prayer Book of the Chosen One " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_innospray_open;
	inv_animate = 1;
};


func void use_innospray_open()
{
	var int nDocID;

	if(MARDUK_BOOKREAD == FALSE)
	{
		B_LogEntry( TOPIC_MAGICINNOSARMOR , " I now know the Chosen One's prayer for the paladin or knight's ore armor ritual. " );
		MARDUK_BOOKREAD = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	};
	if((BookBonus_47 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_47 = TRUE ;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Prayer of the Chosen One " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " O mighty lord, Innos, " );
	Doc_PrintLines(nDocID, 1 , " give your blessing to your chosen one, " );
	Doc_PrintLines(nDocID, 1 , " entrust him with your strength and wisdom, " );
	Doc_PrintLines(nDocID, 1 , " so that he can resist the dark evil! " );
	Doc_Show(nDocID);
};


instance ITWR_HAGENORDERFORT (C_Item)
{
	name = " Order of Lord Hagen " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_hagenorderfort;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};


func void use_itwr_hagenorderfort()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "          Order " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " This document gives its owner unhindered and unlimited access to Fort Azgan. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Hagen " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance itwr_pyrorderfort(C_Item)
{
	name = " Pyrocar Pass " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_pyrorderfort;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

func void use_itwr_pyrorderfort()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "          Order " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " This document gives its owner unhindered and unlimited access to Fort Azgan. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Archmage of Fire, Pyrokar " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_WATERMAGELETTER(C_Item)
{
	name = " Message from the Water Mages " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_watermageletter;
	scemeName = "MAPSEALED";
	description = name;
	text[ 2 ] = " Letter to Saturasa k Lordu Hagenu. " ;
	inv_animate = 1;
};


func void use_itwr_watermageletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Dear Lord Hagen! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I ask you to order to protect the magical portal, which we discovered while exploring the ancient ruins of the pyramids on the Sereb Khorinis. In order to avoid various kinds of trouble. I think you understand what I mean. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " 		Saturas, head of the Water Mages " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_TYONRECEPT(C_Item)
{
	name = " Recipe " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Recipe for the Mind Transformation Elixir " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_tyonrecept;
	inv_animate = 1;
};


func void use_itwr_tyonrecept()
{
	var int nDocID;

	if(NEORASCANTEACHRECEPTFORKDF == FALSE)
	{
		NEORASCANTEACHRECEPTFORKDF = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Ingredients for making the elixir: " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
	Doc_PrintLine(nDocID, 0 , " Aquamarine " );
	Doc_PrintLine(nDocID, 0 , " Black Pearl " );
	Doc_PrintLine(nDocID, 0 , " Fiery tongue " );
	Doc_PrintLine(nDocID, 0 , " Swamp " );
	Doc_PrintLine(nDocID, 0 , " Fireroot " );
	Doc_PrintLine(nDocID, 0 , " Crawler Mandible " );
	Doc_PrintLine(nDocID, 0 , " Stone Golem Heart " );
	Doc_PrintLine(nDocID, 0 , " Crawler Egg " );
	Doc_PrintLine(nDocID, 0 , " Royal sorrel " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_TYONLIST(C_Item)
{
	name = " Idol of Tion List " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_tyonlist;
	scemeName = "MAP";
	description = " Idol of Tion List " ;
	inv_animate = 1;
};


func void use_itwr_tyonlist()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " List of ingredients: " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Crawler Egg " );
	Doc_PrintLine(nDocID, 0 , " Stone Golem Heart " );
	Doc_PrintLine(nDocID, 0 , " Royal sorrel " );
	Doc_PrintLine(nDocID, 0 , " Fiery tongue " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_FIRELIGHT(C_Item)
{
	name = " Magic formula for Shroud of Fire " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " Contains the structure of the spell " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance itwr_FireMeteor(C_Item)
{
	name = " Magic formula of the spell 'Meteorite' " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " Contains the structure of the spell " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_TELEKINESIS(C_Item)
{
	name = " Magic formula for the spell 'Spirit Absorption' " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " Contains the structure of the spell " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_CONTROL(C_Item)
{
	name = " Magic formula of the spell 'Hypnosis' " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " Contains the structure of the spell " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_GuruWrath(C_Item)
{
	name = " Magic formula for 'Elemental Wrath' " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " Contains the structure of the spell " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_KALOMSRECIPE(C_Item)
{
	name = " Cor Galom Recipe " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 0 ] = " Swamp Bog Processing Recipe " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_kalomsrecipe;
	inv_animate = 1;
};


func void use_itwr_kalomsrecipe()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Recipe for processing a bog. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " To make the best varieties of bogweed, you need to grind it with meadow knotweed and dry it thoroughly. And you will also need more of the bogweed itself! This will create the correct concentration of magical essence. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                - Галом");
	Doc_Show(nDocID);

	if((KNOW_JOINTRECIPE == FALSE) && Npc_IsPlayer(self))
	{
		B_GivePlayerXP(50);
		KNOW_JOINTRECIPE = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		Log_CreateTopic(TOPIC_TalentHerb,LOG_NOTE);
		B_LogEntry(TOPIC_TalentHerb, " 'Northern Dark' requires four bog stalks and meadow knotweed to make. " );
		B_LogEntry_Quiet(TOPIC_TalentHerb, " Eight Bogweed and Meadowweed are required to make 'Dream Call'. " );
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_48 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_48 = TRUE ;
	};
};


instance ITWR_FERNANDOLETTER(C_Item)
{
	name = " Letter of recommendation from Fernando " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for Larius. " ;
	text[ 3 ] = " It mentions the positive qualities of Gallahad. " ;
	inv_animate = 1;
};

instance ITWR_LUTEROLETTER(C_Item)
{
	name = " Luthero ' s letter of recommendation " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for Larius. " ;
	text[ 3 ] = " It mentions the positive qualities of Gallahad. " ;
	inv_animate = 1;
};

instance ITWR_GERBRANTLETTER(C_Item)
{
	name = " Gerbrandt ' s letter of recommendation " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for Larius. " ;
	text[ 3 ] = " It mentions the positive qualities of Gallahad. " ;
	inv_animate = 1;
};

instance ITWR_SALANDRILLETTER(C_Item)
{
	name = " Letter of recommendation from Salandril " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for Larius. " ;
	text[ 3 ] = " It mentions the positive qualities of Gallahad. " ;
	inv_animate = 1;
};

instance ITWR_VALENTINOLETTER(C_Item)
{
	name = " Valentino ' s letter of recommendation " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for Larius. " ;
	text[ 3 ] = " It mentions the positive qualities of Gallahad. " ;
	inv_animate = 1;
};

instance ITWR_TALIASANRECOMENDEDLETTERS(C_Item)
{
	name = " Bunch of papers " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " A bunch of reference letters for Larius. " ;
	text[ 3 ] = " They mention Gallahad's good qualities. " ;
	inv_animate = 1;
};

instance ITWR_ZURISDOCS(C_Item)
{
	name = " Stack of documents " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Proof of ownership " ;
	text[ 3 ] = " to Jora's trading place. Owner's name is missing. " ;
	text[ 4 ] = " The documents are signed by Zuris. " ;
	inv_animate = 1;
};

instance ITWR_MANIAC(C_Item)
{
	name = " Symptoms of Mania " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_maniac;
	description = " Symptoms of mania " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itwr_maniac()
{
	var int nDocID;
	var int rnd;

	if(MANIAC_ONCE == FALSE)
	{
		B_GivePlayerXP(250);
		MANIAC_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_49 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_49 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " Mania Skeletons " );
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID, 0 , " During my travels, I most often encountered this disease among cultists. In such communities, the disease is difficult to recognize, and it spreads much faster. Strange behavior of cultists is considered a gift from above. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID, 1 , " It's not even worth mentioning. I had to put up with the fact that people who behave abnormally are mistaken for the chosen ones of the gods. The most interesting case of the disease I observed was in a madman who kept repeating the same thing and the same: 'The sleeper will wake up'. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ITWR_RHETORIKBOOK(C_Item)
{
	name = " Fundamentals of Rhetoric " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_rhetorikbook;
	description = " Rhetoric Tutorial " ;
	inv_animate = 1;
};

func void use_itwr_rhetorikbook()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_01 == FALSE)
	{
		READBOOKSDONE_01 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  2 ;
			AI_Print( " Rhetoric + 2 " );
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
		Snd_Play("LevelUP");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_50 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_50 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_Red_R.tga",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " Rhetoric " );
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " 1. Speak clearly. Simplify complex sentences! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " 2. Watch your body language. Facial expressions and gestures should respond to " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID, 1 , " what you say. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " 3. Watch the interlocutor's reaction. Based on this, you can predict his thoughts and expectations. " );
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " 4. You must carefully consider your arguments and speak only to the point. " );
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " 5. A good end to the whole thing. The impression of your speech depends on how you finish it. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ITWR_GERBRANDSECLET (C_Item)
{
	name = " Gerbrandt 's Sealed Letter " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gerbrandseclet;
	scemeName = "MAPSEALED";
	description = name;
	text[ 2 ] = " Gerbrandt's letter to the man in the tavern. " ;
	inv_animate = 1;
};


func void use_itwr_gerbrandseclet()
{
	var int nDocID;
	CreateInvItems(self,itwr_gerbrandseclet_open, 1 );
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Help me fix my problems with a man named Wambo. You know what to do. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " PS A purse containing payment for your services is attached to the letter. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_GERBRANDSECLET_OPEN (C_Item)
{
	name = " Gerbrandt 's letter " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[ 0 ] = use_itwr_gerbrandseclet_open;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Gerbrandt's letter to the man in the tavern. " ;
	inv_animate = 1;
};


func void use_itwr_gerbrandseclet_open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Help me fix my problems with a man named Wambo. You know what to do. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " PS A purse containing payment for your services is attached to the letter. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_HROMANIN_1(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chromanin Part I " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_1;
	inv_animate = 1;
};

func void use_itwr_hromanin_1()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " He who is ready to give up all earthly passions and follow the paths of truth must find out where the source of my power is hidden. Finding it, he will be able to destroy everything that connects him to this world, and show that he is ready to accept Chromanin's knowledge. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Under the shadow of the old dark rocks, stones were crushed for the sake of gold. They stumbled upon the crypt and retribution ... came. That terrible hour has come! " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_01 == FALSE)
	{
		READ_HROMANIN_01 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};
	if(CHAPTER1 == FALSE)
	{
		MIS_HROMANINQUEST = LOG_Running;
		Snd_Play("FoundRiddler");
		Log_CreateTopic(TOPIC_HROMANINQUEST,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_Running);
		B_LogEntry( TOPIC_HROMANINQUEST , " I found a very strange book - Chromanin! It seems that its author writes in complete riddles...'Under the shadow of old dark rocks, stones were crushed for gold. They stumbled upon the crypt and retribution...came. That terrible hour has come! ' Hmm! I don't understand anything yet, but maybe it's just not time yet. " );
		CHAPTER1 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == ABANDONEDMINE_ZEN)
		{
			Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_01");
			Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_02");
			Wld_InsertNpc(skeleton,"AM_HROMANIN_GUARD_03");
			Wld_InsertItem(ITWR_HROMANIN_2,"FP_ITEM_HROMANIN_02");
			CHAPTER2_Insert = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_51 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_51 = TRUE ;
	};
};


instance ITWR_HROMANIN_2(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chromanin Part II " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_2;
	inv_animate = 1;
};


func void use_itwr_hromanin_2()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Chromanin's wind-blown visions revealed the future before me. I was ready to give everything for believing in him, but even that wouldn't be enough. They shook me to the core. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Who disturbed the dead in peace of the dark rocks. Life itself long ago left and became dead flesh. That cave is filled with pain, evil and fear. And the underground lake is covered with ancient darkness. " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_02 == FALSE)
	{
		READ_HROMANIN_02 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};
	if(CHAPTER2 == FALSE)
	{
		B_GivePlayerXP(100);
		Snd_Play("FoundRiddler");
		B_LogEntry( TOPIC_HROMANINQUEST , " I found a second book called Chromanin. And again, only riddles... 'Who disturbed the dead in peace of dark rocks. Life itself left long ago and became dead flesh. That cave is filled with pain, evil and fear. And the underground lake covered with ancient darkness.' " );
		CHAPTER2 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == DEMONCAVE_ZEN)
		{
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_01");
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_03");
			Wld_InsertItem(ITWR_HROMANIN_3,"FP_ITEM_HROMANIN_03");
			CHAPTER3_Insert = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_52 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_52 = TRUE ;
	};
};


instance ITWR_HROMANIN_3(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chromanin Part III " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_3;
	inv_animate = 1;
};


func void use_itwr_hromanin_3()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Oh gods of ancient times! Is it possible for a man like me, unworthy, to have this power. How great is the fear of losing everything by uttering the slightest word of doubt. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Ore and blood, melancholy and sweat...retribution will overtake sins there. Power and gold will cover the eye sockets - the curse of souls will fall on everyone! " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_03 == FALSE)
	{
		READ_HROMANIN_03 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};
	if(CHAPTER3 == FALSE)
	{
		B_GivePlayerXP(250);
		Snd_Play("FoundRiddler");
		B_LogEntry( TOPIC_HROMANINQUEST , " I found the third book. It looks like I'm starting to understand what's the matter! ...'Ore and blood, melancholy and sweat... there will be retribution for sins. Power and gold will blind the eye sockets - the curse of souls on all fall!' " );
		CHAPTER3 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDMINE_ZEN)
		{
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_02");
			Wld_InsertNpc(SkeletonMage,"OM_HROMANIN_GUARD_03");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_05");
			Wld_InsertItem(ITWR_HROMANIN_4,"FP_ITEM_HROMANIN_04");
			CHAPTER4_Insert = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_53 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_53 = TRUE ;
	};
};


instance ITWR_HROMANIN_4(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chromanin, Part IV " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_4;
	inv_animate = 1;
};


func void use_itwr_hromanin_4()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I don't even dare to hope to ever experience Chromanin myself. Gone are the days of wasting and empty words. Now it will be so easy to achieve fulfillment, and very soon I will. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Water and stone, life and death! The light will go out in the depths of those. Come to where you have been, covering yourself with ore from the rocks! " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_04 == FALSE)
	{
		READ_HROMANIN_04 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};
	if(CHAPTER4 == FALSE)
	{
		B_GivePlayerXP(500);
		Snd_Play("FoundRiddler");
		B_LogEntry( TOPIC_HROMANINQUEST , " Book number four. Is this guy just trying to fool my head?! ...'Water and stone, life and death! rocks!' " );
		CHAPTER4 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == DEMONSTOWER_ZEN)
		{
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"DT_HROMANIN_GUARD_03");
			Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_05");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_06");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_07");
			Wld_InsertItem(ITWR_HROMANIN_5,"FP_ITEM_HROMANIN_05");
			CHAPTER5_Insert = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_54 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_54 = TRUE ;
	};
};


instance ITWR_HROMANIN_5(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chromanin Part V " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_5;
	inv_animate = 1;
};


func void use_itwr_hromanin_5()
{
	var int nDocID;
	var C_Npc riddler;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " But I will not embark on this path alone. I will have to share the power hidden in me with a worthy one who will find me. I hope my wait will not drag on for a long time... " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " For centuries there was a stronghold of silence, threatening the enemies with stones of the walls. Only dust and decay remained there, and the harpies' angry moaning. " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_05 == FALSE)
	{
		READ_HROMANIN_05 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};
	if(CHAPTER5 == FALSE)
	{
		B_GivePlayerXP(750);
		B_LogEntry( TOPIC_HROMANINQUEST , " Maybe this is the last?! I can't wait to find out what it all means. 'For centuries there was a bastion of silence, threatening enemies with walls. Only dust and decay remained there, and angry moans of harpies.' " );
		Snd_Play("FoundRiddler");
		CHAPTER5 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_HROMANIN_GUARD_03");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Hrom,"OW_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_05");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_06");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_07");
			CHAPTER6_Insert = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_55 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_55 = TRUE ;
	};
};

instance ITWR_HROMANIN_6(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chromanin Part VI " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_6;
	inv_animate = 1;
};


func void use_itwr_hromanin_6()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Death is just the beginning... " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " A skillful soothsayer has charted the path for the toy! He is waiting for the fool in the trap. Get back into it, quickly... " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_06 == FALSE)
	{
		READ_HROMANIN_06 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};
	if(CHAPTER6 == FALSE)
	{
		B_GivePlayerXP(1000);
		Snd_Play("FoundRiddler");
		B_LogEntry( TOPIC_HROMANINQUEST , " I have a feeling the answer is close...'The artificer has charted the path for the toy! He's waiting for the fool in the trap. Get back into it, quickly...' " );
		CHAPTER6 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc(skeleton_lord_kadar,"OW_UNDEAD_DUNGEON_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"STONEHENGE");
			Wld_InsertNpc(skeleton_warrior_dark,"STONES");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_PATH_3_13");
			Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_STONES_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_STONES_02");
			Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_OW_PATH_3_13_02");
			HromGuard_Insert = TRUE;
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_56 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_56 = TRUE ;
	};
};

instance ITWR_HROMANIN(C_Item)
{
	name = "The Old Book " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_ITWR_HROMANIN;
	inv_animate = 1;
};

func void use_ITWR_HROMANIN()
{
	var int nDocID;
	var int rnd;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Death is just the beginning... " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " So, the essence or the soul? After all, someone's life, then someone's food. You will absorb more than a thousand souls and eternity will become good! " );
	Doc_Show(nDocID);

	if(READ_HROMANIN_ALL == FALSE)
	{
		B_GivePlayerXP(2000);
		READ_HROMANIN_ALL = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );

		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_57 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_57 = TRUE ;
	};
};

instance ITWR_NIGELLETTER(C_Item)
{
	name = " Nigel ' s letter of recommendation " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for a Luthero merchant. " ;
	text[ 3 ] = " It mentions my good qualities and " ;
	text[ 4 ] = " Nigel asks Luthero to accept me into the Traders Guild. " ;
	inv_animate = 1;
};

instance ITWR_EROLLETTER(C_Item)
{
	name = " Erol ' s letter of recommendation " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Recommendation letter for a Luthero merchant. " ;
	text[ 3 ] = " It mentions my good qualities and " ;
	text[ 4 ] = " Erol asks Luthero to accept me into the Traders Guild. " ;
	inv_animate = 1;
};

instance ITWR_BENGARORDERLETTER(C_Item)
{
	name = " List of products from Luthero " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Letter addressed to Bengar from merchant Luthero. " ;
	text[ 3 ] = " It contains a list of required goods " ;
	text[ 4 ] = " for the next batch. " ;
	inv_animate = 1;
};

instance ITWR_GOMEZMAGICWORDS(C_Item)
{
	name = " Note Gomez " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gomezmagicwords;
	scemeName = "MAP";
	description = name;
	text[ 3 ] = " It contains magic words to call " ;
	text[ 4 ] = "The souls of the Firebenders who died at the hands of Gomez. " ;
	inv_animate = 1;
};


func void use_itwr_gomezmagicwords()
{
	var int nDocID;
	if((Npc_GetDistToWP(hero,"OC_MAGE_CENTER") <= 200) && (RESCUEGOMEZSTEPTHREE == TRUE) && (RESCUEGOMEZSTEPTHREEDONE == FALSE) && (FIREMAGECOMES == FALSE))
	{
		Snd_Play("MFX_SPAWN_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_InsertNpc(none_105_correct, " OC_CORRIST " );
		Wld_InsertNpc(none_106_rodriguez,"OC_RODRIGUEZ");
		Wld_InsertNpc(none_107_damarok,"OC_DAMAROK");
		Wld_InsertNpc(none_108_drago,"OC_DRAGO");
		Wld_InsertNpc(none_109_torrez,"OC_TORREZ");
		FIREMAGECOMES = TRUE;
		B_LogEntry( TOPIC_RESCUEGOMEZ , " I summoned the souls of Corristo and the Firebenders that Gomez killed. Now I need to talk to them. " );
	}
	else
	{
		AI_Print( " Nothing happened... " );
		Snd_Play("MFX_MASSDEATH_CAST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " FAR ACTUS BEK NOR CAR... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_MARTIAL ARTS (C_Item)
{
	name = " Master Mecha " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Master Mecha " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = use_itwr_martial arts;
	inv_animate = 1;
};


func void use_itwr_martial arts()
{
	var int nDocID;
	var int rnd;

	if(LEARN_MASTER == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearn1H = TRUE;
		DoLearn2H = TRUE;
		LEARN_MASTER = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_58 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_58 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " For two thousand years, this master's teachings have guided the development of the art of combat. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Agility, composure, speed, observation and quick reaction are the qualities that need to be trained. If a fighter wants to reach the heights of mastery, his movements must become well coordinated and well-calibrated. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The essence of the master's teaching about the unity of spirit and body has passed through centuries. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The perfection he achieved left an indelible mark. Epochs changed and the world changed, but the doctrine of the harmony of internal forces and body movements is still alive. " );
	Doc_Show(nDocID);
};


instance ITWR_ELEMENTAREARCANEI(C_Item)
{
	name = " Magic knowledge " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Magic knowledge " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_elementarearcanei;
	inv_animate = 1;
};


func void use_itwr_elementarearcanei()
{
	var int nDocID;
	var int rnd;

	if(ELEMENTARE_ONCE == FALSE)
	{
		B_GivePlayerXP(10);
		B_RaiseAttribute(self,ATR_MANA_MAX,5);
		AI_Print(PRINT_READASTRAL);
		ELEMENTARE_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_59 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_59 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Magic knowledge " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Classification of magic according to earthly notions. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Long years of research into magic and its place in the world have borne fruit. We can already say that magic is an absolute element of the world. It can affect other elements, changing their nature. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The combination of an element and magic produces an element in its purest form, but in nature such a combination is very rare. The magician's ability to create things of the material world from nothing is proof that magical power brings pure and higher elements to life , which can only exist in nature. " );
	Doc_Show(nDocID);
};

instance ITWR_HUNTING_AND_POOT (C_Item)
{
	name = " Hunter and Prey " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Hunter and Prey " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = use_itwr_hunt_and_prey;
	inv_animate = 1;
};

func void use_itwr_hunt_and_prey()
{
	var int nDocID;
	var int rnd;

	if ( HUNTING_UND_BEUTE_ONCE  ==  FALSE )
	{
		B_GivePlayerXP(500);
		DoLearnBow = TRUE;
		HUNTING_AND_BEUTE_ONCE = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_60 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_60 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " His books have survived many ages, and his advice is used by teachers to teach people the art of hunting. The great battles of the north were not in vain. Now anyone living in the forests can handle a bow well. But this does not mean that they know how to hunt. There are several rules that involve more than just handling weapons! Wildlife is mysterious and unpredictable. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , "The art of bow hunting is not only part of an ancient tradition, but also the fastest way to hunt. Shooting techniques have not changed much over the years, and it may not change in the future. What circumstances determine the course bow hunting? The ability to recognize these patterns is decisive on the path to comprehending the art of hunting. " );
	Doc_Show(nDocID);
};

instance MYRTANAS_LYRIK (C_Item)
{
	name = " Lyrica Mirtany " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Lyrica Mirtany " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemyrtanas_lyrik;
	inv_animate = 1;
};

func void usemyrtanas_lyrik()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_02 == FALSE)
	{
		READBOOKSDONE_02 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(10);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_61 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_61 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Song " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " repentance " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Everything died, but the sun is relentless " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Still circling the years. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " And the memory of the past disturbs the mind, " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Cries out about the former clean life. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " And the spirit of brotherhood, forgotten by us, awaits " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Fruitless fulfillment of vow data, " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Forsaken in the name of low goals, " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " That never knew the laws of honor. " );
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance TRUE_POWER (C_Item)
{
	name = " True Power " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " True Power " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = usetrue_power;
	inv_animate = 1;
};

func void usetrue_power()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_03 == FALSE)
	{
		READBOOKSDONE_03 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(300);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_62 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_62 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " True power " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Initiate's holy duty " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Only one thing distinguishes a magician from an ordinary person. Possessing the ability to influence divine power, he is a creature for whom the borders and laws of the mortal world do not apply. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " If a magician can reach a level where he manages to go beyond the boundaries of his existence, he rises above the laws of the mortal world. He can cross the boundaries of time and space, even the end of everything that exists in the world - death will not be able to rise in his way. " );
	Doc_Show(nDocID);
};


instance POWERFUL_ART (C_Item)
{
	name = " Mighty Art " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Mighty Art " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = usepowerful_art;
	inv_animate = 1;
};


func void usepowerful_art()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_04 == FALSE)
	{
		READBOOKSDONE_04 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_63 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_63 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Mighty Art " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " A work for those initiated into the art of Arcana. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " In the process of comprehending the secrets of magic, the magician's ability to collect energy increases. At first, it flows to him like a forest stream. At this time, you need to take care of it, otherwise it may dry up. But then this stream fills up and turns into a full-flowing river . " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " He grows and grows, becomes stronger every day. In his future power there will be no hint of his former weakness. Achieving maximum power is the sacred duty of every magician, for it was bestowed by the gods and is the most valuable gift that mortals have ever received. " );
	Doc_Show(nDocID);
};


instance GOETTERGABE(C_Item)
{
	name = " In God " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " In God " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usegoettergabe;
	inv_animate = 1;
};


func void usegoettergabe()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_05 == FALSE)
	{
		READBOOKSDONE_05 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(40);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_64 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_64 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Магия");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID, 0 , " Dar Bogov " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Man has been trying to understand the nature and origins of magic for many centuries. But where to start looking? How to describe what magic is in general? This is the most controversial entity in the universe. It can kill and heal, create and destroy. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " What does it look like? Where can one find it, invisible yet surprisingly powerful? Magic is magic. It is the most amazing gift of the gods to those who can use it. A healing power that only a few can control. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Bartos Laransky " );
	Doc_Show(nDocID);
};


instance SECRETS_OF_MAGIC (C_Item)
{
	name = " Secrets of Witchcraft " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Secrets of sorcery " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = usesecrets_of_magic;
	inv_animate = 1;
};


func void usesecrets_of_magic()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_06 == FALSE)
	{
		READBOOKSDONE_06 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_65 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_65 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Secrets of Witchcraft " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The magician himself is a servant of magical power, not its master. He has the ability to influence the world of magical energy and conduct it through himself. An adept initiated into the high art of magic must be able to tame his spirit in order to achieve this . " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The strength of his spirit helps to collect magic arcana, form, bind and bring into our material world. At the moment of the highest concentration, the magician manages to transfer his spirit from our world to other worlds, from where strength comes to him. He is only her guide. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Bartos Von Laurent " );
	Doc_Show(nDocID);
};


instance ITWR_UMSONST_01 (C_Item)
{
	name = " In vain way " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " In vain way " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useumsonst_01;
	inv_animate = 1;
};


func void useumsonst_01()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_07 == FALSE)
	{
		READBOOKSDONE_07 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(150);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_66 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_66 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " In vain " );
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " This is a reward for anyone who thinks there's something of value anywhere. Now rejoice, because that's what it is... " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " one page missing " );
	Doc_Show(nDocID);
};

instance RECIPES (C_Item)
{
	name = " Recipes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Wine Recipes - Volume I " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = userezepturen;
	inv_animate = 1;
};

func void userezepturen()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_08 == FALSE)
	{
		READBOOKSDONE_08 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(25);
		Log_CreateTopic(TOPIC_SPECIALWINES,LOG_NOTE);
		AI_Print( " Alchemy recipe learned - 'Balm of Providence' " );
		B_LogEntry( TOPIC_SPECIALWINES , " To make 'Balm of Providence' you need the following ingredients: 2 bunches of grapes, 2 bog stalks, fire tongue and a bottle of rum. " );
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_67 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_67 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Salve of Providence: " );
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Therefore, bile got into his eyes. This substance tastes bitter. If it gets into his eyes, a person begins to see the bitterness of the world, so his wisdom grows. He becomes a seer! Bitterness and wisdom are dependent on each other. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Tears, suffering and disappointment also bring bitterness, and wisdom comforts a person who keeps a heartache. Bitterness and wisdom are opposites. Where there is bitterness, there is no wisdom; where there is wisdom, there is no bitterness. " );
	Doc_Show(nDocID);
};


instance REZEPTUREN2(C_Item)
{
	name = " Wine Recipes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Wine Recipes - Volume II " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = userezepturen2;
	inv_animate = 1;
};


func void userezepturen2()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_09 == FALSE)
	{
		READBOOKSDONE_09 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(25);
		Log_CreateTopic(TOPIC_SPECIALWINES,LOG_NOTE);
		AI_Print( " Alchemy recipe learned - 'Wine of Oblivion' " );
		B_LogEntry( TOPIC_SPECIALWINES , " To make 'Wine of Forgetfulness' you need the following ingredients: 4 bunches of grapes, 2 demon hearts, and 3 meadowweed stalks. " );
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_68 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_68 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Wine of oblivion " );
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " High in the mountains of Arholos grows the best grapes used to make this wine. Bringing this wine to perfection, letting it ripen is an art. The main secret of wine: it must always remain still. When making wine, grape brushes are shifted with a special grass - zios. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " They saw how the Magister turns the purest spring water into wine, and were amazed. They bowed before him and praised his gift. As a punishment for laziness, the Magister imprisoned his students in bottles, and he himself disappeared into a pillar of fire. " );
	Doc_Show(nDocID);
};


instance ITWR_VARUSCONTENT(C_Item)
{
	name = " Varus List " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_varuscontent;
	description = name;
	text[ 2 ] = " List of supplies needed for " ;
	text[ 3 ] = " Paladins of Lord Varus. " ;
	inv_animate = 1;
};


func void use_itwr_varuscontent()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " List " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " 50 barrels of corned beef " );
	Doc_PrintLine(nDocID, 0 , " 15 - 20 barrels of drinking water " );
	Doc_PrintLine(nDocID, 0 , " 5 barrels of beer " );
	Doc_PrintLine(nDocID, 0 , " 20 bags of bread flour " );
	Doc_PrintLine(nDocID, 0 , " 3 boxes of cheese " );
	Doc_PrintLine(nDocID, 0 , " 1 barrel of wine " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The rest is up to you Hagen. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "                   Lord Varus " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_HAGENCONTENT(C_Item)
{
	name = " Lord Hagen 's List " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_hagencontent;
	description = name;
	text[ 2 ] = " List of supplies required for paladins. " ;
	inv_animate = 1;
};


func void use_itwr_hagencontent()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " List " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " 75 barrels of corned beef " );
	Doc_PrintLine(nDocID, 0 , " 25 - 30 barrels of drinking water " );
	Doc_PrintLine(nDocID, 0 , " 10 barrels of beer " );
	Doc_PrintLine(nDocID, 0 , " 35 bags of bread flour " );
	Doc_PrintLine(nDocID, 0 , " 8 boxes of cheese " );
	Doc_PrintLine(nDocID, 0 , " 4 barrels of wine " );
	Doc_PrintLine(nDocID, 0 , " 250 apples " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " 		Sincerely, Lord Hagen. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_VatrasTransferMagic(C_Item)
{
	name = " Scroll " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_VatrasTransferMagic;
	scemeName = "MAPSEALED";
	description = " Vatras Magic Scroll " ;
	text[ 4 ] = " Returns human consciousness... " ;
	inv_animate = 1;
};

func void Use_ItWr_VatrasTransferMagic()
{
	var C_Npc WereWl;

	WereWl = Hlp_GetNpc(Werewolf);

	if(Npc_GetDistToNpc(WereWl,hero) <= 500)
	{	
		B_GivePlayerXP(150);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",WereWl,WereWl,0,0,0,FALSE);
		WereWolfIsHuman = TRUE;
		WereWl.start_aistate = zs_mm_rtn_huntgone;
		AI_Standup(WereWl);
		AI_ContinueRoutine(WereWl);
	}
	else
	{
		B_Say(hero,hero,"$DONTWORK");
		CreateInvItems(hero,ItWr_VatrasTransferMagic,1);
	};
};

instance ITWR_XARDASGOBLINSCROLL(C_Item)
{
	name = " Scroll of Banishment " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_xardasgoblinscroll;
	scemeName = "MAPSEALED";
	description = name;
	text[ 3 ] = " Turns out summoned creatures " ;
	text[ 4 ] = " Can only be used once... " ;
	inv_animate = 1;
};


func void use_itwr_xardasgoblinscroll()
{
	var int nDocID;
	var C_Npc xargob;
	xargob = Hlp_GetNpc(xardas_goblin);
	Snd_Play("MFX_MASSDEATH_CAST");
	if((XARDASGOBLINREADYAWAY == TRUE) && (MIS_GOBLINAWAY == LOG_Running))
	{
		xargob.start_aistate = zs_mm_rtn_demonrest;
		AI_Teleport(xargob,"TOT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		CreateInvItems(hero,itke_xardasgoblinkey,1);
		MIS_GOBLINAWAY = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GOBLINAWAY,LOG_SUCCESS);
		B_LogEntry( TOPIC_GOBLINAWAY , " I used the scroll to banish this strange creature from the world of the living. " );
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSDEM.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_XARDASDOCS_1(C_Item)
{
	name = " The Manuscripts of Xardas, Part I " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " A thick stack of scribbled paper... " ;
	inv_animate = 1;
};

instance ITWR_XARDASDOCS_2(C_Item)
{
	name = " The Manuscripts of Xardas, Part II " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " A thick stack of scribbled paper... " ;
	inv_animate = 1;
};

instance ITWR_XARDASDOCS_3(C_Item)
{
	name = " The Manuscripts of Xardas, Part II - Original " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " A thick stack of scribbled paper... " ;
	inv_animate = 1;
};

instance ITWR_LOSTISLANDMAP(C_Item)
{
	name = " Stone tiles " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_LostIslandMap.3ds";
	material = MAT_STONE;
	on_state[0] = use_itwr_lostislandmap;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	wear = WEAR_EFFECT;
	description = name;
	text[ 2 ] = " There is a strange pattern on the front of the tile, " ;
	text[ 3 ] = " and the reverse is embossed with some cryptic characters. " ;
	inv_animate = 1;
};


func void use_itwr_lostislandmap()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LOSTISLAND_MAP.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LETTERFALK(C_Item)
{
	name = " Falko 's letter " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letterfalk;
	scemeName = "MAPSEALED";
	description = name;
	text[ 2 ] = " Falk's letter to the merchant Bosper. " ;
	inv_animate = 1;
};


func void use_itwr_letterfalk()
{
	var int nDocID;
	if((FALKLETTEROPENED == FALSE) && (MIS_LETTERFALK == LOG_Running))
	{
		CreateInvItems(hero,itwr_letterfalk_open,1);
		FALKLETTEROPENED = TRUE;
		B_LogEntry( TOPIC_LETTERFALK , " I opened Falk's sealed letter. In it, he asks Bosper to provide his people with at least a hundred arrows. Maybe offer Falk to get these arrows himself or still deliver this letter to the addressee? " );
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " My dear friend. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I'm running out of my branded arrows, and now I have no way to send one of my people to you. And therefore, I beg you to give me at least a hundred arrows with the bearer of this letter! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Фальк");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LETTERFALK_OPEN(C_Item)
{
	name = " Falko 's letter " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letterfalk_open;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Falk's opened letter to the merchant Bosper. " ;
	inv_animate = 1;
};


func void use_itwr_letterfalk_open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " My dear friend. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I'm running out of my branded arrows, and now I have no way to send one of my people to you. And therefore, I beg you to give me at least a hundred arrows with the bearer of this letter! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Фальк");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_FALKGRANDFATHER_01(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_01;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_01()
{
	var int nDocID;
	if(FINDFALKGRANDFATHERSEEK_01 == FALSE)
	{
		FINDFALKGRANDFATHERSEEK_01 = TRUE;
		if(Npc_KnowsInfo(hero,dia_hun_741_falk_grand))
		{
			B_GivePlayerXP(50);
			MIS_FALKGRANDFATHERSEEK = LOG_Running;
			Log_CreateTopic(TOPIC_FALKGRANDFATHERSEEK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_Running);
			B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " In the old ruins in the north of the island, I found a strange piece of paper with entries. They look very much like pages from the diary of one of the hunters named Ben. I think this name I heard from Falk in hunter camp. Maybe it's worth showing him this little thing?... " );
			B_Say(self,self,"$HOWINTEREST");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " While hunting today, I shot a very strange-looking animal. I don't even remember that I've ever seen something like this in these parts. I wonder where it came from?! Maybe.. .(illegible text)... Well, I'll try to find out. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_GALKGRANDFATHER_02(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_02;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_02()
{
	var int nDocID;
	b_checkadwinpresence( ADDONWORLD_ZEN );
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_02 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(100);
		FINDFALKGRANDFATHERSEEK_02 = TRUE;
		B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " In a cave near the pirate camp, I found another note left by Ben. Judging by his notes, he was going to thoroughly explore this part of the island. " );
		Wld_InsertItem(itmi_falkgrandfatheritem_03,"FP_AW_ITEM_FALKGFWROTE_02");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Even without going far from the cave in which I had to settle for a while, I met just a huge number of rare animals. Not far from here ... (illegible text) ... All this is simply amazing! Tomorrow, I'm going deep into these territories. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_HALKGRANDFATHER_03(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_03;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_03()
{
	var int nDocID;
	b_checkadwinpresence( ADDONWORLD_ZEN );
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_03 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(50);
		FINDFALKGRANDFATHERSEEK_03 = TRUE;
		B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " Ben seems to be liking this valley more and more. Based on the logs, he looks like he's about to explore the canyon now. " );
		Wld_InsertItem(itmi_falkgrandfatheritem_04,"FP_AW_ITEM_FALKGFWROTE_03");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " This is a beautiful hunting ground! The whole area is full of all sorts of mysterious creatures, albeit extremely dangerous. But I still like it here. In a few days, I plan to go to the canyon, which is located west of this place. Maybe , there I will meet something else interesting. " );
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_JALKGRANDFATHER_04(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_04;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_04()
{
	var int nDocID;
	b_checkadwinpresence( ADDONWORLD_ZEN );
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_04 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(100);
		FINDFALKGRANDFATHERSEEK_04 = TRUE;
		B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " Ben didn't seem to like the canyon too much. He wrote that there were too many dangerous creatures, and therefore the old man decided to quickly get out of this place. Apparently, he directed his feet towards a huge cave located in this canyon. " );
		Wld_InsertItem(itwr_CalcAncestor_final, " FP_AW_ITEM_FALKGFWROTE_04 " );
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The canyon turned out to be quite a dangerous place! The whole district is simply teeming with various predatory creatures. So, I think we shouldn't linger too much here. Today I found the entrance to a large cave in the mountains. I will have to carefully examine it - maybe I be able to find something interesting there ... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_KALKGRANDFATHER_FINAL (C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_final;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_final()
{
	var int nDocID;
	b_checkadwinpresence( ADDONWORLD_ZEN );
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_FINAL == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(150);
		FINDFALKGRANDFATHERSEEK_FINAL = TRUE;
		B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " Now, judging by the logs, this adventurer encountered a strange creature in the swamps that looked like a crawler. Naturally, an experienced hunter decided not to miss his chance to hunt this beast and went deep into the swamp after him. " );
		Wld_InsertItem(itwr_Lalkgrandfather_finalext,"FP_AW_ITEM_FALKGFWROTE_05");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Yesterday, not far from my campsite, I stumbled upon a very strange creature. It looked a bit like a crawler, only ... (illegible text) ... Tomorrow I will again go into the depths of this swamp. Maybe , I still manage to track down this creature and finish it off. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LALKGRANDFATHER_FINALEXT(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_finalext;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_finalext()
{
	var int nDocID;
	b_checkadwinpresence( ADDONWORLD_ZEN );
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_FINALEXT == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(200);
		FINDFALKGRANDFATHERSEEK_FINALEXT = TRUE;
		; _ _ _ _ _ _
		Wld_InsertNpc(blattcrawlerex,"ADW_SWAMP_TO_BIGSEA_01");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I can't find a good time to shoot this creature...(illegible text)...It's too cunning and constantly eludes me. But tomorrow I will definitely succeed! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_ORCSORDER(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OrcN.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_orcsorder;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " A piece of paper with strange symbols... " ;
	inv_animate = 1;
};


func void use_itwr_orcsorder()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);

	if(MIS_ORCORDER == LOG_Running)
	{
	 	if((PlayerKnowsOrcLanguage == TRUE) && (KNOWSTARANBUILD == FALSE))
		{
			B_LogEntry( TOPIC_ORCORDER , " I found a letter from the captain of the drakar. It says that the orcs sent a squad of slaves to make a new ram to storm the castle. Apparently, this squad should soon arrive at their camp near the fortress. We need to report as soon as possible about this to Albert. " );
			KNOWSTARANBUILD = TRUE;
		};
	};
};


instance ITWR_ANCIENT(C_Item)
{
	name = " Secrets of the Ancients " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_ancient;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " The book emits a magical glow... " ;
	text[ 3 ] = " There are dried blood on the cover of the book. " ;
	inv_animate = 1;
};


func void use_itwr_ancient()
{
	var int nDocID;

	if(MEANDMILTENTELEPORTDCDONE == FALSE)
	{
		AI_Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_MASSDEATH_CAST");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - (hero.attribute[ATR_HITPOINTS] / 2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);

		if(ANCIENTBOOKBONUS == FALSE)
		{
			B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			ANCIENTBOOKBONUS = TRUE;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			B_Say(self,self,"$HOWINTEREST");
		};
		if((BookBonus_69 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
			BookBonus_69 = TRUE ;
		};
	};
};


instance ITWR_NECRONOMICON(C_Item)
{
	name = " Necronomicon " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_necronomicon;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " The book emits a dark aura... " ;
	inv_animate = 1;
};


func void use_itwr_necronomicon()
{
	var int nDocID;
	if(hero.guild == GIL_KDM)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);

		if(NECRONOMICONBONUS == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			B_RaiseAttribute(hero,ATR_MANA_MAX,10);
			Snd_Play("Levelup");
			NECRONOMICONBONUS = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print( " Intelligence + 1 " );
		};
	}
	else
	{
		AI_Print( " The book's magic prevents you from opening it... " );
		Snd_Play("MFX_MASSDEATH_CAST");
		if(NECRONOMICONBONUSTRY == FALSE)
		{
			NECRONOMICONBONUSTRY = TRUE;
		};
	};
};

instance ITWR_XARDASPAINT(C_Item)
{
	name = " Fire Mage Portrait " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_xardaspaint;
	scemeName = "MAP";
	description = " Portrait of a Fire Mage " ;
	text[ 2 ] = "The magician shown in this picture " ;
	text[ 3 ] = " reminds me of someone... " ;
	inv_animate = 1;
};


func void use_itwr_xardaspaint()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"XardasPaint.TGA",0);
	Doc_Show(nDocID);
};


instance ITWR_ORTEGOLETTER(C_Item)
{
	name = " Note Ortego " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_ortegoletter;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Slightly wrinkled piece of paper with notes... " ;
	inv_animate = 1;
};


func void use_itwr_ortegoletter()
{
	var int nDocID;

	if (( MY_KILLIGNAZ  == LOG_Running) && ( READOR  ==  FALSE ))
	{
		B_GivePlayerXP(50);
		READORTEGO = TRUE ;
		who exactly hired Ortega. Maybe I should wait here to find out.");
		B_StartOtherRoutine(KDF_503_Karras,"MeetKiller");
		AI_Teleport(KDF_503_Karras,"NW_CITY_SMFOREST_04");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The name of the person you need is Ignaz, he is an alchemist. You will find his shack in the port area of ​​Khorinis. Try to do everything without much fuss. Then go to the cave, the one next to the eastern gate of the city. There you will receive your due you for this work gold. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DJG_ARMOR(C_Item)
{
	name = " Pattern drawings " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OldP.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_djg_armor;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Crawler shell armor pattern drawings " ;
	inv_animate = 1;
};

func void use_itwr_djg_armor()
{
	var int nDocID;
	if(KNOWMAKECRAWLERARMOR == FALSE)
	{
		B_GivePlayerXP(100);
		KNOWMAKECRAWLERARMOR = TRUE;
		Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge armor from crawler shells, I need one iron ingot, a piece of resin and ten crawler shells. " );
		Log_AddEntry( TOPIC_HUNTERSARMOR , " I've found the Wolf's chest! As he said, in it I found the blueprints for patterns of armor from the shells of crawlers. Now it's time to get to work! " );
		B_Say(self,self,"$HOWINTEREST");
	};
	if((BookBonus_70 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_70 = TRUE ;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"DJGArmorCrawlerLetter.TGA",0);
	Doc_Show(nDocID);
};


instance ITWR_LETTERORESWORD(C_Item)
{
	name = " Note Hagena " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letteroresword;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Instructions for forging ore blades are written here... " ;
	inv_animate = 1;
};


func void use_itwr_letteroresword()
{
	var int nDocID;

	if(KNOWNORESWORD == FALSE)
	{
		KNOWNORESWORD = TRUE;
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		B_LogEntry(TOPIC_TalentSmith, " It takes one magic ore ingot to forge an ore blade. " );
		B_Say(self,self,"$SMITHBOOK");
	};
	if((BookBonus_71 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_71 = TRUE ;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The process of creating an ore blade is quite simple. To do this, you need to take one ingot of magical ore and heat it to exactly a certain temperature. After shaping it into a blade shape, and then cool it very sharply! The durability of this weapon will not know unparalleled. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_TRANSFERENERGY(C_Item)
{
	name = " Energy Transfer " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_transferenergy;
	scemeName = "MAPSEALED";
	description = name;
	text[ 2 ] = " This scroll contains an energy transfer spell. " ;
	inv_animate = 1;
};

func void use_itwr_transferenergy()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		if ((Npc_HasItems(hero,ItMi_Avatar_Dark) >=  1 ) && (Npc_HasItems(hero,ItMi_Avatar_Fire) >=  1 ) && (Npc_HasItems(hero,ItMi_Avatar_Water) >=  1 ) && (Npc_HasItems(hero,ItMi_Avatar_Stone) >=  1 ) && (( SIMPLEBLACK_1H_ONME  ==  TRUE ) || ( SIMPLEBLACK_2H_ONME  ==  TRUE )))
		{
			B_GivePlayerXP(1500);
			AI_UnequipWeapons(hero);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Dark,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Fire,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Water,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Stone,1);

			if(SIMPLEBLACK_1H_ONME == TRUE)
			{
				if(Npc_HasItems(hero,itmw_1h_simpleblack) >= 1)
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack,1);
				}
				else if(Npc_HasItems(hero,itmw_1h_simpleblack_dex) >= 1)
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic_dex,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack_dex,1);
				}
				else
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack,1);
				};
			}
			else
			{
				CreateInvItems(hero,itmw_2h_blessedblack_magic,1);
				Npc_RemoveInvItems(hero,itmw_2h_simpleblack,1);
			};

			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			NETBEKLEADME_STEP2DONE = TRUE;
			AI_Print(PRINT_MAKESUPERSWORD);
			B_LogEntry( TOPIC_GUARDIANS , " I have created a sword with the power to destroy the Guardians. Now I think it's time to pay them a visit! " );
		}
		else
		{
			AI_Print( " Nothing happened... " );
			Snd_Play("MFX_MASSDEATH_CAST");
			CreateInvItems(self,itwr_transferenergy,1);
		};
	}
	else
	{
		AI_Print( " Nothing happened... " );
		Snd_Play("MFX_MASSDEATH_CAST");
		CreateInvItems(self,itwr_transferenergy,1);
	};
};

instance ITWR_DRAGONTALE(C_Item)
{
	name = " Dragon's Mouth - Volume I " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Dragon's mouth " ;
	text[0] = "Том I";
	text[ 4 ] = " An ancient tome is shrouded in bright flames... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_dragontale;
	inv_animate = 1;
};


func void use_itwr_dragontale()
{
	var int nDocID;
	var int rnd;

	if(DRAGONTALE_1 == FALSE)
	{
		DRAGONTALE_1 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(500);
		hero.lp = hero.lp + 2;
		AI_Print( " Learning points + 2 " );
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_72 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_72 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " For centuries, dragons have been considered the most dangerous creatures of the gods on earth. A single glance is enough to understand how strong and powerful these creatures are! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " They usually live high in the mountains, where hardly a human foot has ever set foot, or in deep dark dungeons, since dragons can see and navigate in the dark. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Only a madman dares to stand in the way of a dragon - its flames can turn the hardest stone into ash and ashes in an instant... From a human, it won't even leave memories! " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " However, if you still set out to slay this powerful creature, then know that dragons have their weak points. " );
	Doc_Show(nDocID);
};


instance ITWR_DRAGONTALE_2(C_Item)
{
	name = " Dragon's Mouth - Volume II " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Dragon's mouth " ;
	text[0] = "Том II";
	text[ 4 ] = " An ancient tome is shrouded in bright flames... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_dragontale_2;
	inv_animate = 1;
};


func void use_itwr_dragontale_2()
{
	var int nDocID;
	var int rnd;

	if(DRAGONTALE_2 == FALSE)
	{
		DRAGONTALE_2 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(500);
		hero.lp = hero.lp + 2;
		AI_Print( " Learning points + 2 " );
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_73 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_73 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Dragons are practically invulnerable! The strong scales that cover their body from head to tail cannot be pierced even by the sharpest sword. And a fired arrow is not at all capable of harming this ancient creature. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " However, this does not mean that the dragon cannot be killed. Their weak point is the abdominal cavity, which is not covered by strong outer scales. not very easy to do. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " In addition, a lot depends on the dragon's habitat! Some of them, due to their innate qualities, are extremely susceptible to damage from various states of the elements and magic. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " For example, the ice dragons of Nordmar are extremely sensitive to fire, while the fire dragons of Varant are extremely sensitive to cold and frost. " );
	Doc_Show(nDocID);
};


instance ITWR_DEMONTALE(C_Item)
{
	name = " Shadows in the night " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " The image of a demon is scratched into the book... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_demontale;
	inv_animate = 1;
};


func void use_itwr_demontale()
{
	var int nDocID;
	var int rnd;

	if ( DEMONTALE  ==  FALSE )
	{
		DEMONTALE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(200);
		hero.lp = hero.lp + 2;
		AI_Print( " Learning points + 2 " );
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_74 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_74 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The most bloodthirsty and terrible creatures ever created by Beliar, the god of Darkness, are demons! They blindly follow the will of their master, sowing death and horror around them. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Demons have great strength and power, and their fierce hatred of all living things makes them even more powerful than usual. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " In addition, they are not susceptible to fire or almost any kind of weapon. And only very strong magic can make these creatures of darkness retreat. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " And woe to those who foolishly fall into the clutches of a demon! Terrible torment and terrible death await him... " );
	Doc_Show(nDocID);
};

instance ITWR_DRAGSTONE(C_Item)
{
	name = " Gems " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_ITWR_DRAGSTONE;
	inv_animate = 1;
};

func void use_ITWR_DRAGSTONE()
{
	var int nDocID;
	var int rnd;

	if(DRAGSTONE == FALSE)
	{
		B_GivePlayerXP(50);
		DRAGSTONE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_75 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_75 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Many gems contain certain magical properties. True, only a few of them are known. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " For example, a ruby ​​gives its owner strength, and an emerald gives dexterity. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Before a stone can be used, it must be properly processed on the jewelry table. And only after that it can already be used. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Only a select few master jewelers know about the method of processing precious stones. " );
	Doc_Show(nDocID);
};

instance ITWR_SKELETONTALE(C_Item)
{
	name = " Call the Darkness " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_skeletontale;
	inv_animate = 1;
};


func void use_itwr_skeletontale()
{
	var int nDocID;
	var int rnd;

	if(SKELETONTALE == FALSE)
	{
		B_GivePlayerXP(150);
		SKELETONTALE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_76 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_76 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The restless remains of the dead and their souls, risen by the will and call of the Dark God, in order to serve him and go into battle for him. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Countless legions of warriors of darkness are waiting for the hour when the master will lead them to the final battle against Innos. And no one can stop them! " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " They know no peace, no fatigue, no pity, no compassion! And all those who reject the ruler and call him their god will be destroyed. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " And only the sacred fire of Innos can resist them... " );
	Doc_Show(nDocID);
};


instance ITWR_GOLEMBOOK1(C_Item)
{
	name = " Arcanum Golum - Volume I " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[ 0 ] = userbook1 ;
	description = " Arcanum Golum " ;
	text[0] = "Том I";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usegolembook1()
{
	var int nDocID;
	var int rnd;

	if(GOLEMTALE_1 == FALSE)
	{
		B_GivePlayerXP(100);
		GOLEMTALE_1 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_77 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_77 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " Arcanum Golum - Volume I " );
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Stone Golem " );
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID, 0 , " These stone colossi are virtually invulnerable. Swords, axes, and bows do absolutely no harm to them. " );
	Doc_PrintLines(nDocID, 0 , " The only recorded instance of a human defeating a golem is a report by a mercenary. He said that a crack appeared in the golem from a hammer blow. From the ensuing blows, it began to expand until the golem simply fell apart. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Swamp Golem " );
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID, 1 , " Only those who have ever encountered these creatures, which originate from the primordial elements of the earth, truly understand the depth of respect that the traveler who encounters them imbued with. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " As far as we know, the swamp golem is extremely immune to magic and fire. However, it can be easily cut into pieces with a razor-sharp sword. " );
	Doc_Show(nDocID);
};


instance ITWR_GOLEMBOOK2(C_Item)
{
	name = " Arcanum Golum - Volume II " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[ 0 ] = usebook2 ;
	description = " Arcanum Golum " ;
	text[0] = "Том II";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usegolembook2()
{
	var int nDocID;
	var int rnd;

	if(GOLEMTALE_2 == FALSE)
	{
		B_GivePlayerXP(100);
		GOLEMTALE_2 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_78 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_78 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID, 0 , " ARCANUM GOLUM - Volume II " );
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Ice Golem " );
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID, 0 , " Ice golems are akin to stone golems, only their bodies seem to be made of water. All weapons known to man simply slide on the skin of these creatures. " );
	Doc_PrintLines(nDocID, 0 , " Travelers should also be aware of and constantly aware of golems' icy breath, as forgetful ones risk becoming icicles. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID, 1 , " One of the Firebenders once talked about meeting an ice golem. Using his magic runes, he defeated this creature without any problems. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Fire Golem " );
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID, 1 , " According to the stories, these creatures can turn a person into a flaming torch with just their touch. " );
	Doc_PrintLines(nDocID, 1 , " One encounter with such a golem showed that lightning and ice spells could harm the fire golem. " );
	Doc_Show(nDocID);
};


instance ELEMENTARE_ARCANEI(C_Item)
{
	name = " Fundamentals of Magic " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Basics of Magic " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_elementare_arcanei;
	inv_animate = 1;
};


func void use_elementare_arcanei()
{
	var int nDocID;
	var int rnd;

	if(ELEMENTAREARCANEI == FALSE)
	{
		B_GivePlayerXP(100);
		ELEMENTAREARCANEI = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_79 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_79 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Basics of Magic " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Place of magic in the world order " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " A lot of research has been done to find out the place of magic and its relationship with the basic elements. They all agree on one thing: magic is above all elements. It can transform them, change shape, that is, command them. " ) ;
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Each element, when viewed in its original form, has a connection with magic. Such connections can only be traced in some places, and many are looking for these places. The ability of a magician to create or summon elements, seemingly from the void, once again proves that magic is the most powerful force in the universe. " );
	Doc_Show(nDocID);
};

instance ITWR_1TESTFONT(C_Item)
{
	name = " Letter font test " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_1TESTFONT;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " Gerbrandt's letter to the man in the tavern. " ;
	inv_animate = 1;
};

func void use_1TESTFONT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Help me fix my problems with a man named Wambo. You know what to do. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " PS A purse containing payment for your services is attached to the letter. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_2TESTFONT(C_Item)
{
	name = " Book test font " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Chromanin Part I " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_2TESTFONT;
	inv_animate = 1;
};

func void use_2TESTFONT()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " He who is ready to give up all earthly passions and follow the paths of truth must find out where the source of my power is hidden. Finding it, he will be able to destroy everything that connects him to this world, and show that he is ready to accept Chromanin's knowledge. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " A wise man revisits his past deeds before starting something new. " );
	Doc_Show(nDocID);
};

instance ItWr_MonasterySecret(C_Item)
{
	name = " Ghostfire " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_STONOS_XRONIKS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_MonasterySecret;
	inv_animate = 1;
};

func void Use_ItWr_MonasterySecret()
{
	var int nDocID;
	var int rnd;

	if(MonasterySecret == FALSE)
	{
		B_GivePlayerXP(150);
		MonasterySecret = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		MIS_MonasterySecret = LOG_Running;
		Log_CreateTopic(TOPIC_MonasterySecret,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MonasterySecret,LOG_Running);
		B_LogEntry(TOPIC_MonasterySecret, " There are many legends, and one of them is about one artifact that can summon anyone other than the real dragon to help the magician! Nobody knows if this is true or not, but the story mentions one alchemist magician, who still managed to create a similar item.If the reader of this book decided to find this artifact, then according to rumors, their search should begin in a place called Amon Shen... What would that mean? " );
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_80 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_80 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " There are many legends, and one of them is about one artifact that can summon anyone other than the real dragon to help the mage! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " No one knows if this is true or not, but history mentions one alchemist magician who did manage to create such an item. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The summoned creature is not as powerful as Beliar's creatures, but its power can crush entire armies. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " If anyone who reads this book wants to find this artifact, then rumor has it that they should start their search at a place called Amon Shen... " );
	Doc_Show(nDocID);
};

instance ITWr_MonasterySecretLeadOW(C_Item)
{
	name = " Note " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ITWr_MonasterySecretLeadOW;
	scemeName = "MAP";
	description = name;
	text[ 2 ] = " An old piece of paper with incomprehensible entries... " ;
	inv_animate = 1;
};

func void use_ITWr_MonasterySecretLeadOW()
{
	var int nDocID;

	if((MonasterySecretLeadOW == FALSE) && (MIS_MonasterySecret == LOG_Running))
	{
		B_GivePlayerXP(100);
		MonasterySecretLeadOW = TRUE;
		B_LogEntry(TOPIC_MonasterySecret, " All I could make out in the letter I found was the Creole name. " );
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ...(illegible text)...Creole...(illegible text)... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Osair_Read(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Osair_Read;
	scemeName = "MAPSEALED";
	description = name;
	text[ 2 ] = " Osair's opened letter to Nrozas... " ;
	inv_animate = 1;
};

func void Use_ItWr_Osair_Read()
{
	var int nDocID;

	if(MIS_OsairDemand == FALSE)
	{
		MIS_OsairDemand = LOG_Running;
		Log_CreateTopic(TOPIC_OsairDemand,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OsairDemand,LOG_Running);
		B_LogEntry(TOPIC_OsairDemand, " How interesting! At Nrozas' request, Osair wants a black cave troll skin from him. If I get this trophy for him, it might work in my favor. " );
		B_Say(self,self,"$HOWINTEREST");
		Wld_InsertNpc(TROLL_BLACK_AGE_PW,"PW_CAVEBLACKTROLL");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " My dear Nrozas! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I agree to send you stronger human material, if only we will return with you to the issue of that rare black cave troll skin that I have been asking you for a long time. Think about it! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Осаир");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_ConstRecept(C_Item)
{
	name = " Alchemy Recipe " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_ConstRecept;
	inv_animate = 1;
};

func void Use_ItWr_ConstRecept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Ingredients for making the elixir: " );
	Doc_PrintLine(nDocID, 0 , " Aquamarine " );
	Doc_PrintLine(nDocID, 0 , " Silver Ring " );
	Doc_PrintLine(nDocID,0,"Вода");
	Doc_PrintLine(nDocID, 0 , " Skeleton bone " );
	Doc_PrintLine(nDocID, 0 , " Swamp Grass " );
	Doc_PrintLine(nDocID,0,"Сыр");
	Doc_PrintLine(nDocID, 0 , " Dark Mushroom " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fingersliste(C_Item)
{
	name = " Drawing " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Fingersliste;
	scemeName = "MAP";
	description = "Список";
	text[ 4 ] = " Instructions for making the sword 'Golden Needle'... " ;
	inv_animate = 1;
};

func void Use_ItWr_Fingersliste()
{
	var int nDocID;
	var int rnd;

	if(Lovkach_W8 == FALSE)
	{
		B_GivePlayerXP(300);
		AI_Print( " Forging recipe learned - 'Golden Needle' " );
		B_LogEntry(TOPIC_TalentSmith, " Now, I can make the Golden Needle sword. To do this, I need to have five magic ore ingots, a piece of black ore, a gold ingot, eight lumps of sulfur, three pieces of ice quartz, four resin solutions and a black pearl. " );
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
		Lovkach_W8 = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		MIS_TellAboutFingers = LOG_Success;
		Log_SetTopicStatus(TOPIC_TellAboutFingers,LOG_Success);
		B_LogEntry(TOPIC_TellAboutFingers, " I have the Golden Needle sword recipe. " );
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_81 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_81 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " 'Golden Needle'...component: " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " ...- five ingots of magic ore " );
	Doc_PrintLine(nDocID, 0 , " - a piece of black ore " );
	Doc_PrintLine(nDocID, 0 , " - gold bar " );
	Doc_PrintLine(nDocID, 0 , " - eight lumps of sulfur " );
	Doc_PrintLine(nDocID, 0 , " - three pieces of ice quartz " );
	Doc_PrintLine(nDocID, 0 , " - four resin solutions " );
	Doc_PrintLine(nDocID, 0 , " - black pearl... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_VatrasDiary(C_Item)
{
	name = " Vatrasa Diary " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_VatrasDiary;
	inv_animate = 1;
};

func void Use_ItWr_VatrasDiary()
{
	var int nDocID;
	var int rnd;

	if(VatrasDiaryBonus == FALSE)
	{
		B_GivePlayerXP(500);
		B_Say(self,self,"$HOWINTEREST");
		VatrasDiaryBonus = TRUE;
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_82 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_82 = TRUE ;
	};
	if((PLAYER_TALENT_RUNES[SPL_Zap] == FALSE) && ((hero.guild == GIL_NOV) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR)))
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,1);
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		Snd_Play("Levelup");
		Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
		AI_Print( " Learned how to make a rune - 'Lightning' " );
		B_LogEntry(TOPIC_TalentRunes, " Components for the 'Lightning' rune: rhinestone. " );
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Formula for crafting 'Lightning' rune " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " This rune is the beginning of the magic of the first circle of Water magic. To make it, you first need a runestone, rock crystal and a spell scroll with the proper formula. Particular attention should be paid to the quality of the ingredients used, otherwise the rune will not give the desired effect. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

// ------------------------fishing---------------------- -

instance PC_ANGEL_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_ANGEL_end_condition;
	information = PC_ANGEL_end_info;
	permanent = TRUE;
	description = " (...close) " ;
};

func int PC_ANGEL_end_condition()
{
	if(AngelIsOn == TRUE)
	{
		return TRUE;
	};
};

func void PC_ANGEL_end_info()
{
	AI_StopProcessInfos(self);
	self.aivar[ AIV_INVINCIBLE ] = FALSE ;
	Ext_RemoveFromSlot(hero,"BIP01 R HAND");
	Npc_RemoveInvItems(hero,ItSe_FAngel,Npc_HasItems(hero,ItSe_FAngel));
	AngelIsOn = FALSE ;
};

instance PC_ANGEL_CATCH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_ANGEL_CATCH_condition;
	information = PC_ANGEL_CATCH_info;
	permanent = TRUE;
	description = " Catch fish. " ;
};

func int PC_ANGEL_CATCH_condition()
{
	if(AngelIsOn == TRUE)
	{
		return TRUE;
	};
};

func void PC_ANGEL_CATCH_info()
{
	if(FishDay != Wld_GetDay())
	{
		CountFish += 1;

	 	if (Wld_IsTime( 4 , 0 , 8 , 0 ) || Wld_IsTime( 19 , 0 , 21 , 0 ) || (Wld_IsRaining() ==  TRUE ))
		{
			if(Hlp_Random(100) >= 40)
			{
				CreateInvItems(hero,ItFo_Fish,1);
				AI_PrintClr( " You caught a fish! " , 83 , 152 , 48 );
				B_Say(hero,hero,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr( " You didn't catch anything... " , 177 , 58 , 17 );
				B_Say(hero,hero,"$NOTHINGTOGET02");
			};
		}
		else
		{
			if(Hlp_Random(100) >= 80)
			{
				CreateInvItems(hero,ItFo_Fish,1);
				AI_PrintClr( " You caught a fish! " , 83 , 152 , 48 );
				B_Say(hero,hero,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr( " You didn't catch anything... " , 177 , 58 , 17 );
				B_Say(hero,hero,"$NOTHINGTOGET02");
			};
		};
		if(CountFish >= 10)
		{
			FishDay = Wld_GetDay();
			CountFish = FALSE;
		};
	}
	else
	{
		CountFish = FALSE;
		AI_Print( " Enough for today... " );
		B_Say(hero,hero,"$IDLE_SPECIAL");
	};
};

instance ItWr_HagenLoanDocs(C_Item)
{
	name = " Royal Certificate " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HagenLoanDocs;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Certificate of rights to land... " ;
	inv_animate = 1;
};


func void Use_ItWr_HagenLoanDocs()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "          Certificate " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " This document grants ownership of the land next to the old Atros Tower and adjacent ore mine. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Hagen " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

var int CheckWantedPosterRocks;
var int CheckWantedPosterDexter;
var int CheckWantedPosterNestor;
var int CheckWantedPosterKriks;
var int CheckWantedPosterBart;
var int CheckWantedPosterSkiron;

instance ItWr_DexterWantedPoster(C_Item)
{
	name = " Wanted Announcement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexterWantedPoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Wanted Outlaw - Dexter " ;
	inv_animate = 1;
};

func void Use_ItWr_DexterWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterDexter == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for a bandit named Dexter. The bounty for dead or alive is 2500 gold coins. " );
			CheckWantedPosterDexter = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for a bandit named Dexter. The bounty for dead or alive is 2500 gold coins. " );
			CheckWantedPosterDexter = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "     Wanted Announcement " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " The authorities of Khorinis are looking for a bandit named Dexter. The bounty for dead or alive is 2500 gold coins. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Andre " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_NestorWantedPoster(C_Item)
{
	name = " Wanted Announcement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_NestorWantedPoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Wanted Bandit - Nestor 'Hanibal' " ;
	inv_animate = 1;
};

func void Use_ItWr_NestorWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterNestor == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the robber Nestor, nicknamed 'Hanibal'. The reward for living or dead is 2000 gold coins. " );
			CheckWantedPosterNestor = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the robber Nestor, nicknamed 'Hanibal'. The reward for living or dead is 2000 gold coins. " );
			CheckWantedPosterNestor = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "     Wanted Announcement " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " The authorities of Khorinis are looking for the robber Nestor, nicknamed 'Hanibal'. The reward for living or dead is 2000 gold coins. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Andre " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_KriksWantedPoster(C_Item)
{
	name = " Wanted Announcement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_KriksWantedPoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Wanted Bandit Crixus 'Razor' " ;
	inv_animate = 1;
};

func void Use_ItWr_KriksWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterKriks == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the bandit Crixus, nicknamed 'The Razor'. The reward for living or dead is 1500 gold coins. " );
			CheckWantedPosterKriks = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the bandit Crixus, nicknamed 'The Razor'. The reward for living or dead is 1500 gold coins. " );
			CheckWantedPosterKriks = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "     Wanted Announcement " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " The authorities of Khorinis are looking for the bandit Crixus, nicknamed 'The Razor'. The bounty for dead or alive is 1500 gold coins. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Andre " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_BartWantedPoster(C_Item)
{
	name = " Wanted Announcement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_BartWantedPoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Wanted Bandit - Bart 'Shorty' " ;
	inv_animate = 1;
};

func void Use_ItWr_BartWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterBart == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the robber Bart, nicknamed 'Shorty'. The reward for living or dead is 1250 gold coins. " );
			CheckWantedPosterBart = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the robber Bart, nicknamed 'Shorty'. The reward for living or dead is 1250 gold coins. " );
			CheckWantedPosterBart = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "     Wanted Announcement " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " The authorities of Khorinis are looking for the robber Bart, nicknamed 'Shorty'. The reward for dead or alive is 1250 gold coins. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Andre " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_SkironWantedPoster(C_Item)
{
	name = " Wanted Announcement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_SkironWantedPoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Wanted Bandit - Skiron 'The Butcher' " ;
	inv_animate = 1;
};

func void Use_ItWr_SkironWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterSkiron == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the bandit Skiron, nicknamed 'The Butcher'. The reward for living or dead is 1000 gold coins. " );
			CheckWantedPosterSkiron = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the bandit Skiron, nicknamed 'The Butcher'. The reward for living or dead is 1000 gold coins. " );
			CheckWantedPosterSkiron = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "     Wanted Announcement " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " The authorities of Khorinis are looking for the bandit Skiron, nicknamed 'The Butcher'. The reward for living or dead is 1000 gold coins. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Andre " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_RocksWantedPoster(C_Item)
{
	name = " Wanted Announcement " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_RocksWantedPoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Wanted Bandit - Rocks 'Nimble' " ;
	inv_animate = 1;
};

func void Use_ItWr_RocksWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterRocks == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the robber Rox, nicknamed 'Nimble'. The reward for living or dead is 750 gold coins. " );
			CheckWantedPosterRocks = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive, " The authorities of Khorinis are looking for the robber Rox, nicknamed 'Nimble'. The reward for living or dead is 750 gold coins. " );
			CheckWantedPosterRocks = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , "     Wanted Announcement " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " The authorities of Khorinis are looking for the bandit Rox, nicknamed 'Nimble'. The reward for dead or alive is 750 gold coins. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , "            Lord Andre " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_StonePower(C_Item)
{
	name = " White Rock " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " White Rock " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_StonePower;
	inv_animate = 1;
};

func void Use_ItWr_StonePower()
{
	var int nDocID;
	var int rnd;

	if((MIS_SwampSecret == LOG_Running) && (StonePower == FALSE))
	{
		B_LogEntry(TOPIC_SwampSecret, " Apparently, the magical essence of the swamp grass is indeed generated by the magic of earth and rock. I think Saturas will be interested in looking at this ancient tablet. " );
		StonePower = TRUE;
	};
	if(StonePowerRead == FALSE)
	{
		B_Say(self,self,"$HOWINTEREST");
		StonePowerRead = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_158 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_158 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
	Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " And the white rock gave birth to the seed of life and absorbed this seed with the power of the rock. This seed gave rise to a sprout, but this sprout was soft, the power of the rock endowed it with magic. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " A sprout , endowed with the magic of the rock, divided it equally between its seeds and the wind carried them to the far corners of the world. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Those, in turn, gave magic to their seeds, and so countless sprouts began to grow on the ground. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " In each of them, the power of the white rock was reduced by an uncountable number of times. " );
	Doc_Show(nDocID);
};

instance ItWr_HighRunes(C_Item)
{
	name = " Higher Runes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " High Runes " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_HighRunes;
	inv_animate = 1;
};

func void Use_ItWr_HighRunes()
{
	var int nDocID;
	var int rnd;

	if(HighRunes == FALSE)
	{
		HighRunes = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random( 100 );
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
	if((BookBonus_159 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_159 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID, 0 , " Higher Runes " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " To create magical runes, different types of runestones are sometimes used. It all depends on how powerful the rune needs to be made. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " For spells of the first and second circles of magic, ordinary runestones are used, for the third and fourth circles - senior runes, and for creating the most difficult runes of the fifth and sixth circles - supreme ones! " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Xardas " );
	Doc_Show(nDocID);
};

instance ItWr_DragonHigh(C_Item)
{
	name = " Ore Power " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DragonHigh;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

func void Use_ItWr_DragonHigh()
{
	var int nDocID;

	if((DragonHigh == FALSE) && (hero.guild == GIL_DJG))
	{
		DragonHigh = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID, 0 , " ...I believe that magic ore is the key to victory! Maybe if you manage to coat your armor with it, they will become much stronger. However, not many people are able to do this... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Pea, Dragon Slayer " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};
