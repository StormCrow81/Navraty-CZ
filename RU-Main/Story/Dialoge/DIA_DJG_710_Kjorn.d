
instance DIA_Kjorn_EXIT(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 999;
	condition = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kjorn_Hello(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Kjorn_Hello_Condition()
{
	if((Npc_GetDistToNpc(self,hero) < 300) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_Hello_Info()
{
	AI_Output(self,other, " DIA_Kjorn_Hello_06_00 " );	// Hey, come here!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Чего тебе?
	AI_Output(self,other, " DIA_Kjorn_Hello_06_02 " );	// This valley is a dangerous place, and without the right equipment, you can immediately consider yourself a corpse.
	AI_Output(other,self, " DIA_Kjorn_Hello_15_03 " );	// I assume YOU have the right gear.
	AI_Output(self,other, " DIA_Kjorn_Hello_06_04 " );	// Guessed. And I can even sell it to you.
};


instance DIA_Kjorn_TRADE(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " What can you offer me? " ;
};


func int DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Kjorn_TRADE_15_00 " );	// What can you offer me?
	B_GiveTradeInv(self);
};


instance DIA_Kjorn_SellInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent = FALSE;
	description = " Don't you sell information? " ;
};


func int DIA_Kjorn_SellInfos_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Kjorn_SellInfos_Info()
{
	AI_Output(other,self, " DIA_Kjorn_SellInfos_15_00 " );	// Don't you sell information?
	AI_Output(self,other, " DIA_Kjorn_SellInfos_06_01 " );	// Maybe. If the price is right, I'll tell you everything I know.
	AI_Output(other,self, " DIA_Kjorn_SellInfos_15_02 " );	// How much do you charge?
	AI_Output(self,other, " DIA_Kjorn_SellInfos_06_03 " );	// Hmm...(thoughtfully) Hard to say! But I think fifty gold pieces for every piece of information you get would be fine.
};


instance DIA_Kjorn_BuyInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent = TRUE;
	description = " I need some information. " ;
};


func int DIA_Kjorn_BuyInfos_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Kjorn_SellInfo ) && ( CAPITAL CATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_BuyInfos_Info()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_15_00 " );	// I need information.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_06_01 " );	// Fifty gold!
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos, " It's too expensive. " ,DIA_Kjorn_BuyInfos_HoldMoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " Да, держи. " ,DIA_Kjorn_BuyInfos_GiveMoney);
	};
};

func void DIA_Kjorn_BuyInfos_HoldMoney()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_HoldMoney_15_00 " );	// This is too expensive for me.
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_GiveMoney()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_GiveMoney_15_00 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_GiveMoney_15_01 " );	// Now tell me...
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,Dialog_Back,DIA_Kjorn_BuyInfos_Back);
	if(KjornToldDragon == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " ... about dragons. " ,DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if(KjornToldDragon == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " ... more about dragons. " ,DIA_Kjorn_BuyInfos_Dragon2);
	};
	if(KjornToldColony == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " ... about Mining Valley. " ,DIA_Kjorn_BuyInfos_Colony1);
	}
	else if(KjornToldColony == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " ... more about Mining Valley. " ,DIA_Kjorn_BuyInfos_Colony2);
	};
	if(KjornToldOldCamp == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... о замке.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	if(KjorntoldOrks == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " ... about orcs. " ,DIA_Kjorn_BuyInfos_Orks1);
	}
	else if(KjorntoldOrks == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, " ... more about Orks. " ,DIA_Kjorn_BuyInfos_Orks2);
	};
};

func void DIA_Kjorn_BuyInfos_Back()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Back_15_00 " );	// You know, give me my money back, I changed my mind.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Back_06_01 " );	// As you wish.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon1()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Dragon1_15_00 " );	// Tell me about dragons.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Dragon1_06_01 " );	// Dragons are ancient, incredibly powerful creatures. Once upon a time there were many thousands.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Dragon1_06_02 " );	// But for more than a hundred years none of them has been seen.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Dragon1_06_03 " );	// Their blood is as hot as boiling oil. If they look into your eyes, your heart will turn to stone. Well, that's what I heard...
	KjornToldDragon = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon2()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Dragon2_15_00 " );	// Tell me more about dragons.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Dragon2_06_01 " );	// All dragons are different.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Dragon2_06_02 " );	// Some of them can cover the ground with layers of ice several feet thick.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Dragon2_06_03 " );	// Others prefer to live in swampy areas or in volcanoes.
	B_LogEntry( TOPIC_DRACHENJAGD , " Dragon Hunter Kjorn believes there are different types of dragons. Some of them prefer cold, damp places, while others seem to prefer fire. " );
	KjornToldDragon = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony1()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Colony1_15_00 " );	// Tell me about the Valley of Mines.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony1_06_01 " );	// The valley of the Mines of Khorinis is known throughout the land for its magical ore.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony1_06_02 " );	// These mountains are the only place where magical ores can be found.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony1_06_03 " );	// Weapons forged from this ore never break and can pierce even the toughest armor.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony1_06_04 " );	// Until recently, the entire valley was surrounded by a magical barrier. It was impenetrable and no one could get out.
	KjornToldColony = 1 ;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony2()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Colony2_15_00 " );	// Tell me more about the Valley of Mines.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony2_06_01 " );	// The valley has changed a lot in the last few days.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony2_06_02 " );	// When the orcs came, other terrible creatures appeared with them, many of which had never been seen here before.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony2_06_03 " );	// It is said that a few lone hunters are still in the valley, but I'm not sure if they are still alive.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Colony2_06_04 " );	// It seems that all the creatures of Beliar suddenly rushed in droves into this valley.
	KjornToldColony = 2 ;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_OldCamp1()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_OldCamp1_15_00 " );	// Tell me about the castle.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_OldCamp1_06_01 " );	// It is located in the heart of the Valley of Mines.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_OldCamp1_06_02 " );	// When the valley was still a prison, the ore barons controlled all the ore trade from here.
	KjornToldOldCamp = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks1()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Orks1_15_00 " );	// Tell me about orcs.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Orks1_06_01 " );	// Orcs have been here recently. At least the orcs now in front of the castle.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Orks1_06_02 " );	// But I'm surprised how organized they are. Orcs usually attack blindly, no matter what.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Orks1_06_03 " );	// And these orcs are waiting for the right moment. They are waiting, but we don't know what.
	KjorntoldOrks = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks2()
{
	AI_Output(other,self, " DIA_Kjorn_BuyInfos_Orks2_15_00 " );	// Tell me more about orcs.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Orks2_06_01 " );	// Orcs are led by elite warriors. These warriors are very strong and dressed in good armor. They are almost impossible to kill.
	AI_Output(self,other, " DIA_Kjorn_BuyInfos_Orks2_06_02 " );	// I once saw one of them cut down a large oak tree with one blow of his axe.
	KjorntoldOrks = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};


instance DIA_Kjorn_AllDragonsDead(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent = FALSE;
	description = " I've killed all the dragons! " ;
};


func int DIA_Kjorn_AllDragonsDead_Condition()
{
	if ((MY_AllDragonsDead ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Kjorn_AllDragonsDead_15_00 " );	// I killed all the dragons!
	AI_Output(self,other, " DIA_Kjorn_AllDragonsDead_06_01 " );	// (laughs) Of course, and I'm a paladin.
	AI_Output(self,other, " DIA_Kjorn_AllDragonsDead_06_02 " );	// You may have killed ONE, but all of them? Go find a fool who will believe you.
};


instance DIA_Kjorn_PICKPOCKET(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 900;
	condition = DIA_Kjorn_PICKPOCKET_Condition;
	information = DIA_Kjorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kjorn_PICKPOCKET_Condition()
{
	return  C_Robbery ( 47 , 75 );
};

func void DIA_Kjorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,Dialog_Back,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};


instance DIA_KJORN_FUCKOFF(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 2;
	condition = dia_kjorn_fuckoff_condition;
	information = dia_kjorn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kjorn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kjorn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};
