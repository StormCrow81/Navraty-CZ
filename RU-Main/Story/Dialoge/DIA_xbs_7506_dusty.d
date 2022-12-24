

instance DIA_DUSTY_EXIT(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 999;
	condition = dia_dusty_exit_condition;
	information = dia_dusty_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dusty_exit_condition()
{
	return TRUE;
};

func void dia_dusty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_PICKPOCKET(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 900;
	condition = dia_dusty_pickpocket_condition;
	information = dia_dusty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_dusty_pickpocket_condition()
{
	return  C_Robbery ( 25 , 30 );
};

func void dia_dusty_pickpocket_info()
{
	Info_ClearChoices(dia_dusty_pickpocket);
	Info_AddChoice(dia_dusty_pickpocket,Dialog_Back,dia_dusty_pickpocket_back);
	Info_AddChoice(dia_dusty_pickpocket,DIALOG_PICKPOCKET,dia_dusty_pickpocket_doit);
};

func void dia_dusty_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_dusty_pickpocket);
};

func void dia_dusty_pickpocket_back()
{
	Info_ClearChoices(dia_dusty_pickpocket);
};


instance DIA_DUSTY_HALLO(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 2;
	condition = dia_dusty_hallo_condition;
	information = dia_dusty_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dusty_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_dusty_hallo_info()
{
	AI_Output(self,other, " DIA_Dusty_Hallo_01_00 " );	// I think I know you.
	AI_Output(self,other, " DIA_Dusty_Hallo_01_01 " );	// It was you who brought me to the Swamp Camp. Do you remember?
	AI_Output(other,self,"DIA_Dusty_Hallo_15_00");	//Hmmm...
	AI_Output(self,other, " DIA_Dusty_Hallo_01_02 " );	// My name is Dusty! I was still a miner in the Old Camp then.
	AI_Output(other,self, " DIA_Dusty_Hallo_15_01 " );	// I seem to remember. I hope you're not offended that I dragged you into that crazy business?
	AI_Output(self,other, " DIA_Dusty_Hallo_01_03 " );	// No. It's my own fault - I got into that mess myself.
	AI_Output(self,other, " DIA_Dusty_Hallo_01_04 " );	// I didn’t really buy their bullshit anyway.
	AI_Output(self,other, " DIA_Dusty_Hallo_01_05 " );	// I slept more than I listened. The weed was great though.
	b_heroknowforestbase();
	AI_StopProcessInfos(self);
};

