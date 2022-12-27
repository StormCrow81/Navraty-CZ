
instance DIA_Addon_Skinner_EXIT(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 999;
	condition = DIA_Addon_Skinner_EXIT_Condition;
	information = DIA_Addon_Skinner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skinner_PICKPOCKET(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 900;
	condition = DIA_Addon_Skinner_PICKPOCKET_Condition;
	information = DIA_Addon_Skinner_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Skinner_PICKPOCKET_Condition()
{
	return  C_Robbery ( 100 , 200 );
};

func void DIA_Addon_Skinner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skinner_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET,Dialog_Back,DIA_Addon_Skinner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skinner_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skinner_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

func void DIA_Addon_Skinner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
	B_Say(self,self,"$AWAKE");
};


instance DIA_Addon_Skinner_Hi(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 2;
	condition = DIA_Addon_Skinner_Hi_Condition;
	information = DIA_Addon_Skinner_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skinner_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skinner_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_Skinner_Hi_08_00 " );	// Why did you wake me up, huh? I'm sure you don't even know...
	AI_Output(self,other, " DIA_Addon_Skinner_Hi_08_01 " );	// No - no need to say anything. It's too late to make excuses.
	AI_Output(self,other, " DIA_Addon_Skinner_Hi_08_02 " );	// You now have a choice. You can fight me and my Betty. Or you can try to run away.
	AI_Output(self,other, " DIA_Addon_Skinner_Hi_08_03 " );	// And if I were you, I would start to run...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Skinner_Attentat(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 9;
	condition = DIA_Addon_Skinner_Attentat_Condition;
	information = DIA_Addon_Skinner_Attentat_Info;
	permanent = FALSE;
	description = " Regarding the attack... " ;
};


func int DIA_Addon_Skinner_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skinner_Attentat_Info()
{
	AI_Output(other,self, " DIA_Addon_Skinner_Attentat_15_00 " );	// Regarding the attack...
	AI_Output(self,other, " DIA_Addon_Skinner_Attentat_08_01 " );	// What do you need?
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
	Info_AddChoice(DIA_Addon_Skinner_Attentat, " I want to remove Esteban. " ,DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice(DIA_Addon_Skinner_Attentat, " I want to find a traitor. " ,DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output(other,self, " DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00 " );	// I want to remove Esteban.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");	//Fine.
	Judas_Counter = Judas_Counter + 1;
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output(other,self, " DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00 " );	// I want to find the traitor.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");	//Shit.
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

