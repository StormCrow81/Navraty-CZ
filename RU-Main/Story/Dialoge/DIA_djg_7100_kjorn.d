

instance DIA_DJG_7100_KJORN_EXIT(C_Info)
{
	npc = djg_7100_kjorn;
	nr = 999;
	condition = dia_djg_7100_kjorn_exit_condition;
	information = dia_djg_7100_kjorn_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_djg_7100_kjorn_exit_condition()
{
	return TRUE;
};

func void dia_djg_7100_kjorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7100_KJORN_PERM(C_Info)
{
	npc = djg_7100_kjorn;
	condition = dia_djg_7100_kjorn_perm_condition;
	information = dia_djg_7100_kjorn_perm_info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int dia_djg_7100_kjorn_perm_condition()
{
	if(DGJREVENGEME == FALSE)
	{
		return TRUE;
	};
};

func void dia_djg_7100_kjorn_perm_info()
{
	AI_Output(other,self, " DIA_DJG_7100_Kjorn_Perm_01_00 " );	// What's the news?
	AI_Output(self,other, " DIA_DJG_7100_Kjorn_Perm_01_01 " );	// We've finally managed to get out of this cursed valley!
	AI_Output(self,other, " DIA_DJG_7100_Kjorn_Perm_01_02 " );	// To be honest, I still can't believe it.
	AI_Output(self,other, " DIA_DJG_7100_Kjorn_Perm_01_03 " );	// But now I'm sitting and thinking - and why the hell did I then pull to go there?
	AI_Output(other,self, " DIA_DJG_7100_Kjorn_Perm_01_04 " );	// I think you're just too fond of gold.
	AI_Output(self,other, " DIA_DJG_7100_Kjorn_Perm_01_05 " );	// Well, yes, that's right. But who doesn't love him!
};


instance DIA_DJG_7100_KJORN_PICKPOCKET(C_Info)
{
	npc = djg_7100_kjorn;
	nr = 900;
	condition = dia_djg_7100_kjorn_pickpocket_condition;
	information = dia_djg_7100_kjorn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_djg_7100_kjorn_pickpocket_condition()
{
	return  C_Robbery ( 100 , 350 );
};

func void dia_djg_7100_kjorn_pickpocket_info()
{
	Info_ClearChoices(dia_djg_7100_kjorn_pickpocket);
	Info_AddChoice(dia_djg_7100_kjorn_pickpocket,Dialog_Back,dia_djg_7100_kjorn_pickpocket_back);
	Info_AddChoice(dia_djg_7100_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_djg_7100_kjorn_pickpocket_doit);
};

func void dia_djg_7100_kjorn_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_djg_7100_kjorn_pickpocket);
};

func void dia_djg_7100_kjorn_pickpocket_back()
{
	Info_ClearChoices(dia_djg_7100_kjorn_pickpocket);
};


instance DIA_DJG_7100_KJORN_FUCKOFF(C_Info)
{
	npc = djg_7100_kjorn;
	nr = 2;
	condition = dia_djg_7100_kjorn_fuckoff_condition;
	information = dia_djg_7100_kjorn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_7100_kjorn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREVENGEME == TRUE))
	{
		return TRUE;
	};
};

func void dia_djg_7100_kjorn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

