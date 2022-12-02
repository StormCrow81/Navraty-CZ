

instance DIA_NONE_101_MARIO_DI_EXIT (C_Info)
{
	npc = None_101_Mario_DI;
	nr = 999;
	condition = DIA_NONE_101_MARIO_DI_EXIT_Condition;
	information = DIA_NONE_101_MARIO_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_101_MARIO_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_101_MARIO_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_OF_Job (C_Info)
{
	npc = None_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_Job_Condition;
	information = DIA_NONE_101_MARIO_OF_Job_Info;
	permanent = TRUE;
	description = " Then you have a chance to show off your fighting skills. " ;
};


func int DIA_NONE_101_MARIO_DI_Job_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (ORkSturmDI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_OF_Job_Info()
{
	AI_Output(other,self, " DIA_NONE_101_MARIO_DI_Job_15_00 " );	// Then you have a chance to show your combat abilities.
	AI_Output(self,other, " DIA_NONE_101_MARIO_DI_Job_07_01 " );	// Slow down! Everything has its time.
	AI_Output(other,self, " DIA_NONE_101_MARIO_DI_Job_15_02 " );	// Mmm... That's exactly what I expected from you.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_03");	//Подожди.
};

instance DIA_NONE_101_MARIO_DI_ambush (C_Info)
{
	npc = None_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_ambush_Condition;
	information = DIA_NONE_101_MARIO_OF_ambush_Info;
	important = TRUE;
};


func int DIA_NONE_101_MARIO_DI_ambush_Condition()
{
	if(ORkSturmDI == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_ambush_Info()
{
	AI_Output(self,other, " DIA_NONE_101_MARIO_DI_ambush_07_00 " );	// Come closer! Yes, my friend. Now show me what you can do.
	AI_Output(other,self, " DIA_NONE_101_MARIO_DI_ambush_15_01 " );	// What do you mean?
	AI_Output(self,other, " DIA_NONE_101_MARIO_DI_ambush_07_02 " );	// It's easy! The owner is already tired of you.
	AI_Output(self,other, " DIA_NONE_101_MARIO_DI_ambush_07_03 " );	// I should have killed you earlier. But my friends and I will correct this mistake now.
	Info_ClearChoices(DIA_NONE_101_MARIO_DI_ambush);
	Info_AddChoice(DIA_NONE_101_MARIO_Ambush,Dialog_End,DIA_NONE_101_MARIO_Ambush_ambush);
	B_GivePlayerXP(XP_Mario_Ambush);
	MIS_Mario_Ambush = LOG_SUCCESS;
};

func void DIA_NONE_101_MARIO_DI_ambush_ambush()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	Skeleton_Mario1.aivar[AIV_EnemyOverride] = FALSE ;
	Skeleton_Mario2.aivar[AIV_EnemyOverride] = FALSE ;
	Skeleton_Mario3.aivar[AIV_EnemyOverride] = FALSE ;
	Skeleton_Mario4.aivar[AIV_EnemyOverride] = FALSE ;
};


instance DIA_MARIO_OF_PICKPOCKET (C_Info)
{
	npc = None_101_Mario_DI;
	nr = 900;
	condition = DIA_MARIO_DI_PICKPOCKET_Condition;
	information = DIA_MARIO_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_MARIO_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 71 , 110 );
};

func void DIA_MARIO_OF_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
	Info_AddChoice(dia_mario_di_pickpocket,Dialog_Back,dia_mario_di_pickpocket_back);
	Info_AddChoice(dia_mario_di_pickpocket, DIALOG_PICKPOCKET ,DIA_MARIO_DI_PICKPOCKET_DoIt);
};

func void DIA_MARIO_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_mario_di_pickpocket);
};

func void dia_mario_di_pickpocket_back()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
};

