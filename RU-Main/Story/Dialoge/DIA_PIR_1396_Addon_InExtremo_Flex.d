

instance DIA_ADDON_INEXTREMO_FLEX_EXIT(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 999;
	condition = dia_addon_inextremo_flex_exit_condition;
	information = dia_addon_inextremo_flex_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_flex_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_flex_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_FLEX_PICKPOCKET(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 900;
	condition = dia_addon_inextremo_flex_pickpocket_condition;
	information = dia_addon_inextremo_flex_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_flex_pickpocket_condition()
{
	return  C_Robbery ( 65 , 100 );
};

func void dia_addon_inextremo_flex_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_flex_pickpocket);
	Info_AddChoice(dia_addon_inextremo_flex_pickpocket,Dialog_Back,dia_addon_inextremo_flex_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_flex_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_flex_pickpocket_doit);
};

func void dia_addon_inextremo_flex_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_addon_inextremo_flex_pickpocket);
};

func void dia_addon_inextremo_flex_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_flex_pickpocket);
};


instance DIA_ADDON_INEXTREMO_FLEX_HI(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 1;
	condition = dia_addon_inextremo_flex_hi_condition;
	information = dia_addon_inextremo_flex_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_flex_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_flex_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER4 == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_00 " );	// (surprised) Hey man! How did the deba manage to kick Asmal's ass?
			AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_01 " );	// I still can't imagine... (laughs) And you, you see, are cool, if people like Asmal are not a problem for you.
			AI_Output(other,self, " DIA_Addon_InExtremo_Flex_Hi_01_02 " );	// There are few. Do you want to check?
			AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_03 " );	// No, no! What you! (frightened) It's just me... well, forget about it.
			KILLMEMBER4 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_77 " );	// Any questions to Charlotte, boss.
			AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_78 " );	// You yourself appointed her as your assistant.
			AI_Output(other,self, " DIA_Addon_InExtremo_Flex_Hi_01_79 " );	// Well, yes, of course.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_04 " );	// How are you, boss?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_05 " );	// Don't distract me!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_InExtremo_Flex_Hi_01_06 " );	// Back off! Don't let me rest...
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

instance DIA_Addon_InExtremo_Flex_DudelBlau(C_Info)
{
	npc = PIR_1396_Addon_InExtremo_Flex;
	nr = 1;
	condition = DIA_Addon_InExtremo_Flex_DudelBlau_condition;
	information = DIA_Addon_InExtremo_Flex_DudelBlau_info;
	permanent = FALSE;
	description = " I remember you had a bagpipe. " ;
};

func int DIA_Addon_InExtremo_Flex_DudelBlau_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_Flex_DudelBlau_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_InExtremo_Flex_DudelBlau_01_01 " );	// I remember you had a bagpipe.
	AI_Output(self,other, " DIA_Addon_InExtremo_Flex_DudelBlau_01_02 " );	// Well, it was... (laughs) Why do you need it?
	AI_Output(other,self, " DIA_Addon_InExtremo_Flex_DudelBlau_01_03 " );	// Yeah, I just want to learn how to play it.
	AI_Output(other,self, " DIA_Addon_InExtremo_Flex_DudelBlau_01_04 " );	// Can you give it to me?
	AI_Output(self,other, " DIA_Addon_InExtremo_Flex_DudelBlau_01_05 " );	// Yes, why not. Still, it's of no use to her.
	AI_Output(self,other, " DIA_Addon_InExtremo_Flex_DudelBlau_01_06 " );	// Here, take it. Just don't blow too hard! And then she has a little fur torn.
	B_GiveInvItems(self,other,ItMi_IEDudelBlau,1);
	Npc_RemoveInvItems(self,ItMi_IEDudelBlau,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_Flex_DudelBlau_01_07");	//Спасибо!
	B_LogEntry( TOPIC_KASSIAMUSIC , " Flex gave me his bagpipe. " );
};
