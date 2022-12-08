
instance DIA_Addon_Wache_02_EXIT(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 999;
	condition = DIA_Addon_Wache_02_EXIT_Condition;
	information = DIA_Addon_Wache_02_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Wache_02_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Wache_02_PICKPOCKET(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 900;
	condition = DIA_Addon_Wache_02_PICKPOCKET_Condition;
	information = DIA_Addon_Wache_02_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Wache_02_PICKPOCKET_Condition()
{
	return  C_Robbery ( 38 , 101 );
};

func void DIA_Addon_Wache_02_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Wache_02_PICKPOCKET,Dialog_Back,DIA_Addon_Wache_02_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Wache_02_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Wache_02_PICKPOCKET_DoIt);
};

func void DIA_Addon_Wache_02_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

func void DIA_Addon_Wache_02_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};


instance DIA_Addon_Wache_02_Hi(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 2;
	condition = DIA_Addon_Wache_02_Hi_Condition;
	information = DIA_Addon_Wache_02_Hi_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Wache_02_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Wache_02_Hi_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_Wache_02_Hi_13_01 " );	// Wait a minute, don't we know each other?
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Wache_02_Hi_13_02 " );	// Umm...No, you don't! Come on, don't loiter.
};


instance DIA_Addon_Wache_02_Attentat(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 2;
	condition = DIA_Addon_Wache_02_Attentat_Condition;
	information = DIA_Addon_Wache_02_Attentat_Info;
	permanent = FALSE;
	description = " What do you know about the attack? " ;
};


func int DIA_Addon_Wache_02_Attentat_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Wache_02_Hi ) && ( MY_Judas == LOG_Running ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Wache_02_Attentat_Info()
{
	AI_Output(other,self, " DIA_Addon_Wache_02_Attentat_15_00 " );	// What do you know about the attack?
	AI_Output(self,other, " DIA_Addon_Wache_02_Attentat_13_01 " );	// What do I know about it? (laughs) I broke the guy's legs.
	AI_Output(self,other, " DIA_Addon_Wache_02_Attentat_13_02 " );	// And I'll do even worse to anyone who tries to attack Esteban...
};


instance DIA_Addon_Wache_02_perm(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 99;
	condition = DIA_Addon_Wache_02_perm_Condition;
	information = DIA_Addon_Wache_02_perm_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_Wache_02_perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Wache_02_Hi ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Wache_02_perm_Info()
{
	AI_Output(other,self, " DIA_Addon_Wache_02_perm_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_Wache_02_perm_13_01 " );	// All is quiet for now.
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_Wache_02_perm_13_02 " );	// You will find the traitor - and we will take care of him...
	};
};
