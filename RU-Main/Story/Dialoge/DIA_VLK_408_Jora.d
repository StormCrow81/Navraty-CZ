

instance DIA_Jora_EXIT(C_Info)
{
	npc = VLK_408_Jora;
	nr = 999;
	condition = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jora_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Jora_Sperre (C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_Sperre_Condition;
	information = DIA_Jora_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Jora_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DAY_Jora_Sperre_Info()
{
	AI_Output(self,other, " DIA_Jora_Sperre_08_00 " );	// You are a convict from the colony. I won't sell you anything!
	AI_StopProcessInfos(self);
};

instance DIA_Jora_HowsMoney(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_HowsMoney_Condition;
	information = DIA_Jora_HowsMoney_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Jora_HowsMoney_Condition()
{
	if((Jora_Gold == LOG_Running) && (Canthar_Sperre == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jora_HowsMoney_Info()
{
	AI_Output(self,other, " DIA_Jora_EXIT_08_00 " );	// Hey! How about my money?
};

instances of DIA_Jora_WAREZ (C_Info)
{
	npc = VLK_408_Jora;
	nr = 700;
	condition = DIA_Jora_WAREZ_Condition;
	information = DIA_Jora_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Jora_WAREZ_Condition()
{
	if (Wld_IsTime( 5 , 15 , 20 , 4 ))
	{
		return TRUE;
	};
};

func void DAY_Jora_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Jora_WAREZ_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Jora_GREET (C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_GREET_Condition;
	information = DIA_Jora_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jora_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DAY_Jora_GREET_Info()
{
	AI_Output(self,other, " DIA_Jora_GREET_08_00 " );	// May Innos be with you, outlander. If you need anything for your travels, you've come to the right place.
	AI_Output(self,other, " DIA_Jora_GREET_08_01 " );	// But I warn you - if you want to take something without paying, I'll call the guards!
	AI_Output(other,self, " DIA_Jora_GREET_15_02 " );	// Wait a minute! Do I look like a thief?
	AI_Output(self,other, " DIA_Jora_GREET_08_03 " );	// Ha! You won't be the first to steal something from me today.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Jora trades various weapons in the marketplace. " );
};


instance DIA_Jora_Bestolen (C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_Bestolen_Condition;
	information = DIA_Jora_Bestolen_Info;
	permanent = FALSE;
	description = " Did someone rob you? " ;
};


func int DIA_Jora_Bestolen_Condition()
{
	return TRUE;
};

func void DIA_Jora_Bestohlen_Info()
{
	AI_Output(other,self, " DIA_Jora_Bestohlen_15_00 " );	// Someone robbed you?
	AI_Output(self,other, " DIA_Jora_Bestohlen_08_01 " );	// I can't prove it. This guy was pretty damn smart. Introduced himself as Rengar - if that's really his name.
	AI_Output(self,other, " DIA_Jora_Bestohlen_08_02 " );	// He's been hanging around the marketplace for days now.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other, " DIA_Jora_Bestohlen_08_03 " );	// And every evening he hangs out by a beer barrel down the street. I swear this bastard is drinking MY money!
	};
	AI_Output(self,other, " DIA_Jora_Bestohlen_08_04 " );	// I turned away just for a moment and my wallet was gone!
};

func void B_Jora_GoldForClue()
{
	AI_Output(self,other, " DIA_Jora_Add_08_04 " );	// Look - if you return the gold that Rengar stole, I'll tell you something.
};


instance DIA_Jora_HolDeinGold (C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_HolDeinGold_Condition;
	information = DIA_Jora_HolDeinGold_Info;
	permanent = FALSE;
	description = " I could return that gold to you. " ;
};


func int DIA_Jora_HolDeinGold_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Add_Order ) )
	{
		return TRUE;
	};
};

func void DIA_Jora_HolDeinGold_Info()
{
	AI_Output(other,self, " DIA_Jora_HolDeinGold_15_00 " );	// I could return that gold to you.
	AI_Output(self,other, " DIA_Jora_HolDeinGold_08_01 " );	// Yes?...(incredulously) Why are you doing this?!
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold, " I want to get some gold as a reward! " ,DIA_Jora_HolDeinGold_WillBelohnung);
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		Info_AddChoice(DIA_Jora_HolDeinGold, " I'm looking for approaches to the Thieves Guild! " ,DIA_Jora_HolDeinGold_GHDG);
	};
	if((other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		Info_AddChoice(DIA_Jora_HolDeinGold, " Could you help me get to the upper quarter? " ,DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output(other,self, " DIA_Jora_Add_15_00 " );	// How to say... well, could you help me get to the upper quarter, for example?
	AI_Output(self,other, " DIA_Jora_HolDeinGold_08_03 " );	// You've come to the wrong place... (laughs) I'm from outside, like most of the merchants in this square.
	AI_Output(self,other, " DIA_Jora_Add_08_01 " );	// If you want to get to the upper quarter, talk to the local merchants in the lower part of the city.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output(other,self, " DIA_Jora_Add_15_02 " );	// I'm looking for approaches to the thieves guild!
	AI_Output(self,other, " DIA_Jora_Add_08_03 " );	// Here I could help you.
	B_Jora_GoldForClue();
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold, " I'll try. " ,DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold, " How much gold was in this wallet? " ,DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold, " Why didn't you call the guard? " ,DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_GetYourGold_WillReward()
{
	AI_Output(other,self, " DIA_Jora_HolDeinGold_WillBelohnung_15_00 " );	// I want to get some of the gold as a reward!
	AI_Output(self,other, " DIA_Jora_HolDeinGold_WillBelohnung_08_01 " );	// Give me back my wallet first. And then we'll talk about your reward!
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold, " I'll try. " ,DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold, " How much gold was in this wallet? " ,DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold, " Why didn't you call the guard? " ,DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_GetYourGold_Guard()
{
	AI_Output(other,self, " DIA_Jora_HolDeinGold_Wache_15_00 " );	// Why didn't you call the guards?
	AI_Output(self,other, " DIA_Jora_HolDeinGold_Wache_08_01 " );	// The guard reacts only if the thief is caught red-handed.
	AI_Output(self,other, " DIA_Jora_HolDeinGold_Wache_08_02 " );	// And when I noticed that my wallet was gone, it was gone!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output(other,self, " DIA_Jora_HolDeinGold_HowMuch_15_00 " );	// How much gold was in this wallet?
	AI_Output(self,other, " DIA_Jora_HolDeinGold_HowMuch_08_01 " );	// Fifty gold. That's a hefty sum these days!
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output(other,self, " DIA_Jora_HolDeinGold_DoIt_15_00 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_Jora_HolDeinGold_DoIt_08_01 " );	// Be careful! If you just knock out that bastard, the guards will turn on you.
	AI_Output(self,other, " DIA_Jora_HolDeinGold_DoIt_08_02 " );	// Recently, the situation here has escalated significantly. Ever since the paladins arrived in the city, the guards have turned on anyone who gets into a fight.
	AI_Output(self,other, " DIA_Jora_HolDeinGold_DoIt_08_03 " );	// So come up with something...
	AI_Output(other,self, " DIA_Jora_HolDeinGold_DoIt_15_04 " );	// I'll try.
	Jora_thief = LOG_Running;
	Jora_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JoraDieb,LOG_Running);
	Log_CreateTopic(TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Jora,LOG_Running);
	B_LogEntry(TOPIC_Jora, " A guy named Rengaru robbed Jora the merchant. He hangs around the market all day. I have to return Jora's stolen gold. " );
	B_LogEntry_Quiet(TOPIC_JoraDieb, " Rengaru robbed merchant Jora. If I catch him, I'll be rewarded for it. " );
	Info_ClearChoices(DIA_Jora_HolDeinGold);
};


instance DIA_Jora_WegenDieb (C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_WegenDieb_Condition;
	information = DIA_Jora_WegenDieb_Info;
	permanent = TRUE;
	description = " About the thief... " ;
};


func int DIA_Jora_WegenDieb_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jora_WegenDieb_Info()
{
	AI_Output(other,self, " DIA_Jora_WegenDieb_15_00 " );	// About the thief...
	AI_Output(self,other, " DIA_Jora_WegenDieb_08_01 " );	// Yes, how's it going? Did you catch him? And more importantly, did you take my gold from him?
	Info_ClearChoices(DIA_Jora_WegenDieb);
	if (Npc_IsDead(Rengaru))
	{
		Info_AddChoice(DIA_Jora_WegenDieb, " Well, he had an accident. " ,DIA_Jora_WegenDieb_Tot);
	}
	else if(Rengaru_InKnast == TRUE)
	{
		Info_AddChoice(DIA_Jora_WegenDieb, " Yes, I caught him. " ,DIA_Jora_WegenDieb_ImKnast);
	}
	else if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice(DIA_Jora_WegenDieb, " He ran away from me. " ,DIA_Jora_WegenDieb_Entkommen);
	};
	Info_AddChoice(DIA_Jora_WegenDieb, " I'm still working on it! " ,DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output(other,self, " DIA_Jora_WegenDieb_Continue_15_00 " );	// I'm still working on it!
	AI_Output(self,other, " DIA_Jora_WegenDieb_Continue_08_01 " );	// Don't forget to bring that gold back to me!
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_BecauseThieb_Escape()
{
	AI_Output(other,self, " DIA_Jora_WegenDieb_Entkommen_15_00 " );	// He ran away from me.
	AI_Output(self,other, " DIA_Jora_WegenDieb_Entkommen_08_01 " );	// And my gold? Did he take it with him?
	Jora_thief = LOG_SUCCESS ;
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output(other,self, " DIA_Jora_WegenDieb_ImKnast_15_00 " );	// Yes, I caught it. Let him sit behind bars for a while, think...
	AI_Output(self,other, " DIA_Jora_WegenDieb_ImKnast_08_01 " );	// What about my gold?
	Jora_thief = LOG_SUCCESS ;
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output(other,self, " DIA_Jora_WegenDieb_Tot_15_00 " );	// Well, he had an accident.
	AI_Output(self,other, " DIA_Jora_WegenDieb_Tot_08_01 " );	// Well, at least he won't be able to rob anyone now! The justice of Innos has been done!
	AI_Output(self,other, " DIA_Jora_WegenDieb_Tot_08_02 " );	// Where is my gold?
	Jora_thief = LOG_SUCCESS ;
	Info_ClearChoices(DIA_Jora_WegenDieb);
};


instances of DIA_Jora_BringGold (C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_BringGold_Condition;
	information = DIA_Jora_BringGold_Info;
	permanent = TRUE;
	description = " Here's the fifty gold he stole from you. " ;
};


func int DIA_Jora_BringGold_Condition()
{
	if(((Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS)) && (Jora_Gold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jora_BringGold_Info()
{
	AI_Output(other,self, " DIA_Jora_BringGold_15_00 " );	// Here are the fifty gold coins he stole from you.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Jora_BringGold_08_01 " );	// Praise Innos! There is still justice in this city.
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output(self,other, " DIA_Jora_BringGold_08_03 " );	// Hey, it's not all fifty gold! Are you trying to rob me too?
	};
};


var int Jora_GhdgHint;

instance DIA_Jora_GHDgInfo(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_GHDgInfo_Condition;
	information = DIA_Jora_GHDgInfo_Info;
	permanent = TRUE;
	description = " What do you know about the Thieves Guild? " ;
};


func int DIA_Jora_GHDgInfo_Condition()
{
	if ((MIS_Other_GuildOfThieves == LOG_Running) && Npc_KnowsInfo(other,DIA_Jora_Ordered) && (Jora_GhdgHinweis ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Jora_GHDgInfo_Info()
{
	AI_Output(other,self, " DIA_Jora_Add_15_05 " );	// What do you know about the Thieves Guild?
	if(Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output(self,other, " DIA_Jora_Add_08_06 " );	// Okay - I'll tell you - but you haven't heard anything from me, if anything, understand?
		AI_Output(self,other, " DIA_Jora_Add_08_07 " );	// Some dark personalities are constantly hanging around in the port tavern.
		AI_Output(self,other, " DIA_Jora_Add_08_08 " );	// I bet the bartender knows something about this...
		AI_Output(self,other, " DIA_Jora_Add_08_09 " );	// If you want to track down these thieves, you should talk to HIM.
		AI_Output(self,other, " DIA_Jora_Add_08_10 " );	// You can pretend to be looking for some dark job, for example. Maybe he'll buy into it.
		AI_Output(self,other, " DIA_Jora_Add_08_11 " );	// But be careful. It's better not to joke with these people.
		Jora_GhdgHinweis = TRUE;
	};
};


instance DIA_Jora_Reward (C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_Reward_Condition;
	information = DIA_Jora_Rewards_Info;
	permanent = FALSE;
	description = " I want to get some of the gold as a reward! " ;
};


func int DIA_Jora_Reward_Condition()
{
	if(Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Jora_Reward_Info()
{
	AI_Output(other,self, " DIA_Jora_Belohnung_15_00 " );	// I want to get some of the gold as a reward!
	if(Jora_GhdgHinweis == TRUE)
	{
		AI_Output(self,other, " DIA_Jora_Add_08_12 " );	// But I already gave you valuable advice.
		AI_Output(self,other, " DIA_Jora_Add_08_13 " );	// This should be enough as a reward.
	};
	AI_Output(self,other, " DIA_Jora_Add_08_14 " );	// And if you need gold, then hunt down the thieves and get a reward for their head from Lord Andre.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other, " DIA_Jora_Belohnung_08_03 " );	// Now excuse me, I have clients waiting...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jora_Alrik's sword (C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_AlriksSchwert_Condition;
	information = DIA_Jora_AlriksSchwert_Info;
	permanent = FALSE;
	description = " Alrik says you have his sword... " ;
};


func int DIA_Jora_AlriksSchwert_Condition()
{
	if(MIS_Alrik_Sword == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jora_AlriksSchwert_Info()
{
	AI_Output(other,self, " DIA_Jora_AlriksSchwert_15_00 " );	// Alric says you have his sword...
	AI_Output(self,other, " DIA_Jora_AlriksSchwert_08_01 " );	// You mean that ragamuffin who sold his weapon to me for a few torches and a piece of meat?
	AI_Output(other,self, " DIA_Jora_AlriksSchwert_15_02 " );	// Yes, this is it.

	if(Npc_HasItems(self,ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output(self,other, " DIA_Jora_AlriksSchwert_08_03 " );	// I still have his sword.
		AI_Output(other,self, " DIA_Jora_AlriksSchwert_15_04 " );	// How much do you want for it?

		if(Jora_Gold == LOG_SUCCESS)
		{
			if(RhetorikSkillValue[1] < 100)
			{
				RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
				AI_Print( " Rhetoric + 1 " );
			};

			AI_Output(self,other, " DIA_Jora_AlriksSchwert_08_05 " );	// Well - for you...
			AI_Output(self,other, " DIA_Jora_AlriksSchwert_08_06 " );	// Oh, okay! Take it like this. After all, you helped me get my gold back...
			B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
		}
		else
		{
			AI_Output(self,other, " DIA_Jora_AlriksSchwert_08_07 " );	// Well...just for you...fifty gold coins!
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jora_AlriksSchwert_08_08 " );	// (annoyed) I don't have it anymore! God knows who I sold it to!
	};
};


instance DIA_Jora_BUYAlrik's sword (C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_BUYAlriksSchwert_Condition;
	information = DIA_Jora_BUYAlrik's sword_Info;
	permanent = TRUE;
	description = " Here are fifty gold coins! Give me Alric's sword. " ;
};


func int DIA_Expenditure_BUYAlRicksSpecial_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Jora_AlriksSchwert ) && ( Npc_HasItems ( self , ItMw_AlriksSword_Mis ) >  0 ))
	{
		return TRUE;
	};
};

func void DIA_Jora_BUYAlriksSchwert_Info()
{
	AI_Output(other,self, " DIA_Jora_BUYAlriksSchwert_15_00 " );	// Here are fifty gold coins! Give me Alric's sword.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other, " DIA_Jora_BUYAlriksSchwert_08_04 " );	// Here you go - (grins) this is a good deal.
		B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Jora_BUYAlriksSchwert_08_05 " );	// You don't have enough gold. But don't worry - I'll hold onto that sword for now. Come back later if you want...
	};
};


instance DIA_Jora_PICKPOCKET(C_Info)
{
	npc = VLK_408_Jora;
	nr = 900;
	condition = DIA_Jora_PICKPOCKET_Condition;
	information = DIA_Jora_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jora_PICKPOCKET_Condition()
{
	return  C_Robbery ( 31 , 45 );
};

func void DIA_Jora_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
	Info_AddChoice(DIA_Jora_PICKPOCKET,Dialog_Back,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jora_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};

func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};


instance DIA_JORA_BENGARGOODS(C_Info)
{
	npc = VLK_408_Jora;
	nr = 700;
	condition = dia_jora_bengargoods_condition;
	information = dia_close_bengargoods_info;
	permanent = FALSE;
	description = " I have a package for you from Farmer Bengar. " ;
};


func int dia_jora_bengargoods_condition()
{
	if (( MIS_BENGARORDER  == LOG_Running) && (Npc_HasItems(other,itmi_bengarpacket) >=  1 ))
	{
		return TRUE;
	};
};

func void dia_close_bengargoods_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Jora_BengarGoods_01_00 " );	// I have a package for you from Farmer Bengar.
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_01 " );	// Great! And then I was already waiting for her.
	B_GiveInvItems(other,self,itmi_bengarpacket,1);
	Npc_RemoveInvItems(self,itmi_bengarpacket,1);
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_02 " );	// So what do we have here...
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_03 " );	// Hmmm, not bad at all. And just what I asked for. Wonderful!
	AI_Output(other,self, " DIA_Jora_BengarGoods_01_06 " );	// What should I do now?
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_07 " );	// Go to Luthero - he asked me to tell you that he urgently needs to discuss something with you.
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_09 " );	// You can also tell him that I received the package.
	AI_Output(other,self, " DIA_Jora_BengarGoods_01_11 " );	// Tell me, are you also a member of the guild?
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_12 " );	// Hmmm... (smiles) Of course. Otherwise, Luthero would not have commissioned you to deliver this package to me.
	AI_Output(other,self, " DIA_Jora_BengarGoods_01_16 " );	// Clear. I'm going to see Luthero.
	AI_Output(self,other, " DIA_Jora_BengarGoods_01_17 " );	// Yes, yes. Go. See you.
	AI_StopProcessInfos(self);
	JORATAKEPACK = TRUE;
	MIS_BENGARORDER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_SUCCESS);
	B_LogEntry( TOPIC_BENGARORDER , " I gave Jora a package of goods. Now I need to go to Luthero - he urgently wanted to see me. " );
};
