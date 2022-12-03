

instance DIA_Addon_Monty_EXIT(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 999;
	condition = DIA_Addon_Monty_EXIT_Condition;
	information = DIA_Addon_Monty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int monty_once;

instance DIA_Addon_Monty_Hi(C_Info)
{
	npc = STRF_1119_Addon_Monty;
	nr = 2;
	condition = DIA_Addon_Monty_Hi_Condition;
	information = DIA_Addon_Monty_Hi_Info;
	permanent = FALSE;
	description = " How are things going? " ;
};


func int DIA_Addon_Monty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Monty_Hi_15_00 " );	// How are things going?
	AI_Output(self,other, " DIA_Addon_Monty_Hi_08_01 " );	// I'm alive - and that's all that matters to me.
	if (Monty_once ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Monty_Hi_08_02 " );	// If you want to discuss anything, you need Patrick.
		Monty_einmal = TRUE;
	};
};

