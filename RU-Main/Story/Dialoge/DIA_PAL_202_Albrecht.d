

instance DIA_Albrecht_EXIT(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 999;
	condition = DIA_Albrecht_EXIT_Condition;
	information = DIA_Albrecht_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Albrecht_Hagen (C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 1;
	condition = DIA_Albrecht_Hagen_Condition;
	information = DIA_Albrecht_Hagen_Info;
	permanent = FALSE;
	description = " I need to speak to Lord Hagen! " ;
};


func int DIA_Albrecht_Hagen_Condition()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Hagen_Info()
{
	AI_Output(other,self, " DIA_Albrecht_Hagen_15_00 " );	// I need to speak to Lord Hagen!
	AI_Output(self,other, " DIA_Albrecht_Hagen_03_01 " );	// He's in the main hall, go straight, you can't go wrong.
	AI_Output(self,other, " DIA_Albrecht_Hagen_03_02 " );	// I don't know what you want from him, but keep it short - he's a busy man!
};


instance DIA_Albrecht_Hello (C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 2;
	condition = DIA_Albrecht_Hallo_Condition;
	information = DIA_Albrecht_Hallo_Info;
	permanent = FALSE;
	description = " What's it like being a paladin? " ;
};


func int DIA_Albrecht_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_Hallo_Info()
{
	AI_Output(other,self, " DIA_Albrecht_Hallo_15_00 " );	// What's it like to be a paladin?
	AI_Output(self,other, " DIA_Albrecht_Hallo_03_01 " );	// Paladins are warriors of Innos. They live to serve him and fight in his honor.
	AI_Output(self,other, " DIA_Albrecht_Hallo_03_02 " );	// In return, we are all endowed with the gift of magic. Rune magic that is bestowed in recognition of our merit.
};


instance DIA_Albrecht_CanTeach(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 99;
	condition = DIA_Albrecht_CanTeach_Condition;
	information = DIA_Albrecht_CanTeach_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int DIA_Albrecht_CanTeach_Condition()
{
	if(Albrecht_TeachMANA == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Albrecht_CanTeach_15_00 " );	// Can you teach me something?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Albrecht_CanTeach_03_01 " );	// If you prove yourself worthy, I'll reward you with paladin magic runes.
		AI_Output(self,other, " DIA_Albrecht_CanTeach_03_02 " );	// Also, I can teach you how to increase your magical abilities.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry(TOPIC_CityTeacher, " Paladin Albrecht can help me improve my magical abilities. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Albrecht_CanTeach_03_03 " );	// I only train paladins.
	};
};


instance DIA_Albrecht_TEACHPalRunes(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 100;
	condition = DIA_Albrecht_TEACHPalRunes_Condition;
	information = DIA_Albrecht_TEACHPalRunes_Info;
	permanent = TRUE;
	description = " Am I worthy to receive the rune? " ;
};


func int DIA_Albrecht_TEACHPalRunes_Condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_TEACHPalRunes_Info()
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
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, " I choose the path of healing. " ,DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, " I choose the battle path. " ,DIA_Albrecht_TEACHPalRunes_Combat);
	};
};

func void DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
};

func void B_Albrecht_YouAreNotWorthy()
{
	AI_Output(self,other, " B_Albrecht_YouAreNotWorthy_03_00 " );	// You are not yet worthy to receive the next spell of this path.
};

func void DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output(other,self, " DIA_Albrecht_TEACHPalRunes_Heal_15_00 " );	// I choose the path of healing.

	if((PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString( " Healing Touch " ,CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE) && (MIS_AllDragonsDead == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Очищение огнем",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE) && (MIS_DarkOrden == LOG_Success))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Свет Инноса",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalFullHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func void DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output(other,self, " DIA_Albrecht_TEACHPalRunes_Combat_15_00 " );	// I choose the path of battle.

	if((PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Святая стрела",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE) && (MIS_AllDragonsDead == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString( " Dispel Darkness " ,CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE) && (MIS_DarkOrden == LOG_Success))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString( " Exorcise Demons " ,CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalDestroyEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func int DIA_Albrecht_TEACHPalRunes_PalLightHeal()
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
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
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

func int DIA_Albrecht_TEACHPalRunes_PalFullHeal()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return  FALSE ;
	};
	PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
	CreateInvItems(self,ItRu_PalFullHeal, 1 );
	B_GiveInvItems(self,other,ItRu_PalFullHeal, 1 );
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
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

func int DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
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

func int DIA_Albrecht_TEACHPalRunes_PalDestroyEvil()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return  FALSE ;
	};
	PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
	CreateInvItems(self,ItRu_PalDestroyEvil,1);
	B_GiveInvItems(self,other,ItRu_PalDestroyEvil,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

instance DIA_Albrecht_Teach(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 101;
	condition = DIA_Albrecht_Teach_Condition;
	information = DIA_Albrecht_Teach_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};

func int DIA_Albrecht_Teach_Condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Teach_Info()
{
	AI_Output(other,self, " DIA_Albrecht_Teach_15_00 " );	// I want to increase my magical abilities.
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Home,Dialog_Back,DIA_Albrecht_Home_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other, " DIA_Albrecht_Teach_03_00 " );	// If you want to increase your magical abilities even more, you'll have to look for another teacher.
	};
	Info_ClearChoices(DIA_Albrecht_Teach);
};

func void DIA_Albrecht_House_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Home,Dialog_Back,DIA_Albrecht_Home_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_House_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Home,Dialog_Back,DIA_Albrecht_Home_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};


instance DIA_Albrecht_PICKPOCKET(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 900;
	condition = DIA_Albrecht_PICKPOCKET_Condition;
	information = DIA_Albrecht_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Albrecht_PICKPOCKET_Condition()
{
	return  C_Robbery ( 41 , 160 );
};

func void DIA_Albrecht_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET,Dialog_Back,DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

