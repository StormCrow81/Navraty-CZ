

instance DIA_RUDAR_EXIT(C_Info)
{
	npc = sld_6111_rudar;
	nr = 999;
	condition = dia_rudar_exit_condition;
	information = dia_rudar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_rudar_exit_condition()
{
	return TRUE;
};

func void dia_rudar_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_RUDAR_PICKPOCKET (C_Info)
{
	npc = sld_6111_rudar;
	nr = 900;
	condition = dia_rudar_pickpocket_condition;
	information = dia_rudar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_rudar_pickpocket_condition()
{
	return  C_Robbery ( 92 , 320 );
};

func void dia_rudar_pickpocket_info()
{
	Info_ClearChoices(dia_rudar_pickpocket);
	Info_AddChoice(dia_rudar_pickpocket, Dialog_Back, dia_rudar_pickpocket_back);
	Info_AddChoice(dia_rudar_pickpocket, DIALOG_PICKPOCKET , dia_rudar_pickpocket_doit);
};

func void dia_rudar_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_rudar_pickpocket);
};

func void dia_rudar_pickpocket_back()
{
	Info_ClearChoices(dia_rudar_pickpocket);
};


DIA_RUDAR_HALLO (C_Info) instances
{
	npc = sld_6111_rudar;
	nr = 2;
	condition = dia_rudar_hallo_condition;
	information = dia_rudar_hello_info;
	permanent = FALSE;
	description = " Are you alone here? " ;
};


func int dia_rudar_hallo_condition()
{
	if (( MIS_KILLTARGET5  == LOG_Running ) && Wld_IsTime ( 22 , 0 , 8 , 0 )) ;
	{
		return TRUE;
	};
};

func void dia_rudar_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Rudar_Hallo_01_00 " );	// Are you alone here?
	AI_Output(self,other, " DIA_Rudar_Hallo_01_01 " );	// As you can see, yes. Rarely is anyone here at night. Well, what brings you here?
	AI_Output(other,self, " DIA_Rudar_Hallo_01_02 " );	// Well, that's good. And what brought me here... let's say, one unsettled business.
	AI_Output(self,other, " DIA_Rudar_Hallo_01_03 " );	// Yes? And what is your problem?
	AI_Output(other,self, " DIA_Rudar_Hallo_01_04 " );	// My problem is you!
	AI_Output(self,other, " DIA_Rudar_Hallo_01_05 " );	// (surprised) WHAT?
	AI_Output(self,other, " DIA_Rudar_Hallo_01_06 " );	// Man, I don't think we even know each other. What problems can there be between us?
	AI_Output(other,self, " DIA_Rudar_Hallo_01_07 " );	// There are none between us. But you have a problem with another person, and I only solve them for him.
	AI_Output(self,other, " DIA_Rudar_Hallo_01_08 " );	// And who is this person whose problems you solve?
	AI_Output(other,self, " DIA_Rudar_Hallo_01_09 " );	// Asmal! Does this name mean anything to you?
	AI_Output(self,other, " DIA_Rudar_Hallo_01_10 " );	// Hmmm... Now it's clear. So you work for him, and since you're here, that can only mean one thing.
	AI_Output(other,self, " DIA_Rudar_Hallo_01_11 " );	// You correctly understand the essence of the problem.
	AI_Output(self,other, " DIA_Rudar_Hallo_01_12 " );	// Why didn't he come here himself? Or was he afraid that I would kick his ass?!
	AI_Output(other,self, " DIA_Rudar_Hallo_01_13 " );	// This you can ask him himself, if, of course, you have such an opportunity. Which I highly doubt!
	AI_Output(self,other, " DIA_Rudar_Hallo_01_14 " );	// Well, okay, let's not waste time! Let's see, you're as good with the blade as you are with the language.
	AI_Output(other,self, " DIA_Rudar_Hallo_01_15 " );	// I won't disappoint you!
	AI_StopProcessInfos(self);
	AI_Standup(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};


instances of DIA_RUDAR_HAI (C_Info)
{
	npc = sld_6111_rudar;
	nr = 2;
	condition = dia_rudar_hai_condition;
	information = dia_rudar_hai_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_rudar_hai_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void dia_rudar_hai_info()
{
	AI_Output(self,other, " DIA_Rudar_Hai_01_00 " );	// Hey! Can't you see I'm busy.
	AI_Output(self,other, " DIA_Rudar_Hai_01_01 " );	// Let's talk after I'm done.
	AI_StopProcessInfos(self);
};

