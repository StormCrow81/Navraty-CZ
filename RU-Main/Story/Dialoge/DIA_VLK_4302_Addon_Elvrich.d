

instance DIA_Addon_Elvrich_EXIT(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 999;
	condition = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Elvrich_PICKPOCKET(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 900;
	condition = DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information = DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	return  C_Robbery ( 62 , 110 );
};

func void DIA_Addon_Elvrich_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,Dialog_Back,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};

func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};


instance DIA_Addon_Elvrich_BanditsThere(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_BanditsThere_Condition;
	information = DIA_Addon_Elvrich_BanditsThere_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Elvrich_BanditsThere_NoPerm;

func int DIA_Addon_Elvrich_BanditsThere_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( DIA_Addon_Elvrich_BanditsThere_NoPerm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_BanditsThere_Info()
{
	if (Npc_IsDead(BDT_10307_Addon_RangerBandit_M) && Npc_IsDead(BDT_10308_Addon_RangerBandit_L) && Npc_IsDead(BDT_10309_Addon_RangerBandit_L) && Npc_IsDead(BDT_10310_Addon_RangerBandit_M))
	{
		AI_Output(self,other, " DIA_Addon_Elvrich_BanditsThere_04_00 " );	// Thank the gods! The bandits are done. You saved my life.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE ;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Elvrich_Wer (C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Wer_Condition;
	information = DIA_Addon_Elvrich_Wer_Info;
	description = " Who are you? " ;
};


func int DIA_Addon_Elvrich_Wer_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_Wer_15_00 " );	// Who are you?
	AI_Output(self,other, " DIA_Addon_Elvrich_Wer_04_01 " );	// My name is Elvrich. I'm from the city.
	if (MIS_Thorben_BringElvrichBack == LOG_Running)
	{
		AI_Output(other,self, " DIA_Addon_Elvrich_Wer_15_02 " );	// Master Torben said you were missing.
	};
	AI_Output(self,other, " DIA_Addon_Elvrich_Wer_04_03 " );	// Those bastards dragged me here and held me captive.
};


instance DIA_Addon_Elvrich_MissingPeople(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_MissingPeople_Condition;
	information = DIA_Addon_Elvrich_MissingPeople_Info;
	description = " Other people disappeared in the city. " ;
};


func int DIA_Addon_Elvrich_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer) && (SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Elvrich_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_MissingPeople_15_00 " );	// Other people disappeared in the city.
	AI_Output(self,other, " DIA_Addon_Elvrich_MissingPeople_04_01 " );	// Don't know anything about other people. I can only tell you what happened to ME.
};


instance DIA_Addon_Elvrich_WhatExactly(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhatExactly_Condition;
	information = DIA_Addon_Elvrich_WhatExactly_Info;
	description = " What happened to you? " ;
};


func int DIA_Addon_Elvrich_WhatExactly_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhatExactly_15_00 " );	// And what happened to you?
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_04_01 " );	// I went on a date. I was supposed to meet my girlfriend.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_04_02 " );	// Her name is Lucia. We were going to head for the mountains, away from the city and everyone who lives there.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_04_03 " );	// I got to the place where Lucia was waiting for me, and suddenly bandits appeared and grabbed us both.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_04_04 " );	// Of course I resisted, but there were too many of them. By the way, have you met them?
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, " What did the bandits want from you? " ,DIA_Addon_Elvrich_WhatExactly_Want);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Рассказывай.",DIA_Addon_Elvrich_WhatExactly_lucia);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhatExactly_Want_15_00 " );	// What did the bandits want from you?
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Want_04_01 " );	// Several times I was able to eavesdrop on their conversations. From them I understood that they were going to sell us into slavery.
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, " Where were they going to take you? " ,DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhatExactly_Pirates_15_00 " );	// Where were you going to be taken?
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Pirates_04_01 " );	// This place is somewhere around here on the island. But it looks like you can't get there without a ship.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Pirates_04_02 " );	// They brought me to the coast. There is a small pirate camp on it.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Pirates_04_03 " );	// One of the bandits approached the pirates and started negotiations. They got into a heated argument.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Pirates_04_04 " );	// I think the bandit wanted the pirates to take us somewhere.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Pirates_04_05 " );	// But the pirates refused, and the bandits had to leave. Since then we have been sitting here.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Pirates_04_06 " );	// In my opinion, the bandits just didn't know what to do next. And then you came.
	Elvrich_SCKnowsPirats = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Elvrich, a carpenter's apprentice from Khorinis Torben, was kidnapped by bandits. It looks like pirates and bandits are in cahoots. " );
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Пираты в Хоринисе?",DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, " Where is the pirate camp? " ,DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhatExactly_Here_15_00 " );	// Pirates in Khorinis?
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Here_04_01 " );	// I don't know much about them. To be honest, that was the first time I saw pirates.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Here_04_02 " );	// They try to stay in the background. Almost every one of them is a wanted criminal.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_Here_04_03 " );	// Pirates have a superstition - they are afraid of the gallows, so you will not meet them in the city.
};

func void DIA_Addon_Elvrich_WhatExactly_lucia()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhatExactly_lucia_15_00 " );	// Tell me about Lucia.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_lucia_04_01 " );	// This is a waterfront girl. Very beautiful. She worked for that bastard Bromor.
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhatExactly_pirat_15_00 " );	// Where is the pirate camp located?
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_pirat_04_01 " );	// Not far from the harbor of Khorinis.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_pirat_04_02 " );	// If you stand on the embankment facing the sea, it will be on the right.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhatExactly_pirat_04_03 " );	// The first small bay that you will meet on the way, and will be the place you need.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	) ; _ _ _
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,Dialog_Back,DIA_Addon_Elvrich_WhatExactly_Back);
};

func void DIA_Addon_Elvrich_WhatExactly_Back()
{
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
};


instance DIA_Addon_Elvrich_Bromor(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Bromor_Condition;
	information = DIA_Addon_Elvrich_Bromor_Info;
	description = " Bromor said that Lucia stole a golden dish from him... " ;
};


func int DIA_Addon_Elvrich_Bromor_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Elvrich_WhatExactly ) && ( MY_Brother_LuciaStoleGold == LOG_Running ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_Bromor_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_Bromor_15_00 " );	// Bromor said that Lucia stole a golden dish from him...
	AI_Output(self,other, " DIA_Addon_Elvrich_Bromor_04_01 " );	// Well, if Lucia stole something from Bromor, the bandits took it from her.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold, " Bromor's Golden Chalice appears to be in the hands of bandits living in the forest camp north of Sekoba's farm. " );
};


instance DIA_Addon_Elvrich_WhereIsLucia(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information = DIA_Addon_Elvrich_WhereIsLucia_Info;
	description = " Where is Lucia now? " ;
};


func int DIA_Addon_Elvrich_WhereIsLucia_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_LuciasLetter != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WhereIsLucia_15_00 " );	// Where is Lucia now?
	AI_Output(self,other, " DIA_Addon_Elvrich_WhereIsLucia_04_01 " );	// We split up at the big crossroads in front of Onar's farm.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhereIsLucia_04_02 " );	// Lucia was dragged into the woods behind the Secoba farm by bandits.
	AI_Output(self,other, " DIA_Addon_Elvrich_WhereIsLucia_04_03 " );	// May Innos protect her!
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia, " Lucia has been taken away by bandits! They have gone to the forest north of Sekoba's farm. " );
	SC_KnowsLuciaCaughtByBandits = TRUE;
};


instance DIA_Addon_Elvrich_FernandosWaffen(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information = DIA_Addon_Elvrich_FernandosWaffen_Info;
	description = " Did the bandits who held you prisoner receive a shipment of weapons? " ;
};


func int DIA_Addon_Elvrich_FernandosWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_FernandosWaffen_15_00 " );	// Did the bandits who held you captive receive a shipment of weapons?
	AI_Output(self,other, " DIA_Addon_Elvrich_FernandosWaffen_04_01 " );	// Oh yes. There were so many weapons that they barely carried them away.
	AI_Output(self,other, " DIA_Addon_Elvrich_FernandosWaffen_04_02 " );	// They dragged all these weapons in the direction of Sekoba's farm.
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader, " The trail leads me to the forest north of Sekoba's farm. There are bandits who recently received a large shipment of weapons. " );
};


instance DIA_Addon_Elvrich_LuciaLetter(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Addon_Elvrich_LuciaLetter_Condition;
	information = DIA_Addon_Elvrich_LuciaLetter_Info;
	description = " I found a letter from Lucia. " ;
};


func int DIA_Addon_Elvrich_LuciaLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_LuciaLetter_15_00 " );	// I found a letter from Lucia.
	AI_Output(self,other, " DIA_Addon_Elvrich_LuciaLetter_04_01 " );	// (excitedly) What? Give it here!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Elvrich_LuciaLetter_04_02 " );	// (desperately) No! I don't believe! I just can't believe.
	AI_Output(self,other, " DIA_Addon_Elvrich_LuciaLetter_04_03 " );	// (in desperation) She can't leave me like this.
	AI_Output(self,other, " DIA_Addon_Elvrich_LuciaLetter_04_04 " );	// Take this letter! I don't want to see him. I believe that someday she will come back to me.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia, " Elvrich does not want to believe that Lucia left with the bandits voluntarily. Despite the letter she wrote him, he still hopes for her return. " );
	B_GivePlayerXP(XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
	if((MIS_FINDLOSTHUSB == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == FALSE))
	{
		ELVRIHMARRYGRITTATIMER = Wld_GetDay();
		ELVRIHMARRYGRITTAFLAG = TRUE;
	};
};


instance DIA_Addon_Elvrich_WasNun(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WasNun_Condition;
	information = DIA_Addon_Elvrich_WasNun_Info;
	permanent = FALSE;
	description = " You must return to the city! " ;
};


func int DIA_Addon_Elvrich_WasNun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhereIsLucia) || (MIS_LuciasLetter == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_WasNun_15_00 " );	// You must return to the city!
	AI_Output(self,other, " DIA_Addon_Elvrich_WasNun_04_01 " );	// That's exactly what I'm going to do! I return to Master Torben.
	AI_Output(self,other, " DIA_Addon_Elvrich_WasNun_04_02 " );	// Are you going to look for bandits?
	AI_Output(other,self, " DIA_Addon_Elvrich_WasNun_15_03 " );	// I think so...
	AI_Output(self,other, " DIA_Addon_Elvrich_WasNun_04_04 " );	// If you find Lucia, take her to town, okay?
	AI_Output(other,self, " DIA_Addon_Elvrich_WasNun_15_05 " );	// I'll see what I can do.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Elvrich has returned to Master Torben. " );
	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	Npc_ExchangeRoutine(VLK_462_Thorben,"Elvrback");
	EquipItem(self, ItMw_1h_Bau_Mace);
};


instance DIA_Addon_Elvrich_PERM(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_PERM_Condition;
	information = DIA_Addon_Elvrich_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Elvrich_PERM_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_LuciasLetter != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_PERM_Info()
{
	AI_Output(self,other, " DIA_Addon_Elvrich_PERM_04_00 " );	// Thanks for saving me!
};


instance DIA_ADDON_ELVRICH_ELVRICHGRITTA(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = dia_addon_elvrich_elvrichgritta_condition;
	information = dia_addon_elvrich_elvrichgritta_info;
	permanent = FALSE;
	description = " How are you, Elvrich? " ;
};


func int dia_addon_elvrich_elvrichgritta_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_elvrichgritta_info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGritta_01_00 " );	// How are you, Elvrich?
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGritta_01_02 " );	// Still struggling with the letter from Lucia?
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGritta_01_03 " );	// I've already made peace with it. I think I better forget about her and focus on something more real.
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGritta_01_06 " );	// And how do you feel about Gritta, Torben's niece?
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGritta_01_07 " );	// Well... (embarrassed) well, she's really cute! I would even say that...
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGritta_01_08 " );	// So what's stopping you from telling her how you feel?
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGritta_01_09 " );	// Are you out of your mind? (frightened) No, boy, I won't do that!
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGritta_01_14 " );	// Well, then you'll be sitting here all your life ALONE!
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGritta_01_19 " );	// Eh... maybe you're right! It's really time for me to talk to her.
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGritta_01_26 " );	// Then I wish you good luck.
	B_LogEntry( TOPIC_ELVRIHMARRYGRITTA , " I was able to convince Elvrih to talk to Gritta. " );
	ELVRIHAGREEMARRY = TRUE;
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		Npc_ExchangeRoutine(VLK_418_Gritta,"GoMarry");
		Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"GoMarry");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ELVRICH_ELVRICHGRITTADONE(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = dia_addon_elvrich_elvrichgrittadone_condition;
	information = dia_addon_elvrich_elvrichgrittadone_info;
	permanent = FALSE;
	description = " Have you spoken to Gritta? " ;
};


func int dia_addon_elvrich_elvrichgrittadone_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_elvrichgrittadone_info()
{
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGrittaDone_01_00 " );	// Talked to Gritta?
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGrittaDone_01_01 " );	// Yes! (enthusiastically) Thank you for your advice! Now I'm happy!
	AI_Output(other,self, " DIA_Addon_Elvrich_ElvrichGrittaDone_01_02 " );	// Well, then I'm happy for you.
	AI_Output(self,other,"DIA_Addon_Elvrich_ElvrichGrittaDone_01_03");	//Спасибо!
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGrittaDone_01_04 " );	// I'll never forget what you did for me, so I want to thank you!
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGrittaDone_01_05 " );	// If you ever need new lockpicks, feel free to contact me.
	AI_Output(self,other, " DIA_Addon_Elvrich_ElvrichGrittaDone_01_06 " );	// I'll always give you a couple of grand, and it's completely free!
	ELVRICHGIVEKEYLOCK = TRUE;
};


instance DIA_ADDON_ELVRICH_DAILYRATION(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 3;
	condition = dia_addon_elvrich_dailyration_condition;
	information = dia_addon_elvrich_dailyration_info;
	permanent = TRUE;
	description = " How about a pair of lockpicks. " ;
};


func int dia_addon_elvrich_dailyration_condition()
{
	if((ELVRICHGIVEKEYLOCK == TRUE) && (ELVRICHGIVEKEYLOCKTIMER != Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_dailyration_info()
{
	var int rand keylock;
	randkeylock = 1  + Hlp_Random( 3 );
	AI_Output(other,self, " DIA_Addon_Elvrich_DailyRation_01_01 " );	// How about a couple of picks?
	AI_Output(self,other, " DIA_Addon_Elvrich_DailyRation_01_02 " );	// Of course! Here, take it...
	B_GiveInvItems(self,other,ItKE_lockpick,randkeylock);
	AI_Output(other,self,"DIA_Addon_Elvrich_DailyRation_01_03");	//Спасибо.
	ELVRICHGIVEKEYLOCKTIMER = Wld_GetDay();
};

