

instance DIA_TOM_NW_EXIT(C_Info)
{
	npc = vlk_6025_tom;
	nr = 999;
	condition = dia_tom_nw_exit_condition;
	information = dia_tom_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_tom_nw_exit_condition()
{
	return TRUE;
};

func void dia_tom_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TOM_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6025_tom;
	nr = 900;
	condition = dia_tom_nw_pickpocket_condition;
	information = dia_tom_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_tom_nw_pickpocket_condition()
{
	return  C_Robbery ( 60 , 90 );
};

func void dia_tom_nw_pickpocket_info()
{
	Info_ClearChoices(dia_tom_nw_pickpocket);
	Info_AddChoice(dia_tom_nw_pickpocket,Dialog_Back,dia_tom_nw_pickpocket_back);
	Info_AddChoice(dia_tom_nw_pickpocket,DIALOG_PICKPOCKET,dia_tom_nw_pickpocket_doit);
};

func void dia_tom_nw_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_tom_nw_pickpocket);
};

func void dia_tom_nw_pickpocket_back()
{
	Info_ClearChoices(dia_tom_nw_pickpocket);
};


instance DIA_TOM_NW_HI(C_Info)
{
	npc = vlk_6025_tom;
	nr = 1;
	condition = dia_tom_nw_hi_condition;
	information = dia_tom_nw_hi_info;
	permanent = FALSE;
	description = " Hello " ;
};


func int dia_tom_nw_hi_condition()
{
	return TRUE;
};

func void dia_tom_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_00");	//Hey.
	AI_Output(self,other, " DIA_Tom_NW_Hi_01_01 " );	// Oh! Where did you come from?
	AI_Output(other,self, " DIA_Tom_NW_Hi_01_02 " );	// The question is not where I'm from. The question is, how did you get here?
	AI_Output(other,self, " DIA_Tom_NW_Hi_01_03 " );	// You, like the other guys, came here with the pirates?
	AI_Output(self,other, " DIA_Tom_NW_Hi_01_04 " );	// Yes, if you know that, why are you asking?
	AI_Output(other,self, " DIA_Tom_NW_Hi_01_06 " );	// Well, how do you like Khorinis?
	AI_Output(self,other, " DIA_Tom_NW_Hi_01_07 " );	// Better than where I used to be. At least, midges don’t eat you alive, and there will always be a job so as not to die of boredom ...
	AI_Output(other,self, " DIA_Tom_NW_Hi_01_08 " );	// What's the job?
	AI_Output(self,other, " DIA_Tom_NW_Hi_01_09 " );	// I work for Matteo, a local merchant.
	AI_Output(other,self, " DIA_Tom_NW_Hi_01_10 " );	// Matteo?! You work for Matteo? How did he even take you?
	AI_Output(self,other, " DIA_Tom_NW_Hi_01_11 " );	// Well, I'm pretty good at bookkeeping and such. I'm just the type of person he needed.
	AI_Output(self,other, " DIA_Tom_NW_Hi_01_12 " );	// Now stop talking, I've got to go.
};


instance DIA_TOM_NW_CITY(C_Info)
{
	npc = vlk_6025_tom;
	nr = 2;
	condition = dia_tom_nw_city_condition;
	information = dia_tom_nw_city_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_tom_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_tom_nw_hi))
	{
		return TRUE;
	};
};

func void dia_tom_nw_city_info()
{
	AI_Output(other,self, " DIA_Tom_NW_City_01_00 " );	// How are you?
	AI_Output(self,other, " DIA_Tom_NW_City_01_01 " );	// All is well! I have nothing to complain about.
};

