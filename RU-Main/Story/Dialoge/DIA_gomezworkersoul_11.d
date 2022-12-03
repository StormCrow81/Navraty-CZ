
instance DIA_GOMEZWORKERSOUL_111_EXIT(C_Info)
{
	npc = gomezworkersoul_11;
	nr = 999;
	condition = dia_gomezworkersoul_11_exit_condition;
	information = dia_gomezworkersoul_11_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_11_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_11_HELLO (C_Info)
{
	npc = gomezworkersoul_11;
	nr = 1;
	condition = dia_gomezworkersoul_11_hallo_condition;
	information = dia_gomezworkersoul_11_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_11_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_11 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_11_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_00 " );	// (dead voice) WHAT DOES A MORTAL LIKE YOU NEED HERE?
	AI_Output(other,self, " DIA_GomezWorkerSoul_11_HALLO_01_01 " );	// This is needed, rather, not for me, but for you, ghost!
	AI_Output(other,self, " DIA_GomezWorkerSoul_11_HALLO_01_02 " );	// You long for someone to lift the curse from you and put your soul to rest. I'm right?
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_03 " );	// DO YOU REALLY WANT TO FREE ME? Arghhh...
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_04 " );	// Then I won't bother you. Do what you think!
	AI_Output(other,self, " DIA_GomezWorkerSoul_11_HALLO_01_05 " );	// Not so fast! First, do something for me.
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_06 " );	// What do you want?
	AI_Output(other,self, " DIA_GomezWorkerSoul_11_HALLO_01_07 " );	// All I'm asking you to do is grant your forgiveness to Gomez.
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_09 " );	// Gomez?! Hmmm... (dead breath) I remember that name.
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_10 " );	// Even now, when I'm already dead, it fills me with horror and fear!
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_11 " );	// And it seems to me that people like Gomez have no forgiveness in this world.
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_01_13 " );	// But I can no longer endure this suffering.
	Info_ClearChoices(dia_gomezworkersoul_11_hallo);
	Info_AddChoice(dia_gomezworkersoul_11_hallo, " Does this mean he is forgiven by you? " ,dia_gomezworkersoul_11_hallo_end);
};

func void dia_gomezworkersoul_11_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_11_HALLO_End_01_01 " );	// Does this mean that he is forgiven by you?
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_End_01_02 " );	// Yes... His soul is forgiven by me.
	AI_Output(self,other, " DIA_GomezWorkerSoul_11_HALLO_End_01_03 " );	// Now help me break my curse! Arghhh...
	GOMEZSOULTALK_11 = TRUE;
	AI_StopProcessInfos(self);
};
