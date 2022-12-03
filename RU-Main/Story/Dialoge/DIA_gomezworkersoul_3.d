

instance DIA_GOMEZWORKERSOUL_3_EXIT(C_Info)
{
	npc = gomezworkersoul_3;
	nr = 999;
	condition = dia_gomezworkersoul_3_exit_condition;
	information = dia_gomezworkersoul_3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_3_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_3_HELLO (C_Info)
{
	npc = gomezworkersoul_3;
	nr = 1;
	condition = dia_gomezworkersoul_3_hallo_condition;
	information = dia_gomezworkersoul_3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_3_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_3 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_3_hello_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_GomezWorkerSoul_3_HALLO_01_00 " );	// (dead voice) DEATH?! WHAT BROUGHT YOU HERE?
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_01_01 " );	// I want to help you, ghost.
	AI_Output(self,other, " DIA_GomezWorkerSoul_3_HALLO_01_02 " );	// YOU CAN'T HELP ME, HUMAN...
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_01_03 " );	// You're wrong! But first, I need you to grant your forgiveness to the soul of Ore Baron Gomez.
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_01_08 " );	// Only then can I help you. Not earlier!
	AI_Output(self,other, " DIA_GomezWorkerSoul_3_HALLO_01_09 " );	// Do you want me to forgive the one who caused me to be cursed?!
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_01_10 " );	// Just do it and I'll help you get rid of your curse.
	AI_Output(self,other,"DIA_GomezWorkerSoul_3_HALLO_01_11");	//Хммм...(задумчиво)
	Info_ClearChoices(dia_gomezworkersoul_3_hallo);
	Info_AddChoice(dia_gomezworkersoul_3_hallo, " So you give your forgiveness to Gomez? " ,dia_gomezworkersoul_3_hallo_end);
};

func void dia_gomezworkersoul_3_hello_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_End_01_01 " );	// So you give your forgiveness to Gomez?
	AI_Output(self,other, " DIA_GomezWorkerSoul_3_HALLO_End_01_02 " );	// Okay...(dead voice) I forgive Gomez for everything he did to us.
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_End_01_03 " );	// You see? It wasn't difficult at all.
	AI_Output(other,self, " DIA_GomezWorkerSoul_3_HALLO_End_01_04 " );	// And now get ready to find the long-awaited peace.
	GOMEZSOULTALK_3 = TRUE;
	AI_StopProcessInfos(self);
};

