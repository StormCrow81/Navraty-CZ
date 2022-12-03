

instance DIA_NONE_106_RODRIGUEZ_EXIT(C_Info)
{
	npc = none_106_rodriguez;
	nr = 999;
	condition = dia_none_106_rodriguez_exit_condition;
	information = dia_none_106_rodriguez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_none_106_rodriguez_exit_condition()
{
	return TRUE;
};

func void dia_none_106_rodriguez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_106_RODRIGUEZ_HALLO (C_Info)
{
	npc = none_106_rodriguez;
	nr = 1;
	condition = dia_none_106_rodriguez_hallo_condition;
	information = dia_none_106_rodriguez_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_none_106_rodriguez_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_none_106_rodriguez_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self, " DIA_NONE_106_Rodriguez_HALLO_01_00 " );	// Greetings, mage!
	AI_Output(self,other, " DIA_NONE_106_Rodriguez_HALLO_01_01 " );	// May Innos be with you... (dead voice) What do you want from me?
	AI_Output(other,self, " DIA_NONE_106_Rodriguez_HALLO_01_02 " );	// I need your help.
	AI_Output(self,other, " DIA_NONE_106_Rodriguez_HALLO_01_03 " );	// I'm afraid I can't help you...
	AI_Output(self,other, " DIA_NONE_106_Rodriguez_HALLO_01_04 " );	// You'd better go to Master Corristo. Perhaps he will listen to your request.
	AI_StopProcessInfos(self);
};

