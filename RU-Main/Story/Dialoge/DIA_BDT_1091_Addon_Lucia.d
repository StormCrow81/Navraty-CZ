
instance DIA_Addon_Lucia_EXIT(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 999;
	condition = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lucia_PICKPOCKET(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 900;
	condition = DIA_Addon_Lucia_PICKPOCKET_Condition;
	information = DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	return  C_Robbery ( 80 , 100 );
};

func void DIA_Addon_Lucia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,Dialog_Back,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};

func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};


instances of DIA_Addon_Lucia_Hi (C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//How are you?
	AI_Output(self,other, " DIA_Addon_Lucia_Hi_16_01 " );	// Listen. If you need food, ask Snaf. And if you want a drink, then you've come to the right person.
};


instance DIA_Addon_Lucia_was(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent = FALSE;
	description = " What are you drinking here? " ;
};


func int DIA_Addon_Lucia_was_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other,self, " DIA_Addon_Lucia_was_15_00 " );	// And what are you drinking here?
	AI_Output(self,other, " DIA_Addon_Lucia_was_16_01 " );	// Well, we don't have much beer. Only paladins bring beer to the island.
	AI_Output(self,other, " DIA_Addon_Lucia_was_16_02 " );	// And perhaps that's the only good thing they bring...
	AI_Output(self,other, " DIA_Addon_Lucia_was_16_03 " );	// So we usually drink strong drinks. I have moonshine, grog and white rum.
	AI_Output(self,other, " DIA_Addon_Lucia_was_16_04 " );	// You should try this! I got the recipe from Samuel. You have to admit, he really knows his stuff.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, " I can buy drinks from Lucia. " );
};


instance DIA_Addon_Lucia_Khorinis (C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent = FALSE;
	description = " You're from Khorinis, right? " ;
};


func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bromor_Lucia) || (Nadja_GaveLuciaInfo == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Khorinis_15_00 " );	// You're from Khorinis, right?
	AI_Output(self,other, " DIA_Addon_Lucia_Khorinis_16_01 " );	// Oh, don't remind me. My life there was horrible.
	AI_Output(self,other, " DIA_Addon_Lucia_Khorinis_16_02 " );	// While ships with prisoners came to the city, it was still possible to live there.
	AI_Output(self,other, " DIA_Addon_Lucia_Khorinis_16_03 " );	// But then... (laughs) No thanks. Maybe it's because we're on an island... Well, that life is over anyway.
	if((MIS_LuciasLetter != 0) || (SC_KnowsLuciaCaughtByBandits != 0) || (Nadja_GaveLuciaInfo != 0))
	{
		AI_Output(self,other, " DIA_Addon_Lucia_Khorinis_16_06 " );	// I broke up with Elvrich!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Why?
		AI_Output(self,other, " DIA_Addon_Lucia_Khorinis_16_05 " );	// He's a coward! When the bandits dragged me away, he didn't even try to help me.
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};


instance DIA_Addon_Lucia_Now (C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Now_Condition;
	information = DIA_Addon_Lucia_Now_Info;
	permanent = FALSE;
	description = " What are you going to do next? " ;
};


func int DIA_Addon_Lucia_Now_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Lucia_Khorinis ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_Now_Info()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Jetzt_15_00 " );	// What are you going to do?
	AI_Output(self,other, " DIA_Addon_Lucia_Jetzt_16_01 " );	// I'll stay here with Snaf and Fisk and the rest.
	AI_Output(self,other, " DIA_Addon_Lucia_Jetzt_16_02 " );	// Have you seen Thorus yet? Oh Innos, what a man!
	AI_Output(self,other, " DIA_Addon_Lucia_Jetzt_16_03 " );	// Sorry...let's get back to your question...I don't have a plan yet. I'm just going with the flow.
};


instance DIA_Addon_Lucia_Paladine(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent = FALSE;
	description = " You don't really like paladins, do you? " ;
};


func int DIA_Addon_Lucia_Paladine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Paladine_15_00 " );	// You don't really like paladins, do you?
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_16_01 " );	// Those fanatical assassins paid by Firebenders? No I do not like them.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_16_02 " );	// Lord Hagen and his thugs have occupied the city, and everyone is crawling on their belly before them.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_16_03 " );	// I don't like it. I wasn't going to wait for them to shut down the Red Lamp and put me behind bars.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG) && (other.guild != GIL_KDW) && (other.guild != GIL_KDM) && (other.guild != GIL_SEK) && (other.guild != GIL_TPL) && (other.guild != GIL_GUR))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine, " End conversation. " ,DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine, " But paladins fight for Innos, who chooses his warriors personally. " ,DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine, " Paladins are the warriors of Innos. They are not assassins. " ,DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Paladine_WAHL_15_00 " );	// But paladins fight in the name of Innos, who chooses his warriors personally.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_WAHL_16_01 " );	// I believe that people choose their own path.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_WAHL_16_02 " );	// Your words surprise me. You sound like one of them.
	Info_AddChoice(DIA_Addon_Lucia_Paladine, " Have you ever killed anyone? " ,DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Paladine_KILL_15_00 " );	// Have you ever killed anyone?
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_KILL_16_01 " );	// No, and I'm very glad about it.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_KILL_16_02 " );	// Let's stop talking about such terrible things.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_KILL_16_03 " );	// Better to just drink and enjoy every moment of the short life given to us by the gods.
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Paladine_WEIB_15_00 " );	// Do you reject Innos, fallen maiden?
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_WEIB_16_01 " );	// No, what are you talking about? It's just that some people misuse his name.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_WEIB_16_02 " );	// But I don't doubt for a second the divine magnificence of Innos.
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other,self, " DIA_Addon_Lucia_Paladine_MURDER_15_00 " );	// Paladins are the warriors of Innos. They are not killers.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_MURDER_16_01 " );	// So what? There is blood on their swords, just like on the swords of bandits and pirates.
	AI_Output(self,other, " DIA_Addon_Lucia_Paladine_MURDER_16_02 " );	// The only difference is that they kill in the name of Innos because they want to survive.
	Info_AddChoice(DIA_Addon_Lucia_Paladine, " Do you reject Innos, fallen maiden? " ,DIA_Addon_Lucia_Paladine_WEIB);
};


instance DIA_Addon_Lucia_Attentat (C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 9;
	condition = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Lucia_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nothing.
};


instance DIA_Addon_Lucia_Trade(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 99;
	condition = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Give me something to drink. " ;
};


func int DIA_Addon_Lucia_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Addon_Lucia_Trade_15_00 " );	// Give me something to drink.
	B_GiveTradeInv(self);
};


instance DIA_Addon_Lucia_lernen (C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 19;
	condition = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_Lucia_lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other,self, " DIA_Addon_Lucia_lernen_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Addon_Lucia_lernen_16_01 " );	// With joy. I can help you increase your agility.
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, " Lucia can help me become more agile. " );
};


instance DIA_Addon_Lucia_TEACH(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 101;
	condition = DIA_Addon_Lucia_TEACH_Condition;
	information = DIA_Addon_Lucia_TEACH_Info;
	permanent = TRUE;
	description = " I want to become more dexterous. " ;
};


func int DIA_Addon_Lucia_TEACH_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other,self, " DIA_Addon_Lucia_TEACH_15_00 " );	// I want to become more dexterous.
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

