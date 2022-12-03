

instance DIA_GOMEZWORKERSOUL_9_EXIT(C_Info)
{
	npc = gomezworkersoul_9;
	nr = 999;
	condition = dia_gomezworkersoul_9_exit_condition;
	information = dia_gomezworkersoul_9_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_9_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_9_HELLO (C_Info)
{
	npc = gomezworkersoul_9;
	nr = 1;
	condition = dia_gomezworkersoul_9_hallo_condition;
	information = dia_gomezworkersoul_9_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_9_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_9 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_9_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_9_HALLO_01_00 " );	// (dead voice) WHAT ARE YOU LOOKING FOR HERE? IS THE DEAD ANSWER TO THE LIVING?
	AI_Output(other,self, " DIA_GomezWorkerSoul_9_HALLO_01_01 " );	// No. But the dead are responsible to the dead.
	AI_Output(self,other, " DIA_GomezWorkerSoul_9_HALLO_01_02 " );	// WHAT ARE YOU TALKING ABOUT, MORTAL?
	AI_Output(other,self, " DIA_GomezWorkerSoul_9_HALLO_01_03 " );	// The soul of former ore baron Gomez is accountable to you, ghost.
	AI_Output(other,self, " DIA_GomezWorkerSoul_9_HALLO_01_04 " );	// And this answer implies your release.
	AI_Output(other,self, " DIA_GomezWorkerSoul_9_HALLO_01_05 " );	// True, only if you grant his soul your forgiveness.
	Info_ClearChoices(dia_gomezworkersoul_9_hallo);
	Info_AddChoice(dia_gomezworkersoul_9_hallo, " So you give him your forgiveness? " ,dia_gomezworkersoul_9_hallo_end);
};

func void dia_gomezworkersoul_9_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_9_HALLO_End_01_01 " );	// So you give him your forgiveness?
	AI_Output(self,other, " DIA_GomezWorkerSoul_9_HALLO_End_01_02 " );	// All right, mortal. If it grants me freedom, I forgive Gomez's soul...
	AI_Output(other,self, " DIA_GomezWorkerSoul_9_HALLO_End_01_03 " );	// Great! Then I will make sure that your soul no longer suffers terrible suffering and finds peace.
	AI_Output(self,other, " DIA_GomezWorkerSoul_9_HALLO_End_01_04 " );	// Arghhh...
	GOMEZSOULTALK_9 = TRUE;
	AI_StopProcessInfos(self);
};

