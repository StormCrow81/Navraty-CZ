

instance DIA_ADDON_INEXTREMO_LUTTER_EXIT(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 999;
	condition = dia_addon_inextremo_lutter_exit_condition;
	information = dia_addon_inextremo_lutter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_lutter_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_lutter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_LUTTER_PICKPOCKET(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 900;
	condition = dia_addon_inextremo_lutter_pickpocket_condition;
	information = dia_addon_inextremo_lutter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_lutter_pickpocket_condition()
{
	return  C_Robbery ( 66 , 66 );
};

func void dia_addon_inextremo_lutter_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_lutter_pickpocket);
	Info_AddChoice(dia_addon_inextremo_lutter_pickpocket,Dialog_Back,dia_addon_inextremo_lutter_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_lutter_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_lutter_pickpocket_doit);
};

func void dia_addon_inextremo_lutter_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_addon_inextremo_lutter_pickpocket);
};

func void dia_addon_inextremo_lutter_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_lutter_pickpocket);
};


instance DIA_ADDON_INEXTREMO_LUTTER_HI(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 2;
	condition = dia_addon_inextremo_lutter_hi_condition;
	information = dia_addon_inextremo_lutter_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_lutter_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_lutter_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER3 == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_00 " );	// So you're the guildmaster now!
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_01 " );	// Hmmm... Asmal underestimated you even though he was a tough guy.
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_02 " );	// So it's better not to mess with you. Yourself will be more expensive!
			AI_Output(other,self, " DIA_Addon_InExtremo_Lutter_Hi_01_03 " );	// It turns out that it is.
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_04 " );	// Okay. Now tell me what do you want from me?
			KILLMEMBER3 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_77 " );	// Any questions to Charlotte, boss.
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_78 " );	// You yourself made her your assistant!
			AI_Output(other,self, " DIA_Addon_InExtremo_Lutter_Hi_01_79 " );	// Well, yes, of course.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_05 " );	// What is this time?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Hi_01_06");	//Не мешай мне!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		if(JOINKILLERS == TRUE)
		{
			if(CHIEFKILLERISDEAD == FALSE)
			{
				AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_07 " );	// If you need something, go to Asmal.
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			}
			else
			{
				B_Say(self,other,"$NOTNOW");
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_08 " );	// Back off! Don't let me rest...
			AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Hi_01_09 " );	// If you need anything, talk to Gillian. He's our boss!
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	};
};

instance DIA_Addon_InExtremo_Lutter_Lute(C_Info)
{
	npc = PIR_1395_Addon_InExtremo_Lutter;
	nr = 1;
	condition = DIA_Addon_InExtremo_Lutter_Lute_condition;
	information = DIA_Addon_InExtremo_Lutter_Lute_info;
	permanent = FALSE;
	description = " I remember you had such a strange musical instrument. " ;
};

func int DIA_Addon_InExtremo_Lutter_Lute_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_Lutter_Lute_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_InExtremo_Lutter_Lute_01_01 " );	// I remember you had such a strange musical instrument.
	AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Lute_01_02 " );	// (carelessly) If anything, they call him - chitarron...
	AI_Output(other,self, " DIA_Addon_InExtremo_Lutter_Lute_01_03 " );	// Will you give it to me?
	AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Lute_01_04 " );	// To you? Do you even know how to play it?
	AI_Output(other,self, " DIA_Addon_InExtremo_Lutter_Lute_01_05 " );	// Well, it's never too late to learn.
	AI_Output(self,other, " DIA_Addon_InExtremo_Lutter_Lute_01_06 " );	// Oh, okay. Take it if you really need it. I don't need him here.
	B_GiveInvItems(self,other,ItMi_IEDrumScheit,1);
	Npc_RemoveInvItems(self,ItMi_IEDrumScheit, 1 );
	AI_Output(other,self, " DIA_Addon_InExtremo_Lutter_Lute_01_07 " );	// Thank you.
	AI_Output(self,other,"DIA_Addon_InExtremo_Lutter_Lute_01_08");	//Да не за что.
	B_LogEntry( TOPIC_KASSIAMUSIC , " Luther gave me his musical instrument. " );
};
