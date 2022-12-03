

instance DIA_Addon_Patrick_NW_EXIT(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 999;
	condition = DIA_Addon_Patrick_NW_EXIT_Condition;
	information = DIA_Addon_Patrick_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 900;
	condition = DIA_Addon_Patrick_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Patrick_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Patrick_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 35 , 50 );
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Patrick_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Patrick_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};


instance DIA_Addon_Patrick_NW_Hi(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 2;
	condition = DIA_Addon_Patrick_NW_Hi_Condition;
	information = DIA_Addon_Patrick_NW_Hi_Info;
	permanent = FALSE;
	description = " So, are you all right? " ;
};


func int DIA_Addon_Patrick_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_Hi_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Patrick_NW_Hi_15_00 " );	// So, are you all right?
	AI_Output(self,other, " DIA_Addon_Patrick_NW_Hi_07_01 " );	// All is well. Waterbenders brought us out of this accursed valley.
	AI_Output(other,self, " DIA_Addon_Patrick_NW_Hi_15_02 " );	// And what will you do next?
	AI_Output(self,other, " DIA_Addon_Patrick_NW_Hi_07_03 " );	// I will continue to work for Lee. And one day we'll leave this island...
	AI_Output(other,self, " DIA_Addon_Patrick_NW_Hi_15_04 " );	// And what will happen then?
	AI_Output(self,other, " DIA_Addon_Patrick_NW_Hi_07_05 " );	// We'll see. If the war is still going on, we will fight the orcs. But this will become clear later.
};
