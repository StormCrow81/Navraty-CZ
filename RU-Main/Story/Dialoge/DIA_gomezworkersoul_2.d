

instance DIA_GOMEZWORKERSOUL_2_EXIT(C_Info)
{
	npc = gomezworkersoul_2;
	nr = 999;
	condition = dia_gomezworkersoul_2_exit_condition;
	information = dia_gomezworkersoul_2_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_2_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_2_HELLO (C_Info)
{
	npc = gomezworkersoul_2;
	nr = 1;
	condition = dia_gomezworkersoul_2_hallo_condition;
	information = dia_gomezworkersoul_2_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_2_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_2 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_2_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_00 " );	// (dead voice) DEATH, WHY DO YOU TROUBLE THE DAMNED SOUL?!
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_01_01 " );	// To save her from this curse. Soon your suffering will end!
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_04 " );	// Arghhh... Finally, how long have I been waiting for this!
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_01_05 " );	// However, before I release your soul, you will need to help me.
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_06 " );	// What do you need?
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_01_07 " );	// To give your forgiveness to one of the damned souls.
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_08 " );	// Whose soul should I forgive?
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_01_09 " );	// The soul of Gomez, the ore baron you once worked for.
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_10 " );	// (dead sigh) AND THE SOUL OF THE ONE BECAUSE OF WHOM I WAS CURSED BY THE GODS...
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_11 " );	// DO YOU THINK YOU'RE ASKING TOO MUCH, MORTAL?
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_01_12 " );	// Not much, considering your own freedom is at stake.
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_01_13 " );	// Or do you want to remain a cursed ghost?
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_01_14 " );	// Arghhh! No, not that... These sufferings are unbearable...
	Info_ClearChoices(dia_gomezworkersoul_2_hallo);
	Info_AddChoice(dia_gomezworkersoul_2_hallo, " Then just give Gomez your forgiveness. " ,dia_gomezworkersoul_2_hallo_end);
};

func void dia_gomezworkersoul_2_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_End_01_01 " );	// Then just give Gomez your forgiveness and your suffering will end immediately.
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_End_01_02 " );	// All right, mortal... it will be your way!
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_End_01_03 " );	// Does this mean Gomez is forgiven?
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_End_01_04 " );	// Yes... I agree.
	AI_Output(other,self, " DIA_GomezWorkerSoul_2_HALLO_End_01_05 " );	// Good! Now I can take care of your soul too, ghost. Die in peace!
	AI_Output(self,other, " DIA_GomezWorkerSoul_2_HALLO_End_01_06 " );	// Finally! Arghhh...
	GOMEZSOULTALK_2 = TRUE;
	AI_StopProcessInfos(self);
};

