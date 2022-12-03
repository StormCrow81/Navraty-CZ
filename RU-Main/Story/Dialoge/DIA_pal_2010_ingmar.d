

instance DIA_PAL_2020_ALBRECHT_EXIT(C_Info)
{
	npc = pal_2020_albrecht;
	nr = 999;
	condition = dia_pal_2020_albrecht_exit_condition;
	information = dia_pal_2020_albrecht_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2020_albrecht_exit_condition()
{
	return TRUE;
};

func void dia_pal_2020_albrecht_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2020_ALBRECHT_TEACHPALRUNES(C_Info)
{
	npc = pal_2020_albrecht;
	nr = 100;
	condition = dia_pal_2020_albrecht_teachpalrunes_condition;
	information = dia_pal_2020_albrecht_teachpalrunes_info;
	permanent = TRUE;
	description = " Am I worthy to accept the rune? " ;
};


func int dia_pal_2020_albrecht_teachpalrunes_condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2020_albrecht_teachpalrunes_info()
{
	AI_Output(other,self, " DIA_Albrecht_TEACHPalRunes_15_00 " );	// Am I worthy of receiving the rune?

	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		AI_Output(self,other, " DIA_Albrecht_TEACHPalRunes_03_01 " );	// As a sign of degree, I give you a rune of light. She is a symbol of wisdom and justice.
		AI_Output(self,other, " DIA_Albrecht_TEACHPalRunes_03_02 " );	// Light the way for those who follow the path of Innos.
		AI_Output(self,other, " DIA_Albrecht_TEACHPalRunes_03_03 " );	// You must earn the rest of the runes. Come when you think you're worthy.
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
		CreateInvItems(self,ItRu_PalLight,1);
		B_GiveInvItems(self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Albrecht_TEACHPalRunes_03_04 " );	// Which path are you on?
		AI_Output(self,other, " DIA_Albrecht_TEACHPalRunes_03_05 " );	// Path of healing or path of struggle?
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes, " I choose the healing path. " ,dia_pal_2020_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes, " I choose to fight. " ,dia_pal_2020_albrecht_teachpalrunes_combat);
	};
};

func void dia_pal_2020_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
};

func void ba_albrecht_youarenotworthy()
{
	AI_Output(self,other, " B_Albrecht_YouAreNotWorthy_03_00 " );	// You are not yet worthy to receive the next spell of this path.
};

func void dia_pal_2020_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self, " DIA_Albrecht_TEACHPalRunes_Heal_15_00 " );	// I choose the path of healing.
	if((PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString( " Heal a Light Wound " ,CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE) && (Kapitel >= 5))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString( " Heal Medium Wound " ,CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		ba_albrecht_youarenotworthy();
	};
};

func void dia_pal_2020_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self, " DIA_Albrecht_TEACHPalRunes_Combat_15_00 " );	// I choose the path of battle.
	if((PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString("Святая стрела",CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE) && (Kapitel >= 5))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString( " Cast Out Demons " ,CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_palrepelevil);
	}
	else
	{
		ba_albrecht_youarenotworthy();
	};
};

func int dia_pal_2020_albrecht_teachpalrunes_pallightheal()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return  FALSE ;
	};
	PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	CreateInvItems(self,ItRu_PalLightHeal,1);
	B_GiveInvItems(self,other,ItRu_PalLightHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
	return TRUE;
};

func int dia_pal_2020_albrecht_teachpalrunes_palmediumheal()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return  FALSE ;
	};
	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	CreateInvItems(self,ItRu_PalMediumHeal, 1 );
	B_GiveInvItems(self,other,ItRu_PalMediumHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int dia_pal_2020_albrecht_teachpalrunes_palholybolt()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return  FALSE ;
	};
	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	CreateInvItems(self,ItRu_PalHolyBolt, 1 );
	B_GiveInvItems(self,other,ItRu_PalHolyBolt, 1 );
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int dia_pal_2020_albrecht_teachpalrunes_palrepelevil()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return  FALSE ;
	};
	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	CreateInvItems(self,ItRu_PalRepelEvil, 1 );
	B_GiveInvItems(self,other,ItRu_PalRepelEvil, 1 );
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};


instance DIA_PAL_2020_ALBRECHT_TEACH(C_Info)
{
	npc = pal_2020_albrecht;
	nr = 101;
	condition = dia_pal_2020_albrecht_teach_condition;
	information = dia_pal_2020_albrecht_teach_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};


func int dia_pal_2020_albrecht_teach_condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2020_albrecht_teach_info()
{
	AI_Output(other,self, " DIA_Albrecht_Teach_15_00 " );	// I want to increase my magical abilities.
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
	Info_AddChoice(dia_pal_2020_albrecht_teach,Dialog_Back,dia_pal_2020_albrecht_teach_back);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_pal_2020_albrecht_teach_1);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_pal_2020_albrecht_teach_5);
};

func void dia_pal_2020_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other, " DIA_Albrecht_Teach_03_00 " );	// If you want to increase your magical abilities even more, you'll have to look for another teacher.
	};
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
};

func void dia_pal_2020_albrecht_teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
	Info_AddChoice(dia_pal_2020_albrecht_teach,Dialog_Back,dia_pal_2020_albrecht_teach_back);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_pal_2020_albrecht_teach_1);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_pal_2020_albrecht_teach_5);
};

func void dia_pal_2020_albrecht_teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
	Info_AddChoice(dia_pal_2020_albrecht_teach,Dialog_Back,dia_pal_2020_albrecht_teach_back);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_pal_2020_albrecht_teach_1);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_pal_2020_albrecht_teach_5);
};

