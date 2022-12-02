

instance DAY_LUIS_EXIT (C_Info)
{
	npc = vlk_6109_luis;
	nr = 999;
	condition = dia_luis_exit_condition;
	information = dia_luis_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_luis_exit_condition()
{
	return TRUE;
};

func void luis_day_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_LUIS_PICKPOCKET (C_Info)
{
	npc = vlk_6109_luis;
	nr = 900;
	condition = dia_luis_pickpocket_condition;
	information = dia_luis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_luis_pickpocket_condition()
{
	return  C_Robbery ( 30 , 28 );
};

func void dia_luis_pickpocket_info()
{
	Info_ClearChoices(dia_luis_pickpocket);
	Info_AddChoice(dia_luis_pickpocket, Dialog_Back, dia_luis_pickpocket_back);
	Info_AddChoice(dia_luis_pickpocket, DIALOG_PICKPOCKET ,dia_luis_pickpocket_doit);
};

func void dia_luis_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_luis_pickpocket);
};

func void dia_luis_pickpocket_back()
{
	Info_ClearChoices(dia_luis_pickpocket);
};


instances DIA_LUIS_HALLO (C_Info)
{
	npc = vlk_6109_luis;
	nr = 2;
	condition = dia_luis_hallo_condition;
	information = dia_luis_hallo_info;
	permanent = FALSE;
	description = " Is that you Louis? " ;
};


func int luis_day_hallo_condition()
{
	if(MIS_KILLTARGET1 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_luis_hello_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Luis_Hallo_01_00 " );	// Is that you Louis?
	AI_Output(self,other, " DIA_Luis_Hallo_01_01 " );	// Yes, I am. What do you have to do with me?
	AI_Output(other,self, " DIA_Luis_Hallo_01_03 " );	// They say that you talk too much about things that you should be silent about.
	AI_Output(other,self, " DIA_Luis_Hallo_01_04 " );	// Some people really don't like it.
	AI_Output(self,other, " DIA_Luis_Hallo_01_05 " );	// (indignantly) WHAT?! You know, if someone does not like something, then this is their personal problem!
	AI_Output(self,other, " DIA_Luis_Hallo_01_06 " );	// And I will say what I want!
	AI_Output(other,self, " DIA_Luis_Hallo_01_07 " );	// I see you didn't understand what I told you!
	AI_Output(self,other, " DIA_Luis_Hallo_01_08 " );	// Yes? And what will you do?
	AI_Output(other,self, " DIA_Luis_Hallo_01_09 " );	// I'll just slit your throat right now to shut you up once and for all.
	AI_Output(self,other, " DIA_Luis_Hallo_01_10 " );	// WHAT?! Are you serious?!
	AI_ReadyMeleeWeapon(other);
	AI_Output(self,other, " DIA_Luis_Hallo_01_12 " );	// Oh god! Yes, you're crazy!
	AI_Output(self,other, " DIA_Luis_Hallo_01_13 " );	// Guard! Help someone... (in a panic) They want to kill me!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

