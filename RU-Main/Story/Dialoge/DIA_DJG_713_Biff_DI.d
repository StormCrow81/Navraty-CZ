
instance DIA_Biff_DI_EXIT(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 999;
	condition = DIA_Biff_DI_EXIT_Condition;
	information = DIA_Biff_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Biff_DI_HALLO (C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 10;
	condition = DIA_Biff_DI_HALLO_Condition;
	information = DIA_Biff_DI_HALLO_Info;
	important = TRUE;
};


func int DIA_Biff_DI_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_HELLO_Info()
{
	AI_Output(self,other, " DIA_Biff_DI_HALLO_07_00 " );	// And? Where are all the treasures you promised me?
	if(Npc_KnowsInfo(other,DIA_Biff_DI_ORKS) == FALSE)
	{
		AI_Output(other,self, " DIA_Biff_DI_HALLO_15_01 " );	// What did I tell you before, at sea?
	};
	AI_Output(other,self, " DIA_Biff_DI_HALLO_15_02 " );	// Now your task is to guard the ship.
	AI_Output(other,self, " DIA_Biff_DI_HALLO_15_03 " );	// I do not smile to swim back.
	AI_Output(self,other, " DIA_Biff_DI_HALLO_07_04 " );	// Damn. If I had known this in advance, I would have stayed in Khorinis better.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_perm (C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_perm_Condition;
	information = DIA_Biff_DI_perm_Info;
	permanent = TRUE;
	description = " Is everything safe on board? " ;
};


func int DIA_Biff_DI_perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Biff_DI_HELLO ) && ( UndeadDragonIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_perm_Info()
{
	AI_Output(other,self, " DIA_Biff_DI_perm_15_00 " );	// Is everything calm on board?
	AI_Output(self,other, " DIA_Biff_DI_perm_07_01 " );	// (nervous) Yes, yes. Everything is quiet.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_THE_ORKS ( C_Info ) .
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_ORKS_Condition;
	information = DIA_Biff_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Biff_DI_ORKS_Condition()
{
	if((Npc_GetDistToWP(self,"DI_SHIP_03") < 1000) && (ORkSturmDI == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_ORKS_Info()
{
	AI_Output(self,other, " DIA_Biff_DI_ORKS_07_00 " );	// Those vile creatures!
	AI_Output(other,self, " DIA_Biff_DI_ORKS_15_01 " );	// Damn, what are you doing here? You were supposed to guard the ship.
	AI_Output(self,other, " DIA_Biff_DI_ORKS_07_02 " );	// He's not going anywhere.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Biff_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 4;
	condition = DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important = TRUE;
};


func int DIA_Biff_DI_UNDEADDRGDEAD_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(self,other, " DIA_Biff_DI_UNDEADDRGDEAD_07_00 " );	// What, it's all over?
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_01");	//Вроде бы да.
	AI_Output(self,other, " DIA_Biff_DI_UNDEADDRGDEAD_07_02 " );	// And now, can I...
	AI_Output(other,self, " DIA_Biff_DI_UNDEADDRGDEAD_15_03 " );	// You can flip the whole island if you want.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_04");	//Отлично.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PlunderTempel");
};


instance DIA_Biff_DI_plunder (C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_plunder_Condition;
	information = DIA_Biff_DI_plunder_Info;
	important = TRUE;
};


func int DIA_Biff_DI_plunder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Biff_DI_plunder) && (UndeadDragonIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_plunder_Info()
{
	AI_Output(self,other, " DIA_Biff_DI_plunder_07_00 " );	// Damn! Not now.
	AI_StopProcessInfos(self);
};


instances DIA_Biff_DI_PICKPOCKET (C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 900;
	condition = DIA_Biff_DI_PICKPOCKET_Condition;
	information = DIA_Biff_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Biff_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 92 , 450 );
};

func void DIA_Biff_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
	Info_AddChoice(HE_Biff_IN_PICKPOCKET,Dialog_Back,HE_Biff_IN_PICKPOCKET_BACK);
	Info_AddChoice(HE_Biff_IN_PICKPOCKET, DIALOG_PICKPOCKET ,HE_Biff_IN_PICKPOCKET_DoIt);
};

func void DIA_Biff_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

func void DIA_Biff_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

