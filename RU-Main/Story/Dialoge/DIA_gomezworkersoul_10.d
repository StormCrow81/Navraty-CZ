

instance DIA_GOMEZWORKERSOUL_100_EXIT(C_Info)
{
	npc = gomezworkersoul_10;
	nr = 999;
	condition = dia_gomezworkersoul_10_exit_condition;
	information = dia_gomezworkersoul_10_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_10_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_10_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_10_HELLO (C_Info)
{
	npc = gomezworkersoul_10;
	nr = 1;
	condition = dia_gomezworkersoul_10_hallo_condition;
	information = dia_gomezworkersoul_10_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_10_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_10 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_10_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_10_HALLO_01_00 " );	// (dead voice) HUMAN? WHY HAVE YOU COME HERE?
	AI_Output(other,self, " DIA_GomezWorkerSoul_10_HALLO_01_01 " );	// I'm here on behalf of Gomez to put your soul to rest forever.
	AI_Output(self,other, " DIA_GomezWorkerSoul_10_HALLO_01_02 " );	// Arghhh...
	AI_Output(other,self, " DIA_GomezWorkerSoul_10_HALLO_01_05 " );	// But before I release your soul from the curse, I need you to grant your forgiveness to the Ore Baron's soul.
	AI_Output(self,other, " DIA_GomezWorkerSoul_10_HALLO_01_08 " );	// Ha ha ha...
	AI_Output(self,other, " DIA_GomezWorkerSoul_10_HALLO_01_09 " );	// So, this Gomez still paid for his atrocities and his soul was also cursed by the gods.
	Info_ClearChoices(dia_gomezworkersoul_10_hallo);
	Info_AddChoice(dia_gomezworkersoul_10_hallo, " So will you give him this forgiveness? " ,dia_gomezworkersoul_10_hallo_end);
};

func void dia_gomezworkersoul_10_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_10_HALLO_End_01_01 " );	// So will you give him this forgiveness?
	AI_Output(self,other, " DIA_GomezWorkerSoul_10_HALLO_End_01_02 " );	// Good... Consider him forgiven.
	AI_Output(self,other, " DIA_GomezWorkerSoul_10_HALLO_End_01_03 " );	// And now - free my soul! Arghhh...
	GOMEZSOULTALK_10 = TRUE;
	AI_StopProcessInfos(self);
};

