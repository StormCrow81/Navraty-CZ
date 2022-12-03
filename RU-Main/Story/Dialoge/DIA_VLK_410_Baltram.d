

instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Baltram_Sperre(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Sperre_Condition;
	information = DIA_Baltram_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Baltram_Lock_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Sperre_Info()
{
	AI_Output(self,other, " DIA_Baltram_WAREZ_01_03 " );	// People like you won't get anything from me!
	AI_Output(self,other, " DIA_Baltram_WAREZ_01_06 " );	// Now get out! You're scaring all my clients.
	AI_StopProcessInfos(self);
};

instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( self . aivar [ AIV_TalkedToPlayer ] ==  FALSE ) && ( MIS_Nagur_Bote ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other, " DIA_Baltram_Hallo_01_00 " );	// Welcome foreigner, my name is Baltram. Do you want to stock up on food?
		AI_Output(self,other, " DIA_Baltram_Hallo_01_01 " );	// I'm afraid I'll have to disappoint you. At the moment I have little to offer.
		AI_Output(self,other, " DIA_Baltram_Hallo_01_02 " );	// But I'm expecting a new shipment soon.
	}
	else
	{
		AI_Output(self,other, " DIA_Baltram_Hallo_01_03 " );	// If you came to buy food from me, you came in vain.
		AI_Output(self,other, " DIA_Baltram_Hallo_01_04 " );	// I don't have the best opinion of you mercenaries! You are the only problem.
	};
};


instance DIA_Addon_Baltram_LaresAbloese(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = DIA_Addon_Baltram_LaresAbloese_Condition;
	information = DIA_Addon_Baltram_LaresAbloese_Info;
	important = TRUE;
};


func int DIA_Addon_Baltram_LaresAbloese_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info()
{
	AI_Output(other,self, " DIA_Addon_Baltram_LaresAbloese_15_00 " );	// Why are you looking at me so suspiciously?
	AI_Output(self,other, " DIA_Addon_Baltram_LaresAbloese_01_01 " );	// I noticed you have the sign of the Ring of Water.
	AI_Output(other,self, " DIA_Addon_Baltram_LaresAbloese_15_02 " );	// Are you also a member of this society?
	AI_Output(self,other, " DIA_Addon_Baltram_LaresAbloese_01_03 " );	// What if so?
	AI_Output(other,self, " DIA_Addon_Baltram_LaresAbloese_15_04 " );	// I should tell you that the Lares port officer wants to be relieved.
	AI_Output(self,other, " DIA_Addon_Baltram_LaresAbloese_01_05 " );	// Good. I'll see to it that they do it.
	AI_Output(other,self, " DIA_Addon_Baltram_LaresAbloese_15_06 " );	// It's understandable.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_Addon_BringRangerToLares, " Baltram, marketplace merchant, will make sure Lares is replaced at his post. Lares can leave the harbor RIGHT NOW. " );
	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};


func int DIA_Baltram_Job_Condition()
{
	if ((MY_Nagur_Boat != LOG_Running) && (MY_Nagur_Boat !=  LOG_SUCCESS ) && (hero.guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other,self, " DIA_Baltram_Job_15_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_Baltram_Job_01_01 " );	// No, I already have an errand boy. Try talking to other merchants.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( MIS_Nagur_Bote == LOG_Running ))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self,other, " DIA_Baltram_Trick_01_00 " );	// Are you looking for a job?
	AI_Output(other,self, " DIA_Baltram_Trick_15_01 " );	// Of course, but what do you need?
	AI_Output(self,other, " DIA_Baltram_Trick_01_02 " );	// My errand boy hasn't returned, and I'm waiting for a delivery from Farmer Akil.
	AI_Output(other,self, " DIA_Baltram_Trick_15_03 " );	// And how much do you value this work?
	AI_Output(self,other, " DIA_Baltram_Trick_01_04 " );	// I'll give you fifty gold coins.
	AI_Output(other,self, " DIA_Baltram_Trick_15_05 " );	// Great, I agree.
	AI_Output(self,other, " DIA_Baltram_Trick_01_06 " );	// Okay, just tell Akil I sent you. He will give you a package. Bring it to me.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry_Quiet(TOPIC_Nagur, " Baltram has hired me as an errand boy. Now, I have to deliver a package from Akila Farm to him. " );
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram, " If I bring Baltram his package, he will pay me fifty gold coins. " );
};


var int Baltram_TradeLOG;

instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};

func int DIA_Baltram_WAREZ_Condition()
{
	if (Wld_IsTime( 5 , 5 , 20 , 5 ))
	{
		return TRUE;
	};
};

func void DIA_Baltram_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Baltram_WAREZ_15_00 " );	// Show me your products.

	if(Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, " Baltram trades products in the marketplace. " );
		Baltram_TradeLOG = TRUE;
	};
	if ((Chapter ==  3 ) && (MY_RescueBennet !=  LOG_SUCCESS ))
	{
		AI_Output(self,other, " DIA_Baltram_WAREZ_01_01 " );	// They shouldn't have let things go this far. Now one of the mercenaries killed the paladin.
		AI_Output(self,other, " DIA_Baltram_WAREZ_01_02 " );	// Something like this must have happened!
	};
	if((BaltramCantTradeAgain == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		AI_Output(self,other, " DIA_Baltram_WAREZ_01_03 " );	// People like you won't get anything from me.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Почему?
		AI_Output(self,other, " DIA_Baltram_WAREZ_01_05 " );	// First you lead the farmers astray, and then you act like nothing happened.
		AI_Output(self,other, " DIA_Baltram_WAREZ_01_06 " );	// Now get out, you'll scare all my clients away.
		BaltramCantTrade = TRUE;
		AI_StopProcessInfos(self);
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Baltram_Skip(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_Skip_Condition;
	information = DIA_Addon_Baltram_Skip_Info;
	description = " So you trade with pirates? " ;
};


func int DIA_Addon_Baltram_Skip_Condition()
{
	if(SCKnowsBaltramAsPirateTrader == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_Skip_Info()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_15_00 " );	// So you trade with pirates?
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_01_01 " );	// What?...(frightened) Who told you that?
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_15_02 " );	// I spoke to one of them. Looks like he's waiting for you in his bay.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_01_03 " );	// What should I do? Times are tough right now. Everyone gets out as best they can.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " Weren't you afraid that you might be discovered? " ,DIA_Addon_Baltram_Skip_erwischen);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " You will be punished for this! " ,DIA_Addon_Baltram_Skip_MIL);
};

func void DIA_Addon_Baltram_Skip_Back()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_Back_15_00 " );	// That's all I wanted to know.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MILE()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_MIL_15_00 " );	// You will be punished for this!
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_MIL_01_01 " );	// Listen! Let me tell you everything I know, and you won't give me away, okay?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " What did you trade? " ,DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " What do you know about pirates? " ,DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_erwisch()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_erwischen_15_00 " );	// Weren't you afraid that you might be discovered?
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_erwischen_01_01 " );	// I understood that this is possible. You exposed me, didn't you?
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_erwischen_01_02 " );	// Hope you keep your mouth shut.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " What did you trade? " ,DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " What do you know about pirates? " ,DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_was()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_was_15_00 " );	// And what did you trade?
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_was_01_01 " );	// Basically, I sold them food.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_was_01_02 " );	// And for this he received from them the best rum in Khorinis.
	Info_AddChoice(DIA_Addon_Baltram_Skip, " That's all I wanted to know. " ,DIA_Addon_Baltram_Skip_Back);
	Info_AddChoice(DIA_Addon_Baltram_Skip, " I could trade for you. " ,DIA_Addon_Baltram_Skip_Ich);
};

func void DIA_Addon_Baltram_Skip_I()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_Ich_15_00 " );	// I could make the deal for you.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_Ich_01_01 " );	// That would be great. I can't leave the city now.
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	B_GiveInvItems(self,other,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_Ich_01_02 " );	// Here, take this bag and tell Skip I need more rum this time.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_Ich_01_03 " );	// At least three bottles.
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade, " Baltram gave me a package. I should take it to Skip. " );
	MIS_Addon_Baltram_Paket4Skip = LOG_Running;
};

func void DIA_Addon_Baltram_Skip_pirate()
{
	AI_Output(other,self, " DIA_Addon_Baltram_Skip_pirat_15_00 " );	// What do you know about pirates?
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_pirat_01_01 " );	// They live in a remote part of the island.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_pirat_01_02 " );	// As far as I know, the only way to get there is by ship.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_pirat_01_03 " );	// The inhabitants of Khorinis are afraid of them. This is understandable, because pirates are desperate thugs.
	AI_Output(self,other, " DIA_Addon_Baltram_Skip_pirat_01_04 " );	// However, I think bandits are even worse.
};


instance DIA_Addon_Baltram_SkipsRum(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_SkipsRum_Condition;
	information = DIA_Addon_Baltram_SkipsRum_Info;
	description = " I brought rum. But Skip only gave me two bottles. " ;
};


func int DIA_Addon_Baltram_SkipsRum_Condition()
{
	if ((Skip_Room4Baltram ==  TRUE ) && (MY_Addon_Baltram_Packet4Skip == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Room) >=  2 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_SkipsRum_Info()
{
	AI_Output(other,self, " DIA_Addon_Baltram_SkipsRum_15_00 " );	// I brought rum. But Skip only gave me two bottles.
	AI_Output(self,other, " DIA_Addon_Baltram_SkipsRum_01_01 " );	// It's a bit expensive... What does he think he is? Okay, give them here.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,2);
	AI_Output(self,other, " DIA_Addon_Baltram_SkipsRum_01_02 " );	// Well, I can't pay you much. I think that's enough.
	CreateInvItems(self,ItMi_Gold,10);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = " Where can I find Akila Farm? " ;
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other,self, " DIA_Baltram_AkilsHof_15_00 " );	// Where can I find the Akila farm?
	AI_Output(self,other, " DIA_Baltram_AkilsHof_01_01 " );	// Once you exit the east gate, stay on the road leading southeast.
	AI_Output(self,other, " DIA_Baltram_AkilsHof_01_02 " );	// Soon you will see a stone staircase. When you climb it, you can already see the Akila farm.
};


instance DIA_Baltram_delivery (C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_delivery_condition;
	information = DIA_Baltram_delivery_info;
	permanent = FALSE;
	description = " I brought a package from Akil. " ;
};

func int DIA_Baltram_delivery_condition()
{
	if (Npc_HasItems(other,ItMi_BaltramPaket) >=  1 )
	{
		return TRUE;
	};
};

func void DIA_Baltram_delivery_info()
{
	AI_Output(other,self, " DIA_Baltram_Lieferung_15_00 " );	// I brought a package from Akil.
	AI_Output(self,other, " DIA_Baltram_Lieferung_01_01 " );	// Great! Now I can trade fresh produce again. Here are your fifty gold pieces.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};

instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = " Maybe we can work together again? " ;
};

func int DIA_Baltram_LetUsTrade_Condition()
{
	if((BaltramCantTrade == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other,self, " DIA_Baltram_LetUsTrade_15_00 " );	// Maybe we should work together again?
	AI_Output(self,other, " DIA_Baltram_LetUsTrade_01_01 " );	// Listen, if you bring me ten hams and ten bottles of wine, then I'm ready to deal with you again.
	AI_Output(other,self, " DIA_Baltram_LetUsTrade_15_02 " );	// I'll try.
	MIS_BaltramTradeAgain = LOG_Running;
	Log_CreateTopic(TOPIC_BaltramTradeAgain,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BaltramTradeAgain,LOG_Running);
	B_LogEntry(TOPIC_BaltramTradeAgain, " If I bring Baltram ten hams and ten bottles of wine, then he will deal with me again. " );
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = " I brought what you asked for. " ;
};

func int DIA_Baltram_HaveYourWarez_Condition()
{
	if(MIS_BaltramTradeAgain == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other,self, " DIA_Baltram_HaveYourWarez_15_00 " );	// I brought what you asked for.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Покажи.

	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other, " DIA_Baltram_HaveYourWarez_01_02 " );	// We agreed on ten hams! Come back when you get them.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other, " DIA_Baltram_HaveYourWarez_01_03 " );	// What about ten bottles of wine? Have you forgotten about them?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other, " DIA_Baltram_HaveYourWarez_01_04 " );	// Hmmm, not the best quality, but you don't have to be picky these days.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTradeAgain = LOG_SUCCESS;
		MIS_BaltramTrade = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BaltramTradeAgain,LOG_SUCCESS);
		B_LogEntry(TOPIC_BaltramTradeAgain, " Baltram will now trade with me again. " );
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other, " DIA_Baltram_HaveYourWarez_01_05 " );	// Now nothing prevents us from doing business.
		BaltramCantTradeAgain = TRUE;
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return  C_Robbery ( 76 , 175 );
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

