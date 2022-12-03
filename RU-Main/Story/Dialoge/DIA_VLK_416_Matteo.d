

instance DIA_Matteo_EXIT(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 999;
	condition = DIA_Matteo_EXIT_Condition;
	information = DIA_MAtteo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Matteo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MAtteo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Matteo_PICKPOCKET(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 900;
	condition = DIA_Matteo_PICKPOCKET_Condition;
	information = DIA_Matteo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Matteo_PICKPOCKET_Condition()
{
	return  C_Robbery ( 80 , 150 );
};

func void DIA_Matteo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,Dialog_Back,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

var int FirstTalkMatteo;

instance DIA_Matteo_NoTalkAtAll(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_NoTalkAtAll_Condition;
	information = DIA_Matteo_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Matteo_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_NoTalkAtAll_Info()
{
	if(FirstTalkMatteo == FALSE)
	{
		AI_Output(self,other, " DIA_Matteo_NoTalkAtAll_12_00 " );	// Hey, there's nothing for you to do here.
		AI_Output(self,other, " DIA_Matteo_NoTalkAtAll_12_01 " );	// Get lost!
		FirstTalkMatteo = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Matteo_NoTalkAtAll_12_02 " );	// I said go away!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Matteo_Hallo (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Hallo_Condition;
	information = DIA_Matteo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Matteo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Hallo_Info()
{
	AI_Output(self,other, " DIA_Matteo_Hallo_09_00 " );	// How can I help?
};

instance DIA_Matteo_SellWhat (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_SellWhat_Condition;
	information = DIA_MAtteo_SellWhat_Info;
	permanent = FALSE;
	description = " What are you selling? " ;
};


func int DIA_Matteo_SellWhat_Condition()
{
	return TRUE;
};

func void DIA_MAtteo_SellWhat_Info()
{
	AI_Output(other,self, " DIA_Matteo_SellWhat_15_00 " );	// What are you selling?
	AI_Output(self,other, " DIA_Matteo_SellWhat_09_01 " );	// I can offer anything you might need on your travels. Weapons, torches, provisions...even armor.
	AI_Output(self,other, " DIA_Matteo_SellWhat_09_02 " );	// I have a very nice copy in stock.

	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, " Matteo's shop is located at the south gate of the city. He sells equipment, weapons and other goods. " );
		Knows_Matteo = TRUE;
	};
};


instance DIA_Matteo_TRADE (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 800;
	condition = DIA_Matteo_TRADE_Condition;
	information = DIA_Matteo_TRADE_Info;
	permanent = TRUE;
	description = " Show me your products. " ;
	trade = TRUE;
};

func int DIA_Matteo_TRADE_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Matteo_SellWhat ) ==  TRUE ) && Wld_IsTime ( 8 , 0 , 22 , 0 )) ;
	{
		return TRUE;
	};
};


var int Matteo_TradeNewsPermanent;

func void DIA_Matteo_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	if((Npc_HasItems(other,ItMi_Saw) == 0) && (Npc_HasItems(self,ItMi_Saw) == 0))
	{
		CreateInvItems(self,ItMi_Saw,2);
	};
	if((Npc_HasItems(other,ItMi_Scoop) == 0) && (Npc_HasItems(self,ItMi_Scoop) == 0))
	{
		CreateInvItems(self,ItMi_Scoop,2);
	};
	AI_Output(other,self, " DIA_Matteo_TRADE_15_00 " );	// Show me your products.

	if ((Chapter ==  3 ) && (MY_RescueBennet !=  LOG_SUCCESS ) && (Matteo_TradeNewsPermanent ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Matteo_TRADE_09_01 " );	// Since the mercenaries killed Lothar, paladin inspections have become much more stringent.
		AI_Output(self,other, " DIA_Matteo_TRADE_09_02 " );	// I hope things calm down when this killer is hanged.
		Matteo_TradeNewsPermanent = 1 ;
	};
	if ((Capital ==  5 ) && (Matthew_TradeNewsPermanent <  2 ))
	{
		AI_Output(self,other, " DIA_Matteo_TRADE_09_03 " );	// Looks like the paladins are really serious this time around. They even reduced the security on their ship.
		AI_Output(self,other, " DIA_Matteo_TRADE_09_04 " );	// It's good that you're replenishing your supplies again, who knows if this city will still exist next week.
		Matteo_TradeNewsPermanent = 2 ;
	};

	B_GiveTradeInv(self);
};


var int Matteo_LeatherBought;

instance DIA_Matteo_LEATHER(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 850;
	condition = DIA_Matteo_LEATHER_Condition;
	information = DIA_Matteo_LEATHER_Info;
	permanent = TRUE;
	description = " Buy a citizen's outfit. (Price: 250 coins) " ;
};

func int DIA_Matteo_LEATHER_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Matteo_SellWhat ) && ( Matthew_LeatherBought ==  FALSE ) && ( Capital ==  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Matteo_LEATHER_Info()
{
	AI_Output(other,self, " DIA_Matteo_LEATHER_15_00 " );	// Okay, give me this armor.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other, " DIA_Matteo_LEATHER_09_01 " );	// You'll like them.
		B_GiveInvItems(self,other,ITAR_Vlk_M,1);
		Matteo_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Matteo_LEATHER_09_02 " );	// This armor isn't cheap, but it's definitely worth the money. So come back when you have enough gold.
	};
};


instance DIA_Matteo_Paladine (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Paladine_Condition;
	information = DIA_MAtteo_Paladine_Info;
	permanent = FALSE;
	description = " What do you know about paladins? " ;
};


func int DIA_Matteo_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Paladine_Info()
{
	AI_Output(other,self, " DIA_Matteo_Paladine_15_00 " );	// What do you know about paladins?
	AI_Output(self,other, " DIA_Matteo_Paladine_09_01 " );	// Ever since those bastards arrived in town, I've been having trouble with them.
	AI_Output(self,other, " DIA_Matteo_Paladine_09_02 " );	// The last time I went to the upper quarter, the guards blocked my way and started to figure out what I needed there!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//И?
	AI_Output(self,other, " DIA_Matteo_Paladine_09_04 " );	// Of course they let me through!
	AI_Output(self,other, " DIA_Matteo_Paladine_09_05 " );	// Yes, I already had a shop in this city, when these pompous fools still walked under the table!
	AI_Output(self,other, " DIA_Matteo_Paladine_09_06 " );	// And yesterday those bastards came and confiscated half of my goods!
};


instance DIA_Matteo_Confiscated(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Confiscated_Condition;
	information = DIA_MAtteo_Confiscated_Info;
	permanent = FALSE;
	description = " Paladins took your goods? " ;
};


func int DIA_Matteo_Confiscated_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Confiscated_Info()
{
	AI_Output(other,self, " DIA_Matteo_Confiscated_15_00 " );	// Have the paladins taken your goods?
	AI_Output(self,other, " DIA_Matteo_Confiscated_09_01 " );	// Everything I kept in my backyard.
	AI_Output(self,other, " DIA_Matteo_Confiscated_09_02 " );	// They just posted a guard in front of the entrance to the yard.
	AI_Output(self,other, " DIA_Matteo_Confiscated_09_03 " );	// I'm still lucky they didn't take everything. At least they left the armor.
};


instance DIA_Matteo_HelpMeToOV(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeToOV_Condition;
	information = DIA_MAtteo_HelpMeToOV_Info;
	permanent = FALSE;
	description = " Can you help me get to the upper quarter? " ;
};


func int DIA_Matteo_HelpMeToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HelpMeToOV_Info()
{
	AI_Output(other,self, " DIA_Matteo_HelpMeToOV_15_00 " );	// Can you help me get to the upper quarter?
	AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_01 " );	// (dazed) What? What do you need THERE?
	AI_Output(other,self, " DIA_Matteo_HelpMeToOV_15_02 " );	// I have an important message...
	AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_03 " );	// Well, well... Did you try to get past the guards?
	if (Torwache_305.aivar[AIV_TalkedToPlayer] ==  TRUE )
	{
		AI_Output(other,self, " DIA_Matteo_HelpMeToOV_15_04 " );	// (bitter laughter) Oh, forget it!
		AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_05 " );	// (laughs) It's so TYPICAL for these beggars!
	}
	else
	{
		AI_Output(other,self, " DIA_Matteo_HelpMeToOV_15_06 " );	// I don't see why I should even try.
		AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_07 " );	// Maybe you're right.
	};
	AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_08 " );	// I don't know HOW important your message is - none of my business.
	AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_09 " );	// But even if you tell them that a ship full of orcs has docked in the harbor, they won't let you in.
	AI_Output(self,other, " DIA_Matteo_HelpMeToOV_09_10 " );	// Because they have an ORDER.
};

func void B_Matteo_Preis()
{
	AI_Output(self,other, " DIA_Matteo_HelpMeNow_09_01 " );	// Sounds like it's very important to you.
	AI_Output(self,other, " DIA_Matteo_HelpMeNow_09_02 " );	// (slyly) The question is: HOW important is this to you?
	AI_Output(other,self, " DIA_Matteo_HelpMeNow_15_03 " );	// What are you implying?
	AI_Output(self,other, " DIA_Matteo_HelpMeNow_09_04 " );	// I can help you - after all, I'm one of the most powerful people here.
	AI_Output(self,other, " DIA_Matteo_HelpMeNow_09_05 " );	// But it will cost you some money.
};


instance DIA_Matteo_HelpMeNow(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeNow_Condition;
	information = DIA_MAtteo_HelpMeNow_Info;
	permanent = FALSE;
	description = " So can you help me get to the upper quarter? " ;
};


func int DIA_Matteo_HelpMeNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeToOV) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HelpMeNow_Info()
{
	AI_Output(other,self, " DIA_Matteo_HelpMeNow_15_00 " );	// So can you help me get to the top quarter?
	B_Matteo_Price();
};


instance DIA_Matteo_LehrlingLater (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_LehrlingLater_Condition;
	information = DIA_MAtteo_LehrlingLater_Info;
	permanent = FALSE;
	description = " Help me become an apprentice to one of the masters. " ;
};


func int DIA_Matteo_LehrlingLater_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_LehrlingLater_Info()
{
	AI_Output(other,self, " DIA_Matteo_LehrlingLater_15_00 " );	// Help me become a student of one of the masters.
	B_Matteo_Price();
};


instance DIA_Matteo_PriceOfHelp (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_PriceOfHelp_Condition;
	information = DIA_MAtteo_PriceOfHelp_Info;
	permanent = FALSE;
	description = " What do you want for your services? " ;
};


func int DIA_Matteo_PriceOfHelp_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Matteo_HelpMeNow ) || Npc_KnowsInfo ( other , DIA_Matteo_LehrlingLater ))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_PriceOfHelp_Info()
{
	AI_Output(other,self, " DIA_Matteo_PriceOfHelp_15_00 " );	// What do you want for your services?
	AI_Output(self,other, " DIA_Matteo_PriceOfHelp_09_01 " );	// One hundred gold coins.
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
	Info_AddChoice(DIA_Matteo_PriceOfHelp, " It's all fucking... " ,DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice(DIA_Matteo_PriceOfHelp, " Boy, girl! " ,DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output(self,other, " B_Matteo_RegDichAb_09_00 " );	// Take it easy! It's not YOUR gold I mean.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//А чье?
	AI_Output(self,other, " B_Matteo_RegDichAb_09_02 " );	// Basically, this is MY gold.
	AI_Output(self,other, " B_Matteo_RegDichAb_09_03 " );	// Gritta, the carpenter's niece, hasn't repaid me for a long time.
	AI_Output(self,other, " B_Matteo_RegDichAb_09_04 " );	// But this little flirt-tail is constantly defiling in new dresses - this means that she has money.
	AI_Output(self,other, " B_Matteo_RegDichAb_09_05 " );	// I want you to beat this debt out of her. But master Torben - a carpenter - is also a very influential person.
	AI_Output(self,other, " B_Matteo_RegDichAb_09_06 " );	// Bring me this money and I'll help you.
	MIS_Matteo_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_Matteo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Matteo,LOG_Running);
	B_LogEntry(TOPIC_Matteo, " Carpenter Torben Gritt's niece owes Matteo one hundred gold coins. If I return them to him, he will help me get to the upper quarter. " );
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output(other,self, " DIA_Matteo_PriceOfHelp_Cutthroat_15_00 " );	// Oh, you rascal!
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output(other,self, " DIA_Matteo_PriceOfHelp_Wow_15_00 " );	// It's all fucking...
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};


instance DIA_Matteo_WoGritta (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_WoGritta_Condition;
	information = DIA_MAtteo_WoGritta_Info;
	permanent = FALSE;
	description = " Where can I find this Gritta? " ;
};


func int DIA_Matteo_WoGritta_Condition()
{
	if ((MY_Matteo_Gold == LOG_Running) && (Gritta.aivar[AIV_TalkedToPlayer] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WoGritta_Info()
{
	AI_Output(other,self, " DIA_Matteo_WoGritta_15_00 " );	// Where can I find this Gritta?
	AI_Output(self,other, " DIA_Matteo_WoGritta_09_01 " );	// As I said - she is the carpenter's niece - his house is down the street, to the right of the forge.
};


instance DIA_Matteo_GoldRunning(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 500;
	condition = DIA_Matteo_GoldRunning_Condition;
	information = DIA_MAtteo_GoldRunning_Info;
	permanent = TRUE;
	description = " Here's your hundred gold! " ;
};

func int DIA_Matteo_GoldRunning_Condition()
{
	if ((MIS_Matteo_Gold == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_GoldRunning_Info()
{
	AI_Output(other,self, " DIA_Matteo_GoldRunning_15_00 " );	// Here's your hundred gold!

	if (Npc_IsDead(Gritta))
	{
		AI_Output(self,other, " DIA_Matteo_GoldRunning_09_01 " );	// This gold has Gritta's blood on it! I didn't say to kill her!
		AI_Output(self,other, " DIA_Matteo_GoldRunning_09_02 " );	// I don't want to have anything to do with this case. You can forget about our deal! I don't even want to think about it!
		MIS_Matteo_Gold = LOG_FAILED;
		AI_StopProcessInfos(self);
		return;
	};
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Gritta_GoldGiven == TRUE)
		{
			AI_Output(self,other, " DIA_Matteo_GoldRunning_09_03 " );	// And? Were there any problems?
			AI_Output(other,self, " DIA_Matteo_GoldRunning_15_04 " );	// Nothing worth talking about.
			AI_Output(self,other, " DIA_Matteo_GoldRunning_09_05 " );	// Good! You fulfilled your end of the bargain.
		}
		else if(Gritta_WantPay == TRUE)
		{
			AI_Output(self,other, " DIA_Matteo_GoldRunning_09_06 " );	// Do you want to pay for it? Hmm - I'd rather you get that money out of her!
			AI_Output(self,other, " DIA_Matteo_GoldRunning_09_07 " );	// But still - a hundred gold is a hundred gold.
			AI_Output(self,other, " DIA_Matteo_GoldRunning_09_08 " );	// You've fulfilled your end of the bargain.
		};

		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Matteo_Gold);
	}
	else
	{
		AI_Output(self,other, " DIA_Matteo_GoldRunning_09_09 " );	// Are you having problems with your account? I don't see a hundred gold coins.
	};
};


instance DIA_Matteo_approval (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_Approval_Condition;
	information = DIA_MAtteo_Approval_Info;
	permanent = TRUE;
	description = " Help me become a student of one of the masters! " ;
};


var int DIA_Matteo_approval_perm;

func int DIA_Matteo_Approval_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && ((MIS_Matteo_Gold == LOG_Running) || (MIS_Matteo_Gold == LOG_SUCCESS)) && (Player_IsApprentice == APP_NONE) && (DIA_Matteo_Zustimmung_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Approval_Info()
{
	AI_Output(other,self, " DIA_Matteo_Zustimmung_15_00 " );	// Help me become a student of one of the masters!
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Matteo_Zustimmung_09_01 " );	// Don't worry, I'll keep my promises.
		AI_Output(self,other, " DIA_Matteo_Zustimmung_09_02 " );	// Other masters will only hear good things about you from me.
		B_GivePlayerXP(XP_Consent);
		B_LogEntry(TOPIC_Lehrling, " Matteo will give me his approval if I want to become another master's apprentice. " );
		DIA_Matteo_Approval_perm = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Matteo_Zustimmung_09_03 " );	// Everything has its turn. Fulfill your end of the bargain first and bring me the gold!
	};
};


instance DIA_Matteo_HowCanYouHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_HowCanYouHelp_Condition;
	information = DIA_MAtteo_HowCanYouHelp_Info;
	permanent = FALSE;
	description = " How EXACTLY are you going to help me? " ;
};


func int DIA_Matteo_HowCanYouHelp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_HowCanYouHelp_Info()
{
	AI_Output(other,self, " DIA_Matteo_HowCanYouHelp_15_00 " );	// How EXACTLY are you going to help me?
	AI_Output(self,other, " DIA_Matteo_HowCanYouHelp_09_01 " );	// It's simple. I'm using my influence to persuade the other masters here to take you on as apprentices.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Matteo_HowCanYouHelp_09_02 " );	// By becoming a student, you will automatically become a citizen of the city and will be able to get into the upper quarter. Apart from that, you can earn something.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling, " Matteo can help me become an apprentice to one of the artisans. " );
};


instance DIA_Matteo_WoAlsLehrling(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_WoAlsLehrling_Condition;
	information = DIA_MAtteo_WoAlsLehrling_Info;
	permanent = FALSE;
	description = " Who can I apprentice with? " ;
};


func int DIA_Matteo_WoAlsLehrling_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WoAlsLehrling_Info()
{
	AI_Output(other,self, " DIA_Matteo_WoAlsLehrling_15_00 " );	// And to whom can I become an apprentice?
	AI_Output(self,other, " DIA_Matteo_WoAlsLehrling_09_01 " );	// To any master on this street.
	AI_Output(self,other, " DIA_Matteo_WoAlsLehrling_09_02 " );	// This could be the blacksmith Harad, the master archer Bosper, the carpenter Torben, or the alchemist Constantino.
	AI_Output(self,other, " DIA_Matteo_WoAlsLehrling_09_03 " );	// One of them will definitely take you.
	AI_Output(self,other, " DIA_Matteo_WoAlsLehrling_09_04 " );	// But it's important that other masters agree with this. Such is the custom of Khorinis.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling, " I can apprentice Master Archer Bosper, Blacksmith Harad, Carpenter Torben, or Alchemist Constantino. " );
	B_LogEntry(TOPIC_Lehrling, " Before I can become an apprentice, I must get the approval of other masters. " );
};


instance DIA_Matteo_WieApproval (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_Matteo_WieZustimmung_Condition;
	information = DIA_MAtteo_WieApproval_Info;
	permanent = FALSE;
	description = " How can I get approval from other masters? " ;
};


func int DIA_Matteo_WieZustimmung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo(other,DIA_Matteo_WarumNichtBeiDir)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WieApproval_Info()
{
	AI_Output(other,self, " DIA_Matteo_WieZustimmung_15_00 " );	// How do I get approval from other masters?
	AI_Output(self,other, " DIA_Matteo_WieZustimmung_09_01 " );	// You just have to convince them. Go and talk to them.
	AI_Output(self,other, " DIA_Matteo_WieZustimmung_09_02 " );	// But if at least two of them are against you, you will not become an apprentice! So try to please them!
	B_LogEntry(TOPIC_Lehrling, " I can only get the masters' approval if I do my best in front of them. " );
};

instance DIA_Matteo_WarumNichtBeiDir(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_WarumNichtBeiDir_Condition;
	information = DIA_MAtteo_WarumNotBeiDir_Info;
	permanent = FALSE;
	description = " Why don't YOU take me as a student? " ;
};


func int DIA_Matteo_WarumNichtBeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_WarumNichtBeiDir_Info()
{
	AI_Output(other,self, " DIA_Matteo_WarumNichtBeiDir_15_00 " );	// Why don't YOU take me as a student?
	AI_Output(self,other, " DIA_Matteo_WarumNichtBeiDir_09_01 " );	// I'd take it - but other masters won't agree.
	AI_Output(self,other, " DIA_Matteo_WarumNichtBeiDir_09_02 " );	// I just recently took on another student.
	AI_Output(other,self, " DIA_Matteo_WarumNichtBeiDir_09_03 " );	// And what are you teaching him?
	AI_Output(self,other, " DIA_Matteo_WarumNichtBeiDir_09_04 " );	// Basically nothing... Rupert's not too smart for all this.
	AI_Output(self,other, " DIA_Matteo_WarumNichtBeiDir_09_05 " );	// So standing behind the counter is the most I can ask of him.
	AI_Output(other,self, " DIA_Matteo_WarumNichtBeiDir_09_06 " );	// Well, then, it turns out that he is not your student, but just works for you.
	AI_Output(self,other, " DIA_Matteo_WarumNichtBeiDir_09_07 " );	// Hmmm... (smiling) But you can't say that you're wrong.
};

instance DIA_Matteo_OtherWay(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_OtherWay_Condition;
	information = DIA_MAtteo_OtherWay_Info;
	permanent = FALSE;
	description = " Is there another way to get to the upper quarter? " ;
};


func int DIA_Matteo_OtherWay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_OtherWay_Info()
{
	AI_Output(other,self, " DIA_Matteo_OtherWay_15_00 " );	// Is there another way to get to the top quarter?
	AI_Output(self,other, " DIA_Matteo_OtherWay_09_01 " );	// Maybe... if I come up with something, I'll let you know.
};


instance DIA_Matteo_Minenanteil (C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_Minenanteil_Condition;
	information = DIA_MAtteo_Minenanteil_Info;
	description = " You own shares in a mining company. " ;
};


func int DIA_Matteo_Minenanteil_Condition()
{
	if ((other.guild ==  GIL_KDF ) && (MIS_Serpents_MineBefore_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Matteo_SellWhat));
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Minenanteil_Info()
{
	AI_Output(other,self, " DIA_Matteo_Minenanteil_15_00 " );	// I see you have shares in a mining company among other goods. Who sold them to you?
	AI_Output(self,other, " DIA_Matteo_Minenanteil_09_01 " );	// (nervously) Stocks? Oh. And where did they come from? I have no idea where I got them. I swear, your honor.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_MATTEO_SPECWINEDONE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = dia_matteo_specwinedone_condition;
	information = dia_matteo_specwinedone_info;
	permanent = FALSE;
	description = " Have you received a messenger from Paladin Ferdinand? " ;
};


func int dia_matteo_specwinedone_condition()
{
	if((MIS_FERDSPECWINE == LOG_Running) && (Npc_HasItems(hero,itfo_specwine) < 1))
	{
		return TRUE;
	};
};

func void dia_matteo_specwinedone_info()
{
	AI_Output(other,self, " DIA_MAtteo_SpecWineDone_01_00 " );	// Have you received a messenger from Paladin Ferdinand?
	AI_Output(self,other, " DIA_MAtteo_SpecWineDone_01_01 " );	// From paladin Ferdinand? Hmmm...
	AI_Output(self,other, " DIA_MAtteo_SpecWineDone_01_02 " );	// Oh yes, I remember. Some guy actually came to me.
	AI_Output(self,other, " DIA_MAtteo_SpecWineDone_01_03 " );	// Bought two bottles of expensive wine from me and left.
	AI_Output(other,self, " DIA_MAtteo_SpecWineDone_01_04 " );	// Where did he go?
	AI_Output(self,other, " DIA_MAtteo_SpecWineDone_01_05 " );	// I think he was talking about Lobart's farm and I think he wanted to look there.
	AI_Output(self,other, " DIA_MAtteo_SpecWineDone_01_06 " );	// True, he crossed there at night looking. If I were him, I would still be more careful - there are many dangerous creatures outside the city walls.
	AI_Output(other,self, " DIA_MAtteo_SpecWineDone_01_08 " );	// All right, thanks for the info.
	AI_StopProcessInfos(self);
};

instance DIA_Matteo_Jewerly(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Condition;
	information = DIA_MAtteo_Jewerly_Info;
	permanent = FALSE;
	description = " What could you teach me? " ;
};

func int DIA_Matteo_Jewerly_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Matteo_WarumNichtBeiDir) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Info()
{
	AI_Output(other,self, " DIA_Matteo_Jewerly_01_00 " );	// And if I did become your student - what could you teach me?
	AI_Output(self,other, " DIA_Matteo_Jewerly_01_01 " );	// Well, if that's what you're interested in... I used to be an excellent jeweler!
	AI_Output(self,other, " DIA_Matteo_Jewerly_01_02 " );	// Most of those expensive trinkets that these overdressed turkeys from the upper quarter wear are all my work.
	AI_Output(self,other, " DIA_Matteo_Jewerly_01_03 " );	// True, since some thieves stole my tools from me, I no longer practice this activity.
	AI_Output(self,other, " DIA_Matteo_Jewerly_01_04 " );	// And, of course, I don't teach this art to anyone.
};

instance DIA_Matteo_Jewerly_Form(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Form_Condition;
	information = DIA_MAtteo_Jewerly_Form_Info;
	permanent = FALSE;
	description = " What exactly was stolen from you? " ;
};

func int DIA_Matteo_Jewerly_Form_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Matteo_Jewerly) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Form_Info()
{
	AI_Output(other,self, " DIA_Matteo_Jewerly_Form_01_00 " );	// What exactly was stolen from you?
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_01_01 " );	// Eh... The most valuable thing I had was a golden mold for casting rings and amulets.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_01_02 " );	// It was a very rare and expensive item! At one time I bought it from a merchant who sailed from the mainland.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_01_03 " );	// I'm unlikely to find another one like this in Khorinis.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_01_04 " );	// And without her, I, consider, was left without hands. So I didn't have much of a choice.
	AI_Output(other,self,"DIA_Matteo_Jewerly_Form_01_05");	//Понимаю.
	MIS_JewerlyForm = LOG_Running;
	Log_CreateTopic(TOPIC_JewerlyForm,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JewerlyForm,LOG_Running);
	B_LogEntry(TOPIC_JewerlyForm, " Merchant Matteo used to be a jeweler, but gave up after his tools were stolen. His biggest regret is the gold mold for casting rings and amulets. " );
};

instance DIA_Matteo_Jewerly_Form_Done(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_Form_Done_Condition;
	information = DIA_MAtteo_Jewerly_Form_Done_Info;
	permanent = FALSE;
	description = " Is this your item? " ;
};

func int DIA_Matteo_Jewerly_Form_Done_Condition()
{
	if((MIS_JewerlyForm == LOG_Running) && (Npc_HasItems(hero,ItMi_SteelForm) >= 1))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Form_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Matteo_Jewerly_Form_Done_01_00 " );	// Is this your item?
	B_GiveInvItems(other,self,ItMi_SteelForm,1);
	Npc_RemoveInvItems(self,ItMi_SteelForm,1);
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_Done_01_01 " );	// O Innos! I can't believe my eyes! Where did you get it?
	AI_Output(other,self, " DIA_Matteo_Jewerly_Form_Done_01_02 " );	// Where the thieves who robbed you kept all their possessions.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_Done_01_03 " );	// Scoundrels! I hope they pay for what they did.
	AI_Output(other,self, " DIA_Matteo_Jewerly_Form_Done_01_04 " );	// You can be sure.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_Done_01_05 " );	// Okay, buddy. I am extremely grateful to you for your help.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_Done_01_06 " );	// And good deeds should always be well rewarded!
	AI_Output(self,other, " DIA_Matteo_Jewerly_Form_Done_01_07 " );	// So you can choose whatever you want.
	MIS_JewerlyForm = LOG_Success;
	Log_SetTopicStatus(TOPIC_JewerlyForm,LOG_Success);
	B_LogEntry(TOPIC_JewerlyForm, " I returned Matteo to his jewel form. He was extremely happy! " );
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done, " I wouldn't mind gold. " ,DIA_MAtteo_Jewerly_Form_Done_Gold);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done, " Do you have any magic potions? " ,DIA_MAtteo_Jewerly_Form_Done_Potion);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done, " I could use a good weapon. " ,DIA_MAtteo_Jewerly_Form_Done_Weapon);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done, " How about armor? " ,DIA_MAtteo_Jewerly_Form_Done_Armor);
	Info_AddChoice(DIA_MAtteo_Jewerly_Form_Done, " Better teach me the art of the jeweler. " ,DIA_MAtteo_Jewerly_Form_Done_Teach);
};

func void DIA_MAtteo_Jewerly_Form_Done_Gold()
{
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Gold_01_01 " );	// I wouldn't mind gold.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Gold_01_02 " );	// Well, of course, gold... Everyone needs it!
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Gold_01_03 " );	// Here, take these three hundred gold coins. That's almost twice as much as the item you brought.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Potion()
{
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Potion_01_01 " );	// Do you have any magic potions?
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Potion_01_02 " );	// Of course. I just have one of these.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Potion_01_03 " );	// Very rare! I kept it exclusively for my best clients.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Potion_01_04 " );	// Here, take this. Now it's yours.
	B_GiveInvItems(self,other,ITPO_FALLDEFENCE,1);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Weapon()
{
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Weapon_01_01 " );	// I could use a good weapon.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Weapon_01_02 " );	// Without a doubt... (businesslike) It's extremely important to have a reliable sword or mace handy. Especially nowadays...
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Weapon_01_03 " );	// Here, I just have one of these. I'm sure you won't be disappointed with it.
	B_GiveInvItems(self,other,ITMW_1H_MACE_107,1);
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Armor()
{
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Armor_01_01 " );	// How about armor?
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Armor_01_02 " );	// Unfortunately, I do not have armor that would reliably protect you from, say, orcs or mrakoris.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Armor_01_03 " );	// So I can only give you these clothes.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Armor_01_04 " );	// But it's better than nothing. Is not it?
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Armor_01_05 " );	// Okay, give it here.
	B_GiveInvItems(self,other,ITAR_Vlk_M,1);
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Armor_01_06 " );	// Here, take this. I hope she will be in time for you.
	Matteo_LeatherBought = TRUE;
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
};

func void DIA_MAtteo_Jewerly_Form_Done_Teach()
{
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_01 " );	// Better teach me the art of jewellery.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_02 " );	// Frankly, I did not expect to hear such a request from you.
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_03 " );	// The rest is of little interest to me. So will you teach me?
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_04 " );	// Okay. In the end, you proved that you are a worthy person and you can be trusted.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_05 " );	// However, I want to warn you right away that the art of a jeweler is a rather complicated thing.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_06 " );	// You will need to have some experience to understand the basics of this profession.
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_07");	//Понимаю.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_08 " );	// Then maybe we'll start by teaching you how to make regular steel rings.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Form_Done_Teach_01_09 " );	// If you can handle this, then I'll teach you everything else!
	AI_Output(other,self,"DIA_MAtteo_Jewerly_Form_Done_Teach_01_10");	//Идет.
	Matteo_TeachJewel = TRUE;
	Log_CreateTopic(TOPIC_TeachJewel,LOG_NOTE);
	B_LogEntry(TOPIC_TeachJewel, " Matteo has agreed to teach me about jewelry. First, he'll show me how to make simple steel rings. " );
	Info_ClearChoices(DIA_MAtteo_Jewerly_Form_Done);
	Wld_AssignRoomToGuild("matteo",GIL_NONE);
};

instance DIA_MAtteo_Jewerly_Teach_L1(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L1_condition;
	information = DIA_MAtteo_Jewerly_Teach_L1_info;
	permanent = TRUE;
	description = " Teach me jewelry. (Training Points: 5) " ;
};

func int DIA_MAtteo_Jewerly_Teach_L1_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == FALSE) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L1_info()
{
	var int cost;

	cost = 5 ;

	AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_L1_01_00 " );	// Teach me jewelry.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_03_90 " );	// You don't have enough experience! Come back later.
	}
	else
	{
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_01 " );	// So. Remember well that such an activity does not tolerate haste.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_02 " );	// First thing you need is an iron ingot to make a ring setting out of it.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_03 " );	// Next, you'll need a gem. This is the most important component in our business.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_04 " );	// They are very hard to find! But without it, you will absolutely not succeed.
		AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_L1_01_05 " );	// Where did you get them?
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_06 " );	// Usually from merchants who sailed from Varant or Myrtana. But they cost, as you know, a fortune!
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_07 " );	// So not everyone could afford this kind of thing.
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_08");	//Что дальше?
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_09 " );	// You also need sulfur, tar and a piece of coal. All of them are needed to cut the gem itself.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_10 " );	// When you have all the components on hand, you just take a mold for casting blanks and melt the metal there.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_11 " );	// Then you process the stone on the workbench to the shape of the setting, attach it there and that's it - your ring is ready.
		AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_L1_01_12 " );	// Doesn't sound that hard.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_13 " );	// Wait. That's not all you need to know.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_14 " );	// The fact is that all gems contain a small particle of magic, which allows the ring to acquire its magical properties.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_15 " );	// Each type of gem endows the item with its own SPECIAL properties. This must be understood!
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_16 " );	// Of course, ordinary steel is not very suitable for creating truly beautiful and powerful artifacts.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_17 " );	// But just for practice, it's fine. Well, do you remember everything?
		AI_Output(other,self,"DIA_MAtteo_Jewerly_Teach_L1_01_18");	//Конечно.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_19 " );	// Great. Yes, and one more thing.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L1_01_20 " );	// I won't charge you for this lesson. But you will have to pay for the next ones.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		AI_Print( " Learned crafting recipe - 'Iron Ore Ring' " );
		JEWERLY_LEVEL_L1 = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TeachJewel, " Now I can make steel rings. For this I need an iron ingot, any of the gems, and sulfur, coal and resin as necessary components for the job. And besides, I need a mold for casting rings. " ) ;
	};
};

instance DIA_Matteo_Jewerly_GiveForm(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_GiveForm_Condition;
	information = DIA_Matteo_Jewerly_GiveForm_Info;
	permanent = FALSE;
	description = " Where can I get a mold for casting rings now? " ;
};

func int DIA_Matteo_Jewerly_GiveForm_Condition()
{
	if(JEWERLY_LEVEL_L1 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Matteo_Jewerly_GiveForm_Info()
{
	AI_Output(other,self, " DIA_Matteo_Jewerly_GiveForm_01_00 " );	// And where can I get a mold for casting rings now?
	AI_Output(self,other, " DIA_Matteo_Jewerly_GiveForm_01_01 " );	// Here, take mine. After all, I don't need it anymore.
	B_GiveInvItems(self,other,ItMi_SteelForm,1);
	AI_Output(self,other, " DIA_Matteo_Jewerly_GiveForm_01_02 " );	// But don't lose it!
	AI_Output(other,self, " DIA_Matteo_Jewerly_GiveForm_01_03 " );	// Of course.
};

instance DIA_Matteo_Jewerly_Table(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_Jewerly_Table_Condition;
	information = DIA_Matteo_Jewerly_Table_Info;
	permanent = FALSE;
	description = " Where can I find a jewelry workbench? " ;
};

func int DIA_Matteo_Jewerly_Table_Condition()
{
	if((JEWERLY_LEVEL_L1 == TRUE) && (FindJewelTable == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Jewerly_Table_Info()
{
	AI_Output(other,self, " DIA_Matteo_Jewerly_Table_01_00 " );	// Where can I find a jewelry workbench?
	AI_Output(self,other, " DIA_Matteo_Jewerly_Table_01_01 " );	// How where? Here, of course! There he is, standing at the window.
	AI_Output(self,other, " DIA_Matteo_Jewerly_Table_01_02 " );	// But be careful with it. You won't find these anywhere else here.
	FindJewelTable = TRUE;
};

instance DIA_MAtteo_Jewerly_Teach_L2(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L2_condition;
	information = DIA_MAtteo_Jewerly_Teach_L2_info;
	permanent = TRUE;
	description = " I want to upgrade my jeweler navy. (Learning points: 10, Cost: 1000 coins) " ;
};

func int DIA_MAtteo_Jewerly_Teach_L2_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == TRUE) && (Kapitel >= 4) && (JEWERLY_LEVEL_L2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L2_info()
{
	var int cost;
	var int money;

	cost = 10 ;
	money = 1000;

	AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_L2_01_00 " );	// I want to upgrade my current jeweler.

	if (Chapter >=  3 )
	{
		if(hero.lp < kosten)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		}
		else if(Npc_HasItems(other,ItMi_Gold) < money)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L2_03_90 " );	// You don't have enough gold to train! Come back later.
		}
		else
		{
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L2_01_01 " );	// Good. I think it's time for you to learn how gold jewelry is made.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L2_01_02 " );	// All you need is a gold bar and two each of sulfur, tar, and coal.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L2_01_03 " );	// The rest of the process is no different from making steel jewelry.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L2_01_04 " );	// Practice more and you will definitely succeed.
			hero.lp = hero.lp - kosten;
			RankPoints = RankPoints + cost;
			Npc_RemoveInvItems(other,ItMi_Gold,money);
			AI_Print( " Learned crafting recipe - 'Golden Ring' " );
			JEWERLY_LEVEL_L2 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TeachJewel, " Now I can make gold rings. To do this, I need a gold bar, any of the gems, and two pieces of sulfur, coal and resin. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L2_01_05 " );	// You're not ready for this yet! Let's talk about it later.
	};
};

instance DIA_MAtteo_Jewerly_Teach_L3(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_L3_condition;
	information = DIA_MAtteo_Jewerly_Teach_L3_info;
	permanent = TRUE;
	description = " What else can I learn about jewelry? (Learning Points: 15, Cost: 3000 coins) " ;
};

func int DIA_MAtteo_Jewerly_Teach_L3_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L1 == TRUE) && (JEWERLY_LEVEL_L2 == TRUE) && (Kapitel >= 5) && (JEWERLY_LEVEL_L3 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_L3_info()
{
	var int cost;
	var int money;

	cost = 15 ;
	money = 3000;

	AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_L3_01_00 " );	// What else can I learn about jewelry making?

	if (Chapter >=  4 )
	{
		if(hero.lp < kosten)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
		}
		else if(Npc_HasItems(other,ItMi_Gold) < money)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_03_90 " );	// You don't have enough gold to train! Come back later.
		}
		else
		{
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_01_01 " );	// Only truly skilled craftsmen can create jewelry from magical ore.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_01_02 " );	// To do this, you need an ore ingot and three pieces of sulfur, resin and coal.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_01_03 " );	// Take your time. Focus on polishing the stone and try not to damage it as you set it.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_01_04 " );	// All this is certainly not easy, but the result is fully justified.
			AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_01_05 " );	// Now go and try to make some ring!
			hero.lp = hero.lp - kosten;
			RankPoints = RankPoints + cost;
			Npc_RemoveInvItems(other,ItMi_Gold,money);
			AI_Print( " Learned crafting recipe - 'Magic Ore Ring' " );
			JEWERLY_LEVEL_L3 = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TeachJewel, " Now I can make magic ore rings. To do this, I need an ore ingot, any of the gems, and three pieces of sulfur, coal and resin. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_L3_01_06 " );	// You're not ready for this yet! Let's talk about it later.
	};
};

instance DIA_MAtteo_Jewerly_Teach_CanLAM(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_CanLAM_condition;
	information = DIA_MAtteo_Jewerly_Teach_CanLAM_info;
	permanent = FALSE;
	description = " Is there anything else you can teach me? " ;
};

func int DIA_MAtteo_Jewerly_Teach_CanLAM_condition()
{
	if((Matteo_TeachJewel == TRUE) && (JEWERLY_LEVEL_L3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_CanLAM_info()
{
	AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_CanLAM_01_00 " );	// Do you have anything else to teach me?
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_CanLAM_01_01 " );	// The only other thing I could teach you is how to make amulets.
	AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_CanLAM_01_02 " );	// I can tell you about that too, if you want, of course.
};

instance DIA_MAtteo_Jewerly_Teach_LAM(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_MAtteo_Jewerly_Teach_LAM_condition;
	information = DIA_MAtteo_Jewerly_Teach_LAM_info;
	permanent = TRUE;
	description = " Teach me how to make amulets. (Learning points: 20, Cost: 5000 coins) " ;
};

func int DIA_MAtteo_Jewerly_Teach_LAM_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_MAtteo_Jewerly_Teach_CanLAM) ==  TRUE ) && (Chapter >=  5 ) && ( JEWERLY_LEVEL_AMUL  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_Teach_LAM_info()
{
	var int cost;
	var int money;

	cost = 20 ;
	money = 5000;

	AI_Output(other,self, " DIA_MAtteo_Jewerly_Teach_LAM_01_00 " );	// Teach me how to make amulets.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_03_90 " );	// You don't have enough gold to train! Come back later.
	}
	else
	{
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_01 " );	// Then listen carefully. The creation of these pieces of jewelry requires true art in jewelry making.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_02 " );	// Even experienced craftsmen sometimes fail to do this.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_03 " );	// The process is quite simple, but requires your utmost attention.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_04 " );	// The frame of the amulet is very fragile, so one wrong move and you have to start all over again!
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_05 " );	// Take an ore ingot, melt it down, and mold it into a fastener shape. Then carefully insert the stone there and secure it.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_06 " );	// Basically, that's it. But you'd better try to make at least one amulet yourself.
		AI_Output(self,other, " DIA_MAtteo_Jewerly_Teach_LAM_01_07 " );	// Then the process of making it will become clearer to you.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Learned crafting recipe - 'Magic Ore Amulet' " );
		JEWERLY_LEVEL_AMUL = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TeachJewel, " Now I can make amulets from magic ore. To do this, I need an ore ingot, any of the gems, and two pieces of sulfur, coal and resin. " );
	};
};

instance DIA_Matteo_Jewerly_LoaNeacle(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacle_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacle_Info;
	permanent = FALSE;
	description = " Can you make one decoration for me? " ;
};

func int DIA_Matteo_Jewerly_LoaNeacle_Condition()
{
	if((MIS_JewerlyForm == LOG_Success) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacle_Info()
{
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacle_01_00 " );	// Can you make one decoration for me?
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacle_01_01 " );	// Hmmm... And what are we talking about?
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacle_01_02 " );	// I need a black pearl necklace.
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacle_01_03 " );	// Yeah, I see. Decided to impress some young girl? BUT?
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacle_01_04 " );	// Well, not to wear it yourself. So, can you do it?
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacle_01_05 " );	// Sure, no problem. But, as you know, for this I need handy materials.
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacle_01_06 " );	// Which ones exactly?
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacle_01_07 " );	// Five black pearls and a bar of gold for the setting with the chain. If you bring them to me, you will have a necklace.
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacle_01_08 " );	// How much do you want for this job?
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacle_01_09 " );	// Forget it! I won't take money from you. I'll do it just like that, as a token of gratitude for your help.
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacle_01_10 " );	// Okay, agreed.
	B_LogEntry(TOPIC_LoaRomance, " Matteo can make me a pearl necklace. It will take five black pearls and a gold bar. " );
};

instance DIA_Matteo_Jewerly_LoaNeacleDo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacleDo_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacleDo_Info;
	permanent = FALSE;
	description = " I brought everything you asked for. " ;
};

func int DIA_Matteo_Jewerly_LoaNeacleDo_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_MAtteo_Jewerly_LoaNeacle) ==  TRUE ) && (MY_LoaRomance == LOG_Running) && (LoaCase_02 ==  TRUE ) && (LoaCase_02_Done ==  FALSE ) && (Npc_HasItems(hero,It(My_StuckIms ) && s (Has) >=  Np1 ; hero,It's_DarkPearl) >= 5 )) 
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacleDo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacleDo_01_00 " );	// I brought everything you asked for.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacleDo_01_01 " );	// Let's see... So, everything seems to be enough.
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacleDo_01_02 " );	// Then I'll get to work immediately. I think it will be ready by tomorrow morning.
	B_LogEntry(TOPIC_LoaRomance, " I brought Matteo the materials needed to make the necklace. Tomorrow he can be picked up. " );
	MakeDarkPearleNeackle = Wld_GetDay();
};

instance DIA_Matteo_Jewerly_LoaNeacleDone(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Jewerly_LoaNeacleDone_Condition;
	information = DIA_MAtteo_Jewerly_LoaNeacleDone_Info;
	permanent = FALSE;
	description = " Is my necklace ready? " ;
};

func int DIA_Matteo_Jewerly_LoaNeacleDone_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((Npc_KnowsInfo(other,DIA_MAtteo_Jewerly_LoaNeacleDo) == TRUE) && (MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (MakeDarkPearleNeackle <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_MAtteo_Jewerly_LoaNeacleDone_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacleDone_01_00 " );	// Is my necklace ready?
	AI_Output(self,other, " DIA_Matteo_Jewerly_LoaNeacleDone_01_01 " );	// Yes, you can take it.
	B_GiveInvItems(self,other,ItMi_BlackPearlNeckle,1);
	AI_Output(other,self, " DIA_Matteo_Jewerly_LoaNeacleDone_01_02 " );	// Thank you.
	B_LogEntry(TOPIC_LoaRomance, " I made a real black pearl necklace for Loa. I think she'll like it. " );
};
