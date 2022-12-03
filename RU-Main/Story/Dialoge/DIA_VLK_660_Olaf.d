
instance DIA_VLK_664_Masbo_EXIT(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 999;
	condition = DIA_VLK_664_Masbo_EXIT_Condition;
	information = DIA_VLK_664_Masbo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_664_Masbo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_664_Masbo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_664_Masbo_Hallo (C_Info)
{
	npc = VLK_664_Masbo;
	nr = 1;
	condition = DIA_VLK_664_Masbo_Hallo_Condition;
	information = DIA_VLK_664_Masbo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VLK_664_Masbo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_Hallo_Info()
{
	AI_Output(self,other, " DIA_VLK_664_Masbo_Hallo_01_00 " );	// Hey man! Do you want to fight?
};

instance DIA_VLK_664_Masbo_Intro (C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_Intro_Condition;
	information = DIA_VLK_664_Masbo_Intro_Info;
	permanent = FALSE;
	description = " What do you mean? " ;
};

func int DIA_VLK_664_Masbo_Intro_Condition()
{
	return TRUE;
};

func void DIA_VLK_664_Masbo_Intro_Info()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Intro_01_00 " );	// What do you mean?
	AI_Output(self,other, " DIA_VLK_664_Masbo_Intro_01_01 " );	// That you can make good money if you can work well with your fists.
	AI_Output(self,other, " DIA_VLK_664_Masbo_Intro_01_02 " );	// See those guys? So, these are the best fighters of Khorinis!
	AI_Output(self,other, " DIA_VLK_664_Masbo_Intro_01_03 " );	// If you can defeat any of them, you'll earn a huge pile of gold.
	AI_Output(other,self, " DIA_VLK_664_Masbo_Intro_01_04 " );	// Sounds good!
	AI_Output(self,other, " DIA_VLK_664_Masbo_Intro_01_05 " );	// Still! However, we have one rule: whoever wants to fight must first pay a small monetary contribution.
	AI_Output(self,other, " DIA_VLK_664_Masbo_Intro_01_06 " );	// Winner of the fight takes both bets. Well, the loser is left with nothing.
	AI_Output(other,self, " DIA_VLK_664_Masbo_Intro_01_07 " );	// And how much should I deposit?
	AI_Output(self,other, " DIA_VLK_664_Masbo_Intro_01_08 " );	// Just a hundred gold coins! So first think carefully before you decide to go into battle.
};

instance DIA_VLK_664_Masbo_Fight(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_Fight_Condition;
	information = DIA_VLK_664_Masbo_Fight_Info;
	permanent = TRUE;
	description = " I want to fight! " ;
};

func int DIA_VLK_664_Masbo_Fight_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_VLK_664_Masbo_Intro) ==  TRUE ) && (TavernFightEnd ==  FALSE ) && (TavernFightStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_Fight_Info()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_01_00 " );	// I want to fight.

	if ((OlafWin ==  FALSE ) || (GradenWin ==  FALSE ) || (BramWin ==  FALSE ) || (ValgardWin ==  FALSE ))
	{
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_01_01 " );	// Good! But first, pay the cash deposit.
		Info_ClearChoices(DIA_VLK_664_Masbo_Fight);
		Info_AddChoice(DIA_VLK_664_Masbo_Fight, " I don't have that much. " ,DIA_VLK_664_Masbo_Fight_NoGold);

		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Вот, держи.",DIA_VLK_664_Masbo_Fight_Gold);
		};
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,5);
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_01_02 " );	// You already beat everyone here! Nobody wants to fight you anymore.
		TaverneFightEnd = TRUE;
	};
};

func void DIA_VLK_664_Masbo_Fight_NoGold()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_NoGold_01_00 " );	// I don't have that much gold.
	AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_NoGold_01_01 " );	// Then find him! There will be no fight without an entry fee.
	AI_StopProcessInfos(self);
};

func void DIA_VLK_664_Masbo_Fight_Gold()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Gold_01_00 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Gold_01_01 " );	// Great! Then choose who you want to fight.
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	TaverneFightStart = TRUE;
	Info_ClearChoices(DIA_VLK_664_Masbo_Fight);

	if(OlafWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight, " Iron Fist Kurt. " ,DIA_VLK_664_Masbo_Fight_Olaf);
	};
	if (GradenWin ==  FALSE )
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight, " Sledgehammer Graden. " ,DIA_VLK_664_Masbo_Fight_Graden);
	};
	if(BramWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight, " Bram 'Savage'. " ,DIA_VLK_664_Masbo_Fight_Bram);
	};
	if(ValgardWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight, " Valgard 'Cherepolom'. " ,DIA_VLK_664_Masbo_Fight_Valgard);
	};
};

func void DIA_VLK_664_Masbo_Fight_Olaf()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Olaf_01_00 " );	// I want to fight 'Iron Fist' Kurt.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_01 " );	// Good! Then before you start, I will briefly explain the rules to you.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_02 " );	// First, before the fight, be sure to greet your opponent. We are so accepted!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_03 " );	// Second, you can only use your fists in combat!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_04 " );	// If you draw your weapon or use some kind of magic, then the fight will be over for you. And forever!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_05 " );	// Last but not least, you are fighting within this part of the tavern. Retreat further and consider that you lost the duel.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_06 " );	// Is everything clear to you?
		AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Olaf_01_07 " );	// It doesn't get any clearer.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_08 " );	// Great! Then step into the ring.
	Fight_Olaf = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFight");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Graden()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Graden_01_00 " );	// I want to fight 'Maulder' Graden.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_01 " );	// Good! Then before you start, I will briefly explain the rules to you.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_02 " );	// First, before the fight, be sure to greet your opponent. We are so accepted!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_03 " );	// Second, you can only use your fists in combat!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_04 " );	// If you draw your weapon or use some kind of magic, then the fight will be over for you. And forever!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_05 " );	// Last but not least, you are fighting within this part of the tavern. Retreat further and consider that you lost the duel.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_06 " );	// Is everything clear to you?
		AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Olaf_01_07 " );	// It doesn't get any clearer.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_08 " );	// Great! Then step into the ring.
	Fight_Graden = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_661_Graden,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Bram()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Bram_01_00 " );	// I want to fight 'The Savage' Brahm.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_01 " );	// Good! Then before you start, I will briefly explain the rules to you.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_02 " );	// First, before the fight, be sure to greet your opponent. We are so accepted!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_03 " );	// Second, you can only use your fists in combat!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_04 " );	// If you draw your weapon or use some kind of magic, then the fight will be over for you. And forever!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_05 " );	// Last but not least, you are fighting within this part of the tavern. Retreat further and consider that you lost the duel.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_06 " );	// Is everything clear to you?
		AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Olaf_01_07 " );	// It doesn't get any clearer.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_08 " );	// Great! Then step into the ring.
	Fight_Bram = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_662_Bram,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Valgard()
{
	AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Valgard_01_00 " );	// I want to fight 'Skull' Valgarde.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_01 " );	// Good! Then before you start, I will briefly explain the rules to you.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_02 " );	// First, before the fight, be sure to greet your opponent. We are so accepted!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_03 " );	// Second, you can only use your fists in combat!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_04 " );	// If you draw your weapon or use some kind of magic, then the fight will be over for you. And forever!
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_05 " );	// Last but not least, you are fighting within this part of the tavern. Retreat further and consider that you lost the duel.
		AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_06 " );	// Is everything clear to you?
		AI_Output(other,self, " DIA_VLK_664_Masbo_Fight_Olaf_01_07 " );	// It doesn't get any clearer.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other, " DIA_VLK_664_Masbo_Fight_Olaf_01_08 " );	// Great! Then step into the ring.
	Fight_Valgard = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

instance DIA_VLK_664_Masbo_FightEnd(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_FightEnd_Condition;
	information = DIA_VLK_664_Masbo_FightEnd_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_664_Masbo_FightEnd_Condition()
{
	if((FightCurrentWin == TRUE) || (FightCurrentLost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_FightEnd_Info()
{
	if(FightCurrentWin == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_VLK_664_Masbo_FightEnd_01_00 " );	// Congrats on your win, mate!
		AI_Output(self,other, " DIA_VLK_664_Masbo_FightEnd_01_01 " );	// Here, take your money.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else if(FightCurrentLost == TRUE)
	{
		AI_Output(self,other, " DIA_VLK_664_Masbo_FightEnd_01_02 " );	// Sorry buddy, but you lost.
		AI_Output(self,other, " DIA_VLK_664_Masbo_FightEnd_01_03 " );	// Your money went to the winner.
	};

	FightCurrentWin = FALSE;
	FightCurrentLost = FALSE;
	TaverneFightStart = FALSE;
	AI_StopProcessInfos(self);
};

// ------------------------------fighters----------------- ----------------------------------------------------

instance DIA_VLK_660_Olaf_EXIT(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 999;
	condition = DIA_VLK_660_Olaf_EXIT_Condition;
	information = DIA_VLK_660_Olaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_660_Olaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_660_Olaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_660_Olaf_GetOff(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 10;
	condition = DIA_VLK_660_Olaf_GetOff_condition;
	information = DIA_VLK_660_Olaf_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_660_Olaf_GetOff_Condition()
{
	if((Fight_Olaf == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_660_Olaf_GetOff_Info()
{
	if(OlafWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_660_Olaf_Fight(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 10;
	condition = DIA_VLK_660_Olaf_Fight_condition;
	information = DIA_VLK_660_Olaf_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_660_Olaf_Fight_Condition()
{
	if((Fight_Olaf == TRUE) && (Fight_Olaf_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_660_Olaf_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Olaf_Now = TRUE;
	Fight_Olaf = FALSE ;
	Info_ClearChoices(DIA_VLK_660_Olaf_Fight);
	Info_AddChoice(DIA_VLK_660_Olaf_Fight, " Let's fight! " ,DIA_VLK_660_Olaf_Fight_Now);
};

func void DIA_VLK_660_Olaf_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_661_Graden_EXIT (C_Info)
{
	npc = VLK_661_Graden;
	nr = 999;
	condition = DIA_VLK_661_Graden_EXIT_Condition;
	information = DIA_VLK_661_Graden_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_661_Graden_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_661_Graden_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_661_Degrees_GetOff (C_Info)
{
	npc = VLK_661_Graden;
	nr = 10;
	condition = DIA_VLK_661_Graden_GetOff_condition;
	information = DIA_VLK_661_Degrees_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_661_Graden_GetOff_Condition()
{
	if((Fight_Graden == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_661_Degrees_GetOff_Info()
{
	if(GradenWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_661_Graden_Fight(C_Info)
{
	npc = VLK_661_Graden;
	nr = 10;
	condition = DIA_VLK_661_Graden_Fight_condition;
	information = DIA_VLK_661_Graden_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_661_Graden_Fight_Condition()
{
	if((Fight_Graden == TRUE) && (Fight_Graden_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_661_Graden_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Graden_Now = TRUE;
	Fight_Graden = FALSE ;
	Info_ClearChoices(DIA_VLK_661_Graden_Fight);
	Info_AddChoice(DIA_VLK_661_Graden_Fight, " Let's fight! " ,DIA_VLK_661_Graden_Fight_Now);
};

func void DIA_VLK_661_Graden_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_662_Bram_EXIT(C_Info)
{
	npc = VLK_662_Bram;
	nr = 999;
	condition = DIA_VLK_662_Bram_EXIT_Condition;
	information = DIA_VLK_662_Bram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_662_Bram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_662_Bram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_662_Bram_GetOff(C_Info)
{
	npc = VLK_662_Bram;
	nr = 10;
	condition = DIA_VLK_662_Bram_GetOff_condition;
	information = DIA_VLK_662_Bram_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_662_Bram_GetOff_Condition()
{
	if((Fight_Bram == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_662_Bram_GetOff_Info()
{
	if(BramWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_662_Bram_Fight(C_Info)
{
	npc = VLK_662_Bram;
	nr = 10;
	condition = DIA_VLK_662_Bram_Fight_condition;
	information = DIA_VLK_662_Bram_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_662_Bram_Fight_Condition()
{
	if((Fight_Bram == TRUE) && (Fight_Bram_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_662_Bram_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Bram_Now = TRUE;
	Fight_Bram = FALSE;
	Info_ClearChoices(DIA_VLK_662_Bram_Fight);
	Info_AddChoice(DIA_VLK_662_Bram_Fight, " Let's fight! " ,DIA_VLK_662_Bram_Fight_Now);
};

func void DIA_VLK_662_Bram_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_663_Valgard_EXIT(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 999;
	condition = DIA_VLK_663_Valgard_EXIT_Condition;
	information = DIA_VLK_663_Valgard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_663_Valgard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_663_Valgard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_663_Valgard_GetOff(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 10;
	condition = DIA_VLK_663_Valgard_GetOff_condition;
	information = DIA_VLK_663_Valgard_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_663_Valgard_GetOff_Condition()
{
	if((Fight_Valgard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_663_Valgard_GetOff_Info()
{
	if(ValgardWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_663_Valgard_Fight(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 10;
	condition = DIA_VLK_663_Valgard_Fight_condition;
	information = DIA_VLK_663_Valgard_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_663_Valgard_Fight_Condition()
{
	if((Fight_Valgard == TRUE) && (Fight_Valgard_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_663_Valgard_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Valgard_Now = TRUE;
	Fight_Valgard = FALSE ;
	Info_ClearChoices(DIA_VLK_663_Valgard_Fight);
	Info_AddChoice(DIA_VLK_663_Valgard_Fight, " No matter what! " ,DIA_VLK_663_Valgard_Fight_Now);
};

func void DIA_VLK_663_Valgard_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
