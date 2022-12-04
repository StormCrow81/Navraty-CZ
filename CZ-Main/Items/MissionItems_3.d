

const int AM_EyeProtFire = 50;
var int readbooksdone_99;

instance ItMi_InnosEye_MIS(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	text[2] = NAME_Prot_Fire;
	count[2] = AM_EyeProtFire;
	text[ 4 ] = " The eye pulsates with a mysterious energy... " ;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

instance ItMi_InnosEye_Bad(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " The artifact pulses with mysterious energy... " ;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_FIRE] += AM_EyeProtFire;
};

func void UnEquip_InnosEye()
{
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
};

instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Discharged_Mis;
	on_unequip = unequip_itmi_innoseye_discharged_mis;
	text[2] = NAME_Prot_Fire;
	count[2] = AM_EyeProtFire;
	text[ 4 ] = " The eye is darkened and does not glow at all... " ;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	self.protection[PROT_FIRE] += AM_EyeProtFire;
};

func void unequip_itmi_innoseye_discharged_mis()
{
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
};


instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name = "Innosovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Broken_Mis;
	text[3] = TEXT_Innoseye_Setting;
	text[4] = TEXT_Innoseye_Gem;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = " Power of Attorney for Pyrokar " ;
	text[ 4 ] = " This document authorizes its owner to wear the Eye of Innos... " ;
	inv_animate = 1;
};


func void Use_PermissionToWearInnosEye()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The bearer of this document may enter the hallowed halls of the monastery. May his wishes regarding the Eye of Innos be granted immediately. These orders are given by virtue of my position as the king's chief representative on the island, and they are final. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Lord Hagen");
	Doc_Show(nDocID);
};


instance ItWr_XardasBookForPyrokar_Mis(C_Item)
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
	on_state[0] = Use_XardasBookForPyrokar;
	inv_animate = 1;
};


func void Use_XardasBookForPyrokar()
{
	AI_Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Cornelius' Diary " ;
	text[ 4 ] = " Diary of the Khorini Viceroy's Assistant... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseCorneliusTagebuch;
	inv_animate = 1;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;

	if(Cornelius_IsLiar == FALSE)
	{
		B_LogEntry(TOPIC_RescueBennet, " This log proves that Bennet is innocent. " );
		Cornelius_IsLiar = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " If Larius continues like this, I will have to find another position. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " A very strange thing happened to me last night. I was approached by one of those black cocoons we've been hearing so much about lately. I wasn't too nervous, even though the mysterious visitor oozed evil and his the power was almost palpable. But his voice was calm and pleasant - I felt I just had to trust him. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " He offered me 20,000 gold if I see to it that one of those mercenaries is convicted and hanged. That's too good an offer to ask. " );
	Doc_PrintLines(nDocID, 1 , " Of course I agreed, because the scumbag doesn't deserve anything else anyway. And the gold I get for it will keep me decent until I die. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " I almost didn't have to lift a finger. They already have one of those mercenaries locked up. No matter what they charge him with, he'll hang. Great way to keep your word and ensure a carefree old age. " );
	Doc_Show(nDocID);
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Almanach posedlých";
	text[ 4 ] = " Just looking at this book starts to induce madness... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_DementorObsessionBook;
	inv_animate = 1;
};


func void Use_DementorObsessionBook()
{
	var int nDocID;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);

	if(hero.guild == GIL_KDF)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,Font_Book_New);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,Font_Book_New_Small);
		Doc_PrintLines(nDocID, 0 , " Come to me your strength " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " From the Dark Halls " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " Come to me " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID, 0 , " By a beam of light invisible " );
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Enter me and burn " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");

		if (Chapter >=  3 )
		{
			Doc_PrintLine(nDocID,1,"Vino");
			Doc_PrintLine(nDocID,1,"Fernando");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Malak");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Bromor");
		};
		if (Chapter >=  4 )
		{
			Doc_PrintLine(nDocID,1,"Engrom");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Randolph");
			Doc_PrintLine(nDocID,1,"");
		};
		if (Chapter >=  5 )
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Sekob");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Brutus");
			Doc_PrintLine(nDocID,1,"");
		};
		Doc_Show(nDocID);
	};
};


instance ItWr_PyrokarsObsessionList(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PyrokarsObsessionList;
	scemeName = "MAP";
	description = " Pyrokar's Magic Scroll " ;
	inv_animate = 1;
};


func void Use_PyrokarsObsessionList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Obsessed with: " );

	if (Chapter >=  3 )
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Fernando");
		Doc_PrintLine(nDocID,0,"Vino");
		Doc_PrintLine(nDocID,0,"Malak");
		Doc_PrintLine(nDocID,0,"Bromor");
	};
	if (Chapter >=  4 )
	{
		Doc_PrintLine(nDocID,0,"Engrom");
		Doc_PrintLine(nDocID,0,"Randolph");
	};
	if (Chapter >=  5 )
	{
		Doc_PrintLine(nDocID,0,"Sekob");
		Doc_PrintLine(nDocID,0,"Brutus");
		Doc_PrintLine(nDocID,0,"");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[ 1 ] = HP_essence;
	text[ 4 ] = " Black Fever Cure... " ;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = " Walking stick " ;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_RADIUS;
	count[3] = range;
	text[ 4 ] = " The decorative letter 'M' is displayed on the handle... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MalethsBanditGold(C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
	text[ 4 ] = " A bag full of gold... " ;
	inv_animate = 1;
};

func void Use_MalethsBanditGold()
{
	B_PlayerFindItem(ItMi_Gold,300);
};


instance ItMi_Moleratlubric_MIS(C_Item)
{
	name = " Rat Rat Lard " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_Pitch_New.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_BabosLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosLetter;
	scemeName = "MAP";
	description = "Dopis pro Baba";
	inv_animate = 1;
};


func void Use_BabosLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Milý Babo,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " You must be wondering how we are writing to you. We wish you all the best for the future and as a parting gift we are sending you a picture so that you have something to remember during the long evenings in the monastery. Good luck - we hope you'll like the picture. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Feht a Bonka " );
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Kresba";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = " Image of a naked woman " ;
	inv_animate = 1;
};


func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Pinup.TGA",0);
	Doc_Show(nDocID);
};


instance ItWr_BabosDocs_MIS(C_Item)
{
	name = " Bundle of Papers " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosDocs;
	scemeName = "MAPSEALED";
	description = name;
	text[ 4 ] = " Several documents rolled together... " ;
	inv_animate = 1;
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Divine Power of the Stars " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
	inv_animate = 1;
};


var int Astronomy_once;

func void Use_Astronomy()
{
	var int nDocID;

	if(Astronomy_once == FALSE)
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		Astronomy_once = TRUE;
	};
	if((BookBonus_25 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_25 = TRUE ;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... but when the power of an ox combines with the ideals of a warrior, then beware of the events that may occur. " );
	Doc_PrintLines(nDocID, 0 , " The unbridled strength of the ox and the endurance of the warrior can upset the ancient balance of power. The border between the dimensions then begins to weaken - until eventually it is so thin that Beliar's monsters can easily penetrate us from the world of shadows. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Let the wars of old be an example of how such things turn out. Even when the bond between the worlds was still strong, the followers of evil brought here death and destruction, from which only Innos and his chosen one protected mankind. " );
	Doc_PrintLines(nDocID, 1 , " Innos protect us if such a threat should arise again, for no other chosen of Innos has come for over a hundred years. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[ 1 ] = HP_essence;
	text[ 4 ] = " Obsession Cure... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	if(Npc_IsPlayer(self))
	{
		B_ClearSCObsession(self);
	};
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",self,self,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_GolemChest;
	description = " Month " ;
	text[ 4 ] = " This purse is full of coins... " ;
	inv_animate = 1;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	AI_Print(PRINT_FoundGold50);
	AI_Print(PRINT_FoundRing);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
};


instance ITWR_SHATTEREDGOLEM_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = " Very old map " ;
	text[ 4 ] = " One place is marked with a cross... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_ShatteredGolem_Mis()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_DiegosLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = "Dopis od Diega";
	text[ 4 ] = " This letter is addressed to Gerbrandt... " ;
	inv_animate = 1;
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Gerbrandt, you know, you should have killed me. Now I'm back in town looking for you. And when I find you, I'll make meatballs out of you. You've known me long enough to know that I won't let you fool me. If you like life, pack up your little things and leave your business to me. That way we'll settle down. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Diego");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_DiegosTreasure;
	description = " Diego's Old Purse " ;
	text[ 4 ] = " Overworld bag stuffed with gold... " ;
	inv_animate = 1;
};


func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;
	B_PlayerFindItem(ItMi_Gold,DiegosTreasure);
};


instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name = " Holy Water " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = " Holy water " ;
	text[ 4 ] = " Fire mage Ulthar gave me this bottle of holy water... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


var int ItWr_GoingBefore_Mis_OneTime;

instance ItWr_MinenAnteil_Mis(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = "Akcie";
	text[ 4 ] = " A security guaranteeing ownership of an ore deposit... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_MinenAnteil_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " By this document, the king and ruler of this realm grants to its bearer the right to forge in the territory under the royal administration and to exercise the office of prospector on it. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Royal Prospector " );
	Doc_PrintLine(nDocID,0,"Salandril");
	Doc_Show(nDocID);
	SC_KnowsProspektorSalandril = TRUE;
	if(ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile, " The guy who sold the mining shares to the merchants is called Salandril. I'll probably find him in the upper district of Khorinis, if he hasn't already fled from justice somewhere else. " );
		if (Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile, " Salandril is dead. I must tell Serpentes. " );
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};


instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name = NAME_amulet;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = " Soul Summoning Amulet " ;
	text[ 4 ] = " Amulet of protection against the dark magic of the Seekers... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = " Kus kamene " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_KarrasBlessedStone_Mis_Sky.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " Stone from the Holy Land... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_RichterKomproBrief_MIS (C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RichterKomproBrief;
	scemeName = "MAP";
	description = " Orders from the judge " ;
	text[ 4 ] = " This note was written by the judge of the city of Khorinis... " ;
	inv_animate = 1;
};


func void Use_RichterKomproBrief()
{
	var int nDocID;
	SCKnowsRichterKomproBrief = TRUE ;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Morgahard, you wretched bastard! Either follow my orders or I'll get pissed off and have you all locked up until you're black! You must do it tomorrow night. Larius is starting to suspect something. If we don't destroy the evidence now, then it may be too late. I'll see to it that you meet him tonight at the marketplace. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_MorgahardTip(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};


func void Use_MorgahardTip()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Moving on. Hopefully we'll meet again when things calm down a bit. No worries guys. If all else fails, I'll ask Onar to see to it. It'll be fine. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"M.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_MAP_SHRINE_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = " Altar Map " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Shrine_MIS()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_VinosKellergeister_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Duch vína";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_VinosKellergeister_Mis;
	inv_animate = 1;
};


func void Use_VinosKellergeister_Mis()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_99 == FALSE)
	{
		READBOOKSDONE_99 = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
		RankPoints = RankPoints + 1;
		B_LogEntry( TOPIC_COOK , " Ingredients for GIN: 10x brandy. " );
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
	if((BookBonus_26 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_26 = TRUE ;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Grape Power " );
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... I've already tried a lot in my life, but this fruit that was brought to me from abroad last week exceeds all my expectations... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... the juice of these grapes is far richer than anything obtainable in these parts... " );
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " ... so so far so good. But I still can't sleep thinking what would happen if I got caught making that gin. I don't even want to know what the militia would do. Maybe they even threw over the barrier... " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " ... they're getting suspicious. I'd better steam out of here and wait for things to calm down a bit. I'll come back when I'm sure they're not after me anymore... " );
	Doc_Show(nDocID);
};


instance ITWR_DEATH1(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ITWR_DEATH1;
	scemeName = "MAP";
	description = "Dech smrti I";
	text[ 4 ] = " The first part of the recipe for the preparation of the 'Breath of Death' potion... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITWR_DEATH1()
{
	var int nDocID;
	var int rnd;

	if(KNOWS_BREATH_OF_DEATH1 == FALSE)
	{
		B_GivePlayerXP(250);
		KNOWS_BREATH_OF_DEATH1 = TRUE;

		if(MIS_ROBA_XARDAS == LOG_Running)
		{
			B_LogEntry( TOPIC_XARDAS_ROBA , " I found the first part of the recipe... " );
		};

		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
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
	if((BookBonus_27 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_27 = TRUE ;
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Dech smrti'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Demon's heart - 1 piece " );
	Doc_PrintLine(nDocID, 0 , " Skeleton bone - 20 pieces " );
	Doc_PrintLine(nDocID, 0 , " Carcass meat - 5 pieces " );
	Doc_PrintLine(nDocID,0,"Lebka - 1 kus");
	Doc_PrintLine(nDocID, 0 , " Royal sorrel - 2 pieces " );
	Doc_PrintLine(nDocID, 0 , " Dragon root - 2 pieces " );
	Doc_PrintLine(nDocID, 0 , " Goblin Berries - 2 pieces " );
	Doc_PrintLine(nDocID, 0 , " Sun aloe - 1 piece " );
	Doc_PrintLine(nDocID, 0 , " Fire Root - 1 piece " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"______________");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " END OF THE FIRST PART OF THE RECIPE " );
	Doc_PrintLines(nDocID,0,"______________");
	Doc_Show(nDocID);
};


instance ITWR_DEATH2(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ITWR_DEATH2;
	scemeName = "MAP";
	description = " Dech smrti II " ;
	text[ 4 ] = " The second part of the recipe for the preparation of the 'Breath of Death' potion... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITWR_DEATH2()
{
	var int nDocID;
	var int rnd;

	if(KNOWS_BREATH_OF_DEATH2 == FALSE)
	{
		B_GivePlayerXP(250);
		KNOWS_BREATH_OF_DEATH2 = TRUE;

		if(MIS_ROBA_XARDAS == LOG_Running)
		{
			B_LogEntry( TOPIC_XARDAS_ROBA , " I found the second part of the recipe... " );
		};

		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
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
	if((BookBonus_28 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_28 = TRUE ;
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Dech smrti'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"______________");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " CONTINUATION OF THE FIRST PART OF THE RECIPE " );
	Doc_PrintLines(nDocID,0,"______________");
	Doc_PrintLine(nDocID, 0 , " Blue without - 10 pieces " );
	Doc_PrintLine(nDocID, 0 , " Black pearl - 1 piece " );
	Doc_PrintLine(nDocID, 0 , " Tongue of Fire - 3 pieces " );
	Doc_PrintLine(nDocID, 0 , " Aquamarine - 5 pieces " );
	Doc_PrintLine(nDocID,0,"Perla - 3 kusy");
	Doc_PrintLine(nDocID, 0 , " Rock crystal - 10 pieces " );
	Doc_PrintLine(nDocID, 0 , " Quartz - 5 pieces " );
	Doc_PrintLine(nDocID, 0 , " Red pepper - 1 piece " );
	Doc_PrintLine(nDocID, 0 , " 'Balsam of Providence' wine - 1 bottle " );
	Doc_PrintLine(nDocID, 0 , " Elixir of Pure Mana - 1 bottle " );
	Doc_PrintLine(nDocID, 0 , " Water - 15 bottles " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};
