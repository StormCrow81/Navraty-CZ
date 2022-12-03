

instance DIA_Wolf_DI_EXIT (C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 999;
	condition = DIA_Wolf_DI_EXIT_Condition;
	information = DIA_Wolf_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wolf_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_DI_HELLO (C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 4;
	condition = DIA_Wolf_DI_HALLO_Condition;
	information = DIA_Wolf_DI_HALLO_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Wolf_DI_HELLO_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_HALLO_OneTime;

func void DIA_Wolf_DI_HELLO_Info()
{
	AI_Output(other,self, " DIA_Wolf_DI_HALLO_15_00 " );	// How are you?
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(Bennet_DI) == FALSE))
	{
		AI_Output(self,other, " DIA_Wolf_DI_HALLO_08_01 " );	// Did you REALLY need to take Bennet with you?
		AI_Output(other,self, " DIA_Wolf_DI_HALLO_15_02 " );	// What's the problem?
		AI_Output(self,other, " DIA_Wolf_DI_HALLO_08_03 " );	// Ah, nothing. Everything is fine. Do what you think is right.
	}
	else  if (DIA_Wolf_DI_HALLO_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Wolf_DI_HALLO_08_04 " );	// This forge is not in the best condition, but I think I can do something.
		B_GivePlayerXP(XP_Ambient);
		DIA_Wolf_DI_HALLO_OneTime = TRUE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self, " DIA_Wolf_DI_HALLO_15_05 " );	// Can you make armor for me?
		AI_Output(self,other, " DIA_Wolf_DI_HALLO_08_06 " );	// Sorry mate. But not with these tools. We'll have to wait until we arrive on the mainland.
	};
};


instances DIA_Wolf_DI_Training (C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 10;
	condition = DIA_Wolf_DI_Training_Condition;
	information = DIA_Wolf_DI_Training_Info;
	permanent = TRUE;
	description = " Teach me how to shoot. " ;
};


func int DIA_Wolf_DI_Training_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_DI_Training_Info()
{
	AI_Output(other,self, " DIA_Wolf_DI_Training_15_00 " );	// Teach me how to shoot.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//Из чего?
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_BOW_1_08_00 " );	// Unlike a crossbow, a bow is bulky and takes up a lot of space. Look what you had enough of during the battle.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_BOW_5_08_00 " );	// String with ease when shooting an arrow. A clumsy finger gives the arrow the wrong trajectory.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_CROSSBOW_1_08_00 " );	// Try not to loosen the crossbow when shooting. To do this, carefully pull the trigger.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_CROSSBOW_5_08_00 " );	// A smart shooter always pays attention to the wind and doesn't shoot against it.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_Training);
};


instance DIA_Wolf_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 2;
	condition = DIA_Wolf_DI_UndeadDragonDead_Condition;
	information = DIA_Wolf_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Wolf_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_UndeadDragonDead_OneTime;

func void DIA_Wolf_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Wolf_DI_UndeadDragonDead_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Wolf_DI_UndeadDragonDead_08_01 " );	// Of course. And you have? It wasn't easy for you, was it?
	if(DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self, " DIA_Wolf_DI_UndeadDragonDead_15_02 " );	// Where are you now?
		AI_Output(self,other, " DIA_Wolf_DI_UndeadDragonDead_08_03 " );	// Anywhere but back. I'm fed up with Khorinis.
		AI_Output(self,other, " DIA_Wolf_DI_UndeadDragonDead_08_04 " );	// I don't care where to swim. Just to get away from here.
		DIA_Wolf_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instances DIA_Wolf_DI_PICKPOCKET (C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 900;
	condition = DIA_Wolf_DI_PICKPOCKET_Condition;
	information = DIA_Wolf_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wolf_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 32 , 45 );
};

func void DIA_Wolf_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET,Dialog_Back,DIA_Wolf_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Wolf_DI_PICKPOCKET_DoIt);
};

func void DIA_Wolf_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

func void DIA_Wolf_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

