

instance DIA_Draal_EXIT (C_Info)
{
	npc = STRF_1101_Draal;
	nr = 999;
	condition = DIA_Draal_EXIT_Condition;
	information = DIA_Draal_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Draal_EXIT_Condition()
{
	return TRUE;
};

func void SLIDE_Draw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Draal_DRAGON (C_Info)
{
	npc = STRF_1101_Draal;
	nr = 1;
	condition = DIA_Draal_DRAGON_Condition;
	information = DIA_Draal_DRAGON_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Draal_DRAGON_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void SLIDE_Draw_DRAGON_Info()
{
	AI_Output(self,other, " DIA_Draal_DRAGON_03_00 " );	// I was outside when the dragon attacked.
	AI_Output(self,other, " DIA_Draal_DRAGON_03_01 " );	// I saw him, he is more than 10 people - his fiery breath destroyed the huts in the blink of an eye!
	AI_Output(self,other, " DIA_Draal_DRAGON_03_02 " );	// Dragon! I'd rather stay here. Nothing will move me. But I'm not crazy!
};

