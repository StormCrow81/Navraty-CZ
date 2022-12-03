

instance DIA_GOMEZWORKERSOUL_155_EXIT(C_Info)
{
	npc = gomezworkersoul_15;
	nr = 999;
	condition = dia_gomezworkersoul_15_exit_condition;
	information = dia_gomezworkersoul_15_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_15_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_15_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_15_HELLO (C_Info)
{
	npc = gomezworkersoul_15;
	nr = 1;
	condition = dia_gomezworkersoul_15_hallo_condition;
	information = dia_gomezworkersoul_15_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_15_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_15 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_15_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_15_HALLO_01_00 " );	// (dead voice) YOU SHOULD NOT HAVE COME HERE, HUMAN... ONLY DEATH WAITS FOR YOU HERE!
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_01_01 " );	// But I don't think so! Rather, death awaits you.
	AI_Output(self,other, " DIA_GomezWorkerSoul_15_HALLO_01_02 " );	// HA HA HA... I'M DAMNED AND NO ONE CAN HELP ME!
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_01_04 " );	// Wrong! This is exactly what I came here for. I'll help you, ghost!
	AI_Output(self,other, " DIA_GomezWorkerSoul_15_HALLO_01_05 " );	// Arghhh!.. ARE YOU TELLING THE TRUTH, HUMAN?
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_01_06 " );	// Yes, but first you have to do me one small favor.
	AI_Output(self,other, " DIA_GomezWorkerSoul_15_HALLO_01_07 " );	// I'm listening to you, mortal...
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_01_08 " );	// I need you to give your forgiveness to one damned soul. It used to belong to a man named Gomez.
	AI_Output(self,other, " DIA_GomezWorkerSoul_15_HALLO_01_09 " );	// Ore Baron?!
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_01_10 " );	// He is the best. Just grant him what I ask of you, and I will release your soul from the shackles of your curse.
	Info_ClearChoices(dia_gomezworkersoul_15_hallo);
	Info_AddChoice(dia_gomezworkersoul_15_hallo, " So you give him your forgiveness? " ,dia_gomezworkersoul_15_hallo_end);
};

func void dia_gomezworkersoul_15_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_End_01_01 " );	// So you give him your forgiveness?
	AI_Output(self,other, " DIA_GomezWorkerSoul_15_HALLO_End_01_02 " );	// Okay... Gomez will get what he wants.
	AI_Output(other,self, " DIA_GomezWorkerSoul_15_HALLO_End_01_03 " );	// Great! Now prepare to die, ghost. Your freedom is just around the corner!
	GOMEZSOULTALK_15 = TRUE;
	AI_StopProcessInfos(self);
};

