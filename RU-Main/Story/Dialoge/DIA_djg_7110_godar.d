

instance DIA_DJG_7110_GODAR_EXIT(C_Info)
{
	npc = djg_7110_goddar;
	nr = 999;
	condition = dia_djg_7110_godar_exit_condition;
	information = dia_djg_7110_godar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_djg_7110_godar_exit_condition()
{
	return TRUE;
};

func void dia_djg_7110_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7110_GODAR_PERM(C_Info)
{
	npc = djg_7110_goddar;
	condition = dia_djg_7110_godar_perm_condition;
	information = dia_djg_7110_godar_perm_info;
	permanent = TRUE;
	description = " Hungry? " ;
};


func int dia_djg_7110_godar_perm_condition()
{
	if(DGJREVENGEME == FALSE)
	{
		return TRUE;
	};
};

func void dia_djg_7110_godar_perm_info()
{
	AI_Output(other,self, " DIA_DJG_7110_Godar_Perm_01_00 " );	// Hungry?
	AI_Output(self,other, " DIA_DJG_7110_Godar_Perm_01_01 " );	// Can't you see it yourself? There in the Valley of Mines, normal food is worth its weight in gold. Not like here.
	AI_Output(self,other, " DIA_DJG_7110_Godar_Perm_01_02 " );	// Therefore, while I can, I want to stuff my belly to the bone.
	AI_Output(self,other, " DIA_DJG_7110_Godar_Perm_01_03 " );	// Who knows what will happen next!
	AI_Output(other,self, " DIA_DJG_7110_Godar_Perm_01_04 " );	// Okay, then I won't interfere.
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7110_GODAR_PICKPOCKET(C_Info)
{
	npc = djg_7110_goddar;
	nr = 900;
	condition = dia_djg_7110_godar_pickpocket_condition;
	info = dia_djg_7110_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_djg_7110_godar_pickpocket_condition()
{
	return  C_Robbery ( 100 , 350 );
};

func void dia_djg_7110_godar_pickpocket_info()
{
	Info_ClearChoices(dia_djg_7110_godar_pickpocket);
	Info_AddChoice(dia_djg_7110_godar_pickpocket,Dialog_Back,dia_djg_7110_godar_pickpocket_back);
	Info_AddChoice(dia_djg_7110_godar_pickpocket, DIALOG_PICKPOCKET ,dia_djg_7110_godar_pickpocket_doit);
};

func void dia_djg_7110_godar_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_djg_7110_godar_pickpocket);
};

func void dia_djg_7110_godar_pickpocket_back()
{
	Info_ClearChoices(dia_djg_7110_godar_pickpocket);
};


instance DIA_DJG_7110_GODAR_FUCKOFF(C_Info)
{
	npc = djg_7110_goddar;
	nr = 2;
	condition = dia_djg_7110_godar_fuckoff_condition;
	information = dia_djg_7110_godar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_7110_godar_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREVENGEME == TRUE))
	{
		return TRUE;
	};
};

func void dia_djg_7110_godar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

