

instance DIA_ADDON_INEXTREMO_DRPYMONTE_EXIT(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 999;
	condition = dia_addon_inextremo_drpymonte_exit_condition;
	information = dia_addon_inextremo_drpymonte_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_drpymonte_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_drpymonte_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_DRPYMONTE_PICKPOCKET(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 900;
	condition = dia_addon_inextremo_drpymonte_pickpocket_condition;
	information = dia_addon_inextremo_drpymonte_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_drpymonte_pickpocket_condition()
{
	return  C_Robbery ( 80 , 100 );
};

func void dia_addon_inextremo_drpymonte_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
	Info_AddChoice(dia_addon_inextremo_drpymonte_pickpocket,Dialog_Back,dia_addon_inextremo_drpymonte_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_drpymonte_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_drpymonte_pickpocket_doit);
};

func void dia_addon_inextremo_drpymonte_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
};

func void dia_addon_inextremo_drpymonte_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
};


instance DIA_ADDON_INEXTREMO_DRPYMONTE_HI(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 2;
	condition = dia_addon_inextremo_drpymonte_hi_condition;
	information = dia_addon_inextremo_drpymonte_hi_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_inextremo_drpymonte_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_drpymonte_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER1 == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_00 " );	// Did you manage to finish off Asmal? I'm shocked!
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_01 " );	// I thought no one would succeed.
			AI_Output(other,self, " DIA_Addon_InExtremo_DrPymonte_Hi_01_02 " );	// It turns out that you were wrong.
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_03 " );	// It turns out that it is. Well, now you're in charge here.
			KILLMEMBER1 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_77 " );	// Any questions to Charlotte, boss.
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_78 " );	// You yourself made her your assistant!
			AI_Output(other,self, " DIA_Addon_InExtremo_DrPymonte_Hi_01_79 " );	// Well, yes, of course.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_04 " );	// What do you say?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_05");	//Не мешай мне!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		if(JOINKILLERS == TRUE)
		{
			if(CHIEFKILLERISDEAD == FALSE)
			{
				AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_06 " );	// If you need something, talk to Asmal.
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
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_07 " );	// Don't bother me!
			AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Hi_01_08 " );	// If you need anything, talk to Gillian. He's in charge here.
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	};
};

instance DIA_Addon_InExtremo_DrPymonte_Harfe(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 1;
	condition = DIA_Addon_InExtremo_DrPymonte_Harfe_condition;
	information = DIA_Addon_InExtremo_DrPymonte_Harfe_info;
	permanent = FALSE;
	description = " I remember you had a harp. " ;
};

func int DIA_Addon_InExtremo_DrPymonte_Harfe_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_DrPymonte_Harfe_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_InExtremo_DrPymonte_Harfe_01_01 " );	// I remember you had a harp. Is not it?
	AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Harfe_01_02 " );	// Yes, it was.
	AI_Output(other,self, " DIA_Addon_InExtremo_DrPymonte_Harfe_01_03 " );	// Do you still need it?
	AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Harfe_01_04 " );	// (thoughtfully) Why is she here for me? It only takes up space...
	AI_Output(self,other, " DIA_Addon_InExtremo_DrPymonte_Harfe_01_05 " );	// If you want, you can take her. I do not mind.
	B_GiveInvItems(self,other,ItMi_IEHarfe,1);
	Npc_RemoveInvItems(self,ItMi_IEHarfe,1);
	AI_Output(other,self, " DIA_Addon_InExtremo_DrPymonte_Harfe_01_06 " );	// Thank you.
	B_LogEntry( TOPIC_KASSIAMUSIC , " Paimon gave me his harp. " );
};
