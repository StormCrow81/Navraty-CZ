var int SagittaMakeOnce;

instance DIA_Arrow_EXIT (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 999;
	condition = DIA_Arrow_EXIT_Condition;
	information = DIA_Arrow_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Arrow_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Arrow_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SPEAKS_NO_TALK (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 1;
	condition = dia_arrow_no_talk_condition;
	information = dia_sagitta_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int slide_arrow_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sagitta_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HALLO (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 4;
	condition = DIA_Sagitta_HALLO_Condition;
	information = DIA_Sagitta_HELLO_Info;
	description = " Are you all alone here? " ;
};


func int DIA_Sagitta_HALLOW_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other,self, " DIA_Sagitta_HALLO_15_00 " );	// Are you all alone here?
	AI_Output(self,other, " DIA_Sagitta_HALLO_17_01 " );	// What do you want? I'm busy.
	Info_ClearChoices(DIA_Arrow_HELLO);
	Info_AddChoice(DIA_ARROW_HELLO,Dialog_Back,DIA_ARROW_HELLO_end);
	Info_AddChoice(DIA_Sagitta_HALLO, " Can you heal me? " ,DIA_Sagitta_HALLO_Heil);
	Info_AddChoice(DIA_Sagitta_HALLO, " What are you doing here? " ,DIA_Sagitta_HALLO_was);
	Info_AddChoice(DIA_Sagitta_HELLO, " Who are you ? " ,DIA_Sagitta_HELLO_wer);
};

func void DIA_Sagitta_HELLO_who()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Who are you?
	AI_Output(self,other, " DIA_Sagitta_HALLO_wer_17_01 " );	// Have you never heard of me?
	AI_Output(self,other, " DIA_Sagitta_HALLO_wer_17_02 " );	// They call me a witch, a shaman, a forest hag...
	AI_Output(self,other, " DIA_Sagitta_HALLO_wer_17_03 " );	// But when they feel sick, they all suddenly remember good old Sagitta and her healing herbs.
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other,self, " DIA_Sagitta_HALLO_was_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Sagitta_HALLO_was_17_01 " );	// I've been living here for as long as I can remember! I am an herbalist.
	AI_Output(self,other, " DIA_Sagitta_HALLO_was_17_02 " );	// The forest is my friend. She cares for me and I for her.
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other,self, " DIA_Sagitta_HALLO_Heil_15_00 " );	// Can you heal me?
	AI_Output(self,other, " DIA_Sagitta_HALLO_Heil_17_01 " );	// Is that why you are here? Tell me how I can help.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader, " Sagitta, who lives behind Sekob's farm, sells various items. " );
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Arrow_HELLO);
};


instance DIA_Sagitta_TeachAlchemyRequest ( C_Info ) ;
{
	npc = BAU_980_Arrow;
	nr = 6;
	condition = DIA_Sagitta_TeachAlchemyRequest_Condition;
	information = DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent = TRUE;
	description = " Can you teach me how to make potions? " ;
};


func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Sage_HELLO ) && ( MY_Sage_Herb ==  FALSE ))
	{
		return TRUE;
	};
};


var int DIA_Sagitta_TeachAlchemyRequest_OneTime;

function void DIA_Sagitta_TeachAlchemyRequest_Info ()
{
	AI_Output(other,self, " DIA_Sagitta_TeachAlchemyRequest_15_00 " );	// Can you teach me how to make potions?
	if (DIA_Sagitta_TeachAlchemyRequest_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_17_01 " );	// How interesting. I don't get asked that very often.
		AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_17_02 " );	// So you want to be my student? Then you first need to prove that your intentions are serious.
		AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_17_03 " );	// I'm currently working on a very rare potion that is made from very specific herbs and plants.
		AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_17_04 " );	// If you bring me one ingredient - a very rare plant that I don't have - I'll teach you.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_17_05 " );	// I already told you yes, after you bring me that rare ingredient I asked for.
	};
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, " Sorry, but I'm not interested. " ,DIA_Sagitta_TeachAlchemyRequest_nein);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, " What is this ingredient? " ,DIA_Sagitta_TeachAlchemyRequest_wo);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, " Where can I find this ingredient? " ,DIA_Sagitta_TeachAlchemyRequest_was);
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other,self, " DIA_Sagitta_TeachAlchemyRequest_was_15_00 " );	// What is this ingredient?
	AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_was_17_01 " );	// A very rare herb called sun aloe. You will recognize it by its strong almond aroma.
};

func void DIA_Sagitta_TeachAlchemyRequest_you()
{
	AI_Output(other,self, " DIA_Sagitta_TeachAlchemyRequest_wo_15_00 " );	// Where can I find this ingredient?
	AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_wo_17_01 " );	// This plant only grows where it finds very specific nutrients.
	AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_wo_17_02 " );	// For instance, black troll dung.
	AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_wo_17_03 " );	// That's why it's so hard for me to get this herb, as I'm sure you can imagine.
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, " Let's see if I can find it somewhere. " ,DIA_Sagitta_TeachAlchemyRequest_wo_ja);
};

func void DIA_Sagitta_TeachAlchemyRequest_generated()
{
	AI_Output(other,self, " DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00 " );	// Let's see if I can find it somewhere.
	AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01 " );	// Good luck on your quest.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb,LOG_Running);
	B_LogEntry(TOPIC_SagittaHerb, " Sagitta needs a very rare plant! It's a Sun Aloe that only grows on black troll dung. " );
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other,self, " DIA_Sagitta_TeachAlchemyRequest_nein_15_00 " );	// Sorry, but I'm not interested.
	AI_Output(self,other, " DIA_Sagitta_TeachAlchemyRequest_nein_17_01 " );	// Then stop wasting my time on nonsense.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};


instance DIA_Sagitta_Sagitta_Herb (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Arrow_Arrow_Herb_Condition;
	information = DIA_Sagitta_Sagitta_Herb_Info;
	description = " I found a sunny aloe. " ;
};


func int DIA_Arrow_Arrow_Herb_Condition()
{
	if ( Npc_HasItems ( other , ItPl_Xagitta_Herb_MIS ) && ( MIS_Sagitta_Herb == LOG_Running ) && Npc_KnowsInfo ( other , DIA_Sagitta_HALLO ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other,self, " DIA_Sagitta_Sagitta_Herb_15_00 " );	// I found a Sun Aloe.
	AI_Output(self,other, " DIA_Sagitta_Sagitta_Herb_17_01 " );	// Wonderful! Now we can make a potions master out of you.
	B_GiveInvItems(other,self,ItPl_Xagitta_Herb_MIS,1);
	Npc_RemoveInvItems(self,ItPl_Xagitta_Herb_MIS,1);
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS ;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
};


instance DIA_Continued_Teach ( C_Info ) .
{
	npc = BAU_980_Arrow;
	nr = 2;
	condition = DIA_Sagitta_Teach_Condition;
	information = DIA_Set_Teach_Info;
	permanent = TRUE;
	description = " What potions can you teach me to brew? " ;
};


var int DIA_Arrow_Teach_permanent;

func int DIA_Sagitta_Teach_Condition()
{
	if ((DIA_Sagitta_Teach_permanent ==  FALSE ) && (Sagitta_TeachAlchemy ==  TRUE ) && Npc_KnowsInfo(other,DIA_Sagitta_HELLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talent;
	talents = 0 ;
	AI_Output(other,self, " DIA_Sagitta_Teach_15_00 " );	// What potions can you teach me to brew?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Continued_Teach);
		Info_AddChoice(DIA_Sagitta_Teach,Dialog_Back,DIA_Sagitta_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Magic Chemistry " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talents = talents +  1 ;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Material Cost " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talents = talents +  1 ;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Magic " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talents = talents +  1 ;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Magic " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talents = talents +  1 ;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Mana " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talents = talents +  1 ;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Magic Chemistry " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talents = talents +  1 ;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Learn CostTalent " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY ,POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talents = talents +  1 ;
	};
	if(PLAYER_TALENT_ALCHEMY[17] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Learn CostTalent " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_STAMINA )),dia_sagitta_teach_stamina);
		talents = talents +  1 ;
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy( " Learn CostTalent " ,B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY , POTION_PERM_STAMINA )),dia_sagitta_teach_perm_stamina);
		talents = talents +  1 ;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other, " DIA_Sagitta_Teach_17_01 " );	// Before I start teaching you about alchemy, I'll first tell you what you need to have to make potions.
			AI_Output(self,other, " DIA_Sagitta_Teach_17_02 " );	// All potions are prepared on the alchemy table. You'll also need an empty beaker to store your prepared potion.
			AI_Output(self,other, " DIA_Sagitta_Teach_17_03 " );	// You need to mix the necessary ingredients and that's it - the potion is ready.
			AI_Output(self,other, " DIA_Sagitta_Teach_17_04 " );	// Well, you can always ask me for more details if you want.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Sagitta_Teach_17_05 " );	// So which potion are you interested in?
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_Teach_17_06 " );	// You already know everything I could teach you.
		DIA_Sagitta_Teach_permanent = TRUE ;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void DIA_Sagitta_Teach_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void dia_arrow_teach_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_STAMINA);
	Info_ClearChoices(DIA_Continued_Teach);
};

func void dia_arrow_teach_perm_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA);
	Info_ClearChoices(DIA_Continued_Teach);
};


instance DIA_SAGITTA_ALOE (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 2;
	condition = dia_sagitta_aloe_condition;
	information = dia_sagitta_aloe_info;
	permanent = FALSE;
	description = " What is this sun aloe drink? " ;
};


func int dia_arrow_aloe_condition()
{
	if ( Sagitta_TeachAlchemy ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_sagitta_aloe_info()
{
	AI_Output(other,self, " DIA_Sagitta_Aloe_15_00 " );	// And what is this solar aloe drink that you are going to make?
	AI_Output(self,other, " DIA_Sagitta_Aloe_17_01 " );	// Oh, this is a very special drink. It makes your hide as tough as a troll's.
	AI_Output(self,other, " DIA_Sagitta_Aloe_17_02 " );	// But I won't tell you the recipe.
	AI_Output(other,self, " DIA_Sagitta_Aloe_15_03 " );	// Can you cook it for me?
	AI_Output(self,other, " DIA_Sagitta_Aloe_17_04 " );	// From this plant? I am afraid no. I've already prepared a drink from it.
	AI_Output(self,other, " DIA_Sagitta_Aloe_17_05 " );	// If you find this plant anywhere else, then bring it and I'll make you some.
	AI_Output(self,other, " DIA_Sagitta_Aloe_17_06 " );	// Not for free, obviously.
	AI_Output(other, self, " DIA_Sagitta_Aloe_15_07 " );	// Obviously...
};


instance DIA_SIGHT_ALOEREADY ( C_Info ) .
{
	npc = BAU_980_Arrow;
	nr = 2;
	condition = dia_sagitta_aloeready_condition;
	information = dia_sagitta_aloeready_info;
	permanent = TRUE;
	description = " I have another Sun Aloe with me! " ;
};

func int dia_arrow_aloeready_condition()
{
	if ((Sagitta_TeachAlchemy ==  TRUE ) && Npc_KnowsInfo(other,dia_sagitta_aloe) && (Npc_HasItems(other,ItPl_Xagitta_Herb_MIS) >=  1 ) && ( SAGITTAONWORK  ==  FALSE ) && (SagittaMakeOnce ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_horizontal_aloneready_info()
{
	AI_Output(other,self, " DIA_Sagitta_AloeReady_01_00 " );	// I have another Sun Aloe with me!
	if ( SECONDALOE_SETTING  ==  FALSE )
	{
		AI_Output(self,other, " DIA_Sagitta_AloeReady_01_01 " );	// Amazing! How did you manage to get it?
		AI_Output(other,self, " DIA_Sagitta_AloeReady_01_02 " );	// Had to work a little.
		AI_Output(self,other, " DIA_Sagitta_AloeReady_01_03 " );	// Well, okay. Then only a thousand gold coins - and a drink from it will be yours.
		AI_Output(self,other, " DIA_Sagitta_AloeReady_01_04 " );	// What do you say?
		SAGITTA_SECONDAALOE = TRUE ;
		B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_AloeReady_01_05 " );	// Good. If you have money, then I will prepare another such drink for you.
	};
	Info_ClearChoices(dia_sagitta_aloneready);
	Info_AddChoice(dia_sagitta_aloeready, " Neither this nor anyone. " ,dia_sagitta_aloeready_no);
	Info_AddChoice(dia_sagitta_aloeready, " Daughter, please! " ,dia_sagitta_aloeready_ok);
};

func void dia_sagitta_aloneready_no()
{
	AI_Output(other,self, " DIA_Sagitta_AloeReady_No_01_01 " );	// Sorry, but I can't afford that kind of luxury right now.
	AI_Output(self,other, " DIA_Sagitta_AloeReady_No_01_02 " );	// Well, that's a pity. Come back when you have the money.
	AI_StopProcessInfos(self);
};

func void dia_sagitta_aloneready_ok()
{
	AI_Output(other, self, " DIA_Sagitta_AloeReady_Ok_01_00 " );	// Brew away, dear lady!

	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other, " DIA_Sagitta_AloeReady_Ok_01_01 " );	// Great. Then come back tomorrow afternoon.
		AI_Output(self,other, " DIA_Sagitta_AloeReady_Ok_01_02 " );	// Your potion will be ready by then.
		B_GiveInvItems(other,self,ItPl_Xagitta_Herb_MIS,1);
		Npc_RemoveInvItems(self,ItPl_Xagitta_Herb_MIS,1);
		SAGITTASECONDALOEDAY = Wld_GetDay();
		SAGITTAONWORK = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_AloeReady_Ok_01_03 " );	// Well? And where is my money?
		AI_Output(other,self, " DIA_Sagitta_AloeReady_Ok_01_04 " );	// I seem to be a little light right now...
		AI_Output(self,other, " DIA_Sagitta_AloeReady_Ok_01_05 " );	// Then why waste my time?
		AI_Output(self,other, " DIA_Sagitta_AloeReady_Ok_01_06 " );	// No coin, no nature defying arcane elixir.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SIGNIFICANCE_ALOEGET (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 2;
	condition = dia_sagitta_aloeget_condition;
	information = slide_horizontal_info;
	permanent = TRUE;
	description = " How's my drink doing? " ;
};

func int dia_arrow_aloeget_condition()
{
	if((SAGITTASECONDALOEDAY > 0) && (SAGITTAONWORK == TRUE))
	{
		return TRUE;
	};
};

func void dia_sagitta_aloneget_info()
{
	where int daynow;

	daynow = Wld_GetDay();
	AI_Output(other,self, " DIA_Sagitta_AloeGet_01_00 " );	// How's my potion coming along?

	if(SAGITTASECONDALOEDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (SAGITTASECONDALOEDAY < (daynow - 1)))
		{
			AI_Output(self,other, " DIA_Sagitta_AloeGet_01_01 " );	// Here, it's ready! You can safely drink it.
			B_GiveInvItems(self,other,itpo_perm_def,1);
			AI_Output(other, self, " DIA_Sagitta_AloeGet_01_02 " );	// Thank you.
			SAGITTASECONDALOEDAY = FALSE;
			SAGITTAONWORK = FALSE;
			SagittaMakeOnce = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Sagitta_AloeGet_01_03 " );	// Has it been a day already?
			AI_Output(other, self, " DIA_Sagitta_AloeGet_01_04 " );	// Ummm...
			AI_Output(self,other, " DIA_Sagitta_AloeGet_01_05 " );	// I suggest you invest in a pocket watch.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_AloeGet_01_06 " );	// I told you to come back tomorrow afternoon!
		AI_StopProcessInfos(self);
	};
};


var int praydaysagg;

instance DIA_Site_HEAL (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 99;
	condition = DIA_Arrow_HEAL_Condition;
	information = DIA_SET_HEAL_Info;
	permanent = TRUE;
	description = " Heal me. " ;
};

func int DIA_Darrow_HEAL_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Say_HELLO ))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other,self, " DIA_Sagitta_HEAL_15_00 " );	// Heal me.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if(PRAYDAYSAGG != Wld_GetDay())
		{
			AI_Output(self,other, " DIA_Sagitta_HEAL_17_01 " );	// Let's see what we have here. It's not so bad. This ointment will heal you.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			PRAYDAYSAGG = Wld_GetDay();
			BONUSCOUNT += 1;
		}
		else if(PRAYDAYSAGG == Wld_GetDay())
		{
			AI_Output(self,other, " DIA_Sagitta_HEAL_17_03 " );	// I already treated you today. My ointment can only be used once a day, or else it may kill you.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_HEAL_17_02 " );	// You don't need healing, silly boy.
	};
};


instance DIA_Sagitta_TRADE (C_Info)
{
	npc = BAU_980_Arrow;
	condition = DIA_Sagitta_TRADE_Condition;
	information = DIA_Sagitta_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " What products can you offer me? " ;
};


func int DIA_Sagitta_TRADE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Say_HELLO ))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Sagitta_TRADE_15_00 " );	// What products can you offer me?

	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(self,other, " DIA_Sagitta_TRADE_17_01 " );	// Take a look.
	B_GiveTradeInv(self);
};


instance DIA_Sagitta_KAP3_EXIT (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 999;
	condition = DIA_Sagitta_KAP3_EXIT_Condition;
	information = DIA_Sagitta_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_OBSESSION (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 30;
	condition = DIA_Sagitta_OBSESSION_Condition;
	information = DIA_Sagitta_OBSESSION_Info;
	description = " I feel inner turmoil. " ;
};


func int DIA_Sagitta_OBSESSION_Condition()
{
	if (( SC_IsObsessed ==  TRUE ) && ( SC_ObsessionTimes <  1 ) && Npc_KnowsInfo ( other , DIA_Sagitta_HELLO ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other,self, " DIA_Sagitta_OBSESSION_15_00 " );	// I feel some kind of strong mental anxiety. I need help.
	AI_Output(self,other, " DIA_Sagitta_OBSESSION_17_01 " );	// You are bewitched. You have fallen under the influence of the black gaze of the Seekers.
	AI_Output(self,other, " DIA_Sagitta_OBSESSION_17_02 " );	// Go to Pyrokar, ArchMage of the monastery. My modest knowledge is not enough here.
};


instance DIA_Current_Transfer (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Sagitta_Thekla_Condition;
	information = DIA_Shift_Info;
	description = " Thekla sent me to you for herbs. " ;
};


func int DIA_Sagitta_Thekla_Condition()
{
	if ((MIS_Submitted_Packet == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Horizontal_Info()
{
	AI_Output(other,self, " DIA_Sagitta_Thekla_15_00 " );	// Thekla sent me to you for herbs.
	AI_Output(self,other, " DIA_Sagitta_Thekla_17_01 " );	// I was expecting you.
	AI_Output(self,other, " DIA_Sagitta_Thekla_17_02 " );	// Here, take the package. And be careful with it!
	B_GivePlayerXP(XP_AmbientKap3);
	B_GiveInvItems(self,other,ItMi_TheklasPackage, 1 );
};


instance DIA_Sagitta_KAP4_EXIT (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 999;
	condition = DIA_Sagitta_KAP4_EXIT_Condition;
	information = DIA_Sagitta_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HEALRANDOLPH (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 30;
	condition = DIA_Sagitta_HEALRANDOLPH_Condition;
	information = DIA_Sagitta_HEALRANDOLPH_Info;
	permanent = TRUE;
	description = " Randolph has a hangover. " ;
};


var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if ((MIS_HealRandolph == LOG_Running) && (Npc_HasItems(other,ItPo_HealRandolph_MIS) ==  0 ) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO));
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other,self, " DIA_Sagitta_HEALRANDOPH_15_00 " );	// Randolph has a hangover.
	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice ==  FALSE )
	{
		AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_17_01 " );	// That bloody alcoholic?!
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE ;
	};
	if (DIA_Sagitta_HEALRANDOLPH_GotOne ==  TRUE )
	{
		AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_17_02 " );	// I've already given him medicine. Why are you here?
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_17_03 " );	// I'll give you some medicine for him. It will get him back on his feet shortly.
	};
	AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_17_04 " );	// But it will cost you three hundred gold.
	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice ==  FALSE )
	{
		AI_Output(other,self, " DIA_Sagitta_HEALRANDOLPH_15_05 " );	// What?
		AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_17_06 " );	// The only thing you can get for free is death, young man.
	};
	Info_ClearChoices(DIA_SAGITTA_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH, " So much gold for such a trifling thing? " ,DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH, " Here, take it. " ,DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other,self, " DIA_Sagitta_HEALRANDOPH_geld_15_00 " );	// Here's your money.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_geld_17_01 " );	// Very good. You can always ask him to compensate you for expenses.
		CreateInvItems(self,ItPo_HealRandolph_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE ;
		B_LogEntry(TOPIC_HealRandolph, " Sagitta gave me a cure for Randolph. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_geld_17_02 " );	// Until you have the full amount, you are wasting my time.
	};
	Info_ClearChoices(DIA_SAGITTA_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other,self, " DIA_Sagitta_HEALRANDOPH_no_15_00 " );	// So much gold for such a trifling thing?
	AI_Output(self,other, " DIA_Sagitta_HEALRANDOPH_no_17_01 " );	// He didn't give you the money? That's just like him!
	Info_ClearChoices(DIA_SAGITTA_HEALRANDOLPH);
};


instance DIA_Sagitta_KAP5_EXIT (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 999;
	condition = DIA_Arrow_KAP5_EXIT_Condition;
	information = DIA_Sagitta_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_KAP6_EXIT (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 999;
	condition = DIA_Sagitta_KAP6_EXIT_Condition;
	information = DIA_Sagitta_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Site_PICKPOCKET (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 900;
	condition = DIA_Sagitta_PICKPOCKET_Condition;
	information = DIA_OUT_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal her key) " ;
};


func int DIA_Darrow_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_SIGHT_PICKPOCKET);
	Info_AddChoice(DIA_OF_PICKPOCKET,DIA_OF_PICKPOCKET_BACK);
	Info_AddChoice(DIA_DARS_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_DARS_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	if(hero.attribute[ATR_DEXTERITY] >= 100)
	{
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_SagittaChest,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_SIGHT_PICKPOCKET);
	}
	else
	{
		Print ( " Required Agility: 100 " );

		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_SIGHT_PICKPOCKET);
};


instance DIA_SAGITTA_RECEPTFORTYON (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 2;
	condition = dia_sagitta_receptfortyon_condition;
	information = dia_sagitta_receptfortyon_info;
	permanent = FALSE;
	description = " I have a question. " ;
};


func int dia_arrow_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_arrow_receptfortyon_info()
{
	AI_Output(other,self, " DIA_Sagitta_ReceptForTyon_01_00 " );	// I have a question.
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_01 " );	// What do you want to know?
	AI_Output(other,self, " DIA_Sagitta_ReceptForTyon_01_02 " );	// I heard that there is a potion that can open a person's mind. Make them... BETTER.
	AI_Output(other,self, " DIA_Sagitta_ReceptForTyon_01_03 " );	// Know anything about this?
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_04 " );	// I'm afraid I can't help you. I can't even imagine what kind of elixir that could be.
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_05 " );	// But I can give you advice.
	AI_Output(other,self, " DIA_Sagitta_ReceptForTyon_01_06 " );	// What's the advice?
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_07 " );	// From what you describe, it's a very, VERY rare thing! One might even say mythical!
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_08 " );	// And all such items, one way or another, tend to be very well guarded and hidden from prying eyes.
	AI_Output(other,self, " DIA_Sagitta_ReceptForTyon_01_09 " );	// Where are you going with this?
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_10 " );	// I'm saying that perhaps you will find the answer to your question where ordinary people cannot go.
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_11 " );	// And if there is such a place, then I would advise you to look for it there. I'm sure the Pyromancers might have knowledge of such places.
	AI_Output(other,self, " DIA_Sagitta_ReceptForTyon_01_12 " );	// Thanks for the tip.
	AI_Output(self,other, " DIA_Sagitta_ReceptForTyon_01_13 " );	// Always happy to help.
};


instance DIA_SIGITTA_CLAW ( C_Info ) .
{
	npc = BAU_980_Arrow;
	nr = 6;
	condition = dia_arrow_claw_condition;
	information = dia_horizontal_claw_info;
	permanent = FALSE;
	description = " Do you know a hunter named Nyx? " ;
};


func int dia_arrow_claw_condition()
{
	if (( MY_RECOVERDOG  == LOG_Running ) && Npc_KnowsInfo ( other , DIA_Sagitta_HELLO ))
	{
		return TRUE;
	};
};

func void dia_sagitta_claw_info()
{
	AI_Output(other,self, " DIA_Sagitta_Claw_01_00 " );	// Do you know a hunter named Nyx?
	AI_Output(self,other, " DIA_Sagitta_Claw_01_01 " );	// Yes, I do. He often comes to me when he hunts in these parts.
	AI_Output(other,self, " DIA_Arrow_Claw_01_02 " );	// Why?
	AI_Output(self,other, " DIA_Sagitta_Claw_01_03 " );	// Usually he is interested in various tinctures prepared by me from medicinal herbs. Why are you asking?
	AI_Output(other,self, " DIA_Sagitta_Claw_01_04 " );	// He had an accident.
	AI_Output(self,other, " DIA_Sagitta_Claw_01_05 " );	// What happened?
	AI_Output(other,self, " DIA_Sagitta_Claw_01_06 " );	// During the last hunt, his wolf, Fang, was badly injured, and is in a very serious condition.
	AI_Output(other,self, " DIA_Sagitta_Claw_01_07 " );	// Nyx tried to help him, but nothing came of it.
	AI_Output(other,self, " DIA_Sagitta_Claw_01_08 " );	// That's why he asked me to ask you for help. Could you heal Fang?
	AI_Output(self,other, " DIA_Sagitta_Claw_01_09 " );	// He should have contacted me right away instead of doing something he doesn't understand much about.
	AI_Output(other,self, " DIA_Sagitta_Claw_01_10 " );	// So will you help?
	AI_Output(self,other, " DIA_Sagitta_Claw_01_11 " );	// Of course! I know how much Nyx values that animal, and I'm ready to help in any way I can.
	AI_Output(self,other, " DIA_Sagitta_Claw_01_12 " );	// However, if you're saying that his wound is very severe... then it would probably require a very strong healing potion.
	AI_Output(self,other, " DIA_Sagitta_Claw_01_13 " );	// And I cannot promise that it will help.
	AI_Output(other,self, " DIA_Sagitta_Claw_01_14 " );	// Can you give me this potion?
	AI_Output(self,other, " DIA_Sagitta_Claw_01_15 " );	// I'm afraid not. But I can make it for you.
	AI_Output(self,other, " DIA_Sagitta_Claw_01_16 " );	// However, for this, I need some rare ingredients.
	AI_Output(other,self, " DIA_Sagitta_Claw_01_17 " );	// Which ones exactly?
	AI_Output(self,other, " DIA_Sagitta_Claw_01_18 " );	// I need a couple of stalks of marsh grass, a medicinal root, a wild berry, and to top it off - royal sorrel.
	AI_Output(self,other, " DIA_Sagitta_Claw_01_19 " );	// Bring me these herbs and I'll brew you a potion for Fang immediately.
	AI_Output(other,self, " DIA_Sagitta_Claw_01_20 " );	// Good. I will try to get you everything you ask for.
	; _ _ _ _ _ _
};


instance DIA_SIGHT_CLAWDONE (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 6;
	condition = dia_arrow_clawdone_condition;
	information = dia_sagitta_clawdone_info;
	permanent = FALSE;
	description = " I got you the herbs. " ;
};


func int dia_arrow_clawdone_condition()
{
	if (( MIS_RECOVERDOG  == LOG_Running ) && ( SAGITTAHELPSCLAW  ==  FALSE ) && Npc_KnowsInfo(other,dia_sagitta_claw) && (Npc_HasItems(other,ItPl_SwampHerb) > =  2 ) && (Npc_HasItems(other,ItPl_Health_Has( ItPl_Herb103 ) && ) other , ItPl_Forestberry ) >= 1 ) && ( Npc_HasItems ( other , ItPl_Perm_Herb ) >= 1 ))   
	{
		return TRUE;
	};
};

func void dia_sagitta_clawdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Sagitta_ClawDone_01_00 " );	// I got you the herbs.
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_01 " );	// Well done! Give them here and I'll brew them into a healing potion for Fang.
	AI_Output(other,self, " DIA_Sagitta_ClawDone_01_02 " );	// Here.
	B_GiveInvItemsManyThings(self,other);
	Npc_RemoveInvItems(other,ItPl_SwampHerb,2);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Forestberry,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_03 " );	// Good! Now wait a minute...
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self, " NW_SAGITTA_CAVE_IN_03 " );
	AI_AlignToWP(self);
	AI_LookAtNpc(other,self);
	AI_UseMob(self,"LAB",1);
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_04 " );	// ...(mumbles something to herself)
	AI_UseMob(self,"LAB",-1);
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_05 " );	// That's it - the potion is ready! Take it.
	B_GiveInvItems(self,other,itpo_sagittaclawpotion,1);
	AI_Output(other,self, " DIA_Sagitta_ClawDone_01_06 " );	// And what's next?
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_07 " );	// Now listen carefully and remember...
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_08 " );	// First you need to thoroughly wash the wound, and then treat it with this potion.
	AI_Output(other,self, " DIA_Sagitta_ClawDone_01_09 " );	// That's all?
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_10 " );	// Yes. But, as I said, you should not rely too much on the fact that this will help.
	AI_Output(other,self, " DIA_Sagitta_ClawDone_01_11 " );	// Everything is clear. Thank you.
	AI_Output(self,other, " DIA_Sagitta_ClawDone_01_12 " );	// You're welcome.
	SAGITTAHELPSCLAW = TRUE;
	B_LogEntry( TOPIC_RECOVERDOG , " Sagitta has prepared a cure for Fang. Now I need to get back to Nyx's hunter camp as soon as possible. " );
};

instance DIA_Sagitta_LOKPOTION (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Sagitta_LOKIPOTION_Condition;
	information = DIA_Sagitta_LOKIPOTION_Info;
	description = " I'm looking for one very rare plant. " ;
};


func int DIA_Arrow_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_LOKPOTION_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sagitta_LOKIPOTION_01_00 " );	// I'm looking for one rare plant - a cactus flower.
	AI_Output(other,self, " DIA_Sagitta_LOKIPOTION_01_01 " );	// Do you know anything about it?
	AI_Output(self,other, " DIA_Sagitta_LOKIPOTION_01_02 " );	// I'm afraid not.
	AI_Output(self,other, " DIA_Sagitta_LOKIPOTION_01_03 " );	// To be honest, I don't even know what this plant is or what it looks like.
	AI_Output(other, self, " DIA_Sagitta_LOKIPOTION_01_04 " );	// I see.
};

instance DIA_SAGITTA_PLACEBO (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 1;
	condition = dia_sagitta_placebo_condition;
	information = dia_sagitta_placebo_info;
	permanent = FALSE;
	description = " Pepe the shepherd is seriously injured. " ;
};

func int dia_arrow_placebo_condition()
{
	if (( MY_MILK_PEPE  == LOG_Running ) && Npc_KnowsInfo ( hero , DIA_Sagitta_HELLO ))
	{
		return TRUE;
	};
};

func void dia_arrow_placebo_info()
{
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_01 " );	// Shepherd Pepe is seriously injured.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_02 " );	// What happened?
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_03 " );	// He took a blow to the leg from a Goblin.
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_04 " );	// The whole leg turned blue, and now the boy can't even stand properly.
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_05 " );	// And he also says that regular healing potions don't work for him.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_06 " );	// An interesting case... (thoughtfully) Usually, with a serious bruise, it is enough to simply treat this place with an ordinary tincture of seraph.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_07 " );	// And a healing potion would definitely put him back on his feet.
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_08 " );	// And what should we do?
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_09 " );	// It seems to me that the problem is different.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_10 " );	// And for this case, there is one very effective method of treatment.
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_11 " );	// And what is it?
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_12 " );	// If a patient is given an ordinary medicine, but at the same time convince him that it is, say, an 'elixir of life'...
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_13 " );	// ...then the patient will be able to heal as if he had actually taken this elixir.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_14 " );	// And trust me, this really works.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_15 " );	// I've done this trick a few times already and the results are always amazing!
	AI_Output(other,self, " DIA_Sagitta_Placebo_01_16 " );	// An interesting way to treat. I think it's worth a try.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_17 " );	// So so. Tell Pepe that I have prepared a special strong potion for him.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_18 " );	// But actually give him a regular healing essence.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_19 " );	// Just don't admit that you gave him regular medicine when he gets better.
	AI_Output(self,other, " DIA_Sagitta_Placebo_01_20 " );	// This might... Well, keep quiet.
	B_LogEntry( TOPIC_LECHENIEPEPE , " Sagitta told me how to cure Pepe. You need to give him a regular potion and suggest that it is an elixir brewed especially for him. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Troll,"FP_ROAM_CASTLEMILL_TROLL_01");
	Wld_InsertNpc(Shadowbeast,"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
	Wld_InsertNpc(DragonSnapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_01");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_02");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_03");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_04");
};

instance DIA_Constant_Seekers ( C_Info ) .
{
	npc = BAU_980_Arrow;
	nr = 1;
	condition = DIA_Sagitta_Seekers_Condition;
	information = DIA_Seekers_Info;
	description = " You don't have a face! " ;
};

func int DIA_Seeker_Condition();
{
	if ((Chapter ==  3 ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Edge_Seekers_Info()
{
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_00 " );	// You don't have a face. Something happened?
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_01 " );	// (alarmed) No, everything is fine...
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_02 " );	// I'm just a little scared by these people in black cassocks that recently appeared here.
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_03 " );	// Do you mean seekers?
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_04 " );	// Yes, I guess... To be honest, I don't know their names.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_05 " );	// But I feel uncomfortable when I see them. And I get severe headaches.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_06 " );	// Strange, but this has never happened to me before.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_07 " );	// And yesterday one of them was looking for something near my cave.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_08 " );	// I hope he didn't notice that I was following him.
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_09 " );	// You'd better stay away from these people.
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_10 " );	// And anyway, it would be better if you go to Onar's farm. Away from this place.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_11");	//Что?!
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_12 " );	// At least you'll be safe there.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_13 " );	// (decidedly) Sorry. But I can't get out of here! This is my home.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_14 " );	// Besides, I'm used to the life of a hermit. And I don't like Onar's orders at all.
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_15 " );	// But you're taking a big risk by being here alone.
	AI_Output(self,other, " DIA_Sagitta_Seekers_01_16 " );	// What to do. But I can't leave the cave unattended either.
	AI_Output(other,self, " DIA_Sagitta_Seekers_01_17 " );	// Okay, I'll think of something.
	MIS_SagittaGuard = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaGuard,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaGuard,LOG_Running);
	B_LogEntry(TOPIC_SagittaGuard, " Sagitta is concerned about the presence of seekers near her cave. I suggested she go to Onar's farm, but she refused, saying she couldn't leave her cave. " );
};

instance DIA_Constant_Seekers_Done (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 1;
	condition = DIA_Sagitta_Seekers_Done_Condition;
	information = DIA_Sagitta_Seekers_Done_Info;
	description = " Now you have guards. " ;
};

func int DIA_Search_Seekers_Done_Condition()
{
	if((MIS_SagittaGuard == LOG_Running) && (LeeSendGuard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Seekers_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Sagitta_Seekers_Done_01_00 " );	// Now you have guards.
	AI_Output(other,self, " DIA_Sagitta_Seekers_Done_01_01 " );	// So you don't have to worry about those men in black anymore.
	AI_Output(self,other, " DIA_Sagitta_Seekers_Done_01_02 " );	// (smiling) Thank you. Although, to be honest, I don't really trust these mercenaries.
	AI_Output(self,other, " DIA_Sagitta_Seekers_Done_01_03 " );	// But it's better that way than constantly shaking here alone with fear.
	AI_Output(self,other, " DIA_Sagitta_Seekers_Done_01_04 " );	// Here, take these potions as my thanks.
	B_GiveInvItems(self,other,ItPo_Health_02,2);
	AI_Output(self,other, " DIA_Sagitta_Seekers_Done_01_05 " );	// They will help you heal your wounds.
	MIS_SagittaGuard = LOG_Success;
	Log_SetTopicStatus(TOPIC_SagittaGuard,LOG_Success);
	B_LogEntry(TOPIC_SagittaGuard, " Sagitta was pleased to learn that her cave is now heavily guarded. " );
};

instance DIA_Sagitta_Werewolf ( C_Info ) .
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Condition;
	information = DIA_Sagitta_Werewolf_Info;
	permanent = FALSE;
	description = " It is said that a huge Abyssal has appeared in these places. " ;
};

func int DIA_Sagitta_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Orlan_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sagitta_Werewolf_01_00 " );	// They say that a huge obscurantist has appeared in these places.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_01_01 " );	// True? And who said it?
	AI_Output(other,self, " DIA_Sagitta_Werewolf_01_02 " );	// Well, you know, rumors usually spread quickly.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_01_03 " );	// What do you care about him?
	AI_Output(other,self, " DIA_Sagitta_Werewolf_01_04 " );	// It's a long story. But to cut a long story short, that obscurantist... He's not exactly ordinary.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_01_05 " );	// (seriously) Yes, I know.
	Info_ClearChoices(DIA_Click_Werewolf);
	Info_AddChoice(DIA_Sagitta_Werewolf, " What?! " ,DIA_Sagitta_Werewolf_Know);
};

func void DIA_Sagitta_Werewolf_Know()
{
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_00");	//Откуда?
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_01 " );	// He's right behind you now.
	AI_TurnToNPC(other,Werewolf);
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_02 " );	// And how to understand it?!
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_03 " );	// Lower your weapon! He won't touch you.
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_04 " );	// Is he sure he doesn't bite?
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_05 " );	// No. This poor fellow is too scared to attack anyone.
	AI_RemoveWeapon(self);
	AI_TurnToNPC(other,self);
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_06 " );	// Are you sure about this?! After all, it was he who attacked one of the peasants of Akil.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_07 " );	// No... That was a different beast. And this one wouldn't hurt a fly.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_08 " );	// As I understand it, he used to be human. But it seems that someone's cruel joke turned him into a beast.
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_09 " );	// You're right. The alchemist Ignaz mixed up something in the magic formula of the transformation scroll.
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_10 " );	// And this obscurantist is his assistant, who was lucky enough to use that spell.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_11 " );	// (seriously) Now everything is clear to me. Well, at least the scroll's magic didn't kill him. And that's good...
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_12 " );	// And what are you going to do with it now?
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_13 " );	// (thoughtfully) For now, he will stay with me.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_14 " );	// It won't change anything for friends, but it will keep unwanted guests away from my cave for a long time.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_15 " );	// But we still need to think about how to restore his human form.
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_16 " );	// And do you have any ideas about this?
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_17 " );	// Unfortunately, my strength and knowledge are not enough here. But, probably, magicians will be able to help us.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Know_01_18 " );	// Try talking to Vatras. I'm sure he will give us a solution to this problem.
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Know_01_19 " );	// Good. I'll talk to him.
	SagittaWereWolf = TRUE;
	B_LogEntry(TOPIC_WolfAndMan, "The Mrakoris I was looking for unexpectedly ended up in Sagitta's cave. According to her, he poses no threat to others. However, we should still look for a way to restore his human form. Sagitta advised me to talk to Vatras. " ) ;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Werewolf,"NW_SAGITTA_CAVE_IN_WEREWOLF");
};

instance DIA_Sagitta_Werewolf_Killed(C_Info)
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Killed_Condition;
	information = DIA_Sagitta_Werewolf_Killed_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sagitta_Werewolf_Killed_condition()
{
	if(WerewolfIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Killed_Info()
{
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Killed_01_00 " );	// Why did you kill him?! What did he do to you?
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Killed_01_01 " );	// I didn't think you were such a nasty bastard!
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Killed_01_02 " );	// Now get out of my cave!
	SagittaPissOff = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Online_PissOff (C_Info)
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Sagitta_PissOff_Condition;
	information = DIA_Sagitta_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Sagitta_PissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SagittaPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_PissOff_Info()
{
	AI_Output(self,other, " DIA_Sagitta_PissOff_01_00 " );	// Get out, you dirty bastard!
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_Werewolf_Safe (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Safe_Condition;
	information = DIA_Sagitta_Werewolf_Safe_Info;
	permanent = FALSE;
	description = " I spoke to Vatras. " ;
};

func int DIA_Sagitta_Werewolf_Safe_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (VatrasGiveSpell == TRUE) && (WereWolfIsHuman == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Safe_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Safe_01_00 " );	// I've spoken to Vatras.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_01_01 " );	// And what did he say?
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Safe_01_02 " );	// He can only return human consciousness to the obscurantist. The rest is beyond even him.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_01_03 " );	// (sadly) Good. This will at least ease his suffering a little.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_01_04 " );	// Vatras told us how to do this?
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Safe_01_05 " );	// Of course. He gave me a magic scroll. With his help, I will return the memory of the poor fellow.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_01_06 " );	// Then just do it. I hope everything works out for you.
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_Werewolf_Safe_Done(C_Info)
{
	npc = BAU_980_Arrow;
	nr = 1;
	condition = DIA_Sagitta_Werewolf_Safe_Done_Condition;
	information = DIA_Sagitta_Werewolf_Safe_Done_Info;
	permanent = FALSE;
	description = " I used a scroll. " ;
};

func int DIA_Sagitta_Werewolf_Safe_Done_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (WereWolfIsHuman == TRUE) && (Npc_KnowsInfo(hero,DIA_Werewolf_Hallo) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Safe_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Safe_Done_01_00 " );	// I used a scroll.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_Done_01_01 " );	// Good. I already see results.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_Done_01_02 " );	// I think you should tell Ignaz about this as well.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_Done_01_03 " );	// He's probably still worried about what happened.
	AI_Output(other,self, " DIA_Sagitta_Werewolf_Safe_Done_01_04 " );	// And the mrakoris will stay here?
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_Done_01_05 " );	// Well, where else. He definitely does not belong in the forest, and among people too.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_Done_01_06 " );	// At least I'll have someone to chat with for long evenings.
	AI_Output(self,other, " DIA_Sagitta_Werewolf_Safe_Done_01_07 " );	// I just don't really like people. But this one is a completely different matter.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_08");	//Понимаю.
	SaggitaCanSave = TRUE;
	B_LogEntry(TOPIC_WolfAndMan, " Sagitta advised me to tell Ignaz about everything. This news will somehow calm him down. " );
};

instance DIA_Style_ASKFORDT (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 6;
	condition = DIA_Sagitta_askfordt_condition;
	information = DIA_Sagitta_askfordt_info;
	permanent = FALSE;
	description = " I need a healer in my camp. " ;
};

func int DIA_Sagitta_askfordt_condition()
{
	if ( Npc_KnowsInfo ( other , DAY_Sagitta_HELLO ) && ( HURRAYICANHIRE  ==  TRUE ) && ( SagittaNeed ==  TRUE ) && ( MY_SagittaGuard == LOG_Success ))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_00 " );	// I need a healer in my camp.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_01 " );	// And you decided to look for it here?
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_02 " );	// I immediately thought of you! You're a healer, and you're good at alchemy.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_03 " );	// And knowing full well that I don't really like the company of people and can't stand leaving my cave.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_04 " );	// Yes, but times are turbulent. You could see for yourself.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_05 " );	// What do you mean?
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_06 " );	// The appearance of that dark wanderer near your cave is an extremely bad sign.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_07 " );	// Next time he might appear here not alone, but with his friends.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_08 " );	// I'm sure that my security, which you took such good care of in your time, in case of any need to cope with uninvited guests.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_09 " );	// I wouldn't count on it.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_10 " );	// Lee's guys are just simple mercenaries, and no one guarantees that they simply will not scatter at the first impending danger.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_11 " );	// Especially when it comes to magic. And, mind you, - dark magic!
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_12 " );	// Can you protect me in case of emergency?
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_13 " );	// Of course. My camp is an almost impregnable fortress, and it is much better guarded.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_14 " );	// Hmmm... And where is this camp of yours?
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_15 " );	// Not far from Onar's farm, on the site of an old watchtower.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_16 " );	// It's well flanked by the farm itself and a guarded passageway to the paladin fort, making it an even safer place.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_17 " );	// Okay, you almost convinced me! No matter how much I value my loneliness, I am not going to endanger my life yet.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_18 " );	// Are there many people in the camp?
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_19 " );	// Don't worry, there's enough work for you. And, of course, she will be well paid.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_20 " );	// Money doesn't interest me much. The only thing I'll need is some alchemy ingredients, which I'll probably have to buy now.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_21 " );	// How much do they cost?
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_22 " );	// Hmmm... I think forty gold a day is enough for me to fully provide myself with everything I need.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_23 " );	// Okay, agreed. By the way, will your guards stay here?
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_24 " );	// Yes, let them guard my cave until I return. And it's time for me to get on my way.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_25 " );	// See you at the camp then. By the way, the password to enter there is the phrase 'Dragon Treasures'.
	AI_Output(other,self, " DIA_Sagitta_AskforDT_17_26 " );	// Just tell it to the guards at the entrance.
	AI_Output(self,other, " DIA_Sagitta_AskforDT_17_27 " );	// I got it. See you.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Sagitta has agreed to move into my camp. She will prepare alchemy potions and heal my people if necessary. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	SagittaRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Right_INTOWER (C_Info) .
{
	npc = BAU_980_Arrow;
	nr = 22;
	condition = DIA_Sagitta_intower_condition;
	information = DIA_Sagitta_intower_info;
	permanent = TRUE;
	description = " How do you like the new place? " ;
};

func int DIA_Sagitta_intower_condition()
{
	if((SagittaRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_intower_info()
{
	AI_Output(other,self, " DIA_Sagitta_InTower_OrcKap_15_00 " );	// How do you like the new place?
	AI_Output(self,other, " DIA_Sagitta_InTower_OrcKap_01_01 " );	// I'm glad I agreed to your offer! This is indeed a safer place than my cave.
};
