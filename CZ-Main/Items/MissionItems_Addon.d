

instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage_Sealed;
	scemeName = "MAPSEALED";
	description = " Message for Vatras " ;
	text[ 4 ] = " This message is carefully sealed... " ;
	inv_animate = 1;
};


var int Use_SaturasFirstMessage_OneTime;

func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Dear Vatrasi! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " You were right. It really looks like they were worshipers of Adana. But the ornament we found is much more important now. It's probably an artifact of some kind - a key. We need to study it more thoroughly. They came out, please someone from the 'Circle of Water' to bring it back to us. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Saturation " );
	Doc_Show(nDocID);
	if((Use_SaturasFirstMessage_OneTime == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW, " I found a message from one of the bandits that Cavalorn was supposed to deliver to the Water Mage Vatras. So now it's up to me. " );
		Use_SaturasFirstMessage_OneTime = TRUE;
	};
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater, " One group here calls itself the 'Ring of Water' and seems to be led by Water mages. " );
	};
	if(SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		Log_AddEntry(TOPIC_Addon_RingOfWater, " Cavalorn belongs to the 'Ring of Water'. " );
	};
	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};


instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_SaturasFirstMessage;
	scemeName = "MAP";
	description = " Message for Vatras " ;
	text[ 4 ] = " The seal on the message was broken... " ;
	inv_animate = 1;
};

instance ItMi_Ornament_Addon(C_Item)
{
	name = " Stone Shard " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Stone fragment of a large circular ornament... " ;
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD ;
	inv_animate = 1;
};

instance ItMi_Ornament_Addon_Vatras(C_Item)
{
	name = " Stone Shard " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[ 0 ] = " Stone fragment of a large circular ornament... " ;
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD ;
	inv_animate = 1;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Ornaments;
	description = "Nefariusova mapa";
	text[ 4 ] = " On this map, the places where there are missing parts of the ornament are marked... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Ornaments()
{
	var int  Document ;
	SC_SAW_ORNAMENT_MAP = TRUE;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ITWR_MAP_NEWWORLD_DEXTER_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Dexter;
	description = "Mapa Khorinisu";
	text[ 4 ] = " Bandit leader Dexter's camp is marked on this map... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Dexter()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


prototype Rangerring_Prototype(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;
	description = " Aquamarine Ring " ;
	text[ 3 ] = " This ring is the hallmark of the 'Circle of Water'... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if ( ENTERED_ADDONWORLD  ==  FALSE )
		{
			if(Npc_HasItems(hero,ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};
		SCIsWearingRangerRing = TRUE;
		AI_Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};
		RangerRingIsLaresRing = FALSE;
	};
};


instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	text[ 4 ] = " This ring belongs to Lares... " ;
};

instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	text[ 4 ] = " This ring belongs to me... " ;
};

instance ItRi_LanceRing (Rangerring_Prototype)
{
	text[ 4 ] = " This ring belongs to Lance... " ;
};

instance ItMi_PortalRing_Addon(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Kruhový ornament";
	text[ 4 ] = " This circular ornament opens a magical portal... " ;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD ;
	inv_animate = 1;
};

instance ItWr_Martin_MilizEmpfehlung_Addon (C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MartinMilizEmpfehlung_Addon;
	scemeName = "MAP";
	description = " Martin's recommendation letter " ;
	text[ 4 ] = " Letter of recommendation for Lord Andre's militia commander... " ;
	inv_animate = 1;
};


func void Use_MartinMilizEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Dear Lord Andre! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Along with this letter, I am sending you a promising militia recruit. I have found him useful, careful and consistent in solving complex tasks. I am sure he will protect the king and the citizens of this city equally well! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Proviantmistr Martin");
	Doc_Show(nDocID);
};


instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RavensKidnapperMission_Addon;
	scemeName = "MAP";
	description = "Ravenovy rozkazy";
	text[ 4 ] = " I took this letter from the bandit Dexter... " ;
	inv_animate = 1;
};


var int Use_RavensKidnapperMission_Addon_OneTime;

func void Use_RavensKidnapperMission_Addon()
{
	var int nDocID;
	if((Use_RavensKidnapperMission_Addon_OneTime == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, " So now I have it in black and white. The ex-red baron Raven is behind the kidnappings of Khorin residents. He is hiding somewhere behind the mountains northeast of the city. Vatras should see this document. " );
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};
	SCKnowsMissingPeopleAreInAddonWorld = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Dexter! If you don't take some more people out of town soon and send them to me, we're in for some serious trouble with the boys at our base. I'm in dire need of more slaves, or I'll soon have a mutiny on my neck. I don't have to tell you , what does that mean, see? I've almost made it to the temple, so I definitely can't afford any trouble like that now. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Raven");
	Doc_Show(nDocID);
};


instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_VatrasKDFEmpfehlung_Addon;
	scemeName = "MAP";
	description = " Vatras' letter of recommendation " ;
	text[ 4 ] = " This letter will help me get to the monastery of the Fire Mages... " ;
	inv_animate = 1;
};


func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Brothers of Fire! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I have just learned that you require some fee to join your ranks. Therefore, with this letter I am sending a pious man who would like to become your novice. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Vatras");
	Doc_Show(nDocID);
};


instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name = " Hallowed statuette of Innose " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue * 10;
	visual = "ItMi_InnosStatue_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_GoblinnosStatue_Daron_New(C_Item)
{
	name = " Hallowed statuette of Innose " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue * 5;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " It looks kind of suspicious... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_LuciasLoveLetter_Addon;
	scemeName = "MAP";
	description = " Farewell letter from Lucia " ;
	inv_animate = 1;
};


func void Use_LuciasLoveLetter_Addon()
{
	var int nDocID;

	if (MIS_LuciasLetter ==  FALSE )
	{
		MIS_LuciasLetter = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
		B_LogEntry(TOPIC_Addon_Lucia, " Lucia wrote a farewell letter to Elvrich. He might be interested in that. " );
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Beloved Elvrich! I have no words to apologize to you. I know it will be hard to understand, but I have come to the conclusion that it will be better for both of us if you find a nicer girl than me me. I'm leaving and I'm not coming back. Goodbye! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lucia");
	Doc_Show(nDocID);
};


prototype EffectItemPrototype_Addon(C_Item)
{
	name = " Stone " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD ;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_Rake(C_Item)
{
	name = " Rake " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "G3_Item_Tool_Rake_01.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

func void Use_Rake()
{
	if(Npc_IsPlayer(self) && (RakeBONUS == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 50;
		AI_NoticePrint(3000,4098,NAME_Addon_RakeBonus);
		RakeBONUS = TRUE;
	};
};

instance ItRi_Addon_BanditTrader(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = " Ornate Ring " ;
	text[ 4 ] = " Araxos Overseas Merchant Guild Symbol... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItWr_Addon_BanditTrader(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_BanditTrader;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " I found this letter with the bandits behind Sekob's farm... " ;
	inv_animate = 1;
};


var int Use_ItWr_Addon_BanditTrader_OneTime;

func void Use_ItWr_Addon_BanditTrader()
{
	var int nDocID;
	BanditTrader_Delivery_Read = TRUE ;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " 15 short swords " );
	Doc_PrintLines(nDocID,0,"20 kordů");
	Doc_PrintLines(nDocID, 0 , " 25 loaves of bread " );
	Doc_PrintLines(nDocID, 0 , " 15 bottles of wine " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " That was the last time! It's getting too much. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Fernando");
	Doc_Show(nDocID);
	if((MIS_Vatras_FindTheBanditTrader != 0) && (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_Bandittrader, " I found a document that proves that Fernando is the one who delivers weapons to the bandits. " );
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};


instance ItWr_Vatras2Saturas_FindRaven (C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven_Sealed;
	scemeName = "MAPSEALED";
	description = " Message for Saturas " ;
	text[ 4 ] = " This message is carefully sealed... " ;
	inv_animate = 1;
};

func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milý Saturasi!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I hope you reach your destination soon. It's been quiet here in town lately, but I'm afraid it's not just the calm before the storm. You should hurry. And one more thing: I'm sending you help. Delivery this news is a really special person. I can't say for sure, but it might be HIM. Try him out. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Vatras");
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};


instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Vatras2Saturas_FindRaven;
	scemeName = "MAP";
	description = " Message for Saturas " ;
	text[ 4 ] = " The seal on the message was broken... " ;
	inv_animate = 1;
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = NAME_amulet;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = Value_Am_DexStrg;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = " Quest Maze Amulet " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};

instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name = " Swamp Rat Meat " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_ItFo_Addon_Krokofleisch;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
	inv_animate = 1;
};

func void Use_ItFo_Addon_Krokofleisch()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	on_equip = Equip_MorgansRing;
	on_unequip = UnEquip_MorgansRing;
	wear = WEAR_EFFECT;
	description = "Morganův prsten";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 5;
	text[ 4 ] = " This ring is decorated with many beautiful runes... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_MorgansRing()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,5);
	};
};

func void UnEquip_MorgansRing()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-5);
	};
};

instance FakeUnitor(C_Item)
{
	name = " Focus Stone " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Focus(C_Item)
{
	name = " Focus Stone " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " A crystal concentrating magical energy... " ;
	inv_animate = 1;
};

instance ItMi_UnSharp_MagicCrystal(C_Item)
{
	name = " Piece of Crystal " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " Contains magical energy... " ;
	inv_animate = 1;
};

instance ItMi_MagicCrystal(C_Item)
{
	name = " Magical Focus Stone " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " Magical Energy Focusing Crystal... " ;
	inv_animate = 1;
};

instance ItMi_Addon_Steel_Paket(C_Item)
{
	name = " Steel Package " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " A heavy package with a considerable amount of steel... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name = " Old stone tablet " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_StonePlateCommon;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	description = name;
	text[ 4 ] = " The table is covered with inscriptions in an ancient language... " ;
	text[5] = NAME_Value;
	count[5] = 10;
	inv_animate = 1;
};


func void Use_StonePlateCommon()
{
	var int nDocID;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,-1,70,50,90,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " The warrior caste has sent down the wrath of God on our heads. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " QUARHODRON'S follower RHADEMES was exiled, but a fragment of him and from the place of his exile penetrated to us. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " We were completely powerless against her. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " ADAN'S WRATH FALLS ON JHARKENDAR! " );
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"Maya_Stoneplate_02.TGA",0);
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_01(C_Item)
{
	name = " Red Stone Tablet " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_01;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	description = name;
	text[ 4 ] = " The table is covered with inscriptions in the ancient language of the Builders... " ;
	inv_animate = 1;
};


func void Use_Addon_Stone_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID, 0 , " We, the last three leaders of the Council of Five, set various traps in the halls of the temple and concealed the entrance, so that the sword would never see the light of day again. " );
	}
	else
	{
		Doc_PrintLines(nDocID, 0 , " Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn. " );
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_05(C_Item)
{
	name = " Yellow Stone Tablet " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_05;
	scemeName = "MAP";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	description = name;
	text[ 4 ] = " The table is covered with inscriptions in the ancient language of the Builders... " ;
	inv_animate = 1;
};


func void Use_Addon_Stone_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID, 0 , " The first trap was created by me, who fought against the decision of the Three. And only I know the right entrance. " );
	}
	else
	{
		Doc_PrintLines(nDocID, 0 , " Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. " );
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_03(C_Item)
{
	name = " Blue Stone Tablet " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_03;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	wear = WEAR_EFFECT;
	description = name;
	text[ 4 ] = " The table is covered with inscriptions in the ancient language of the Builders... " ;
	inv_animate = 1;
};


func void Use_Addon_Stone_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID, 0 , " The second trap was built by KHARDIMON. And only he who follows the path of Light will finally enter the third chamber. " );
	}
	else
	{
		Doc_PrintLines(nDocID, 0 , " KHARDIMON Winery of Ihwqpjrnn. Experience Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe. " );
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_04(C_Item)
{
	name = " Green Stone Table " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_04;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	wear = WEAR_EFFECT;
	description = name;
	text[ 4 ] = " The table is covered with inscriptions in the ancient language of the Builders... " ;
	inv_animate = 1;
};


func void Use_Addon_Stone_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID, 0 , " The third trap is QUARHODRON'S work. And only he knows how to open the portal. " );
	}
	else
	{
		Doc_PrintLines(nDocID, 0 , " Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd. " );
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMi_Addon_Stone_02(C_Item)
{
	name = " Purple Stone Tablet " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = Use_Addon_Stone_02;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0 ;
	inv_snot = 0 ;
	wear = WEAR_EFFECT;
	description = name;
	text[ 4 ] = " The table is covered with inscriptions in the ancient language of the Builders... " ;
	inv_animate = 1;
};


func void Use_Addon_Stone_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(nDocID, 0 , " And it was also QUARHODRON who, with KHARDIMON's help, closed the outer gate of the temple. None of them survived the ritual. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Only I am left, I would tell you the whole story. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " I hope RHADEMES rots in the temple forever! " );
	}
	else
	{
		Doc_PrintLines(nDocID, 0 , " QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Revfnbrebuilt. Sebnejbuwd Weinfiwjf Ihwqpjrnn. " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		B_Say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItMI_Addon_Compass_Mis (C_Item);
{
	name = " Golden Compass " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
	text[ 4 ] = " This navigation device is made of pure gold... " ;
	inv_animate = 1;
};

instance ItSE_Addon_FrancisChest(C_Item)
{
	name = NAME_Chest;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = FrancisChest;
	description = " Treasure chest " ;
	text[ 4 ] = " Very heavy... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void FrancisChest()
{
	CreateInvItems(hero,ItMi_ChestGold,1);
	CreateInvItems(hero,ItMw_FrancisDagger_Mis,1);
	CreateInvItems(hero,ItMi_Gold,153);
	CreateInvItems(hero,ItMi_CupGold,1);
	CreateInvItems(hero,ItMi_SilverNecklace,1);
	CreateInvItems(hero,ITWR_Addon_FrancisAbrechnung_Mis,1);
	Snd_Play("Geldbeutel");
};

instance ITWR_Addon_FrancisAbrechnung_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Francis' ledger " ;
	text[ 4 ] = " This book contains all records of the distribution of pirate booty... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseFrancisAbrechnung_Mis;
	inv_animate = 1;
};


func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Merchant ship 'Mermaid' " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Total loot: 14560 gold " );
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posádka: 9840");
	Doc_PrintLine(nDocID, 0 , " Officers: 2500 " );
	Doc_PrintLine(nDocID,0,"Kapitán: 1000");
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " My share: 2220 " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Merchant ship 'Miriam' " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Total loot: 4890 gold " );
	Doc_PrintLine(nDocID,0,"-----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Posádka: 2390");
	Doc_PrintLine(nDocID, 0 , " Officers: 500 " );
	Doc_PrintLine(nDocID,0,"Kapitán: 500");
	Doc_PrintLine(nDocID,0,"----------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " My share: 1000 " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Merchant ship 'Nico' " );
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Total loot: 9970 gold " );
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Posádka: 5610");
	Doc_PrintLine(nDocID, 1 , " Officers: 1500 " );
	Doc_PrintLine(nDocID,1,"Kapitán: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " My share: 1860 " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Merchant ship 'Maria' " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " Total loot: 7851 gold " );
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Posádka: 4400");
	Doc_PrintLine(nDocID, 1 , " Officers: 750 " );
	Doc_PrintLine(nDocID,1,"Kapitán: 1000");
	Doc_PrintLine(nDocID,1,"----------------------");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID, 1 , " My share: 1701 " );
	Doc_PrintLine(nDocID,1,"");
	Francis_HasProof = TRUE;
	Doc_Show(nDocID);
	B_Say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_Addon_GregsLogbuch_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Greg's Diary " ;
	text[ 4 ] = " Pirate Leader Logbook... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGregsLogbuch;
	inv_animate = 1;
};


func void UseGregsLogbuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLines(nDocID, 0 , " I already have the beach full of teeth. Nothing but sand everywhere. I can't even sleep properly anymore because everything itches. Raven should finally pour in the gold for the prisoners so we can go to sea again. I have to talk to that snotty moron. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " What's this scumbag doing? He ordered his stinking arseholes not to let me in! So he's going to get a nasty bounce! I'm going to turn his sycophant Bloodwyn into fish food with my own hands! " );
	Doc_PrintLines(nDocID, 0 , " If he doesn't pay soon, I'll stop taking napkins. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLines(nDocID, 1 , " Those bandits are getting as rude as monkeys. They still haven't paid me for the last delivery. But we don't have enough information. I have to find out what Raven is up to. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " I'll take most of the crew ashore and secure the ore. Francis and a few people will stay here for the time being and fortify the camp. " );
	Doc_PrintLines(nDocID, 1 , " So as not to waste time, I gave Bones the armor. He will sneak into the bandit camp and find out what Raven is actually planning. " );
	Greg_GiveArmorToBones = TRUE ;
	Doc_Show(nDocID);
};

instance ItMi_TempelTorKey(C_Item)
{
	name = " Stone Table " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_TempelTorKey;
	description = " Quarhodron's Stone Tablet " ;
	text[ 4 ] = " This ancient artifact opens the entrance to the Temple of Adam... " ;
	inv_animate = 1;
};


func void Use_TempelTorKey()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jhehedra Akhantar");
	Doc_Show(nDocID);
};

instance ItMi_Addon_Bloodwyn_Head (C_Item)
{
	name = "Bloodwynova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_Addon_Masiafadept_Head (C_Item)
{
	name = "Hlava novice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_Ituseld_Head (C_Item)
{
	name = " Itu'Seld's Head " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_DeadManHead(C_Item)
{
	name = " The head of the deserter " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ITWR_ADDON_TREASUREMAP_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TreasureMap;
	description = " Treasure Map " ;
	text[ 4 ] = " Some places are marked on the map... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_TreasureMap()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel( Document , " Addon \A ddonWorld.zen " );
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};


instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name = "Láhev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_GregsBottle;
	scemeName = "MAPSEALED";
	description = " Sealed Bottle " ;
	text[ 4 ] = " There is a small piece of paper inside the bottle... " ;
	inv_animate = 1;
};


func void Use_GregsBottle()
{
	B_PlayerFindItem(itwr_addon_treasuremap_1,1);
};


instance itmi_erolskelch(C_Item)
{
	name = " Silver Chalice " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice_Sky.3DS";
	material = MAT_METAL;
	description = " Silver Chalice " ;
	text[ 4 ] = " There are some deep scratches on the outside... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_OrcHeal(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = " Scroll of Healing " ;
	text[ 4 ] = " The magic of this scroll can heal any creature... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItKe_OrcGonez(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItKe_OrcGonez;
	material = MAT_METAL;
	description = name;
	text[ 3 ] = " Semicircular key with cutouts at different angles... " ;
	text[ 4 ] = " On the lower part there is an illegible inscription under a layer of dirt... " ;
	inv_animate = 1;
};

func void Use_ItKe_OrcGonez()
{
	if(MIS_OldOrcKey == FALSE)
	{
		B_PlayerFindItem(ItKe_OldOrcKey,1);
		MIS_OldOrcKey = LOG_Running;
		Log_CreateTopic(TOPIC_OldOrcKey,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OldOrcKey,LOG_Running);
		B_LogEntry(TOPIC_OldOrcKey, " I found some strange key. Apparently it's the work of some orc, because it clearly has an inscription in the orc language. But who is it from? " );
	};
};

// ---------------------------------------------- Quest Ur-Tralla-- ----------------------------------------------

instance ItWr_AboutDumgar_P1 (C_Item);
{
	name = " Old Table " ;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Old Goblin Plate " ;
	text[ 3 ] = " Old Shabby Goblin Table... " ;
	text[ 4 ] = " The whole table is covered with inscriptions in goblin language... " ;
	on_state[ 0 ] = Use_ItWr_AboutDumgar_P1;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P1()
{
	var int nDocID;

	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KnowAboutNagDumgar_P1 == FALSE)
		{
			if (MIS_Empty == LOG_Running)
			{
				B_GivePlayerXP(150);
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
				};

				KnowAboutNagDumgar_P1 = TRUE;
				B_LogEntry(TOPIC_NagDumgar, " I found a strange goblin tablet! Apparently it describes what happened when the goblin leader Nag-Dumgar led an expedition to the temple to find the demon that was responsible for the death of their brothers. It seems that the death of their troop was caused by an evil shaman , to whom all the undead in the temple obeyed. All the orcs who fell into his hands were sacrificed. Nag-Dumgar himself apparently betrayed his brothers and began to serve this shaman... and remained alive. " );

				if((KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE))
				{
					Log_AddEntry(TOPIC_NagDumgar, " Looks like the situation is clearing up a bit... The cruel shaman that Nag-Dumgar served and the supreme goblin shaman Hash-Gor are apparently one and the same goblin! I think I should try him to know something else - but from whom and where?! There may be some records left in the old tower of Xardas concerning the Temple of the Sleeper and Hash-Gor. I should look there... " );
				};
				if (( CurrentLevel == OldWorld_Zen ) && ( KnowAboutNagDumgar_P1 ==  TRUE ) && ( KnowAboutNagDumgar_P2 ==  TRUE ) && ( XardasOrcBooksIns ==  FALSE ))
				{
					Wld_InsertItem(ItWr_AboutDumgar_P3, " FP_ITEM_DUMGAR_03 " );
					XardasOrcBooksIns = TRUE;
					KnowAboutNagDumgar_P3IN = TRUE;
				};
			};
		}
		else
		{
			var int rnd;
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
		if((BookBonus_31 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_31 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Our leader led us deeper into the temple cave... " );
		Doc_PrintLines(nDocID, 0 , " The mutilated bodies of our brothers lie all around. Apparently, there has been a real slaughter here! " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " We have reached the inner courtyard of the temple with huge losses. Everything here is infested with the dead! " );
		Doc_PrintLines(nDocID, 0 , " There are still some shadows flickering in the darkness, and the horrible moaning is slowly driving us mad. " );
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID, 1 , " We met a dead shaman in one of the shrines of the temple. He told us that we will all die here! " );
		Doc_PrintLines(nDocID, 1 , " We were then surrounded by living corpses on all sides. We had no choice but to fight or die... " );
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID, 1 , " That evil shaman spills the blood of my brothers on the sacrificial table day after day. He tears their bodies with a big knife and then eats their hearts! " );
		Doc_PrintLines(nDocID, 1 , " Next to him I saw Nag-Dumgar! Now he serves that shaman. " );
		Doc_Show(nDocID);
	}
	else
	{
		B_Say(self,self,"$CANTREADTHIS");

		if ((MIS_Stumbling == LOG_Running) && (PlayerKnowsOrcLanguageNeeded ==  FALSE ))
		{
			PlayerKnowsOrcLanguageNeed = TRUE;
			B_LogEntry(TOPIC_NagDumgar, " To read this, I must first learn the goblin language... " );
		};	
	};
};

instance ItWr_AboutNagDumgar_P2(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_AboutNagDumgar_P2;
	scemeName = "MAP";
	description = " Old Goblin Parchment " ;
	text[ 4 ] = " There are several inscriptions in the goblin language on the parchment... " ;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P2()
{
	var int nDocID;
	
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KnowAboutNagDumgar_P2 == FALSE)
		{
			if (MIS_Empty == LOG_Running)
			{
				B_GivePlayerXP(150);
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;

				if(RhetorikSkillValue[1] < 100)
				{
					RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
					AI_Print( " Rétorika + 1 " );
				};

				KnowAboutNagDumgar_P2 = TRUE;
				B_LogEntry(TOPIC_NagDumgar, " I found a strange goblin parchment with one of the goblin shamans in the Sleeper's Temple. Judging by its contents, the goblins were making sacrifices to their cruel demon to avoid his wrath. The letter also mentions the name of the supreme shaman Hash-Gor, who apparently he performed rituals. Apparently he enjoyed great respect among the goblins and had considerable power. " );

				if((KnowAboutNagDumgar_P1 == TRUE) && (KnowAboutNagDumgar_P2 == TRUE))
				{
					Log_AddEntry(TOPIC_NagDumgar, " Looks like the situation is clearing up a bit... The cruel shaman that Nag-Dumgar served and the supreme goblin shaman Hash-Gor are apparently one and the same goblin! I think I should try him to know something else - but from whom and where?! There may be some records left in the old tower of Xardas concerning the Temple of the Sleeper and Hash-Gor. I should look there... " );
				};
				if (( CurrentLevel == OldWorld_Zen ) && ( KnowAboutNagDumgar_P1 ==  TRUE ) && ( KnowAboutNagDumgar_P2 ==  TRUE ) && ( XardasOrcBooksIns ==  FALSE ))
				{
					Wld_InsertItem(ItWr_AboutDumgar_P3, " FP_ITEM_DUMGAR_03 " );
					XardasOrcBooksIns = TRUE;
					KnowAboutNagDumgar_P3IN = TRUE;
				};
			};
		}
		else
		{
			var int rnd;
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
		if((BookBonus_32 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_32 = TRUE ;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
		Doc_SetFont(nDocID,-1,FONT_Book_Letter);
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Varrag-Beku!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " I have almost no slaves left to sacrifice to our master. If the sacrificial altar stops being bathed in blood, we will all feel his terrible wrath! I hope I don't have to keep reminding you. Or do you want to take their place yourself?! " );
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID, 0 , " Hash-Gor, Supreme Shaman " );
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
	}
	else
	{
		B_Say(self,self,"$CANTREADTHIS");

		if ((MIS_Stumbling == LOG_Running) && (PlayerKnowsOrcLanguageNeeded ==  FALSE ))
		{
			PlayerKnowsOrcLanguageNeed = TRUE;
			B_LogEntry(TOPIC_NagDumgar, " To read this, I must first learn the goblin language... " );
		};	
	};
};

instance ItWr_AboutNagDumgar_P3(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Xardas' Old Diary " ;
	text[ 4 ] = " The dark mage was writing down some of his old discoveries in it... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_AboutNagDumgar_P3;
	inv_animate = 1;
};

func void Use_ItWr_AboutNagDumgar_P3()
{
	var int nDocID;

	if(KnowAboutNagDumgar_P3 == FALSE)
	{
		if (MIS_Empty == LOG_Running)
		{
			B_GivePlayerXP(150);
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rétorika + 1 " );
			};

			KnowAboutNagDumgar_P3 = TRUE;
			B_LogEntry(TOPIC_NagDumgar, " I think I found what I was looking for! Apparently Xardas himself was interested in Hash-Gor. In particular, some artifact - the ritual knife of the supreme shaman, with which he could revive and control the dead. Perhaps this is the secret Nag-Dumgara. However, first I need to find Hash-Gor or what's left of him and get the sacrificial knife. Does anyone know where Hash-Gor is now? " );
		};
	}
	else
	{
		var int rnd;
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
	if((BookBonus_33 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_33 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " ... As I already found out, there were five goblin shamans involved in building the temple. But I still have a vague suspicion that someone else was behind it all. Many of the goblins I heard mentioned the name Hash -Gor! Apparently he was the highest shaman of the clan that built the temple. What if he was the main builder of the Sleeper's temple? ... " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " ... I was able to find out that Hash-Gor was constantly making ritual sacrifices as a gift to some powerful demon. For this purpose he also possessed a special ritual knife with which - at least according to the goblins - he could revive and control of the dead! From a necromancy point of view, this item is of particular interest to me. But it is highly unlikely that I will ever get my hands on it. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ItMi_NestorHead(C_Item)
{
	name = " Head of 'Cannibal' Nestor " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_NestorHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_KriksHead(C_Item)
{
	name = " Kriks 'Razor' Head " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_KriksHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_BartHead(C_Item)
{
	name = " Bart 'Shrew' Head " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_BartHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_SkironHead(C_Item)
{
	name = " Head of Skiron 'The Butcher' " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_SkironHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_RocksHead(C_Item)
{
	name = " Head of Roks 'Chipera' " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RocksHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ItMi_DexterHead(C_Item)
{
	name = "Dexterova hlava";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DexterHead.3ds";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};
