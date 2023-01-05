

instance DIA_LEMARGUARD_EXIT(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 999;
	condition = dia_lemarguard_exit_condition;
	information = dia_lemarguard_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lemarguard_exit_condition()
{
	return TRUE;
};

func void dia_lemarguard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEMARGUARD_PICKPOCKET(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 900;
	condition = dia_lemarguard_pickpocket_condition;
	information = dia_lemarguard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_lemarguard_pickpocket_condition()
{
	return  C_Robbery ( 93 , 320 );
};

func void dia_lemarguard_pickpocket_info()
{
	Info_ClearChoices(dia_lemarguard_pickpocket);
	Info_AddChoice(dia_lemarguard_pickpocket, Dialog_Back, dia_lemarguard_pickpocket_back);
	Info_AddChoice(dia_lemarguard_pickpocket,DIALOG_PICKPOCKET,dia_lemarguard_pickpocket_doit);
};

func void dia_lemarguard_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_lemarguard_pickpocket);
};

func void dia_lemarguard_pickpocket_back()
{
	Info_ClearChoices(dia_lemarguard_pickpocket);
};


instances DIA_LEMARGUARD_HALLO (C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 1;
	condition = dia_lemarguard_hallo_condition;
	information = dia_lemarguard_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lemarguard_hallo_condition()
{
	return TRUE;
};

func void dia_lemarguard_hallo_info()
{
	AI_Output(self,other, " DIA_LemarGuard_Hallo_01_00 " );	// Hey, why are you all fidgeting around here? What do you need here?
	AI_Output(self,other, " DIA_LemarGuard_Hallo_01_01 " );	// But wait... (looks attentively) I think I know you!
	AI_Output(self,other, " DIA_LemarGuard_Hallo_01_02 " );	// Well, sure! You're the guy that kept popping up in the Old Camp and bothering everyone.
	AI_Output(self,other, " DIA_LemarGuard_Hallo_01_03 " );	// Hehe! I think you must remember me too.
	Info_ClearChoices(dia_lemarguard_hallo);
	Info_AddChoice(dia_lemarguard_hallo, " I'm sorry I don't know you. " ,dia_lemarguard_hallo_no);
	Info_AddChoice(dia_lemarguard_hallo, " How could I forget your face! " ,dia_lemarguard_hallo_yes);
};

func void day_lemarguard_hallo_no()
{
	AI_Output(other,self, " DIA_LemarGuard_Hallo_No_01_00 " );	// No, I don't know you.
	AI_Output(self,other, " DIA_LemarGuard_Hallo_No_01_01 " );	// Hmmm... Strange! I have a good memory, and you have one of those faces.
	AI_Output(self,other, " DIA_LemarGuard_Hallo_No_01_03 " );	// Okay, whatever! I just want to give you advice - stay away from Lemar. He doesn't like being bothered about trifles.
	AI_Output(self,other, " DIA_LemarGuard_Hallo_No_01_04 " );	// Give him shit and die? We good?
	AI_Output(other,self,"DIA_LemarGuard_Hallo_No_01_05");	//Good.
	AI_StopProcessInfos(self);
};

func void dia_lemarguard_hallo_yes()
{
	self.name[ 0 ] = " Scar, Lemar's bodyguard " ;
	SCARKNOWS = TRUE;
	AI_Output(other,self, " DIA_LemarGuard_Hallo_Yes_01_00 " );	// How could I forget your face! Scar!
	AI_Output(self,other, " DIA_LemarGuard_Hallo_Yes_01_01 " );	// Hehe... I see you recognize me too.
	AI_Output(other,self, " DIA_LemarGuard_Hallo_Yes_01_02 " );	// What are you doing here?
	AI_Output(self,other, " DIA_LemarGuard_Hallo_Yes_01_03 " );	// Lemar hired me as a bodyguard.
	AI_Output(self,other, " DIA_LemarGuard_Hallo_Yes_01_04 " );	// I want to give you advice - stay away from him. He doesn't like being bothered about trifles.
	AI_Output(self,other, " DIA_LemarGuard_Hallo_Yes_01_05 " );	// Give him shit and die? We good?
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_06");	//Good.
	AI_StopProcessInfos(self);
};


instance DIA_LEMARGUARD_HALLOEN(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 1;
	condition = dia_lemarguard_halloen_condition;
	information = dia_lemarguard_halloen_info;
	permanent = TRUE;
	description = " How do you like your job? " ;
};

func int dia_lemarguard_halloen_condition()
{
	return TRUE;
};

func void dia_lemarguard_halloen_info()
{
	AI_Output(other,self, " DIA_LemarGuard_HalloEN_01_00 " );	// Well, how do you like your job?
	AI_Output(self,other, " DIA_LemarGuard_HalloEN_01_01 " );	// Get lost while you're still alive.
	AI_StopProcessInfos(self);
};
