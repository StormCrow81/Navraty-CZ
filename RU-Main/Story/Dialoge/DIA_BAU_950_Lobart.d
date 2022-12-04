
instance DIA_Lobart_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_EXIT_Condition;
	information = DIA_Lobart_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Lobart_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Lobart_Hello (C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_Hallo_Condition;
	information = DIA_Lobart_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lobart_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_Hallo_05_00 " );	// Why are you hanging around on my farm?
		AI_Output(self,other, " DIA_Lobart_Hallo_05_01 " );	// Whose side are you on? On the side of the rebel farmers or on the side of the king?
		Info_ClearChoices(DIA_Lobart_Hello);
		Info_AddChoice(DIA_Lobart_Hallo, " I don't understand... " ,DIA_Lobart_Hallo_What);
		Info_AddChoice(DIA_Lobart_Hallo, " I stand with the King! " ,DIA_Lobart_Hallo_ForTheKing);
		Info_AddChoice(DIA_Lobart_Hallo, " I'm with the Peasants! " ,DIA_Lobart_Hallo_ForThePeasants);
	}
	else
	{
		AI_Output(self,other, " DIA_Lobart_Hallo_05_02 " );	// How can I help?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output(other,self, " DIA_Lobart_Hallo_ForThePeasants_15_00 " );	// I'm with the peasants!
	AI_Output(self,other, " DIA_Lobart_Hallo_ForThePeasants_05_01 " );	// Good! That damn troublemaker Onar will drive us all to the grave!
	AI_Output(self,other, " DIA_Lobart_Hallo_ForThePeasants_05_02 " );	// How long do you think the paladins will be here?
	AI_Output(self,other, " DIA_Lobart_Hallo_ForThePeasants_05_03 " );	// After what Onar did, the whole city is buzzing.
	Lobart_AgainstKing = TRUE;
	Info_ClearChoices(DIA_Lobart_Hello);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output(other,self, " DIA_Lobart_Hallo_ForTheKing_15_00 " );	// I'm for the king!
	AI_Output(self,other, " DIA_Lobart_Hallo_ForTheKing_05_01 " );	// 'For the king!' As were the city guards when they took half of my sheep.
	AI_Output(self,other, " DIA_Lobart_Hallo_ForTheKing_05_02 " );	// But where, one wonders, are these bastards when you need protection from bandits? What will they do when the orcs invade?
	AI_Output(self,other, " DIA_Lobart_Hallo_ForTheKing_05_03 " );	// I'll tell you: they will hide behind the thick city walls.
	AI_Output(self,other, " DIA_Lobart_Hallo_ForTheKing_05_04 " );	// So leave me alone, and take your "King" with you.
	Lobart_AgainstKing = FALSE ;
	Info_ClearChoices(DIA_Lobart_Hello);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output(other,self, " DIA_Lobart_Hallo_What_15_00 " );	// I don't understand...
	AI_Output(self,other, " DIA_Lobart_Hallo_What_05_01 " );	// What?! Don't try to fool me, boy! I want to know which side you're on! Its an easy question.
};


instance DIA_Lobart_CLOTHING (C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_CLOTHING_Condition;
	information = DIA_Lobart_CLOTHING_Info;
	permanent = FALSE;
	description = " I need some decent clothes! " ;
};


func int DIA_Lobart_CLOTHING_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lobart_CLOTHING_Info()
{
	AI_Output(other,self, " DIA_Lobart_KLEIDUNG_15_00 " );	// I need decent clothes!
	AI_Output(self,other, " DIA_Lobart_KLEIDUNG_05_01 " );	// I can give you decent peasant work clothes.
	AI_Output(self,other, " DIA_Lobart_KLEIDUNG_05_02 " );	// Can you pay for it?
	Log_CreateTopic(TOPIC_Clothes, LOG_MISSION );
	Log_SetTopicStatus(TOPIC_Clothes,LOG_Running);
	B_LogEntry(TOPIC_Kleidung, " Farmer Lobart is willing to sell me work clothes. " );

	if(!Npc_KnowsInfo(other,DIA_Lobart_WorkNOW))
	{
		AI_Output(self,other, " DIA_Lobart_KLEIDUNG_05_03 " );	// I could lower the price... if you're willing to work.
		B_LogEntry(TOPIC_Kleidung, " Lobart can lower the price of clothes if I work on his farm. The more jobs I do, the cheaper the clothes will cost me. " );
	};
};


instance DIA_Lobart_BuyClothes(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_BuyClothes_Condition;
	information = DIA_Lobart_BuyClothes_Info;
	permanent = TRUE;
	description = " How much do these work clothes cost? " ;
};

func int DIA_Lobart_BuyClothes_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_CLOTHING) && (Lobart_Clothing_Sold ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BuyClothes_Info()
{
	value_LobartsArmor = 80 ;
	AI_Output(other,self, " DIA_Lobart_BuyClothes_15_00 " );	// How much do these work clothes cost?
	AI_Output(self,other, " DIA_Lobart_BuyClothes_05_01 " );	// Well, Let's see...

	if(Lobart_AgainstKing == TRUE)
	{
		value_LobartsArmor = value_LobartsArmor -  10 ;
	};
	if(MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lobart_BuyClothes_05_02 " );	// You worked for me in the field.
		value_LobartsArmor = value_LobartsArmor -  10 ;
	};
	if (MIS_Hilda_PafanneKaufen ==  LOG_SUCCESS )
	{
		AI_Output(self,other, " DIA_Lobart_BuyClothes_05_03 " );	// You helped my wife.
		value_LobartsArmor = value_LobartsArmor -  10 ;
	};
	if(MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lobart_BuyClothes_05_04 " );	// Vino says you helped him a lot. Which means something - he usually doesn't get along very well with day laborers.
		value_LobartsArmor = value_LobartsArmor -  10 ;
	};
	if(MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lobart_BuyClothes_05_05 " );	// Maleth says you drove the bandits away. Those bastards gave us a lot of problems. Thank you for that!
		value_LobartsArmor = value_LobartsArmor -  10 ;
	};

	B_Say_Gold(self,other,Wert_LobartsRuestung);

	if (Value_LobartsArmor ==  30 )
	{
		AI_Output(self,other, " DIA_Lobart_GOLD_05_06 " );	// And I won't sell it for cheaper.
		B_LogEntry(TOPIC_Kleidung, " But he won't sell me less than thirty gold coins. " );
	};
	Info_ClearChoices(DIA_Lobart_BuyClothes);
	Info_AddChoice(DIA_Lobart_BuyClothes, " It's still too expensive for me. " ,DIA_Lobart_BuyClothes_NotYet);
	Info_AddChoice(DIA_Lobart_BuyClothes, " Give them to me then. " ,DIA_Lobart_BuyClothes_BUY);
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output(other,self, " DIA_Lobart_BuyClothes_BUY_15_00 " );	// Let's get those work clothes over here then.

	if (B_GiveInvItems(other,self,ItMi_Gold,Wert_Lobart's armor))
	{
		if(Npc_HasItems(self,ITAR_Bau_L) > 0)
		{
			AI_Output(self,other, " DIA_Lobart_BuyClothes_BUY_05_01 " );	// Okay, my boy. Above all, I value decency. Here you are!
			B_GiveInvItems(self,other,ITAR_Bau_L,1);
		}
		else
		{
			AI_Output(self,other, " DIA_Lobart_BuyClothes_BUY_05_01 " );	// Okay, my boy. Above all, I value decency. Here you are!
			CreateInvItems(self,ITAR_Bau_L,1);
			B_GiveInvItems(self,other,ITAR_Bau_L,1);
		};

		Lobart_clothing_sold = TRUE ;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
	}
	else
	{
		AI_Output(self,other, " DIA_Lobart_BuyClothes_BUY_05_04 " );	// You don't have enough gold!
	};

	Info_ClearChoices(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output(other,self, " DIA_Lobart_BuyClothes_NotYet_15_00 " );	// This is still too expensive for me.
	AI_Output(self,other, " DIA_Lobart_BuyClothes_NotYet_05_01 " );	// If you say so...
	Info_ClearChoices(DIA_Lobart_BuyClothes);
};


instance DIA_Lobart_AufstandInfo (C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_AufstandInfo_Condition;
	information = DIA_Lobart_AufstandInfo_Info;
	permanent = FALSE;
	description = " How are things going here? " ;
};


func int DIA_Lobart_AufstandInfo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lobart_Hello ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info()
{
	AI_Output(other,self, " DIA_Lobart_AufstandInfo_15_00 " );	// How are things going here?
	AI_Output(self,other, " DIA_Lobart_AufstandInfo_05_01 " );	// What a stupid question! We are on the verge of a civil war!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_AufstandInfo_05_02 " );	// Until recently, farmers considered the share given to the city to be quite fair.
		AI_Output(self,other, " DIA_Lobart_AufstandInfo_05_03 " );	// But ever since the paladins came to Khorinis, the city guards have been visiting us more and more often - they will take everything we have soon.
		AI_Output(self,other, " DIA_Lobart_AufstandInfo_05_04 " );	// If this continues, we'll have nothing left for ourselves.
	};
	AI_Output(self,other, " DIA_Lobart_AufstandInfo_05_05 " );	// Some farmers are rebelling! Onar was the first of them!
};


instance DIA_Lobart_OnarStory(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_OnarStory_Condition;
	information = DIA_Lobart_OnarStory_Info;
	permanent = FALSE;
	description = " Tell me more about this Onar... " ;
};


func int DIA_Lobart_OnarStory_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lobart_DistanceInfo ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info()
{
	AI_Output(other,self, " DIA_Lobart_OnarStory_15_00 " );	// Tell me more about this Onar...
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Lobart_OnarStory_05_01 " );	// You're a mercenary, aren't you? What can I tell you about your boss that you don't know?
	}
	else
	{
		AI_Output(self,other, " DIA_Lobart_OnarStory_05_02 " );	// Onar is the biggest farmer in this area. He broke off relations with the city.
		AI_Output(self,other, " DIA_Lobart_OnarStory_05_03 " );	// Then he hired mercenaries to keep the city guards off of his land!
		AI_Output(self,other, " DIA_Lobart_OnarStory_05_04 " );	// I suppose I can't blame him for that.
		AI_Output(self,other, " DIA_Lobart_OnarStory_05_05 " );	// Be that as it may, no royal loyallist can set foot on his land.
	};
};


instance DIA_Lobart_SldInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_SldInfo_Condition;
	information = DIA_Lobart_SldInfo_Info;
	permanent = FALSE;
	description = " Who are these mercenaries hired by Onar? " ;
};


func int DIA_Lobart_SldInfo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lobart_OnarStory ) && ( ( hero . guild !=  GIL_SLD ) && ( hero . guild !=  GIL_DJG )) && ( Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info()
{
	AI_Output(other,self, " DIA_Lobart_SldInfo_15_00 " );	// And who are these mercenaries hired by Onar?
	AI_Output(self,other, " DIA_Lobart_SldInfo_05_01 " );	// I don't know much about them. Presumably, most of them are former convicts from the colony.
	AI_Output(self,other, " DIA_Lobart_SldInfo_05_02 " );	// And what, one wonders, can be expected from men like that ...
};


instance DIA_Lobart_WhichSide(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WhichSide_Condition;
	information = DIA_Lobart_WhichSide_Info;
	permanent = FALSE;
	description = " What about you? Which side are you on? The peasants or the king? " ;
};


func int DIA_Lobart_WhichSide_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lobart_DistanceInfo ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info()
{
	AI_Output(other,self, " DIA_Lobart_WhichSide_15_00 " );	// What about you? Whose side are you on? The peasants or the king?
	AI_Output(self,other, " DIA_Lobart_WhichSide_05_01 " );	// I'm too close to the city to have a choice.
	AI_Output(self,other, " DIA_Lobart_WhichSide_05_02 " );	// That is for the best. I wouldn't know what to decide anyway.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_WhichSide_05_03 " );	// The king drains us dry, but Onar sends his mercenaries against anyone who does not want to join him.
		AI_Output(self,other, " DIA_Lobart_WhichSide_05_04 " );	// This is why most farmers are still undecided, but sooner or later they will have to choose one side or the other.
	};
};


instance DIA_Lobart_WorkNOW(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WorkNOW_Condition;
	information = DIA_Lobart_WorkNOW_Info;
	permanent = FALSE;
	description = " I'm looking for a job. " ;
};


func int DIA_Lobart_WorkNOW_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) || Npc_KnowsInfo(other,DIA_Lobart_CLOTHING))
	{
		if (chapter <  3 )
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info()
{
	AI_Output(other,self, " DIA_Lobart_WorkNOW_15_00 " );	// I'm looking for a job.
	AI_Output(self,other, " DIA_Lobart_WorkNOW_05_01 " );	// I don't need another permanent worker, but I can offer you a day job.
	AI_Output(self,other, " DIA_Lobart_WorkNOW_05_02 " );	// You can help on the field. Also, there is sure to be some work for you around here.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_WorkNOW_05_03 " );	// I can pay you in gold. Or give you decent clothes.
		AI_Output(self,other, " DIA_Lobart_WorkNOW_05_04 " );	// These clothes are quite expensive. I can't just give it to you, but I can sell it to you cheaper if you work for me.
		Log_CreateTopic(TOPIC_Clothes, LOG_MISSION );
		Log_SetTopicStatus(TOPIC_Clothes,LOG_Running);
		B_LogEntry(TOPIC_Kleidung, " Farmer Lobart is willing to sell me work clothes. He can lower the price of the clothes if I work on his farm. The more I make, the cheaper the clothes will cost me. " );
		if ((Npc_HasEquippedArmor(other) ==  FALSE ) || (Lobart_Clothes_Sold ==  TRUE ))
		{
			AI_Output(self,other, " DIA_Lobart_WorkNOW_05_05 " );	// Judging by the way you look, I'd say bring some clothes.
		}
		else
		{
			AI_Output(self,other, " DIA_Lobart_WorkNOW_05_06 " );	// But you already have clothes, so you'll probably want some gold.
		};
	};
	AI_Output(self,other, " DIA_Lobart_WorkNOW_05_07 " );	// The next job is to collect turnips in a small field behind the barn.
	Info_ClearChoices(DIA_Lobart_WorkNOW);
	Info_AddChoice(DIA_Lobart_WorkNOW, " Picking turnips? You must be joking! " ,DIA_Lobart_WorkNOW_WannaFoolMe);
	Info_AddChoice(DIA_Lobart_WorkNOW, " Alright... " ,DIA_Lobart_WorkNOW_Ok);
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Good...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_WorkNOW_Ok_05_01 " );	// Then hurry up before I change my mind.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	B_LogEntry(TOPIC_Rueben, " Farmer Lobart wants me to harvest turnips from the field. For this he will pay me gold or sell me clothes at a greatly reduced price. " );
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output(other,self, " DIA_Lobart_WorkNOW_WannaFoolMe_15_00 " );	// Picking turnips? You must be joking!
	AI_Output(self,other, " DIA_Lobart_WorkNOW_WannaFoolMe_05_01 " );	// A real man's job is not for the 'refined gentleman', is that it?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_WorkNOW_WannaFoolMe_05_02 " );	// Get your ass into the field or get off my farm!
	}
	else
	{
		AI_Output(self,other, " DIA_Lobart_WorkNOW_WannaFoolMe_05_03 " );	// I don't have another job for you right now.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	B_LogEntry(TOPIC_Rueben, " Farmer Lobart wants me to harvest turnips from the field. In exchange, he will sell me clothes at a greatly reduced price. " );
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};


instance DIA_Lobart_RuebenRunning(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_RuebenRunning_Condition;
	information = DIA_Lobart_RuebenRunning_Info;
	permanent = TRUE;
	description = " Here are your turnips! " ;
};


func int DIA_Lobart_RuebenRunning_Condition()
{
	if ((MIS_Lobart_Running == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >=  1 ) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info()
{
	AI_Output(other,self, " DIA_Lobart_RuebenRunning_15_00 " );	// Here are your turnips!

	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_01 " );	// Yeah, looks like you're not as much of a slacker as I thought.
		};
		if (Npc_IsDead(Hilda) ==  FALSE )
		{
			AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_02 " );	// Take it to my wife in the main house and tell her to cook it.
			MIS_Lobart_RuebenToHilda = LOG_Running;
			Log_CreateTopic(TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ruebenbringen,LOG_Running);
			B_LogEntry(TOPIC_Ruebenbringen, " I have to take the harvested turnips to Lobart's wife in the house. " );
		};

		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP(XP_LobartHolRueben);
		AI_Output(other,self, " DIA_Lobart_RuebenRunning_15_03 " );	// What about my reward?
		AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_04 " );	// I can give you five gold coins.

		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_05 " );	// ...or sell you clothes cheaper. What you choose?
		};
		Info_ClearChoices(DIA_Lobart_RuebenRunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(DIA_Lobart_RuebenRunning, " I'll take the discounted clothes! " ,DIA_Lobart_RuebenRunning_Billiger);
		};
		Info_AddChoice(DIA_Lobart_RuebenRunning, " Give me the five gold coins! " ,DIA_Lobart_RuebenRunning_Gold);
	}
	else
	{
		AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_06 " );	// I want a minimum of twenty turnips!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_07 " );	// Did you eat the rest?! I hope not, my boy, or else you can forget your wage!
			AI_Output(self,other, " DIA_Lobart_RuebenRunning_05_08 " );	// Get back to the field and bring me more! Work or I'll show you where the Field Raiders nest!
		};
		AI_StopProcessInfos(self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold()
{
	AI_Output(other,self, " DIA_Lobart_RuebenRunning_Gold_15_00 " );	// Give me five gold coins!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Here.
	B_GiveInvItems(self,other,ItMi_Gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Lobart_RuebenRunning_Gold_05_02 " );	// Don't spend it all in one place.
	};
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger()
{
	AI_Output(other,self, " DIA_Lobart_RuebenRunning_Billiger_15_00 " );	// Better sell me those clothes cheaper!
	AI_Output(self,other, " DIA_Lobart_RuebenRunning_Billiger_05_01 " );	// Good! I'll give it to you for ten gold pieces less.
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

var int LobartOut;

instance DIA_Lobart_MoreWork(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_MoreWork_Condition;
	information = DIA_Lobart_MoreWork_Info;
	permanent = TRUE;
	description = " Do you have any other work for me? " ;
};


func int DIA_Lobart_MoreWork_Condition()
{
	if (((MY_Lobart_Cell == LOG_Running) || (MY_Lobart_Cell ==  LOG_SUCCESS )) && (Chapter <  3 ) && (LobartOut ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lobart_MoreWork_Info()
{
	AI_Output(other,self, " DIA_Lobart_MoreWork_15_00 " );	// Do you have any other work for me?

	if(MIS_Lobart_Rueben == LOG_Running)
	{
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_01 " );	// Collect twenty turnips from the field, and we'll take it from there.
	}
	else  if (MIS_Lobart_Psicamp ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_03 " );	// Yes, there is something. This is more of a request than a job tho...
		AI_Output(other,self,"DIA_Lobart_MoreWork_05_04");	//Yes?
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_05 " );	// You see, some strange people recently settled near my farm.
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_06 " );	// They don't look like bandits, but they make me uncomfortable.
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_07 " );	// Try to find out who they are and why they came here.
		AI_Output(other,self, " DIA_Lobart_MoreWork_05_08 " );	// Where did you see them?
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_09 " );	// Over there, behind the hill, not far from the stone circle.
		AI_Output(other,self, " DIA_Lobart_MoreWork_05_10 " );	// Good. I'll be back soon.
		MIS_Lobart_Psicamp = LOG_Running;
		Log_CreateTopic(TOPIC_Lobart_Psicamp,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lobart_Psicamp,LOG_Running);
		B_LogEntry(TOPIC_Lobart_Psicamp, " Lobart is worried about strange people near his farm. I need to find out who they are. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Lobart_MoreWork_05_02 " );	// No, but you can ask my wife or the guys in the field. Perhaps they need help.
		LobartOut = TRUE;
	};
};

instance DIA_Lobart_Psicamp(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_Psicamp_Condition;
	information = DIA_Lobart_Psicamp_Info;
	description = " I found out who those people are. " ;
};

func int DIA_Lobart_Psicamp_Condition()
{
	if ((MY_Lobart_Psychamp == LOG_Running) && (MeetLobartPsicamp ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Psicamp_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Lobart_Psicamp_01_00 " );	// I found out who those people are.
	AI_Output(self,other, " DIA_Lobart_Psicamp_01_01 " );	// Yes? Who are they?
	AI_Output(other,self, " DIA_Lobart_Psicamp_01_02 " );	// Don't worry. They're ordinary bog collectors.
	AI_Output(other,self, " DIA_Lobart_Psicamp_01_03 " );	// I don't think they'll give you any trouble.
	AI_Output(self,other, " DIA_Lobart_Psicamp_01_04 " );	// Well, if that's the case, then there's no reason to worry. Thanks for helping me.
	MIS_Lobart_Psicamp = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Lobart_Psicamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_Lobart_Psicamp, " I told Lobart about the Fellowship acolytes. " );
};

instance DIA_Lobart_ANDREHELPLOBART(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_ANDREHELPLOBART_Condition;
	information = DIA_Lobart_ANDREHELPLOBART_Info;
	description = " Lord Andre sent me to you. " ;
};

func int DIA_Lobart_ANDREHELPLOBART_Condition()
{
	if(MIS_AndreHelpLobart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lobart_ANDREHELPLOBART_Info()
{
	AI_Output(other,self, " DIA_Lobart_ANDREHELPLOBART_15_00 " );	// Lord Andre sent me to you. Is there anything I can help you with?
	AI_Output(self,other, " DIA_Lobart_ANDREHELPLOBART_05_01 " );	// Yes, of course. I'm getting sick of these damned field predators.
	AI_Output(self,other, " DIA_Lobart_ANDREHELPLOBART_05_02 " );	// Get rid of them. I don't care how!
	Log_AddEntry(TOPIC_BecomeMIL, " Lobart's fields are infested with field predators. He wants me to drive them out. " );
	MIS_LobartKillBugs = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_BUGDEAD(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_BUGDEAD_Condition;
	information = DIA_Lobart_BUGDEAD_Info;
	permanent = TRUE;
	description = " I've dealt with those creatures! " ;
};


var int DIA_Lobart_BUGDEAD_noPerm;

func int DIA_Lobart_BUGDEAD_Condition()
{
	if((MIS_LobartKillBugs == LOG_Running) && (DIA_Lobart_BUGDEAD_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BUGDEAD_Info()
{
	if (Npc_IsDead(Lobarts_Giant_Bug1) && Npc_IsDead(Lobarts_Giant_Bug2) && Npc_IsDead(Lobarts_Giant_Bug3) && Npc_IsDead(Lobarts_Giant_Bug4) && Npc_IsDead(Lobarts_Giant_Bug5) && Npc_IsDead(Lobarts_Giant_Bug6) && Npc_IsDead(Lobarts_Giant_Bug7)
	{
		AI_Output(other,self, " DIA_Lobart_BUGDEAD_15_00 " );	// I've dealt with those creatures!
		AI_Output(self,other, " DIA_Lobart_BUGDEAD_05_01 " );	// Great. You're quite the exterminator. I will recommend you to my neighbors. Here, keep your earnings.
		B_StartOtherRoutine(Vino,"Start");
		B_StartOtherRoutine(LobartsBauer1,"Start");
		B_StartOtherRoutine(LobartsBauer2,"Start");
		if(SNIPSGETNUGGETS == FALSE)
		{
			B_StartOtherRoutine(snipes,"Start");
		};
		CreateInvItems(self,ItMi_Gold,20);
		B_GiveInvItems(self,other,ItMi_Gold,20);
		MIS_LobartKillBugs = LOG_SUCCESS;
		MIS_AndreHelpLobart = LOG_SUCCESS ;
		Log_AddEntry(TOPIC_BecomeMIL, " Lobart's Fields have been cleared of field predators. I've destroyed them all. " );
		DIA_Lobart_BUGDEAD_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Lobart_BUGDEAD_15_02 " );	// I think I've dealt with all the creatures!
		AI_Output(self,other, " DIA_Lobart_BUGDEAD_05_03 " );	// Don't try to fool me. I still see them. Either you kill them all, or you can forget about the money.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lobart_KAP3_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP3_EXIT_Condition;
	information = DIA_Lobart_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_DMT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 30;
	condition = DIA_Lobart_DMT_Condition;
	information = DIA_Lobart_DMT_Info;
	description = " How is your farm? " ;
};


func int DIA_Lobart_DMT_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Lobart_DMT_Info()
{
	AI_Output(other,self, " DIA_Lobart_DMT_15_00 " );	// How is your farm?
	AI_Output(self,other, " DIA_Lobart_DMT_05_01 " );	// This is unbearable.
	AI_Output(self,other, " DIA_Lobart_DMT_05_02 " );	// All of a sudden, some guys in black appeared and settled on the road and on my farm.
	Info_ClearChoices(DIA_Lobart_DMT);
	Info_AddChoice(DIA_Lobart_DMT,Dialog_Ende,DIA_Lobart_DMT_BACK);

	if((hero.guild == GIL_KDF) && (Vino_isAlive_Kap3 == TRUE))
	{
		AI_Output(self,other, " DIA_Lobart_DMT_05_03 " );	// They had a long conversation about something with Vino, and then disappeared with him.
		if(NpcObsessedByDMT_Vino == FALSE)
		{
			Info_AddChoice(DIA_Lobart_DMT, " Where did they take Vino? " ,DIA_Lobart_DMT_VinoWohin);
		};
		Info_AddChoice(DIA_Lobart_DMT, " What did they do with Vino? " ,DIA_Lobart_DMT_VinoWas);
	};
	if (Npc_IsDead(Hilda) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lobart_DMT_05_04 " );	// Shortly thereafter, my wife fell seriously ill again. She hardly gets out of bed. This often happens to her.
	};
	AI_Output(self,other, " DIA_Lobart_DMT_05_05 " );	// Everything went wrong!

	if((MIS_HealHilda != LOG_SUCCESS) && (Npc_IsDead(Hilda) == FALSE))
	{
		Info_AddChoice(DIA_Lobart_DMT, " Why don't you take your wife to the doctor? " ,DIA_Lobart_DMT_FrauHeilen);
	};

	Info_AddChoice(DIA_Lobart_DMT, " Why don't you do something about these men in black? " ,DIA_Lobart_DMT_hof);
	Info_AddChoice(DIA_Lobart_DMT, " Have you spoken to the men in black? " ,DIA_Lobart_DMT_spokeToThem);
};

func void DIA_Lobart_DMT_FrauHeilen()
{
	AI_Output(other,self, " DIA_Lobart_DMT_FrauHeilen_15_00 " );	// Why don't you take your wife to the doctor?
	AI_Output(self,other, " DIA_Lobart_DMT_FrauHeilen_05_01 " );	// We should go into town to see Vatras, but I can't leave while my farm is in such chaos.
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda, " Lobart's wife Hilda is sick, but Vatras may have medicine that can cure her. " );
	MIS_HealHilda = LOG_Running;
};

func void DIA_Lobart_DMT_BACK()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Lobart_DMT_spokeToThem()
{
	AI_Output(other,self, " DIA_Lobart_DMT_spokeToThem_15_00 " );	// Have you spoken to the men in black?
	AI_Output(self,other, " DIA_Lobart_DMT_spokeToThem_05_01 " );	// Of course. But they don't listen.
	AI_Output(self,other, " DIA_Lobart_DMT_spokeToThem_05_02 " );	// I think they're looking for someone.
};

func void DIA_Lobart_DMT_hof()
{
	AI_Output(other,self, " DIA_Lobart_DMT_hof_15_00 " );	// Why don't you do something about these men in black?
	AI_Output(self,other, " DIA_Lobart_DMT_hof_05_01 " );	// I'd love to. But I saw them burn someone alive. No thanks.
	AI_Output(self,other, " DIA_Lobart_DMT_hof_05_02 " );	// I don't want to risk my life!
};

func void DIA_Lobart_DMT_WineWas()
{
	AI_Output(other,self, " DIA_Lobart_DMT_VinoWas_15_00 " );	// What business do they have with Vino?
	AI_Output(self,other, " DIA_Lobart_DMT_VinoWas_05_01 " );	// They didn't say. They just took him away.
};

func void DIA_Lobart_DMT_VinoWohin()
{
	AI_Output(other,self, " DIA_Lobart_DMT_VinoWohin_15_00 " );	// Where did they take Vino?
	AI_Output(self,other, " DIA_Lobart_DMT_VinoWohin_05_01 " );	// They went up the hill.
};


instance DIA_Lobart_VINOTOT (C_Info)
{
	npc = BAU_950_Lobart;
	nr = 32;
	condition = DIA_Lobart_VINOTOT_Condition;
	information = DIA_Lobart_VINOTOT_Info;
	description = " Vino will not return. " ;
};


func int DIA_Lobart_VINOTOT_Condition()
{
	if ((Npc_IsDead(Wine) || (NpcObsessedByDMT_Wine ==  TRUE )) && Npc_KnowsInfo(other,DIA_Lobart_DMT) && (hero.guild ==  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_Lobart_VINOTOT_Info()
{
	AI_Output(other,self, " DIA_Lobart_VINOTOT_15_00 " );	// Vino won't come back.
	if (Npc_IsDead(Vino))
	{
		AI_Output(other,self, " DIA_Lobart_VINOTOT_15_01 " );	// He's dead.
	}
	else
	{
		AI_Output(other, self, " DIA_Lobart_VINOTOT_15_02 " );	// They drove him mad.
	};
	AI_Output(self,other, " DIA_Lobart_VINOTOT_05_03 " );	// Oh, Innos. I hope this whole nightmare ends soon.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lobart_PERM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 80;
	condition = DIA_Lobart_PERM_Condition;
	information = DIA_Lobart_PERM_Info;
	permanent = TRUE;
	description = " Take care of your farm! " ;
};


func int DIA_Lobart_PERM_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lobart_DMT) && (Kapitel >=  3 ) && (Npc_IsDead(OrcWarrior_Lobart1) && Npc_IsDead(OrcWarrior_Lobart2) && Npc_IsDead( OrcWarrior_Lobart3) && Npc_IsDead(OrcWarrior_Lobart4) && Npc_IsDead (OrcWarrior_Lobart6)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_PERM_Info()
{
	AI_Output(other,self, " DIA_Lobart_PERM_15_00 " );	// Take care of your farm!
	AI_Output(self,other, " DIA_Lobart_PERM_05_01 " );	// I'll try.
};


instance DIA_Lobart_KAP4_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP4_EXIT_Condition;
	information = DIA_Lobart_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKPROBLEM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 41;
	condition = DIA_Lobart_ORKPROBLEM_Condition;
	information = DIA_Lobart_ORKPROBLEM_Info;
	description = " You're in trouble with the orcs. " ;
};


func int DIA_Lobart_ORKPROBLEM_Condition()
{
	if (((Npc_IsDead(OrcWarrior_Lobart1) ==  FALSE ) || (Npc_IsDead(OrcWarrior_Lobart2) ==  FALSE ) || (Npc_IsDead(OrcWarrior_Lobart3) ==  FALSE ) || (Npc_IsDead(OrcWarrior_Lobart4) ==  FALSE ) || ( Npc_IsDead(OrcWarrior_Lobart4) == FALSE OrcWarrior_Lobart5) ==  FALSE ) || (Npc_IsDead(OrcWarrior_Lobart6) ==  FALSE )) && (Kapitel >=  4 ) && ((hero.guild ==  GIL_PAL ) ||( hero . guild ==  GIL_DJG )) && Npc_KnowsInfo ( other , DIA_Lobart_DMT ))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKPROBLEM_Info()
{
	AI_Output(other,self, " DIA_Lobart_ORKPROBLEM_15_00 " );	// You're in trouble with the orcs.
	AI_Output(self,other, " DIA_Lobart_ORKPROBLEM_05_01 " );	// Damn, when will this all end?
	AI_Output(self,other, " DIA_Lobart_ORKPROBLEM_05_02 " );	// If this continues, my farm won't be worth a couple of gold coins. Can you help us?
	Log_CreateTopic(TOPIC_LobartsOrKProblem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem,LOG_Running);
	B_LogEntry(TOPIC_LobartsOrKProblem, " Orcs have taken over Lobart's farm. He wants me to rid him of them. " );
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKSWEG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 42;
	condition = DIA_Lobart_ORKSWEG_Condition;
	information = DIA_Lobart_ORKSWEG_Info;
	description = " I have rid your lands of orcs. " ;
};


func int DIA_Lobart_ORKSWEG_Condition()
{
	if ((Npc_IsDead(OrcWarrior_Lobart1) ==  TRUE ) && (Npc_IsDead(OrcWarrior_Lobart2) ==  TRUE ) && (Npc_IsDead(OrcWarrior_Lobart3) ==  TRUE ) && (Npc_IsDead(OrcWarrior_Lobart4) ==  TRUE ) && (Npc_IsDead(OrcWarrior_Lobart5) ==  TRUE ) && (Npc_IsDead(OrcWarrior_Lobart6) ==  TRUE ) && (Kapitel >=  4 ) && ((hero.guild ==  GIL_PAL ) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKSWEG_Info()
{
	AI_Output(other,self, " DIA_Lobart_ORKSWEG_15_00 " );	// I delivered your lands from the orcs.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Lobart_ORKSWEG_05_01 " );	// I won't let anyone say that paladins don't do anything for us mere farmers.
	};
	AI_Output(self,other, " DIA_Lobart_ORKSWEG_05_02 " );	// Glory to Innos. I can't give you much for this, but I hope you accept this small gesture of my gratitude.
	B_StartOtherRoutine(Vino,"Start");
	B_StartOtherRoutine(LobartsBauer1,"Start");
	B_StartOtherRoutine(LobartsBauer2,"Start");

	if(SNIPSGETNUGGETS == FALSE)
	{
		B_StartOtherRoutine(BAU_987_SNIPES,"Start");
	};

	TOPIC_END_LobartsOrKProblem = TRUE;
	B_GivePlayerXP(XP_KilledLobartOrks);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
};


instance DIA_Lobart_KAP5_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP5_EXIT_Condition;
	information = DIA_Lobart_CAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_KAP6_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP6_EXIT_Condition;
	information = DIA_Lobart_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_PICKPOCKET(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 900;
	condition = DIA_Lobart_PICKPOCKET_Condition;
	information = DIA_Lobart_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lobart_PICKPOCKET_Condition()
{
	return  C_Robbery ( 65 , 80 );
};

func void DIA_Lobart_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
	Info_AddChoice(DIA_Lobart_PICKPOCKET,Dialog_Back,DIA_Lobart_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lobart_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lobart_PICKPOCKET_DoIt);
};

func void DIA_Lobart_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

func void DIA_Lobart_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

instance DIA_Lobart_LobartMeal (C_Info)
{
	npc = BAU_950_Lobart;
	nr = 41;
	condition = DIA_Lobart_LobartMeal_Condition;
	information = DIA_Lobart_LobartMeal_Info;
	description = " Vatras is waiting for his food package. " ;
};

func int DIA_Lobart_LobartMeal_Condition()
{
	if ((MY_LobartMeal == LOG_Running) && (Npc_HasItems(other,ItMy_Backpack) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Lobart_LobartMeal_Info()
{
	AI_Output(other,self, " DIA_Lobart_LobartMeal_01_00 " );	// Vatras is waiting for his food package.
	AI_Output(self,other, " DIA_Lobart_LobartMeal_01_01 " );	// Of course. I've already prepared everything. It remains only to settle the issue of payment.
	AI_Output(other,self, " DIA_Lobart_LobartMeal_01_02 " );	// He gave you these three hundred coins.
	B_GiveInvItems(other,self,ItMi_VatrasPurse,1);
	Npc_RemoveInvItems(self,ItMi_VatrasPurse,1);
	AI_Output(self,other, " DIA_Lobart_LobartMeal_01_03 " );	// Very generous of him. It's always a pleasure to deal with such a generous person!
	AI_Output(self,other, " DIA_Lobart_LobartMeal_01_04 " );	// So give the Honorable Vatras my thanks and this package.
	B_GiveInvItems(self,other,ItMi_VatrasPacket,1);
	B_LogEntry(TOPIC_LobartMeal, " Lobart gave me a food package for Vatras. " );
};
