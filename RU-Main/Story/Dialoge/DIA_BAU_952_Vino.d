
instance DIA_Vino_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Vino_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Wine_HALLO (C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_HALLO_Condition;
	information = DIA_Vino_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Vino_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Wine_HALLO_Info()
{
	AI_Output(other,self, " DIA_Vino_HALLO_15_00 " );	// How is work going?
	AI_Output(self,other, " DIA_Vino_HALLO_05_01 " );	// Same as always. There is a lot of work, little money, and if we are not at all lucky, then tomorrow the orcs will come and burn our farm to the ground.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Vino_HALLO_05_02 " );	// The royal paladins have taken over the entire city. But I highly doubt they'll get their asses up and come here if the orcs attack us.
	};
};


instance DIA_Vino_SeekWork(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_SeekWork_Condition;
	information = DIA_Vino_SeekWork_Info;
	permanent = FALSE;
	description = " Can I help you? I'm looking for a job. " ;
};

func int DIA_Vino_SeekWork_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Lobart_WorkNOW) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG)) &&  ! Npc_IsDead(Lobart) && (Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Vino_SeekWork_Info()
{
	AI_Output(other,self, " DIA_Vino_SeekWork_15_00 " );	// Is there anything I can do to help? I'm looking for a job.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Vino_SeekWork_05_01 " );	// Do you even know anything about field work?
		AI_Output(other,self, " DIA_Vino_SeekWork_15_02 " );	// What is there to know?
		AI_Output(self,other, " DIA_Vino_SeekWork_05_03 " );	// Ah! In that case... I think we can manage on our own, thanks.
		if ( ! Npc_IsDead(Lobart))
		{
			AI_Output(self,other, " DIA_Vino_SeekWork_05_04 " );	// But if you want to work for Lobart as a day laborer, I can only warn you. He pays people like you pennies!

			if ((Lobart_clothing_sold ==  FALSE ) && (Npc_KnowsInfo(other,DIA_Lobart_CLOTHING) || Npc_KnowsInfo(other,DIA_Lobart_WorkNOW)))
			{
				AI_Output(other,self, " DIA_Vino_SeekWork_15_05 " );	// He offered to buy clean clothes from him cheaper if I helped on the farm.
				AI_Output(self,other, " DIA_Vino_SeekWork_05_06 " );	// Hmmm... (thoughtfully) I don't have any work for you, but you can bring me and the guys something to drink.
				AI_Output(self,other, " DIA_Vino_SeekWork_05_07 " );	// Bring me a bottle of wine and I'll tell Lobart that you helped us a lot (laughs mockingly).
				MIS_Vino_Wein = LOG_Running;
				Log_CreateTopic(TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Vino,LOG_Running);
				B_LogEntry(TOPIC_Vino, " If I bring Vino a bottle of wine, he will tell Lobart that I helped him. " );
			}
			else
			{
				AI_Output(self,other, " DIA_Vino_SeekWork_05_08 " );	// But you didn't hear that from me, okay?
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Vino_SeekWork_05_09 " );	// I don't think you'll like it. A man in your position is unlikely to want to do such a dirty job that I can offer.
	};
};


instance DIA_Vino_BringWine(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_BringWine_Condition;
	information = DIA_Vino_BringWine_Info;
	permanent = FALSE;
	description = " Here's your wine. " ;
};


func int DIA_Vino_BringWine_Condition()
{
	if((MIS_Vino_Wein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) > 0) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_BringWine_Info()
{
	AI_Output(other,self, " DIA_Vino_BringWine_15_00 " );	// Here's your wine.
	B_GiveInvItems(other,self,ItFo_Wine,1);
	AI_Output(self,other, " DIA_Vino_BringWine_05_01 " );	// I guess I won't ask where you got it, okay? (laughs) Who cares?
	if ( ! Npc_IsDead(Lobart))
	{
		AI_Output(self,other, " DIA_Vino_BringWine_05_02 " );	// Thanks anyway.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other, " DIA_Vino_BringWine_05_03 " );	// Lobart will only hear good things about you.
		};
	};
	MIS_Vino_Wein = LOG_SUCCESS;
	B_GivePlayerXP(XP_VinoWein);
};


instance DIA_Vino_ToTheCity(C_Info)
{
	npc = BAU_952_Vino;
	nr = 3;
	condition = DIA_Vino_ToTheCity_Condition;
	information = DIA_Vino_ToTheCity_Info;
	permanent = FALSE;
	description = " I'm heading to the city. " ;
};


func int DIA_Vino_ToTheCity_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Vino_ToTheCity_Info()
{
	AI_Output(other,self, " DIA_Vino_ToTheCity_15_00 " );	// I'm heading for the city.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//И?
	AI_Output(other,self, " DIA_Vino_ToTheCity_15_02 " );	// Can you tell me something interesting about the city?
	AI_Output(self,other, " DIA_Vino_ToTheCity_05_03 " );	// No. But Malet often goes to the city. Maybe he knows something... well, something that might interest you.
};


var int Vino_Gossip_Orks;
var int Vino_Gossip_Bugs;

instance DIA_Wine_PERM (C_Info)
{
	npc = BAU_952_Vino;
	nr = 10;
	condition = DIA_Vino_PERM_Condition;
	information = DIA_Vino_PERM_Info;
	permanent = TRUE;
	description = " Any interesting news? " ;
};

func int DIA_Vino_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Wine_HELLO ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM_Info()
{
	AI_Output(other,self, " DIA_Vino_PERM_15_00 " );	// Any interesting news?

	if(Vino_Gossip_Orks == FALSE)
	{
		AI_Output(self,other, " DIA_Vino_PERM_05_01 " );	// I could swear I saw an orc over there at the edge of the forest two days ago.
		AI_Output(self,other, " DIA_Vino_PERM_05_02 " );	// Since then, I've been sleeping with at least one eye open.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
		MIS_KILL_VINO_ORK = LOG_Running;
		Log_CreateTopic(TOPIC_VINO_KILL_ORK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_VINO_KILL_ORK,LOG_Running);
		B_LogEntry( TOPIC_VINO_KILL_ORK , " Peasant Wine is very afraid that an orc will come to the farm at night and kill him, so he can't sleep. " );
	}
	else if((Vino_Gossip_Bugs == FALSE) && (MIS_AndreHelpLobart == LOG_Running))
	{
		AI_Output(self,other, " DIA_Vino_PERM_05_03 " );	// These huge, disgusting insects have already got everyone. They are everywhere. They'll eat everything we've grown if we don't do something.
		AI_Output(self,other, " DIA_Vino_PERM_05_04 " );	// A few days ago, I was lying in the grass, thinking about my own thoughts, and was about to take a nap, when one of these creatures ate my shoe!
		AI_Output(self,other, " DIA_Vino_PERM_05_05 " );	// You should have seen how I fled. Since then, I have not been able to sleep peacefully.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Vino_PERM_05_06 " );	// Besides, did I already tell you? No.
	};
};


instance DIA_Vino_KAP3_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP3_EXIT_Condition;
	information = DIA_Vino_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

instance DIA_Vino_DMTAMSTART(C_Info)
{
	npc = BAU_952_Vino;
	nr = 31;
	condition = DIA_Vino_DMTAMSTART_Condition;
	information = DIA_Vino_DMTAMSTART_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_Vino_DMTAMSTART_Condition()
{
	if ((Chapter ==  3 ) && (hero.guild !=  GIL_KDF ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

var int DIA_Vino_DMTAMSTART_OneTime;

func void DIA_Vino_DMTAMSTART_Info()
{
	AI_Output(other,self, " DIA_Vino_DMTAMSTART_15_00 " );	// How are you doing?
	AI_Output(self,other, " DIA_Vino_DMTAMSTART_05_03 " );	// Those black-robed bastards are everywhere. Someone should stick their hoods down their throats.
};

instance DIA_Vino_Obesessed (C_Info)
{
	npc = BAU_952_Vino;
	nr = 32;
	condition = DIA_Vino_Obesessed_Condition;
	information = DIA_Vino_Obesessed_Info;
	permanent = TRUE;
	description = " What's wrong with you? " ;
};


func int DIA_Vino_Obessed_Condition()
{
	if ((NpcObsessedByDMT_Vino ==  FALSE ) && (Chapter >=  3 ) && (hero.guild ==  GIL_KDF ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DAY_Wine_Obesessed_Info()
{
	if (Npc_IsDead(DMT_Vino1) && Npc_IsDead(DMT_Vino2) && Npc_IsDead(DMT_Vino3) && Npc_IsDead(DMT_Vino4))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Vino_Obesessed_15_00 " );	// What's wrong with you?!
		AI_Output(self,other, " DIA_Vino_Obesessed_05_01 " );	// Damn, kill them...(growls) Or they'll kill me!
		AI_StopProcessInfos(self);
		DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE ;
		DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE ;
		DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE ;
		DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE ;
	};
};


instance DIA_Vino_Healing (C_Info)
{
	npc = BAU_952_Vino;
	nr = 55;
	condition = DIA_Vino_Heilung_Condition;
	information = DIA_Vino_Healing_Info;
	permanent = TRUE;
	description = " You're not yourself. " ;
};


func int DIA_Vino_Healing_Condition()
{
	if((NpcObsessedByDMT_Vino == TRUE) && (DarkPathStart == FALSE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Vino_Healing_oneTime;

func void DIA_Vino_Healing_Info()
{
	AI_Output(other,self, " DIA_Vino_Heilung_15_00 " );	// You're not yourself.
	AI_Output(self,other, " DIA_Vino_Heilung_05_01 " );	// My head... I can't take it anymore.
	if (DIA_Vino_Heilung_oneTime ==  FALSE )
	{
		AI_Output(other,self, " DIA_Vino_Heilung_15_02 " );	// You must go to the monastery. Pyrokar, the supreme firebender, can help you.
		AI_Output(self,other, " DIA_Vino_Heilung_05_03 " );	// Do you think? Good. I'll try.
		B_NpcClearObsessionByDMT(self);
		B_StartOtherRoutine(Vino,"Kloster");
		B_LogEntry( TOPIC_DEMENTOREN , " Wine is obsessed! I sent him to the monastery for treatment. I hope he can get there alive. " );
		B_GivePlayerXP(XP_VinoFreeFromDMT);
		DIA_Vino_Healing_oneTime = TRUE ;
	};
};


instance DIA_Vino_KAP4_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP4_EXIT_Condition;
	information = DIA_Vino_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_PERM4OBSESSED(C_Info)
{
	npc = BAU_952_Vino;
	nr = 41;
	condition = DIA_Vino_PERM4OBSESSED_Condition;
	information = DIA_Vino_PERM4OBSESSED_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Vino_PERM4OBSESSED_Condition()
{
	if((hero.guild == GIL_KDF) && (DarkPathStart == FALSE) && (NpcObsessedByDMT_Vino == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//Как ты?
	AI_Output(self,other, " DIA_Vino_PERM4OBSESSED_05_01 " );	// Yes, yes, everything is fine. I think the guys can help me. But I still feel pretty lousy.
	if(DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Vino_PERM4OBSESSED_05_02 " );	// But I have to admit, their wine is the best I've ever tasted.
		B_GivePlayerXP(XP_Ambient);
		DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE;
	};
};

instance DIA_Wine_PERM45UND6 (C_Info)
{
	npc = BAU_952_Vino;
	nr = 42;
	condition = DIA_Vino_PERM45UND6_Condition;
	information = DIA_Vino_PERM45UND6_Info;
	permanent = TRUE;
	description = " Any news? " ;
};

func int DIA_Vino_PERM45UND6_Condition()
{
	if ((Chapter >=  4 ) && (hero.guild !=  GIL_KDF ) && (NpcObsessedByDMT_Vino ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM45UND6_Info()
{
	AI_Output(other,self, " DIA_Vino_PERM45UND6_15_00 " );	// Any news?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Vino_PERM45UND6_05_01 " );	// It's just full of orcs here.
		AI_Output(self,other, " DIA_Vino_PERM45UND6_05_02 " );	// You paladins will finish them off, won't you?
	}
	else
	{
		AI_Output(self,other, " DIA_Vino_PERM45UND6_05_03 " );	// I'm afraid we'll soon have to leave our farm and join the mercenaries at Onar's farm.
	};
};


instance DIA_Vino_KAP5_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP5_EXIT_Condition;
	information = DIA_Vino_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Vino_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_KAP6_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP6_EXIT_Condition;
	information = DIA_Vino_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_KAP6_EXIT_Condition()
{
	if (chapter ==  6 )
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_PICKPOCKET(C_Info)
{
	npc = BAU_952_Vino;
	nr = 900;
	condition = DIA_Vino_PICKPOCKET_Condition;
	information = DIA_Vino_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Vino_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 60 );
};

func void DIA_Vino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
	Info_AddChoice(DIA_Vino_PICKPOCKET,Dialog_Back,DIA_Vino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vino_PICKPOCKET_DoIt);
};

func void DIA_Vino_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Vino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
};


instance DIA_WINE_KILLORK (C_Info) .
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = dia_vino_killork_condition;
	information = dia_wine_killork_info;
	permanent = FALSE;
	description = " I killed your orc. " ;
};

func int dia_vino_killork_condition()
{
	if(Npc_IsDead(OrcWarrior_Harad) && (MIS_KILL_VINO_ORK == LOG_Running) && (Npc_HasItems(other,itfo_addon_shnaps_orks) >= 1))
	{
		return TRUE;
	};
};

func void wine_day_killork_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Vino_KillOrk_01_01 " );	// I killed your orc.
	AI_Output(self,other, " DIA_Vino_KillOrk_01_02 " );	// (incredulously) Are you sure about that?
	AI_Output(other,self, " DIA_Vino_KillOrk_01_03 " );	// I have orc schnapps. You won't get this anywhere else, except from the orcs.
	B_GiveInvItems(other,self,itfo_addon_shnaps_orks,1);
	AI_Output(self,other, " DIA_Vino_KillOrk_01_04 " );	// Well, if that's the case, now I'll finally get a good night's sleep.
	AI_UseItem(self,itfo_addon_shnaps_orks);
	AI_Output(self,other, " DIA_Vino_KillOrk_01_05 " );	// Oh, how delicious! Thanks boy.
	AI_Output(other,self, " DIA_Vino_KillOrk_01_06 " );	// How about a little reward?
	AI_Output(self,other, " DIA_Vino_KillOrk_01_07 " );	// Well, you can pay for such a job. I, unfortunately, do not have gold, but there is one very rare plant.
	AI_Output(self,other,"DIA_Vino_KillOrk_01_08");	//Держи.
	B_GiveInvItems(self,other,ItPl_Temp_Herb,1);
	AI_Output(other,self, " DIA_Vino_KillOrk_01_09 " );	// Thank you.
	MIS_KILL_VINO_ORK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_VINO_KILL_ORK,LOG_SUCCESS);
	B_LogEntry( TOPIC_VINO_KILL_ORK , " Vino can now sleep peacefully. I killed his nightmare! " );
};
