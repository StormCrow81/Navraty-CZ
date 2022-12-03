

instance DIA_Addon_Monty_NW_EXIT(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 999;
	condition = DIA_Addon_Monty_NW_EXIT_Condition;
	information = DIA_Addon_Monty_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Monty_NW_Hi(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 2;
	condition = DIA_Addon_Monty_NW_Hi_Condition;
	information = DIA_Addon_Monty_NW_Hi_Info;
	permanent = FALSE;
	description = " So, are you back to your work? " ;
};


func int DIA_Addon_Monty_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_Hi_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Monty_NW_Hi_15_00 " );	// Well, are you back to your work?
	AI_Output(self,other, " DIA_Addon_Monty_NW_Hi_08_01 " );	// Imagine, while I was gone, they did not move forward at all. I had to sit down again for the drawings.
	AI_Output(other,self, " DIA_Addon_Monty_NW_Hi_15_02 " );	// Well, I won't distract you.
	AI_Output(self,other, " DIA_Addon_Monty_NW_Hi_08_03 " );	// Thank you. Good luck!
};


instance DIA_Addon_Monty_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 900;
	condition = DIA_Addon_Monty_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Monty_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Monty_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 60 , 60 );
};

func void DIA_Addon_Monty_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Monty_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Monty_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

