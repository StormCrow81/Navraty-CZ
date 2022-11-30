
instance DIA_Gorax_Kap1_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap1_EXIT_Condition()
{
	if (chapter ==  1 )
	{
		return TRUE;
	};
};

func void DIA_Gorax_KAp1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gorax_NoEnter_PissOff(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_Gorax_NoEnter_PissOff_Condition;
	information = DIA_Gorax_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Gorax_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Gorax_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Gorax_PICKPOCKET(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 888;
	condition = DIA_Gorax_PICKPOCKET_Condition;
	information = DIA_Gorax_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Gorax_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gorax_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,Dialog_Back,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		CreateInvItems(self,ItKe_KlosterStore,1);
		B_GiveInvItems(self,other,ItKe_KlosterStore,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	}
	else
	{
		Print ( " Required Agility: 100 " );

		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
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

func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};


instance DIA_Gorax_HELP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_HELP_Condition;
	information = DIA_Gorax_HELP_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorax_HELP_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_HELP_Info()
{
	AI_Output(self,other, " DIA_Gorax_HELP_14_00 " );	// Can I help you with something?
};


instance DIA_Gorax_GOLD(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_GOLD_Condition;
	information = DIA_Gorax_GOLD_Info;
	permanent = TRUE;
	description = " I brought a whole lot of gold. " ;
};


var int DIA_Gorax_GOLD_perm;

func int DIA_Gorax_GOLD_Condition()
{
	if ((other.guild ==  GIL_NOV ) && (DIA_Gorax_GOLD_perm ==  FALSE ) && (Peter_NOV_Lost_InnosStatue_Daron ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gorax_GOLD_Info()
{
	AI_Output(other,self, " DIA_Gorax_GOLD_15_00 " );	// I brought a whole bunch of gold.
	if (Npc_HasItems(other,ItMy_Gold) >= Sum_Monasteries)
	{
		AI_Output(self,other, " DIA_Gorax_GOLD_14_01 " );	// (in anticipation) Ah! Offering to Innos. This is very good, my son.
		AI_Output(self,other, " DIA_Gorax_GOLD_14_02 " );	// I will use your donation for the good of the monastery, as Innos wishes.
		DIA_Gorax_GOLD_perm = TRUE;
		B_GiveInvItems(other,self,ItMi_Gold,Summe_Kloster);
	}
	else
	{
		AI_Output(self,other, " DIA_Gorax_Orlan_14_02 " );	// What did you do with that gold? Did you spend it? Leave and don't come back here without gold!
	};
};


instance DIA_Addon_Gorax_DaronsStatue(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Addon_Gorax_DaronsStatue_Condition;
	information = DIA_Addon_Gorax_DaronsStatue_Info;
	permanent = TRUE;
	description = " Here is the figurine that Daron was supposed to bring to the monastery. " ;
};


func int DIA_Addon_Gorax_DaronsStatue_Condition()
{
	if ((other.guild ==  GIL_NOV ) && (DIA_Gorax_GOLD_perm ==  FALSE ) && (Peter_NOV_Aufnahme_LostInnosStatue_Daron ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info()
{
	AI_Output(other,self, " DIA_Addon_Gorax_DaronsStatue_15_00 " );	// Here is the figurine that Daron was supposed to bring to the monastery.
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output(self,other, " DIA_Addon_Gorax_DaronsStatue_14_01 " );	// (sighs) It is truly amazing that an inexperienced novice would bring such a jewel to the monastery.
		AI_Output(self,other, " DIA_Addon_Gorax_DaronsStatue_14_02 " );	// This once again proves your aspiration in serving Innos.
		if(B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1))
		{
			Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		};
		AI_Output(self,other, " DIA_Addon_Gorax_DaronsStatue_14_03 " );	// I am indebted to you, young novice.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Gorax_DaronsStatue_14_04 " );	// Statuette? I don't see any statue. Bring it to me, and then I will believe your story.
	};
};


instance DIA_Gorax_SLEEP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 4;
	condition = DIA_Gorax_SLEEP_Condition;
	information = DIA_Gorax_SLEEP_Info;
	description = " I'm looking for a place to sleep. " ;
};


func int DIA_Gorax_SLEEP_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_SLEEP_Info()
{
	AI_Output(other,self, " DIA_Gorax_SLEEP_15_00 " );	// I'm looking for a place to sleep.
	AI_Output(self,other, " DIA_Gorax_SLEEP_14_01 " );	// There is one free bed in the next room. First door on the right, next to the entrance. You can sleep there.
	AI_Output(self,other, " DIA_Gorax_SLEEP_14_02 " );	// You can put your things in one of the empty chests.
	AI_Output(self,other, " DIA_Gorax_SLEEP_14_03 " );	// And remember, you can't enter the mages' bedrooms. You are also not allowed to enter the library without proper permission.
};


instance DIA_Gorax_Task (C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Task_Condition;
	information = DIA_Gorax_Task_Info;
	permanent = FALSE;
	description = " Do you have any task for me? " ;
};


func int DIA_Gorax_Task_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Task_Info()
{
	AI_Output(other,self, " DIA_Gorax_Aufgabe_15_00 " );	// Do you have any task for me?
	AI_Output(self,other, " DIA_Gorax_Aufgabe_14_01 " );	// Yes, the acolytes did a good job. And those who work well must eat well.
	AI_Output(self,other, " DIA_Gorax_Aufgabe_14_02 " );	// I'll give you the key to the pantry. You will find lamb sausage there. Give it to the novices - but share it justly!
	AI_Output(self,other, " DIA_Gorax_Aufgabe_14_03 " );	// And when you're done with this, you can contact me again.
	CreateInvItems(self,ItKe_KlosterStore,1);
	B_GiveInvItems(self,other,ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_Running;
	Log_CreateTopic(Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxEssen,LOG_Running);
	B_LogEntry(Topic_GoraxEssen, " Master Gorax wants me to share the mutton sausage from the pantry equally among the novices. Besides me, there are thirteen more novices in the monastery. " );
};


instance DIA_Gorax_Wurst (C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_Wurst_Condition;
	information = DIA_Gorax_Sausage_Info;
	permanent = TRUE;
	description = " I passed out sausage. " ;
};


func int DIA_Gorax_Wurst_Condition()
{
	if((MIS_GoraxEssen == LOG_Running) && (Mob_HasItems("WURSTTRUHE",ItFo_Schafswurst) == 0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wurst_Info()
{
	AI_Output(other,self, " DIA_Gorax_Wurst_15_00 " );	// I handed out the sausage.

	if (Sausage_Given >=  14 )
	{
		AI_Output(self,other, " DIA_Gorax_Wurst_14_01 " );	// And divided it fairly. Here, take these scrolls of healing and get back to your work.
		MIS_GoraxEssen = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxEssen);
		B_GiveInvItems(self,other,ItSc_LightHeal,2);
	}
	else
	{
		AI_Output(self,other, " DIA_Gorax_Wurst_14_02 " );	// Yes? I think you are not responsible enough for your work.
		AI_Output(self,other, " DIA_Gorax_Wurst_14_03 " );	// You either ate the sausage yourself, or you gave someone more than their due.
		AI_Output(self,other, " DIA_Gorax_Wurst_14_04 " );	// Look, since you're new - and for that reason alone - I'll forgive you for the first time. But so that this does not happen again, novice!
		MIS_GoraxEssen = LOG_FAILED;
	};
};


instance DIA_Gorax_Task2 (C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe2_Condition;
	information = DIA_Gorax_Task2_Info;
	permanent = FALSE;
	description = " Do you have another errand for me? " ;
};


func int DIA_Gorax_Aufgabe2_Condition()
{
	if (((MY_GoraxEssence ==  LOG_SUCCESS ) || (MY_GoraxEssence ==  LOG_FAILURE )) && (Npc_IsDead(Orlan) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Task2_Info()
{
	AI_Output(other,self, " DIA_Gorax_Aufgabe2_15_00 " );	// Do you have any other errands for me?
	AI_Output(self,other, " DIA_Gorax_Aufgabe2_14_01 " );	// Yes. As you know, we make excellent wine here, and we sell some of it.
	AI_Output(self,other, " DIA_Gorax_Aufgabe2_14_02 " );	// Orlan, the owner of the 'Dead Harpy' tavern, ordered a solid batch. We agreed on the amount of two hundred and forty gold coins.'
	AI_Output(self,other, " DIA_Gorax_Aufgabe2_14_03 " );	// Take these bottles to him - but don't let him shortchange you.
	B_GiveInvItems(self,other,ItFo_Wine,12);
	MIS_GoraxWein = LOG_Running;
	Log_CreateTopic(Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWein,LOG_Running);
	B_LogEntry(Topic_GoraxWein, " Master Gorax wants me to deliver twelve bottles of wine to Orlan, the innkeeper. They cost two hundred and forty gold pieces. " );
};


instance DIA_Gorax_Orlan(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Orlan_Condition;
	information = DIA_Gorax_Orlan_Info;
	permanent = TRUE;
	description = " I took the wine to Orlan. " ;
};

var int DAY_Gorax_Orlan_permanent;

func int DIA_Gorax_Orlan_Condition()
{
	if ((MIS_GoraxWine == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_Wine) && (DIA_Gorax_Orlan_permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Orlan_Info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		AI_Output(other,self, " DIA_Gorax_Orlan_15_00 " );	// I took the wine to Orlan.
		AI_Output(self,other, " DIA_Gorax_Orlan_14_01 " );	// And? Did you get two hundred and forty gold coins?
		DIA_Gorax_Orlan_permanent = TRUE ;
		Info_ClearChoices(DIA_Gorax_Orlan);
		Info_AddChoice(DIA_Gorax_Orlan, " He tricked me! (Give 100 coins) " ,DIA_Gorax_Orlan_100);
		Info_AddChoice(DIA_Gorax_Orlan, " I brought gold. (Give 240 coins) " ,DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output(self,other, " DIA_Gorax_Orlan_14_02 " );	// What did you do with that gold? Did you spend it? Leave and don't come back here without gold!
	};
};

func void DIA_Gorax_Orlan_100()
{
	AI_Output(other,self, " DIA_Gorax_Orlan_100_15_00 " );	// He fooled me!
	AI_Output(self,other, " DIA_Gorax_Orlan_100_14_01 " );	// Did you sell him wine cheaper? Oh no! And why did I send YOU?!
	AI_Output(self,other, " DIA_Gorax_Orlan_100_14_02 " );	// You're completely incapable of anything! Get out of my sight!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	MIS_GoraxWein = LOG_FAILED;
	Info_ClearChoices(DIA_Gorax_Orlan);
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_Orlan_240()
{
	AI_Output(other,self, " DIA_Gorax_Orlan_240_15_00 " );	// I brought gold.
	if(B_GiveInvItems(other,self,ItMi_Gold,240))
	{
		AI_Output(self,other, " DIA_Gorax_Orlan_240_14_01 " );	// Excellent. You show some ability. Here, take the Scroll of Healing as your reward. Now go and do something.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxWein);
	}
	else
	{
		AI_Output(self,other, " DIA_Gorax_Orlan_240_14_02 " );	// But you already spent some of that money, right? You're nothing - go away!
		MIS_GoraxWein = LOG_FAILED;
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	};
	Info_ClearChoices(DIA_Gorax_Orlan);
};

instance DIA_Gorax_Wineberrys(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Wineberrys_Condition;
	information = DIA_Gorax_Wineberrys_Info;
	permanent = FALSE;
	description = " Are there any more errands, master? " ;
};

func int DIA_Gorax_Wineberrys_Condition()
{
	if((MIS_GoraxWein == LOG_SUCCESS) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wineberrys_Info()
{
	AI_Output(other,self, " DIA_Gorax_Wineberrys_01_00 " );	// Any more errands, master?
	AI_Output(self,other, " DIA_Gorax_Wineberrys_01_01 " );	// Yes. It is necessary to harvest the grapes that we grow here in the monastery.
	AI_Output(self,other, " DIA_Gorax_Wineberrys_01_02 " );	// I need at least ten bunches. Take care of it, follower!
	MIS_GoraxWineberrys = LOG_Running;
	Log_CreateTopic(Topic_GoraxWineberrys,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWineberrys,LOG_Running);
	B_LogEntry(Topic_GoraxWineberrys, " Master Gorax asked me to harvest the grapes they grow at the monastery. He needs at least ten grapes. " );
};

instance DIA_Gorax_Wineberrys_Done(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Wineberrys_Done_Condition;
	information = DIA_Gorax_Wineberrys_Done_Info;
	permanent = FALSE;
	description = " I brought grapes. " ;
};

func int DIA_Gorax_Wineberrys_Done_Condition()
{
	if((MIS_GoraxWineberrys == LOG_Running) && (Npc_HasItems(hero,ITFO_WINEBERRYS) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wineberrys_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Gorax_Wineberrys_Done_01_00 " );	// I brought grapes.
	AI_Output(self,other, " DIA_Gorax_Wineberrys_Done_01_01 " );	// Great! Then, if you don't mind, I'll take it.
	AI_Output(other,self, " DIA_Gorax_Wineberrys_Done_01_02 " );	// Sure, master. Here he is.
	B_GiveInvItems(other,self,ITFO_WINEBERRYS,10);
	Npc_RemoveInvItems(self,ITFO_WINEBERRYS,10);
	AI_Output(self,other, " DIA_Gorax_Wineberrys_Done_01_03 " );	// Good work! I am sure that Innos will note your efforts for the benefit of our monastery.
	MIS_GoraxWineberrys = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_GoraxWineberrys,LOG_SUCCESS);
	B_LogEntry(Topic_GoraxWineberrys, " I brought grapes to Master Gorax. " );
};

instance DIA_Gorax_JOB(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 35;
	condition = DIA_Gorax_JOB_Condition;
	information = DIA_Gorax_JOB_Info;
	permanent = FALSE;
	description = " What are your duties here? " ;
};

func int DIA_Gorax_JOB_Condition()
{
	return TRUE;
};

func void DIA_Gorax_JOB_Info()
{
	AI_Output(other,self, " DIA_Gorax_JOB_15_00 " );	// What are your duties here?
	AI_Output(self,other, " DIA_Gorax_JOB_14_01 " );	// My duties are many and varied. I am not only the manager, but also the treasurer.
	AI_Output(self,other, " DIA_Gorax_JOB_14_02 " );	// In addition, I am in charge of the wine cellar, and also on my shoulders is the provision of food to the monastery.
	AI_Output(self,other, " DIA_Gorax_JOB_14_03 " );	// So if you need anything, you can always contact me and get everything you need - for a modest donation, of course.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader, " Master Gorax at the monastery can provide me with everything I need. " );
};


instance DIA_Gorax_TRADE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 99;
	condition = DIA_Gorax_TRADE_Condition;
	information = DIA_Gorax_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " I need something... " ;
};

func int DIA_Gorax_TRADE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Gorax_JOB) == TRUE) && Wld_IsTime(8,0,23,0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self, " DIA_Gorax_TRADE_15_00 " );	// I need something...
	B_GiveTradeInv(self);
};

instance DIA_Gorax_KDF(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 5;
	condition = DIA_Gorax_KDF_Condition;
	information = DIA_Gorax_KDF_Info;
	permanent = FALSE;
	description = " I need a place to sleep. " ;
};


func int DIA_Gorax_KDF_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KDF_Info()
{
	AI_Output(other,self, " DIA_Gorax_KDF_15_00 " );	// I need a place to sleep.
	AI_Output(self,other, " DIA_Gorax_KDF_14_01 " );	// We have a spare room to the right of here. Here, take the key. There you will find everything you might need.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	Wld_InsertItem(ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_Gorax_Kap2_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap3_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_KILLPEDRO(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_KILLPEDRO_Condition;
	information = DIA_Gorax_KILLPEDRO_Info;
	important = TRUE;
};


func int DIA_Gorax_KILLPEDRO_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL) || (hero.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KILLPEDRO_Info()
{
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_14_00 " );	// Wait, mercenary. I need to talk to you.
	AI_Output(other,self, " DIA_Gorax_KILLPEDRO_15_01 " );	// What do you want?
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_14_02 " );	// The monastery needs to solve a very delicate problem.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_14_03 " );	// At the moment, everyone doesn't seem to trust each other. And besides, this thing with Pedro, it's very... (swallows)
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_14_04 " );	// I have a commission for you from the high priests. You are not a member of the Brotherhood of Fire, and therefore you are the only one who can help us solve this problem.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_14_05 " );	// But I must warn you. If I give you this order, you will be obliged to carry it out. Once you know what it is, you will no longer have a choice. Do you understand this?
	Info_ClearChoices(DIA_Gorax_KILLPEDRO);
	Info_AddChoice(DIA_Gorax_KILLPEDRO, " Forget it. This is too risky for me. " ,DIA_Gorax_KILLPEDRO_nein);
	Info_AddChoice(DIA_Gorax_KILLPEDRO, " Tell me what you want. " ,DIA_Gorax_KILLPEDRO_ja);
};

func void DIA_Gorax_KILLPEDRO_nein()
{
	AI_Output(other,self, " DIA_Gorax_KILLPEDRO_nein_15_00 " );	// Forget it. It's too risky for me.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_nein_14_01 " );	// Okay, in that case, forget what I said.
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_KILLPEDRO_ja()
{
	AI_Output(other,self, " DIA_Gorax_KILLPEDRO_ja_15_00 " );	// Tell me what you want.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_ja_14_01 " );	// Good. Then listen carefully, I won't repeat myself twice.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_ja_14_02 " );	// Serpentes wants you to kill Pedro for his betrayal.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_ja_14_03 " );	// When you complete this task, you will be rewarded immediately.
	AI_Output(self,other, " DIA_Gorax_KILLPEDRO_ja_14_04 " );	// I didn't tell you anything. And you didn't hear anything. Clear?
	MIS_Gorax_KillPedro = LOG_Running;
	Log_CreateTopic(Topic_Gorax_KillPedro,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_Running);
	B_LogEntry(Topic_Gorax_KillPedro, " Gorax told me that Serpentes wants me to kill the traitor Pedro if I meet him. " );
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap4_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap5_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_ARMOR(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = dia_gorax_armor_condition;
	information = dia_gorax_armor_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_armor_condition()
{
	if(Npc_KnowsInfo(other,DIA_Gorax_JOB) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_armor_info()
{
	AI_Output(self,other, " DIA_Gorax_ARMOR_14_01 " );	// Greetings, brother! Since you are now one of us, I can offer you some special items. For example, this robe of the Fire Mages.
	AI_Output(self,other, " DIA_Gorax_ARMOR_14_01A " );	// She's a little better than the one Pyrokar gave you.
	AI_Output(self,other, " DIA_Gorax_ARMOR_14_02 " );	// True, you will have to make a small donation for our monastery.
	AI_Output(self,other, " DIA_Gorax_ARMOR_14_03 " );	// Contact me if you want to buy it.
};


instance DIA_GORAX_ARMOR01(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = dia_gorax_armor01_condition;
	information = dia_gorax_armor01_info;
	permanent = FALSE;
	description = " Sell my clothes. " ;
};


func int dia_gorax_armor01_condition()
{
	if(Npc_KnowsInfo(other,dia_gorax_armor) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_armor01_info()
{
	AI_Output(other,self, " DIA_Gorax_Armor01_15_01 " );	// Sell me a robe.
	AI_Output(self,other, " DIA_Gorax_Armor01_14_01 " );	// Trust me, you won't regret it.
	AI_Output(self,other, " DIA_Gorax_Armor01_14_02 " );	// Wait here, I have to fetch her from the basement.
	AI_GotoWP(self,"NW_MONASTERY_STAIRS_05");
	AI_GotoWP(self,"NW_MONASTERY_WINEMAKER_02");
	AI_GotoFP(self,"FP_STAND_GUARDING_WINE_01");
	AI_LookAtNpc(self,other);
	AI_Output(self,other, " DIA_Gorax_Armor01_14_03 " );	// Here she is. Look, is it really good?
};


var int gorax_kdflbought;

instance DIA_GORAX_KDFL (C_Info) .
{
	npc = KDF_508_Gorax;
	nr = 860;
	condition = dia_gorax_kdfl_condition;
	information = dia_gorax_kdfl_info;
	permanent = TRUE;
	description = " Buy a Fire Mage robe. (Price: 2500 coins) " ;
};


func int dia_gorax_kdfl_condition()
{
	if(Npc_KnowsInfo(other,dia_gorax_armor01) && (GORAX_KDFLBOUGHT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_kdfl_info()
{
	AI_Output(other,self, " DIA_Gorax_KDFL_15_01 " );	// Sell me this robe.

	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_KDF_M))
	{
		AI_Output(self,other, " DIA_Gorax_KDFL_12_01 " );	// Here, now it's yours.
		B_GiveInvItems(self,other,itar_kdf_m,1);
		GORAX_KDFLBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Gorax_KDFL_12_02 " );	// I'm sorry, but I can't give it to you for free.
	};
};


be int goraxmood;
var int goraxminprice;

instance DIA_GORAX_TRADEMEWINE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 860;
	condition = dia_gorax_trademewine_condition;
	information = dia_gorax_trademewine_info;
	permanent = FALSE;
	description = " Luthero sent me. " ;
};


func int dia_gorax_trademewine_condition()
{
	if(MIS_CHURCHDEAL == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gorax_trademewine_choices()
{
	Info_ClearChoices(dia_gorax_trademewine);
	Info_AddChoice(dia_gorax_trademewine,"По рукам!",dia_gorax_trademewine_deal);
	Info_AddChoice(dia_gorax_trademewine, " (view current trade price) " ,dia_gorax_trademewine_current);
	Info_AddChoice(dia_gorax_trademewine, " (view Gorax's mood) " ,dia_gorax_trademewine_mood);

	if(GORAXCURRENTPRICE > 50)
	{
		Info_AddChoice(dia_gorax_trademewine, " Bargain (up 10% from current price) " ,dia_gorax_trademewine_up10);
		Info_AddChoice(dia_gorax_trademewine, " Hag (up 5% from current price) " ,dia_gorax_trademewine_up5);
		Info_AddChoice(dia_gorax_trademewine, " Bargain (drop price by 10% of current price) " ,dia_gorax_trademewine_down10);
		Info_AddChoice(dia_gorax_trademewine, " Bargain (drop price by 5% of current price) " ,dia_gorax_trademewine_down5);
	};
};

func void dia_gorax_trademewine_info()
{
	GORAXCURRENTPRICE = 600;
	GORAXMOOD = 75 ;
	AI_Output(other,self, " DIA_Gorax_TradeMeWine_01_00 " );	// Luthero sent me. I have to buy a fresh batch of monastery wine from you.
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_01_04 " );	// The wine is already ready to ship. It remains only to find out how much the respected Mr. Luthero is willing to pay for it.
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_01_06 " );	// Hmmm. Well, I think six hundred gold coins should be enough...(cunningly)
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_01_07 " );	// What do you say?
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_up10()
{
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE + ((GORAXCURRENTPRICE * 10) / 100);
	GORAXMOOD = GORAXMOOD  + Hlp_Random( 20 );
	if(GORAXMOOD > 100)
	{
		GORAXMOOD = 100 ;
	};
	concatText = ConcatStrings( " Current wine price: " ,IntToString( GORAXCURRENTPRICE ));
	concatText = ConcatStrings(concatText, " gold coins " );
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_up5()
{
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE + ((GORAXCURRENTPRICE * 5) / 100);
	GORAXMOOD = GORAXMOOD  + Hlp_Random( 10 );
	if(GORAXMOOD > 100)
	{
		GORAXMOOD = 100 ;
	};
	concatText = ConcatStrings( " Current wine price: " ,IntToString( GORAXCURRENTPRICE ));
	concatText = ConcatStrings(concatText, " gold coins " );
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_nodeal()
{
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_NoDeal_01_00 " );	// Sorry, but I don't intend to bargain with you anymore.
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_NoDeal_01_01 " );	// To offer me such a price for wine - yes, it's just insulting!
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_NoDeal_01_02 " );	// Do you think I look like an idiot?
	AI_Output(self,other, " DIA_Gorax_TradeMeWine_NoDeal_01_05 " );	// So you can hand over to Luthero!
	; _ _ _ _ _ _
	GORAXSNOTRADEMEWINE = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gorax_trademewine_down10()
{
	var int currentmood;
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE - ((GORAXCURRENTPRICE * 10) / 100);
	currentmood = Hlp_Random(14);

	if(GORAXMOOD >= currentmood)
	{
		GORAXMOOD = GORAXMOOD - currentmood;
		concatText = ConcatStrings( " Current wine price: " ,IntToString( GORAXCURRENTPRICE ));
		concatText = ConcatStrings(concatText, " gold coins " );
		AI_Print(concatText);
		dia_gorax_trademewine_choices();
	}
	else
	{
		dia_gorax_trademewine_nodeal();
	};
};

func void dia_gorax_trademewine_down5()
{
	var int currentmood;
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE - ((GORAXCURRENTPRICE * 5) / 100);
	currentmood = Hlp_Random(7);
	if(GORAXMOOD >= currentmood)
	{
		GORAXMOOD = GORAXMOOD - currentmood;
		concatText = ConcatStrings( " Current wine price: " ,IntToString( GORAXCURRENTPRICE ));
		concatText = ConcatStrings(concatText, " gold coins " );
		AI_Print(concatText);
		dia_gorax_trademewine_choices();
	}
	else
	{
		dia_gorax_trademewine_nodeal();
	};
};

func void dia_gorax_trademewine_current()
{
	var string concatText;
	concatText = ConcatStrings( " Current wine price: " ,IntToString( GORAXCURRENTPRICE ));
	concatText = ConcatStrings(concatText, " gold coins " );
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_mood()
{
	var string concatText;

	if(GORAXMOOD >= 100)
	{
		concatText = " Horax's Mood: It couldn't get any better! " ;
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 90)
	{
		concatText = " Horax's Mood: Great " ;
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 80)
	{
		concatText = " Horax's Mood: Wonderful " ;
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 70)
	{
		concatText = " Horax's Mood: Good " ;
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 60)
	{
		concatText = " Horax's Mood: Upbeat " ;
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 50)
	{
		concatText = " Horax's Mood: Normal " ;
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 40)
	{
		concatText = " Gorax's Mood: Below Average " ;
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 30)
	{
		concatText = " Gorax's Mood: Unhappy " ;
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 20)
	{
		concatText = " Gorax's Mood: Bad " ;
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD >= 10)
	{
		concatText = " Horax's Mood: Lousy " ;
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD >= 5)
	{
		concatText = " Horax Mood: Terrible " ;
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD > 0)
	{
		concatText = " Horax's Mood: Critical! " ;
		AI_PrintClr(concatText,177,58,17);
	};

	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_deal()
{
	AI_Output(other,self, " DIA_Gorax_TradeMeWine_Deal_01_00 " );	// Deal! Here's your wine money.

	if(Npc_HasItems(hero,ItMi_Gold) >= GORAXCURRENTPRICE)
	{
		B_GiveInvItems(other,self,ItMi_Gold,GORAXCURRENTPRICE);
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_01 " );	// It's a pleasure doing business with you.
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_02 " );	// Here, take it - twenty-five bottles of the most excellent monastery wine with my best wishes for Mr. Luthero!
		B_GiveInvItems(self,other,ItFo_Wine,25);
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_03 " );	// Now, if you'll excuse me, it's time for me to get back to my daily routine.
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_05 " );	// May Innos be with you!
		B_LogEntry( TOPIC_CHURCHDEAL , " I bought wine from Gorax. Now I need to take it to Luthero. " );
		GORAXSTRADEMEWINE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_06 " );	// But you don't have enough gold!
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_07 " );	// Are you trying to trick me?
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_09 " );	// I won't let anyone lead me around!
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_10 " );	// So you can forget about our convention.
		AI_Output(self,other, " DIA_Gorax_TradeMeWine_Deal_01_11 " );	// I won't sell you wine. So you can pass on Luthero!
		B_LogEntry( TOPIC_CHURCHDEAL , " I negotiated the price of wine with Horax, but at the very last moment it turned out that I did not have enough money for this transaction. Horax thought that I wanted to fool him and refused to further discuss the purchase. I would have to tell Luthero this bad news. " );
		GORAXSNOTRADEMEWINE = TRUE;
		GORAXSNOTENOUGHTGOLD = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORAX_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = dia_gorax_runemagicnotwork_condition;
	information = dia_gorax_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_gorax_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Gorax_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other, " DIA_Gorax_RuneMagicNotWork_01_01 " );	// No, for some reason I can't use them!
	AI_Output(self,other, " DIA_Gorax_RuneMagicNotWork_01_03 " );	// Looks like other Firebenders have the same problem.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Fire Mages have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_GORAX_GoldForGorax(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_GORAX_GoldForGorax_condition;
	information = DIA_GORAX_GoldForGorax_info;
	permanent = FALSE;
	description = " I brought donations from Daron. " ;
};

func int DIA_GORAX_GoldForGorax_condition()
{
	if((MIS_DARON_GIVEGOLD == LOG_Running) && (Npc_HasItems(other,itmi_daron_suma) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GORAX_GoldForGorax_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_GORAX_GoldForGorax_01_00 " );	// I brought donations from Daron.
	AI_Output(self,other, " DIA_GORAX_GoldForGorax_01_01 " );	// Great! I've been waiting for them for a long time.
	AI_Output(other,self, " DIA_GORAX_GoldForGorax_01_02 " );	// Then take this bag. Here is all the gold that he managed to collect.
	B_GiveInvItems(other,self,itmi_daron_suma,1);
	Npc_RemoveInvItems(self,itmi_daron_suma,1);
	AI_Output(self,other, " DIA_GORAX_GoldForGorax_01_03 " );	// Well, judging by the weight, the amount here is decent.
	AI_Output(self,other, " DIA_GORAX_GoldForGorax_01_04 " );	// Thank you for helping us. May Innos light your path!
	B_LogEntry( TOPIC_DARON_GIVEGOLD , " I delivered the donation bag to Master Gorax. " );
	Log_CreateTopic(TOPIC_DARON_GIVEGOLD,LOG_SUCCESS);
	MIS_DARON_GIVEGOLD = LOG_SUCCESS;
};

var int COUNTER_GORAX_PAPERS;

instance DIA_GORAX_FIND_PAPERS(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = dia_gorax_find_papers_condition;
	information = dia_gorax_find_papers_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_find_papers_condition()
{
	if((GORAXSTRADEMEWINE == TRUE) && (MIS_GORAX_FIND_PAPERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_find_papers_info()
{
	AI_Output(self,other, " DIA_Gorax_Find_Papers_01_01 " );	// Wait. I want to ask you for one favor. You love gold, don't you?
	AI_Output(other,self, " DIA_Gorax_Find_Papers_01_02 " );	// Well, who doesn't love him.
	AI_Output(self,other, " DIA_Gorax_Find_Papers_01_03 " );	// Our monastery is famous for its wine throughout the island, and I am responsible for its preparation and quality.
	AI_Output(self,other, " DIA_Gorax_Find_Papers_01_04 " );	// Now I'm interested in rare wine recipes that can have a beneficial effect when consumed.
	AI_Output(self,other, " DIA_Gorax_Find_Papers_01_05 " );	// And, as I've learned, there are a couple of these recipes that can be obtained in the city now.
	AI_Output(other,self, " DIA_Gorax_Find_Papers_01_06 " );	// If I come across rare recipes, I will definitely bring them to you.
	AI_Output(self,other, " DIA_Gorax_Find_Papers_01_07 " );	// I'm counting on you. And of course, my gratitude will know no bounds.
	MIS_GORAX_FIND_PAPERS = LOG_Running;
	Log_CreateTopic(TOPIC_GORAX_FIND_PAPERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAX_FIND_PAPERS,LOG_Running);
	B_LogEntry( TOPIC_GORAX_FIND_PAPERS , " Master Gorax wants to learn how to make specialty wines. My job is to supply him with new recipes that I can find as I travel around the island. " );
};


instance DIA_GORAX_FIND_PAPERS_OK(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_GORAX_FIND_PAPERS_OK_condition;
	information = DIA_GORAX_FIND_PAPERS_OK_info;
	permanent = TRUE;
	important = FALSE;
	description = " I brought you wine recipes. " ;
};

func int DIA_GORAX_FIND_PAPERS_OK_condition()
{
	if((MIS_GORAX_FIND_PAPERS == LOG_Running) && ((Npc_HasItems(hero,rezepturen) >= 1) || (Npc_HasItems(hero,rezepturen2) >= 1) || (Npc_HasItems(hero,itwr_glintvein) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_GORAX_FIND_PAPERS_OK_info()
{
	AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_01 " );	// I brought you wine recipes.
	AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_02 " );	// Great! What exactly?

	if (Npc_HasItems(hero,recipes) >=  1 )
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_03 " );	// Here is the recipe for the balm of providence.
		B_GiveInvItems(other,self,recipes, 1 );
		Npc_RemoveInvItems(self,recipes, 1 );
		AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_04 " );	// Buying him back was not easy at all!
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_05 " );	// Balm? How interesting. It's not exactly wine, but still.
		COUNTER_GORAX_PAPERS += 1;

		if ((hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDM ) && (hero.guild !=  GIL_GUR ) && (hero.guild !=  GIL_KDW ))
		{
			AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_06 " );	// Here, take these magic scrolls as a reward. I'm sure they will be very useful to you.
			B_GiveInvItems(self,other,ItSc_Firestorm,2);
			B_LogEntry( TOPIC_GORAX_FIND_PAPERS , " I brought Gorax the recipe for 'Balm of Providence' wine and was rewarded with a couple of scrolls. Not bad, considering the recipes have already done me good. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_07 " );	// Here, take these mana potions as a reward. I'm sure they'll save your life one day when magical energy runs out.
			B_GiveInvItems(self,other,ItPo_Mana_02,3);
			B_LogEntry( TOPIC_GORAX_FIND_PAPERS , " I brought Gorax the recipe for 'Balm of Providence' wine and was rewarded with mana elixirs. Not bad, considering the recipes already did me good. " );
		};
	};
	if(Npc_HasItems(hero,rezepturen2) >= 1)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_08 " );	// Here is the recipe for the wine of oblivion.
		B_GiveInvItems(other,self,rezepturen2,1);
		Npc_RemoveInvItems(self,rezepturen2,1);
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_09 " );	// (thoughtfully) What a strange composition of ingredients.
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_10 " );	// It's unlikely we'll be able to cook this any time soon. But still, I thank you for your work.
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_11 " );	// Here, take this Fire Golem Summon Scroll as your reward.
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_12 " );	// Use it only when you feel strong enough, otherwise it might end badly.
		B_GiveInvItems(self,other,itsc_sumfiregol,1);
		COUNTER_GORAX_PAPERS += 1;
		B_LogEntry( TOPIC_GORAX_FIND_PAPERS , " I brought Gorax the recipe for 'Wine of Forgetfulness' and was rewarded with a fire golem summoning scroll. " );
	};
	if(Npc_HasItems(hero,itwr_glintvein) >= 1)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_13 " );	// This is a recipe for making mulled wine.
		B_GiveInvItems(other,self,itwr_glintvein,1);
		Npc_RemoveInvItems(self,itwr_glintvein,1);
		COUNTER_GORAX_PAPERS += 1;
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_14 " );	// (surprised) Where did you get it from?
		AI_Output(other,self, " DIA_Gorax_Find_Papers_Ok_01_15 " );	// It's a long story...
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_16 " );	// Well, while this may not be exactly what I want, I'll keep my word.
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_17 " );	// Keep your reward.
		B_GiveInvItems(self,other,ItMi_Gold,250);
		B_LogEntry( TOPIC_GORAX_FIND_PAPERS , " I brought Gorax the recipe for mulled wine. He wasn't overly impressed, but he gave me some gold for my trouble. " );
	};
	if(COUNTER_GORAX_PAPERS >= 3)
	{
		hero.lp = hero.lp + 1;
		AI_Print( " + 1 learning points " );
		Snd_Play("LevelUp");
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_19 " );	// Well, I guess now we have significantly expanded our range of wines, and we do not need other recipes for now.
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_20 " );	// I thank you on behalf of the monastery for your help.
		AI_Output(self,other, " DIA_Gorax_Find_Papers_Ok_01_21 " );	// And may Innos be with you!
		MIS_GORAX_FIND_PAPERS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GORAX_FIND_PAPERS,LOG_SUCCESS);
		B_LogEntry( TOPIC_GORAX_FIND_PAPERS , " I have fully completed Master Gorax's order, and he in turn blessed me with new achievements. " );
	};
};

instance DIA_Gorax_LoaParty(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_LoaParty_Condition;
	information = DIA_Gorax_LoaParty_Info;
	permanent = FALSE;
	description = " I need some special wine. " ;
};

func int DIA_Gorax_LoaParty_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_LoaParty_Info()
{
	AI_Output(other,self, " DIA_Gorax_LoaParty_01_01 " );	// I need some special wine.
	AI_Output(self,other, " DIA_Gorax_LoaParty_01_02 " );	// What do you mean?!
	AI_Output(self,other, " DIA_Gorax_LoaParty_01_03 " );	// All my wine is special, because it is made from the grape variety that grows only in our vineyards.
	AI_Output(other,self, " DIA_Gorax_LoaParty_01_04 " );	// You misunderstood me. By special, I meant the wine that you would not put up for sale, but would save for yourself.
	AI_Output(self,other, " DIA_Gorax_LoaParty_01_05 " );	// Ah, that's it. Hmmm... (thoughtfully) Yes, I think I have one such special copy.
	AI_Output(self,other, " DIA_Gorax_LoaParty_01_06 " );	// But you must understand that the price for it will be special.
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_07");	//Сколько?
	AI_Output(self,other, " DIA_Gorax_LoaParty_01_08 " );	// Two thousand gold coins! And if you do not have that kind of money, then it is better not to waste my and your time in vain.
	AI_Output(self,other, " DIA_Gorax_LoaParty_01_09 " );	// Anyway, I won't give it to you cheaper.
	B_LogEntry(TOPIC_LoaSecret, " Gorax can sell me a special wine. But it will cost me two thousand gold coins. " );
};

instance DIA_Gorax_LoaParty_Done(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_LoaParty_Done_Condition;
	information = DIA_Gorax_LoaParty_Done_Info;
	permanent = FALSE;
	description = " Keep your gold. " ;
};

func int DIA_Gorax_LoaParty_Done_Condition()
{
	if ((MY_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gorax_LoaParty) ==  TRUE ) && (MakeLoaParty ==  TRUE ) && (Npc_HasItems(other,ItMy_Gold) >  1000 )) ;
	{
		return TRUE;
	};
};

func void DIA_Gorax_LoaParty_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Gorax_LoaParty_Done_01_01 " );	// Keep your gold.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_Gorax_LoaParty_Done_01_02 " );	// Excellent... Now these two bottles of the most beautiful Everlus are yours!
	B_GiveInvItems(self,other,ItMi_LoaWine,2);
	AI_Output(other,self, " DIA_Gorax_LoaParty_Done_01_03 " );	// I hope it's worth the money.
	AI_Output(self,other, " DIA_Gorax_LoaParty_Done_01_04 " );	// Worth it, no doubt about it. You won't find better wine on this island.
	B_LogEntry(TOPIC_LoaSecret, " I bought expensive wine from Gorax for our picnic. " );
	LoaPartyWine = TRUE;

	if((LoaPartyWine == TRUE) && (LoaPartyFood == TRUE))
	{
		B_LogEntry(TOPIC_LoaSecret, " Now you can return to Loa and discuss with her the rest of the upcoming vacation. " );
	};

	AI_StopProcessInfos(self);
};
Footer
