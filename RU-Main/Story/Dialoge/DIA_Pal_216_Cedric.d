

instance DIA_Cedric_EXIT(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 999;
	condition = DIA_Cedric_EXIT_Condition;
	information = DIA_Cedric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cedric_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cedric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cedric_Hallo(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 2;
	condition = DIA_Cedric_Hallo_Condition;
	information = DIA_Cedric_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cedric_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Hallo_Info()
{
	AI_Output(self,other, " DIA_Cedric_Hallo_12_00 " );	// I am Cedric, master of the sword and paladin of the king.
};


instance DIA_Cedric_CanTeach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeach_Condition;
	information = DIA_Cedric_CanTeach_Info;
	permanent = TRUE;
	description = " Can you teach me? " ;
};


func int DIA_Cedric_CanTeach_Condition()
{
	if(Cedric_Teach1H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Cedric_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Cedric_CanTeach_15_00 " );	// Can you teach me?

	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Cedric_CanTeach_12_01 " );	// I can teach you how to use one-handed weapons.
		Cedric_Teach1H = TRUE;
		B_LogEntry(TOPIC_CityTeacher, " Paladin Cedric can teach me the art of one-handed combat. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Cedric_CanTeach_12_02 " );	// I only train paladins.
	};
};

instance DIA_Cedric_CanTeachShield(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeachShield_Condition;
	information = DIA_Cedric_CanTeachShield_Info;
	permanent = FALSE;
	description = " Your shield is interesting! " ;
};

func int DIA_Cedric_CanTeachShield_Condition()
{
	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Cedric_CanTeachShield_Info()
{
	AI_Output(other,self, " DIA_Cedric_CanTeachShield_01_00 " );	// Interesting shield you have!
	AI_Output(self,other, " DIA_Cedric_CanTeachShield_01_01 " );	// Like it? (maliciously) I see you are very interested in him.
	AI_Output(other,self, " DIA_Cedric_CanTeachShield_01_02 " );	// So it is.
	AI_Output(self,other, " DIA_Cedric_CanTeachShield_01_03 " );	// Only we, the king's paladins, are honored to wear them!
	AI_Output(self,other, " DIA_Cedric_CanTeachShield_01_04 " );	// Although many people think that this is no more than an ordinary piece of iron.
	AI_Output(other,self, " DIA_Cedric_CanTeachShield_01_05 " );	// What is it really?
	AI_Output(self,other, " DIA_Cedric_CanTeachShield_01_06 " );	// Let them say what they want. (seriously) But a true master always knows the value of a good shield in capable hands!
	AI_Output(other,self, " DIA_Cedric_CanTeachShield_01_07 " );	// I'm also a paladin, and would like to wear such a shield.
	AI_Output(self,other, " DIA_Cedric_CanTeachShield_01_08 " );	// Then you should contact Ingmar.
	AI_Output(self,other, " DIA_Cedric_CanTeachShield_01_09 " );	// I'm sure he'll find something worthwhile for you.
	AI_Output(other,self, " DIA_Cedric_CanTeachShield_01_10 " );	// I'll talk to him.
	CedricSendIngmar = TRUE;
};

instance DIA_Cedric_DoTeachShield(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_DoTeachShield_Condition;
	information = DIA_Cedric_DoTeachShield_Info;
	permanent = FALSE;
	description = " Can you teach me how to fight with a shield? " ;
};

func int DIA_Cedric_DoTeachShield_Condition()
{
	if((CedricSendIngmar == TRUE) && (hero.attribute[ATR_REGENERATEMANA] >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cedric_DoTeachShield_Info()
{
	AI_Output(other,self, " DIA_Cedric_DoTeachShield_01_00 " );	// Can you teach me how to fight with a shield?
	AI_Output(self,other, " DIA_Cedric_DoTeachShield_01_01 " );	// Of course. I can show you a couple tricks.
	AI_Output(other,self, " DIA_Cedric_DoTeachShield_01_02 " );	// And what does this require from me?
	AI_Output(self,other, " DIA_Cedric_DoTeachShield_01_03 " );	// A little experience and patience, nothing more.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Paladin Cedric can teach me the art of shield fighting. " );
	CedricTeachShield = TRUE;
};

instance DIA_Cedric_Teach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = DIA_Cedric_Teach_Condition;
	information = DIA_Cedric_Teach_Info;
	permanent = TRUE;
	description = " I want to work out. " ;
};

func int DIA_Cedric_Teach_Condition()
{
	if((Cedric_Teach1H == TRUE) && ((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE)))
	{
		return TRUE;
	};
	if((CedricTeachShield == TRUE) && ((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Teach_Info()
{
	AI_Output(other,self, " DIA_Cedric_Teach_15_00 " );	// I'm ready to train.

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_01 " );	// You learned all about sword fighting. I can't show you anymore!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_91 " );	// Shield training is over! I taught you everything I knew myself.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_Back()
{
	Info_ClearChoices(DIA_Cedric_Teach);
};

func void DIA_Cedric_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_01 " );	// You learned all about sword fighting. I can't show you anymore!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_91 " );	// Shield training is over! I taught you everything I knew myself.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_01 " );	// You learned all about sword fighting. I can't show you anymore!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_91 " );	// Shield training is over! I taught you everything I knew myself.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_ShieldNoMoney_1()
{
	B_TeachShieldNoMoney(self,other,1,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_01 " );	// You learned all about sword fighting. I can't show you anymore!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_91 " );	// Shield training is over! I taught you everything I knew myself.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

func void DIA_Cedric_Teach_ShieldNoMoney_5()
{
	B_TeachShieldNoMoney(self,other,5,100);

	if((other.HitChance[NPC_TALENT_1H] >= 100) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_01 " );	// You learned all about sword fighting. I can't show you anymore!
		DIA_Cedric_Teach_permanent = TRUE;
	};
	if((hero.attribute[ATR_REGENERATEMANA] >= 100) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		AI_Output(self,other, " DIA_Cedric_Teach_12_91 " );	// Shield training is over! I taught you everything I knew myself.
		DIA_Cedric_Teach_Shield_permanent = TRUE;
	};
	if((DIA_Cedric_Teach_permanent == FALSE) || (DIA_Cedric_Teach_Shield_permanent == FALSE))
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);

		if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
			Info_AddChoice(DIA_Cedric_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
		};
		if((CedricTeachShield == TRUE) && (DIA_Cedric_Teach_Shield_permanent == FALSE))
		{
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney1,DIA_Cedric_Teach_ShieldNoMoney_1);
			Info_AddChoice(DIA_Cedric_Teach,PRINT_ShieldNoMoney5,DIA_Cedric_Teach_ShieldNoMoney_5);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
	};
};

instance DIA_Cedric_PICKPOCKET(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 900;
	condition = DIA_Cedric_PICKPOCKET_Condition;
	information = DIA_Cedric_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Cedric_PICKPOCKET_Condition()
{
	return  C_Robbery ( 37 , 55 );
};

func void DIA_Cedric_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,Dialog_Back,DIA_Cedric_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cedric_PICKPOCKET_DoIt);
};

func void DIA_Cedric_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};

func void DIA_Cedric_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};
