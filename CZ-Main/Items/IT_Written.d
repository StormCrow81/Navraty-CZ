

const int BookLp2 = 2;
const int BookLp3 = 3;
const int BookLp5 = 5;
const int BookLp8 = 8;
const int BookXP250 = 250;
const int BookXP500 = 500;
const int BookXP1000 = 1000;
const int LPMultiplier = 1000;
const int XPMultiplier = 5;

instance ITWR_ADDON_RUNEMAKING_PRM(C_Item)
{
	name = " Runes of True Magic " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_runemaking_prm_s1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC1(C_Item)
{
	name = " Runes of the Water Mages I " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Water Mage Runes (1st Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC1_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC2(C_Item)
{
	name = " Runes of the Water Mages II " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Water Mage Runes (2nd Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC2_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC3(C_Item)
{
	name = " Runes of the Water Mages III " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Water Mage Runes (3rd Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC3_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC4(C_Item)
{
	name = " Runes of the Water Mages IV " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Water Mage Runes (4th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC4_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC5(C_Item)
{
	name = " Runes of the Water Mages V " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Water Mage Runes (5th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC5_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC6(C_Item)
{
	name = " Runes of the Water Mages VI " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Water Mage Runes (6th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC6_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC1(C_Item)
{
	name = " Runes of Fire Mages I " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Fire Mage Runes (1st Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = Use_Bookstand_Kreise_01_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC2(C_Item)
{
	name = " Runes of Fire Mages II " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Fire Mage Runes (2nd Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = Use_Bookstand_Kreise_02_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC3(C_Item)
{
	name = " Runes of Fire Mages III " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Fire Mage Runes (3rd Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = Use_Bookstand_Kreise_03_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC4(C_Item)
{
	name = " Runes of Fire Mages IV " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Fire Mage Runes (4th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[ 0 ] = Use_Bookstand_Kreise_04_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC5(C_Item)
{
	name = "Runy mágů Ohně V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (5. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_05_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC6(C_Item)
{
	name = "Runy mágů Ohně VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (6. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_06_S1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC1(C_Item)
{
	name = "Runy mágů Temnoty I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (1. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ1_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC2(C_Item)
{
	name = "Runy mágů Temnoty II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Darkness Mage Runes (2nd Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ2_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC3(C_Item)
{
	name = " Darkness III Mage Runes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Darkness Mage Runes (3rd Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ3_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC4(C_Item)
{
	name = " Runes of Darkness IV Mage " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Darkness Mage Runes (4th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ4_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC5(C_Item)
{
	name = " Darkness V Mage Runes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Darkness Mage Runes (5th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ5_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC6(C_Item)
{
	name = " Darkness VI Mage Runes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Book of Darkness Mage Runes (6th Circle) " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ6_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC1(C_Item)
{
	name = "Runy magie Guru I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (1. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ1_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC2(C_Item)
{
	name = "Runy magie Guru II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (2. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ2_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC3(C_Item)
{
	name = "Runy magie Guru III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (3. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ3_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC4(C_Item)
{
	name = "Runy magie Guru IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (4. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ4_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC5(C_Item)
{
	name = "Runy magie Guru V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (5. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ5_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC6(C_Item)
{
	name = "Runy magie Guru VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (6. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ6_s1;
	inv_animate = 1;
};

instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "Důležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[4] = "Zpráva z hospody v táboře banditů...";
	inv_animate = 1;
};

func void Use_Hinweis_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hele chlapi!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lou zmizel v bažinách. Pravděpodobně ho sežrali močáloví žraloci. Co je ale horší - klíč ode dvěří se ztatil s ním. Kdo ho najde, může si nechat jeho věci.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Snaf");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Booze(C_Item)
{
	name = "Recept na přípravu čistého alkoholu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Booze;
	scemeName = "MAP";
	description = "Recept na přípravu čistého alkoholu";
	text[4] = "Způsob přípravy čistého alkoholu z kořalky...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Alcohol_Booze()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MakePureAlcoholBooze == FALSE)
		{
			MakePureAlcoholBooze = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Čistý alkohol (z kořalky)'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČISTÝ ALKOHOL (z kořalky): 2x kořalka.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava čistého alkoholu:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je důležité mít dvě láhve kořalky. Ty je poté nutné vydestilovat u alchymistického stolu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Health_04(C_Item)
{
	name = "Recept na léčivý lektvar";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "Recept na elixír čisté životní energie";
	text[3] = "Způsob přípravy elixíru čisté životní energie...";
	text[4] = "Je potřeba znalost receptu léčivých elixírů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_04] != TRUE))
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			PLAYER_TALENT_ALCHEMY_14 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Elixír čisté hojivé síly'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ČISTÉ HOJIVÉ SÍLY: čistý alkohol, luční pohanka, 3x esence hojivé síly a modrý bez.");
		};
	};
	if((BookBonus_01 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_01 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava elixíru čisté životní energie:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, esence hojivé síly a modrý bez. Zamícháme a vaříme dle receptu přípravy hojivého elixíru.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Tenhle lektvar může namíchat pouze ten alchymista, který zná recept na výrobu elixíru hojivé síly.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Mana_04(C_Item)
{
	name = "Recept na elixír many";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "Recept na elixír many";
	text[3] = "Způsob připravy elixíru many...";
	text[4] = "Je potřeba znalost lektvarů many...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] != TRUE))
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			PLAYER_TALENT_ALCHEMY_13 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Elixír čisté many'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ČISTÉ MANY: čistý alkohol, luční pohanka, 3x esence many a modrý bez.");
		};
		if((BookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_02 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava elixíru many:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, esence many a modrý bez. Micháme a vaříme podle receptu elixíru many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Tenhle lektvar může namíchat pouze ten alchymista, který zná recept na výrobu elixíru many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Grog(C_Item)
{
	name = "Recept na přípravu čistého alkoholu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Grog;
	scemeName = "MAP";
	description = "Recept na přípravu čistého alkoholu";
	text[4] = "Způsob přípravy čistého alkoholu z grogu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Alcohol_Grog()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MakePureAlcoholGrog == FALSE)
		{
			MakePureAlcoholGrog = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Čistý alkohol (z grogu)'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČISTÝ ALKOHOL (z grogu): 2x grog.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba čistého alkoholu:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na přípravu jsou potřeba dva grogy. Poté je nutné je vydestilovat u alchymistického stolu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Rom(C_Item)
{
	name = "Recept na výrobu čistého alkoholu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Rom;
	scemeName = "MAP";
	description = "Recept na přípravu čistého alkoholu";
	text[4] = "Způsob přípravy čistého alkoholu z rumu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Alcohol_Rom()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MakePureAlcoholRom == FALSE)
		{
			MakePureAlcoholRom = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Čistý alkohol (z rumu)'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČISTÝ ALKOHOL (z rumu): 2x rum.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava čistého alkoholu:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je důležité mít po ruce dva rumy. Poté je nutné je vydestilovat u alchymistického stolu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Hinweis_01(C_Item)
{
	name = "Důležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Visela na jedné z chatrčí v bažině...";
	inv_animate = 1;
};


func void Use_Hinweis_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Chlapi, v těchto truhlách můžete najít železné zásoby! Jsou pro VŠECHNY. Mějte však na mysli, že je můžete brát jen v případu nouze: v čase války, napadení a hlavně berte v rozumných dávkách. Doufám, že se všichni budou držet tohoto pravidla a bude to fungovat!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				- Fletcher");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_William_01(C_Item)
{
	name = "Vzkaz";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Tohle měl u sebe rybář William...";
	inv_animate = 1;
};


func void Use_William_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Williame, při úplňku odlákám stráže. Pokus se odtud vypadnout, ale buď opatrný! Pokud se budeš držet při hlavní cestě, dostaneš se z bažiny. Tábor pirátů se nachází na druhé straně údolí, až na západě. Na lodi se z tama můžeš vydat domů.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"P.S. Hodně štěstí!");
	Doc_Show(nDocID);
};


instance ITWr_Addon_MCELIXIER_01(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[3] = "Recept na lektvar proměny mysli...";
	text[4] = "Tento lektvar pomůže oživit ztacené vzpomínky...";
	inv_animate = 1;
};


func void Use_MCELIXIER_01()
{
	var int nDocID;
	var int rnd;

	if(Knows_MCELIXIER == FALSE)
	{
		TalentCount_Alchemy += 1;
		Knows_MCELIXIER = TRUE;
		B_GivePlayerXP(100);
		AI_Print("Naučeno: Alchymie - 'Lektvar proměny mysli'");
		B_Say(self,self,"$HOWINTEREST");
	}
	else
	{
		rnd = Hlp_Random(100);

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
	if((BookBonus_03 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_03 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lektvar proměny mysli:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na přípravu tohoto lektvaru jsou třeba žihadla ze dvou krvavých much. K nim je potřeba přidat jeden extrakt many a jednu esenci hojivé síly. Promíchat, povařit a přidat jeden sáček červeného pepře.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Pirates_01(C_Item)
{
	name = "Umaštěná zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Tento vzkaz měl Angus v kapse...";
	inv_animate = 1;
};


func void Use_Pirates_01()
{
	var int nDocID;
	Read_JuansText = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Piráti, získejte tu poslední zásilku, která je určená pro nás, a doneste ji do vaší jeskyně. Setkáme se tam a zaplatím vám za ní dvakrát tolik!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				- Tom");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Fortunův zápisek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Tento vzkaz byl ve Fortunově truhle...";
	inv_animate = 1;
};

func void Use_Joint_Rezept_01()
{
	var int nDocID;

	if(Green_Extrem == FALSE)
	{
		RankPoints = RankPoints + 1;
		Green_Extrem = TRUE;
		Log_CreateTopic(TOPIC_TalentHerb,LOG_NOTE);
		B_LogEntry(TOPIC_TalentHerb,"Ingredience pro ubalení ZELENÉHO NOVICE: 2x tráva z bažin a luční pohanka.");
	};
	if((BookBonus_04 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_04 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Špeky co tu balí jsou dost dobré, ale v táboře v bažinách to posunuli ještě dál. Pokud vezmu esenci ze dvou lodyh trávy z bažin a přidám k nim jednu luční pohanku, je možné ubalit špeka se stejným efektem zeleného novice. Zelený novic napomáha tišit bolest a rozjasňuje mysl.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "Recept na 'Louovo kladivo'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[4] = "Recept na přípravu 'Louova kladiva'...";
	inv_animate = 1;
};


func void UseLouRezept()
{
	var int nDocID;

	if(Knows_LousHammer == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_LousHammer = TRUE;
		AI_Print("Naučeno: Alchymie - 'Louovo kladivo'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro LOUOVO KLADIVO: tráva z bažin, rum, zub močálového žraloka a 2x tuřín.");
	};
	if((BookBonus_05 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_05 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Recept na Louovo kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi láhev vody, dva tuříny a trochu trávy z bažin. Přidej nadrcený zub močálového žraloka. Dej vše do láhve, přidej rum a vař.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hodně štěstí!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Recept na 'Dvojité Louovo kladivo'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[4] = "Recept na přípravu 'Dvojitého Louova kladiva'...";
	inv_animate = 1;
};


func void UseLouRezept2()
{
	var int nDocID;

	if(Knows_Schlafhammer == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_Schlafhammer = TRUE;
		AI_Print("Naučeno: Alchymie - 'Dvojité Louovo kladivo'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro DVOJITÉ LOUOVO KLADIVO: tráva z bažin, 2x rum, zub močálového žraloka a 2x tuřín.");
	};
	if((BookBonus_06 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_06 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dvojité Louovo kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi Louovo kladivo a znovu ho vydestiluj. Tento nápoj jsou schopní připravit jen ti nejzkušenější páleničáři. Pokusí-li se o to nezkušený amatér, riskuje slepotu nebo rovnou dokonce smrt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Recept na 'Rychlý sleď'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[4] = "Recept na přípravu 'Rychlého sledě'...";
	inv_animate = 1;
};


func void UseRezeptPiratentod()
{
	var int nDocID;

	if(Knows_SchnellerHering == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_SchnellerHering  = TRUE;
		AI_Print("Naučeno: Alchymie - 'Rychlý sleď'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro RYCHLÉHO SLEDĚ: ryba, rum a chňapavčí býlí.");
	};
	if((BookBonus_07 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_07 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Rychlý sleď");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je to dryák pro pořádné chlapy! Jako vždy je potřeba láhev vody. Přidáme trochu rumu a jednu čerstvou rybu. Jakmile se tekutina zbarví do žluta, vyndáme rybu a přidáme svazek čerstvého chňapavčího býlí.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Opatrně! Tento dryák má velmi silný efekt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "Kus papíru";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_animate = 1;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[4] = "Instrukce jak zhotovit lehkou a ostrou sekeru...";
	inv_animate = 1;
};

func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Sekyra banditů");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tuto sekyru může ukovat každý, kdo je obeznámen se základy kovařiny. Na výrobu jsou potřeba dva rozpálené kusy surové oceli. Dále jeden kus rudy, tři zuby vlka, chňapavce či jiného podobného tvora. Skujte rudu, zuby a ocel na kovadlině a to pořádně. Tato sekyra je velice lehká a způsobuje značně veliké poškození!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "Vyvolej 'Quarhodrona'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[4] = "S pomocí tohoto svitku můžu vyvolat Quarhodrona...";
	inv_animate = 1;
};


func void UseSummonAncientGhost()
{
	if(SC_SummonedAncientGhost == FALSE)
	{
		B_Say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(NONE_ADDON_111_Quarhodron,"ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_Say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ITWR_MAP_ADDONWORLD_1(C_Item)
{
	name = "Mapa údolí Stavitelů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_AddonWorld()
{
	var int  Document ;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel( Document , " Addon \A ddonWorld.zen " );
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};

instance ITWR_MAGICDEFENCE_02(C_Item)
{
	name = " Elixir of Magic Protection " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_magdef;
	scemeName = "MAP";
	description = " Elixir of protection against magic " ;
	text[ 4 ] = " How to prepare an anti-magic potion... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_magdef()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if ( KNOWMAGDEF  ==  FALSE )
		{
			KNOWMAGDEF = TRUE;
			Snd_Play("LevelUP");
			RankPoints = RankPoints + 1;
			AI_Print( " Learned: Alchemy - 'Elixir of Magic Protection' " );
			B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for ELIXIR OF PROTECTION AGAINST MAGIC: pure alcohol, 25x slave bread, liquor and buckwheat. " );
		};
		if((BookBonus_08 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_08 = TRUE ;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Potion preparation: " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Take pure alcohol, buckwheat, brandy and slave breads. Crush the slave breads finely, cover with brandy and add buckwheat. Heat on low heat for ten minutes, then let cool. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_PERMINTELLECT(C_Item)
{
	name = " Recipe for Elixir of Reason " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permint;
	scemeName = "MAP";
	description = " Recipe for Elixir of Reason " ;
	text[ 4 ] = " The method of preparing the elixir of reason from the heads of mantises... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_permint()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWPERMINT == FALSE)
		{
			KNOWPERMINT = TRUE;
			Snd_Play("LevelUP");
			RankPoints = RankPoints + 1;
			AI_Print( " Learned: Alchemy - 'Elixir of Reason' " );
			B_LogEntry(TOPIC_TalentAlchemy, " Elixir of SENSE : pure alcohol, 10x mantis head, swamp grass, and meadow buckwheat. " );
		};
		if((BookBonus_12 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_12 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, trávu z bažin a deset hlav kudlanek. Povař hlavy, sceď vodu a smíchej s trávou. Zahřívej na mírném ohni a přílévej vývar, do té doby než vypaření proběhne pětkrát. Užívej vychladlé.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_SPEED_03(C_Item)
{
	name = "Recept na lektvar rychlosti";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_speed_03;
	scemeName = "MAP";
	description = "Recept na 'Černý chňapavec'";
	text[4] = "Způsob přípravy napoje rychlosti z jater černého chňapavce...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_speed_03()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWSPEED3 == FALSE)
		{
			KNOWSPEED3 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Černý chňapavec'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČERNÉHO CHŇAPAVCE: čistý alkohol, játra černého chňapavce, grog a luční pohanka.");
		};
		if((BookBonus_13 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_13 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, luční pohanku, grog a játra černého chňapavce. Játra povaříme v grogu, slijeme vývar a smícháme s bylinkama. Provaříme dvakrát a dále pokračujeme v postupu jako u běžných lektvarů rychlosti.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_FIREDEF(C_Item)
{
	name = "Recept na elixír ochrany proti ohni";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_firedef;
	scemeName = "MAP";
	description = "Recept na elixír ochrany proti ohni";
	text[4] = "Způsob přípravy elixíru ochrany proti ohni z ohnivých jazyků...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_firedef()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWFIREDEF == FALSE)
		{
			KNOWFIREDEF = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Elixír ochrany proti ohni'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OCHRANY PROTI OHNI: čistý alkohol, 5x ohnivý jazyk, ohnivé býlí a luční pohanka.");
		};
		if((BookBonus_14 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_14 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, luční pohanku, ohnivé býlí a ohnivé jazyky. Vaříme jazyky až do doby, kdy je vývar tmavě červený. Scedíme tekutinu, přidáme bylinky a dvakrát zahřejeme na mírném ohni. Poté prudce zchladíme!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_FULLHEALTH_02(C_Item)
{
	name = "Recept na elixír léčivé síly";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_fullhealth_02;
	scemeName = "MAP";
	description = "Recept na elixír léčivé síly";
	text[4] = "Způsob přípravy elixíru léčivé síly z žihadel...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_fullhealth_02()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWFULLHEALTH2 == FALSE)
		{
			KNOWFULLHEALTH2 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Elixír hojivé síly ze žihadel'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR HOJIVÉ SÍLY ZE ŽIHADEL: čistý alkohol, 5x žihadlo krvavé mouchy, léčivá rostlina, luční pohanka a modrý bez.");
		};
		if((BookBonus_15 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_15 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava léčivého elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, žihadla krvavé mouchy, léčivou rostlinu, luční pohanku a modrý bez. Rozřízneme žihadla a získáme z nich jed. Smíchame byliny, aby pustili šťávu. Zbytky žihadel zalijeme šťávou z bylin a pomalu přidáváme jed až do rozpuštění zbytku bylin. Scedíme a dál pokračujeme v přípravě jako u běžných elixírů.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_PROTFALL(C_Item)
{
	name = "Recept na elixír odolnosti";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_protfall;
	scemeName = "MAP";
	description = "Recept na elixír odolnosti";
	text[4] = "Způsob přípravy elixíru odolnosti...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_protfall()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWPROTFALL == FALSE)
		{
			RankPoints = RankPoints + 1;
			KNOWPROTFALL = TRUE;
			Snd_Play("LevelUP");
			AI_Print("Naučeno: Alchymie - 'Elixír ochrany proti pádu'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OCHRANY PROTI PÁDU: čistý alkohol, 15x křídla, tráva a luční pohanka.");
		};
		if((BookBonus_16 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_16 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava nápoje:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, křídla krvavé mouchy, trávu a luční pohanku. Křídla nadrtíme, vylouhujeme ve šťávě z bylinek a nakonec odstraníme zbytky křídel. Za neustálého míchání tuto směs povaříme pět minut. Prudce zchladíme.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Účinky nepotrvají déle než patnáct vteřin!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_REZEPTUREN(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Nějaký zvláštní recept na kdo ví co...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_GLINTVEIN(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useglintvein;
	scemeName = "MAP";
	description = "Svařené víno";
	text[4] = "Recept na přípravu vinného nápoje";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useglintvein()
{
	var int nDocID;

	if(KNOWSGLINTVEIN == FALSE)
	{
		RankPoints = RankPoints + 1;
		KNOWSGLINTVEIN = TRUE;
	};
	if((BookBonus_17 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_17 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Svařené víno");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ingredience na přípravu svařeného vína:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"1 láhev vína, 1 láhev silného měsíčního svitu,");
	Doc_PrintLines(nDocID,0,"přidáme trochu bíleho rumu, lžíci medu a posypené vločkama z ohnivého býlí");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pít pouze horké!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Osair(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Dopis převora Osaira";
	text[4] = "Tento dopis napsal převor Osair Nrozasovi...";
	inv_animate = 1;
};

instance ItWr_TiamantPaperBlank(C_Item)
{
	name = "Svazek papírů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

instance ItWr_TiamantPaperToHaniar(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_TiamantPaperToHaniar;
	scemeName = "MAP";
	description = "Dopis převora Tiamanta";
	text[4] = "Tento dopis napsal převor Tiamant Haniarovi Slepému...";
	inv_animate = 1;
};

func void Use_TiamantPaperToHaniar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Haniare");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Říkám ti, že zabití stína jménem Hasim bylo vykonáno pro dobro nás všech a na můj příkaz Hasima odstranil člověk, co ti doručil tento dopis. Vysvětlím a podám více detailů jak se setkáme...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tiamant");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_HaniarOrder(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarOrder;
	scemeName = "MAP";
	description = "Dopis převora Haniara";
	inv_animate = 1;
};

func void Use_ItWr_HaniarOrder()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MIS_Intriges == FALSE)
		{
			MIS_Intriges = LOG_Running;
			Log_CreateTopic(TOPIC_Intriges,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Intriges,LOG_Running);
			B_LogEntry(TOPIC_Intriges,"Haniar chce, abych zjistil jaký mají ostatní převorové vztah k převoru Tiamantovi. Mám také zjistit důvod, proč Tiamant nechal zavraždit Hasima. Zajímavé! Jak to tak vypadá - tak se uvnitř bratrstva odehrává hodně intrik...");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zjisti, co si ostatní převorové bratrstva myslí o Tiamantovi! Bude pro mě užitečná každá drobnost, každý detail... jestli zjistíš důvod, proč Tiamant nechal zabít Hasima, bude to ještě lepší.");
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

instance ItWr_DemonScroll(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DemonScroll;
	scemeName = "MAP";
	description = "Svitek";
	inv_animate = 1;
};

func void Use_ItWr_DemonScroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... NIR ASGAT SURO NATI DAR CAS ...");
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

instance ItWr_HaniarDemonScroll(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarDemonScroll;
	scemeName = "MAP";
	description = "Masyafský svitek";
	inv_animate = 1;
};

func void Use_ItWr_HaniarDemonScroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... NIR ASGAT SURO NATI DAR CAS ...");
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

instance ItWr_Luka(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Luka;
	scemeName = "MAP";
	description = "Lukův svitek";
	inv_animate = 1;
};

func void Use_ItWr_Luka()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if((MIS_Intriges == LOG_Running) && (KnowWhyHasimDead == FALSE))
		{
			B_LogEntry(TOPIC_Intriges,"Teď už mi začíná být vše jasné! Zdá se, že převor Tiamant se rozhodl převzít vedení zlatého dolu do svých rukou. Toto by se stěží líbilo Haniarovi a ostatním převorům. Všichni jsou velice hamižní. A co se týče Hasima, nejspíš se o tom něco dověděl a tak ho Tiamant přikázal zabít. Což jsem taky vlastně udělal... Myslím, že Haniarovi se nebudou všechny tyto novinky líbit.");
			KnowWhyHasimDead = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Luko, zatím vyčkej a neřeš s Hasimem nic! I když se ten bastard příblížil k dolu až moc blízko, znám někoho, kdo za nás tu špinavou práci udělá...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Tiamant");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_OsaitToTiamant(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_OsaitToTiamant;
	scemeName = "MAP";
	description = "Osairův dopis";
	text[ 4 ] = " Prior Osair wrote this letter to Tiamant... " ;
	inv_animate = 1;
};

func void Use_ItWr_OsaitToTiamant()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if ((MY_Intrigues == LOG_Running) && (KnowOsairToTiamant ==  FALSE ))
		{
			B_LogEntry(TOPIC_Intriges, " Judging by the letter, Osair is very unhappy with Tiamant! I'm sure Haniar will be very interested. " );
			KnowOsairToTiamant = TRUE;
			TiamantNeedsSlaves = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Tiamante! The incompetence of your people is costing me more and more money. If you ever want another batch of slaves to arrive at the mine - you must first ensure their safety! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Osair");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_HaniarToOsair(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarToOsair;
	scemeName = "MAP";
	description = "Haniarův dopis";
	text[ 4 ] = " This letter was written by Prior Haniar to Osair... " ;
	inv_animate = 1;
};

func void Use_ItWr_HaniarToOsair()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Osaire! Our brother Nrozas died under rather strange circumstances. We must meet, away from prying eyes, to discuss the final moments of his death... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Haniar");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_DualFight(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DualFight;
	scemeName = "MAP";
	description = "Tanec dvou čepelí";
	text[4] = "V tomto svitku je popsána technika boje se dvěma zbraněmi";
	inv_animate = 1;
};

func void Use_ItWr_DualFight()
{
	var int nDocID;

	if(Npc_IsPlayer(self) && (hero.attribute[ATR_DEXTERITY] >= 150) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		if((hero.lp < 25) && (AIV_TwoHands == FALSE))
		{
			B_Say(hero,hero,"$NOLEARNNOPOINTS");
			AI_Print("Vyžaduje nejméně 25 VB...");
		}
		else
		{
			if(AIV_TwoHands == FALSE)
			{
				AI_Print("Naučeno: Boj se dvěma zbraněmi");
				Snd_Play("LevelUP");
				AIV_TwoHands = TRUE;
				hero.lp = hero.lp - 25; 
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,1);
			Doc_SetPage(nDocID,0,"letters.TGA",0);
			Doc_SetFont(nDocID,0,FONT_Book_Letter);
			Doc_SetMargins(nDocID,-1,50,50,50,50,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Síla útoku, při používání dvou čepelí, záleží výhradně na schopnosti válečníka přesně vypočítat vhodnou dobu prvního a následujícího útoku.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Pro tento styl boje je vyžadován pár zbraní...");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_Show(nDocID);
		};
	}
	else
	{
		B_Say(hero,hero,"$DONTREADYFORTHIS");
	};
};

instance ItWr_MoonBladesRezept(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_MoonBladesRezept;
	scemeName = "MAP";
	description = "Měsíční čepele";
	text[4] = "Návod na výrobu legendární zbraně...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_MoonBladesRezept()
{
	var int nDocID;
	var int rnd;

	if((KNOWS_MOONBLADES_LEFT == FALSE) && (KNOWS_MOONBLADES_RIGHT == FALSE))
	{
		B_GivePlayerXP(500);
		KNOWS_MOONBLADES_LEFT = TRUE;
		KNOWS_MOONBLADES_RIGHT = TRUE;

		if(MIS_MoonBlades == FALSE)
		{
			MIS_MoonBlades = LOG_Running;
			Log_CreateTopic(TOPIC_MoonBlades,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Running);
		};

		B_LogEntry(TOPIC_MoonBlades,"Teď už vím, jak vyrobit legendární zbraň - 'Měsíční čepele'... Co k tomu potřebuji: 2 surové oceli, 4 pruty z magické oceli, 2 černé perly, 10 uhlí, 2 křemeny, 2 láhve rtuti, 2 zlaté ingoty a 2 měsíční kameny.");

		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;
	}
	else
	{
		rnd = Hlp_Random(100);

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
	if((BookBonus_18 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_18 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Měsíční čepele'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"(Výčet věcí na zhotovení měsíčních čepelí)");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Surová ocel - 2 kusy");
	Doc_PrintLine(nDocID,0,"Pruty z magické oceli - 4 kusy");
	Doc_PrintLine(nDocID,0,"Černá perla - 2 kusy");
	Doc_PrintLine(nDocID,0,"Uhlí - 10 kusů");
	Doc_PrintLine(nDocID,0,"Křemen - 2 kusy");
	Doc_PrintLine(nDocID,0,"Rtuť - 2 kusy");
	Doc_PrintLine(nDocID,0,"Měsíční kámen - 2 kusy");
	Doc_PrintLine(nDocID,0,"Zlaté ingoty - 2 kusy");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

var int cbow_once1;

instance ITWR_CBOW_T1(C_Item)
{
	name = "Kuše";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_cbow_t1;
	inv_animate = 1;
};

func void use_itwr_cbow_t1()
{
	var int nDocID;
	var int rnd;

	if(CBOW_ONCE1 == FALSE)
	{
		B_GivePlayerXP(250);
		DoLearnCBow = TRUE;
		CBOW_ONCE1 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
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
	if((BookBonus_19 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_19 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Umění střelby z kuše je součástí válečnického umění, má starobylé kořeny a zakořeněné hluboké tradice. Toto se týká jak technik tak mechanik střelby. Střelec musí stát pevně na nohách a respektovat zásady zacházení s kuší při nabíjení - jinak riskuje ztrátu určité části těla nebo průstřel části těla.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Šipky do kuše musí být lehké. Malá, tříhrotá (třízubá) špička zajišťuje lepší přesnost spíše než velkou těžkopádnost. Princip je, že je lepší prorazit malou díru tam kam míříme, spíše než velkou díru, kde nechceme, aby šipka prošla.");
	Doc_Show(nDocID);
};


var int cbow_once2;

instance ITWR_CBOW_T2(C_Item)
{
	name = "Umění střelby";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_cbow_t2;
	inv_animate = 1;
};


func void use_itwr_cbow_t2()
{
	var int nDocID;
	var int rnd;

	if(CBOW_ONCE2 == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearnCBow = TRUE;
		CBOW_ONCE2 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
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
	if((BookBonus_20 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_20 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Správné držení těla při nabíjení kuše, síla a neustálé zlepšování zajistí lepší rychlost nabíjení. Nejčastěšjí chyba při práci s kuší je, že tětiva nebývá natahována stále na to stejné místo a jak nejvíc je do středu možné.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Přetažení tětivy o půl centimetru do strany výrazně odvádí šipku od svého cíle. Pokud máte dostatek štěstí a dostanete se k modelu kuše, která vám dovolí dotknout se obou stran úchytu při centrování tětivy, je to jen dobře. Někteří kušníci si dělají dvě značky na tětivě a to po jedné na každé straně pažby. Poté natahují tětivu a posouvají ji doprava nebo doleva podle středu.");
	Doc_Show(nDocID);
};

instance ItWr_RagnarBand(C_Item)
{
	name = "Dopis bandity";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	description = "Dopis bandity";
	text[4] = "Našel jsem tento dopis u jednoho z banditů...";
	inv_animate = 1;
};

instance ItWr_OrcLanguage(C_Item)
{
	name = "Skřetí jazyk";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_OrcLanguage;
	scemeName = "MAP";
	description = "Skřetí jazyk";
	inv_animate = 1;
};

func void Use_ItWr_OrcLanguage()
{
	var int nDocID;
	var int rnd;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		PlayerKnowsOrcLanguage = TRUE;
		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
		Snd_Play("LevelUP");
		RankPoints = RankPoints + 1;
		AI_Print("Naučeno: Skřetí jazyk");
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		B_LogEntry(TOPIC_Language,"Mluvím skřetím jazykem.");

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
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
	if((BookBonus_21 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_21 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};

//-----------------------------------------------novyye knigi----------------------------------------

var int UberionBook;

instance ItWr_UberionBook(C_Item)
{
	name = "Y'Berionův deník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[4] = "Deník prvního Guru Bratrstva Spáče...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_UberionBook;
	inv_animate = 1;
};

func void Use_ItWr_UberionBook()
{
	var int nDocID;
	var int rnd;

	if(UberionBook == FALSE)
	{
		B_GivePlayerXP(2000);
		UberionBook = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
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
	if((BookBonus_22 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_22 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsem neustále mučen vizemi. Vždy v nich vidím ten stejný obraz - obraz mocného stvoření! Nazval jsem ho - Spáč.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Použil jsem rostlinu, která roste v bažinách a přiravil jsem z ní speciální směs na kouření, která způsobuje osvícení a zvyšuje mou magickou moc...");
	Doc_Show(nDocID);
};

instance ItWr_VatrasLee(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Dopis od Vatrase generálu Leeovi...";
	inv_animate = 1;
};

instance ItWr_WaterMageDoc(C_Item)
{
	name = "Svazek dokumentů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Velký svazek starých záznamů mágů Vody...";
	inv_animate = 1;
};

var int Read_AncientBook_01;

instance ItWr_AncientBook_01(C_Item)
{
	name = "Starobylý rukopis Stavitelů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ITWR_ANCIENTBOOK.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_AncientBook_01;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_AncientBook_01()
{
	var int nDocID;

	if(Read_AncientBook_01 == FALSE)
	{
		Read_AncientBook_01 = TRUE;
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};
	};
	if((BookBonus_23 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_23 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"ANCIENTBOOK_01.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_RezeptMist(C_Item)
{
	name = "Alchymistický recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Recept na přípravu nějakého zvláštního lektvaru...";
	inv_animate = 1;
};

instance ItWr_RezeptIngridients(C_Item)
{
	name = "Vzkaz";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Vzkaz od Norolase";
	text[4] = "Seznam ingrediencí na Norolasův lektvar...";
	on_state[0] = Use_ItWr_RezeptIngridients;
	inv_animate = 1;
};

func void Use_ItWr_RezeptIngridients()
{
	var int nDocID;

	if(KnowRezIng == FALSE)
	{
		KnowRezIng = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Seznam potřebných ingrediencí:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kosti z kostlivce");
	Doc_PrintLine(nDocID,0,"Černá perla");
	Doc_PrintLine(nDocID,0,"Maso z mrtvoly");
	Doc_PrintLine(nDocID,0,"Vejce důlního červa");
	Doc_PrintLine(nDocID,0,"Srdce démona");
	Doc_PrintLine(nDocID,0,"Prach nekromanta");
	Doc_PrintLine(nDocID,0,"Černý jetel");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_UrKarrasLetter(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Ur-Karrasovo sdělení";
	text[4] = "Ur-Karrasův dopis vůdci klanu Vysoké skály...";
	inv_animate = 1;
};


instance ItWr_CassiaLetter(C_Item)
{
	name = "Seznam podezřelých";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Seznam podezřelých";
	text[4] = "Seznam podezřelých z krádeže...";
	on_state[0] = Use_ItWr_CassiaLetter;
	inv_animate = 1;
};

func void Use_ItWr_CassiaLetter()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je nutné přověřit následující lidi:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Halvor");
	Doc_PrintLine(nDocID,0,"Nagur");
	Doc_PrintLine(nDocID,0,"Kardif");
	Doc_PrintLine(nDocID,0,"Moe");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " I have to punch information about the thieves' guild out of them... " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fregarah(C_Item)
{
	name = " Xardas' Notes " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_ItWr_Fregarah;
	inv_animate = 1;
};

func void Use_ItWr_Fregarah()
{
	var int nDocID;
	var int rnd;

	if (FregarahSecret ==  FALSE )
	{
		B_GivePlayerXP(500);
		FregarahSecret = TRUE ;
		Snd_Play("Levelup");
		B_LogEntry( TOPIC_XRANFREG , " From Xardas' journal I learn that the stone guard at the entrance to the temple may have something to do with the events that took place several thousand years ago, when Beliar murdered his brother Stonnos, the fourth of the gods on this earth.. . Now I just need to find some evidence that describes all these events. But where to look for it? " );
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
	if((BookBonus_145 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_145 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " For many years I asked myself the same question - where did this creature come from? Until the Guardians revealed to me a glimpse of the events when Stonnos, the fourth of the gods of this world, was killed by his brother - Beliar! I am completely sure that the sudden appearance of this creature in our world is somehow connected with these events. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Such a being appears in our world only rarely, often in times of great upheaval. The incredible power that is found in them can transform an ordinary object into an artifact that possesses truly amazing properties. " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_01 (C_Item);
{
	name = " Chronicles of Stonnos " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chronicle of Stonnos - Volume I " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_01;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_01()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr01 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr01 = TRUE ;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		if (( MIS_XRANFREG  == LOG_Running) && (StonnosHr01 ==  TRUE ) && (StonnosHr02 ==  TRUE ) && (StonnosHr03 ==  TRUE ) && (StonnosHr04 ==  TRUE ) && (StonnosHr05 ==  TRUE ) && (StonnosHr06 ==  TRUE ) && (StonnosHrAll ==  FALSE ))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry( TOPIC_XRANFREG , " Now I know all I needed! The creature Pyrokar and Xardas encountered was none other than Stonnos himself. He is immortal and only and only the blood of the god who spawned him can destroy this creature. According of all, ordinary magical ore - it is the same as the blood of Stonnos! I remember the story of Uriziel. Maybe it will work again. But where will I find so much ore?! And most importantly, what item to use for these purposes. Questions, questions, only questions... " );
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
	if((BookBonus_146 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_146 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The four divine brothers were very strong despite their contradictions that arose from their own nature. The noble Innos, the ambitious Beliar, the focused Adanos, and the enthusiastic Stonnos. As long as they play their part in this world, our options are limited by their by convention. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Three is better than four. And every virtue has its flaws: the smugness of Innos, the envy of Beliar, the indifference of Adano, and the over-sacrifice of Stonnos. He who penetrates the darkness of the Rock also enters the Darkness of Beliar. How simply to sow the seeds of doubt and grow the seeds of hatred mixed with envy. The main thing is – vigilance! " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_02 (C_Item);
{
	name = " Chronicles of Stonnos " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chronicles of Stonnos - Volume II " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_02;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_02()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr02 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr02 = TRUE ;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		if (( MIS_XRANFREG  == LOG_Running) && (StonnosHr01 ==  TRUE ) && (StonnosHr02 ==  TRUE ) && (StonnosHr03 ==  TRUE ) && (StonnosHr04 ==  TRUE ) && (StonnosHr05 ==  TRUE ) && (StonnosHr06 ==  TRUE ) && (StonnosHrAll ==  FALSE ))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry( TOPIC_XRANFREG , " Now I know all I needed! The creature Pyrokar and Xardas encountered was none other than Stonnos himself. He is immortal and only and only the blood of the god who spawned him can destroy this creature. According of all, ordinary magical ore - it is the same as the blood of Stonnos! I remember the story of Uriziel. Maybe it will work again. But where will I find so much ore?! And most importantly, what item to use for these purposes. Questions, questions, only questions... " );
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
	if((BookBonus_147 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_147 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The plan culminates. But envy is a bad ally and an even worse adviser. While Innos and Adan's attention was diverted, Beliar carried out his secret plan to gain power over the earth's darkness and killed his brother and put an end to his actions on the ground. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Only when this powerful being fell, the last thing to do was to isolate Stonnos' weakened soul essence. But where to find a suitable container capable of holding such power?... " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_03 (C_Item);
{
	name = " Chronicles of Stonnos " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chronicles of Stonnos - Volume III " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_03;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_03()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr03 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr03 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		if (( MIS_XRANFREG  == LOG_Running) && (StonnosHr01 ==  TRUE ) && (StonnosHr02 ==  TRUE ) && (StonnosHr03 ==  TRUE ) && (StonnosHr04 ==  TRUE ) && (StonnosHr05 ==  TRUE ) && (StonnosHr06 ==  TRUE ) && (StonnosHrAll ==  FALSE ))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry( TOPIC_XRANFREG , " Now I know all I needed! The creature Pyrokar and Xardas encountered was none other than Stonnos himself. He is immortal and only and only the blood of the god who spawned him can destroy this creature. According of all, ordinary magical ore - it is the same as the blood of Stonnos! I remember the story of Uriziel. Maybe it will work again. But where will I find so much ore?! And most importantly, what item to use for these purposes. Questions, questions, only questions... " );
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
	if((BookBonus_148 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_148 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Aware of the convention, we managed to proceed with our plan. To prevent the rest of the mental essence of Stonnos' power from disintegrating, we trapped his weakened power in the body of a powerful being. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The divine brothers trust each other only now, when this neutral box will be under the supervision of each of them. " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_04 (C_Item);
{
	name = " Chronicles of Stonnos " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chronicles of Stonnos - Volume IV " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_04;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_04()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr04 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr04 = TRUE ;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		if (( MIS_XRANFREG  == LOG_Running) && (StonnosHr01 ==  TRUE ) && (StonnosHr02 ==  TRUE ) && (StonnosHr03 ==  TRUE ) && (StonnosHr04 ==  TRUE ) && (StonnosHr05 ==  TRUE ) && (StonnosHr06 ==  TRUE ) && (StonnosHrAll ==  FALSE ))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry( TOPIC_XRANFREG , " Now I know all I needed! The creature Pyrokar and Xardas encountered was none other than Stonnos himself. He is immortal and only and only the blood of the god who spawned him can destroy this creature. According of all, ordinary magical ore - it is the same as the blood of Stonnos! I remember the story of Uriziel. Maybe it will work again. But where will I find so much ore?! And most importantly, what item to use for these purposes. Questions, questions, only questions... " );
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
	if((BookBonus_149 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_149 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Something went wrong and a magical explosion of incredible power damaged the box. What fools we are! Now the important decision is to wake up the weakened mental essence of Stonnos or destroy him for good. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Once Stonnos regained his senses for a moment and his mental essence escaped beyond the confines of the box, simultaneously absorbing the energy of his element, he regained his former power. I can see it all before my eyes today, just as it did then. " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_05 (C_Item);
{
	name = " Chronicles of Stonnos " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chronicles of Stonnos - Volume V " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_05;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_05()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr05 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr05 = TRUE ;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		if (( MIS_XRANFREG  == LOG_Running) && (StonnosHr01 ==  TRUE ) && (StonnosHr02 ==  TRUE ) && (StonnosHr03 ==  TRUE ) && (StonnosHr04 ==  TRUE ) && (StonnosHr05 ==  TRUE ) && (StonnosHr06 ==  TRUE ) && (StonnosHrAll ==  FALSE ))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry( TOPIC_XRANFREG , " Now I know all I needed! The creature Pyrokar and Xardas encountered was none other than Stonnos himself. He is immortal and only and only the blood of the god who spawned him can destroy this creature. According of all, ordinary magical ore - it is the same as the blood of Stonnos! I remember the story of Uriziel. Maybe it will work again. But where will I find so much ore?! And most importantly, what item to use for these purposes. Questions, questions, only questions... " );
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
	if((BookBonus_150 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_150 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Magical ore - it's nothing more than the petrified blood of Stonnos. But the red-hot earth's depths - that's the true power of the stone god! There's nothing we can do about it now. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " However, the newly created being is not Stonnos himself, but only a part of himself. We managed to convince him to serve us and it is so that now none of the divine brothers can use him for their own benefit. " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_06 (C_Item);
{
	name = " Chronicles of Stonnos " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Chronicles of Stonnos - Volume VI " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_06;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_06()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr06 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr06 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rétorika + 1 " );
		};

		if (( MIS_XRANFREG  == LOG_Running) && (StonnosHr01 ==  TRUE ) && (StonnosHr02 ==  TRUE ) && (StonnosHr03 ==  TRUE ) && (StonnosHr04 ==  TRUE ) && (StonnosHr05 ==  TRUE ) && (StonnosHr06 ==  TRUE ) && (StonnosHrAll ==  FALSE ))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry( TOPIC_XRANFREG , " Now I know all I needed! The creature Pyrokar and Xardas encountered was none other than Stonnos himself. He is immortal and only and only the blood of the god who spawned him can destroy this creature. According of all, ordinary magical ore - it is the same as the blood of Stonnos! I remember the story of Uriziel. Maybe it will work again. But where will I find so much ore?! And most importantly, what item to use for these purposes. Questions, questions, only questions... " );
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
	if((BookBonus_151 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_151 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " His power and abilities are remarkable! However, we must find a way to destroy him if necessary. However, only the power of his essence is capable of destroying him! " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " The blood of his dead god - that's what we need! The magical power associated with it is what will do its job when the time is right. And it will be sooner than we think... " );
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_07 (C_Item);
{
	name = " Last Breath " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = " Last Breath " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_07;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_07()
{
	var int nDocID;
	var int rnd;

	if (StonnosHr07 ==  FALSE )
	{
		B_GivePlayerXP(500);
		StonnosHr07 = TRUE ;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
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
	if((BookBonus_152 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_152 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " The fate of this world is sealed! It will be destroyed by the winds of chaos and in its place, we will build a new temple. It will be beautiful as this world was beautiful. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Their only hope of salvation lies in the hands of the one whom the gods have named their chosen one! Only he can prove us wrong in our choices and that this world deserves to be waived. " );
	Doc_Show(nDocID);
};

instance ItWr_Alchemy_01(C_Item)
{
	name = " Origin of Alchemy " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " The Origin of Alchemy " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Alchemy_01;
	inv_animate = 1;
};

func void Use_ItWr_Alchemy_01()
{
	var int nDocID;
	var int rnd;

	if(Alchemy_01 == FALSE)
	{
		B_GivePlayerXP(250);
		Alchemy_01 = TRUE;
		Snd_Play("Levelup");
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
	if((BookBonus_153 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_153 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Wise men learned to extract magical power from herbs and parts of various creatures. Since then, alchemists have sought uses for new remedies and ways to improve old ones. Those whose essence was attacked by Beliar himself are called dark alchemists . They use the bones, skulls, and ectoplasm of powerful magical creatures in their potions. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Elixirs have different effects on warriors and mages. As a result of training, the body becomes sensitive to certain alchemical mixtures and builds immunity to others. For the best effects, use elixirs naturally to your personal training. " );
	Doc_Show(nDocID);
};

instance ItWr_Druid_01(C_Item)
{
	name = "Druidi";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Druidi";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Druid_01;
	inv_animate = 1;
};

func void Use_ItWr_Druid_01()
{
	var int nDocID;
	var int rnd;

	if(Druid_01 == FALSE)
	{
		B_GivePlayerXP(250);
		Druid_01 = TRUE;
		Snd_Play("Levelup");
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
	if((BookBonus_154 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_154 = TRUE ;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " When plants and animals changed their original nature, the druids began to fear them. But Adanos turned to the wise and said that evil could be turned into good, and poison into medicine. He warned them and frightened them with the wrath of the three of the gods that wisdom must not be turned into evil and medicine into poison. Unfortunately, not everyone could resist the temptation. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " Druids have penetrated the secrets of herbs. Their knowledge helps alchemists to change poison into elixirs. By the will of the druids, where there were bushes, forests grew, where there were deserts, bushes grew. Unfortunately, such a work is done by druids once, twice in life. Helpers who serve the druids in the forest are ents - half-living trees that are able to move, like golems. " );
	Doc_Show(nDocID);
};

instance ItWr_Sigil(C_Item)
{
	name = " Old Scroll " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Sigil;
	scemeName = "MAP";
	description = "Runový sihill";
	text[ 4 ] = " How to make 'Silver Runic Sihill'... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Sigil()
{
	var int nDocID;
	var int rnd;

	if(Npc_IsPlayer(self))
	{
		if(SigilKnow == FALSE)
		{
			SigilKnow = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print( " Learned: Blacksmithing - 'Silver Runic Sihill' " );
			B_LogEntry(TOPIC_TalentSmith, " Materials for forging SILVER RUNE SIHILL: 2x Mercury, 3x Iron Ingot, 2x Black Ore, Moonstone, 2x Black Pearl, Resin, 4x Brimstone, 10x Runestone Shard, 'Destroy the Undead' spell scroll, and 4x Quartz. " );
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
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- Runový sihill -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " This sword is probably the best weapon ever made by man! Not only can it silently chop enemies into small pieces, it can also inflict injury on intangible beings such as ghosts. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Unfortunately, only a true blacksmith master is able to forge a weapon of this kind, because the recipe for production is extremely complex. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Unpoison(C_Item)
{
	name = " Old Scroll " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Unpoison;
	scemeName = "MAP";
	description = " Poison Resistance " ;
	text[ 4 ] = " Method of defense against poisons... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Unpoison()
{
	var int nDocID;
	var int rnd;

	if(Npc_IsPlayer(self))
	{
		if(ResistPoisonKnow == FALSE)
		{
			ResistPoisonKnow = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print( " Learned: Poison Resistance " );
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
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- Jedy -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " Poison - it's evil! Especially when it gets into the body. We have to make sure that the body starts breaking down the poison as soon as possible. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " It is very important to keep moving and sweat a lot! Then poison poisoning will not cause so much harm. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance Itar_Pal_Cloack(C_Item)
{
	name = " Avabula's Wings " ;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	value = 1;
	visual = "Pal_Flaga.MMS";
	material = MAT_LEATHER;
	description = " Avabula's Wings " ;
	inv_animate = 1;
};

instance ItWr_ArmorDocs(C_Item)
{
	name = " Old Drawings " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_ArmorDocs;
	scemeName = "MAP";
	description = "Staré kresby";
	text[ 4 ] = " Similar to blueprints for making some armor... " ;
	inv_animate = 1;
};

func void Use_ItWr_ArmorDocs()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ARM.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_MiltenSummon(C_Item)
{
	name = " Milten's Scroll " ;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};
