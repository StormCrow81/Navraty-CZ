

instance DIA_GOMEZWORKERSOUL_5_EXIT(C_Info)
{
	npc = gomezworkersoul_5;
	nr = 999;
	condition = dia_gomezworkersoul_5_exit_condition;
	information = dia_gomezworkersoul_5_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_5_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_5_HELLO (C_Info)
{
	npc = gomezworkersoul_5;
	nr = 1;
	condition = dia_gomezworkersoul_5_hallo_condition;
	information = dia_gomezworkersoul_5_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_5_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_5 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_5_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_5_HALLO_01_00 " );	// (dead voice) WHO ARE YOU, HUMAN? AND WHAT DO YOU NEED?
	AI_Output(other,self, " DIA_GomezWorkerSoul_5_HALLO_01_01 " );	// Gomez wants your forgiveness for cursing you.
	AI_Output(other,self, " DIA_GomezWorkerSoul_5_HALLO_01_02 " );	// In exchange, I'll help you break your curse.
	AI_Output(self,other, " DIA_GomezWorkerSoul_5_HALLO_01_05 " );	// Hmmm... I need time to think, mortal, whether it's the right thing for me to do by giving him my forgiveness.
	Info_ClearChoices(dia_gomezworkersoul_5_hallo);
	Info_AddChoice(dia_gomezworkersoul_5_hallo, " I don't have much time, decide now! " ,dia_gomezworkersoul_5_hallo_end);
};

func void dia_gomezworkersoul_5_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_5_HALLO_End_01_01 " );	// I don't have much time, decide now!
	AI_Output(self,other, " DIA_GomezWorkerSoul_5_HALLO_End_01_02 " );	// All right, mortal. Consider Gomez got him... I grant him my forgiveness.
	AI_Output(other,self, " DIA_GomezWorkerSoul_5_HALLO_End_01_03 " );	// Okay, now let's deal with you, ghost. Soon your suffering will end!
	AI_Output(self,other, " DIA_GomezWorkerSoul_5_HALLO_End_01_04 " );	// Release me! Arghhh...
	GOMEZSOULTALK_5 = TRUE;
	AI_StopProcessInfos(self);
};

