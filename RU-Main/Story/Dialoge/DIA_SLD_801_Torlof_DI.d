

instance DIA_Torlof_DI_CAP3_EXIT (C_Info) .
{
	npc = SLD_801_Torlof_DI;
	nr = 999;
	condition = DIA_Torlof_DI_KAP3_EXIT_Condition;
	information = DIA_Torlof_DI_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Torlof_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DI_Hello (C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_Hallo_Condition;
	information = DIA_Torlof_DI_Hallo_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Torlof_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Hallo_Info()
{
	AI_Output(other,self, " DIA_Torlof_DI_Hallo_15_00 " );	// Is everything okay?

	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Torlof_DI_Hallo_01_01 " );	// For now, yes. But everything can change in an instant. Be careful.
	}
	else
	{
		AI_Output(self,other, " DIA_Torlof_DI_Hallo_01_02 " );	// If those despicable orcs stay where they are now, I don't see any problem.
		B_StartOtherRoutine(Torlof_DI,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Please_Teach (C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 150;
	condition = DIA_Torlof_DI_Teach_Condition;
	information = DIA_Torlof_DI_Teach_Info;
	permanent = TRUE;
	description = " I want to improve my abilities! " ;
};

func int DIA_Torlof_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Teach_Info()
{
	AI_Output(other, self, " DIA_Torlof_DI_Teach_15_00 " );	// I want to improve my abilities!
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Torlof_DI_Teach);
};

func void DIA_Torlof_DI_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

instance DIA_Torlof_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_UndeadDragonDead_Condition;
	information = DIA_Torlof_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " I have destroyed the enemies. " ;
};

func int DIA_Torlof_DI_UndeadDragonDead_Condition()
{
	if((UndeadDragonIsDead == TRUE) && (DAGOTTELLALL == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Torlof_DI_UndeadDragonDead_15_00 " );	// I destroyed the enemies.
	AI_Output(self,other, " DIA_Torlof_DI_UndeadDragonDead_01_01 " );	// I didn't expect anything else. How did everything go? Can we go back?
	Info_ClearChoices(DIA_Torlof_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead, " I need a couple more minutes. " ,DIA_Torlof_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead, " Yes. It's over. " ,DIA_Torlof_DI_UndeadDragonDead_over);
};

func void DIA_Torlof_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self, " DIA_Torlof_DI_UndeadDragonDead_moment_15_00 " );	// I need a couple more minutes.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_moment_01_01");	//Поторопись!
	AI_StopProcessInfos(self);
};

func void DIA_Torlof_DI_UndeadDragonDead_over()
{
	CAPITANORDERDIAWAY = TRUE;
	AI_Output(other,self, " DIA_Torlof_DI_UndeadDragonDead_over_15_00 " );	// Yes, it's over. We can flush!
	AI_Output(self,other, " DIA_Torlof_DI_UndeadDragonDead_over_01_01 " );	// If you're sure, then go sleep in the captain's cabin. We'll be leaving soon!
	AI_Output(self,other, " DIA_Torlof_DI_UndeadDragonDead_over_01_02 " );	// All aboard! Raise the sails!
	AI_StopProcessInfos(self);
};

instances DIA_Torlof_DI_PICKPOCKET (C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 900;
	condition = DIA_Torlof_DI_PICKPOCKET_Condition;
	information = DIA_Torlof_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Torlof_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 76 , 120 );
};

func void DIA_Torlof_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET,Dialog_Back,DIA_Torlof_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Torlof_DI_PICKPOCKET_DoIt);
};

func void DIA_Torlof_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};

func void DIA_Torlof_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};
