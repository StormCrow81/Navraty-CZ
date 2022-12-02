

instance DIA_Addon_Skip_NW_EXIT(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 999;
	condition = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToSkipNW = TRUE;
};

instance DIA_Addon_Skip_NW_PICKPOCKET(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 900;
	condition = DIA_Addon_Skip_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Skip_NW_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 43 );
};

func void DIA_Addon_Skip_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
};

instance DIA_Addon_Skip_NW_Hallo(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_NW_Hallo_Condition;
	information = DIA_Addon_Skip_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_NW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info()
{
	AI_Output(self,other, " DIA_Addon_Skip_NW_Hallo_08_00 " );	// Well, finally! How long can you wait?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Hallo_08_01 " );	// Wait a minute...(surprised) You're not a merchant from the city, are you?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Hallo_08_02 " );	// Where's Baltram?!
	SkipMeet = TRUE;
};


instance DIA_Addon_Skip_NW_WerBistDu(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_WerBistDu_Condition;
	information = DIA_Addon_Skip_NW_WerBistDu_Info;
	description = " Who are you? " ;
};


func int DIA_Addon_Skip_NW_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_WerBistDu_15_00 " );	// Who are you?
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_08_01 " );	// I don't know why this should concern you. But if you're that interested, my name is Skip. Are you familiar with this name?
	AI_Output(other,self, " DIA_Addon_Skip_NW_WerBistDu_15_02 " );	// What's your name?
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_08_03 " );	// Have you never heard of Skip? Did you grow up on a desert island, mate?
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_08_04 " );	// I am one of the most dangerous criminals of Khorinis. Together with my guys, I terrified the sailors walking in these waters.
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_08_05 " );	// No, you must have heard of me.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu, " What? " ,DIA_Addon_Skip_NW_WerBistDu_pirate);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu, " Should I know you? " ,DIA_Addon_Skip_NW_WerBistDu_keineAhnung);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu, " Of course! Now I remember... " ,DIA_Addon_Skip_NW_WerBistDu_ja);
};

func void DIA_Addon_Skip_NW_WerBistDu_ja()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_WerBistDu_ja_15_00 " );	// Of course! Now I remember...
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_ja_08_01 " );	// True? Have you really heard of me?
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_ja_08_02 " );	// And I thought about returning to the city.
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_ja_08_03 " );	// Good thing I didn't.

	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_ja_08_04 " );	// I would immediately be thrown into jail.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_ja_08_05 " );	// By the way, you didn't come to arrest me, did you?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Ну-у...
		AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_ja_08_07 " );	// It's in your best interest. Contact old man Skip and you're dead.
	};
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_no idea()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00 " );	// Should I know you?
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01 " );	// Watch your tongue, mate, or old Skip will have to teach you a lesson.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ты пират?
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_pirat_08_01 " );	// Hell yes. It is obvious. Pirate, and famous.
	AI_Output(self,other, " DIA_Addon_Skip_NW_WerBistDu_pirat_08_02 " );	// But right now I'm so bored I'm ready to eat my boat.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};


instance DIA_Addon_Skip_NW_Baltram (C_Info) .
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Baltram_Condition;
	information = DIA_Addon_Skip_NW_Baltram_Info;
	description = " Baltram? Are you waiting for a trader? " ;
};


func int DIA_Addon_Skip_NW_Baltram_Condition();
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_NW_Baltram_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Baltram_15_00 " );	// Baltram? Are you waiting for a merchant?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Baltram_08_01 " );	// Smart kid.

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};

	AI_Output(self,other, " DIA_Addon_Skip_NW_Baltram_08_02 " );	// I just said it myself.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Baltram_08_03 " );	// That worthless junk dealer seems to have forgotten about our meeting.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Baltram_08_04 " );	// If only I could get to him...
	Log_CreateTopic(TOPIC_Addon_BaltramSkipTrade,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade,LOG_Running);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade, " Pirate Skip has informed me that a certain Baltram, the town trader, is working with the pirates. " );
	SCKnowsBaltramAsPirateTrader = TRUE;
};

instance DIA_Addon_Skip_BaltramPaket (C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_BaltramPaket_Condition;
	information = DIA_Addon_Skip_BaltramPaket_Info;
	description = " I have a package for you from Baltram. " ;
};

func int DIA_Addon_Skip_BaltramPaket_Condition()
{
	if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_BaltramPaket_Info()
{
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	AI_Output(other,self, " DIA_Addon_Skip_BaltramPaket_15_00 " );	// I have a package for you from Baltram.
	AI_Output(self,other, " DIA_Addon_Skip_BaltramPaket_08_01 " );	// What? He sent an errand boy to me?
	AI_Output(self,other, " DIA_Addon_Skip_BaltramPaket_08_02 " );	// I think he's just afraid to date me. What else to expect from this pathetic miser?
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	Npc_RemoveInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(other,self, " DIA_Addon_Skip_BaltramPaket_15_03 " );	// He said he needed three bottles of rum.
	AI_Output(self,other, " DIA_Addon_Skip_BaltramPaket_08_04 " );	// (laughs) Of course! At first he makes me wait, then he doesn't come to the meeting, and he still has the audacity to demand something.
	AI_Output(self,other, " DIA_Addon_Skip_BaltramPaket_08_05 " );	// Here, pass him two bottles. Enough with him.
	CreateInvItems(self,ItFo_Addon_Rum,2);
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_NW_Where (C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Where_Condition;
	information = DIA_Addon_Skip_NW_Where_Info;
	description = " Where did you come from? " ;
};

func int DIA_Addon_Skip_NW_Where_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_NW_Where_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Woher_15_00 " );	// Where did you come from?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_01 " );	// Do you want to know where our hideout is?!

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_02 " );	// That's the last thing I'd say to a militia soldier.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_03 " );	// I might as well go myself and surrender to the militia.
	};
	AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_04 " );	// And if you suddenly want to visit us, it won't help you anyway.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_05 " );	// The island of Khorinis is quite large and no one will ever get where we got to. Unless, of course, they hire a ship.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_06 " );	// Then you still need to get through the rocks, and no one will pass there without knowing the secret passage.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Woher_08_07 " );	// Only two people know the way, and you don't look like any of them.
};


instance DIA_Addon_Skip_SCSawGreg(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_SCSawGreg_Condition;
	information = DIA_Addon_Skip_SCSawGreg_Info;
	description = " You don't know anyone with an eyepatch? " ;
};


func int DIA_Addon_Skip_SCSawGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (SC_KnowsConnectionSkipGreg == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_SCSawGreg_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_SCSawGreg_15_00 " );	// You don't know anyone with an eye patch?
	AI_Output(self,other, " DIA_Addon_Skip_SCSawGreg_08_01 " );	// I know a lot of people who have an eye patch.
	AI_Output(other,self, " DIA_Addon_Skip_SCSawGreg_15_02 " );	// Someone travels the lands of Khorinis and seems to know you well.
	AI_Output(self,other, " DIA_Addon_Skip_SCSawGreg_08_03 " );	// Nobody comes to my mind. I have nothing to do with land-dwelling people.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Но...
	AI_Output(self,other, " DIA_Addon_Skip_SCSawGreg_08_05 " );	// Stop it, I'm not interested.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Skip_NW_MissingPeople(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_MissingPeople_Condition;
	information = DIA_Addon_Skip_NW_MissingPeople_Info;
	description = " A lot of people are missing. " ;
};


func int DIA_Addon_Skip_NW_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_NW_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_MissingPeople_15_00 " );	// A lot of people are missing. And all the evidence points to you being involved in this case.
	AI_Output(self,other, " DIA_Addon_Skip_NW_MissingPeople_08_01 " );	// Uh... damn, it's not what you think.
	AI_Output(self,other, " DIA_Addon_Skip_NW_MissingPeople_08_02 " );	// Do I look like a slave trader? No, I'm just transporting goods. What these goods are and where they come from is none of my business.
	AI_Output(self,other, " DIA_Addon_Skip_NW_MissingPeople_08_03 " );	// We are transporting various goods for these pigs.
	AI_Output(self,other, " DIA_Addon_Skip_NW_MissingPeople_08_04 " );	// At first it was regular goods. Well, sometimes maybe a little smuggling.
	AI_Output(self,other, " DIA_Addon_Skip_NW_MissingPeople_08_05 " );	// And then they began to kidnap the inhabitants of the city! I have no idea what they were going to do with them.
	AI_Output(self,other, " DIA_Addon_Skip_NW_MissingPeople_08_06 " );	// We were just transporting them.
};


instance DIA_Addon_Skip_NW_Dexter(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Dexter_Condition;
	information = DIA_Addon_Skip_NW_Dexter_Info;
	description = " Who are you talking about? " ;
};


func int DIA_Addon_Skip_NW_Dexter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_NW_Dexter_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Dexter_15_00 " );	// Who are you talking about?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Dexter_08_01 " );	// About bandits, of course. Who else? Vile scum that run all over the island.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Dexter_08_02 " );	// And not only here, but throughout Khorinis.
};

func void B_Skip_SaysDextersName()
{
	AI_Output(self,other, " DIA_Addon_Skip_SaysDextersName_08_00 " );	// I remembered the leader's name! Dexter. Yes, they called him Dexter.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " People are kidnapped on the orders of bandit leader Dexter. You can find Dexter south of Onar's farm. " );
	SC_KnowsDexterAsKidnapper = TRUE;
	Ranger_SCKnowsDexter = TRUE;
};


instance DIA_Addon_Skip_NW_Name(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Name_Condition;
	information = DIA_Addon_Skip_NW_Name_Info;
	description = " I don't like the excuse 'bandits'. I need a name... " ;
};


func int DIA_Addon_Skip_NW_Name_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Dexter) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_NW_Name_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Name_15_00 " );	// The 'bandits' excuse doesn't suit me. I need a name...
	AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_01 " );	// Name? Do you want to know who is the bandit leader? Damn, what was that bastard's name...
	AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_02 " );	// Mmm. I can't remember his name at all. Even if you crack.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_03 " );	// But I can show you where to find the man who is the leader of the gang in this part of Khorinis.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_04 " );	// Do you have a map?

	if(Npc_HasItems(other,itwr_map_newworld_1) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon_1) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis_1) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis_1) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Да, есть.
			AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_06 " );	// But someone already scribbled it. Why ruin it even more?
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Нет.
		};
		AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_08 " );	// In that case, I'll describe this place to you.
		AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_09 " );	// Far to the east of here is a very large farm. The farmer's name seems to be Onar.
		AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_10 " );	// He owns vast lands. To the south of his fields is a small fortress on a high cliff.
		AI_Output(self,other, " DIA_Addon_Skip_NW_Name_08_11 " );	// There you will find the one you need.
		B_Skip_SaysDextersName();
	};
};


instance DIA_Addon_Skip_NW_Landkarte (C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Landkarte_Condition;
	information = DIA_Addon_Skip_NW_Landkarte_Info;
	description = " Here. I have a map of Khorinis. " ;
};


func int DIA_Addon_Skip_NW_Landkarte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Name) && Npc_HasItems(other,itwr_map_newworld_1) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Skip_NW_Landkarte_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Landkarte_15_00 " );	// Here! I have a map of Khorinis.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Landkarte_08_01 " );	// Good! Let me draw you his location.
	B_GiveInvItems(other,self,itwr_map_newworld_1,1);
	B_Skip_SaysDextersName();
	AI_Output(self,other, " DIA_Addon_Skip_NW_Landkarte_08_02 " );	// Hold the map.
	Npc_RemoveInvItems(self,itwr_map_newworld_1,1);
	CreateInvItems(self,itwr_map_newworld_dexter_1,1);
	B_GiveInvItems(self,other,itwr_map_newworld_dexter_1,1);
};


instance DIA_Addon_Skip_NW_Wohin (C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 99;
	condition = DIA_Addon_Skip_NW_Wohin_Condition;
	information = DIA_Addon_Skip_NW_Wohin_Info;
	permanent = FALSE;
	description = " Where did you take these people? " ;
};


func int DIA_Addon_Skip_NW_Wohin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Some_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Wohin_15_00 " );	// Where did you take these people?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Wohin_08_01 " );	// I already told you, I'm not going to tell you where our port is.
};

instance DIA_Addon_Skip_NW_Sable(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Sable_Condition;
	information = DIA_Addon_Skip_NW_Sable_Info;
	description = " You look darker than a cloud, mate. " ;
};


func int DIA_Addon_Skip_NW_Sable_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Sable_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_01_00 " );	// You look darker than a cloud.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_01 " );	// Eh... (dejectedly) There's something, buddy.
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_01_02 " );	// What, some problems?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_03 " );	// Just... It's all about my weapon.
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_01_04 " );	// What's wrong with him?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_05 " );	// Take a look yourself. Can this rusty piece of iron be called a weapon?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_01_06 " );	// M-yes... Perhaps I agree with you.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_07 " );	// Here I am about the same.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_08 " );	// It just so happens that my old pirate saber didn't hold up during the last fight.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_09 " );	// So I had to arm myself with the first thing that comes to hand.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_10 " );	// Found this rusty piece of iron here!
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_11 " );	// To be honest, I don't even know how to handle it.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_12 " );	// It feels like it's going to crack like a ship's mast at the first lunge!
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_01_13 " );	// Why don't you find another weapon?
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_14 " );	// The idea, of course, is a good one... (chuckles) But I can't go to the merchants in the city!
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_01_15 " );	// A decent weapon is not just lying on the road. Especially pirate sabers!
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_01_16 " );	// Yes, this is indeed a problem.
	MIS_Skip_NW_Sable = LOG_Running;
	Log_CreateTopic(TOPIC_Skip_NW_Sable,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_Running);
	B_LogEntry(TOPIC_Skip_NW_Sable, " Skip needs a good weapon. I think the new pirate saber will suit him just fine. " );
};


instance DIA_Addon_Skip_NW_Sable_Done(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Sable_Done_Condition;
	information = DIA_Addon_Skip_NW_Sable_Done_Info;
	description = " I have a sword for you. " ;
};

func int DIA_Addon_Skip_NW_Sable_Done_Condition()
{
	if((MIS_Skip_NW_Sable == LOG_Running) && (Npc_HasItems(other,ItMw_Piratensaebel) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Sable_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_Done_01_00 " );	// I have a sword for you.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_01");	//Ты шутишь?
	AI_Output(other,self, " DIA_Addon_Skip_NW_Sable_Done_01_02 " );	// No, of course not. Here, take your new girlfriend.
	B_GiveInvItems(other,self,ItMw_Piratensaebel,1);
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_Done_01_03 " );	// Well, thanks mate. Here is another matter! A real weapon for a real pirate.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_Done_01_05 " );	// For such a generous gift, you don’t feel sorry for the most expensive.
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_Done_01_06 " );	// So take this bottle of rum.
	B_GiveInvItems(self,other,ItFo_Addon_Rum_Skip,1);
	AI_Output(self,other, " DIA_Addon_Skip_NW_Sable_Done_01_07 " );	// You won't find anything like this anywhere! Trust me.
	MIS_Skip_NW_Sable = LOG_Success;
	Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_Success);
	B_LogEntry(TOPIC_Skip_NW_Sable, " Skip was happy to have a new pirate sword. " );
	AI_StopProcessInfos(self);
	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Addon_Skip_About_Drink(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_Condition;
	information = DIA_Addon_Skip_About_Drink_Info;
	permanent = FALSE;
	description = " Do you have any more booze? " ;
};

func int DIA_Addon_Skip_About_Drink_Condition()
{
	if(Skip_Rum4Baltram == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_About_Drink_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_01_01 " );	// Do you have any more drink?
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_02 " );	// What exactly are you interested in? Grog, rum or something stronger?
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_01_03 " );	// Something stronger is better.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_04 " );	// Hmmm...(thoughtfully) I've got the last bottle of an absolutely incredible drink left here.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_05 " );	// Called 'Fast Herring'! It is made by an old friend of mine.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_06 " );	// But as you understand, I will not part with her just like that.
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_01_07 " );	// And how much do you want?
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_08 " );	// In this case, I'm not interested in gold...
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_01_09 " );	// Then what do you need?
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_10 " );	// Hmmm...(thoughtfully) I want a chick! A real port whore, thunder me!
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_11 " );	// I've been at sea too long, and now this is exactly what I need.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_12 " );	// But I can't go to a brothel myself. The militia will hang me on the first bitch.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_13 " );	// So bring her here. That's when you get your swill.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_01_14 " );	// Just agree that she will stay here for at least three days.
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_01_15 " );	// Okay! I'll try to arrange it.
	MIS_WomanForSkip = LOG_Running;
	Log_CreateTopic(TOPIC_WomanForSkip,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_Running);
	B_LogEntry(TOPIC_WomanForSkip, " Skip has one bottle of exceptionally strong moonshine left. He'll give it to me if I bring the girl from the harbor brothel to him. " );
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_About_Drink_Done(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_Done_Condition;
	information = DIA_Addon_Skip_About_Drink_Done_Info;
	permanent = FALSE;
	description = " I brought you Sonya. " ;
};

func int DIA_Addon_Skip_About_Drink_Done_Condition()
{
	where int daynow;
	var C_Npc Sonja;

	daynow = Wld_GetDay();
	Sonja = Hlp_GetNpc(VLK_436_Sonja);

	if ((MIS_WomanForSkip == LOG_Running) && (Npc_GetDistToWP(VLK_436_Sonja, " NW_CITY_PIRATESCAMP_04 " ) <=  1000 ) && (Sonja.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (SonyaGoWithMe ==  TRUE ) && (SonyaJob ==  ( FALSE ) ; SonyaJobDone ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_About_Drink_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_Done_01_00 " );	// I brought Sonya to you.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_Done_01_01 " );	// Hmmm... (appreciatively) And how is she? Well, you understand...
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_Done_01_02 " );	// I have no idea.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_Done_01_03 " );	// Hmmm... Okay! Here, have your moonshine.
	B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering_Ext,1);
	SkipGetWoman = TRUE;
	B_LogEntry(TOPIC_WomanForSkip, " I took Sonya to Skip and he gave me a bottle of moonshine. I need to remember to come back here in three days and bring Sonya back to Bromor. Otherwise, whatever happened... " );
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_About_Drink_None(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_None_Condition;
	information = DIA_Addon_Skip_About_Drink_None_Info;
	permanent = FALSE;
	description = " I'm afraid your request won't work. " ;
};

func int DIA_Addon_Skip_About_Drink_None_Condition()
{
	if(MIS_WomanForSkip == LOG_Running) 
	{
		if(SonyaNoGoWithMe == TRUE)
		{
			return TRUE;
		}
		else if((Npc_IsDead(VLK_436_Sonja) == TRUE) && (SonyaGoWithMe == TRUE))
		{
			return TRUE;
		};
	};

	return  FALSE ;
};

func void DIA_Addon_Skip_About_Drink_None_Info()
{
	AI_Output(other,self, " DIA_Addon_Skip_About_Drink_None_01_00 " );	// I'm afraid your request won't work.
	AI_Output(self,other, " DIA_Addon_Skip_About_Drink_None_01_01 " );	// Damn! Then forget about drinking.
	MIS_WomanForSkip = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_WomanForSkip);
	AI_StopProcessInfos(self);
};
