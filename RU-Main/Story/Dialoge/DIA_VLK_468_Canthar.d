

instance DIA_Canthar_PICKPOCKET(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 900;
	condition = DIA_Canthar_PICKPOCKET_Condition;
	information = DIA_Canthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Canthar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 25 );
};

func void DIA_Canthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
	Info_AddChoice(DIA_Canthar_PICKPOCKET,Dialog_Back,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Canthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};

func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};


instance DIA_Canthar_EXIT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 999;
	condition = DIA_Canthar_EXIT_Condition;
	information = DIA_Canthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Canthar_EXIT_Info()
{
	// AI_Output(other,self,"DIA_Canthar_EXIT_15_00"); //I have to go!
	// AI_Output(self,other,"DIA_Canthar_EXIT_09_01"); //As you know.
	AI_StopProcessInfos(self);
};

instance DIA_Canthar_PersonalCRIMES(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_PersonalCRIMES_Condition;
	information = DIA_Canthar_PersonalCRIMES_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Canthar_PersonalCRIMES_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PersonalCRIMES_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other, " DIA_Canthar_PersonalCRIMES_09_00 " );	// It was very stupid of you to attack me.
	}
	else
	{
		AI_Output(self,other, " DIA_Canthar_PersonalCRIMES_09_01 " );	// (mockingly) You thought you could handle me that easily?
	};

	AI_Output(self,other, " DIA_Canthar_PersonalCRIMES_09_02 " );	// Either you'll apologize now, or I'll make sure you bitterly regret what you did!
	AI_Output(other,self, " DIA_Canthar_PersonalCRIMES_15_03 " );	// What exactly do you mean?
	B_Say_Gold(self,other,100);
	Info_ClearChoices(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice(DIA_Canthar_PersonalCRIMES, " I don't have that many! " ,DIA_Canthar_PersonalCRIMES_NotEnough);
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Canthar_PersonalCRIMES, " Here's your gold - let's forget about it! " ,DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output(other,self, " DIA_Canthar_PersonalCRIMES_Pay_15_00 " );	// Here's your gold - let's forget about it!
	AI_Output(self,other, " DIA_Canthar_PersonalCRIMES_Pay_09_01 " );	// Very smart of you!
	self.aivar[AIV_LastFightComment] = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output(other,self, " DIA_Canthar_PersonalCRIMES_NotEnough_15_00 " );	// I don't have that many!
	AI_Output(self,other, " DIA_Canthar_PersonalCRIMES_NotEnough_09_01 " );	// Then why are you wasting my time?
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Hallo(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_Hallo_Condition;
	information = DIA_Canthar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Hallo_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if ((Npc_HasEquippedArmor(other) ==  FALSE ) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisonel) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem (itm,ITAR_Prisoner) || ))
	{
		AI_Output(self,other, " DIA_Canthar_Hallo_09_00 " );	// Look who we have here!
		AI_Output(self,other, " DIA_Canthar_Hallo_09_01 " );	// You're going to the city - am I wrong?
		AI_Output(other,self, " DIA_Canthar_Hallo_15_02 " );	// Maybe.
		AI_Output(self,other, " DIA_Canthar_Hallo_09_03 " );	// Hmmm...(contemptuously) You look like a fugitive! And all the fugitives are heading for the city.
		AI_Output(self,other, " DIA_Canthar_Hallo_09_04 " );	// Maybe you're even an escaped convict from the colony.
		AI_Output(self,other, " DIA_Canthar_Hallo_09_05 " );	// I don't care where you come from! But I think I have an interesting offer for you.
		Canthar_GotMe = TRUE;
	}
	else  if (Hlp_IsItem(itm,ITAR_Bau_L) || Hlp_IsItem(itm,ITAR_Bau_M))
	{
		AI_Output(self,other, " DIA_Canthar_HelloArmor_09_06 " );	// How's the work going, farmer?
		Info_ClearChoices(DIA_Canthar_Hallo);
		Info_AddChoice(DIA_Canthar_Hallo, " Do I look like a farmer? " ,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice(DIA_Canthar_Hallo, " I have nothing to complain about. " ,DIA_Canthar_Hallo_Bauer);
	}
	else
	{
		AI_Output(self,other, " DIA_Canthar_Hallo_09_07 " );	// What can I do for you?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output(other,self, " DIA_Canthar_Hallo_Bauer_15_00 " );	// I have nothing to complain about.
	AI_Output(self,other, " DIA_Canthar_Hallo_Bauer_09_01 " );	// Can I do something for you?
	Info_ClearChoices(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output(other,self, " DIA_Canthar_Hallo_NoBauer_15_00 " );	// Do I look like a farmer?
	AI_Output(self,other, " DIA_Canthar_Hallo_NoBauer_09_01 " );	// You look like a farmer. But you don't talk like them!
	AI_Output(self,other, " DIA_Canthar_Hallo_NoBauer_09_02 " );	// If I'm not wrong about anything, I have an interesting suggestion for you.
	Canthar_GotMe = TRUE;
	Info_ClearChoices(DIA_Canthar_Hallo);
};


instance DIA_Canthar_WhatOffer(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_WhatOffer_Condition;
	information = DIA_Canthar_WhatOffer_Info;
	permanent = FALSE;
	description = " What can you offer me? " ;
};


func int DIA_Canthar_WhatOffer_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Canthar_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Canthar_WhatOffer_Info()
{
	AI_Output(other,self, " DIA_Canthar_WhatOffer_15_00 " );	// What can you offer me?
	if(Canthar_GotMe == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other, " DIA_Canthar_WhatOffer_09_01 " );	// Judging by the way you look, the guards will never let you into the city.
		}
		else
		{
			AI_Output(self,other, " DIA_Canthar_WhatOffer_09_02 " );	// (ironic) If you speak as 'persuasively' to the guards at the gate as you speak to me, they will never let you into the city.
		};
		AI_Output(self,other, " DIA_Canthar_WhatOffer_09_03 " );	// I can help you get into town.
		AI_Output(self,other, " DIA_Canthar_WhatOffer_09_04 " );	// I have this piece of paper - with the royal seal and the signature of the head of the city. Pass!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other, " DIA_Canthar_WhatOffer_09_05 " );	// With this pass in your pocket, you can safely enter the city, and the guards will have to let you through.
		};
		AI_Output(self,other, " DIA_Canthar_WhatOffer_09_06 " );	// Are you interested?
		Info_ClearChoices(DIA_Canthar_WhatOffer);
		Info_AddChoice(DIA_Canthar_WhatOffer, " No! Keep this paper for yourself! " ,DIA_Canthar_WhatOffer_No);
		Info_AddChoice(DIA_Canthar_WhatOffer, " What do you want for this pass? " ,DIA_Canthar_WhatOffer_Price);
		Info_AddChoice(DIA_Canthar_WhatOffer, " How will YOU get to the city? " ,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice(DIA_Canthar_WhatOffer, " That looks like a trick... " ,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output(self,other, " DIA_Canthar_WhatOffer_09_07 " );	// I'm a traveling merchant. I trade everything.
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Kantar trades various weapons. " );
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output(other,self, " DIA_Canthar_WhatOffer_Strings_15_00 " );	// This looks like a trick...
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Strings_09_01 " );	// No! No trick. You're just doing me a favor.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output(other,self, " DIA_Canthar_WhatOffer_HowYouIn_15_00 " );	// And how will YOU get to the city?
	AI_Output(self,other, " DIA_Canthar_WhatOffer_HowYouIn_09_01 " );	// The guards know me. I'll just tell them I lost my pass.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output(other,self, " DIA_Canthar_WhatOffer_Price_15_00 " );	// What do you want for this pass?
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Price_09_01 " );	// (satisfied) I KNEW I was right about you!
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Price_09_02 " );	// Listen. You will receive a pass from me. Right now!
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Просто так?
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Price_09_04 " );	// Yes. BUT: if I meet you in the city, you will have to do me a favor.
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Price_09_05 " );	// Well, agreed?
	Info_AddChoice(DIA_Canthar_WhatOffer, " Of course. Give this paper here. " ,DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output(other,self, " DIA_Canthar_WhatOffer_Ok_15_00 " );	// Of course. Give me this paper.
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Ok_09_01 " );	// Hold. But handle it with care, it is very valuable.
	CreateInvItems(self,ItWr_Passierschein, 1 );
	B_GiveInvItems(self,other,ItWr_Passierschein, 1 );
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Ok_09_02 " );	// And one more thing: don't even think about breaking your word!
	AI_Output(self,other, " DIA_Canthar_WhatOffer_Ok_09_03 " );	// I'm a merchant and have a lot of influence in the city - you can't get away with it just like that, trust me!
	Canthar_fallen = TRUE ;
	Info_ClearChoices(DIA_Canthar_WhatOffer);
	Log_CreateTopic(TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City,LOG_Running);
	B_LogEntry(TOPIC_City, " I received a pass from merchant Kantar that will allow me to enter the city. In return, I must do him a favor the next time I see him in the city. " );
};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output(other,self, " DIA_Canthar_WhatOffer_No_15_00 " );	// No! Keep this paper!
	AI_Output(self,other, " DIA_Canthar_WhatOffer_No_09_01 " );	// Hmm. Looks like I underestimated you, huh?
	AI_Output(self,other, " DIA_Canthar_WhatOffer_No_09_02 " );	// Okay. Do you need anything else? Can you show me my products?
	Info_ClearChoices(DIA_Canthar_WhatOffer);
};


instance DIA_Canthar_TRADE(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 888;
	condition = DIA_Canthar_TRADE_Condition;
	information = DIA_Canthar_TRADE_Info;
	permanent = TRUE;
	description = " Show me your products! " ;
	trade = TRUE;
};


func int DIA_Canthar_TRADE_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Canthar_WhatOffer ) ==  TRUE ) && Wld_IsTime ( 7 , 45 , 19 , 45 )) ;
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Canthar_TRADE_15_00 " );	// Show me your products!
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Выбирай.
	B_GiveTradeInv(self);
};


instance DIA_Canthar_PAYPRICEINCITY(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_PAYPRICEINCITY_Condition;
	information = DIA_Canthar_PAYPRICEINCITY_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Canthar_PAYPRICEINCITY_Condition()
{
	if ((Canthar_InTown ==  TRUE ) && (Npc_IsDead(Sarah) ==  FALSE ) && (Canthar_GotMe ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PAYPRICEINCITY_Info()
{
	if (Canthar_Gefallen ==  TRUE )
	{
		AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_00 " );	// You're indebted! And it's time to bring it back.
	}
	else
	{
		AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_01 " );	// Hey you, I have a suggestion for you.
	};
	AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_15_02 " );	// What do you want?
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_03 " );	// I want my old market stall back! Sarah took him away from me.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_04 " );	// And I want her to give me that counter back.
	AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_15_05 " );	// And what is my role in this?
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_06 " );	// I'll give you a letter to put in her pocket.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_07 " );	// Then you will go to Andre and tell him that Sara is selling weapons to Onar.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_08 " );	// They'll put her in jail, you'll get your reward, and I'll get my stall.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_09 " );	// You have two days to complete this.
	if (Canthar_Fallen ==  FALSE )
	{
		AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_15_10 " );	// What will happen to me?
		AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_09_11 " );	// When I get my stall back, you'll get a weapon from me - a very good weapon.
	};
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY, " No, I won't participate in this. " ,DIA_Canthar_PAYPRICEINCITY_Nein);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY, " Okay, looks like I don't have a choice. " ,DIA_Canthar_PAYPRICEINCITY_Ok);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY, " What happens if I cancel? " ,DIA_Canthar_PAYPRICEINCITY_If);
};

func void DIA_Canthar_PAYPRICEINCITY_If()
{
	AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_if_15_00 " );	// What happens if I refuse?
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_if_09_01 " );	// That would be very stupid of you. You see, I know that you are a runaway convict.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_if_09_02 " );	// If the others find out about this, it will cause significant damage to your reputation in the city...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein()
{
	AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_Nein_15_00 " );	// No, I won't participate in this.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_Nein_09_01 " );	// That was the wrong decision, my boy. But we'll talk more.
	MIS_Canthars_KomproBrief = LOG_OBSOLETE ;
	singMissSara = TRUE ;
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

func void DIA_Canthar_PAYPRICEINCITY_Ok()
{
	AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_Ok_15_00 " );	// Okay, looks like I don't have a choice.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_Ok_09_01 " );	// You're a smart guy! Here, have the letter.
	CreateInvItems(self,ItWr_Canthars_KomproBrief_MIS,1);
	B_GiveInvItems(self,other,ItWr_Canthars_KomproBrief_MIS,1);
	AI_Output(other,self, " DIA_Canthar_PAYPRICEINCITY_Ok_15_02 " );	// And how do I give her this letter?
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_Ok_09_03 " );	// Have her show you her merchandise - and while she's at it, you'll give her a letter.
	AI_Output(self,other, " DIA_Canthar_PAYPRICEINCITY_Ok_09_04 " );	// And remember, I'm a very powerful person, so don't try to fool me.
	MIS_Canthars_KomproBrief = LOG_Running;
	MIS_Canthars_ComproBrief_Day = Wld_GetDay();
	Log_CreateTopic(TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Canthar,LOG_Running);
	if (Canthar_Gefallen ==  TRUE )
	{
		B_LogEntry(TOPIC_Canthar, " Kantar wants me to do him a favor as promised. " );
	}
	else
	{
		B_LogEntry(TOPIC_Canthar, " Kanthar promised to give me a weapon in exchange for a favor. " );
	};
	B_LogEntry(TOPIC_Canthar, " I have to plant a letter to trader Sarah that will give me reason to suspect that she is selling weapons to Onar. Then I have to go to Lord Andre and hand her over to the militia. Kantar gave me two days for all this... " );
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

instance DIA_Canthar_SARAHERLEDIGT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SARAHERLEDIGT_Condition;
	information = DIA_Canthar_SARAHERLEDIGT_Info;
	permanent = TRUE;
	description = " Don't you have a job for me? " ;
};

func int DIA_Canthar_SARAHERLEDIGT_Condition()
{
	if ((MY_Canthars_ComproBrief == LOG_Running) && (Npc_IsDead(Sarah) ==  FALSE ) && (Canthar_Released ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAHERLEDIGT_Info()
{
	AI_Output(other,self, " DIA_Canthar_SARAHERLEDIGT_09_00 " );	// Don't you have a job for me?
	AI_Output(self,other, " DIA_Canthar_SARAHERLEDIGT_09_01 " );	// Put the letter on Sarah first, then go to Andre and blame her.
	AI_Output(self,other, " DIA_Canthar_SARAHERLEDIGT_09_02 " );	// Do it! And don't try to fool me, you'll regret it.
	AI_StopProcessInfos(self);
};

instance DIA_Canthar_SARAISDEAD(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SARAISDEAD_Condition;
	information = DIA_Canthar_SARAISDEAD_Info;
	permanent = TRUE;
	description = " Sarah is dead! " ;
};

func int DIA_Canthar_SARAISDEAD_Condition()
{
	if ((MY_Canthars_ComproBrief == LOG_Running) && (Npc_IsDead(Sarah) ==  TRUE ) && (Canthars_Released ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAISDEAD_Info()
{
	AI_Output(other,self, " DIA_Canthar_SARAHERLEDIGT_15_04 " );	// Sarah is dead!
	AI_Output(self,other, " DIA_Canthar_SARAHERLEDIGT_09_05 " );	// True? Perfect! So you've fulfilled your part of our little deal.
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MARKTSTAND");
};

instance DIA_Canthar_Success(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Success_Condition;
	information = DIA_Canthar_Success_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Canthar_Success_Condition()
{
	if (Npc_IsInState(self,ZS_Talk) && (Canthar_Released ==  FALSE ) && (MY_Canthars_CommerceBrief ==  LOG_SUCCESS ) && (CantarMissSara ==  FALSE ) && (Npc_IsDead(Sarah) ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Canthar_Success_Info()
{
	B_GivePlayerXP(XP_Canthars_KomproBrief);
	AI_Output(self,other, " DIA_Canthar_Success_09_00 " );	// Great! Sarah went to where she belongs.
	AI_Output(self,other, " DIA_Canthar_Success_09_01 " );	// I took her goods, so if you need a weapon, come see me.

	if (Chapter >=  1 )
	{
		CreateInvItems(self,ItMw_1h_Vlk_Dagger,20);
		CreateInvItems(self,ItLsTorch,20);
		CreateInvItems(self,ItRw_Arrow,50);
		CreateInvItems(self,ItMw_2H_Axe_L_01,1);
		CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
		CreateInvItems(self,ItMw_1H_Sword_L_03,1);
		CreateInvItems(self,ItMw_ShortSword2,1);
		CreateInvItems(self,ItRi_HP_01,1);
	};
	if (Chapter >=  2 )
	{
		CreateInvItems(self,ItLsTorch,5);
		CreateInvItems(self,ItRw_Arrow,50);
	};
	if (Canthar_Fallen ==  FALSE )
	{
		AI_Output(other,self, " DIA_Canthar_Success_15_02 " );	// You were going to give me a weapon.
		AI_Output(self,other, " DIA_Canthar_Success_09_03 " );	// Right! Here, this weapon is a work of weapon art ... (chuckling)
		B_GiveInvItems(self,other,ItMw_1H_Mace_L_01,1);
	};

	AI_StopProcessInfos(self);
};

instance DIA_Canthar_Again(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Again_Condition;
	information = DIA_Canthar_Again_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Again_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Again_Info()
{
	AI_Output(self,other, " DIA_Canthar_Again_09_00 " );	// Oh, you again.

	if(MIS_Canthars_KomproBrief == LOG_FAILED)
	{
		AI_Output(other,self, " DIA_Canthar_Again_15_01 " );	// Why aren't you in jail?
		AI_Output(self,other, " DIA_Canthar_Again_09_02 " );	// They let me go. Like I told you, I'm a very powerful man in this city.
	}
	else  if (MIS_Canthars_KomproBrief == LOG_Running)
	{
		AI_Output(self,other, " DIA_Canthar_Again_09_03 " );	// By the way, I dealt with Sarah myself! You can forget about this case with the letter.
	}
	else if(MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output(self,other, " DIA_Canthar_Again_09_04 " );	// Didn't I warn you? It would be better if you did what I say.
	};

	AI_Output(self,other, " DIA_Canthar_Again_09_05 " );	// Now all the merchants know that you are an escaped convict.
	AI_Output(self,other, " DIA_Canthar_Again_09_06 " );	// What a pity - now you won't be able to buy even a piece of bread in the market square.
	AI_Output(self,other, " DIA_Canthar_Again_09_07 " );	// I can, of course, fix this problem for you, at a cost, let's say.
	B_Say_Gold(self,other,Canthar_Gold);
	KnowCantarFree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Canthar_Pay(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_Pay_Condition;
	information = DIA_Canthar_Pay_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Canthar_Pay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Again) && (Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Pay_Info()
{
	AI_Output(self,other, " DIA_Canthar_Pay_09_00 " );	// Are you willing to pay?
	Info_ClearChoices(DIA_Canthar_Pay);
	if(Npc_HasItems(other,ItMi_Gold) >= Canthar_Gold)
	{
		Info_AddChoice(DIA_Canthar_Pay, " Ok, I'll pay. " ,DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice(DIA_Canthar_Pay, " I don't have that much money with me. " ,DIA_Canthar_Pay_Nein);
	Info_AddChoice(DIA_Canthar_Pay, " How much do you need? " ,DIA_Canthar_Pay_Wieviel);
};

func void DIA_Canthar_Pay_Ja()
{
	AI_Output(other,self, " DIA_Canthar_Pay_Ja_15_00 " );	// Okay, I'll cry, you leave me no choice.
	B_GiveInvItems(other,self,ItMi_Gold,Canthar_Gold);
	AI_Output(self,other, " DIA_Canthar_Pay_Ja_09_01 " );	// Okay...(grins) Now I'll make sure your reputation among the merchants grows again.
	Canthar_Lock = FALSE ;
	Canthar_Pay = TRUE;
	Info_ClearChoices(DIA_Canthar_Pay);
};

func void DIA_Canthar_Pay_Nein()
{
	AI_Output(other,self, " DIA_Canthar_Pay_Nein_15_00 " );	// I don't have that much money with me.
	AI_Output(self,other, " DIA_Canthar_Pay_Nein_09_01 " );	// Then get them.
	Info_ClearChoices(DIA_Canthar_Pay);
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_Pay_Wieviel()
{
	AI_Output(other,self, " DIA_Canthar_Pay_Wieviel_15_00 " );	// How much is needed?
	B_Say_Gold(self,other,Canthar_Gold);
};


instance DIA_Canthar_CANTHARANGEPISST (C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_CANTHARANGEPISST_Condition;
	information = DIA_Canthar_CANTHARANGEPISST_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Canthar_CANTHARANGEPISST_Condition()
{
	if((Canthar_Ausgeliefert == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_CANTHARANGEPISST_Info()
{
	AI_Output(self,other, " DIA_Canthar_CANTHARANGEPISST_09_00 " );	// I warned you, but you didn't listen. We will discuss this issue later.
	AI_Output(self,other, " DIA_Canthar_CANTHARANGEPISST_09_01 " );	// Now get out, I want to rest.
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_MinenAnteil(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = DIA_Canthar_MinenAnteil_Condition;
	information = DIA_Canthar_MinenAnteil_Info;
	description = " You're selling fake shares! " ;
};


func int DIA_Canthar_MinenAnteil_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MIS_Serpening_MineBefore_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Canthar_WhatOffer) && (Npc_HasItems(self,ItWr_MineBefore_Mis) >  0 ) );
	{
		return TRUE;
	};
};

func void DIA_Canthar_MinenAnteil_Info()
{
	AI_Output(other,self, " DIA_Canthar_Minenanteil_15_00 " );	// You're selling fake shares!
	AI_Output(self,other, " DIA_Canthar_Minenanteil_09_01 " );	// Yes? So what?! If not me, then someone else.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_CANTHAR_KILLNOW(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = dia_canthar_killnow_condition;
	information = dia_canthar_killnow_info;
	description = " I'm afraid I have bad news for you. " ;
};


func int dia_canthar_killnow_condition()
{
	if(MIS_KILLTARGET3 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_canthar_killnow_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Canthar_KillNow_01_00 " );	// I'm afraid I have bad news for you.
	AI_Output(other,self, " DIA_Canthar_KillNow_01_02 " );	// You will die soon!
	AI_Output(self,other, " DIA_Canthar_KillNow_01_03 " );	// WHAT?! (laughs) Why did you decide?
	AI_Output(self,other, " DIA_Canthar_KillNow_01_05 " );	// Have you learned to predict the future? (laughs)
	AI_Output(other,self, " DIA_Canthar_KillNow_01_12 " );	// Jokes are over, Kantar! Too many people want you dead.
	AI_Output(self,other, " DIA_Canthar_KillNow_01_15 " );	// Damn! What does it mean?! (in panic) Guard!!!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

