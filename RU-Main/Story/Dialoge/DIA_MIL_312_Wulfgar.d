

instance DIA_Wulfgar_EXIT(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 999;
	condition = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instances DIA_Wulfgar_Hello (C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Hallo_Condition;
	information = DIA_Wulfgar_Hallo_Info;
	permanent = FALSE;
	description = " What are your responsibilities? " ;
};

func int DIA_Wulfgar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_Hello_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_Hallo_15_00 " );	// What are your responsibilities?
	AI_Output(self,other, " DIA_Wulfgar_Hallo_04_01 " );	// Those boobies swing their swords like peasants.
	AI_Output(self,other, " DIA_Wulfgar_Hallo_04_02 " );	// But when they are trained under my guidance, each of them will become a serious warrior!
};

instance DIA_Wulfgar_WannaJoin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_WannaJoin_Condition;
	information = DIA_Wulfgar_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join the militia! " ;
};


func int DIA_Wulfgar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_WannaJoin_15_00 " );	// I want to join the militia!
	AI_Output(self,other, " DIA_Wulfgar_WannaJoin_04_01 " );	// Yes? Are you a citizen of this city?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Нет.
		AI_Output(self,other, " DIA_Wulfgar_WannaJoin_04_03 " );	// Then Lord Andre won't accept you.
		AI_Output(self,other, " DIA_Wulfgar_WannaJoin_04_04 " );	// Of course you can talk to him, but I don't think he'll make an exception for you.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Да.
		AI_Output(self,other, " DIA_Wulfgar_WannaJoin_04_06 " );	// Then talk to Lord Andre. He decides who is accepted and who is not.
	};
};


instance DIA_Wulfgar_AboutMiliz(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 3;
	condition = DIA_Wulfgar_AboutMiliz_Condition;
	information = DIA_Wulfgar_AboutMiliz_Info;
	permanent = FALSE;
	description = " What's it like to be in the militia? " ;
};


func int DIA_Wulfgar_AboutMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_AboutMiliz_15_00 " );	// What is it like to serve in the militia?
	AI_Output(self,other, " DIA_Wulfgar_AboutMiliz_04_01 " );	// Lord Andre is in command now.
	AI_Output(self,other, " DIA_Wulfgar_AboutMiliz_04_02 " );	// Previously, the militia was subordinate to the governor. (laughs) He had no idea what we were doing here.
	AI_Output(self,other, " DIA_Wulfgar_AboutMiliz_04_03 " );	// But Lord Andre knows his stuff. He cares about his people.
	AI_Output(self,other, " DIA_Wulfgar_AboutMiliz_04_04 " );	// Everyone who joins the militia gets good armor and good weapons.
	AI_Output(self,other, " DIA_Wulfgar_AboutMiliz_04_05 " );	// And if you do your job well, you can expect to be rewarded. Lord Andre gives a reward for every criminal caught.
};


instance DIA_Wulfgar_CanYouTrain(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 4;
	condition = DIA_Wulfgar_CanYouTrain_Condition;
	information = DIA_Wulfgar_CanYouTrain_Info;
	permanent = FALSE;
	description = " Can you teach me sword fighting? " ;
};


func int DIA_Wulfgar_CanYouTrain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_CanYouTrain_15_00 " );	// Can you teach me sword fighting?
	AI_Output(self,other, " DIA_Wulfgar_CanYouTrain_04_01 " );	// By order of Lord Andre, we train all who are able to defend the city.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Wulfgar_CanYouTrain_04_02 " );	// However, this does not apply to mercenaries. Forget it.
	}
	else
	{
		AI_Output(self,other, " DIA_Wulfgar_CanYouTrain_04_03 " );	// But this only applies to combat training. All other types of training are for the militia only.
		AI_Output(self,other, " DIA_Wulfgar_CanYouTrain_04_04 " );	// Can you hold a sword?
		AI_Output(other,self, " DIA_Wulfgar_CanYouTrain_15_05 " );	// I think so...
		AI_Output(self,other, " DIA_Wulfgar_CanYouTrain_04_06 " );	// (sighs) Okay, you can start whenever you want.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher, " Wulfgar the city guard can teach me the art of one-handed and two-handed weapons. " );
		Wulfgar_Teach1H = TRUE;
	};
};


instance DIA_Wulfgar_Advantage(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 5;
	condition = DIA_Wulfgar_Advantage_Condition;
	information = DIA_Wulfgar_Advantage_Info;
	permanent = FALSE;
	description = " What are the benefits of a two-handed weapon? " ;
};


func int DIA_Wulfgar_Advantage_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_Advantage_15_00 " );	// What are the advantages of two-handed weapons?
	AI_Output(self,other, " DIA_Wulfgar_Advantage_04_01 " );	// It's simple. With a one-handed weapon, you're faster. This can be a significant advantage in combat.
	AI_Output(self,other, " DIA_Wulfgar_Advantage_04_02 " );	// Two-handed weapons are heavier and slow you down. When fighting, they need to calculate their actions one step ahead, but it deals more damage.
};

instance DIA_Wulfgar_Teach(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 7;
	condition = DIA_Wulfgar_Teach_Condition;
	information = DIA_Wulfgar_Teach_Info;
	permanent = TRUE;
	description = " Let's start learning. " ;
};

func int DIA_Wulfgar_Teach_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Teach_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_Teach_15_00 " );	// Let's start training.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Wulfgar_Add_04_00 " );	// I don't train mercenaries!
	}
	else
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
		{
			AI_Output(self,other, " DIA_Wulfgar_Add_04_01 " );	// Of course, dear.
		};

		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

		if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
		{
			Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
		};
	};
};

func void DIA_Wulfgar_Teach_Back()
{
	Info_ClearChoices(DIA_Wulfgar_Teach);
};

func void DIA_Wulfgar_Teach_RegenStam()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_03 " );	// Teach me faster stamina recovery.

	cost = 10 ;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Tutorial: Accelerated Stamina Regeneration " );
		VATRAS_TEACHREGENSTAM = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Wulfgar_Teach);
	Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
};

func void DIA_Wulfgar_Teach_1H_1()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
			{
				Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
			{
				Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_1H_5()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
			{
				Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
			{
				Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_2H_1()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
			{
				Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if ((Chapter >=  2 ) && ( BATRAS_TEACHREGENSTAM  ==  FALSE ) && ((other.guild ==  GIL_MIL ) || (other.guild ==  GIL_PAL )))
			{
				Info_AddChoice(DIA_Wulfgar_Teach, " Stamina Regeneration (Training Points: 10, Cost: 5000 Coins) " ,DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_2H_5()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
		};
	};
};

func void dia_wulfgar_teach_stamina_1()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,1))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_stamina_5()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,5))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_hp_1()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_hp_5()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};


instance DIA_Wulfgar_AlsMil(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_AlsMil_Condition;
	information = DIA_Wulfgar_AlsMil_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_AlsMil_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AlsMil_Info()
{
	AI_Output(self,other, " DIA_Wulfgar_AlsMil_04_00 " );	// So Lord Andre has accepted you!
	AI_Output(self,other, " DIA_Wulfgar_AlsMil_04_01 " );	// I hope you train here regularly.
	AI_Output(self,other, " DIA_Wulfgar_AlsMil_04_02 " );	// Ruga will teach you how to use a crossbow, and Mortis will help you become stronger.
	AI_Output(self,other, " DIA_Wulfgar_AlsMil_04_03 " );	// But the most important thing is to learn how to properly hold your sword.
	AI_Output(self,other, " DIA_Wulfgar_AlsMil_04_04 " );	// I'll make a great warrior out of you!
};


instance DIA_Wulfgar_Bonus(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_Bonus_Condition;
	information = DIA_Wulfgar_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bonus_Info()
{
	AI_Output(self,other, " DIA_Wulfgar_Bonus_04_00 " );	// Early bird? I'm usually alone at this time of the day. But since you're here, you can practice.
	AI_Output(self,other, " DIA_Wulfgar_Bonus_04_01 " );	// Be careful. You can trick some opponents if you dodge and then attack at the right moment.
	AI_Output(self,other, " DIA_Wulfgar_Bonus_04_02 " );	// Keep this in mind for your next fight!

	if(other.HitChance[NPC_TALENT_1H] >= other.HitChance[NPC_TALENT_2H])
	{
		B_RaiseFightTalent_Bonus(other,NPC_TALENT_1H,1);
	}
	else
	{
		B_RaiseFightTalent_Bonus(other,NPC_TALENT_2H,1);
	};
};


instance DIA_Wulfgar_PICKPOCKET(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 900;
	condition = DIA_Wulfgar_PICKPOCKET_Condition;
	information = DIA_Wulfgar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wulfgar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 58 , 80 );
};

func void DIA_Wulfgar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,Dialog_Back,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

instance DIA_Wulfgar_Bandits(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Condition;
	information = DIA_Wulfgar_Bandits_Info;
	permanent = FALSE;
	description = " Do you have any errands for me? " ;
};

func int DIA_Wulfgar_Bandits_Condition()
{
	if ((hero.guild == GIl_MIL) && (MY_Other_REDLIGHT ==  LOG_SUCCESS ) && (MY_Other_Peck ==  LOG_SUCCESS ) && (DexterIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Info()
{
	AI_Output(other,self, " DIA_Wulfgar_Bandits_01_00 " );	// Do you have any errands for me?
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_01 " );	// Well, since you're in the city militia now, there's a job for you.
	AI_Output(other,self, " DIA_Wulfgar_Bandits_01_02 " );	// What should be done?
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_03 " );	// (seriously) Listen carefully. Recently, bandits have made several attacks on nearby farms.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_04 " );	// We, of course, managed to arrive in time to help and repel their attack. But something else worries me.
	AI_Output(other,self, " DIA_Wulfgar_Bandits_01_05 " );	// What exactly?
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_06 " );	// They acted too organized for simple bandits!
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_07 " );	// We managed to interrogate one of them.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_08 " );	// And according to his words, there are several large bandit groups scattered around Khorinis now.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_09 " );	// Unfortunately, he didn't have time to tell us exactly where their lairs are.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_10 " );	// Therefore, I entrust this task to you.
	AI_Output(other,self, " DIA_Wulfgar_Bandits_01_11 " );	// But it will be difficult for me to cope with the whole gang alone!
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_12 " );	// I'm not asking you to do this. It will be easy enough to track them down.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_13 " );	// And the guys and I will make sure they all end up on the gallows later!
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_14 " );	// But most importantly, we need to understand who exactly is coordinating their actions.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_15 " );	// Without this, all our efforts will be in vain.
	AI_Output(other,self, " DIA_Wulfgar_Bandits_01_16 " );	// Okay. I will try to do everything in my power. What farms were attacked?
	AI_Output(self,other, " DIA_Wulfgar_Bandits_01_17 " );	// To Akil and Lobart's farm. So for starters, it’s worth starting the search for bandits there.
	MIS_WulfgarBandits = LOG_Running;
	Log_CreateTopic(TOPIC_WulfgarBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WulfgarBandits,LOG_Running);
	B_LogEntry(TOPIC_WulfgarBandits, " Wulfgar has assigned me to find the bandits who attacked Akil and Lobart's farms. He wants to know who exactly is coordinating them. " );
};

instance DIA_Wulfgar_Bandits_Letter(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Letter_Condition;
	information = DIA_Wulfgar_Bandits_Letter_Info;
	permanent = FALSE;
	description = " I have a letter for the bandit leader. " ;
};

func int DIA_Wulfgar_Bandits_Letter_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_DexterOrder) >= 1) && (Npc_HasItems(other,ItWr_DexTrait) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Letter_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Wulfgar_Bandits_Letter_01_00 " );	// I have a letter for the bandit leader.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_01 " );	// Let me take a look at it. Faster!
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_02");	//Держи.
	B_GiveInvItems(other,self,ItWr_DexterOrder,1);
	Npc_RemoveInvItems(self,ItWr_DexterOrder,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_03 " );	// This was not enough! So there is a traitor among us.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_04 " );	// Good news! Now it is clear why they acted so harmoniously.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_05 " );	// After all, they knew in advance about all our plans and actions.
	AI_Output(other,self, " DIA_Wulfgar_Bandits_Letter_01_06 " );	// And what are we going to do now?
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_07 " );	// (terribly) We need to figure out this scoundrel at any cost!
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_08 " );	// Otherwise, sooner or later we will all have a hard time.
	AI_Output(other,self, " DIA_Wulfgar_Bandits_Letter_01_09 " );	// How do we do this?
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_10 " );	// I'm sure the person who wrote this letter must have the right information.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_11 " );	// Find him and interrogate him. But do not kill until you know the name of the traitor.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_12 " );	// Do you understand?
	AI_Output(other,self, " DIA_Wulfgar_Bandits_Letter_01_13 " );	// Yes, everything is very clear.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Letter_01_14 " );	// Then hurry up - now every minute is precious.
	WulfgarSendDexter = TRUE;
	B_LogEntry(TOPIC_WulfgarBandits, " Wulfgar was beside himself with anger when he learned that a traitor had appeared among the militia. He instructed me to find the author of the letter and beat the name of this bastard out of him. " );
};

instance DIA_Wulfgar_Bandits_Done(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Done_Condition;
	information = DIA_Wulfgar_Bandits_Done_Info;
	permanent = FALSE;
	description = " Take a look at this letter. " ;
};

func int DIA_Wulfgar_Bandits_Done_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_DexTrait) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Wulfgar_Bandits_Done_01_00 " );	// Take a look at this letter.
	B_GiveInvItems(other,self,ItWr_DexTrait,1);
	Npc_RemoveInvItems(self,ItWr_DexTrait,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_01 " );	// So that's who this rat is! I thought so.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_02 " );	// Now it's clear where this bastard has so much gold from that he litters it in a tavern and a brothel.
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_03 " );	// But his sweet life came to an end. I will immediately order his arrest!
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_04 " );	// I thank you on behalf of the entire militia!
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_05 " );	// And as proof of my words - take this armor.
	B_GiveInvItems(self,other,ItAr_MIL_M,1);
	AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_06 " );	// You rightfully deserve them, soldier!
	MIS_WulfgarBandits = LOG_Success;
	SHOW_ITAR_MIL_M = TRUE;
	Log_SetTopicStatus(TOPIC_WulfgarBandits,LOG_Success);
	B_LogEntry(TOPIC_WulfgarBandits, " I gave Wulfgar Dexter's letter written by the militia Peck. Now this guy is in trouble. Well, no one likes traitors anywhere. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(MIL_324_Peck,"Jail");
	AI_Teleport(MIL_324_Peck,"NW_CITY_HABOUR_KASERN_HALVOR");
};
