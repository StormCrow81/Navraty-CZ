

instance DIA_GOMEZWORKERSOUL_8_EXIT(C_Info)
{
	npc = gomezworkersoul_8;
	nr = 999;
	condition = dia_gomezworkersoul_8_exit_condition;
	information = dia_gomezworkersoul_8_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_8_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_8_HELLO (C_Info)
{
	npc = gomezworkersoul_8;
	nr = 1;
	condition = dia_gomezworkersoul_8_hallo_condition;
	information = dia_gomezworkersoul_8_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_8_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_8 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_8_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_8_HALLO_01_00 " );	// (dead voice) HUMAN, WHY ARE YOU HERE? IS YOUR PLACE AMONG THE DEAD?
	AI_Output(other,self, " DIA_GomezWorkerSoul_8_HALLO_01_02 " );	// One soul seeks your forgiveness, ghost, and I have come to receive it from you.
	AI_Output(self,other, " DIA_GomezWorkerSoul_8_HALLO_01_03 " );	// My forgiveness? Whom should I forgive and why?
	AI_Output(other,self, " DIA_GomezWorkerSoul_8_HALLO_01_04 " );	// The one who cursed you and doomed you to stay as undead.
	AI_Output(self,other, " DIA_GomezWorkerSoul_8_HALLO_01_05 " );	// I understand what you're talking about, mortal. But why should I forgive him?
	AI_Output(other,self, " DIA_GomezWorkerSoul_8_HALLO_01_06 " );	// Because that's the only way I can lift this curse from you!
	AI_Output(other,self, " DIA_GomezWorkerSoul_8_HALLO_01_07 " );	// And that's the only way to grant you freedom.
	Info_ClearChoices(dia_gomezworkersoul_8_hallo);
	Info_AddChoice(dia_gomezworkersoul_8_hello, " Ты согласен? " ,dia_gomezworkersoul_8_hello_end);
};

func void dia_gomezworkersoul_8_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_8_HALLO_End_01_01 " );	// Well, what do you say - do you agree?
	AI_Output(self,other, " DIA_GomezWorkerSoul_8_HALLO_End_01_02 " );	// Good. I grant him my forgiveness...
	AI_Output(other,self, " DIA_GomezWorkerSoul_8_HALLO_End_01_03 " );	// Great. And now I will kill you and put your soul at rest forever!
	GOMEZSOULTALK_8 = TRUE;
	AI_StopProcessInfos(self);
};

