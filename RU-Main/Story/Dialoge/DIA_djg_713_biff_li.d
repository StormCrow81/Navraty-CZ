

instance DIA_BIFF_LI_EXIT(C_Info)
{
	npc = djg_713_biff_li;
	nr = 999;
	condition = dia_biff_li_exit_condition;
	information = dia_biff_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_biff_li_exit_condition()
{
	return TRUE;
};

func void dia_biff_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_LI_PERM(C_Info)
{
	npc = djg_713_biff_li;
	nr = 5;
	condition = dia_biff_li_perm_condition;
	information = dia_biff_li_perm_info;
	permanent = TRUE;
	description = " Is everything okay on the ship? " ;
};


func int dia_biff_li_perm_condition()
{
	return TRUE;
};

func void dia_biff_li_perm_info()
{
	AI_Output(other,self, " DIA_Biff_DI_perm_15_00 " );	// Is everything calm on board?
	AI_Output(self,other, " DIA_Biff_DI_perm_07_01 " );	// (nervous) Yes, yes. Everything is quiet.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_LI_PICKPOCKET(C_Info)
{
	npc = djg_713_biff_li;
	nr = 900;
	condition = dia_biff_li_pickpocket_condition;
	information = dia_biff_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_biff_li_pickpocket_condition()
{
	return  C_Robbery ( 92 , 450 );
};

func void dia_biff_li_pickpocket_info()
{
	Info_ClearChoices(dia_biff_li_pickpocket);
	Info_AddChoice(dia_biff_li_pickpocket,Dialog_Back,dia_biff_li_pickpocket_back);
	Info_AddChoice(dia_biff_li_pickpocket,DIALOG_PICKPOCKET,dia_biff_li_pickpocket_doit);
};

func void dia_biff_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_biff_li_pickpocket);
};

func void dia_biff_li_pickpocket_back()
{
	Info_ClearChoices(dia_biff_li_pickpocket);
};


instance DIA_BIFF_LI_MISSMYGOLD(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_missmygold_condition;
	information = dia_biff_li_missmygold_info;
	permanent = FALSE;
	description = " Do you know anything about my gold? " ;
};


func int dia_biff_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_biff_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Biff_LI_MissMyGold_01_01 " );	// Do you happen to know where my gold went?
	AI_Output(self,other, " DIA_Biff_LI_MissMyGold_01_02 " );	// Hardly! I prefer to think only of myself.
	B_LogEntry( TOPIC_MISSMYGOLD , " Biff didn't really have anything to say about missing my gold. " );
};


instance DIA_BIFF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_findmagicorecave_condition;
	information = dia_biff_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_biff_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Biff_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Biff_LI_FindMagicOreCave_01_02 " );	// True? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Biff_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_BIFF_LI_CHANGECOURSE(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_changecourse_condition;
	information = dia_biff_li_changecourse_info;
	permanent = FALSE;
	description = " We must return to Khorinis. " ;
};


func int dia_biff_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_biff_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_01_00 " );	// We must return to Khorinis again.
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_01_01 " );	// Why would it?
	Info_ClearChoices(dia_biff_li_changecourse);
	Info_AddChoice(dia_biff_li_changecourse, " I need to speak to the paladins urgently. " ,dia_biff_li_changecourse_ore);
	Info_AddChoice(dia_biff_li_changecourse, " It's about gold. " ,dia_biff_li_changecourse_gold);
};

func void dia_biff_li_changecourse_ore()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_Ore_01_01 " );	// I need to speak to Lord Hagen urgently!
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_Ore_01_02 " );	// Why else?
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_Ore_01_03 " );	// We need to inform the paladins about the magical ore we found on this island.
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_Ore_01_04 " );	// This news should help them in their war against the orcs.
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_Ore_01_05 " );	// I don't think this should worry us that much.
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_Ore_01_07 " );	// Let the paladins deal with these vile creatures, we'd better stay out of it.
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_Ore_01_09 " );	// I have no desire to help paladins!
	B_LogEntry( TOPIC_CHANGECOURSE , " Biff the mercenary is opposed to returning to Khorinis and helping the paladins. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Now it's time to tell our captain. " );
	};
	Info_ClearChoices(dia_biff_li_changecourse);
};

func void dia_biff_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_Gold_01_01 " );	// It's about gold.
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_Gold_01_02 " );	// Really? And what place?
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_Gold_01_03 " );	// We need to inform the paladins about the magical ore we found on this island.
	AI_Output(other,self, " DIA_Biff_LI_ChangeCourse_Gold_01_04 " );	// I'm sure it would be nice to make money on this whole thing. What do you say?
	AI_Output(self,other, " DIA_Biff_LI_ChangeCourse_Gold_01_05 " );	// Great idea, mate!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_07");	//Я с тобой!
	B_LogEntry( TOPIC_CHANGECOURSE , " Mercenary Biff doesn't mind going back to Khorinis. " );
	CREWAGREEAWAYBACKSELL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_biff_li_changecourse);
};

