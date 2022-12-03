

instance DIA_GOMEZWORKERSOUL_144_EXIT(C_Info)
{
	npc = gomezworkersoul_14;
	nr = 999;
	condition = dia_gomezworkersoul_14_exit_condition;
	information = dia_gomezworkersoul_14_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_14_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_14_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_14_HELLO (C_Info)
{
	npc = gomezworkersoul_14;
	nr = 1;
	condition = dia_gomezworkersoul_14_hallo_condition;
	information = dia_gomezworkersoul_14_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_14_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_14 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_14_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_14_HALLO_01_00 " );	// (dead voice) DEATH, WHY DO YOU TROUBLE ME? DO THE LIVES CARE FOR THE DEAD?
	AI_Output(other,self, " DIA_GomezWorkerSoul_14_HALLO_01_03 " );	// I came here to free your soul from the curse placed on you.
	AI_Output(other,self, " DIA_GomezWorkerSoul_14_HALLO_01_07 " );	// Just before I help you, you will also need to help me with one simple matter.
	AI_Output(self,other, " DIA_GomezWorkerSoul_14_HALLO_01_08 " );	// HOW CAN I HELP YOU, MORTAL?
	AI_Output(other,self, " DIA_GomezWorkerSoul_14_HALLO_01_09 " );	// Just give your forgiveness to one restless soul, that's all.
	AI_Output(self,other, " DIA_GomezWorkerSoul_14_HALLO_01_10 " );	// TO WHOSE SOUL SHOULD I GIVE FORGIVENESS?
	AI_Output(other,self, " DIA_GomezWorkerSoul_14_HALLO_01_11 " );	// The soul of the ore baron Gomez. This is the only thing that is required of you in order to gain the long-awaited freedom.
	Info_ClearChoices(dia_gomezworkersoul_14_hallo);
	Info_AddChoice(dia_gomezworkersoul_14_hallo, " Do you agree to these terms? " ,dia_gomezworkersoul_14_hallo_end);
};

func void dia_gomezworkersoul_14_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_14_HALLO_End_01_01 " );	// Do you agree to these terms?
	AI_Output(self,other, " DIA_GomezWorkerSoul_14_HALLO_End_01_02 " );	// Yes, I agree... He will receive my forgiveness in exchange for my release.
	AI_Output(other,self, " DIA_GomezWorkerSoul_14_HALLO_End_01_03 " );	// Good! Then prepare to find your eternal rest, ghost.
	GOMEZSOULTALK_14 = TRUE;
	AI_StopProcessInfos(self);
};

