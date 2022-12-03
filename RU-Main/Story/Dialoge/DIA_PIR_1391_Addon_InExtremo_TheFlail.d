

instance DIA_ADDON_INEXTREMO_THEFLAIL_EXIT(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 999;
	condition = dia_addon_inextremo_theflail_exit_condition;
	information = dia_addon_inextremo_theflail_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_theflail_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_theflail_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_THEFLAIL_PICKPOCKET(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 900;
	condition = dia_addon_inextremo_theflail_pickpocket_condition;
	information = dia_addon_inextremo_theflail_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_theflail_pickpocket_condition()
{
	return  C_Robbery ( 80 , 100 );
};

func void dia_addon_inextremo_theflail_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_theflail_pickpocket);
	Info_AddChoice(dia_addon_inextremo_theflail_pickpocket,Dialog_Back,dia_addon_inextremo_theflail_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_theflail_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_theflail_pickpocket_doit);
};

func void dia_addon_inextremo_theflail_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_addon_inextremo_theflail_pickpocket);
};

func void dia_addon_inextremo_theflail_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_theflail_pickpocket);
};


instance DIA_ADDON_INEXTREMO_THEFLAIL_HAI(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 2;
	condition = dia_addon_inextremo_theflail_hai_condition;
	information = dia_addon_inextremo_theflail_hai_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_theflail_hai_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_theflail_hai_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER2 == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hai_01_00 " );	// Famously you dealt with Asmal!
			AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hai_01_01 " );	// To be honest, we thought you weren't capable of much, but now...
			AI_Output(other,self, " DIA_Addon_InExtremo_TheFlail_Hai_01_02 " );	// Now everything will be different.
			AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hai_01_03 " );	// Of course, boss! As you say.
			KILLMEMBER2 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hi_01_77 " );	// If you need anything, talk to Charlotte.
			AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hi_01_78 " );	// She's your assistant.
			AI_Output(other,self,"DIA_Addon_InExtremo_TheFlail_Hi_01_79");	//Ну да, конечно.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hi_01_04 " );	// What do you say?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hai_01_05 " );	// Don't distract me!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Hai_01_06 " );	// Leave me alone!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

instance DIA_Addon_InExtremo_TheFlail_Lute(C_Info)
{
	npc = PIR_1391_Addon_InExtremo_TheFlail;
	nr = 1;
	condition = DIA_Addon_InExtremo_TheFlail_Lute_condition;
	information = DIA_Addon_InExtremo_TheFlail_Lute_info;
	permanent = FALSE;
	description = " That lute you played. Do you still have it? " ;
};

func int DIA_Addon_InExtremo_TheFlail_Lute_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_TheFlail_Lute_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_InExtremo_TheFlail_Lute_01_01 " );	// That lute you played. Is she still with you?
	AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Lute_01_02 " );	// And where should she be... (laughs) Here she is, dear!
	AI_Output(other,self, " DIA_Addon_InExtremo_TheFlail_Lute_01_03 " );	// It's just such a thing, in general, I desperately need this tool.
	AI_Output(other,self, " DIA_Addon_InExtremo_TheFlail_Lute_01_04 " );	// Can you give it to me?
	AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Lute_01_05 " );	// For you, boss, whatever you want! Here you are.
	AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Lute_01_06 " );	// But wait. Do you even know how to play it?
	AI_Output(other,self, " DIA_Addon_InExtremo_TheFlail_Lute_01_07 " );	// It doesn't matter now.
	B_GiveInvItems(self,other,ItMi_IELaute,1);
	Npc_RemoveInvItems(self,ItMi_IELaute,1);
	AI_Output(self,other, " DIA_Addon_InExtremo_TheFlail_Lute_01_08 " );	// Okay. As you know.
	B_LogEntry( TOPIC_KASSIAMUSIC , " Flail gave me his lute. " );
};
