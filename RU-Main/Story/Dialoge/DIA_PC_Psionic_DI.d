

instance DIA_Lester_DI_EXIT(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 999;
	condition = DIA_Lester_DI_EXIT_Condition;
	information = DIA_Lester_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_DI_Hello (C_Info)
{
	npc = PC_Psionic_DI;
	nr = 1;
	condition = DIA_Lester_DI_Hello_Condition;
	information = DIA_Lester_DI_Hello_Info;
	permanent = TRUE;
	description = " Is there something you want to tell me? " ;
};


func int DIA_Lester_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;

func void DIA_Lester_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Lester_DI_Hello_15_00 " );	// Do you want to tell me something?
	if ((Npc_IsDead(Mario_DI) ==  FALSE ) && (ORkSturmDI ==  TRUE ) && (DIA_Lester_DI_SCGotWarning1 ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Lester_DI_Hello_13_01 " );	// Mario disappeared when the orcs attacked us. Despite all the chaos that was happening on the ship, I was able to follow it.
		AI_Output(self,other, " DIA_Lester_DI_Hello_13_02 " );	// He just went through the ranks of the orcs, and they didn't even lay a finger on him.
		AI_Output(self,other, " DIA_Lester_DI_Hello_13_03 " );	// I didn't trust this guy from the start. He is with the enemy.
		B_GivePlayerXP(XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE ;
	}
	else  if ((Npc_IsDead(Mario_DI) ==  FALSE ) && (DIA_Lester_DI_SCGotWarning2 ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Lester_DI_Hello_13_04 " );	// I don't like this weird guy who calls himself Mario. He has a heavy aura.
		AI_Output(self,other, " DIA_Lester_DI_Hello_13_05 " );	// Be careful, my friend.
		DIA_Lester_DI_SCGotWarning2 = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Lester_DI_Hello_13_06 " );	// Not yet. Maybe later.
	};
};


instance DIA_Lester_DI_MarioArsch (C_Info)
{
	npc = PC_Psionic_DI;
	nr = 2;
	condition = DIA_Lester_DI_MarioArsch_Condition;
	information = DIA_Lester_DI_MarioArsch_Info;
	description = " You were right. Mario betrayed us. " ;
};


func int DIA_Lester_DI_MarioArsch_Condition()
{
	if (((DIA_Lester_DI_SCGotWarning2 ==  TRUE ) || (DIA_Lester_DI_SCGotWarning2 ==  TRUE )) && (MY_Mario_Ambush ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Lester_DI_MarioArsch_Info()
{
	AI_Output(other,self, " DIA_Lester_DI_MarioArsch_15_00 " );	// You were right. Mario betrayed us.
	AI_Output(self,other, " DIA_Lester_DI_MarioArsch_13_01 " );	// Yes. Maybe I'm not very insightful, but in this case it was clear to me from the very beginning.
	AI_Output(self,other, " DIA_Lester_DI_MarioArsch_13_02 " );	// Try to choose your companions carefully in the future.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_PC_Lester_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 5;
	condition = DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " We won't be here long. " ;
};

func int DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Lester_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_PC_Lester_DI_UndeadDragonDead_15_00 " );	// We won't be here long.
	if(DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other, " DIA_PC_Lester_DI_UndeadDragonDead_13_01 " );	// Looks like my headaches are gone.
			AI_Output(self,other, " DIA_PC_Lester_DI_UndeadDragonDead_13_02 " );	// How did you do it?
			AI_Output(other,self, " DIA_PC_Lester_DI_UndeadDragonDead_15_03 " );	// I destroyed the enemy.
			AI_Output(self,other, " DIA_PC_Lester_DI_UndeadDragonDead_13_04 " );	// He must have been very strong. So who was it anyway?
			AI_Output(other,self, " DIA_PC_Lester_DI_UndeadDragonDead_15_05 " );	// Undead dragon.
		};
		if(SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other,self, " DIA_PC_Lester_DI_UndeadDragonDead_15_06 " );	// Your former friend from Swamp Camp gave me a lot of trouble.
			AI_Output(self,other, " DIA_PC_Lester_DI_UndeadDragonDead_13_07 " );	// Yes. Faith can move mountains. It has always been so. Unfortunately, they served the wrong god.
			AI_Output(self,other, " DIA_PC_Lester_DI_UndeadDragonDead_13_08 " );	// It will take me some time to process all of this.
		};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other, " DIA_PC_Lester_DI_UndeadDragonDead_13_09 " );	// Fortunately, nothing like this will ever happen again. There is not as much swamp grass in the whole world as I am ready to smoke right now.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Psionic_DI_PICKPOCKET(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 900;
	condition = DIA_Psionic_DI_PICKPOCKET_Condition;
	information = DIA_Psionic_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Psionic_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 25 );
};

func void DIA_Psionic_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,Dialog_Back,DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

