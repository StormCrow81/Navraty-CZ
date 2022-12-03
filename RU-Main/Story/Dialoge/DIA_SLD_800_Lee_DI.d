

instance DIA_Lee_DI_EXIT(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 999;
	condition = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_DI_Hallo (C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_Hallo_Condition;
	information = DIA_Lee_DI_Hello_Info;
	description = " What are you going to do? " ;
};


func int DIA_Lee_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Hallo_Info()
{
	AI_Output(other,self, " DIA_Lee_DI_Hallo_15_00 " );	// What will you do?
	AI_Output(self,other, " DIA_Lee_DI_Hallo_04_01 " );	// Someone needs to guard the ship. I'll stay here and make sure he's there when you get back.
};


instance DIA_Lee_DI_PERM6 (C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_PERM6_Condition;
	information = DIA_Lee_DI_PERM6_Info;
	permanent = TRUE;
	description = " How is my ship? " ;
};


func int DIA_Lee_DI_PERM6_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lee_DI_Hello ) && ( UndeadDragonIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_PERM6_Info()
{
	AI_Output(other,self, " DIA_Lee_DI_PERM6_15_00 " );	// How is my ship?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other, " DIA_Lee_DI_PERM6_04_01 " );	// Don't worry. I have everything under control.
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_DI_PERM6_04_02 " );	// Everything is fine. These pathetic orcs can come back whenever they want. I'll give them a beating again.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lee_DI_Teach(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 10;
	condition = DIA_Lee_DI_Teach_Condition;
	information = DIA_Lee_DI_Teach_Info;
	permanent = TRUE;
	description = " I want to work out. " ;
};


func int DIA_Lee_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Teach_Info()
{
	AI_Output(other,self, " DIA_Lee_DI_Teach_15_00 " );	// I want to practice.
	AI_Output(self,other, " DIA_Lee_DI_Teach_04_01 " );	// What exactly do you want to improve?
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other, " DIA_Lee_DI_Teach_1H_1_04_00 " );	// Your defense is terrible, but we'll do something about it.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other, " DIA_Lee_DI_Teach_1H_5_04_00 " );	// Your brushes are too tight. You should keep your weapons free.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other, " DIA_DIA_Lee_DI_Teach_2H_1_04_00 " );	// Always remember: the side kick should come from the hip, not the wrist.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other, " DIA_Lee_DI_Teach_2H_5_04_00 " );	// Strongest hit is useless if it goes nowhere. So try to accurately count the blows.
	};
	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach,Dialog_Back,DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_DI_Teach);
};


instance DIA_Lee_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 2;
	condition = DIA_Lee_DI_UndeadDragonDead_Condition;
	information = DIA_Lee_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " We can set sail. " ;
};


func int DIA_Lee_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Lee_DI_UndeadDragonDead_OneTime;

func void DIA_Lee_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Lee_DI_UndeadDragonDead_15_00 " );	// We can set sail. The enemy is dead.
	AI_Output(self,other, " DIA_Lee_DI_UndeadDragonDead_04_01 " );	// Very good. Then tell the captain to raise anchor.
	if((DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Lee_DI_UndeadDragonDead_04_02 " );	// You'll get me to the mainland, right?
		AI_Output(other,self, " DIA_Lee_DI_UndeadDragonDead_15_03 " );	// Yes. Khorinis will live without you.
		AI_Output(self,other, " DIA_Lee_Add_04_26 " );	// So I can finally pay the long-delayed courtesy visit to the king.
		AI_Output(self,other, " DIA_Lee_Add_04_27 " );	// I've been waiting for this for so long...
		AI_Output(self,other, " DIA_Lee_DI_UndeadDragonDead_04_05 " );	// What do you think? Shouldn't patience be rewarded?
		AI_Output(other,self, " DIA_Lee_DI_UndeadDragonDead_15_06 " );	// Patience and murderous arguments.
		AI_Output(self,other, " DIA_Lee_DI_UndeadDragonDead_04_07 " );	// (laughs) Yes. Nothing will work without a good team. It was a great honor for me to fight side by side with you.
		DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other, " DIA_Lee_DI_UndeadDragonDead_04_08 " );	// Maybe someday our paths will cross again...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Lee_DI_PICKPOCKET (C_Info)
{
	npc = SLD_800_Lee_DI;
	nr = 900;
	condition = DIA_Lee_DI_PICKPOCKET_Condition;
	information = DIA_Lee_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lee_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 110 , 570 );
};

func void DIA_Lee_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET,Dialog_Back,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

