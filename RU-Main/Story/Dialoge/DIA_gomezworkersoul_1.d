

instance DIA_GOMEZWORKERSOUL_1_EXIT(C_Info)
{
	npc = gomezworkersoul_1;
	nr = 999;
	condition = dia_gomezworkersoul_1_exit_condition;
	information = dia_gomezworkersoul_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_1_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_1_HELLO (C_Info)
{
	npc = gomezworkersoul_1;
	nr = 1;
	condition = dia_gomezworkersoul_1_hallo_condition;
	information = dia_gomezworkersoul_1_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_1_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_1 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_1_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_01_00 " );	// (dead voice) WHY DO YOU TROUBLE ME, HUMAN? WHAT DO YOU WANT FROM ME?
	AI_Output(other,self, " DIA_GomezWorkerSoul_1_HALLO_01_01 " );	// I came here on behalf of Gomez to put your soul to rest, ghost.
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_01_02 " );	// Have you come to set me free? Arghhh... Will my suffering come to an end?
	AI_Output(other,self, " DIA_GomezWorkerSoul_1_HALLO_01_04 " );	// Yes, but before I do that, Gomez wants you to grant forgiveness to his soul as well.
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_01_05 " );	// (dead breath) We're all damned here because of him!
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_01_06 " );	// And, apparently, his soul also does not know peace in this world.
	AI_Output(other,self, " DIA_GomezWorkerSoul_1_HALLO_01_07 " );	// You're absolutely right, ghost.
	Info_ClearChoices(dia_gomezworkersoul_1_hallo);
	Info_AddChoice(dia_gomezworkersoul_1_hallo, " So you give him your forgiveness? " ,dia_gomezworkersoul_1_hallo_end);
};

func void dia_gomezworkersoul_1_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_1_HALLO_End_01_01 " );	// So you give him your forgiveness?
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_End_01_02 " );	// Okay... (dead voice) I give him what he asks for.
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_End_01_03 " );	// Because I know what it means to be cursed.
	AI_Output(self,other, " DIA_GomezWorkerSoul_1_HALLO_End_01_04 " );	// And now, man, set me free! Arghhh...
	GOMEZSOULTALK_1 = TRUE;
	AI_StopProcessInfos(self);
};

