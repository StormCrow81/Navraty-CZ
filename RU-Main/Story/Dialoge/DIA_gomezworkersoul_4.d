

instance DIA_GOMEZWORKERSOUL_4_EXIT(C_Info)
{
	npc = gomezworkersoul_4;
	nr = 999;
	condition = dia_gomezworkersoul_4_exit_condition;
	information = dia_gomezworkersoul_4_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_4_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_4_HELLO (C_Info)
{
	npc = gomezworkersoul_4;
	nr = 1;
	condition = dia_gomezworkersoul_4_hallo_condition;
	information = dia_gomezworkersoul_4_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_4_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_4 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_4_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_4_HALLO_01_00 " );	// (dead voice) WHY DID YOU BREAK MY PRIVACY, MORTAL?
	AI_Output(other,self, " DIA_GomezWorkerSoul_4_HALLO_01_01 " );	// I came here on behalf of Gomez. He wants me to help you break his curse.
	AI_Output(self,other, " DIA_GomezWorkerSoul_4_HALLO_01_02 " );	// You came on behalf of Gomez?! Arghhh...
	AI_Output(other,self, " DIA_GomezWorkerSoul_4_HALLO_01_06 " );	// Look, if you help me, I'll help you. Well, do you agree?
	AI_Output(self,other, " DIA_GomezWorkerSoul_4_HALLO_01_07 " );	// I agree to everything, just to find peace...
	Info_ClearChoices(dia_gomezworkersoul_4_hallo);
	Info_AddChoice(dia_gomezworkersoul_4_hallo, " So you forgive Gomez? " ,dia_gomezworkersoul_4_hallo_end);
};

func void dia_gomezworkersoul_4_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_4_HALLO_End_01_01 " );	// So you forgive Gomez?
	AI_Output(self,other, " DIA_GomezWorkerSoul_4_HALLO_End_01_02 " );	// He who curses is forgiven!.. Is that enough?
	AI_Output(other,self, " DIA_GomezWorkerSoul_4_HALLO_End_01_03 " );	// Quite. Now I will help you, ghost - as promised.
	AI_Output(self,other, " DIA_GomezWorkerSoul_4_HALLO_End_01_04 " );	// Arghhh... Hurry, calm my soul!
	GOMEZSOULTALK_4 = TRUE;
	AI_StopProcessInfos(self);
};

