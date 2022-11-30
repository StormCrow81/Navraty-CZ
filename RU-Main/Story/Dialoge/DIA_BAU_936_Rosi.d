
instance DIA_Rosi_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_EXIT_Condition;
	information = DIA_Rosi_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Rosi_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Rosi_HALLO (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 3;
	condition = DIA_Rosi_HALLO_Condition;
	information = DIA_Rosi_HALLO_Info;
	description = " Are you all right? " ;
};


func int DIA_Rosi_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rosi_HALLO_Info()
{
	AI_Output(other, self, " DIA_Rosi_HALLO_15_00 " );	// Are you okay?
	AI_Output(self,other, " DIA_Rosi_HALLO_17_01 " );	// Well, more or less. My back hurts from constant hard work. What are you doing here? We rarely have guests.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other, " DIA_Rosi_HALLO_17_02 " );	// Usually it's either the thugs from the mountains, or those horrible militia soldiers from the city.
		AI_Output(self,other, " DIA_Rosi_HALLO_17_03 " );	// They've been visiting our farm a lot lately. But you don't look like one of them.
	};
};


instance DIA_Rosi_WASMACHSTDU (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 4;
	condition = DIA_Rosi_WASMACHSTDU_Condition;
	information = DIA_Rosi_WASMACHSTDU_Info;
	description = " What are you doing here? " ;
};


func int DIA_Rosi_WASMACHSTDU_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_HELLO ) && ( Capital <  5 )) .
	{
		return TRUE;
	};
};

func void DIA_Rosi_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_Rosi_WASMACHSTDU_15_00 " );	// What are you doing here?
	if (Npc_IsDead(Sekob) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Rosi_WASMACHSTDU_17_01 " );	// I've been asking myself this question for years now. Sekob, my husband, managed to quarrel with all the neighbors.
		AI_Output(self,other, " DIA_Rosi_WASMACHSTDU_17_02 " );	// He owes everyone in the neighborhood. And he steals food from Onar's stocks and sells them in the city.
		AI_Output(self,other, " DIA_Rosi_WASMACHSTDU_17_03 " );	// He made a fortune with his shady dealings.
		AI_Output(self,other, " DIA_Rosi_WASMACHSTDU_17_04 " );	// He forces our workers to work to the point of exhaustion. For this, everyone calls him a murderer behind his back.
		AI_Output(self,other, " DIA_Rosi_WASMACHSTDU_17_05 " );	// I don't like calling myself Sekob's wife, trust me. Sometimes I even wish the Barrier was still in place.
	};
	AI_Output(self,other, " DIA_Rosi_WASMACHSTDU_17_06 " );	// Do you want to buy some food or maybe something to hunt in the forest?
	Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
	B_LogEntry(Topic_OutTrader, " Rosie at the Secoba Farm sells various items. " );
};


instances of DIA_Rosi_WAREZ (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 2;
	condition = DIA_Rosi_WAREZ_Condition;
	information = DIA_Rosi_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " What can you offer me? " ;
};


func int DIA_Rosi_WAREZ_Condition()
{
	if (( Npc_KnowsInfo (other,DIA_Rosi_WASMACHSTDU) || ((Chapter > = 5  ) && Npc_KnowsInfo (other, DIA_Rosi_FLEEFROMSEKOB ) ) || 
	{
		return TRUE;
	};
};

func void DIA_Rosi_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Rosi_WAREZ_15_00 " );	// What can you offer me?
	AI_Output(self,other, " DIA_Rosi_WAREZ_17_01 " );	// Choose.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));
};


instance DIA_Rosi_BARRIERE (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 6;
	condition = DIA_Rosi_BARRIERE_Condition;
	information = DIA_Rosi_BARRIERE_Info;
	description = " Barrier? " ;
};


func int DIA_Rosi_BARRIERE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_WASMACHSTDU ) && ( Npc_IsDead ( Sekob ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BARRIERE_Info()
{
	AI_Output(other,self, " DIA_Rosi_BARRIERE_15_00 " );	// Barrier?
	AI_Output(self,other, " DIA_Rosi_BARRIERE_17_01 " );	// Well, the dome that covered the old Valley of Mines.
	AI_Output(self,other, " DIA_Rosi_BARRIERE_17_02 " );	// Many farmers and ordinary workers who committed a crime were then simply thrown there and they never came back.
};


instance DIA_Rosi_DuInBarriere (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 10;
	condition = DIA_Rosi_DuInBarriere_Condition;
	information = DIA_Rosi_DuInBarriere_Info;
	description = " Have you ever been behind the Barrier? " ;
};


func int DIA_Rosi_DuInBarriere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_BARRIERE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_DuInBarriere_Info()
{
	AI_Output(other,self, " DIA_Rosi_DuInBarriere_15_00 " );	// Have you ever been behind the Barrier?
	AI_Output(self,other, " DIA_Rosi_DuInBarriere_17_01 " );	// No. We've only heard of him. Bengar, a farmer from the highlands, will surely be able to tell you more about him.
	AI_Output(self,other, " DIA_Rosi_DuInBarriere_17_02 " );	// His farm is very close to the passage leading to the Valley of Mines.
};


instances DIA_Rosi_BENGAR (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 11;
	condition = DIA_Rosi_BENGAR_Condition;
	information = DIA_Rosi_BENGAR_Info;
	description = " How do I get to Bengar's farm? " ;
};


func int DIA_Rosi_BENGAR_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_DuInBarrier ) && ( Npc_IsDead ( Balthasar ) ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Rosi_BENGAR_Info()
{
	AI_Output(other,self, " DIA_Rosi_BENGAR_15_00 " );	// How do I get to Bengar's farm?
	AI_Output(self,other, " DIA_Rosi_BENGAR_17_01 " );	// Ask Balthazar. This is our shepherd. Sometimes he leads his sheep to the pastures of Bengar.
	AI_Output(self,other, " DIA_Rosi_BENGAR_17_02 " );	// He'll tell you how to get there.
};


DIA_Rosi_Miliz instances (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 7;
	condition = DIA_Rosi_Miliz_Condition;
	information = DIA_Rosi_Miliz_Info;
	description = " Why are the militia attacking your farms? " ;
};


func int DIA_Rosi_Miliz_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_WASMACHSTDU ) && ( hero . guild !=  GIL_MIL ))
	{
		return TRUE;
	};
};

func void DIA_Rosi_Miliz_Info()
{
	AI_Output(other,self, " DIA_Rosi_Miliz_15_00 " );	// Why are the militia attacking your farms?
	AI_Output(self,other, " DIA_Rosi_Miliz_17_01 " );	// Because there's no one here who won't let them just rob our farms instead of buying our products.
	AI_Output(self,other, " DIA_Rosi_Miliz_17_02 " );	// The king is far away, and we can only work for Onar, hoping that he will send help when we really need it.
};


instance DIA_Rosi_ONAR (C_Info) .
{
	npc = BAU_936_Rosi;
	nr = 8;
	condition = DIA_Rosi_ONAR_Condition;
	information = DIA_Rosi_ONAR_Info;
	description = " What does Onar's help look like? " ;
};


func int DAY_Rosi_ONAR_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_Miliz ))
	{
		return TRUE;
	};
};

func void DAY_Rosi_ONAR_Info()
{
	AI_Output(other,self, " DIA_Rosi_ONAR_15_00 " );	// And what does Onar's help look like?
	AI_Output(self,other, " DIA_Rosi_ONAR_17_01 " );	// Sometimes we know in advance that the militia plans to pay us a visit.
	AI_Output(self,other, " DIA_Rosi_ONAR_17_02 " );	// Then we send someone to Onar asking for help.
	AI_Output(self,other, " DIA_Rosi_ONAR_17_03 " );	// And then there are usually mercenaries soon after that he pays to come in here and drive the militia out.
	AI_Output(self,other, " DIA_Rosi_ONAR_17_04 " );	// But frankly, mercenaries aren't much better than militia.
};


instances DIA_Rosi_PERMKAP1 (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 80;
	condition = DIA_Rosi_PERMKAP1_Condition;
	information = DIA_Rosi_PERMKAP1_Info;
	permanent = TRUE;
	description = " Up your nose. " ;
};


func int DIA_Rosi_PERMKAP1_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_WASMACHSTDU ) || ( ( Capital >=  5 ) && Npc_Knows Info ( other , DIA_Rosi_FLEEFROMSEKOB ))) ;
	{
		return TRUE;
	};
};

func void DIA_Rosi_PERMKAP1_Info()
{
	AI_Output(other,self, " DIA_Rosi_PERMKAP1_15_00 " );	// Up the nose.
	if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Rosi_PERMKAP1_17_01 " );	// Get lost!
	}
	else
	{
		AI_Output(self,other, " DIA_Rosi_PERMKAP1_17_02 " );	// Take care of yourself.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_KAP3_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP3_EXIT_Condition;
	information = DIA_Rosi_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_KAP4_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP4_EXIT_Condition;
	information = DIA_Rosi_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_KAP5_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP5_EXIT_Condition;
	information = DIA_Rosi_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_FLEEFROMSEKOB (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 50;
	condition = DIA_Rosi_FLEEFROMSEKOB_Condition;
	information = DIA_Rosi_FLEEFROMSEKOB_Info;
	description = " What are you doing out here in the middle of nowhere? " ;
};


func int DIA_Rosi_FLEEFROMSEKOB_Condition()
{
	if ((Chapter ==  5 ) && (Rosie_FleeFromSekob_Chapter5 ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info()
{
	AI_Output(other,self, " DIA_Rosi_FLEEFROMSEKOB_15_00 " );	// What are you doing out here in the wilderness?
	AI_Output(self,other, " DIA_Rosi_FLEEFROMSEKOB_17_01 " );	// I can't take it anymore. Sekob began throwing tantrums at every opportunity.
	AI_Output(self,other, " DIA_Rosi_FLEEFROMSEKOB_17_02 " );	// In the end, everyone stopped talking to him. Well, he doesn't talk to anyone either.
	AI_Output(self,other, " DIA_Rosi_FLEEFROMSEKOB_17_03 " );	// I should have run from there, but now I don't know where to go.
	AI_Output(self,other, " DIA_Rosi_FLEEFROMSEKOB_17_04 " );	// Could you help me?
	B_GivePlayerXP(XP_Ambient);
	RosiFoundKap5 = TRUE;
};


instance DIA_Rosi_HILFE (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 51;
	condition = DIA_Rosi_HILFE_Condition;
	information = DIA_Rosi_HILFE_Info;
	description = " I'll get you out of here. " ;
};


func int DIA_Rosi_HILFE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Rosi_FLEEFROMSEKOB ) && ( Rosi_Flee_FromSekob_Cap5 ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Rosi_HILFE_Info()
{
	AI_Output(other,self, " DIA_Rosi_HILFE_15_00 " );	// I'll get you out of here.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Till.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDM))
	{
		AI_Output(other,self, " DIA_Rosi_HILFE_15_01 " );	// I can take you to the city.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self, " DIA_Rosi_HILFE_15_02 " );	// I'll take you to Onar's farm.
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(other,self, " DIA_Rosi_HILFE_15_03 " );	// Let's go to the monastery. You will be well received there.
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		AI_Output(other,self, " DIA_Rosi_HILFE_15_03A " );	// I can take you to our camp. The brothers will take care of you.
	};
	AI_Output(self,other, " DIA_Rosi_HILFE_17_04 " );	// I will never forget what you did for me. I will repay you.
	if (Npc_IsDead(Return))
	{
		AI_Output(self,other, " DIA_Rosi_HILFE_17_05 " );	// You go ahead. I will follow you.
	}
	else
	{
		AI_Output(self,other, " DIA_Rosi_HILFE_17_06 " );	// You go ahead. We will follow you.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDM))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		B_StartOtherRoutine(Till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		B_StartOtherRoutine(Till,"FollowBigfarm");
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		B_StartOtherRoutine(Till,"FollowKloster");
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		Npc_ExchangeRoutine(self,"FollowPsiCamp");
		B_StartOtherRoutine(Till,"FollowPsiCamp");
	};
	Log_CreateTopic(TOPIC_RosisFlucht,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_Running);
	B_LogEntry(TOPIC_RosisFlucht, " Rosie couldn't take life on the Sekob farm anymore and ran into the woods, but got lost and doesn't know where to go. I'll lead her out of the woods. " );
	MIS_RosisFlucht = LOG_Running;
};


instance DIA_Rosi_ANGEKOMMEN (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 55;
	condition = DIA_Rosi_ANGEKOMMEN_Condition;
	information = DIA_Rosi_ANGEKOMMEN_Info;
	important = TRUE;
};


func int DIA_Rosi_ANGEKOMMEN_Condition()
{
	if((Kapitel == 5) && (MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_MIL) || (hero.guild == GIL_KDM))) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_SLD))) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))) || ((Npc_GetDistToWP(self,"PSICAMP") < 6000) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ARRIVED_Info()
{
	var int XPForBoth;

	if (Npc_IsDead(Return))
	{
		B_GivePlayerXP(XP_SavedRosi);
	}
	else
	{
		XPForBoth = XP_SavedRosi + XP_Ambient;
		B_GivePlayerXP(XPForBoth);
	};

	AI_Output(self,other, " DIA_Rosi_ANGEKOMMEN_17_00 " );	// Then I'll find my own way.
	AI_Output(self,other, " DIA_Rosi_ANGEKOMMEN_17_01 " );	// Thank you. I don't even know what I would do without you.
	AI_Output(self,other, " DIA_Rosi_ANGEKOMMEN_17_02 " );	// Please accept this humble gift. You deserve it.
	B_GiveInvItems(self,other,ItMi_Gold,450);
	MIS_BringRosiBackToSekob = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_BringRosiBackToSekob,LOG_OBSOLETE);
	MIS_RosisFlucht = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_SUCCESS);
	B_LogEntry(TOPIC_RosisFlucht, " I saw Rosie off. " );
	Wld_StopEffect("DIALOGSCOPE_FX");
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	To.aivar[ AIV_PARTYMEMBER ] = FALSE ;

	if(Npc_GetDistToWP(self,"CITY2") < 10000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		B_StartOtherRoutine(Till,"CITY");
		RosiTillDied = TRUE;
		TillRosiCity = TRUE;
	}
	else if(Npc_GetDistToWP(self,"BIGFARM") < 10000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		B_StartOtherRoutine(Till,"BIGFARM");
		ToRosiFarm = TRUE ;
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 10000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		B_StartOtherRoutine(Till,"KLOSTER");
		ToRosiKloster = TRUE ;
	}
	else if(Npc_GetDistToWP(self,"PSICAMP") < 10000)
	{
		Npc_ExchangeRoutine(self,"PSICAMP");
		B_StartOtherRoutine(Till,"PSICAMP");
		ToRosiPsiCamp = TRUE ;
	}
	else
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		B_StartOtherRoutine(Till,"BIGFARM");
		ToRosiFarm = TRUE ;
	};

	HeroNotMobsi = FALSE ;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};

instance DIA_Rosi_TRAIT (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 55;
	condition = DIA_Rosi_TRAIT_Condition;
	information = DIA_Rosi_TRAIT_Info;
	description = " See, now you're home again. " ;
};

func int DIA_Rosi_TRAIT_Condition()
{
	if((MIS_bringRosiBackToSekob == LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE) && (Npc_GetDistToWP(self,"NW_FARM4_SEKOB") < 3000))
	{
		return TRUE;
	};
};

func void DIA_Rosi_TRAIT_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Rosi_TRAIT_15_00 " );	// See, now you're home again.
	AI_Output(self,other, " DIA_Rosi_TRAIT_17_01 " );	// You're the worst piece of shit I've ever met in my life! You dirty pig!
	MIS_RosisFlucht = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_OBSOLETE);
	AI_StopProcessInfos(self);
};


instances of DIA_Rosi_MinenAnteil (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 3;
	condition = DIA_Rosi_MinenAnteil_Condition;
	information = DIA_Rosi_MinenAnteil_Info;
	description = " Aren't you ashamed to sell fake shares? " ;
};


func int DIA_Rosi_MinenAnteil_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MY_Serpents_MineBefore_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU));
	{
		return TRUE;
	};
};

func void DIA_Rosi_MinenAnteil_Info()
{
	AI_Output(other,self, " DIA_Rosi_Minenanteil_15_00 " );	// Aren't you ashamed to sell fake shares?
	AI_Output(self,other, " DIA_Rosi_Minenanteil_17_01 " );	// No! I need something to live on, and besides, I myself bought them from someone.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Rosi_KAP6_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP6_EXIT_Condition;
	information = DIA_Rosi_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Rosi_PICKPOCKET (C_Info)
{
	npc = BAU_936_Rosi;
	nr = 900;
	condition = DIA_Rosi_PICKPOCKET_Condition;
	information = DIA_Rosi_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rosi_PICKPOCKET_Condition()
{
	return  C_Robbery ( 30 , 75 );
};

func void DIA_Rosi_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
	Info_AddChoice(DIA_Rosi_PICKPOCKET,Dialog_Back,DIA_Rosi_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rosi_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Rosi_PICKPOCKET_DoIt);
};

func void DIA_Rosi_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
};

func void DIA_Rosi_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
};
