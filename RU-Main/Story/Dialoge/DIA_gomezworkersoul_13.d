

instance DIA_GOMEZWORKERSOUL_133_EXIT(C_Info)
{
	npc = gomezworkersoul_13;
	nr = 999;
	condition = dia_gomezworkersoul_13_exit_condition;
	information = dia_gomezworkersoul_13_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_13_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_13_HELLO (C_Info)
{
	npc = gomezworkersoul_13;
	nr = 1;
	condition = dia_gomezworkersoul_13_hallo_condition;
	information = dia_gomezworkersoul_13_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_13_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_13 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_13_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_13_HALLO_01_00 " );	// WHO ARE YOU, HUMAN? YOU DON'T LOOK LIKE DEAD.
	AI_Output(other,self, " DIA_GomezWorkerSoul_13_HALLO_01_01 " );	// You're right, ghost. Unlike you, I'm alive.
	AI_Output(self,other, " DIA_GomezWorkerSoul_13_HALLO_01_02 " );	// THEN WHAT ARE YOU DOING HERE?
	AI_Output(other,self, " DIA_GomezWorkerSoul_13_HALLO_01_05 " );	// I want to help your soul find the long-awaited peace.
	AI_Output(self,other, " DIA_GomezWorkerSoul_13_HALLO_01_06 " );	// IS THIS WHAT YOU CAME FOR? Arghhh!
	AI_Output(other,self, " DIA_GomezWorkerSoul_13_HALLO_01_07 " );	// Not only. I also need you to do something for me.
	AI_Output(self,other, " DIA_GomezWorkerSoul_13_HALLO_01_08 " );	// And what do you want me to do, human?
	AI_Output(other,self, " DIA_GomezWorkerSoul_13_HALLO_01_09 " );	// You must give your forgiveness to Gomez's soul.
	AI_Output(self,other, " DIA_GomezWorkerSoul_13_HALLO_01_10 " );	// GOMEZ?! (dead sigh) If you're asking that, the ore baron must have suffered the same curse as the rest of us.
	Info_ClearChoices(dia_gomezworkersoul_13_hallo);
	Info_AddChoice(dia_gomezworkersoul_13_hallo, " Do you accept my offer? " ,dia_gomezworkersoul_13_hallo_end);
};

func void dia_gomezworkersoul_13_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_13_HALLO_End_01_01 " );	// Do you accept my offer?
	AI_Output(self,other, " DIA_GomezWorkerSoul_13_HALLO_End_01_02 " );	// Arghhh... Okay, I accept your offer. He is forgiven by me.
	AI_Output(other,self, " DIA_GomezWorkerSoul_13_HALLO_End_01_03 " );	// Great! Now it's time to take care of your soul.
	GOMEZSOULTALK_13 = TRUE;
	AI_StopProcessInfos(self);
};

