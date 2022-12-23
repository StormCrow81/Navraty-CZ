

instance DIA_GORNABAR_EXIT(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 999;
	condition = dia_gornabar_exit_condition;
	information = dia_gornabar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornabar_exit_condition()
{
	return TRUE;
};

func void dia_gornabar_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_GORNABAR_HALLO (C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_hallo_condition;
	information = dia_gornabar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornabar_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornabar_hallo_info()
{
	B_TurnToNpc(other,self);
	AI_Output(other,self, " DIA_GorNaBar_Hallo_15_00 " );	// Hey! Do I know you? You are the guard who mined the saliva of crawlers in the old mine. But...
	AI_Output(other,self, " DIA_GorNaBar_Hallo_15_01 " );	// How did you get out of the Old Mine? I remember it crashed...
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_00 " );	// Ahh... I recognize you, crawler wrangler.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_01 " );	// It's a long story. Basically only the passage collapsed. The lower levels remained practically intact.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_02 " );	// The miners feared the worst, basically went hysterical. It was crazy.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_03 " );	// I hid in a corner and prayed - to all the gods, known and unknown to me.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_04 " );	// And someone heard my prayers.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_05 " );	// After the earthquake subsided and I managed to recover a little, I suddenly felt that a cool wind was blowing over me, coming from a narrow crevice in the blockage.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_06 " );	// A scroll of transformation into a meat bug helped me get out of that damned mine through it.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_08 " );	// Where have you been all this time?
	AI_Output(other,self, " DIA_GorNaBar_Hallo_15_02 " );	// Still on the run and fighting.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_09 " );	// Got it. Everything is the same as always.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_10 " );	// If you need something - contact us.
	AI_Output(other,self, " DIA_GorNaBar_Hallo_15_02A " );	// What exactly are you doing here?
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_10A " );	// I'm in charge of the Guardians and keep order here in the camp. If you have any problems, come to me.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_10B " );	// I can also sell you some items from our inventory.
	AI_Output(other,self, " DIA_GorNaBar_Hallo_15_03 " );	// Do you happen to have the scrolls of transforming into a meat bug? I did not see them in Khorinis.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_11 " );	// Among other things.
	AI_Output(other,self, " DIA_GorNaBar_Hallo_15_04 " );	// Where can I sleep here?
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_12 " );	// There is an empty bed in the far right tent.
	AI_Output(self,other, " DIA_GorNaBar_Hallo_09_13 " );	// You can rest there.
	b_heroknowforestbase();
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry( TOPIC_XBS , " Gor Na Bar is the commander of the Guardians in the forest camp. I can buy various goods from him. " );
	AI_StopProcessInfos(self);
};


var int gornabar_lastpetzcounter;
var int gonabar_lastpetzcrime;

instance DIA_GORNABAR_PMSCHULDEN(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 1;
	condition = dia_gornabar_pmschulden_condition;
	information = dia_gornabar_pmkrediten_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gornabar_pmschulden_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GORNABAR_SCHULDEN > 0) && (B_GetGreatestPetzCrime(self) <= GORNABAR_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_gornabar_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCOAST = 1;
	concatText = " You've been outlawed in the Netback camp! " ;
	AI_Print(concatText);
};

func void dia_gornabar_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCOAST = 1;
	concatText = " You've been outlawed in the Netback camp! " ;
	AI_Print(concatText);
};

func void dia_gornabar_pmschulden_info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_00 " );	// Before we discuss anything, we'll settle some issues with you.
	temp1 = 0 ;
	if(GLOBAL_COAST_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_COAST_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_COAST_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_COAST_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_COAST,tsettext2);
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_37 " );	// All the brothers in the camp are fed up with your cruelty.
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_38 " );	// And the only option to stop your antics is to kill you...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_39 " );	// Prepare to die!
		}
		else if(GLOBAL_COAST_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_COAST,tsettext2);
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_40 " );	// He's alone.
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_41 " );	// All the brothers in the camp are tired of your constant fighting.
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_42 " );	// And the only option to stop your antics is to kill you...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_43 " );	// Prepare to die!
		}
		else if(GLOBAL_COAST_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_COAST,tsettext2);
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_44 " );	// He's alone.
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_45 " );	// There is no place for thieves in our camp!
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_46 " );	// And the only option to stop your antics is to kill you...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_08_47 " );	// Prepare to die!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the forest brothers. Now they consider me a bandit! " );
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_pmschulden, " Wait...(it's time to leave) " ,dia_gornabar_pmschulden_attackmurder);
	}
	else
	{
		if (B_GetTotalPetzCounter(self) >  GORNABAR_LASTPETZCOUNTER )
		{
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_01 " );	// Over time, you've given us problems.
			diff = B_GetTotalPetzCounter(self) -  GORNABAR_LASTPETZCOUNTER ;
			if(diff > 0)
			{
				GORNABAR_DEBT = GORNABAR_DEBT  + (diff *  250 );
			};
			if ( GORNABAR_DEBT  <  1000 )
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_03 " );	// But I hope you make up for it all! 
			}
			else
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_04 " );	// I didn't expect this from you. The amount is...
			};
			AI_Output(other,self,"DIA_GorNaBar_PMAdd_15_00");	//How much?
			if ( GORNABAR_DEBT  <=  1000 )
			{
				B_Say_Gold(self,other,GORNABAR_SCHULDEN);
			}
			else
			{
				concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
				concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
				concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
				AI_Print(concattextschulden);
			};
		}
		else if(B_GetGreatestPetzCrime(self) < GORNABAR_LASTPETZCRIME)
		{
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_05 " );	// Found out a few new things.
			if(GORNABAR_LASTPETZCRIME == CRIME_MURDER)
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_06 " );	// Somehow no one ps accusing you of murder anymore.
				GLOBAL_COAST_MURDER = GLOBAL_COAST_MURDER - 1;
				if(GLOBAL_COAST_MURDER < 0)
				{
					GLOBAL_COAST_MURDER = 0;
				};
			};
			if((GORNABAR_LASTPETZCRIME == CRIME_THEFT) || ((GORNABAR_LASTPETZCRIME > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_07 " );	// No one remembers seeing you stealing.
				GLOBAL_COAST_THEFT = GLOBAL_COAST_THEFT - 1;
				if(GLOBAL_COAST_THEFT < 0)
				{
					GLOBAL_COAST_THEFT = 0;
				};
			};
			if((GORNABAR_LASTPETZCRIME == CRIME_ATTACK) || ((GORNABAR_LASTPETZCRIME > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_08 " );	// There are no more witnesses to your participation in the fight.
				GLOBAL_COAST_ATTACK = GLOBAL_COAST_ATTACK - 1;
				if(GLOBAL_COAST_ATTACK < 0)
				{
					GLOBAL_COAST_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_09 " );	// Apparently, the guys forgave you for everything you did.
			};
			AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_10 " );	// Be more discreet from now on?
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_11 " );	// And don't make any more trouble here!
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_12 " );	// We've had enough of that.
				GORNABAR_DEBT = 0 ;
				GORNABAR_LASTPETZCOUNTER = 0;
				GORNABAR_LASTPETZCRIME = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_13 " );	// To be clear: you must pay the full compensation.
				AI_Output(other,self,"DIA_GorNaBar_PMAdd_15_00A");	//How much?
				if ( GORNABAR_DEBT  <=  1000 )
				{
					B_Say_Gold(self,other,GORNABAR_SCHULDEN);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other, " DIA_GorNabar_PMSchulden_10_14 " );	// So what did you decide?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(dia_gornabar_pmschulden);
			Info_ClearChoices(dia_gornabar_petzmaster);
			Info_AddChoice(dia_gornabar_pmschulden, " I don't have enough gold! " ,dia_gornabar_petzmaster_paylater);
			Info_AddChoice(dia_gornabar_pmschulden, " How much do I have to pay? " ,dia_gornabar_pmschulden_howmuchagain);
			if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
			{
				Info_AddChoice(his_gonnabar_pmschulden, " No matter. " ,his_gonnabar_petzmaster_paynow);
			};
		};
	};
};

func void dia_gornabar_pmschulden_howmuchagain()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	AI_Output(other,self, " DIA_GorNabar_PMSchulden_HowMuchAgain_15_00 " );	// How much do I have to pay?
	if ( GORNABAR_DEBT  <=  1000 )
	{
		B_Say_Gold(self,other,GORNABAR_SCHULDEN);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(dia_gornabar_pmschulden);
	Info_ClearChoices(dia_gornabar_petzmaster);
	Info_AddChoice(dia_gornabar_pmschulden, " I don't have enough gold! " ,dia_gornabar_petzmaster_paylater);
	Info_AddChoice(dia_gornabar_pmschulden, " How much do I have to pay? " ,dia_gornabar_pmschulden_howmuchagain);
	if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
	{
		Info_AddChoice(his_gonnabar_pmschulden, " No matter. " ,his_gonnabar_petzmaster_paynow);
	};
};


instance DIA_GORNABAR_PETZMASTER(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 1;
	condition = dia_gornabar_petzmaster_condition;
	information = dia_gornabar_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gornabar_petzmaster_condition()
{
	if(B_GetGreatestPetzCrime(self) > GORNABAR_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_gornabar_petzmaster_info()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	GORNABAR_DEBT = 0 ;
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_00 " );	// Hey newbie! Why are you making trouble for us? You will have to settle this matter with me.
	};
	temp1 = 0 ;
	if(GLOBAL_COAST_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_COAST_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_COAST_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_COAST_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_COAST,tsettext2);
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_48 " );	// He's alone.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_49 " );	// All the brothers in the camp know you are a murderer.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_50 " );	// And the only option to stop you to kill you...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_51 " );	// Prepare to die!
		}
		else if(GLOBAL_COAST_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_COAST,tsettext2);
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_52 " );	// He's alone.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_53 " );	// All the brothers in the camp are tired of your constant fighting.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_54 " );	// And the only option to stop you is to kill you...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_55 " );	// Prepare to die!
		}
		else if(GLOBAL_COAST_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_COAST,tsettext2);
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_56 " );	// He's alone.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_57 " );	// There is no place for thieves in our camp!
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_58 " );	// And the only option to stop you is to kill you...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_08_59 " );	// Prepare to die!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the forest brothers. Now they consider me a bandit! " );
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_petzmaster, " Wait...(it's time to leave) " ,dia_gornabar_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_02 " );	// Cold blooded murder is the last thing we need here!
			GORNABAR_DEBT = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_COAST_THEFT + PETZCOUNTER_COAST_ATTACK) > 0)
			{
				AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_04 " );	// I don't even remember the rest of the things you did.
			};
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_06 " );	// You'll pay for the funeral and the afterparty booze.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_07 " );	// It won't fix what you've done, though, and you'll still have to answer to the gods for your crime.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_08 " );	// But this will at least reconcile everyone with the fact that you are still hanging around here.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_09 " );	// I heard you're into larceny?
			if(PETZCOUNTER_COAST_ATTACK > 0)
			{
				AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_10 " );	// In addition to other unpleasant things.
			};
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_11 " );	// Shouldn't have done that.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_12 " );	// We need to pay the guys some compensation to make amends!
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_13 " );	// Nobody likes fights - you know that? If you want to wave your fists, go to Khorinis.
			AI_Output(self,other, " DIA_GorNabar_PETZMASTER_10_15 " );	// You'll have to pay the guys for drinks! Maybe then they'll forget it.
			GORNABAR_DEBT = B_GetTotalPetzCounter(self) *  750 ;
		};
		AI_Output(other,self,"DIA_GorNabar_PETZMASTER_15_18");	//Сколько?
		if ( GORNABAR_DEBT  <=  1000 )
		{
			B_Say_Gold(self,other,GORNABAR_SCHULDEN);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_petzmaster, " I'm low on gold! " ,dia_gornabar_petzmaster_paylater);
		if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
		{
			Info_AddChoice(his_gornabar_petzmaster, " No matter. " ,his_gornabar_petzmaster_paynow);
		};
	};
};

func void dia_gornabar_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_GorNabar_PETZMASTER_PayNow_15_00");	//Fine!
	B_GiveInvItems(other,self,ItMi_Gold, GORNABAR_DEBT );
	AI_Output(self,other, " DIA_GorNabar_PETZMASTER_PayNow_10_01 " );	// Okay, then I'll calm the guys down. But don't do that again!
	B_GrantAbsolution(LOC_COAST);
	GORNABAR_DEBT = 0 ;
	GORNABAR_LASTPETZCOUNTER = 0;
	GORNABAR_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_gornabar_petzmaster);
	Info_ClearChoices(dia_gornabar_pmschulden);
};

func void dia_gornabar_petzmaster_paylater()
{
	AI_Output(other,self, " DIA_GorNabar_PETZMASTER_PayLater_15_00 " );	// I don't have enough gold!
	AI_Output(self,other, " DIA_GorNabar_PETZMASTER_PayLater_10_01 " );	// Then find some.
	AI_Output(self,other, " DIA_GorNabar_PETZMASTER_PayLater_10_02 " );	// And don't create more trouble - or else.
	GORNABAR_LASTPETZCOUNTER = B_GetTotalPetzCounter(self);
	GORNABAR_LASTPETZCRIME = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GORNABAR_SMITH(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_smith_condition;
	information = dia_gornabar_smith_info;
	permanent = FALSE;
	description = " Do you have a blacksmith here? " ;
};


func int dia_gornabar_smith_condition()
{
	return TRUE;
};

func void dia_gornabar_smith_info()
{
	AI_Output(other,self, " DIA_GorNaBar_Smith_15_00 " );	// Do you have a blacksmith here?
	if (Npc_IsDead(darrion) ==  FALSE )
	{
		AI_Output(self,other, " DIA_GorNaBar_Smith_01_01 " );	// Yes! Darrion from our camp.
		if(Npc_GetDistToWP(darrion,"WP_COAST_BASE_23") < 500)
		{
			AI_Output(self,other, " DIA_GorNaBar_Smith_01_02 " );	// He's over here.
		};
		AI_Output(self,other, " DIA_GorNaBar_Smith_01_03 " );	// He is here mostly in the evenings, but he lives and works in the mountains - he has a forge there.
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaBar_Smith_01_04 " );	// Darrion was a blacksmith for a while, but now there isn't one.
	};
};


instance DIA_GORNABAR_HEADILL(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 3;
	condition = dia_gornabar_headill_condition;
	information = dia_gornabar_headill_info;
	permanent = FALSE;
	description = " Have you ever had headaches? " ;
};


func int dia_gornabar_headill_condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void dia_gornabar_headill_info()
{
	AI_Output(other,self, " DIA_GorNaBar_HeadIll_15_00 " );	// Did you have headaches?
	AI_Output(self,other, " DIA_GorNaBar_HeadIll_01_00 " );	// At first, yes, bad ones. I attributed it to the consequences of working in the mine.
	AI_Output(self,other, " DIA_GorNaBar_HeadIll_01_01 " );	// But Netbek explained to me that it wass someone's dark sorcery.
	AI_Output(self,other, " DIA_GorNaBar_HeadIll_01_02 " );	// Here, in the camp, they disappeared and don't bother me anymore.
	AI_StopProcessInfos(self);
};


instance DIA_GORNABAR_SHIP(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_ship_condition;
	information = dia_gornabar_ship_info;
	permanent = FALSE;
	description = " Would you like to get out of here on a ship? " ;
};


func int dia_gornabar_ship_condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && Npc_KnowsInfo(other, dia_gornabar_hello))
	{
		return TRUE;
	};
};

func void dia_gornabar_ship_info()
{
	AI_Output(other,self, " DIA_GorNaBar_SHIP_15_00 " );	// Would you like to get out of here on a ship?
	AI_Output(self,other, " DIA_GorNaBar_SHIP_01_01 " );	// Not now! I'm starting to like this place.
	AI_Output(self,other, " DIA_GorNaBar_SHIP_01_02 " );	// I think that the forest will soon occupy the entire mine valley.
	AI_Output(self,other, " DIA_GorNaBar_SHIP_01_03 " );	// And then the orcs will leave here, leaving all their axes.
	AI_Output(other,self, " DIA_GorNaBar_SHIP_15_01 " );	// I really hope so!
	AI_Output(self,other, " DIA_GorNaBar_SHIP_01_04 " );	// Netback said stop waging wars - there will be peace in our valley!
	AI_Output(self,other, " DIA_GorNaBar_SHIP_01_05 " );	// And when you get tired of rushing about with a sword, come back here.
	AI_Output(self,other, " DIA_GorNaBar_SHIP_01_06 " );	// We are always glad to see you here.
};


instance DIA_GORNABAR_TRADE(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_trade_condition;
	information = dia_gornabar_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show your inventory. " ;
};


func int dia_gornabar_trade_condition()
{
	return TRUE;
};


var int gornabar_ow_map;
var int gornabararrowsday;

func void dia_gornabar_trade_info()
{
	var int newscmeatbug;
	where int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if((Kapitel >= 3) && (GORNABAR_ITEMSGIVEN_CHAPTER_3 == FALSE) && ((GORNABAR_ITEMSGIVEN_CHAPTER_2 == TRUE) || (GORNABAR_ITEMSGIVEN_CHAPTER_1 == TRUE)))
	{
		newscmeatbug = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	daynow = Wld_GetDay();

	if(GORNABARARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (GORNABARARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - GORNABARARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			GORNABARROWSDAY = debt;
		};
	};

	AI_Output(other,self, " DIA_GorNaBar_TRADE_15_00 " );	// Show me your wares.

	if(GORNABAR_OW_MAP == FALSE)
	{
		AI_Output(self,other, " DIA_GorNaBar_TRADE_09_02 " );	// You can buy a good map from me - it's more accurate than the ones in the castle.
		GORNABAR_OW_MAP = TRUE;
	};
	if(newscmeatbug == TRUE)
	{
		AI_Output(self,other, " DIA_GorNaBar_TRADE_09_01 " );	// Good news - I stumbled upon another scroll of transformation into a meat bug.
	};
	if((TplBelt_01 == FALSE) && (hero.guild == GIL_TPL))
	{
		CreateInvItems(self,ItBE_Addon_TPL_01,1);
		TplBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
};

