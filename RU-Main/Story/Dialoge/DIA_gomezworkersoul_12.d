

instance DIA_GOMEZWORKERSOUL_122_EXIT(C_Info)
{
	npc = gomezworkersoul_12;
	nr = 999;
	condition = dia_gomezworkersoul_12_exit_condition;
	information = dia_gomezworkersoul_12_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_12_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_12_HELLO (C_Info)
{
	npc = gomezworkersoul_12;
	nr = 1;
	condition = dia_gomezworkersoul_12_hallo_condition;
	information = dia_gomezworkersoul_12_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_12_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_12 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_12_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_12_HALLO_01_00 " );	// (dead voice) WHY DO YOU ALARM THE DEAD, HUMAN? WHAT DO YOU NEED?
	AI_Output(other,self, " DIA_GomezWorkerSoul_12_HALLO_01_02 " );	// I'll help you put your damned soul to rest. Is that what you want?
	AI_Output(self,other, " DIA_GomezWorkerSoul_12_HALLO_01_03 " );	// You're smart, man. For this I am ready to give all the little that I have.
	AI_Output(other,self, " DIA_GomezWorkerSoul_12_HALLO_01_04 " );	// I don't need anything from you, except for your forgiveness to a soul as damned as you.
	AI_Output(self,other, " DIA_GomezWorkerSoul_12_HALLO_01_05 " );	// Whose soul needs my forgiveness?
	AI_Output(other,self, " DIA_GomezWorkerSoul_12_HALLO_01_06 " );	// Soul of Ore Baron Gomez! I think you should be familiar with this name.
	AI_Output(self,other, " DIA_GomezWorkerSoul_12_HALLO_01_07 " );	// It's familiar to everyone here, human... (dead breath) This name will never be forgotten!
	AI_Output(other,self, " DIA_GomezWorkerSoul_12_HALLO_01_10 " );	// This is the price of your freedom, ghost.
	Info_ClearChoices(dia_gomezworkersoul_12_hallo);
	Info_AddChoice(dia_gomezworkersoul_12_hallo, " So you forgive his soul? " ,dia_gomezworkersoul_12_hallo_end);
};

func void dia_gomezworkersoul_12_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_12_HALLO_End_01_01 " );	// So you forgive his soul?
	AI_Output(self,other, " DIA_GomezWorkerSoul_12_HALLO_End_01_02 " );	// Yes... His soul will receive my forgiveness.
	AI_Output(other,self, " DIA_GomezWorkerSoul_12_HALLO_End_01_03 " );	// That's all I needed from you.
	AI_Output(self,other, " DIA_GomezWorkerSoul_12_HALLO_End_01_04 " );	// Arghhh... Now release me!
	GOMEZSOULTALK_12 = TRUE;
	AI_StopProcessInfos(self);
};

