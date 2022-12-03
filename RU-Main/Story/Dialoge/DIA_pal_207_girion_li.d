

instance DIA_GIRION_LI_XIT (C_Info)
{
	npc = pal_207_girion_li;
	nr = 999;
	condition = dia_girion_li_exit_condition;
	information = dia_girion_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_girion_li_exit_condition()
{
	return TRUE;
};

func void dia_girion_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_LI_TEACH(C_Info)
{
	npc = pal_207_girion_li;
	nr = 5;
	condition = dia_girion_li_teach_condition;
	information = dia_girion_li_teach_info;
	permanent = TRUE;
	description = " Maybe we should practice with the sword? " ;
};


func int dia_girion_li_teach_condition()
{
	return TRUE;
};

func void dia_girion_li_teach_info()
{
	AI_Output(other,self, " DIA_Girion_LI_Teach_15_00 " );	// Shall we practice with the sword?
	AI_Output(self,other, " DIA_Girion_LI_Teach_08_01 " );	// Well, come on. Let's pass the time somehow.
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_back()
{
	Info_ClearChoices(dia_girion_li_teach);
};

func void dia_girion_li_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_1H_1_08_00 " );	// Your blade should glide through the air like reeds on a coast.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_1H_5_08_00 " );	// Force must be applied sparingly. If you blindly rush at the enemy, it will not lead you to success.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other, " DIA_DIA_Girion_DI_Teach_2H_1_08_00 " );	// Do not squeeze your hand convulsively, then your blow will meet its target.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_2H_5_08_00 " );	// Don't forget to defend yourself. But the best defense is still to dodge the enemy's blow.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};


instance DIA_GIRION_LI_PICKPOCKET(C_Info)
{
	npc = pal_207_girion_li;
	nr = 900;
	condition = dia_girion_li_pickpocket_condition;
	information = dia_girion_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_girion_li_pickpocket_condition()
{
	return  C_Robbery ( 71 , 260 );
};

func void dia_girion_li_pickpocket_info()
{
	Info_ClearChoices(dia_girion_li_pickpocket);
	Info_AddChoice(dia_girion_li_pickpocket,Dialog_Back,dia_girion_li_pickpocket_back);
	Info_AddChoice(dia_girion_li_pickpocket,DIALOG_PICKPOCKET,dia_girion_li_pickpocket_doit);
};

func void dia_girion_li_pickpocket_doit()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(dia_girion_li_pickpocket);
};

func void dia_girion_li_pickpocket_back()
{
	Info_ClearChoices(dia_girion_li_pickpocket);
};


instance DIA_GIRION_LI_MISSMYGOLD(C_Info)
{
	npc = pal_207_girion_li;
	nr = 2;
	condition = dia_girion_li_missmygold_condition;
	information = dia_girion_li_missmygold_info;
	permanent = FALSE;
	description = " I lost my gold. " ;
};


func int dia_girion_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_girion_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Girion_LI_MissMyGold_01_01 " );	// I lost my gold.
	AI_Output(self,other, " DIA_Girion_LI_MissMyGold_01_02 " );	// Wait a minute. Don't you think a king's paladin is capable of stealing?
	AI_Output(self,other, " DIA_Girion_LI_MissMyGold_01_04 " );	// I don't know anything about this.
	B_LogEntry( TOPIC_MISSMYGOLD , " Girion doesn't know anything about my gold. " );
};


instance DIA_GIRION_LI_CHANGECOURSE(C_Info)
{
	npc = pal_207_girion_li;
	nr = 2;
	condition = dia_girion_li_changecourse_condition;
	information = dia_girion_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_girion_li_changecourse_info()
{
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_01_00 " );	// I heard that you managed to find large deposits of magic ore on this island.
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_01_02 " );	// I guess now we just have to return to Khorinis and report this to Lord Hagen.
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_01_03 " );	// Paladins need to know about this ore!
	Info_ClearChoices(dia_girion_li_changecourse);
	Info_AddChoice(dia_girion_li_changecourse, " I totally agree with you. " ,dia_girion_li_changecourse_ore);
	Info_AddChoice(dia_girion_li_changecourse, " Only if paladins pay for this information. " ,dia_girion_li_changecourse_gold);
};

func void dia_girion_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Girion_LI_ChangeCourse_Ore_01_00 " );	// I totally agree with you. We'll go there as soon as we fix our ship.
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Ore_01_01 " );	// (respectfully) I didn't expect other words from you.
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Ore_01_02 " );	// The ore you find will increase our chances of success in the war against the orcs.
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Ore_01_03 " );	// Maybe even our last hope...
	B_LogEntry( TOPIC_CHANGECOURSE , " Girion was glad to hear that we were returning to Khorinis to inform Lord Hagen about the magical ore on the island. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_girion_li_changecourse);
};

func void dia_girion_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Girion_LI_ChangeCourse_Gold_01_00 " );	// Only if paladins pay for this information.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_02 " );	// What?! You are a paladin! How can you do that?
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_03 " );	// Don't you have a drop of honor and nobility?
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_04 " );	// What?! It is very strange to hear such words from a venerable Fire Mage!
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_05 " );	// Does the servant of Innos value gold more than his sacred duty?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_06 " );	// What?! It is very strange to hear such words from a venerable Waterbender!
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_07 " );	// Does the servant of Adanos value gold more than honor and nobility?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_08 " );	// (arrogantly) I didn't expect to hear anything else from you.
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_09 " );	// You, dark magicians, are always interested only in your own affairs, and you do not care about the fate of others!
	}
	else if((other.guild == GIL_DJG) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_10 " );	// Well, of course. I did not expect other words from you!
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_11 " );	// You mercenaries are only interested in gold.
	}
	else
	{
		AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_12 " );	// What?! Don't you have a drop of honor and nobility?
	};
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_15 " );	// I still hope you change your mind.
	AI_Output(self,other, " DIA_Girion_LI_ChangeCourse_Gold_01_16 " );	// After all, the lives of many people depend on it!
	B_LogEntry( TOPIC_CHANGECOURSE , " Girion was outraged by my idea of ​​cashing in on paladin needs. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_girion_li_changecourse);
};

