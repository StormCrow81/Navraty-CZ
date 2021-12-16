
func int C_BragoBanditsDead()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Welcome to the Ring, my friend.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras will tell you what you must do next.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "Problems?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	if(Kapitel < 6)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Problems?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//Damn. (irritated) I don't know where they are all hiding! You kill one and soon they all return..
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//Wait a minute! Do I know you? You are the guy who constantly begged me for arrows in the Valley of Mines..
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Your name is Cavalorn, right??",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"I seem to have forgotten something...",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//I seem to have forgotten something...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//Well, of course. Back in my hut near the Old Camp, I taught you how to shoot a bow and move unnoticed. Do you remember now?
	CAVALORNBONUSGOTIKA = TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	if(CAVALORNBONUSGOTIKA == FALSE)
	{
		CAVALORNBONUSGOTIKA = TRUE;
		B_GivePlayerXP(50);
	};
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Your name is Cavalorn, right??
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Aha! I see that you still haven't forgotten me after everything we've been through in this damned colony.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Where are you going?
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"I don't have a specific target.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Back to the Ore Valley.",DIA_Addon_Cavalorn_HALLO_Bauern);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Into the city.",DIA_Addon_Cavalorn_HALLO_Stadt);
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//To the city.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//Well, well. (laughs) To the city! Hmmm ...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//You may have some trouble with the guards. They no longer let just anyone in. The whole area is swarming with bandits!

	if(LESTER_TERRAININFO == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//A few days ago, one of the former prisoners of the Valley of the Mines passed here. He said that he constantly leaves Khorinis and returns.
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//He headed into the valley below the big tower. Somewhere near the waterfall there should be a passage there.
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Maybe you should talk to him.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Back to the Valley of the Mines.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//Really? Hmmm ... (amazed) I wish I could go with you, but I have business to finish here.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//If you find my old hut in the Valley, will you let me know if its still standing? I'd like to go back there someday.
	MIS_Addon_Cavalorn_TheHut = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Cavalorn wants me to check if his old hut in the Valley of Mines is still intact. As far as I remember, it is in the hills to the west where Old Camp was. I think he left something there.");
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//I don't have a specific goal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//You don't want to tell me, do you? OK.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "I was at your hut in the Valley of the Mines.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//I was at your hut in the Valley of the Mines.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//So it’s still standing.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Yes. And I know why you wanted to go back there.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Did you find it?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//If you mean the bag of ore chunks ... yes, I have it.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//So you found it. Sneaky bastard...
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//What else would you need in that old shack? There is nothing else there.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	// Do you have it with you? I'll give you one hundred gold for it.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);

	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Of course.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"No, but I have another piece of ore.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"No.",DIA_Addon_Cavalorn_Beutel_no);
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//I hope he comes back to me.
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//No, but I have another piece of ore.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Not too bad .
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Why did you leave at all?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Of course.
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Why did you leave at all?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//No.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Then Bring it to me! I was going to go to that damn Valley myself.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//I'm almost in tears.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Terrible!
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Why did you leave at all?",DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Why did you leave at all?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//I never thought there was so much ore in Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//That much ore wouldn't have bought you a flea ridden mattress back in the colony.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//In the port city they'll gut you like a fish if they find out you have ore on you.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "Give me one hundred gold and I'll give you your ore.";
};

func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Give me one hundred gold and I'll give you your ore.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Here's your money. Now hand it over.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1) == FALSE)
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Thanks, you're a real pal.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "What are you doing here?";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//What are you doing here??
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Sitting on my hands because of those damn bandits!
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "What's with the bandits?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//What's with the bandits?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Were you living under a rock the last few weeks?!
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Мммм...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//I'm talking about all the escaped convicts making themselves at home here, robbing and killing everyone they can.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//I guess I'm lucky they didn't kill me. I was distracted for literally a second and I got knocked out from behind. My head still hurts.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//I don't even know how to get my things back now.
	};
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "So you got robbed?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//So you got robbed?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//Yes ... (furious) They knocked me out and threw me to the goblins for breakfast!
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//I just need to get the letter back. My cash would be nice too, if there's any left.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//But without someone to watch my back I can't go back there. Bloody cowards...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "I can help you with the bandits.";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//I can help you with the bandits.
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//Maybe. But you look so skinny, you probably haven't held a sword in weeks..
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Well ... I have no choice, so I accept your offer. I do not have much time.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//They're in a cave just down the road.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//The scum that robbed me are hiding out in there.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Tell me when you're ready and we'll go kick some ass.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"The bandits stole something of value from Cavalorn. He wants me to help him kill them.");
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "I need better equipment.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != 0) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//I need better equipment.
	if(C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Those pigs left me almost nothing.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//I can give you a wolf knife. Is that enough for now?
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//You call that a knife?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//What about some healing?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//I have two more healing potions. Will that do?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Definitely. Thanks.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "Let's go and deal with these guys!";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && (C_BragoBanditsDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	var C_Npc bandit1;
	var C_Npc bandit2;
	var C_Npc bandit3;

	bandit1 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	bandit2 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	bandit3 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Let's go deal with these guys!
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Of course. Make sure they don't sneak up from behind, ok?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//They're in for a nasty surprise.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	CAVALORNGOBANDITS = TRUE;

	if(Bdt_1013_Away == FALSE)
	{
		bandit1.aivar[AIV_EnemyOverride] = FALSE;
		b_changeguild(Bdt_1013_Bandit_L,GIL_BDT);
	};

	bandit2.aivar[AIV_EnemyOverride] = FALSE;
	bandit3.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	var C_Item itm;

	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//I can finally complete my task. I've already wasted too much time.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//What is this task?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//Oh yeah. I still need to get into the city after all, and then...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//I don't know if I will have enough time.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//What about me?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//Hmmm ... (appraisingly) Why not! You can deliver a letter to the city
		};

	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//This gives me a little more time to take care of my gear.
	
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//The letter should be in the pocket of one of the bandits.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Take it to Vatras, the water mage, in the city. You will find him in the square, near a small temple. He preaches there all day!
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Tell him I failed.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//And if he asks where I am, just tell him I'm on my way to the meeting point, okay?
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW," Water magician Vatras lives in the city of Khorinis. He preaches sermons in the square..");
	};

	itm = Npc_GetEquippedArmor(other);

	if((hero.guild == GIL_NONE) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//Oh, yes, and one more thing. First, buy some decent clothes from a farmer.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Otherwise you might be mistaken for a bandit! Here are a couple of coins.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};

	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if(MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
	};

	Npc_ExchangeRoutine(self,"Start");
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};

func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((C_BragoBanditsDead() == TRUE) && (Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Done! Ha ... they shouldn't have messed with me.
	CavSendVatras = TRUE;
	B_Addon_Cavalorn_VatrasBrief();
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_01");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_02");
	Wld_InsertNpc(Gobbo_Green,"NW_XARDAS_GOBBO_02");
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = " The bandits are finished. " ;
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if((CavSendVatras == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//The bandits are over.
	B_Addon_Cavalorn_VatrasBrief();
};

instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "Interesting armor you have on. " ;
};

func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Interesting armor on you. Don't you belong to the Shadows anymore?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Shadows? They have not existed since the Barrier fell.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//When we could finally leave the Valley of the Mines, there was no point in staying with them.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Now I work for the Water Mages. I belong to the 'Ring of Water'.
	SC_KnowsRanger = TRUE;
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Cavalorn told me that he belongs to a community called the 'Ring of Water'. " );
	Cavalorn_RangerHint = TRUE;
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = " Tell me about the 'Ring of Water'! " ;
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Tell me about the 'Ring of Water'!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//I really can't talk about it.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//All I can do is send you to Vatras. He is the representative of the water mages in Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//You'd better talk to him. Tell me that I recommended you.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Maybe he will accept you into our ranks. We urgently need good people...
	B_LogEntry(TOPIC_Addon_RingOfWater," The Water Mage Vatras can tell me about the Ring of Water. " );
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = " Weren't you and your guys enemies of the water mages before? " ;
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Weren't you and your guys enemies of the water mages before?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Those days are over. There are no more 'Camps'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//After the colony ceased to exist, everyone was left for themselves.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Most of the former prisoners are still on the hunt.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//The Water Mages managed to deal with my sentence, and now I can move freely.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "What exactly are the water mages doing?";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//What exactly do the water mages do?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//They're up to something serious. This concerns an unknown area on the island.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Unknown area? Where could that be?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//I can't tell you. Talk to Vatras in Khorinis.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "I gave your letter to Vatras.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//I gave your letter to Vatras..
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//I didn't expect otherwise. Thank you.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "Are you looking for something?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Are you looking for something?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//Is it so noticeable? Yes, I have an assignment from the water mages looking for a lost ornament.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//How convenient. I have the same assignment from Nefarius.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//So you belong to the 'Ring of Water'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Yes,
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Not yet, but I'm working on it.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//I'm glad. So I don't have to do this alone.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Have you found the ornament yet?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//I know where it might be.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//This stone circle is similar to what Nefarius described.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Now we just need to find the mechanism.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = " I've tried it but it doesn't work.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//I tried but it doesn't work ... does nothing.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//So the Lobart farmers were right.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//They said that one of them was hanging around here, near the stones.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//The Stone Guard appeared out of nowhere and attacked him.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//The farmers called the militias, they alerted the paladins, who destroyed the monster.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//I've already searched everything here. I have a feeling its with the Paladins now.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Some of us will have to climb up to the upper part of the city.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Then I'll go and ask them for the ornament. " , DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Now I'm going to town again. Meet me at Vatras.
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"One of the parts of the ornament is in the upper quarter of the paladins.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");

	if(Kapitel < 3)
	{
		if(!Npc_IsDead(Ambusher_1013))
		{
			B_StartOtherRoutine(Ambusher_1013,"AWAY");
			Wld_InsertNpc(Wolf,"NW_XARDAS_MONSTER_INSERT_01");
		}
		else
		{
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
			Wld_InsertNpc(Gobbo_Black,"NW_XARDAS_GOBBO_02");
		};
	};

	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Then I'll go and ask them for an ornament.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Great.
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,ITAR_Bau_L,1);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,Npc_HasItems(self,ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self,ITAR_Fake_RANGER,Npc_HasItems(self,ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Some of us will have to climb to the upper part of the city.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//I don't have time for this. You'll have to do it.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "I received the missing ornament from the paladins.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//I got the missing ornament from the paladins.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//See? I knew they had it.
	B_GivePlayerXP(XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "Can you teach me anything?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (C_BragoBanditsDead() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Can you teach me anything?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Of course. You really have forgotten a lot haven't you?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//You really don't remember anything, do you?
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,"Cavalorn can show me how to use a bow and one-handed weapon. Also, increase my stamina and vitality.");
};


var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "I want to learn what you can do.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if(Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cavalorn_TEACH_Choices()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_addon_cavalorn_teach_stamina_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_addon_cavalorn_teach_stamina_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_addon_cavalorn_teach_hp_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_addon_cavalorn_teach_hp_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Cavalorn_Teach_1H_5);
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn what you can do.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Good. What exactly are you interested in?
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void dia_addon_cavalorn_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30);
	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Addon_Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Better already! You've forgotten a lot since then, but we'll fix that.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};


instance DIA_ADDON_CAVALORN_ESCAPEFROMTOWN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_escapefromtown_condition;
	information = dia_addon_cavalorn_escapefromtown_info;
	permanent = FALSE;
	description = "Nice to see you, Cavalorn!";
};


func int dia_addon_cavalorn_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_escapefromtown_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_00");	//Nice to see you, Cavalorn!
	AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_01");	//It turns out that you also managed to get out of the city alive.
	MEETCAVALORNAGAIN = TRUE;
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_02");	//As you can see. (smiling) And not only me.

		if((THORUSHERE == TRUE) && (SCATTYHERE == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_03");	//If you mean Scatti and Torus, then I have already met them.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_04");	//Well, if that's the case, then I won't go into details. They've probably already told you everything.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_05");	//Of course.
		}
		else if((THORUSHERE == TRUE) && (SCATTYHERE == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_06");	//If you mean Torus, then I have already met him.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_07");	//Well, if that's the case, then I won't go into details. He's probably already told you everything.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_08");	//Of course.
		}
		else if((THORUSHERE == FALSE) && (SCATTYHERE == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_09");	//If you mean Scatti, I've already met him.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_10");	//Well, if that's the case, then I won't go into details. He's probably already told you everything.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_11");	//Of course.
		};
	}
	else
	{
		if((THORUSINSERTED == TRUE) && !Npc_IsDead(vlk_6022_thorus))
		{
			THORUSHERE = TRUE;
		};
		if((SCATTYINSERTED == TRUE) && !Npc_IsDead(vlk_6024_scatty))
		{
			SCATTYHERE = TRUE;
		};
		if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_12");	//As you can see. (smiling) And not only me.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_13");	//Who do you mean?
			if((THORUSHERE == TRUE) && (SCATTYHERE == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_14");	//I still had Scatti and Thorus with me! I suppose you'll find them in that house over there.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_15");	//So you all fought your way out of the besieged Khorinis together?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_16");	//Of course! After all, the many years we spent in the colony only sharpened our skills.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_17");	//We used to always stick together in case of danger, and now it saved our lives.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_18");	//Got it.
			}
			else if((THORUSHERE == TRUE) && (SCATTYHERE == FALSE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_19");	//Torus was still with me! You will find him in that house over there.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_20");	//So you all fought your way out of the besieged Khorinis together?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_21");	//Of course! After all, the many years we spent in the colony only sharpened our skills.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_22");	//We used to always stick together in case of danger, and now it saved our lives.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_23");	//Got it.
			}
			else if((THORUSHERE == FALSE) && (SCATTYHERE == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_24");	//I still had Scutty with me! You will find him in that house over there.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_25");	//So you all fought your way out of the besieged Khorinis together?
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_26");	//Of course! After all, the many years we spent in the colony only sharpened our skills.
				AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_27");	//We used to always stick together in case of danger, and now it saved our lives.
				AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_28");	//Got it.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_29");	//As you can see. (sadly) Everyone is dead. The orcs spared no one.
			AI_Output(other,self,"DIA_Addon_Cavalorn_EscapeFromTown_01_30");	//There may be survivors. We have to be sure.
			AI_Output(self,other,"DIA_Addon_Cavalorn_EscapeFromTown_01_31");	//I hope you're right.
		};
	};
};


instance DIA_ADDON_CAVALORN_WHATNEXT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_whatnext_condition;
	information = dia_addon_cavalorn_whatnext_info;
	permanent = FALSE;
	description = "What are your future plans?";
};


func int dia_addon_cavalorn_whatnext_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_whatnext_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_00");	//What are your future plans?

	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_01");	//I wish I knew what to do next.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_02");	//But one thing I know for sure: you can't stay here long. It's too dangerous.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_03");	//The Orcs can be here any minute!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_05");	//I wish I knew what to do next.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_06");	//But one thing I know for sure: you can't stay here long. It's too dangerous.
		AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_07");	//The Orcs can be here any minute, the farm is a stone's throw from here.
	};

	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_09");	//However, as far as I can tell, they still haven't attacked.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_10");	//This scares me. (nervously) They are clearly plotting something, or waiting for something.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_11");	//Do you have any idea what they're up to?
	AI_Output(other,self,"DIA_Addon_Cavalorn_WhatNext_01_12");	//Not a clue.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WhatNext_01_13");	//Thought so. Damn it.
};


instance DIA_ADDON_CAVALORN_BIGFARMFREE(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_bigfarmfree_condition;
	information = dia_addon_cavalorn_bigfarmfree_info;
	permanent = FALSE;
	description = "I heard that Onar's farm is still free. " ;
};


func int dia_addon_cavalorn_bigfarmfree_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_whatnext))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bigfarmfree_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_00");	//I heard that Onar's farm is still free. 
	AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_01");	// So what?
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_02");	//Maybe you should go there.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_03");	//Good idea. But how do we do it?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_04");	//All roads to the farm are blocked by Orc patrols.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_05");	//We'll barely take a few steps before bumping into one of their units.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_01_06");	//Maybe you should go there.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_07");	//Good idea. But how do we do it?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_08");	//All roads to the farm are blocked by Orc patrols.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_01_09");	//We'll barely take a few steps before bumping into one of their units.
	};
	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
	Info_AddChoice(dia_addon_cavalorn_bigfarmfree,"I'll help get there!",dia_addon_cavalorn_bigfarmfree_go);
	Info_AddChoice(dia_addon_cavalorn_bigfarmfree,"You might be right.",dia_addon_cavalorn_bigfarmfree_notgo);
};

func void dia_addon_cavalorn_bigfarmfree_go()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_01");	//I'll help you get there.
	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_02");	//Are you saying you can guide us through all the orc positions?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_03");	//Why not! I know this area quite well.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_04");	//I'm sure we have a chance to slip past them unnoticed.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_05");	//Hmmm. Well, if you're so sure of that, then maybe we should take the risk.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_06");	//In the end, we will have to do this anyway. Why not now!
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_07");	//So you agree?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_08");	//Of course! I think you yourself figured it out. (emphatically) So let's not waste any more time talking.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_09");	//Tell me when you're ready and we'll follow you. May lady luck smile at us for once.
		MIS_OLDGUARDGOWAR = LOG_Running;
		Log_CreateTopic(TOPIC_OLDGUARDGOWAR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_Running);
		B_LogEntry(TOPIC_OLDGUARDGOWAR,"I volunteered to lead Cavalorn and his guys to Onar's farm, bypassing all the orc positions. I hope that something useful will come out this. " );
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_11");	//Are you saying you can guide me through all the orc positions?
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_12");	//Why not! I know this area quite well.
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_13");	//I'm sure we have a chance to slip past them unnoticed.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_14");	//Hmmm. Well, if you're so sure of that, then maybe we should take the risk.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_15");	//In the end, we will have to do this anyway. Why not now!
		AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_16");	//So you agree?
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_17");	//Of course! I think you yourself figured it out. (emphatically) So let's not waste any more time talking.
		AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_Go_01_18");	//Tell me when you're ready and we'll follow you. May lady luck smile at us for once.
		MIS_OLDGUARDGOWAR = LOG_Running;
		Log_CreateTopic(TOPIC_OLDGUARDGOWAR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_Running);
		B_LogEntry(TOPIC_OLDGUARDGOWAR,"I volunteered to lead Cavalorn and his guys to Onar's farm, bypassing all the orc positions. I hope that something useful will come out this. " );
	};

	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
};

func void dia_addon_cavalorn_bigfarmfree_notgo()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_00");	//You may be right.
	AI_Output(other,self,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_01");	//It would be really foolish to hope the orcs won't notice us.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BigFarmFree_NotGo_01_02");	//You're right. Unfortunately we don't have a choice.
	REFUSEHELPCAVALORN = TRUE;

	if(MIS_DIEGOOLDFRIENS == LOG_Running)
	{
		MIS_DIEGOOLDFRIENS = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_DIEGOOLDFRIENS);
	};

	Info_ClearChoices(dia_addon_cavalorn_bigfarmfree);
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWAR(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowar_condition;
	information = dia_addon_cavalorn_oldguardgowar_info;
	permanent = TRUE;
	description = "Follow me!";
};

func int dia_addon_cavalorn_oldguardgowar_condition()
{
	if(MIS_OLDGUARDGOWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWar_01_00");	//Follow me!

	if((THORUSHERE == TRUE) || (SCATTYHERE == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_01");	//Good. Don't forget about the other guys too!
		AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWar_01_02");	//I remember them.
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_03");	//Well, go ahead then.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWar_01_04");	//Good. Forward!
	};

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWARDONE(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowardone_condition;
	information = dia_addon_cavalorn_oldguardgowardone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cavalorn_oldguardgowardone_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowardone_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_00");	//Great! Apparently, we are already there.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_01");	//You see - as I promised.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_02");	//I'm sure you'll be safer here than at Aquila's farm.
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDone_01_03");	//Well then thanks for the help! Without her, it would have been much more difficult for us to break through the hordes of orcs.
	MIS_OLDGUARDGOWAR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OLDGUARDGOWAR,LOG_SUCCESS);
	B_LogEntry(TOPIC_OLDGUARDGOWAR,"I brought Cavalorn to Onar's farm. The danger is over.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	ORCAKILINSERTED = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
};

instance DIA_ADDON_CAVALORN_OLDGUARDGOWARDONEPOTION(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_oldguardgowardonepotion_condition;
	information = dia_addon_cavalorn_oldguardgowardonepotion_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_cavalorn_oldguardgowardonepotion_condition()
{
	if(MIS_OLDGUARDGOWAR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_oldguardgowardonepotion_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_01");	//Wait! Here, take this elixir as my thanks.
	CreateInvItems(self,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_02");	//I'm sure it will come in handy for you.
	AI_Output(other,self,"DIA_Addon_Cavalorn_OldGuardGoWarDonePotion_01_03");	//Thank you.
	AI_StopProcessInfos(self);
	if(SCATTYINSAFE == TRUE)
	{
		B_StartOtherRoutine(scatty_nw,"FarmRest");
	};
	if(THORUSINSAFE == TRUE)
	{
		B_StartOtherRoutine(thorus_nw,"FarmRest");
	};
};

instance DIA_ADDON_CAVALORN_WHEREPEASANT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_wherepeasant_condition;
	information = dia_addon_cavalorn_wherepeasant_info;
	permanent = FALSE;
	description = "Where are all the peasants from the yard?";
};


func int dia_addon_cavalorn_wherepeasant_condition()
{
	if(Npc_KnowsInfo(other,dia_thorus_nw_escapefromtown) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WherePeasant_01_00");	//Where are all the peasants from the yard?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WherePeasant_01_01");	//I have no idea. Scattered, probably, in all directions.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WherePeasant_01_02");	//It's too dangerous to stay here now. This farm is too visible for the orcs to ignore.
	KNOWWHEREAKIL = TRUE;
};

