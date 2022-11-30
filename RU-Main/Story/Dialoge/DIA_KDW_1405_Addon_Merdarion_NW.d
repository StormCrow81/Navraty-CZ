
instance DIA_Addon_Merdarion_EXIT(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 999;
	condition = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_Hallo(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Hallo_Condition;
	information = DIA_Addon_Merdarion_Hallo_Info;
	description = " Busy? " ;
};


func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Занят?
	AI_Output(self,other, " DIA_Addon_Merdarion_Hallo_06_01 " );	// These dungeons are a big mystery to me. It's hard to imagine that no one has found them before.
	AI_Output(self,other, " DIA_Addon_Merdarion_Hallo_06_02 " );	// We managed to find the entrance without much difficulty.
	AI_Output(self,other, " DIA_Addon_Merdarion_Hallo_06_03 " );	// People are so busy with their daily activities that no one paid due attention to this building.
	AI_Output(self,other, " DIA_Addon_Merdarion_Hallo_06_04 " );	// I have no other explanation.
};


instance DIA_Addon_Merdarion_Task (C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Task_Condition;
	information = DIA_Addon_Merdarion_Task_Info;
	description = " What do you want to do here? " ;
};


func int DIA_Addon_Merdarion_Task_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Merdarion_Hello ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_Task_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Aufgabe_15_00 " );	// What do you want to do here?
	AI_Output(self,other, " DIA_Addon_Merdarion_Aufgabe_06_01 " );	// I'm trying to figure out where this round portal leads.
	AI_Output(self,other, " DIA_Addon_Merdarion_Aufgabe_06_02 " );	// And I'm also helping Nefarious look for the lost ornament.
	AI_Output(self,other, " DIA_Addon_Merdarion_Aufgabe_06_03 " );	// We can say with certainty that this portal leads to a part of the island that was hitherto unknown to us.
	AI_Output(self,other, " DIA_Addon_Merdarion_Aufgabe_06_04 " );	// And I even, perhaps... (thinking) never heard or read about her...
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Cronos_NW,"START");
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		B_LogEntry(TOPIC_Addon_KDW, " Nefarius is looking for the missing ornament. " );
	};
};


instance DIA_Addon_Merdarion_DaDurch (C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_DaDurch_Condition;
	information = DIA_Addon_Merdarion_DaDurch_Info;
	description = " Are you sure you want to go through this portal? " ;
};


func int DIA_Addon_Merdarion_DaDurch_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Merdarion_Task))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_DaDurch_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_DaDurch_15_00 " );	// Do you really want to go through this portal?
	AI_Output(self,other, " DIA_Addon_Merdarion_DaDurch_06_01 " );	// Yes. Well, if we find the lost ornament, of course.
	AI_Output(self,other, " DIA_Addon_Merdarion_DaDurch_06_02 " );	// I suppose this is a rather risky undertaking.
	AI_Output(self,other, " DIA_Addon_Merdarion_DaDurch_06_03 " );	// But we just need to figure out how this can be related to constant earthquakes.
};


instance DIA_Addon_Merdarion_Bedrohung (C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Bedrohung_Condition;
	information = DIA_Addon_Merdarion_Bedrohung_Info;
	description = " What do you know about earthquakes? " ;
};


func int DIA_Addon_Merdarion_Bedrohung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_DaDurch))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_Bedrohung_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Bedrohung_15_00 " );	// What do you know about earthquakes?
	AI_Output(self,other, " DIA_Addon_Merdarion_Bedrohung_06_01 " );	// They are caused by something on the other side.
	AI_Output(self,other, " DIA_Addon_Merdarion_Bedrohung_06_02 " );	// This may be causing the stone guards to awaken.
	AI_Output(self,other, " DIA_Addon_Merdarion_Bedrohung_06_03 " );	// But that's not my concern anymore. Saturas and Kronos can tell you more.
};


instance DIA_Addon_Merdarion_Wasdahinter2(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information = DIA_Addon_Merdarion_Wasdahinter2_Info;
	description = " What do you think you'll find there? " ;
};


func int DIA_Addon_Merdarion_Wasdahinter2_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Merdarion_Task))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Wasdahinter2_15_00 " );	// And what do you think you'll find there?
	AI_Output(self,other, " DIA_Addon_Merdarion_Wasdahinter2_06_01 " );	// I don't even know.
	AI_Output(self,other, " DIA_Addon_Merdarion_Wasdahinter2_06_02 " );	// I believe there should be a building similar to this on the other side. And an analogue of this portal.
	AI_Output(self,other, " DIA_Addon_Merdarion_Wasdahinter2_06_03 " );	// We'll only know the rest when we get there.
};


instance DIA_Addon_Merdarion_PERM(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 99;
	condition = DIA_Addon_Merdarion_PERM_Condition;
	information = DIA_Addon_Merdarion_PERM_Info;
	permanent = TRUE;
	description = " Can you teach me something about magic? " ;
};


func int DIA_Addon_Merdarion_PERM_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Merdarion_Task))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_PERM_15_00 " );	// Can you teach me magic?
	AI_Output(self,other, " DIA_Addon_Merdarion_PERM_06_01 " );	// When we get there, I'll be at your complete disposal.
};


instance DIA_Addon_Merdarion_Teleportstein (C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Teleportstein_Condition;
	information = DIA_Addon_Merdarion_Teleportstein_Info;
	description = " What's the fastest way to get to the city? " ;
};


func int DIA_Addon_Merdarion_Teleportstein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe) && (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_Teleportstein_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_15_00 " );	// What's the fastest way to get to the city?
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_01 " );	// I advise you to go the same way you came.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_02 " );	// (thinking) But you can also... No, that's too dangerous.
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_15_03 " );	// Spread.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_04 " );	// Okay. The builders of these halls moved in their own way.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_05 " );	// As far as we can tell, they could teleport.
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_15_06 " );	// This is not unusual.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_07 " );	// The teleport stones we found in Khorinis are actually quite unusual.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_08 " );	// It seems that the teleportation stone in these halls may lead to the city.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_06_09 " );	// But none of us had the courage to check it out.
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein, " What if I try to move with it? " ,DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein, " Where is this stone? " ,DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_wo_15_00 " );	// Where is this stone?
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_wo_06_01 " );	// Behind the door, in the pool room. I locked him there.
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein, " Give me the key. I want to look at it. " ,DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_ich_15_00 " );	// What if I try to move with it?
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_ich_06_01 " );	// I don't know. We know too little about it. You may not survive.
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_key_15_00 " );	// Give me the key. I want to look at it.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_key_06_01 " );	// (unsure) Really? But I'm not responsible for the consequences.
	AI_Output(other,self, " DIA_Addon_Merdarion_Teleportstein_key_15_02 " );	// Give me the key.
	AI_Output(self,other, " DIA_Addon_Merdarion_Teleportstein_key_06_03 " );	// If that's what you want. Please.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	B_GiveInvItems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW, " Merdarion gave me the key to a locked door. Behind it is a teleport that will take me back to the city. " );
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};


instance DIA_Addon_Merdarion_WHereOtherTeleports(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information = DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description = " Where are the rest of the teleportation stones? " ;
};


func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_WHereOtherTeleports_15_00 " );	// Where are the rest of the teleport stones?
	AI_Output(self,other, " DIA_Addon_Merdarion_WHereOtherTeleports_06_01 " );	// We've only found one so far, somewhere in the middle of Khorinis.
	AI_Output(self,other, " DIA_Addon_Merdarion_WHereOtherTeleports_06_02 " );	// Near the 'Dead Harpy' tavern.
	B_LogEntry(TOPIC_Addon_TeleportsNW, " There should be another teleport near the 'Dead Harpy' tavern. " );
};


instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information = DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description = " The teleportation stones seem to work fine. " ;
};


func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Merdarion_Teleportstein ) && ( SCUsed_NW_TELEPORTSTATION_MAYA ==  TRUE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Addon_Merdarion_TeleportsteinSuccess_15_00 " );	// Teleport stones seem to work fine.
	AI_Output(self,other, " DIA_Addon_Merdarion_TeleportsteinSuccess_06_01 " );	// Did you do it? Did you really go in there?
	AI_Output(other,self, " DIA_Addon_Merdarion_TeleportsteinSuccess_15_02 " );	// Yes! Apparently they still work.
	AI_Output(self,other, " DIA_Addon_Merdarion_TeleportsteinSuccess_06_03 " );	// Incredible...(impressed) I'll have to take a closer look at them.
};


instance DIA_ADDON_MERDARION_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 1;
	condition = dia_addon_merdarion_prayforgomez_condition;
	information = dia_addon_merdarion_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_merdarion_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Merdarion_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Merdarion_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Merdarion_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};


instance DIA_ADDON_MERDARION_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 1;
	condition = dia_addon_merdarion_runemagicnotwork_condition;
	information = dia_addon_merdarion_runemagicnotwork_info;
	permanent = FALSE;
	description = " Can you still use your rune magic? " ;
};


func int dia_addon_merdarion_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Merdarion_RuneMagicNotWork_01_00 " );	// Can you still use your rune magic?
	AI_Output(self,other, " DIA_Addon_Merdarion_RuneMagicNotWork_01_01 " );	// Unfortunately, the magic has fled my runestones, turning them into useless cobblestones.
	AI_Output(self,other, " DIA_Addon_Merdarion_RuneMagicNotWork_01_02 " );	// And all of us, the magicians of Water, from now on are nothing but a burden for the warriors, in the blades of which our hope for salvation is now enclosed.
	AI_Output(self,other, " DIA_Addon_Merdarion_RuneMagicNotWork_01_03 " );	// I'm ashamed to admit it, but I'm not even able to put forward a hypothesis that more or less accurately describes the source of the misfortune that has befallen us. One instinct only whispers that we are dealing with treachery ...
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " It seems the Waterbenders have also lost their ability to use rune magic. " );
	WATERMAGERUNESNOT = TRUE;
};

