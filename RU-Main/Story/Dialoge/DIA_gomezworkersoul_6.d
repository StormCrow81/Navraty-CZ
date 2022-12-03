

instance DIA_GOMEZWORKERSOUL_6_EXIT(C_Info)
{
	npc = gomezworkersoul_6;
	nr = 999;
	condition = dia_gomezworkersoul_6_exit_condition;
	information = dia_gomezworkersoul_6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_6_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_6_HELLO (C_Info)
{
	npc = gomezworkersoul_6;
	nr = 1;
	condition = dia_gomezworkersoul_6_hallo_condition;
	information = dia_gomezworkersoul_6_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_6_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_6 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_6_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_6_HALLO_01_00 " );	// (dead voice) WHO IS TROUBLE ME?
	AI_Output(other,self, " DIA_GomezWorkerSoul_6_HALLO_01_01 " );	// I want to help you.
	AI_Output(self,other, " DIA_GomezWorkerSoul_6_HALLO_01_02 " );	// HA HA HA! HOW CAN YOU HELP ME, MORTAL? NO ONE CAN HELP ME!
	AI_Output(other,self, " DIA_GomezWorkerSoul_6_HALLO_01_03 " );	// And I'll help! But this is only possible under one condition...
	AI_Output(self,other, " DIA_GomezWorkerSoul_6_HALLO_01_04 " );	// WHAT IS THIS CONDITION?
	AI_Output(other,self, " DIA_GomezWorkerSoul_6_HALLO_01_05 " );	// You will give your forgiveness to the soul of the person who cursed you. Namely, the ore baron Gomez.
	AI_Output(other,self, " DIA_GomezWorkerSoul_6_HALLO_01_06 " );	// Only then will I be able to remove your curse from you!
	AI_Output(self,other, " DIA_GomezWorkerSoul_6_HALLO_01_08 " );	// I'm tired of excruciating pain and terrible suffering and will do anything to get rid of them forever.
	Info_ClearChoices(dia_gomezworkersoul_6_hallo);
	Info_AddChoice(dia_gomezworkersoul_6_hallo, " So you agree to give him your forgiveness? " ,dia_gomezworkersoul_6_hallo_end);
};

func void dia_gomezworkersoul_6_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_6_HALLO_End_01_01 " );	// So you agree to give him your forgiveness?
	AI_Output(self,other, " DIA_GomezWorkerSoul_6_HALLO_End_01_02 " );	// I agree, mortal... Gomez will be forgiven!
	AI_Output(other,self, " DIA_GomezWorkerSoul_6_HALLO_End_01_03 " );	// Well, then all that's left is to put your soul to rest, ghost.
	GOMEZSOULTALK_6 = TRUE;
	AI_StopProcessInfos(self);
};

