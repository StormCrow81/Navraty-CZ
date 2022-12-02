

instance DIA_Rick_EXIT(C_Info)
{
	npc = Mil_336_Rick;
	nr = 999;
	condition = DIA_Rick_EXIT_Condition;
	information = DIA_Rick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rick_HELLO (C_Info)
{
	npc = Mil_336_Rick;
	nr = 1;
	condition = DIA_Rick_HALLO_Condition;
	information = DIA_Rick_HELLO_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Rick_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rick_HALLO_Info()
{
	AI_Output(other,self, " DIA_Rick_HALLO_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Rick_HALLO_10_01 " );	// If you feel like talking, talk to Rumbold. I'm just here in case anyone wants to riot.
	AI_StopProcessInfos(self);
};


instance DIA_Rick_PICKPOCKET(C_Info)
{
	npc = Mil_336_Rick;
	nr = 900;
	condition = DIA_Rick_PICKPOCKET_Condition;
	information = DIA_Rick_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rick_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 45 );
};

func void DIA_Rick_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rick_PICKPOCKET);
	Info_AddChoice(DIA_Rick_PICKPOCKET,Dialog_Back,DIA_Rick_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rick_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rick_PICKPOCKET_DoIt);
};

func void DIA_Rick_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rick_PICKPOCKET);
};

func void DIA_Rick_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rick_PICKPOCKET);
};

