

instance DIA_Lares_DI_EXIT(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 999;
	condition = DIA_Lares_DI_EXIT_Condition;
	information = DIA_Lares_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lares_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_DI_Hello (C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 2;
	condition = DIA_Lares_DI_Hallo_Condition;
	information = DIA_Lares_DI_Hello_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Lares_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Lares_DI_Hallo_15_00 " );	// How are you?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other, " DIA_Lares_DI_Hallo_09_01 " );	// Hurry up. Orcs will surely return again.
	}
	else
	{
		AI_Output(self,other, " DIA_Lares_DI_Hallo_09_02 " );	// Good. Although this grotto scares me a little.
	};
};


DIA_Lares_DI_Training (C_Info) instances
{
	npc = VLK_449_Lares_DI;
	nr = 10;
	condition = DIA_Lares_DI_Training_Condition;
	information = DIA_Lares_DI_Training_Info;
	permanent = TRUE;
	description = " Teach me what you know yourself. " ;
};


func int DIA_Lares_DI_Training_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Training_Info()
{
	AI_Output(other,self, " DIA_Lares_DI_Training_15_00 " );	// Teach me your abilities.
	AI_Output(self,other, " DIA_Lares_DI_Training_09_01 " );	// No problem.
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, " Learn to sneak " ,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_1H_1_09_00 " );	// You need to bend your front leg a little and straighten your back. That way you'll be in the right position.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, " Learn to sneak " ,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_1H_5_09_00 " );	// Don't tense your hips, this will allow you to dodge a counterattack in time.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, " Learn to sneak " ,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_DEX_1_09_00 " );	// Your upper torso must act in concert with your lower torso.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, " Learn to sneak " ,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_DEX_5_09_00 " );	// Always watch your feet.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, " Learn to sneak " ,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_SNEAK_09_00 " );	// Always use the full area of ​​the sole when sneaking.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, " Learn to sneak " ,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Lares_DI_Training);
};


instance DIA_Lares_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 5;
	condition = DIA_Lares_DI_UndeadDragonDead_Condition;
	information = DIA_Lares_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " You don't seem to care much about this. " ;
};

func int DIA_Lares_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Lares_DI_UndeadDragonDead_OneTime;

func void DIA_Lares_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Lares_DI_UndeadDragonDead_15_00 " );	// You don't seem to care much about this.
	AI_Output(self,other, " DIA_Lares_DI_UndeadDragonDead_09_01 " );	// Ah, you know, I was sure you could do it.
	if(DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self, " DIA_Lares_DI_UndeadDragonDead_15_02 " );	// What are you going to do next?
		AI_Output(self,other, " DIA_Lares_DI_UndeadDragonDead_09_03 " );	// Don't know yet. Maybe I'll stay with you for now.
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};

