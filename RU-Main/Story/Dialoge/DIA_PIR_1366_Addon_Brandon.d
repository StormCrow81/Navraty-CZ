

instance DIA_Addon_Brandon_EXIT(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 999;
	condition = DIA_Addon_Brandon_EXIT_Condition;
	information = DIA_Addon_Brandon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Brandon_Hello(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 1;
	condition = DIA_Addon_Brandon_Hello_Condition;
	information = DIA_Addon_Brandon_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Brandon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_Brandon_Hello_04_00 " );	// Just look! Newbie.
	AI_Output(self,other, " DIA_Addon_Brandon_Hello_04_01 " );	// And besides, a land rat!
	AI_Output(self,other, " DIA_Addon_Brandon_Hello_04_02 " );	// You're still far from a real pirate.
};


instance DIA_Addon_Brandon_AnyNews(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 99;
	condition = DIA_Addon_Brandon_AnyNews_Condition;
	information = DIA_Addon_Brandon_AnyNews_Info;
	permanent = TRUE;
	description = " Anything new? " ;
};


func int DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_AnyNews_Info()
{
	AI_Output(other,self, " DIA_Addon_Brandon_AnyNews_15_00 " );	// Anything new?
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other, " DIA_Addon_Brandon_Alright_04_01 " );	// Probably. For example, I am injured. Do you have a healing elixir?
		}
		else if(C_AllCanyonRazorDead() == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_Brandon_Alright_04_02 " );	// What else? Will we finally hunt or not?
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Brandon_Alright_04_03 " );	// What kind of questions?! I don't think there's even one razortooth left in the whole damn canyon.
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg) && (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Addon_Brandon_AnyNews_04_04 " );	// Greg is back. Now everything must change.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Brandon_AnyNews_04_06 " );	// (conspiratorial) Guess a second...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_Addon_Brandon_AnyNews_04_07 " );	// (laughs) As far as I can see, no! Everything is old.
	};
};


instance DIA_Addon_Brandon_WannaLearn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_WannaLearn_Condition;
	information = DIA_Addon_Brandon_WannaLearn_Info;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output(other,self, " DIA_Addon_Brandon_WannaLearn_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Brandon_WannaLearn_04_01 " );	// Teach you? Certainly can! I can make you stronger and more agile.
	AI_Output(self,other, " DIA_Addon_Brandon_WannaLearn_04_02 " );	// But why should I do this?
	AI_Output(other,self, " DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00 " );	// Then I'll buy you a drink?
	AI_Output(self,other, " DIA_Addon_Brandon_WannaLearn_04_03 " );	// (chuckles) Not bad, son! Guessed it on the first try.
	AI_Output(self,other, " DIA_Addon_Brandon_WannaLearn_04_04 " );	// But don't you dare slip me some cheap booze.
	MIS_Brandon_BringHering = LOG_Running;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	Log_CreateTopic(TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BrandonBooze,LOG_Running);
	Log_AddEntry(TOPIC_Addon_BrandonBooze, " I should get Brandon a drink. Then he will agree to teach me. " );
};


instance DIA_Addon_Brandon_HoleGrog(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_HoleGrog_Condition;
	information = DIA_Addon_Brandon_HoleGrog_Info;
	description = " I'll bring you some grog. " ;
};


func int DIA_Addon_Brandon_HoleGrog_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output(other,self, " DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00 " );	// I'll bring you the grog.
	AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_01 " );	// Are you trying to poison me???
	AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_02 " );	// I won't touch this scum. Do you have any idea what it's made of?
	AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_03 " );	// No, you can only get good booze from Samuel!

	if(Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Brandon_Hello_15_05 " );	// Are you talking about his 'Quick Herring'?
		AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_04 " );	// Yes, that's exactly what I mean.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_05 " );	// Have you tried Samuel's special drink yet?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Еще нет.
		AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_06 " );	// So what are you waiting for? This stuff is a must try!
	};
	AI_Output(self,other, " DIA_Addon_Brandon_HoleGrog_04_08 " );	// I just love this mix!
	B_LogEntry(TOPIC_Addon_BrandonBooze, " Brandon's Grog is not enough. He wants 'Quick Herring'. Only Samuel has this drink. " );
};


instance DIA_Addon_Brandon_SchnellerHering (C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_SchnellerHering_Condition;
	information = DIA_Addon_Brandon_SchnellerHering_Info;
	description = " Take this 'Swift Herring'. " ;
};


func int DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn) && (Npc_HasItems(other,ItFo_Addon_SchnellerHering) > 0))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Получай.
	B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,1);
	B_UseItem(self,ItFo_Addon_SchnellerHering);
	AI_Output(self,other, " DIA_Addon_Brandon_GiveGrog_04_01 " );	// Ahh! Like liquid fire!
	B_LogEntry(TOPIC_Addon_BrandonBooze, " I gave Brandon his awful booze. Now he's ready to teach me. " );
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Brandon_Brand_Str;
var int Brandon_Brand_Dex;

instance DIA_Addon_Brandon_TeachPlayer(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 777;
	condition = DIA_Addon_Brandon_TeachPlayer_Condition;
	information = DIA_Addon_Brandon_TeachPlayer_Info;
	permanent = TRUE;
	description = " I'm ready to learn! " ;
};


func int DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_TeachPlayer_Info()
{
	AI_Output(other,self, " DIA_Addon_Francis_TeachPlayer_15_00 " );	// I'm ready to learn!
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Brandon_TeachPlayer_04_01 " );	// You gotta get me a decent drink first, son!
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Back()
{
	if(other.attribute[ATR_STRENGTH] > Brandon_Merke_Str)
	{
		AI_Output(self,other, " DIA_Addon_Brandon_TeachPlayer_Back_04_00 " );	// Great, son! You are already stronger.
	};
	if(other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex)
	{
		AI_Output(self,other, " DIA_Addon_Brandon_TeachPlayer_Back_04_01 " );	// The higher your dexterity, the more often you will hit the enemy.
	};
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};


instance DIA_Addon_Brandon_Hire (C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_Hire_Condition;
	information = DIA_Addon_Brandon_Hire_Info;
	permanent = FALSE;
	description = " You must help me. " ;
};


func int DIA_Addon_Brandon_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_Brandon_FollowMe_15_00 " );	// You have to help me.
	AI_Output(self,other, " DIA_Addon_Brandon_Anheuern_04_01 " );	// This is news to me. And who decided so?
	AI_Output(other,self, " DIA_Addon_Brandon_FollowMe_15_02 " );	// That's what Greg decided. We must exterminate the razor teeth in the canyon.
	AI_Output(self,other, " DIA_Addon_Brandon_Anheuern_04_03 " );	// (chuckles) Finally, something is happening here!
	AI_Output(self,other, " DIA_Addon_Brandon_Anheuern_04_04 " );	// Well, let's go. The sooner we deal with them, the sooner we can return.
};


instance DIA_Addon_Brandon_ComeOn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_ComeOn_Condition;
	information = DIA_Addon_Brandon_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_Brandon_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Brandon_Anheuern));
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_Brandon_Weiter_15_00 " );	// Come with me.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Brandon_ComeOn_04_02 " );	// Let's go back a little first.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Иду!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_Brandon_GoHome(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_GoHome_Condition;
	information = DIA_Addon_Brandon_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_Brandon_GoHome_Condition()
{
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_Brandon_DontNeedYou_15_00 " );	// I don't need you anymore.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//Хорошо.
	AI_Output(self,other, " DIA_Addon_Brandon_GoHome_04_02 " );	// Maybe we'll have a drink with you sometime.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Brandon_TooFar(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 14;
	condition = DIA_Addon_Brandon_TooFar_Condition;
	information = DIA_Addon_Brandon_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Brandon_TooFar_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (C_GregsPiratesTooFar() ==  TRUE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Brandon_TooFar_Info()
{
	AI_Output(self,other, " DIA_Addon_Brandon_TooFar_04_00 " );	// Enough! Do you want to exterminate all the animals on the island?
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other, " DIA_Addon_Brandon_TooFar_04_01 " );	// We're heading back to camp.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Brandon_TooFar_04_02 " );	// I'm going back to camp.
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

