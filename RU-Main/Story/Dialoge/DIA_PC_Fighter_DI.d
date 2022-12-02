

instance DIA_Gorn_DI_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 999;
	condition = DIA_Gorn_DI_KAP5_EXIT_Condition;
	information = DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorn_DI_CAP5_EXIT_Condition();
{
	return TRUE;
};

func void DIA_Gorn_DI_CAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorn_DI_Hello (C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_Hallo_Condition;
	information = DIA_Gorn_DI_Hallo_Info;
	permanent = TRUE;
	description = " All tip-top? " ;
};


func int DIA_Gorn_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Gorn_DI_Hallo_15_00 " );	// All type-top?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Gorn_DI_Hallo_12_01 " );	// For now, yes. Remember, I want to take action.
	}
	else
	{
		AI_Output(self,other, " DIA_Gorn_DI_Hallo_12_02 " );	// Are there any more orcs out there? Send them to me. I just warmed up a little.
	};
};


instance DIA_Gorn_DI_Teach (C_Info)
{
	npc = PC_Fighter_DI;
	nr = 10;
	condition = DIA_Gorn_DI_Teach_Condition;
	information = DIA_Gorn_DI_Teach_Info;
	permanent = TRUE;
	description = " I want to work out. " ;
};


func int DIA_Gorn_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Teach_Info()
{
	AI_Output(other,self, " DIA_Gorn_DI_Teach_15_00 " );	// I want to practice.
	AI_Output(self,other, " DIA_Gorn_DI_Teach_12_01 " );	// It won't hurt.
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other, " DIA_Gorn_DI_Teach_2H_1_12_00 " );	// Well. However, it's already better.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other, " DIA_Gorn_DI_Teach_2H_5_12_00 " );	// You must hold the weapon higher. Your defense will be broken by a blind man with a crutch.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Gorn_DI_Teach);
};


instance DIA_Gorn_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_UndeadDragonDead_Condition;
	information = DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " Have you been on the ship all this time? " ;
};


func int DIA_Gorn_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Gorn_DI_UndeadDragonDead_OneTime;

func void DIA_Gorn_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Gorn_DI_UndeadDragonDead_15_00 " );	// Have you been on the ship all this time?
	AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_01 " );	// Of course. Just imagine what we would do if he disappeared.
	if(DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_02 " );	// What happened?
			AI_Output(other,self, " DIA_Gorn_DI_UndeadDragonDead_15_03 " );	// Nothing. I'm about to head home.
			AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_04 " );	// (laughs) Home? Where is it? As far as I know, you don't have a home.
			AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_05 " );	// Would you like an offer? We'll break into the first tavern we find and drink ourselves unconscious.
			AI_Output(other,self, " DIA_Gorn_DI_UndeadDragonDead_15_06 " );	// Mmm. May be.
			AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_07 " );	// Hey, relax, buddy. Its end.
		};
		DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Biff_DI_plunder))
	{
		AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_08 " );	// Someone needs to tell Biff about this or he'll rot on this island.
		if (Npc_IsDead(Biff_DI) ==  FALSE )
		{
			AI_Output(other,self, " DIA_Gorn_DI_UndeadDragonDead_15_09 " );	// He'll be here in time.
		};
	};
	AI_Output(self,other, " DIA_Gorn_DI_UndeadDragonDead_12_10 " );	// There's nothing else for us to do here. Tell the captain to raise anchor.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Fighter_DI_PICKPOCKET (C_Info)
{
	npc = PC_Fighter_DI;
	nr = 900;
	condition = DIA_Fighter_DI_PICKPOCKET_Condition;
	information = DIA_Fighter_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 45 );
};

func void DIA_Fighter_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,Dialog_Back,DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

