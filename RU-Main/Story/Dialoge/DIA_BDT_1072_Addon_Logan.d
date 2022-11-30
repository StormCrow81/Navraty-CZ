
instance DIA_Addon_Logan_EXIT(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 999;
	condition = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent = TRUE;
	description = " I'll be back later... " ;
};


func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	AI_Output(other,self, " DIA_Addon_Logan_EXIT_15_00 " );	// I'll be back later...
	if(!((MIS_HlpLogan == LOG_Running) || !(MIS_HlpLogan == LOG_SUCCESS)) && (Logan_Inside == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_Logan_EXIT_10_01 " );	// (grouchily) Yeah, you're just running away. And I will stay here and stop anyone who gets too close.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Logan_PICKPOCKET(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 900;
	condition = DIA_Addon_Logan_PICKPOCKET_Condition;
	information = DIA_Addon_Logan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Logan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 59 , 50 );
};

func void DIA_Addon_Logan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,Dialog_Back,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};


instance DIA_Addon_BDT_1072_Logan_Mine(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Logan_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other, " DIA_Addon_BDT_1072_Logan_Mine_10_00 " );	// So you did it, hmm... Okay, good thing you didn't forget about me.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Logan_How2(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Addon_Logan_How2_Condition()
{
	if((Logan_Inside == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other,self, " DIA_Addon_Logan_How2_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Addon_Logan_How2_10_01 " );	// Well, at least I'm inside now. Lucia is making some nasty liquor.
	AI_Output(self,other, " DIA_Addon_Logan_How2_10_02 " );	// But Esteban won't let me into the mine. Well, he doesn't want to. He gave me another job.
	AI_Output(other,self, " DIA_Addon_Logan_How2_15_03 " );	// And? What does he want from you?
	AI_Output(self,other, " DIA_Addon_Logan_How2_10_04 " );	// There was an attempt on his life. And he wants me to find out who's behind this.
	AI_Output(self,other, " DIA_Addon_Logan_How2_10_05 " );	// (quietly) Esteban thinks Snaf is involved. I need to watch him...
};


instance DIA_Addon_Logan_Attentat(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Logan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (Logan_Inside == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other, " DIA_Addon_Logan_Attentat_10_00 " );	// You're looking for whoever's behind this, right?
	AI_Output(self,other, " DIA_Addon_Logan_Attentat_10_01 " );	// But I don't know anything about it. How should I know? Then I was still in the swamp ...
};


instances of DIA_Addon_Logan_HI (C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_HI_Condition()
{
	if((Logan_Inside == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self,other, " DIA_Addon_Logan_HI_10_00 " );	// Look, a new face.
	AI_Output(self,other, " DIA_Addon_Logan_HI_10_01 " );	// Did you just come to stand beside me, or maybe you can still help?
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
	{
		AI_Output(other,self, " DIA_Addon_Logan_HI_15_02 " );	// Franco sent me. He says you might need help. So that?
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Logan_HI_15_03 " );	// It depends on what you need help with?
	};
	AI_Output(self,other, " DIA_Addon_Logan_HI_10_04 " );	// The swamp sharks are starting to get too close to me. It's time to finish off some of them.
	Log_CreateTopic(Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan,LOG_Running);
	B_LogEntry(Topic_Addon_Logan, " Logan wants me to go on a swamp hunt with him. " );
};


instance DIA_Addon_Logan_Why(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent = FALSE;
	description = " What will I get for my help? " ;
};


func int DIA_Addon_Logan_Why_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Logan_HI ) && ( Logan_Inside ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other,self, " DIA_Addon_Logan_Why_15_00 " );	// What do I get for helping?
	AI_Output(self,other, " DIA_Addon_Logan_Why_10_01 " );	// (growls) Franco will rot you here if you don't.
	AI_Output(self,other, " DIA_Addon_Logan_Why_10_02 " );	// If you want to get into the camp, you'll have to help others. Words alone won't get you far.
	AI_Output(self,other, " DIA_Addon_Logan_Why_10_03 " );	// And besides, I can show you how to butcher these beasts.
	AI_Output(self,other, " DIA_Addon_Logan_Why_10_04 " );	// But I don't think Franco will send you to the camp just because we're here to have some fun with the swamp eaters.
	AI_Output(self,other, " DIA_Addon_Logan_Why_10_05 " );	// There are people here who have been waiting for a long time to get inside.
	AI_Output(self,other, " DIA_Addon_Logan_Why_10_06 " );	// And the next one to get there will be me... (growls)... It better be like this...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, " Logan can teach me how to skin and pick teeth and claws. " );
};


instances of DIA_Addon_Logan_Lager (C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent = FALSE;
	description = " What's in the camp? " ;
};


func int DIA_Addon_Logan_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other,self, " DIA_Addon_Logan_Lager_15_00 " );	// What's in the camp?
	AI_Output(self,other, " DIA_Addon_Logan_Lager_10_01 " );	// (grouchily) The question is what is NOT in the camp. There are no swamp sharks, there are no swamp hummocks ... There is NO swamp at all.
	AI_Output(self,other, " DIA_Addon_Logan_Lager_10_02 " );	// But there is booze and gold. And as far as I know, there is even a woman there. Understood?
};


instances of DIA_Addon_Logan_MIS (C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 99;
	condition = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent = FALSE;
	description = " Let's deal with the swamp eaters. " ;
};


func int DIA_Addon_Logan_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other,self, " DIA_Addon_Logan_MIS_15_00 " );	// Let's deal with the swamp eaters.
	AI_Output(self,other, " DIA_Addon_Logan_MIS_10_01 " );	// You finally figured out how to behave here. Nice to hear. Shh... do you hear? Yes, I hear them.
	AI_Output(other,self, " DIA_Addon_Logan_MIS_15_02 " );	// I see, so what do we do now?
	AI_Output(self,other, " DIA_Addon_Logan_MIS_10_03 " );	// They're coming! They want to eat human flesh. Well, well, we'll see who eats whom... Let's go!
	Snd_Play("SWA_WARN01");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	MIS_HlpLogan = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	Wld_InsertNpc(MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
};


instances of DIA_Addon_Logan_tot (C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_tot_Condition()
{
	if(Npc_IsDead(MIS_Addon_Swampshark_01) && Npc_IsDead(MIS_Addon_Swampshark_02) && Npc_IsDead(MIS_Addon_Swampshark_03) && Npc_KnowsInfo(other,DIA_Addon_Logan_MIS))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self,other, " DIA_Addon_Logan_tot_10_00 " );	// A good swamp eater is a dead swamp eater. This will be a warning to her brethren!
	AI_Output(other,self, " DIA_Addon_Logan_tot_15_01 " );	// Great, is there anything else I need to do? If not, I'll go...
	AI_Output(self,other, " DIA_Addon_Logan_tot_10_02 " );	// Go. And if you want to learn anything else, you know where to find me.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	MIS_HlpLogan = LOG_SUCCESS;
	self.aivar[ 93 ] = FALSE ;
	B_LogEntry(Topic_Addon_Franco, " I helped Logan. Let's see what Franco has to say about that. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instances of DIA_Addon_Logan_Lern (C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 100;
	condition = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent = FALSE;
	description = " Show me how to butcher animal carcasses... " ;
};


func int DIA_Addon_Logan_Lern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other,self, " DIA_Addon_Logan_Lern_15_00 " );	// Show me how to butcher animal carcasses...
	AI_Output(self,other, " DIA_Addon_Logan_Lern_10_01 " );	// If you want to learn how to butcher blood flies, go to Edgor. He knows literally everything about them.
	AI_Output(self,other, " DIA_Addon_Logan_Lern_10_02 " );	// And if you're interested in swamp sharks and lizards, I can teach you how to skin and remove teeth.
};


instances of DIA_Addon_Logan_Allg (C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent = TRUE;
	description = " I want to learn... " ;
};


func int DIA_Addon_Logan_Allg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
	Info_AddChoice(DIA_Addon_Logan_Allg,Dialog_Back,DIA_Addon_Logan_Allg_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_Logan_Allg_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Addon_Logan_Allg_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Addon_Logan_Allg_Fur);
	};
};

func void DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur);
};


var int Logan_Lohn;

instance DIA_Addon_Logan_Hacker(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Addon_Logan_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_BDT_10004_Logan_Hacker_10_01 " );	// Hey, thank you, I did it! I'm in the mine!
	AI_Output(self,other, " DIA_Addon_BDT_10004_Logan_Hacker_10_02 " );	// I don't know much about how to mine gold yet, but it will come.
	if(Logan_Lohn == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_BDT_10004_Logan_Hacker_10_03 " );	// I learned the most important thing. Stand on the ground firmly and always hit hard!
		Logan_Lohn = TRUE;
	};
};
