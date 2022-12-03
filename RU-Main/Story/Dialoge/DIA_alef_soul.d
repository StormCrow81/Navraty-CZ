

instance DIA_ALEF_SOUL_EXIT(C_Info)
{
	npc = alef_soul;
	nr = 999;
	condition = dia_alef_soul_exit_condition;
	information = dia_alef_soul_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_alef_soul_exit_condition()
{
	return TRUE;
};

func void dia_alef_soul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALEF_SOUL_HELLO (C_Info)
{
	npc = alef_soul;
	nr = 1;
	condition = dia_alef_soul_hallo_condition;
	information = dia_alef_soul_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alef_soul_hallo_condition()
{
	if((TALKTOALEF == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_alef_soul_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_00 " );	// (dead voice) Why did you disturb the soul of the deceased, mortal? What do you need?
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_01 " );	// I need to know something, ghost.
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_02 " );	// The dead are not responsible to the living... You won't learn anything from me!
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_03 " );	// You will have to answer my questions - otherwise you will suffer a terrible disappointment. And you guess what!
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_04 " );	// Aarggghh! Ask your questions.
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_06 " );	// It seems that in life you were called Aleph and you were a miner in an old mine?
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_07 " );	// Yes... it's me.
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_08 " );	// Then you should remember your buddies Snipes and Viper. Do you remember them?
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_10 " );	// Once upon a time, the three of you were extremely lucky: you became the owners of a large cargo of magic ore, which was supposed to be taken to the Old Camp.
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_11 " );	// You decided to hide this ore for better times, and it was you who went to the cave to dig the ore. And at that moment, the Barrier collapsed.
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_14 " );	// Yes... but how do you know that?
	AI_Output(other,self, " DIA_Alef_Soul_HALLO_01_15 " );	// It doesn't matter now. Answer my last question: where did you hide this ore?
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_16 " );	// ...look for a bridge over the river... there is a cave nearby, there is water all around - there inside is what you are looking for...
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_17");	//Ааргггг!!!
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_20 " );	// Time's up, mortal! No more magic spells have power over me!
	AI_Output(self,other, " DIA_Alef_Soul_HALLO_01_22 " );	// And now you're going to die for disturbing me!
	TALKTOALEF = TRUE;
	B_LogEntry( TOPIC_VIPERNUGGETS , " Xardas summoned the soul of Aleph. The soul was not happy to be disturbed, but still answered my questions about the missing ore. According to her, the ore is located in a cave near the bridge. The cave is barely visible, since the entrance to It was flooded with water. I could not figure out the exact location, because time had expired. " );
	Info_ClearChoices(dia_alef_soul_hallo);
	Info_AddChoice(dia_alef_soul_hallo, " We'll see about that! " ,dia_alef_soul_hallo_end);
};

func void dia_alef_soul_hallo_end()
{
	AI_Output(other,self, " DIA_Alef_Soul_Hallo_End_01_00 " );	// We'll see about that!
	AI_Output(self,other, " DIA_Alef_Soul_Hallo_End_01_01 " );	// Aarrghh!!! Die, mortal!
	self.flags = NPC_FLAG_NONE;
	AI_StopProcessInfos(self);
};

