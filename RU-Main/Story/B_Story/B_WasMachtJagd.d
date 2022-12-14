

var int GaanTeachFinish;

func void B_WhatMachtHunt()
{
	AI_Output(other, self, " DIA_Gaan_JAGD_15_00 " );	// How's the hunting?
};


instance DIA_Go_EXIT (C_Info)
{
	npc = BAU_961_Go;
	nr = 999;
	condition = DIA_Gaan_EXIT_Condition;
	information = DIA_Go_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int DIA_Go_EXIT_oneTime;

func int DIA_Gaan_EXIT_Condition()
{
	return TRUE;
};

func void SLIDE_GO_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if ( DIA_Can_EXIT_oneTime ==  FALSE )
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_Gaan_EXIT_oneTime = TRUE;
	};
};

instance DIA_Go_WASMACHSTDU (C_Info)
{
	npc = BAU_961_Go;
	nr = 4;
	condition = DIA_Go_WASMACHSTDU_Condition;
	information = DIA_Go_WASMACHSTDU_Info;
	description = " Who are you? " ;
};


func int DIA_Go_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void SLIDE_Go_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_Go_WASMACHSTDU_15_00 " );	// Who are you?
	AI_Output(self,other, " DIA_Gaan_WASMACHSTDU_03_01 " );	// My name is Gahan. I am a hunter and work for Bengar, the farmer who owns these high mountain pastures.
	AI_Output(self,other, " DIA_Gaan_WASMACHSTDU_03_02 " );	// I spend most of my time in the great outdoors, earning coin from the land.
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(other,self, " DIA_Gaan_WASMACHSTDU_01_00 " );	// I thought all the guys from the camp were free hunters?!
		AI_Output(self,other, " DIA_Gaan_WASMACHSTDU_01_01 " );	// Of course!... But I'm not going to refuse extra gold either.
		AI_Output(self,other, " DIA_Gaan_WASMACHSTDU_01_02 " );	// Besides, my work isn't particularly hard.
		AI_Output(other,self, " DIA_Gaan_WASMACHSTDU_01_03 " );	// Got it.
	};
};


instance DIA_Go_HELLO (C_Info)
{
	npc = BAU_961_Go;
	nr = 3;
	condition = DIA_Go_HELLO_Condition;
	information = DIA_Go_HELLO_Info;
	description = " You have plenty of room here. " ;
};


func int DIA_Go_HELLO_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void SLIDE_Go_HELLO_Info()
{
	AI_Output(other,self, " DIA_Gaan_HALLO_15_00 " );	// You have plenty of room here.
	AI_Output(self,other, " DIA_Gaan_HALLO_03_01 " );	// Yes, I like it here. But if you go down that Passage yonder, you might change your mind.
	AI_Output(self,other, " DIA_Gaan_HALLO_03_02 " );	// If this piece of land impressed you, then you haven't seen the Valley of Mines yet!
};


instance DIA_Go_WALD (C_Info)
{
	npc = BAU_961_Go;
	nr = 5;
	condition = DIA_Gaan_WALD_Condition;
	information = DIA_Go_WALD_Info;
	description = " What do I need to know about Mining Valley? " ;
};


func int DIA_Gaan_WALD_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_HELLO ))
	{
		return TRUE;
	};
};

func void SLIDE_Go_WALD_Info()
{
	AI_Output(other,self, " DIA_Gaan_WALD_15_00 " );	// What do I need to know about Mining Valley?
	AI_Output(self,other, " DIA_Gaan_WALD_03_01 " );	// I have no idea. I have only glimpsed the place from afar. It's too dangerous for me!
	AI_Output(self,other, " DIA_Gaan_WALD_03_02 " );	// It's best that if you go there,  stay on the beaten track!
	AI_Output(self,other, " DIA_Gaan_WALD_03_03 " );	// You can either go through the big gorge or follow the road over the stone bridge. The first way is shorter and safer...
	AI_Output(self,other, " DIA_Gaan_WALD_03_04 " );	// Now that the orcs are burrowing everywhere, we need to be very careful.
	AI_Output(self,other, " DIA_Gaan_WALD_03_05 " );	// I don't feel like dragging you to the healing witch.
};


instance DIA_Gan_SIGHT (C_Info)
{
	npc = BAU_961_Go;
	nr = 7;
	condition = DIA_Gaan_SAGITTA_Condition;
	information = DIA_Gan_SIGN_Info;
	description = " Witch Healer? " ;
};


func int DIA_Gaan_SAGITTA_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_WALD ) )
	{
		return TRUE;
	};
};

func void DIA_Gan_SET_Info()
{
	AI_Output(other,self, " DIA_Gaan_SAGITTA_15_00 " );	// Witch?
	AI_Output(self,other, " DIA_Gaan_SAGITTA_03_01 " );	// Her name is Sagitta. She heals farmers and other people living outside the city.
	AI_Output(self,other, " DIA_Gaan_SAGITTA_03_02 " );	// A very mysterious woman...
	AI_Output(self,other, " DIA_Gaan_SAGITTA_03_03 " );	// Nobody likes going to her, and everyone loves to gossip about her.
	AI_Output(self,other, " DIA_Gaan_SAGITTA_03_04 " );	// But if you get sick, you will not find better help anywhere than Sagitta. In her kitchen full of medicinal herbs...
	AI_Output(self,other, " DIA_Gaan_SAGITTA_03_05 " );	// You'll find her in the forest, behind the Sekoba farm.
};


instance DIA_Go_JAGD (C_Info)
{
	npc = BAU_961_Go;
	nr = 80;
	condition = DIA_Gaan_JAGD_Condition;
	information = DIA_Go_JAGD_Info;
	permanent = FALSE;
	description = " How are you hunting? " ;
};


func int DIA_Go_JAGD_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void SLIDE_Go_JAGD_Info()
{
	AI_Output(other, self, " DIA_Gaan_JAGD_15_00 " );	// How's the hunting?
	AI_Output(self,other, " DIA_Gaan_JAGD_03_01 " );	// The last animal I managed to kill was a big rat. Things are really bad lately.

	if (Npc_IsDead(Gaans_Snapper) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Gaan_JAGD_03_02 " );	// Some sort of snorting beast has been roaming around here for days now.
		AI_Output(self,other, " DIA_Gaan_JAGD_03_03 " );	// It not only kills everything that moves - it interferes with my work!
		MIS_Go_Snapper = LOG_Running;
		Log_CreateTopic(TOPIC_GaanSchnaubi,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_Running);
		B_LogEntry(TOPIC_GaanSchnaubi, " A snorting creature roams Gaan's hunting grounds and prevents him from hunting. If I kill this creature, Gaan might be thankful. " );
	};
};


instance DIA_Go_MONSTER (C_Info)
{
	npc = BAU_961_Go;
	nr = 8;
	condition = DIA_Gaan_MONSTER_Condition;
	information = DIA_Go_MONSTER_Info;
	description = " What does this 'dangerous beast' look like? " ;
};


func int DIA_Go_MONSTER_Condition()
{
	if ((MIS_Go_Snapper == LOG_Running) && (Npc_IsDead(Go_Snapper) ==  FALSE ))
	{
		return TRUE;
	};
};

func void SLIDE_Go_SAMPLE_Info()
{
	AI_Output(other,self, " DIA_Gaan_MONSTER_15_00 " );	// And what does this 'dangerous beast' look like?
	AI_Output(self,other, " DIA_Gaan_MONSTER_03_01 " );	// I... I don't know for sure! I could only hear the snorting and grinding of its claws. But I saw what it could do!
	AI_Output(self,other, " DIA_Gaan_MONSTER_03_02 " );	// Even the wolves are afraid of it! This thing rips them apart in seconds...
};


instance DIA_Go_WOHERMONSTER (C_Info)
{
	npc = BAU_961_Go;
	nr = 10;
	condition = DIA_Go_WOHERMONSTER_Condition;
	information = DIA_Go_WOHERMONSTER_Info;
	description = " Where did this cunning beast come from? " ;
};


func int DIA_Go_WOHERMONSTER_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_MONSTER ) && ( Npc_IsDead ( Gaan_Snapper ) ==  FALSE )) .
	{
		return TRUE;
	};
};

func void SLIDE_Go_WOHERMONSTER_Info()
{
	AI_Output(other,self, " DIA_Gaan_WOHERMONSTER_15_00 " );	// Where did this beast come from?
	AI_Output(self,other, " DIA_Gaan_WOHERMONSTER_03_01 " );	// Maybe from the Valley of Mines. But I don't know for sure.
	AI_Output(self,other, " DIA_Gaan_WOHERMONSTER_03_02 " );	// I've never been there myself.
};


instance DIA_Go_WASZAHLSTDU (C_Info)
{
	npc = BAU_961_Go;
	nr = 9;
	condition = DIA_Gaan_WASZAHLSTDU_Condition;
	information = DIA_Gaan_WASZAHLSTDU_Info;
	description = " How much will you pay if I kill this beast for you? " ;
};


func int DIA_Go_WASZAHLSTDU_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_WOHERMONSTER ) && ( Npc_IsDead ( Gaans_Snapper ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void SLIDE_Go_WASZAHLSTDU_Info()
{
	AI_Output(other,self, " DIA_Gaan_WASZAHLSTDU_15_00 " );	// How much will you pay if I kill this beast for you?
	AI_Output(self,other, " DIA_Gaan_WASZAHLSTDU_03_01 " );	// I would give whoever kills this beast everything I have.
	B_Say_Gold(self,other,30);
	MIS_Go_Deal = LOG_Running;
};


instance DIA_Go_MONSTERTOT (C_Info)
{
	npc = BAU_961_Go;
	nr = 11;
	condition = DIA_Gaan_MONSTERTOT_Condition;
	information = DIA_Go_MONSTERTOT_Info;
	important = TRUE;
};


func int SLIDE_Go_MONSTERTOT_Condition()
{
	if((Npc_IsDead(Gaans_Snapper) == TRUE) && (RangerMeetingRunning != LOG_Running))
	{
		return TRUE;
	};
};

func void SLIDE_Go_MONSTERTOT_Info()
{
	AI_Output(self,other, " DIA_Gaan_MONSTERTOT_03_00 " );	// That monster is dead, I presume?
	AI_Output(self,other, " DIA_Gaan_MONSTERTOT_03_01 " );	// Now I can hunt safely again.
	if (MIS_Go_Deal == LOG_Running)
	{
		B_GivePlayerXP(XP_Gaan_WaldSnapper);
		AI_Output(self,other, " DIA_Gaan_MONSTERTOT_03_02 " );	// Here's the money I promised.
		CreateInvItems(self,ItMi_Gold,30);
		B_GiveInvItems(self,other,ItMi_Gold,30);
	};
	MIS_Go_Snapper = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_SUCCESS);
};


instance SLIDE_GO_WHATSNEW (C_Info)
{
	npc = BAU_961_Go;
	nr = 11;
	condition = dia_gaan_whatsnew_condition;
	information = slide_go_whatsnew_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_gaan_whatsnew_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_JAGD ) && ( RangerMeetingRunning != LOG_Running ))
	{
		return TRUE;
	};
};

func void slide_go_whatsnew_info()
{
	AI_Output(other,self,"DIA_Gaan_WhatsNew_01_00");	//What's new?

	if (MIS_Go_Snapper == LOG_Running)
	{
		if (Chapter >=  3 )
		{
			AI_Output(self,other, " DIA_Gaan_JAGD_03_04 " );	// Things are getting worse and worse. In the meantime, more of these creatures are pouring through the passage in droves.
		};

		AI_Output(self,other, " DIA_Gaan_JAGD_03_05 " );	// The hunt is getting harder and harder...
	}
	else
	{
		AI_Output(self,other, " DIA_Gaan_JAGD_03_06 " );	// I have nothing to complain about right now.
	};
};


instances of DIA_Addon_Gaan_Ranger (C_Info)
{
	npc = BAU_961_Go;
	nr = 2;
	condition = DIA_Addon_Gaan_Ranger_Condition;
	information = DIA_Addon_Go_Ranger_Info;
	description = " Why are you looking so suspicious? " ;
};


func int DIA_Addon_Gaan_Ranger_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_WASMACHSTDU ) && ( SCIsWearingRangerRing ==  TRUE ) && ( RangerMeetingRunning ==  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_Ranger_Info()
{
	AI_Output(other,self, " DIA_Addon_Gaan_Ranger_15_00 " );	// Why are you looking at me that way?
	AI_Output(self,other, " DIA_Addon_Gaan_Ranger_03_01 " );	// You're wearing our aquamarine ring.
	AI_Output(other,self, " DIA_Addon_Gaan_Ranger_15_02 " );	// Do you belong to the Water Ring?
	AI_Output(self,other, " DIA_Addon_Gaan_Ranger_03_03 " );	// That's right! Nice to see a new person in our ranks.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Gaan_MeetingIsRunning(C_Info)
{
	npc = BAU_961_Go;
	nr = 1;
	condition = DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information = DIA_Addon_Go_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Gaan_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Gaan_MeetingIsRunning_One_time;

func void DIA_Addon_Gaan_MeetingIsRunning_Info()
{
	if(DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Gaan_MeetingIsRunning_03_00 " );	// Nice to see a new face among us. Welcome to the Water Ring!
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Gaan_MeetingIsRunning_03_01 " );	// Vatras wants to see you, go to him!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Gaan_AufgabeBeimRing (C_Info)
{
	npc = BAU_961_Go;
	nr = 2;
	condition = DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information = DIA_Addon_Gaan_AufgabeBeimRing_Info;
	description = " What are your responsibilities in this society? " ;
};


func int DIA_Addon_Gaan_AufgabeBeimRing_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Addon_Gaan_Ranger) || (RangerMeetingRunning !=  0 )) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info()
{
	AI_Output(other,self, " DIA_Addon_Gaan_AufgabeBeimRing_15_00 " );	// What are your duties here?
	AI_Output(self,other, " DIA_Addon_Gaan_AufgabeBeimRing_03_01 " );	// I'm watching the passage. Checking who comes and who goes.
	AI_Output(self,other, " DIA_Addon_Gaan_AufgabeBeimRing_03_02 " );	// However, since the paladins ordered to close the gates of the passage, there are not too many people here.
};


instance DIA_Addon_Go_MissingPeople (C_Info)
{
	npc = BAU_961_Go;
	nr = 2;
	condition = DIA_Addon_Gaan_MissingPeople_Condition;
	information = DIA_Addon_Go_MissingPeople_Info;
	description = " Have you heard about missing people? " ;
};


func int DIA_Addon_Gaan_MissingPeople_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Gaan_AufgabeBeimRing ) && ( SC_HearedAboutMissingPeople ==  TRUE ) && ( MissingPeopleReturnedHome ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Go_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Gaan_MissingPeople_15_00 " );	// Have you heard about the missing people?
	AI_Output(self,other, " DIA_Addon_Gaan_MissingPeople_03_01 " );	// Of course. That is why we always have to be careful.
	AI_Output(self,other, " DIA_Addon_Gaan_MissingPeople_03_02 " );	// But I don't know of anything that could help you.
};


instance DIA_Go_AskTeacher (C_Info)
{
	npc = BAU_961_Go;
	nr = 10;
	condition = DIA_Gaan_AskTeacher_Condition;
	information = DIA_Go_AskTeacher_Info;
	description = " Can you teach me how to hunt? " ;
};


func int DIA_Gaan_AskTeacher_Condition()
{
	if (( HEROISHUNTER  ==  TRUE ) && Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void SLIDE_Go_AskTeacher_Info()
{
	AI_Output(other,self, " DIA_Gaan_AskTeacher_15_00 " );	// Can you teach me how to hunt?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_03_02 " );	// I can't teach you anything you don't already know. Sorry!
		GaanTeachFinish = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Gaan_AskTeacher_03_01 " );	// No problem! For a hundred gold coins, I can show you how to disembowel the animals you kill.
		AI_Output(self,other, " DIA_Gaan_AskTeacher_03_02 " );	// Skins and other trophies can be sold at the market for a profit.
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		B_LogEntry( TOPIC_HUNTERTEACHERS , " Gahan can teach me how to butcher loot. " );
	};
};

instance DIA_Go_PayTeacher (C_Info)
{
	npc = BAU_961_Go;
	nr = 11;
	condition = DIA_Gaan_PayTeacher_Condition;
	information = DIA_Go_PayTeacher_Info;
	permanent = TRUE;
	description = " Here! One hundred gold pieces for your experience in butchering animals. " ;
};

var int DIA_Gaan_PayTeacher_noPerm;

func int DIA_Gaan_PayTeacher_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Gaan_AskTeacher ) && ( DIA_Gaan_ PayTeacher_noPerm ==  FALSE ))
	{
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE))
		{
			return TRUE;
		};
	};
};

func void SLIDE_Go_PayTeacher_Info()
{
	AI_Output(other,self, " DIA_Gaan_PayTeacher_15_00 " );	// Here! One hundred gold for your experience in butchering animals.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Gaan_PayTeacher_03_01 " );	// Thank you. What do you want to learn?
		Go_TeachPlayer = TRUE ;
		DIA_No_PayTeacher_noPerm = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Gaan_PayTeacher_03_02 " );	// Contact me later when you have the money.
	};
};


instance DIA_Go_TEACHHUNTING (C_Info)
{
	npc = BAU_961_Go;
	nr = 12;
	condition = DIA_Gaan_TEACHHUNTING_Condition;
	information = DIA_Go_TEACHHUNTING_Info;
	permanent = TRUE;
	description = " What can you teach me? " ;
};

func int DIA_Gaan_TEACHHUNTING_Condition()
{
	if ((Go_TeachPlayer ==  TRUE ) && (GoTeachFinish ==  FALSE ))
	{
		return TRUE;
	};
};

func void SLIDE_Go_TEACHHUNTING_Info()
{
	AI_Output(other,self, " DIA_Gaan_TEACHHUNTING_15_00 " );	// What can you teach me?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_03_01 " );	// It depends on what you already know.
		Info_AddChoice(SLIDE_GO_TEACHHUNTING,Dialog_Back,SLIDE_GO_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Pulling of Fangs",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Gaan_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Removal of Claws",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Gaan_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Skinning",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Gaan_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt( " Cut off Blood Hornet Stinger " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_BFSting)),DIA_Gaan_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt( " Cut off Blood Hornet Wings " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_BFWing)),DIA_Gaan_TEACHHUNTING_BFWing);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_03_02 " );	// I can't teach you anything you don't already know. Sorry!
		GaanTeachFinish = TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
};

func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Claws_03_00 " );	// Beasts don't like to part with their claws. The knife needs to be very precise.
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Claws_03_01 " );	// Your arms should be slightly crossed. Then you need to cut off the claws with a strong blow.
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Claws_03_02 " );	// Merchants are always ready to shell out a tidy sum for claws.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(SLIDE_GO_TEACHHUNTING,Dialog_Back,SLIDE_GO_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Teeth_03_00 " );	// The easiest way is to cut out the animal's teeth. Just run your knife around the gums in the animal's mouth.
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Teeth_03_01 " );	// Then you need to separate them from the skull with a precise blow.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(SLIDE_GO_TEACHHUNTING,Dialog_Back,SLIDE_GO_TEACHHUNTING_BACK);
};

func void SLIDE_Go_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Fur_03_00 " );	// It is best to skin by making a deep incision in the hind legs.
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_Fur_03_01 " );	// After that, you can easily remove the skin by pulling it off the animal.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(SLIDE_GO_TEACHHUNTING,Dialog_Back,SLIDE_GO_TEACHHUNTING_BACK);
};

func void SLIDE_GO_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_BFSting_03_00 " );	// These flies have a soft spot on their backs.
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_BFSting_03_01 " );	// If you click there, the stinger will extend very far. And you can cut it off with a knife.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(SLIDE_GO_TEACHHUNTING,Dialog_Back,SLIDE_GO_TEACHHUNTING_BACK);
};

func void SLIDE_GO_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_BFWing_03_00 " );	// It's best to separate the bloodfly's wings by slicing them off with a sharp knife as close to the body as possible.
		AI_Output(self,other, " DIA_Gaan_TEACHHUNTING_BFWing_03_01 " );	// Be very careful not to damage the delicate tissue of the wings. They won't be worth anything if you damage them.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(SLIDE_GO_TEACHHUNTING,Dialog_Back,SLIDE_GO_TEACHHUNTING_BACK);
};

instance DIA_Go_PICKPOCKET (C_Info)
{
	npc = BAU_961_Go;
	nr = 900;
	condition = DIA_Gaan_PICKPOCKET_Condition;
	information = DIA_Go_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gaan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 23 , 35 );
};

func void SLIDE_Go_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,Dialog_Back,DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice(SLIDE_Go_PICKPOCKET, DIALOG_PICKPOCKET ,SLIDE_Go_PICKPOCKET_DoIt);
};

func void SLIDE_GO_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};

func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};


instance SLIDE_GO_RESPECT (C_Info)
{
	npc = BAU_961_Go;
	nr = 1;
	condition = dia_gaan_respect_condition;
	information = slide_go_respect_info;
	permanent = TRUE;
	description = " I want to challenge Falk. " ;
};


func int dia_gaan_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( MIS_HUNTERCHALLANGE  ==  FALSE ) && ( GAAN_RESPECT  ==  FALSE ) && Npc_KnowsInfo(other,DIA_GAAN_WASMACHSTDU));
	{
		return TRUE;
	};
};

func void slide_go_respect_info()
{
	AI_Output(other,self, " DIA_Gaan_Respect_01_00 " );	// I want to challenge Falk.
	AI_Output(self,other, " DIA_Gaan_Respect_01_01 " );	// What do you want from me?
	AI_Output(other,self, " DIA_Gaan_Respect_01_02 " );	// I need to get the support of the majority of hunters, which is why I turned to you.
	AI_Output(other,self, " DIA_Gaan_Respect_01_03 " );	// What do you say about my request?
	AI_Output(self,other, " DIA_Gaan_Respect_01_04 " );	// Do you want my vote?

	if (MIS_Go_Snapper ==  LOG_SUCCESS )
	{
		Info_ClearChoices(slide_go_respect);
		Info_AddChoice(slide_go_respect, " Да! " ,slide_go_respect_yes);
	}
	else
	{
		AI_Output(self,other, " DIA_Gaan_Respect_01_05 " );	// You haven't helped me yet. I see no reason to help you.
		AI_Output(other,self,"DIA_Gaan_Respect_01_06");	//Fine!
	};
};

func void slide_go_respect_yes()
{
	AI_Output(other,self,"DIA_Gaan_Respect_Yes_01_00");	//Yes!
	AI_Output(self,other, " DIA_Gaan_Respect_Yes_01_01 " );	// Hmm...(thoughtfully) Well then! You killed the snorting thing.
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Gaan_Respect_Yes_01_02 " );	// You really are a good hunter.
	AI_Output(self,other, " DIA_Gaan_Respect_Yes_01_03 " );	// If Falk asks me, I'll vote for you.
	Info_ClearChoices(slide_go_respect);
	AI_StopProcessInfos(self);
	GO_RESPECT = TRUE ;
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	B_LogEntry( TOPIC_HUNTERSWORK , " Hunter Gahan will vote for me if I want to challenge Falk to a hunting match " );
};

instance DIA_Addon_Gaan_WhatHappen (C_Info)
{
	npc = BAU_961_Go;
	nr = 1;
	condition = DIA_Addon_Gaan_WhatHappen_Condition;
	information = DIA_Addon_Gaan_WhatHappen_Info;
	description = " What happened here? " ;
};

func int DIA_Addon_Gaan_WhatHappen_Condition()
{
	if ((Chapter >=  3 ) && (MIS_SCKnowsInnosEyeIsBroken ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Go_WhatHappen_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Gaan_WhatHappen_01_00 " );	// What happened here?
	AI_Output(self,other, " DIA_Addon_Gaan_WhatHappen_01_01 " );	// Creepy stuff, mate... I still can't get over it.
	AI_Output(other,self, " DIA_Addon_Gaan_WhatHappen_01_02 " );	// Better pull yourself together and tell me everything.
	AI_Output(self,other, " DIA_Addon_Gaan_WhatHappen_01_03 " );	// The paladins guarding the passage to the Valley of Mines were attacked by mages in black robes.
	AI_Output(self,other, " DIA_Addon_Gaan_WhatHappen_01_04 " );	// The paladins fought bravely, but they were overwhelmed!
	AI_Output(self,other, " DIA_Addon_Gaan_WhatHappen_01_05 " );	// And after the paladins fell, they all headed towards the city.
	AI_Output(other,self, " DIA_Addon_Gaan_WhatHappen_01_06 " );	// How many were there?!
	AI_Output(self,other, " DIA_Addon_Gaan_WhatHappen_01_07 " );	// About a dozen! But I can't say for sure.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_08");	//I see.
};
