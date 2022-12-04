

instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = "Dopis od Xardase";
	inv_animate = 1;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " If everything goes as I expect, you should now search the Irdorath Halls. You will find the necessary information in the book you brought to Pyrokar. You will open it with the words 'XARAK BENDARDO'. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " See you soon! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Xardas");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, " Xardas told me in his letter what words will open the book of the Hall of Irdorath. " );
	};
	MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
};


instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Halls of Irdorath " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
	inv_animate = 1;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		AI_Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, " I managed to open Xardas's book. It contained a secret message and a strange key. Who knows what else I will come across in the monastery dungeon. " );
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		AI_Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Halls of Irdorath " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath_Open;
	inv_animate = 1;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;

	if (ItWr_SCReadsHallsofIrdorath ==  FALSE )
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, " I read Xardas's book. It mentioned some secret library. It must be somewhere in the monastery's cellar. " );
		ItWr_SCReadsHallsofIrdorath = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... so I hid the entrance to the library behind a secret door to protect my records of Beliar's temples. " );
	Doc_PrintLines(nDocID, 0 , " If my brothers found out about them, they would surely destroy them all, blind people. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " All they know now is that these temples once existed. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " But just to be sure, I have assigned several servants to guard the library. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " This key opens the last door. " );
	Doc_Show(nDocID);
};

var int BookBonusRhet;

instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Old dusty book " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
	inv_animate = 1;
};

func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;

	if((BookBonus_30 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_30 = TRUE ;
	};
	if (BookBonusRhet ==  FALSE )
	{
		BookBonusRhet = TRUE;
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_WOOD_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_WOOD_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... now I know for sure that the building is the Halls of Irdorath. It lies on an island near the port of Khorini. It is obvious that Beliar is interested in the ore mines... " );
	Doc_PrintLines(nDocID,0,"");

	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID, 0 , " ... the stronger they are, the better they will serve him as undead slaves. Paladins transformed in this way can really overwhelm any warrior. I just hope the others don't notice that I got one down here. .. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " ... the transformed paladin no longer responds to any stimuli. I have stored his armor and other items in the back room, the door of which can only be opened from the inside. To get there, someone will need a teleportation rune. Instructions for I wrote down its production in the almanac so that the Chosen One would find it one day... " );
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID, 0 , " ... the signs speak clearly! When the Chosen One comes, he will need all the help we can give him. Beliar is already too powerful. I have managed to obtain some very valuable artifacts that I will hide right here. I believe namely, that the Chosen One will come directly from our ranks, " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 1 , " and that's why I wrote the relevant instructions for him in the almanac. " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " ... now I know for sure. We cannot hold back the hand of fate. When Beliar gains the power he needs, he will rise and seek to rule the world. I must seek out the Chosen One, or our fate is sealed. " );
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID, 0 , " ... a war will come, a war for the fate of the whole world. But it seems to me that only I can recognize the signs - everyone else does not notice them at all. But I know that the Chosen One will appear and his coming will be foretell a war. A war as old as time itself - but its end is already on the horizon " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 1 , " and I'm not just going to stand here with my hands in my lap and watch others take the fate of the world into their own hands! " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " ... I studied the ancient writings and found out how to make the legendary weapons of the dragon lords of old. But I still have no idea how to get the necessary ingredients - but I also recorded the instructions in the almanac just to be sure. Who knows what the future will bring us horrors - we may even have to face angry dragons. " );
	};

	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = " Crumpled Letter " ;
	text[ 4 ] = " A small note that fell out of the 'Halls of Irdorath' book... " ;
	inv_animate = 1;
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " A lamp brings light underground... " );
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


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = " Nautical chart to the island of Irdorath " ;
	text[ 4 ] = " Map showing the exact location of the island of Irdorath... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if ((MIS_ShipIsFree ==  FALSE ) && (Chapter <  6 )) .
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if ( MIS_SCKnowsWayToIrdorath ==  FALSE )
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship, " I will probably have to get to the strange island of our enemies. But for that I will need a ship, a crew and a captain. " );
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
	MIS_SCKnowsWayToIrdorath = TRUE;
};


instance ITMI_SEAMAPLOSTISLAND(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itmi_seamaplostisland;
	description = " Sea Map to the Mysterious Island " ;
	text[ 4 ] = " The island itself is marked on the map and the exact path to it... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itmi_seamaplostisland()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = " Power of Attorney " ;
	text[ 4 ] = " Document granting access to the paladin ship... " ;
	inv_animate = 1;
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " 	Power of Attorney " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " This document entitles its holder to roam freely in Lord Hagen's royal war galley for an unlimited period of time and lead her wherever he sees fit. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " - royal seal - " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask_Sky.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Innosovy slzy";
	text[ 4 ] = " Effects unknown... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask_Sky.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Innosovy slzy";
	text[ 3 ] = " This potion grants immeasurable power to Fire Mages... " ;
	text[ 4 ] = " To the one who does not belong to them but will bring only death... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_PotionOfDeath()
{
	var int KarmaInnos;

	KarmaInnos = INNOSPRAYCOUNT  -  INNOSCRIMECOUNT ;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,50);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	}
	else  if (KarmaInnos >=  500 )
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		B_RaiseAttribute_Bonus(self,ATR_HITPOINTS_MAX,50);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = NAME_amulet;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ITAM_AMULETTOFDEATH_MIS_SKY.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	description = " Divine Innos Aura " ;
	text[0] = NAME_Prot_Phis;
	count[0] = 40;
	text[1] = NAME_Prot_Point;
	count[1] = 40;
	text[2] = NAME_Prot_Fire;
	count[2] = 40;
	text[3] = NAME_Prot_Magic;
	count[3] = 40;
	text[ 4 ] = " The bearer of this amulet is protected by Innos himself... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 40;
	self.protection[PROT_BLUNT] += 40;
	self.protection[PROT_POINT] += 40;
	self.protection[PROT_FIRE] += 40;
	self.protection[PROT_MAGIC] += 40;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 40;
	self.protection[PROT_BLUNT] -= 40;
	self.protection[PROT_POINT] -= 40;
	self.protection[PROT_FIRE] -= 40;
	self.protection[PROT_MAGIC] -= 40;
};

instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Sagittin lék";
	text[1] = NAME_Bonus_HP;
	count[ 1 ] = HP_essence;
	text[ 4 ] = " Medicinal anti-hangover drink... " ;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};
