

instance DIA_Ruga_EXIT(C_Info)
{
	npc = Mil_317_Wrinkle;
	nr = 999;
	condition = DIA_Ruga_EXIT_Condition;
	information = DIA_Ruga_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ruga_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ruga_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ruga_PICKPOCKET(C_Info)
{
	npc = Mil_317_Wrinkle;
	nr = 900;
	condition = DIA_Ruga_PICKPOCKET_Condition;
	information = DIA_Ruga_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Ruga_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_03) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ruga_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ruga_PICKPOCKET);
	Info_AddChoice(DIA_Ruga_PICKPOCKET,Dialog_Back,DIA_Ruga_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ruga_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Ruga_PICKPOCKET_DoIt);
};

func void DIA_Ruga_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_City_Tower_03,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ruga_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Ruga_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ruga_PICKPOCKET);
};


instance DIA_Ruga_Hello (C_Info)
{
	npc = Mil_317_Wrinkle;
	nr = 2;
	condition = DIA_Ruga_Hallo_Condition;
	information = DIA_Ruga_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ruga_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ruga_Hello_Info()
{
	AI_Output(other,self, " DIA_Ruga_Hallo_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Ruga_Hallo_11_01 " );	// I teach guys crossbow shooting and help them become more agile.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Ruga, the city guard, can help me increase my dexterity and teach me how to use a crossbow. But to do that, I must serve the king. " );
};


instance DIA_Ruga_Train(C_Info)
{
	npc = Mil_317_Wrinkle;
	nr = 5;
	condition = DIA_Ruga_Train_Condition;
	information = DIA_Ruga_Train_Info;
	permanent = TRUE;
	description = " Can you train me? " ;
};


func int DIA_Ruga_Train_Condition()
{
	if (Ruga_TeachCrossbow ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Ruga_Train_Info()
{
	AI_Output(other,self, " DIA_Ruga_Train_15_00 " );	// Can you train me?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Ruga_Train_11_01 " );	// Of course. If you have enough experience, I am ready to help you.
		AI_Output(self,other, " DIA_Ruga_Train_11_02 " );	// But you need to understand that dexterity and shooting are inseparable from each other, like a crossbow and an arrow. One...
		AI_Output(other,self, " DIA_Ruga_Train_15_03 " );	// ... worth nothing without the other. I understand.
		Ruga_TeachCrossbow = TRUE ;
		Ruga_TeachDEX = TRUE ;
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Ruga_Train_11_04 " );	// Get out of my sight, mercenary.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Ruga_Train_11_05 " );	// No. I only train people who are in the service of the king. No one else.
		AI_Output(self,other, " DIA_Ruga_Train_11_06 " );	// But we always need good people. So if you want to join the militia, talk to Lord Andre.
	};
};


instance DIA_Ruga_Teach(C_Info)
{
	npc = Mil_317_Wrinkle;
	nr = 100;
	condition = DIA_Ruga_Teach_Condition;
	information = DIA_Ruga_Teach_Info;
	permanent = TRUE;
	description = " Show me how to shoot a crossbow. " ;
};


var int DIA_Ruga_Teach_permanent;

func int DIA_Ruga_Teach_Condition()
{
	if ((Ruga_TeachCrossbow ==  TRUE ) && (DIA_Ruga_Teach_permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Ruga_Teach_Info()
{
	AI_Output(other,self, " DIA_Ruga_Teach_15_00 " );	// Show me how to shoot a crossbow.
	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Ruga_Teach_1H_5);
};

func void DIA_Ruga_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 90)
	{
		AI_Output(self,other, " DIA_Ruga_Teach_11_00 " );	// I have nothing more to teach you. You'd better look for another teacher.
		DIA_Ruga_Teach_permanent = TRUE ;
	};
	Info_ClearChoices(DIA_Ruga_Teach);
};

func void DIA_Ruga_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,90);
	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Ruga_Teach_1H_5);
};

func void DIA_Ruga_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,90);
	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Ruga_Teach_1H_5);
};


instance DIA_Ruga_TEACHDEX (C_Info)
{
	npc = Mil_317_Wrinkle;
	nr = 101;
	condition = DIA_Ruga_TEACHDEX_Condition;
	information = DIA_Ruga_TEACHDEX_Info;
	permanent = TRUE;
	description = " I want to become more dexterous. " ;
};


var int DIA_Ruga_TEACHDEX_permanent;

func int DIA_Ruga_TEACHDEX_Condition()
{
	if ((Ruga_TeachDEX ==  TRUE ) && (DIA_Ruga_TeachDEX_permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Ruga_TEACHDEX_Info()
{
	AI_Output(other,self, " DIA_Ruga_TEACHDEX_15_00 " );	// I want to become more dexterous.
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other, ATR_DEXTERITY )),DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other, ATR_DEXTERITY ) *  5 ),DIA_Ruga_TEACHDEX_5);
};

func void DIA_Ruga_TEACHDEX_BACK()
{
	if(other.attribute[ATR_DEXTERITY] >= T_LOW)
	{
		AI_Output(self,other, " DIA_Ruga_TEACHDEX_11_00 " );	// That's all I could teach you. If you want to become even more dexterous, you'd better look for another teacher.
		DIA_Ruga_TEACHDEX_permanent = TRUE ;
	};
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
};

func void DIA_Ruga_TEACHDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_LOW);
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other, ATR_DEXTERITY )),DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other, ATR_DEXTERITY ) *  5 ),DIA_Ruga_TEACHDEX_5);
};

func void DIA_Ruga_TEACHDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_LOW);
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other, ATR_DEXTERITY )),DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other, ATR_DEXTERITY ) *  5 ),DIA_Ruga_TEACHDEX_5);
};

