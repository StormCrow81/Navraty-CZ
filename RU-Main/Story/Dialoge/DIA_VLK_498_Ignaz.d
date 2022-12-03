

instance DIA_Ignaz_EXIT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 999;
	condition = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_NO_TALK(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 1;
	condition = dia_ignaz_no_talk_condition;
	information = dia_ignaz_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ignaz_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_PICKPOCKET(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 900;
	condition = DIA_Ignaz_PICKPOCKET_Condition;
	information = DIA_Ignaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ignaz_PICKPOCKET_Condition()
{
	return  C_Robbery ( 38 , 50 );
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,Dialog_Back,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};


instance DIA_Ignaz_Hello (C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ignaz_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self,other, " DIA_Ignaz_Hallo_14_00 " );	// Ah - you looked just in time. I need an assistant for a magical experiment.
	AI_Output(self,other, " DIA_Ignaz_Hallo_14_01 " );	// I'm sure you're eager to do me a favor in the name of science.
	AI_Output(other,self, " DIA_Ignaz_Hallo_15_02 " );	// Take it easy, my friend. First tell me what it is.
	AI_Output(self,other, " DIA_Ignaz_Hallo_14_03 " );	// I developed a new spell! Oblivion Spell.
	AI_Output(self,other, " DIA_Ignaz_Hallo_14_04 " );	// I already figured out how to use it, but I don't have time to do one last test.
};


instance DIA_Ignaz_Strength (C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent = FALSE;
	description = " And what do I get for helping you? " ;
};


func int DIA_Ignaz_Strength_Condition()
{
	if(MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other,self, " DIA_Ignaz_Traenke_15_00 " );	// And what do I get for helping you?
	AI_Output(self,other, " DIA_Ignaz_Traenke_14_01 " );	// I could teach you the art of potion making.
	AI_Output(self,other, " DIA_Ignaz_Traenke_14_02 " );	// I know the recipes for Healing Essence, Mana Essence, and Haste Potion.
};


instance DIA_Ignaz_Experiment(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 4;
	condition = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent = FALSE;
	description = " Tell me more about this experiment and the spell itself. " ;
};


func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other,self, " DIA_Ignaz_Experiment_15_00 " );	// Tell me more about this experiment and the spell itself.
	AI_Output(self,other, " DIA_Ignaz_Experiment_14_01 " );	// This spell allows you to make someone forget some events.
	AI_Output(self,other, " DIA_Ignaz_Experiment_14_02 " );	// So far, I've only found out that it works when the target of this spell is enraged - for example, if they've just been knocked down or robbed.
	AI_Output(self,other, " DIA_Ignaz_Experiment_14_03 " );	// And even though this trouble just happened to him, he will forget everything.
	AI_Output(other,self, " DIA_Ignaz_Experiment_15_04 " );	// So I'm supposed to knock someone down and cast this spell on them?
	AI_Output(other,self, " DIA_Ignaz_Add_15_01 " );	// (to himself) Here in the waterfront, people are used to fighting. I'd better look for a victim somewhere else...
	AI_Output(self,other, " DIA_Ignaz_Experiment_14_05 " );	// Yes, you understand everything correctly. But to anger someone, just attacking is enough - there is no need to knock him down at all.
	AI_Output(self,other, " DIA_Ignaz_Experiment_14_06 " );	// Only you must do all this without witnesses - if there are other people nearby, you will definitely have problems with Lord Andre.
	AI_Output(self,other, " DIA_Ignaz_Experiment_14_07 " );	// It also doesn't make sense to cast this spell on someone who attacks you. Wait for the right moment.
};


instance DIA_Ignaz_participate (C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 5;
	condition = DIA_Ignaz_participate_Condition;
	information = DIA_Ignaz_participate_Info;
	permanent = FALSE;
	description = " Okay, I'll test this spell. " ;
};


func int DIA_Ignaz_participate_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_participate_Info()
{
	AI_Output(other,self, " DIA_Ignaz_teilnehmen_15_00 " );	// Okay, I'll test this spell.
	AI_Output(self,other, " DIA_Ignaz_teilnehmen_14_01 " );	// Then take this scroll and find a suitable guinea pig.
	AI_Output(self,other, " DIA_Ignaz_teilnehmen_14_02 " );	// And when you're done, come back and tell me how it went.
	B_GiveInvItems(self,other,ItSc_Charm,1);
	MIS_Ignaz_Charm = LOG_Running;
	Log_CreateTopic(TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Running);
	B_LogEntry(TOPIC_Ignaz, " I have to try out Ignaz's new spell. This spell is called Oblivion. Sometimes someone loses their temper due to a fight or other reason and doesn't want to talk to me anymore. This is the perfect time to use this spell. " );
	B_LogEntry(TOPIC_Ignaz, " This is the perfect opportunity to test the spell. The subject will also forget to report what happened to the authorities. I don't think anyone in the waterfront would be too offended if I knocked him out. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_Running(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent = FALSE;
	description = " About the experiment... " ;
};


func int DIA_Ignaz_Running_Condition()
{
	if((MIS_Ignaz_Charm == LOG_Running) && (Charm_Test == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other,self, " DIA_Ignaz_Running_15_00 " );	// About the experiment...
	AI_Output(self,other, " DIA_Ignaz_Running_14_01 " );	// You did it, didn't you? Or have you just wasted my scroll?
	AI_Output(self,other, " DIA_Ignaz_Running_14_02 " );	// If you need more scrolls with this spell, you can buy them from me.
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_After (C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_After_Condition;
	information = DIA_Ignaz_After_Info;
	permanent = FALSE;
	description = " I used a scroll. " ;
};


func int DIA_Ignaz_After_Condition()
{
	if((Charm_Test == TRUE) && (MIS_Ignaz_Charm == LOG_Running) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_After_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Ignaz_Danach_15_00 " );	// I used a scroll.
	AI_Output(self,other, " DIA_Ignaz_Danach_14_01 " );	// Great, great. Did everything work out for you?
	AI_Output(other,self, " DIA_Ignaz_Danach_15_02 " );	// Yes, the spell worked.
	AI_Output(self,other, " DIA_Ignaz_Danach_14_03 " );	// Excellent. It may not be a very big achievement from the point of view of science, but it means a lot to me!
	AI_Output(self,other, " DIA_Ignaz_Danach_14_04 " );	// Now I can spare you some time and teach you the art of alchemy.
	AI_Output(self,other, " DIA_Ignaz_Danach_14_05 " );	// I can also sell you something useful if you want it.
	MIS_Ignaz_Charm = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Success);
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTeacher, " Ignaz can show me potion recipes. He lives in the waterfront. " );
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Trade (C_Info) .
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Ignaz_Trade_Condition()
{
	if (Wld_IsTime( 5 , 0 , 23 , 0 ) && ((MIS_Ignaz_Charm ==  LOG_SUCCESS ) || Npc_KnowsInfo(other,DIA_Ignaz_Running)));
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Ignaz_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Ignaz_Teach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent = TRUE;
	description = " Teach me the art of alchemy. " ;
};


var int DIA_Ignaz_Teach_permanent;

func int DIA_Ignaz_Teach_Condition()
{
	if ((DIA_Ignaz_Teach_permanent ==  FALSE ) && (Ignaz_TeachAlchemy ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talent;
	talents = 0 ;
	AI_Output(other,self, " DIA_Ignaz_Teach_15_00 " );	// Teach me the art of alchemy.
	Info_ClearChoices(DIA_Ignaz_Teach);
	Info_AddChoice(DIA_Ignaz_Teach,Dialog_Back,DIA_Ignaz_Teach_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talents = talents +  1 ;
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy( " Double Boost Drink " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_SPEED_02 )),dia_ignaz_teach_speed_02);
		talents = talents +  1 ;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talents = talents +  1 ;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ignaz_Teach_Health);
		talents = talents +  1 ;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE) && (PLAYER_TALENT_ALCHEMY[15] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		AI_Output(self,other, " DIA_Ignaz_Teach_14_05 " );	// You already know everything I could teach you.
		DIA_Ignaz_Teach_permanent = TRUE;
	}
	else  if (talent >  0 )
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other, " DIA_Ignaz_Teach_14_01 " );	// To make a potion on the alchemy table, you will need a laboratory test tube.
			AI_Output(self,other, " DIA_Ignaz_Teach_14_02 " );	// You will also need various plants and other ingredients.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Ignaz_Teach_14_04 " );	// What do you want to know?
		};
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void dia_ignaz_teach_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};


instance DIA_IGNAZ_RECEPTFORTYON(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = dia_ignaz_receptfortyon_condition;
	information = dia_ignaz_receptfortyon_info;
	permanent = FALSE;
	description = " One more thing... " ;
};


func int dia_ignaz_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_ignaz_receptfortyon_info()
{
	AI_Output(other,self, " DIA_Ignaz_ReceptForTyon_01_00 " );	// One more question...
	AI_Output(self,other, " DIA_Ignaz_ReceptForTyon_01_01 " );	// What do you need?
	AI_Output(other,self, " DIA_Ignaz_ReceptForTyon_01_02 " );	// Have you heard of any potion that can affect a person's mind?
	AI_Output(self,other, " DIA_Ignaz_ReceptForTyon_01_03 " );	// What? (surprised) Never heard of anything like that.
	AI_Output(self,other, " DIA_Ignaz_ReceptForTyon_01_05 " );	// Talk to other alchemists. Maybe someone knows more than me.
};


instance DIA_IGNAZ_PLANTFROMTALIASAN ( C_Info ) ;
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = dia_ignaz_plantsfromtaliasan_condition;
	information = dia_ignaz_plantsfromreview_info;
	permanent = FALSE;
	description = " I think you're upset about something? " ;
};


func int dia_ignaz_plantsfromcheck_condition()
{
	if (( MIS_FERNANDOHELP  == LOG_Running ) && Npc_KnowsInfo ( hero , search_needbook ))
	{
		return TRUE;
	};
};

func void dia_ignaz_plantsfromtaliasan_info()
{
	AI_Output(other,self, " DIA_Ignaz_PlantsFromTaliasan_01_00 " );	// I think you're upset about something?
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_01_03 " );	// Gallahad was supposed to bring me a new batch of herbs for my experiments.
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_01_04 " );	// But he still hasn't done it... Apparently, as always, he forgot about our agreement.
	AI_Output(other,self, " DIA_Ignaz_PlantsFromTaliasan_01_07 " );	// Why don't you pick up the herbs you need yourself?
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_01_08 " );	// I would go if I had free time. But it's all about experimentation.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan, " I can visit him instead of you. " ,dia_ignaz_plantsfromtaliasan_go);
};

func void dia_ignaz_plantsfromtaliasan_go()
{
	AI_Output(other,self, " DIA_Ignaz_PlantsFromTaliasan_Go_01_00 " );	// I can go to him instead of you.
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_Go_01_01 " );	// True? It would be great!
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_Go_01_02 " );	// I'll even pay you for your help.
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_Go_01_04 " );	// How about a hundred gold coins?
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan, " Слишком мало. " ,dia_ignaz_plantsfromtaliasan_no);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan, " Yes! " ,dia_ignaz_plantsfromtaliasan_yes);
};

func void dia_ignaz_plantsfromtaliasan_no()
{
	AI_Output(other,self, " DIA_Ignaz_PlantsFromTaliasan_No_01_00 " );	// Too few. I won't waste time on such trifles.
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_No_01_01 " );	// Sorry, but I can't give more.
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_No_01_02 " );	// Okay! I'll look for someone else.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	AI_StopProcessInfos(self);
};

func void dia_ignaz_plantsfromtaliasan_yes()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_00");	//По рукам!
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_Yes_01_01 " );	// Great! Here, take this wallet. There are exactly one hundred coins.
	B_GiveInvItems(self,other,ItSe_GoldPocket100_Ignaz,1);
	AI_Output(self,other, " DIA_Ignaz_PlantsFromTaliasan_Yes_01_02 " );	// Now go to Gallahad and remind him that he must bring me the herbs.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Log_CreateTopic(TOPIC_IGNAZHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZHELP,LOG_Running);
	B_LogEntry( TOPIC_IGNAZHELP , " Ignaz asked me to go to Gallahad and remind him that he should bring Ignaz a new batch of herbs for his experiments. " );
	MIS_IGNAZHELP = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_TEACH_FIREARROWS(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 100;
	condition = dia_ignaz_teach_firearrows_condition;
	information = dia_ignaz_teach_firearrows_info;
	permanent = TRUE;
	description = " Teach me how to make fire arrows. (Training Points: 5, Gold: 1500) " ;
};


func int dia_ignaz_teach_firearrows_condition()
{
	if((MIS_WolfAndMan == LOG_Success) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEFIREARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_firearrows_info()
{
	var int cost;
	var int money;
	AI_Output(other,self, " DIA_Ignaz_Teach_FireArrows_15_00 " );	// Teach me how to make fire arrows.
	cost = 5 ;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Ignaz_Teach_FireArrows_03_90 " );	// You don't have enough gold for this! Come back later.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Learned crafting recipe - 'Fire Arrows' " );
		KNOWHOWTOMAKEFIREARROWS = TRUE;
		Snd_Play("LevelUP");
		; _ _ _ _ _ _
	};
};


instance DIA_IGNAZ_TEACH_MAGICARROWS(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 101;
	condition = dia_ignaz_teach_magicarrows_condition;
	information = dia_ignaz_teach_magicarrows_info;
	permanent = TRUE;
	description = " Teach me how to make magic arrows. (Training Points: 5, Gold: 1500) " ;
};

func int dia_ignaz_teach_magicarrows_condition()
{
	if((KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_magicarrows_info()
{
	var int cost;
	var int money;
	AI_Output(other,self, " DIA_Ignaz_Teach_MagicArrows_15_00 " );	// Teach me how to make magic arrows.
	cost = 5 ;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Ignaz_Teach_MagicArrows_03_90 " );	// You don't have enough gold for this! Come back later.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Learned crafting recipe - 'Magic arrows' " );
		KNOWHOWTOMAKEMAGICARROWS = TRUE;
		Snd_Play("LevelUP");
		) ; _ _ _ _ _
	};
};

instance DIA_IGNAZ_TEACH_MAGICBOLT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 102;
	condition = dia_ignaz_teach_magicbolt_condition;
	information = dia_ignaz_teach_magicbolt_info;
	permanent = TRUE;
	description = " Teach me how to make magic bolts. (Training Points: 5, Gold: 1500) " ;
};


func int dia_ignaz_teach_magicbolt_condition()
{
	if((KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICBOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_magicbolt_info()
{
	var int cost;
	var int money;
	AI_Output(other,self, " DIA_Ignaz_Teach_MagicBolt_15_00 " );	// Teach me how to make magic bolts.
	cost = 5 ;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Ignaz_Teach_MagicBolt_03_90 " );	// You don't have enough gold for this! Come back later.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Learned crafting recipe - 'Magic bolts' " );
		KNOWHOWTOMAKEMAGICBOLT = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry( TOPIC_TALENTMAKEARROWS , " Now I can make magic bolts. To do this, I need to have: a bolt shaft, a steel tip and ice quartz. One ice quartz is consumed for every five magic bolts. " );
	};
};

instance DIA_Ignaz_LOKIPOTION(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_LOKIPOTION_Condition;
	information = DIA_Ignaz_LOKIPOTION_Info;
	description = " Are you good with plants? " ;
};

func int DIA_Ignaz_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_LOKIPOTION_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Ignaz_LOKIPOTION_01_00 " );	// Are you good with plants?
	AI_Output(self,other, " DIA_Ignaz_LOKIPOTION_01_01 " );	// Well, I will not say that in all, but I have certain knowledge in this area.
	AI_Output(self,other, " DIA_Ignaz_LOKIPOTION_01_02 " );	// Why are you interested?
	AI_Output(other,self, " DIA_Ignaz_LOKIPOTION_01_03 " );	// I'm looking for one rare plant - a cactus flower.
	AI_Output(other,self, " DIA_Ignaz_LOKIPOTION_01_04 " );	// Maybe you know where you can get it?
	AI_Output(self,other, " DIA_Ignaz_LOKIPOTION_01_05 " );	// I'm afraid I can't help you, because I haven't even heard of this plant before.
	AI_Output(self,other, " DIA_Ignaz_LOKIPOTION_01_06 " );	// Try asking other alchemists about this, maybe someone knows about it.
};

instance DIA_Ignaz_Werewolf(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Werewolf_Condition;
	information = DIA_Ignaz_Werewolf_Info;
	permanent = FALSE;
	description = " Do you have another job for me? " ;
};

func int DIA_Ignaz_Werewolf_Condition()
{
	if(MIS_Ignaz_Charm == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Werewolf_Info()
{
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_00 " );	// Do you have another job for me?
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_01 " );	// Maybe... (thoughtfully) She's pretty dangerous, though.
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_02 " );	// Spread what needs to be done?
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_03 " );	// In addition to alchemy, I'm interested in the subject of transformation in various animals.
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_04 " );	// What do you mean?
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_05 " );	// Speaking of this, I mean special magic scrolls that turn a person into a scavenger, a wolf and other animals.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_06 " );	// The effect of these spells is completely harmless to humans and wears off over time.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_07 " );	// (pause) At least I thought so until recently.
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_08 " );	// What happened?
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_09 " );	// Some terrible misunderstanding happened during my last experiment.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_10 " );	// Maybe I made a mistake in the formula. Or for some other reason.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_11 " );	// My assistant, after using the Scroll of Transformation into Mrakoris, was unable to return to his human form.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_12 " );	// Moreover, it seemed to me that the bestial instincts completely absorbed his mind!
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_13 " );	// He attacked me... (nervously) But, thank Innos, we were conducting an experiment not far from the city gates.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_14 " );	// I managed to escape! And my assistant ran away somewhere into the forest.
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_15 " );	// Yeah! Your experiments are interesting.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_16 " );	// You see, this has never happened before... (sighing) But it's not the saddest thing!
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_17 " );	// I recently found out that some people were attacked by some scary monster.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_18 " );	// Looks like he even killed one of them! Now I don't know what to think about this.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_19 " );	// In any case, I must somehow correct my mistake.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_20 " );	// That means you'll have to find my assistant and kill him!
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_21 " );	// And you don't feel sorry for him at all?
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_22 " );	// All of this makes me feel stoned... But I don't see any other way to fix the situation.
	AI_Output(other,self, " DIA_Ignaz_Werewolf_01_23 " );	// Okay, I'll take care of it. Where did the attack take place?
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_24 " );	// (thoughtfully) It seems to be somewhere near the eastern city gates.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_01_25 " );	// Try asking the guard about this.
	MIS_WolfAndMan = LOG_Running;
	Log_CreateTopic(TOPIC_WolfAndMan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WolfAndMan,LOG_Running);
	B_LogEntry(TOPIC_WolfAndMan, " Ignaz told me about a failed experiment, during which his assistant irrevocably turned into a huge and terrible beast. Apparently, he had already killed someone! Therefore, Ignaz asked me to find him and kill him. According to him, the attack took place somewhere near the eastern gate of Khorinis. I'd better ask the guards about this. " );
};


instance DIA_Ignaz_Werewolf_Done(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 1;
	condition = DIA_Ignaz_Werewolf_Done_Condition;
	information = DIA_Ignaz_Werewolf_Done_Info;
	permanent = FALSE;
	description = " Your assistant is fine. " ;
};

func int DIA_Ignaz_Werewolf_Done_Condition()
{
	if ((MIS_WolfAndMan == LOG_Running) && (WereWolfIsHuman ==  TRUE ) && (Npc_KnowsInfo(hero, DIA_Sagitta_Werewolf_Safe_Done) ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Werewolf_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Ignaz_Werewolf_Done_01_00 " );	// Your helper is fine.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_01");	//Правда?
	AI_Output(other,self, " DIA_Ignaz_Werewolf_Done_01_02 " );	// Yes, and now he lives with Sagitta, the forest witch.
	AI_Output(other,self, " DIA_Ignaz_Werewolf_Done_01_03 " );	// He even got his human memory back.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_Done_01_04 " );	// I know her. She is a kind woman! I think he will be fine with her.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_Done_01_05 " );	// Thanks for helping me with this.
	AI_Output(self,other, " DIA_Ignaz_Werewolf_Done_01_06 " );	// Here, take this magic scroll as your reward.
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	AI_Output(self,other, " DIA_Ignaz_Werewolf_Done_01_07 " );	// It's pretty rare, and right now it's the most valuable thing I own.
	MIS_WolfAndMan = LOG_Success;
	Log_SetTopicStatus(TOPIC_WolfAndMan,LOG_Success);
	B_LogEntry(TOPIC_WolfAndMan, " Ignaz was glad to hear that his assistant was living with Sagitta, albeit in the form of an obscurant. " );
};
