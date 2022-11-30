

instance DIA_Addon_Cronos_EXIT(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 999;
	condition = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Cronos_PICKPOCKET(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 900;
	condition = DIA_Addon_Cronos_PICKPOCKET_Condition;
	information = DIA_Addon_Cronos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Cronos_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 35 );
};

func void DIA_Addon_Cronos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_PICKPOCKET,Dialog_Back,DIA_Addon_Cronos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cronos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
};

func void DIA_Addon_Cronos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
};

instance DIA_Addon_Cronos_Hallo (C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Hallo_Condition;
	information = DIA_Addon_Cronos_Hallo_Info;
	description = " Can I disturb you? " ;
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self, " DIA_Addon_Cronos_Hallo_15_00 " );	// Can I disturb you?
	AI_Output(self,other, " DIA_Addon_Cronos_Hallo_04_01 " );	// (surprised) Is that YOU? I didn't think I'd ever see your face again.
	AI_Output(self,other, " DIA_Addon_Cronos_Hallo_04_02 " );	// You're brave enough to show yourself here. Some time ago we were ready to skin you alive.
	AI_Output(self,other, " DIA_Addon_Cronos_Hallo_04_03 " );	// Luckily for you, it's been a few weeks since then, so we've calmed down a bit.
};


instance DIA_Addon_Cronos_WasMachstdu (C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other,self, " DIA_Addon_Cronos_WasMachstdu_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Cronos_WasMachstdu_04_01 " );	// My task is to find out as much as possible about the temple guards.
	AI_Output(self,other, " DIA_Addon_Cronos_WasMachstdu_04_02 " );	// Not an easy task, let me tell you. The properties of these stone guards are completely unfamiliar to me.
	AI_Output(self,other, " DIA_Addon_Cronos_WasMachstdu_04_03 " );	// They can stand completely lifeless, and in a second they will attack you like possessed.
	AI_Output(self,other, " DIA_Addon_Cronos_WasMachstdu_04_04 " );	// I have not yet determined the force that drives them, but I have no doubt about one thing: the nature of this force is magical.
};


instances of DIA_Addon_Cronos_Waechter (C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = " Tell me about the stone guards. " ;
};


func int DIA_Addon_Cronos_Waechter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other,self, " DIA_Addon_Cronos_Waechter_15_00 " );	// Tell me about the stone guards.
	AI_Output(self,other, " DIA_Addon_Cronos_Waechter_04_01 " );	// I can't say much yet. Unfortunately, we had to destroy them. Now they are not dangerous.
	AI_Output(self,other, " DIA_Addon_Cronos_Waechter_04_02 " );	// When we first got here, they attacked us.
	AI_Output(self,other, " DIA_Addon_Cronos_Waechter_04_03 " );	// Only by united forces we managed to defeat them. I'm afraid there are new guards waiting for us beyond the portal.
	AI_Output(self,other, " DIA_Addon_Cronos_Waechter_04_04 " );	// There must be a way to shut down the source of their power so that they remain just lifeless statues.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " Can you sell me some supplies? " ;
};


func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self, " DIA_Addon_Cronos_NW_Trade_15_00 " );	// Can you sell me some supplies?

	if(DIA_Addon_Cronos_NW_Trade_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Cronos_NW_Trade_04_01 " );	// Why not? If I remember correctly, you and I have already done business.
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_CronosTrade);
	};

	AI_Output(self,other, " DIA_Addon_Cronos_NW_Trade_04_02 " );	// Tell me what you need.
	B_GiveTradeInv(self);
};


instance DIA_ADDON_CRONOS_NW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 1;
	condition = dia_addon_cronos_nw_prayforgomez_condition;
	information = dia_addon_cronos_nw_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_cronos_nw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_nw_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Cronos_NW_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Cronos_NW_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Cronos_NW_PrayForGomez_01_03 " );	// I think he can help you.
	AI_Output(other,self, " DIA_Addon_Cronos_NW_PrayForGomez_01_04 " );	// Thanks for the tip.
	SENTTOSATURASGOMEZ = TRUE ;
};


instance DIA_ADDON_CRONOS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 1;
	condition = dia_addon_cronos_runemagicnotwork_condition;
	information = dia_addon_cronos_runemagicnotwork_info;
	permanent = FALSE;
	description = " Can you still use your rune magic? " ;
};


func int dia_addon_cronos_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Cronos_RuneMagicNotWork_01_00 " );	// Can you still use your rune magic?
	AI_Output(self,other, " DIA_Addon_Cronos_RuneMagicNotWork_01_01 " );	// I'm afraid to disappoint you, but all my magic runes have somehow lost their power.
	AI_Output(self,other, " DIA_Addon_Cronos_RuneMagicNotWork_01_02 " );	// And, not only for me, but also for other Waterbenders! And I have no idea how this could happen.
	AI_Output(self,other, " DIA_Addon_Cronos_RuneMagicNotWork_01_03 " );	// Perhaps something terrible and irreparable happened in this world, since we all suddenly lost this gift.
	AI_Output(other,self, " DIA_Addon_Cronos_RuneMagicNotWork_01_04 " );	// Hmmm... all clear.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " It seems that the Water Mages have also lost their ability to use rune magic. " );
	WATERMAGERUNESNOT = TRUE;
};
