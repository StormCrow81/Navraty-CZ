

instance DIA_Hanna_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_EXIT_Condition;
	information = DIA_Hanna_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_EXIT_Condition()
{
	if (chapter <=  2 )
	{
		return TRUE;
	};
};

func void DIA_Hanna_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hanna_Hello(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Hello_Condition;
	information = DIA_Hanna_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_Hello_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Hello_Info()
{
	AI_Output(self,other, " DIA_Hanna_Hello_17_00 " );	// Ah, the client! What can I do for you?
};

instance DIA_Hanna_Armor(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Armor_Condition;
	information = DIA_Hanna_Armor_Info;
	permanent = FALSE;
	description = " I came from Pablo's militia. " ;
};

func int DIA_Hanna_Armor_Condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Armor_Info()
{
	AI_Output(other,self, " DIA_Hanna_Armor_01_00 " );	// I came from Pablo's militia.
	AI_Output(other,self, " DIA_Hanna_Armor_01_01 " );	// He said you could sell me the clothes of a townsman.
	AI_Output(self,other, " DIA_Hanna_Armor_01_02 " );	// Hmmm...(incredulous) Well, if he said so, then I can.
	AI_Output(self,other, " DIA_Hanna_Armor_01_03 " );	// But don't think I'll give it to you for free.
	AI_Output(self,other, " DIA_Hanna_Armor_01_04 " );	// You'll have to pay for it. Exactly one hundred coins.
	AI_Output(other,self, " DIA_Hanna_Armor_01_05 " );	// I didn't expect anything else.
	B_LogEntry(TOPIC_PathFromDown, " Hannah can sell me some light town clothes for a hundred gold coins. " );
};

instance DIA_Hanna_Armor_Dis(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Armor_Dis_Condition;
	information = DIA_Hanna_Armor_Dis_Info;
	permanent = TRUE;
	description = " Can you sell me clothes for less? " ;
};

func int DIA_Hanna_Armor_Dis_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Hanna_Armor) == TRUE) && (Hanna_LeatherBought_Dis == FALSE) && (Hanna_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Armor_Dis_Info()
{
	AI_Output(other,self, " DIA_Hanna_Armor_Dis_01_00 " );	// Can you sell me clothes cheaper?

	if(HannaTakeBuh == TRUE)
	{
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_01 " );	// (thoughtfully) Good. After all, you helped me solve the problem with Lemar.
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_02 " );	// So I'll give it to you just like that.
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_03 " );	// Here, take this.
		AI_Output(other,self, " DIA_Hanna_Armor_Dis_01_04 " );	// Thank you.
		B_GiveInvItems(self,other,ITAR_Vlk_L,1);
		Hanna_LeatherBought = TRUE;
	}
	else if(IS_LOVCACH == TRUE)
	{
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_05 " );	// (thoughtfully) Good. After all, you are one of us.
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_06 " );	// And you have to reckon with your people.
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_07 " );	// That's why I'll sell it to you for half the price.
		AI_Output(other,self, " DIA_Hanna_Armor_Dis_01_08 " );	// And thanks for that.
		Hanna_LeatherBought_Dis = TRUE;
		B_LogEntry(TOPIC_PathFromDown, " Because I'm a thief, Hannah will sell me light town clothes for half the price. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_09 " );	// (sarcastically) And why should I do this?
		AI_Output(self,other, " DIA_Hanna_Armor_Dis_01_10 " );	// No, my dear. I won't sell it to you for less!
	};
};

instance DIA_Hanna_LEATHER(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 850;
	condition = DIA_Hanna_LEATHER_Condition;
	information = DIA_Hanna_LEATHER_Info;
	permanent = TRUE;
	description = " (buy some light citizen clothes). " ;
};

func int DIA_Hanna_LEATHER_Condition()
{
	if((CanTeachTownMaster == FALSE) && (Npc_KnowsInfo(other,DIA_Hanna_Armor) == TRUE) && (MIS_PathFromDown == LOG_Running) && (Hanna_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_LEATHER_Info()
{
	AI_Output(other,self, " DIA_Hanna_LEATHER_15_00 " );	// Sell me clothes.

	if(Hanna_LeatherBought_Dis == TRUE)
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			B_GiveInvItems(other,self,ItMi_Gold,50);
			Npc_RemoveInvItems(self,ItMi_Gold,50);
			AI_Output(self,other, " DIA_Hanna_LEATHER_09_01 " );	// Okay... (smiling) Here, take it.
			B_GiveInvItems(self,other,ITAR_Vlk_L,1);
			Hanna_LeatherBought = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Hanna_LEATHER_09_02 " );	// Sorry, but you don't have enough gold.
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			B_GiveInvItems(other,self,ItMi_Gold,100);
			Npc_RemoveInvItems(self,ItMi_Gold,100);
			AI_Output(self,other, " DIA_Hanna_LEATHER_09_01 " );	// Okay... (smiling) Here, take it.
			B_GiveInvItems(self,other,ITAR_Vlk_L,1);
			Hanna_LeatherBought = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Hanna_LEATHER_09_02 " );	// Sorry, but you don't have enough gold.
		};
	};
};

instance DIA_Hanna_Room(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Room_Condition;
	information = DIA_Hanna_Room_Info;
	permanent = FALSE;
	description = " I want to rent a room. " ;
};

func int DIA_Hanna_Room_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Room_Info()
{
	AI_Output(other,self, " DIA_Hanna_Room_15_00 " );	// I want to rent a room.
	AI_Output(self,other, " DIA_Hanna_Room_17_01 " );	// You came to the right place.

	if (Npc_KnowsInfo(other,DIA_Lothar_Schlafen))
	{
		AI_Output(other,self, " DIA_Hanna_Add_15_03 " );	// One of the paladins told me that I can spend the night here for free...
	}
	else
	{
		AI_Output(other,self, " DIA_Hanna_Add_15_00 " );	// How much is the room for the night?
		AI_Output(self,other, " DIA_Hanna_Add_17_01 " );	// This service is absolutely free.
		AI_Output(self,other, " DIA_Hanna_Add_17_02 " );	// Paladins pay for all travelers' lodging.
		AI_Output(other,self, " DIA_Hanna_Add_15_04 " );	// So I can stay here overnight for free?!
	};

	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Да, да.
	AI_Output(self,other, " DIA_Hanna_Add_17_06 " );	// Just go up the stairs.
	AI_Output(self,other, " DIA_Hanna_Add_17_07 " );	// A couple of beds are still free.
};


instance DIA_Hanna_WhyPay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 3;
	condition = DIA_Hanna_WhyPay_Condition;
	information = DIA_Hanna_WhyPay_Info;
	permanent = FALSE;
	description = " Why do paladins pay for everything? " ;
};

func int DIA_Hanna_WhyPay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WhyPay_Info()
{
	AI_Output(other,self, " DIA_Hanna_Add_15_12 " );	// Why do paladins pay for everything?
	AI_Output(self,other, " DIA_Hanna_Add_17_13 " );	// I don't know exactly what this is about.
	AI_Output(self,other, " DIA_Hanna_Add_17_14 " );	// On the one hand, I think they want beggars not to hang out on the streets at night. It's safer for everyone that way.
	AI_Output(self,other, " DIA_Hanna_Add_17_15 " );	// Well, on the other hand, they want to win the favor of itinerant merchants.
	AI_Output(self,other, " DIA_Hanna_Add_17_16 " );	// Now that the farmers have risen in revolt, we can only rely on merchants to supply the city with food.
	AI_Output(self,other, " DIA_Hanna_Add_17_17 " );	// Also, I think they want to boost the morale of the city a bit.
	AI_Output(self,other, " DIA_Hanna_Add_17_18 " );	// Lord Andre even ordered free beer to be distributed in the Place de la Justice.
};


instance DIA_Hanna_WerHier(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 4;
	condition = DIA_Hanna_WerHier_Condition;
	information = DIA_Hanna_WerHier_Info;
	permanent = FALSE;
	description = " Who lives here now? " ;
};

func int DIA_Hanna_WerHier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WerHier_Info()
{
	AI_Output(other, self, " DIA_Hanna_Add_15_08 " );	// Who lives here now?
	AI_Output(self,other, " DIA_Hanna_Add_17_09 " );	// Mostly itinerant traders from the market.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Ага.
	AI_Output(self,other, " DIA_Hanna_Add_17_11 " );	// Don't even think about going through their belongings! I don't want problems here!
};


instance DIA_Hanna_City(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 5;
	condition = DIA_Hanna_City_Condition;
	information = DIA_Hanna_City_Info;
	permanent = TRUE;
	description = " A few questions about the city... " ;
};

func int DIA_Hanna_City_Condition()
{
	return TRUE;
};

func void DIA_Hanna_City_Info()
{
	AI_Output(other,self, " DIA_Hanna_City_15_00 " );	// Some questions about the city...
	Info_ClearChoices(DIA_Hanna_City);
	Info_AddChoice(DIA_Hanna_City,Dialog_Back,DIA_Hanna_City_Back);
	Info_AddChoice(DIA_Hanna_City, " Where can I buy something here? " ,DIA_Hanna_City_Buy);
	Info_AddChoice(DIA_Hanna_City, " Tell me about a city. " ,DIA_Hanna_City_City);
};

func void DIA_Hanna_City_Back()
{
	Info_ClearChoices(DIA_Hanna_City);
};

func void DIA_Hanna_City_Buy()
{
	AI_Output(other,self, " DIA_Hanna_City_Buy_15_00 " );	// Where can I buy something here?
	AI_Output(self,other, " DIA_Hanna_City_Buy_17_01 " );	// The market is right in front of the front entrance of the hotel. I think you will find everything you need there.
	AI_Output(self,other, " DIA_Hanna_City_Buy_17_02 " );	// There are also a few craft shops in the other part of the city. Most of them are located near the city gates.
	AI_Output(self,other, " DIA_Hanna_City_Buy_17_03 " );	// You will also find a fishmonger in the port. His shop looks directly at the harbor.
};

func void DIA_Hanna_City_City()
{
	AI_Output(other,self, " DIA_Hanna_City_City_15_00 " );	// Tell me about the city.
	AI_Output(self,other, " DIA_Hanna_City_City_17_01 " );	// Khorinis is one of the wealthiest cities in the kingdom, even though it doesn't look like it at all now.
	AI_Output(self,other, " DIA_Hanna_City_City_17_02 " );	// But since the war with the orcs began, all trade has practically died. The king requisitioned the entire merchant fleet for the needs of the army,
	AI_Output(self,other, " DIA_Hanna_City_City_17_03 " );	// and now ships practically do not enter our port. Therefore, the supply of goods is very limited, and many citizens are very concerned about this.
	AI_Output(self,other, " DIA_Hanna_City_City_17_04 " );	// Nobody knows what the future will bring us. We have no choice but to wait and hope for the best. It is unlikely that we can change anything.
};


instance DIA_Hanna_Kap3_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_Kap3_EXIT_Condition;
	information = DIA_Hanna_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Hanna_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Hanna_PriceForLetter;

instance DIA_Hanna_AnyNews(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_AnyNews_Condition;
	information = DIA_Hanna_AnyNews_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Hanna_AnyNews_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Hanna_AnyNews_Info()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Hanna_AnyNews_17_01 " );	// For some reason I don't seem to care much about other people's problems.
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews, " You're wrong. " ,DIA_Hanna_AnyNews_Yes);
	Info_AddChoice(DIA_Hanna_AnyNews, " Well, how can I say... " ,DIA_Hanna_AnyNews_Depends);
	Info_AddChoice(DIA_Hanna_AnyNews, " No, actually. " ,DIA_Hanna_AnyNews_No);
};

func void DIA_Hanna_AnyNews_No()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_No_15_00 " );	// In general, yes.
	AI_Output(self,other, " DIA_Hanna_AnyNews_No_17_01 " );	// Well, then I'm right. Now everyone thinks only of themselves. So what do you need?
	MIS_HannaRetrieveLetter = LOG_FAILED;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Depends()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Depends_15_00 " );	// Well, how to say...
	AI_Output(self,other, " DIA_Hanna_AnyNews_Depends_17_01 " );	// It depends on how much you can earn from it, you mean?
	AI_Output(self,other, " DIA_Hanna_AnyNews_Depends_17_02 " );	// I don't like people like you.
	MIS_HannaRetrieveLetter = LOG_FAILED;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Yes_15_00 " );	// You're wrong.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_17_01 " );	// Oh, you know what's the deal... I recently sorted out all sorts of rubbish and sold a pack of old maps to Ibrahim, a cartographer in the harbor.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_17_02 " );	// But then I noticed that I was missing one document.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_17_03 " );	// I think he might have ended up in a pile of these cards by accident.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_17_04 " );	// Could you return it to me?
	MIS_HannaRetrieveLetter = LOG_Running;
	Log_CreateTopic(TOPIC_HannaRetrieveLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter,LOG_Running);
	B_LogEntry(TOPIC_HannaRetrieveLetter, " Hannah's document is missing. Looks like it got lost in the harbor where cartographer Ibrahim lives. " );
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews, " I'm not your errand boy. " ,DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice(DIA_Hanna_AnyNews, " What will happen to me? " ,DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice(DIA_Hanna_AnyNews, " I'll try. " ,DIA_Hanna_AnyNews_Yes_WillSee);
};

func void DIA_Hanna_AnyNews_Yes_Footboy()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Yes_Footboy_15_00 " );	// I'm not your errand boy.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Footboy_17_01 " );	// I understand - the problems of a simple woman are too insignificant for you. So you'll have to do it yourself.
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Yes_Reward_15_00 " );	// What do I get for this?
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Reward_17_01 " );	// Yeah, I knew you were no better than the rest of the harbor rabble.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Reward_17_02 " );	// So what do you want from the poor woman?
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews, " Okay, forget it. " ,DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice(DIA_Hanna_AnyNews, " Well, you could be a little nicer to me... Like a woman... " ,DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice(DIA_Hanna_AnyNews,"Золото.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

func void DIA_Hanna_AnyNews_Yes_Reward_OK()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Yes_Reward_OK_15_00 " );	// Okay, forget it.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Reward_OK_17_01 " );	// Well, at least you still have the remnants of a conscience. If you bring me this document, I will give you 75 gold.
	Hanna_PriceForLetter = 75;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward_BeNice()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00 " );	// Well, you could be a little nicer to me... As a woman...
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01 " );	// Well, you boor! I... get out of here! Uncouth bastard!
	MIS_HannaRetrieveLetter = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void DIA_Hanna_AnyNews_Yes_Reward_Gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Золото.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01 " );	// Do you want this despicable metal? Okay - I value this document at fifty gold pieces.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02 " );	// If you can return this document to me, I will give you this money.
	Hanna_PriceForLetter = 50;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_WillSee()
{
	AI_Output(other,self, " DIA_Hanna_AnyNews_Yes_WillSee_15_00 " );	// I'll try.
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_WillSee_17_01 " );	// You're so kind. Good luck!
	AI_Output(self,other, " DIA_Hanna_AnyNews_Yes_WillSee_17_02 " );	// If you bring me this paper, you will be rewarded.
	Hanna_PriceForLetter = 200;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

instance DIA_Hanna_ThisLetter(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_ThisLetter_Condition;
	information = DIA_Hanna_ThisLetter_Info;
	permanent = FALSE;
	description = " Did you mean this document? " ;
};

func int DIA_Hanna_ThisLetter_Condition()
{
	if ((MIS_HannaRetrieveLetter == LOG_Running) && (Npc_HasItems(other,itwr_shatteredgolem_mis_1) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Hanna_ThisLetter_Info()
{
	AI_Output(other,self, " DIA_Hanna_ThisLetter_15_00 " );	// Did you mean this document?
	AI_Output(self,other, " DIA_Hanna_ThisLetter_17_01 " );	// Yes, that's exactly what I was looking for! Thank you.
	AI_Output(other,self, " DIA_Hanna_ThisLetter_15_02 " );	// What reward will I get?
	AI_Output(self,other, " DIA_Hanna_ThisLetter_17_03 " );	// Just calm down! Here is your gold.
	B_GiveInvItems(other,self,itwr_shatteredgolem_mis_1,1);
	CreateInvItems(self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems(self,other,ItMi_Gold,Hanna_PriceForLetter);
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP(XP_HannaRetrieveLetter);
};


instance DIA_Hanna_PICKPOCKET(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 900;
	condition = DIA_Hanna_PICKPOCKET_Condition;
	information = DIA_Hanna_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hanna_PICKPOCKET_Condition()
{
	return  C_Robbery ( 45 , 25 );
};

func void DIA_Hanna_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,Dialog_Back,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

var int HannahThief;
var int HannaBuyStones;

instance DIA_Hanna_AusKeller(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_AusKeller_Condition;
	information = DIA_Hanna_AusKeller_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hanna_AusKeller_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AusKeller_Info()
{
	if ((Cassia.aivar[AIV_KilledByPlayer] ==  TRUE ) || (Jesper.aivar[AIV_KilledByPlayer] ==  TRUE ) || (Ramirez.aivar[AIV_KilledByPlayer] ==  TRUE ))
	{
		AI_Output(self,other, " DIA_Hanna_Add_17_27 " );	// Where... did you come from?
		AI_Output(other, self, " DIA_Hanna_Add_15_28 " );	// I found something interesting in your basement...
		AI_Output(self,other, " DIA_Hanna_Add_17_29 " );	// What were you doing in my basement?!
		AI_Output(other,self, " DIA_Hanna_Add_15_30 " );	// You know that very well!
		AI_Output(self,other, " DIA_Hanna_Add_17_31 " );	// I don't know what you're talking about...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Hanna_Add_17_19 " );	// Look at you! Where did you come from? BUT?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//Я...
		AI_Output(self,other, " DIA_Hanna_Add_17_21 " );	// I know everything!
		AI_Output(self,other, " DIA_Hanna_Add_17_22 " );	// Don't tell me! I know everything.
		AI_Output(self,other, " DIA_Hanna_Add_17_23 " );	// Don't even think about stealing anything here, got it?
		AI_Output(self,other, " DIA_Hanna_Add_17_24 " );	// We can't afford to draw attention to the hotel.
		HannaThief = TRUE;
	};
};

instance DIA_Hanna_TradeMe(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_TradeMe_Condition;
	information = DIA_Hanna_TradeMe_Info;
	permanent = FALSE;
	description = " Are you a thief too? " ;
};

func int DIA_Hanna_TradeMe_Condition()
{
	if((HannaThief == TRUE) && ((HANNAISKNAST == FALSE) || (HANNAISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Hanna_TradeMe_Info()
{
	AI_Output(other,self, " DIA_Hanna_TradeMe_01_00 " );	// Are you a thief too?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other, " DIA_Hanna_TradeMe_01_01 " );	// Was once.
	AI_Output(self,other, " DIA_Hanna_TradeMe_01_02 " );	// But now I'm making good money running an inn and selling food to guests.
	AI_Output(self,other, " DIA_Hanna_TradeMe_01_03 " );	// True, I still have some clients who are interested in something more than just food and shelter.
	AI_Output(other,self, " DIA_Hanna_TradeMe_01_04 " );	// And what are you selling them?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other, " DIA_Hanna_TradeMe_01_05 " );	// My customers are often interested in gems and jewelry boxes.
	AI_Output(self,other, " DIA_Hanna_TradeMe_01_06 " );	// You can't just find things like this on the trading market.
	AI_Output(self,other, " DIA_Hanna_TradeMe_01_07 " );	// So if you want to make some good money, bring them to me.
	AI_Output(self,other, " DIA_Hanna_TradeMe_01_08 " );	// And I, in turn, will generously reward you!
	AI_Output(other,self, " DIA_Hanna_TradeMe_01_09 " );	// Agreed.
	Log_CreateTopic(Topic_GoldStones,LOG_NOTE);
	B_LogEntry(Topic_GoldStones, " Hannah buys any gems and jewelry boxes at a good price. " );
	HannaBuyStones = TRUE;
};

instance DIA_Hanna_BuyStones(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 200;
	condition = DIA_Hanna_BuyStones_Condition;
	information = DIA_Hanna_BuyStones_Info;
	permanent = TRUE;
	description = " I brought you something to sell. " ;
};

func int DIA_Hanna_BuyStones_Condition()
{
	if ((HannaBuyStones ==  TRUE ) && ((Npc_HasItems(other, ITMI_CHEST_EMPTYGOLD ) >=  1 ) || (Npc_HasItems(other, ITMI_JEWELERYCHEST_EMPTY ) >=  1 ) || (Npc_HasItems(other, ITMI_Diamond) >=  1 ) || ( Npc_HasItems(other,ItMi_Emerald) >=  1 ) || (Npc_HasItems(other,ItMi_Topaz) >=  1 ) || (Npc_HasItems(other,ItMi_Opal) >=  1 ) ||(Npc_HasItems(other,ItMi_Sapphire) >=  1 ) || (Npc_HasItems(other,ItMi_Ruby) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Hanna_BuyStones_Info()
{
	AI_Output(other,self, " DIA_Hanna_BuyStones_01_00 " );	// I brought you something to sell.
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_01 " );	// Good. Let's watch.
	Info_ClearChoices(DIA_Hanna_BuyStones);
	Info_AddChoice(DIA_Hanna_BuyStones,DIALOG_BACK,DIA_Hanna_BuyStones_Back);

	if ((Npc_HasItems(other,ItMi_Diamod) >  0 ) || (Npc_HasItems(other,ItMi_Emerald) >  0 ) || (Npc_HasItems(other,ItMi_Topaz) >  0 ) || (Npc_HasItems(other,ItMi_Opal) >  0 ) || (Npc_HasItems(other,ItMi_Sapphire) >  0 ) || (Npc_HasItems(other,ItMi_Ruby) >  0 ))
	{
		Info_AddChoice(DIA_Hanna_BuyStones, " Sell all gems. " ,DIA_Hanna_BuyStones_Stones);
	};
	if((Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) > 0) || (Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY) > 0))
	{
		Info_AddChoice(DIA_Hanna_BuyStones, " Sell all empty jewelry boxes. " ,DIA_Hanna_BuyStones_Chests);
	};
};

func void DIA_Hanna_BuyStones_Back()
{
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

func void DIA_Hanna_BuyStones_Stones()
{
	var int misc_03;
	var int misc_04;
	var int misc_05;
	var int misc_06;
	var int misc_07;
	var int misc_08;
	var int misc_all;

	misc_03 = Npc_HasItems(other,ItMi_Diamod);	
	misc_04 = Npc_HasItems(other,ItMi_Emerald);
	misc_05 = Npc_HasItems(other,ItMi_Topaz);
	misc_06 = Npc_HasItems(other,ItMi_Opal);
	misc_07 = Npc_HasItems(other,ItMi_Sapphire);
	misc_08 = Npc_HasItems(other,ItMi_Ruby);

	misc_03 = misc_03 * 750;
	misc_04 = misc_04 * 450;
	misc_05 = misc_05 * 150;
	misc_06 = misc_06 * 300;
	misc_07 = misc_07 * 450;
	misc_08 = misc_08 * 450;

	misc_all = misc_03 + misc_04 + misc_05 + misc_06 + misc_07 + misc_08;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_Diamod,Npc_HasItems(other,ItMi_Diamod));
	Npc_RemoveInvItems(other,ItMi_Emerald,Npc_HasItems(other,ItMi_Emerald));
	Npc_RemoveInvItems(other,ItMi_Topaz,Npc_HasItems(other,ItMi_Topaz));
	Npc_RemoveInvItems(other,ItMi_Opal,Npc_HasItems(other,ItMi_Opal));
	Npc_RemoveInvItems(other,ItMi_Sapphire,Npc_HasItems(other,ItMi_Sapphire));
	Npc_RemoveInvItems(other,ItMi_Ruby,Npc_HasItems(other,ItMi_Ruby));
	AI_PlayAni(self,"T_YES");
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_02 " );	// Hmmm...(pretty) Yes, not bad, my dear. I'll probably take everything from you.
	AI_Output(other,self, " DIA_Hanna_BuyStones_01_03 " );	// What about money?
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_04 " );	// Of course. Here is your reward.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all);
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_05 " );	// And believe me, this is much more than you would get for them from the merchants in the square.
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_06 " );	// If you have anything else to sell, you know where to find me.
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

func void DIA_Hanna_BuyStones_Chests()
{
	var int misc_01;
	var int misc_02;
	var int misc_all;

	misc_01 = Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD); 
	misc_02 = Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY);

	misc_01 = misc_01 * 45;
	misc_02 = misc_02 * 60;

	misc_all = misc_01 + misc_02;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ITMI_CHEST_EMPTYGOLD,Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD));
	Npc_RemoveInvItems(other,ITMI_JEWELERYCHEST_EMPTY,Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY));
	AI_PlayAni(self,"T_YES");
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_02 " );	// Hmmm...(pretty) Yes, not bad, my dear. I'll probably take everything from you.
	AI_Output(other,self, " DIA_Hanna_BuyStones_01_03 " );	// What about money?
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_04 " );	// Of course. Here is your reward.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all);
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_05 " );	// And believe me, this is much more than you would get for them from the merchants in the square.
	AI_Output(self,other, " DIA_Hanna_BuyStones_01_06 " );	// If you have anything else to sell, you know where to find me.
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

instance DIA_Hanna_Schuldenbuch (C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Schuldenbuch_Condition;
	information = DIA_Hanna_Schuldenbuch_Info;
	permanent = FALSE;
	description = " Look what book I have. " ;
};

func int DIA_Hanna_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) >= 1) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Schuldenbuch_Info()
{
	AI_Output(other,self, " DIA_Hanna_Add_15_41 " );	// Look what book I have.
	AI_Output(self,other, " DIA_Hanna_Add_17_42 " );	// Lemar's ledger! How did you manage that?!
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//Ну...
	AI_Output(self,other, " DIA_Hanna_Add_17_44 " );	// It's good that Lemar lost his ledger. But it's better if I have it...
};

instance DIA_Hanna_GiveSchuldenbuch (C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_GiveSchuldenbuch_Condition;
	information = DIA_Hanna_GiveSchuldenbuch_Info;
	permanent = FALSE;
	description = " Here, take this book. " ;
};

func int DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Hanna_Shoulderbook) && (Npc_HasItems(other,ItWr_Shoulderbook) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Hanna_GiveSchuldenbuch_Info()
{
	B_GivePlayerXP(XP_Debt Book);
	AI_Output(other,self, " DIA_Hanna_Add_15_45 " );	// Here, take this book.
	B_GiveInvItems(other,self,ItWr_debt book, 1 );
	Npc_RemoveInvItems(self,ItWr_Debt Book, 1 );
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Спасибо!
	AI_Output(self,other, " DIA_Hanna_Add_17_47 " );	// Take this as a reward.
	B_GiveInvItems(self,other,ItMi_Emerald,1);
	HannaTakeBuh = TRUE;
};

func void Hanna_Blubb()
{
	AI_Output(other, self, " DIA_Hanna_Add_15_37 " );	// Is everything okay in the lair?
	AI_Output(self,other, " DIA_Hanna_Add_17_39 " );	// I haven't seen them in a long time.
	AI_Output(self,other, " DIA_Hanna_Add_17_40 " );	// I'll probably go there when I have time. And I'll check how they're doing.
	AI_Output(self,other, " DIA_Hanna_Add_17_38 " );	// Yes. But you better not talk about it...
	AI_Output(other,self, " DIA_Hanna_Add_15_25 " );	// Did you know about the den of thieves?
	AI_Output(self,other, " DIA_Hanna_Add_17_26 " );	// I... don't understand what you're talking about... (with a smirk)
	AI_Output(self,other, " DIA_Hanna_Add_17_32 " );	// There was a militia here. Someone has betrayed our hideout!
	AI_Output(self,other, " DIA_Hanna_Add_17_33 " );	// They couldn't tell me anything, but Cassia and her people are dead.
	AI_Output(self,other, " DIA_Hanna_Add_17_34 " );	// I'm sure it's YOU!
	AI_Output(self,other, " DIA_Hanna_Add_17_35 " );	// I bought this especially for you.
	AI_Output(self,other, " DIA_Hanna_Add_17_36 " );	// It cost me a fortune. But I don't feel sorry for you, pig!
};

instance DIA_HANNA_INKNAST(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = dia_hanna_inknast_condition;
	information = dia_hanna_inknast_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_hanna_inknast_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == TRUE) && (HANNAISFREE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hanna_inknast_info()
{
	AI_Output(self,other, " DIA_Hanna_InKnast_01_00 " );	// You mustn't talk to me.
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_ISFREE(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = dia_hanna_isfree_condition;
	information = dia_hanna_isfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_isfree_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISFREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hanna_isfree_info()
{
	AI_Output(self,other, " DIA_Hanna_IsFree_01_00 " );	// Thank you for helping me prove my innocence.
	AI_Output(self,other, " DIA_Hanna_IsFree_01_01 " );	// Now I owe you!
	AI_Output(other,self, " DIA_Hanna_IsFree_01_02 " );	// No thanks. I just restored justice.
	AI_Output(self,other, " DIA_Hanna_IsFree_01_03 " );	// I'll thank you anyway.
	B_GiveInvItems(self,other,ItSe_HannasBeutel,1);
	AI_Output(other,self, " DIA_Hanna_Add_15_49 " );	// What is this you gave me?
	AI_Output(self,other, " DIA_Hanna_Add_17_48 " );	// This is the key to the gate to wealth.
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Hannah thanked me for my help and gave me a strange-looking key. All that's left is to give Hannah the necklace Abigail gave me and return to the latter for a reward. " );
};

instance DIA_HANNA_GOLDNECKLACEHANNA(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = dia_hanna_goldnecklacehanna_condition;
	information = dia_hanna_goldnecklacehanna_info;
	permanent = FALSE;
	description = " Your sister is giving you this necklace. " ;
};


func int dia_hanna_goldnecklacehanna_condition()
{
	if (( MIS_ABIGEILHELP  == LOG_Running ) && ( Npc_HasItems ( other , ITMI_HANNAGOLDNECKLACE ) >=  1 ) && ( HANNAISFREE  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_hanna_goldnecklacehanna_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Hanna_GoldNecklaceHanna_01_00 " );	// Your sister gives you this golden necklace.
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_01");	//Правда?
	AI_Output(other,self, " DIA_Hanna_GoldNecklaceHanna_01_02 " );	// Here, take this.
	B_GiveInvItems(other,self,ITMI_HANNAGOLDNECKLACE,1);
	Npc_RemoveInvItems(self,ITMI_HANNAGOLDNECKLACE,Npc_HasItems(self,ITMI_HANNAGOLDNECKLACE));
	AI_Output(self,other, " DIA_Hanna_GoldNecklaceHanna_01_03 " );	// (joyfully) Ah! How nice of her.
	AI_Output(self,other, " DIA_Hanna_GoldNecklaceHanna_01_07 " );	// If you meet Abigail again, thank her for this gift from me and say hello!
	AI_Output(other,self, " DIA_Hanna_GoldNecklaceHanna_01_08 " );	// Okay, I'll pass it on.
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " I gave Abigail's gold necklace to Hanna. I should tell her sister. " );
	HANNATAKESNECKLACE = TRUE;
};

instance DIA_Hanna_HauntedLH(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_HauntedLH_condition;
	information = DIA_Hanna_HauntedLH_info;
	permanent = FALSE;
	description = " Do you happen to know anyone named Stefan? " ;
};

func int DIA_Hanna_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_HauntedLH_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Hanna_HauntedLH_01_00 " );	// Do you happen to know the name Stefan?
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_01 " );	// Stefan? Why are you asking?
	AI_Output(other,self, " DIA_Hanna_HauntedLH_01_02 " );	// I found this silver ring. There is an inscription on it: 'To Stefan from Ha...'. That's what I thought...
	B_GiveInvItems(other,self,ItMi_StafanRing,1);
	Npc_RemoveInvItems(self,ItMi_StafanRing,1);
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_03 " );	// (bitterly) Eh... So much time has passed, and I still can't forget it.
	AI_Output(other,self, " DIA_Hanna_HauntedLH_01_04 " );	// So, do you know it?
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_05 " );	// Of course, I gave it to Stefan.
	AI_Output(other,self, " DIA_Hanna_HauntedLH_01_06 " );	// And who was he, this Stefan?
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_07 " );	// He worked at the lighthouse, was its caretaker. I used to go there often in my youth.
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_08 " );	// You could say we were very close. And then... then someone killed him.
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_09 " );	// I can't even imagine who could have done this. Stefan was a kind and decent person. He wouldn't hurt a fly.
	AI_Output(other,self, " DIA_Hanna_HauntedLH_01_10 " );	// I found his remains at the lighthouse. Why wasn't he buried?
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_11 " );	// Probably because no one cared about him except me.
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_12 " );	// Then someone started a rumor that ghosts began to appear at the lighthouse. And since then, not a single living soul looks there.
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_13 " );	// It's also a great place to hide your secrets. If you understand what I'm talking about.
	AI_Output(other,self, " DIA_Hanna_HauntedLH_01_14 " );	// Possibly. Did Stefan say anything?
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_15 " );	// In the last days before the murder, he rarely looked at me. He said that he had important business at the lighthouse.
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_16 " );	// At first I thought that he stopped loving me. But later I realized that he was in some kind of trouble, and did not want to involve me in this.
	AI_Output(self,other, " DIA_Hanna_HauntedLH_01_17 " );	// (sighs) Do you mind if I keep this ring for myself? Looking at him, I remember the days when I was truly happy.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_18");	//Конечно.
	KnowStefan = TRUE;
	; _ _ _ _
};
