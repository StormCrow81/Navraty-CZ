
/* -------------------- CZ CHANGELOG -------------------- */

/*
v1.00:
func void Use_XardasNotfallBeutel - edited listings
func void Use_RezeptFuerMegaTrank - fixed bonus after reading
func void Use_Diary_BlackNovice - fixed reading bonus
*/




instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = " Month " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[ 4 ] = " This pouch contains some hard object and some document... " ;
	inv_animate = 1;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	// concatText = ConcatStrings(PRINT__ERHALTEN,"dva");
	// concatText = ConcatStrings(concatText,PRINT__ITEMS);
	// concatText = ConcatStrings(concatText,"a");
	concatText = ConcatStrings( " Obtained " , " 2 " );
	concatText = ConcatStrings(concatText, " subjects " );
	AI_Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = " Warning letter from Xardas " ;
	inv_animate = 1;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " My young protégé, you have disappointed me deeply. How come you sailed away without taking the Eye of Innos? I can only hope that your carelessness has its limits. Otherwise, you will never rid the world of evil, and I will have to properly punish your stupidity. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Xardas");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon (C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = " Old letter " ;
	text[ 4 ] = " An old letter, written by a shaky hand... " ;
	inv_animate = 1;
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I failed! I tried in vain to bring Inubis back to the path of good. Inubis has risen from the dead again! Now he wants to avenge his curse on the ancient paladin order who banished him. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " May Innos save our souls! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ivan");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

var int LastDoorToUndeadFT;

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[ 0 ] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = " Notes of a Dark Mage " ;
	inv_animate = 1;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"KHADOSH");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"EMEM KADAR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " May the Eye of Power light your way! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);

	if(LastDoorToUndeadFT == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath, " In the dark mage's notes are the words KHADOSH EMEM KADAR. It sounds like some kind of incantation, but I have no idea what it could be for. And what is the Eye of Power anyway? " );
		LastDoorToUndeadFT = TRUE;
	};
};

instance ItWr_Rezept_MegaDrink_MIS (C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = "Prastarý recept";
	inv_animate = 1;
};


func void Use_RecipeForMegaPotion()
{
	var int nDocID;
	nDocID = Doc_Create();

	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
			PLAYER_TALENT_ALCHEMY_11 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print( " Learned: Alchemy - 'Embarla Firgasto' " );
			B_LogEntry(TOPIC_TalentAlchemy, " Ingredients for EMBARLA FIRGASTO: pure alcohol, 9x dragon eggs, black pearl and sulfur. " );
		};
		if((BookBonus_162 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_162 = TRUE ;
		};
	};

	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Embarla Firgasto");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " nine dragon's eggs, a black pearl and a pinch of sulphur. Bring the liquid to a boil and pass it through a still while stirring constantly. " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " PS Use the elixir carefully, because it has strong side effects and can disrupt the internal structure of the user's mana. " );
	Doc_Show(nDocID);
};

var int Diary_BlackNovice;

instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Deník";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = " Diary of the Dark Novice " ;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
	inv_animate = 1;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I've been waiting here for more than a month for a summons. I'm beginning to doubt that they'll ever take me. Still, I've always done everything they've asked me to do, even though I'm mostly just running errands for them like some old maid. " ) ;
	Doc_PrintLines(nDocID, 0 , " The Keymaster ordered me to close all the bars, but I haven't even gotten around to it yet. If this goes on, any scumbag will be able to walk through the gate. " );
	Doc_PrintLines(nDocID, 0 , " It's a shame I can't remember the right combinations. " );
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " I'd sneak into the great hall long ago. I can't wait to see the Lord. I wonder if they'll let me join him when I become one of them. " );
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID, 1 , " I tried my luck yesterday, but it left me in the rooms with two levers before I could hit the three switches in the west wing in the right order. That dog locked those rooms! Tomorrow I'll try to somehow get hold of his keys.. . " );
	Doc_Show(nDocID);

	if(Diary_BlackNovice == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath, " The Dark Novice's diary mentions lever chambers, a key fob, switch combos, and more. I should remember that - it might come in handy later. " );
		Diary_BlackNovice = TRUE;

		if((BookBonus_163 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_163 = TRUE ;
		};
	};
};


instance ItWr_ZugBruecke_MIS (C_Item);
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = " Old letter " ;
	inv_animate = 1;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID, 0 , " I don't care if you can cross that bridge from the other side or not. For me, everyone rot in hell for me! As long as I'm on my estate, that bridge will remain closed. And if I catch anyone else , as he tries to hit those switches with his bow, I'll hang him on the nearest post with my own hands! " );
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID, 0 , " 		Archol " );
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "Oko moci";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[ 4 ] = " A piece of jade of unusual shape resembling a dragon's eye... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD ;
	inv_animate = 1;
};

instance ITMI_PRISONSOUL(C_Item)
{
	name = " Kus kamene " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[ 3 ] = " Dull stone of unknown variety... " ;
	text[ 4 ] = " Its shape resembles a closed eye... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD ;
	inv_animate = 1;
};

instance ITMI_PRISONSOUL_AWAKE(C_Item)
{
	name = " Eye of Wrath " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[ 3 ] = " The stone emits energy of unknown origin... " ;
	text[ 4 ] = " Its shape resembles a closed eye... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD ;
	inv_animate = 1;
};

instance ITMI_ORCBLOOD(C_Item)
{
	name = " Goblin Blood " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[ 4 ] = " Thick liquid of black color... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD ;
	inv_animate = 1;
};

instance ITMI_BARLOKHEART(C_Item)
{
	name = " Demon's Blood " ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	wear = WEAR_EFFECT;
	description = name;
	text[ 4 ] = " Fire demon blood of a crimson hue and a pungent sulfur smell... " ;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD ;
	inv_animate = 1;
};
