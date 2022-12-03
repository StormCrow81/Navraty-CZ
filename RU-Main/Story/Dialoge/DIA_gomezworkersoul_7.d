

instance DIA_GOMEZWORKERSOUL_7_EXIT(C_Info)
{
	npc = gomezworkersoul_7;
	nr = 999;
	condition = dia_gomezworkersoul_7_exit_condition;
	information = dia_gomezworkersoul_7_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_7_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_7_HELLO (C_Info)
{
	npc = gomezworkersoul_7;
	nr = 1;
	condition = dia_gomezworkersoul_7_hallo_condition;
	information = dia_gomezworkersoul_7_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_7_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_7 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_7_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_7_HALLO_01_00 " );	// (dead voice) WHAT BRING YOU HERE, MORTAL? WHY DO YOU TROUBLE THE REST OF THE DEAD?
	AI_Output(other,self, " DIA_GomezWorkerSoul_7_HALLO_01_01 " );	// Gomez sent me here.
	AI_Output(self,other, " DIA_GomezWorkerSoul_7_HALLO_01_02 " );	// Curse?! Arghhh!.. What does he want from me?
	AI_Output(other,self, " DIA_GomezWorkerSoul_7_HALLO_01_03 " );	// For you to forgive him. In exchange, I will lift his curse from you.
	Info_ClearChoices(dia_gomezworkersoul_7_hallo);
	Info_AddChoice(dia_gomezworkersoul_7_hallo, " Will you forgive Gomez? " ,dia_gomezworkersoul_7_hallo_end);
};

func void dia_gomezworkersoul_7_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_7_HALLO_End_01_01 " );	// Will you give your forgiveness to Gomez?
	AI_Output(self,other, " DIA_GomezWorkerSoul_7_HALLO_End_01_02 " );	// Whoever cursed me will receive my forgiveness...
	AI_Output(other,self, " DIA_GomezWorkerSoul_7_HALLO_End_01_03 " );	// Good. Now your soul will finally find the long-awaited peace.
	AI_Output(self,other, " DIA_GomezWorkerSoul_7_HALLO_End_01_04 " );	// Arghhh...
	GOMEZSOULTALK_7 = TRUE;
	AI_StopProcessInfos(self);
};

