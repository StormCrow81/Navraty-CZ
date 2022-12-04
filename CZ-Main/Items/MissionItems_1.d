
/* -------------------- CZ CHANGELOG -------------------- */

/*
v1.00:
instance ItMw_AlriksSword_Mis - fixed name (Sword -> Alrik's Sword)
*/



instance ItWr_Canthars_ComproBrief_MIS (C_Item);
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = "Cantharův dopis";
	text[ 4 ] = " Canthar's Letter to Merchant Sarah... " ;
	inv_animate = 1;
};


func void Use_Canthars_KomproBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " This is the last warning that I've been waiting a long time! I'm reminding you lastly that if I don't receive the weapons I ordered from you a week ago, Sarah, I will immediately cancel all the business contracts we signed together . Be reasonable! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Onar");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = "Rodův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	//visual = "ItMw_035_2h_sld_sword_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ItMw_2h_Rod_Fake(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2;
	damageTotal = 5000;
	damagetype = DAM_EDGE;
	range = 200;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	//visual = "ItMw_035_2h_sld_sword_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = " Coragon's Silver " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TheklasPackage (C_Item)
{
	name = "Theklin balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	AI_Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = " Wedding Gold Plate " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_MariasGoldPlate_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " The names Onar and Maria are displayed on the plate... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRi_ValentinosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItMi_Ring_Gold_New_Raven.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ValentinosRing;
	on_unequip = UnEquip_ValentinosRing;
	wear = WEAR_EFFECT;
	description = "Valentinův prsten";
	text[2] = NAME_Prot_Phis;
	count[2] = Ri_ProtEdge;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ValentinosRing()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
	self.protection[PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge;
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "Seznam";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "Seznam";
	text[ 4 ] = " List of herbs given to me by Alchemist Constantino... " ;
	inv_animate = 1;
};


func void Use_Kraeuterliste()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Medicinal plant " );
	Doc_PrintLine(nDocID, 0 , " Medicinal Herb " );
	Doc_PrintLine(nDocID, 0 , " Medicinal Root " );
	Doc_PrintLine(nDocID, 0 , " Fire Nettle " );
	Doc_PrintLine(nDocID, 0 , " Fireweed " );
	Doc_PrintLine(nDocID, 0 , " Fire Root " );
	Doc_PrintLine(nDocID,0,"Gobliní bobule");
	Doc_PrintLine(nDocID, 0 , " Dragon Root " );
	Doc_PrintLine(nDocID,0,"Chňapavčí býlí");
	Doc_PrintLine(nDocID, 0 , " Meadow Buckwheat " );
	Doc_PrintLine(nDocID, 0 , " Royal sorrel " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = " Mana Potion Recipe " ;
	text[ 4 ] = " Describes how to prepare magical potions... " ;
	inv_animate = 1;
};


func void Use_ManaRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Magic potions " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Only an experienced alchemist can prepare potions of magical power, requiring: " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Fire Nettle " );
	Doc_PrintLine(nDocID, 0 , " Fireweed " );
	Doc_PrintLine(nDocID, 0 , " Fire Root " );
	Doc_PrintLine(nDocID, 0 , " Meadow Buckwheat " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mistr Neoras");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein (C_Item)
{
	name = "Propustka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " The guards will let me into the city with these documents... " ;
	inv_animate = 1;
};


func void UsePassierschein()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Propustka");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The bearer of this document may move freely in the lower quarter for an unlimited period of time. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " 	Larius, viceroy of the city of Khorinis " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItMi_HerbPaket(C_Item)
{
	name = " Grass Bundle " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " A heavy and soft package that smells like marsh grass... " ;
	inv_animate = 1;
};

instance ItMi_JointPacket_OW(C_Item)
{
	name = " Swamp Grass Bundle " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " A bundle piled high with processed marsh grass... " ;
	inv_animate = 1;
};

instance ITMI_DROGENPOCKET(C_Item)
{
	name = " Balík Baala Oruna " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_drogenpocket;
	material = MAT_LEATHER;
	description = name;
	text[ 3 ] = " Shipment for the governor of the city of Khorinis - Larius... " ;
	text[ 4 ] = " It is not clear what is inside... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_LARIUSGOLDPOCKET (C_Item)
{
	name = " Leather bag " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Suma.3ds";
	scemeName = "MAPSEALED";
	on_state[ 0 ] = use_lariusgoldpocket;
	material = MAT_LEATHER;
	description = name;
	text[ 3 ] = " Satchel from the Vicar for Baal Orun... " ;
	text[ 4 ] = " It is not clear what is inside... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_drogenpocket()
{
	B_PlayerFindItem(ItMi_Joint,100);
	AI_Print(PRINT_FOUNDJOINTORAN);
	MIS_ORUNPACKET = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_ORUNPACKET);
};

func void use_lariusgoldpocket()
{
	B_PlayerFindItem(ItMi_Gold,1000);
	AI_Print(PRINT_FOUNDGOLD1000);
	Snd_Play("Geldbeutel");
	MIS_ORUNPACKET = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_ORUNPACKET);
};

const int HP_Hering = 20;

instance ItFo_SmellyFish(C_Item)
{
	name = "Sleď";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_SmellyFish;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 1;
	text[2] = NAME_Bonus_Hp;
	count[2] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Fish;
	inv_animate = 1;
};

func void Use_SmellyFish()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,10);

		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "Ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = name;
	text[ 4 ] = " She looks like someone cut her open and then sewed her up... " ;
	inv_animate = 1;
};


func void Use_HalvorFish()
{
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	AI_Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = " Smelly Message " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " This message was sewn in a fish... " ;
	inv_animate = 1;
};

func void UseHalvorMessage()
{
	var int nDocID;
	Knows_Half = TRUE ;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Greetings old merchant! The militia is getting suspicious and looking for you. Don't continue those attacks until things calm down a bit! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Halvor");
	Doc_Show(nDocID);
};

instance ItWr_DexterOrder(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexterOrder;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " I found this letter with one of the bandit leaders... " ;
	inv_animate = 1;
};

func void Use_ItWr_DexterOrder()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Stay put and tame until our militia liaison lets us know what the situation is in town now. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			D.");
	Doc_Show(nDocID);
};

instance ItWr_DexTrait(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexTrait;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " I found this letter at Dexter's... " ;
	inv_animate = 1;
};

func void Use_ItWr_DexTrait()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Dexter, get your men to stop these attacks! Wulfgar is starting to suspect something. We'd better rest for a while. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Peck");
	Doc_Show(nDocID);
};

instance ItMw_AlriksSword_Mis(C_Item)
{
	name = " Alrik's Sword " ;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_ShortSword2_New.3DS";
	on_equip = Equip_AlriksSword;
	on_unequip = UnEquip_AlriksSword;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[ 4 ] = " This sword belongs to Alrik... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Equip_AlriksSword()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,10);
		MELEEWEAPONINDEX = 4;
		BONUSHW = 2 ;
	};
};

func void UnEquip_AlriksSword()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-10);
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0 ;
	};
};


instance ItWr_VatrasMessage(C_Item)
{
	name = " Sealed Message " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAPSEALED";
	description = name;
	text[ 4 ] = " A sealed message from Vatras to the Fire Mages... " ;
	inv_animate = 1;
};


func void UseVatrasMessage()
{
	var int nDocID;
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milý Isgarothe,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I sense that there is some other force with us that is growing stronger. It is something completely unknown. That Beliar's vassals are approaching us? I may be wrong, but I believe it would be wise to entrust this matter to Master Pyrokar. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Vatras");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = " Message " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageOpen;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " An open message from Vatras to the Fire Mages... " ;
	inv_animate = 1;
};


func void UseVatrasMessageOpen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Milý Isgarothe,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I sense that there is some other force with us that is growing stronger. It is something completely unknown. That Beliar's vassals are approaching us? I may be wrong, but I believe it would be wise to entrust this matter to Master Pyrokar. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Vatras");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
	Doc_Show(nDocID);
};

instance ItFo_Schafswurst (C_Item)
{
	name = " Mutton Sausage " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[ 0 ] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
	inv_animate = 1;
};


func void Use_Schafswurst()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_potion;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana_New.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Esence ducha";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_LittleMana()
{
	B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
	Npc_ChangeAttribute(self,ATR_MANA,1);
};

instance ItWr_Passage_MIS(C_Item)
{
	name = " Draft Paladin Peace Treaty " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " With this message I will be able to visit Lord Hagen... " ;
	inv_animate = 1;
};

func void UsePassage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " Honorable Lord Hagene, " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " We both know what your situation is, so I propose the following arrangement: ... (long text) ... I urge you to make a wise decision. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Generál Lee");
	Doc_PrintLine(nDocID,0,"");

	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = " Message " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[ 0 ] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " Command to search... " ;
	inv_animate = 1;
};


func void UseBanditLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Stop every man who comes from the mountains. If someone doesn't have papers, he's our guy. Bring me his head! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"..... D.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Poster_MIS(C_Item)
{
	name = " Effigy of the wanted " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[ 4 ] = " This picture is very similar to me... " ;
	inv_animate = 1;
};


func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID, 0 , " Wanted.TGA " , 0 );
	Doc_Show(nDocID);
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = " Hunting Bow " ;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damagetype = DAM_POINT | DAM_FLY;
	damage[DAM_INDEX_POINT] = Damage_Jagdbogen;
	damage[DAM_INDEX_FLY] = 1;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	on_equip = equip_bow_light;
	on_unequip = unequip_bow_light;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[ 4 ] = " Bosper's Old Hunting Bow... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = "Prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01_MIS;
	on_unequip = UnEquip_ItRi_Prot_Point_01_MIS;
	wear = WEAR_EFFECT;
	description = " Alchemist Constantine's Ring " ;
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[ 4 ] = " This rare ring belongs to the city alchemist Constantine... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD ;
	inv_snot = INVCAM_Z_RING_STANDARD ;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItMi_EddasStatue(C_Item)
{
	name = "Soška Innose";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " 'Innos, bless me, guide me and protect me from all evil...' " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_Debt Book (C_Item)
{
	name = "Kniha";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Lehmar's ledger " ;
	text[ 4 ] = " In this book are written the names of the debtors of the usurer Lehmar and the amount of their debts... " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
	inv_animate = 1;
};


func void UseSchuldBuch()
{
	var int nDocID;

	if(LemarBookRead == FALSE)
	{
		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
		LemarBookRead = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_WOOD_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_WOOD_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Receivables and Payables " );
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I, Master Thorben, Khorin Carpenter, owe the Honorable Lord Lehmar 200 guilders. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Thorben");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I, Coragon, innkeeper of Khorin, owe the honorable lord Lehmar 150 guilders. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Coragon");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " I, Hanna, innkeeper of Khorin, owe the honorable Mr. Lehmar 250 guilders. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Hanna");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItPl_Xagitta_Herb_MIS(C_Item)
{
	name = " Sun Aloe " ;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ITPL_SAGGITA_HERB_01_NEW.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
	inv_animate = 1;
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "Kuše";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LightCrossbow;
	damagetype = DAM_BLUNT | DAM_POINT;
	damage[DAM_INDEX_BLUNT] = 50;
	damage[DAM_INDEX_POINT] = 15;
	munition = ItRw_Bolt;
	cond_atr[0] = SKL_CROSSBOW;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItRw_Crossbow_L_02.mms";
	on_equip = equip_crossbow_light;
	on_unequip = unequip_crossbow_light;
	description = "Dragomirova kuše";
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_BLUNT];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Crb_needed;
	count[3] = cond_value[0];
	text[ 4 ] = " The name 'Dragomir' is displayed on the statue... " ;
	text[5] = NAME_Value;
	count[5] = value;
};

// /////Novoye///////////

instance ITMI_LOOK_ROBA (C_Item) .
{
	name = " Mage Robe " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_taliasan_roba;
	material = MAT_LEATHER;
	description = name;
	text[ 2 ] = " Carefully composed " ;
	text[ 3 ] = " and even smoothed... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_taliasan_roba()
{
	B_PlayerFindItem(itar_mage,1);
};

instance Holy_Hammer_MIS(C_Item)
{
	name = " Sacred Hammer of Innose " ;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	//visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	visual = "Holy_Hammer_MIS_New.3DS";
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH;
	inv_animate = 1;
};

instance HOLY_HAMMER_MIS_NEW(C_Item)
{
	name = "Kladivo Innose";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	//visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	visual = "Holy_Hammer_MIS_New.3DS";
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH;
	inv_animate = 1;
};

instance ITRI_QUEST_PAL_RING(C_Item)
{
	name = " Badge of Courage and Valor " ;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = 1;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[ 4 ] = " Awarded for exceptional merit before the Order... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_HOLGER_LETTER(C_Item)
{
	name = " Holger's Letter " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_holger_letter;
	scemeName = "MAP";
	description = " Holger's letter " ;
	inv_animate = 1;
};

func void use_holger_letter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID, 0 , " Forgive me the villain! " );
	Doc_PrintLine(nDocID, 0 , " Thank you for saving me, but " );
	Doc_PrintLine(nDocID, 0 , " I can't stay here anymore, " );
	Doc_PrintLine(nDocID, 0 , " there are only crackers here! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITMI_DARON_SUMA(C_Item)
{
	name = " Leather bag " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Suma.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_daron_suma;
	material = MAT_LEATHER;
	description = name;
	text[ 4 ] = " Bag with gifts for Innos Monastery... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itmi_daron_suma()
{
	B_PlayerFindItem(itmi_beliar_gold,10000);
	AI_Print(PRINT_FOUNDGOLD1000);
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 100;
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	AI_PrintClr( " The Fire Mages have branded you an outlaw... Innos sees everything! " , 177 , 58 , 17 );
	Snd_Play("Geldbeutel");
	MIS_DARON_GIVEGOLD = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_DARON_GIVEGOLD);
};

instance ITAM_HOLGER_AMULET(C_Item)
{
	name = NAME_amulet;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 300;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Holgerův amulet";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD ;
	inv_animate = 1;
};
