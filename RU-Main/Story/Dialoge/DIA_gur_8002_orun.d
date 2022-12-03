

instance DIA_EXIT_EXIT (C_Info) .
{
	npc = gur_8002_orun;
	nr = 999;
	condition = dia_baalorun_exit_condition;
	information = dia_running_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalorun_exit_condition()
{
	return TRUE;
};

func void load_exit_info()
{
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(other,self, " DIA_BaalOrun_exit_01_01 " );	// See you soon!
		AI_Output(self,other, " DIA_BaalOrun_exit_01_02 " );	// May the Sleeper enlighten you!
	};

	AI_StopProcessInfos(self);
};

instance DIA_PICKPOCKET ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 900;
	condition = DIA_BAALORUN_PICKPOCKET_Condition;
	information = DIA_BAALORUN_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_BAALORUN_PICKPOCKET_Condition()
{
	return  C_Robbery ( 49 , 35 );
};

func void DIA_BAALORUN_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BAALORUN_PICKPOCKET);
	Info_AddChoice(DIA_BAALORUN_PICKPOCKET,Dialog_Back,DIA_BAALORUN_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BAALORUN_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BAALORUN_PICKPOCKET_DoIt);
};

func void DIA_BAALORUN_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_BAALORUN_PICKPOCKET);
};

func void DIA_BAALORUN_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BAALORUN_PICKPOCKET);
};


var int baalorun_loadpetzcounter;
var int ballorun_loadcrime;

instance DIA_PRINTER_PMSCHULDEN ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_pmschulden_condition;
	information = dia_content_pmschildren_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_build_pmschild_condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( BAALORUN_SCHULDEN  >  0 ) && ( B_GetGreatestPetzCrime ( self ) <=  BAALORUN_LASTPETZCRIME ))
	{
		return TRUE;
	};
};

func void dia_baalorun_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORPSICAMP = 1;
	concatText = " The Brotherhood has outlawed you! " ;
	AI_Print(concatText);
};

func void dia_baalorun_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORPSICAMP = 1;
	concatText = " The Brotherhood has outlawed you! " ;
	AI_Print(concatText);
};

func void 2017_2018_pmschildren_info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_00 " );	// Before we discuss anything, we'll settle some issues with you.
	temp1 = 0 ;
	if(GLOBAL_PSICAMP_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_PSICAMP_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_PSICAMP_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_PSICAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_36 " );	// More precisely, he is alone... this question.
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_37 " );	// All the brothers in the camp are tired of your cruel murders.
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_38 " );	// And the only way to stop your antics with impunity is to kill you...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_39 " );	// Die, infidel!
		}
		else if(GLOBAL_PSICAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_40 " );	// More precisely, he is alone... this question.
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_41 " );	// All the brothers in the camp are tired of your constant fights.
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_42 " );	// And the only option to stop your antics with impunity is to kill you...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_43 " );	// Die, infidel!
		}
		else if(GLOBAL_PSICAMP_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_44 " );	// More precisely, he is alone... this question.
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_45 " );	// There is no place for thieves in our camp!
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_46 " );	// And the only option to stop your antics with impunity is to kill you...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_08_47 " );	// Die, infidel!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " My relationship with the Brotherhood has been damaged due to my constant outrages. Now they consider me a bandit there! " );
		Info_ClearChoices(dia_running_pmsshould);
		Info_ClearChoices(dia_baalorun_petzmaster);
		Info_AddChoice(dia_baalorun_pmschulden, " Wait... (it's time to leave) " ,dia_baalorun_pmschulden_attackmurder);
	}
	else
	{
		if ( B_GetTotalPetzCounter ( self ) >  B_GetTotalPetzCounter )
		{
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_01 " );	// You've given us problems lately.
			diff = B_GetTotalPetzCounter(self) -  BAALORUN_LASTPETZCOUNTER ;
			if(diff > 0)
			{
				BAALORUN_DUTIES = BAALORUN_DUTIES  + (diff *  250 );
			};
			if ( BAALORUN_DEBTS  <  1000 )
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_03 " );	// But I hope you make up for them all! In general, this...
			}
			else
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_04 " );	// I didn't expect this from you. The amount is...
			};
			AI_Output(other,self,"DIA_BaalOrun_PMAdd_15_00");	//Сколько?
			if ( BAALORUN_DEBTS  <=  1000 )
			{
				B_Say_Gold(self,other,BAALORUN_SCHULDEN);
			}
			else
			{
				concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
				concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
				concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
				AI_Print(concattextschulden);
			};
		}
		else if(B_GetGreatestPetzCrime(self) < BAALORUN_LASTPETZCRIME)
		{
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_05 " );	// Found out a few new things.

			if(BAALORUN_LASTPETZCRIME == CRIME_MURDER)
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_06 " );	// Somehow no one accuses you of murder anymore.
				GLOBAL_PSICAMP_MURDER = GLOBAL_PSICAMP_MURDER - 1;
				if(GLOBAL_PSICAMP_MURDER < 0)
				{
					GLOBAL_PSICAMP_MURDER = 0;
				};
			};
			if((BAALORUN_LASTPETZCRIME == CRIME_THEFT) || ((BAALORUN_LASTPETZCRIME > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_07 " );	// No one remembers seeing you while stealing.
				GLOBAL_PSICAMP_THEFT = GLOBAL_PSICAMP_THEFT - 1;
				if(GLOBAL_PSICAMP_THEFT < 0)
				{
					GLOBAL_PSICAMP_THEFT = 0;
				};
			};
			if((BAALORUN_LASTPETZCRIME == CRIME_ATTACK) || ((BAALORUN_LASTPETZCRIME > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_08 " );	// There are no more witnesses to your participation in the fight.
				GLOBAL_PSICAMP_ATTACK = GLOBAL_PSICAMP_ATTACK - 1;
				if(GLOBAL_PSICAMP_ATTACK < 0)
				{
					GLOBAL_PSICAMP_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_09 " );	// Apparently, the guys forgave you for everything you did.
			};
			AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_10 " );	// Do not go so far in your affairs!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_11 " );	// And don't make trouble here!
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_12 " );	// We've had enough of them lately.
				BAALORUN_DEBTS = 0 ;
				BAALORUN_LASTPETZCOUNTER = 0;
				BAALORUN_LASTPETZCRIME = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_13 " );	// To be clear: you must pay the full compensation!
				AI_Output(other,self,"DIA_BaalOrun_PMAdd_15_00A");	//Сколько?
				if ( BAALORUN_DEBTS  <=  1000 )
				{
					B_Say_Gold(self,other,BAALORUN_SCHULDEN);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other, " DIA_BaalOrun_PMSchulden_10_14 " );	// So what did you decide?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(dia_running_pmsshould);
			Info_ClearChoices(dia_baalorun_petzmaster);
			Info_AddChoice(dia_baalorun_pmschulden, " I don't have enough gold! " ,dia_baalorun_petzmaster_paylater);
			Info_AddChoice(dia_baalorun_pmschulden, " How much do I have to pay? " ,dia_baalorun_pmschulden_howmuchagain);
			if (Npc_HasItems(other,ItMi_Gold) >=  BAALORUN_SCHULDEN )
			{
				Info_AddChoice(dia_baalorun_pmschulden, " Я заплачу. " ,dia_baalorun_petzmaster_paynow);
			};
		};
	};
};

func void dia_baalorun_pmschulden_howmuchagain()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	AI_Output(other,self, " DIA_BaalOrun_PMSchulden_HowMuchAgain_15_00 " );	// How much do I have to pay?
	if ( BAALORUN_DEBTS  <=  1000 )
	{
		B_Say_Gold(self,other,BAALORUN_SCHULDEN);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(dia_running_pmsshould);
	Info_ClearChoices(dia_baalorun_petzmaster);
	Info_AddChoice(dia_baalorun_pmschulden, " I don't have enough gold! " ,dia_baalorun_petzmaster_paylater);
	Info_AddChoice(dia_baalorun_pmschulden, " How much do I have to pay? " ,dia_baalorun_pmschulden_howmuchagain);
	if (Npc_HasItems(other,ItMi_Gold) >=  BAALORUN_SCHULDEN )
	{
		Info_AddChoice(dia_baalorun_pmschulden, " Я заплачу. " ,dia_baalorun_petzmaster_paynow);
	};
};


instance DIA_BAALORUN_PETSMASTER ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_petzmaster_condition;
	information = dia_baalorun_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_petzmaster_condition()
{
	if(B_GetGreatestPetzCrime(self) > BAALORUN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void petzmaster_info()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	BAALORUN_DEBTS = 0 ;
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_00 " );	// Hey newbie. Why are you making trouble for us? You will have to settle this matter with me.
	};
	temp1 = 0 ;
	if(GLOBAL_PSICAMP_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_PSICAMP_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_PSICAMP_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_PSICAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_48 " );	// More precisely, he is alone... this question.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_49 " );	// All the brothers in the camp are tired of your cruel murders.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_50 " );	// And the only option to stop your antics with impunity is to kill you...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_51 " );	// Die, infidel!
		}
		else if(GLOBAL_PSICAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_52 " );	// More precisely, he is alone... this question.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_53 " );	// All the brothers in the camp are tired of your constant fights.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_54 " );	// And the only option to stop your antics with impunity is to kill you...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_55 " );	// Die, infidel!
		}
		else if(GLOBAL_PSICAMP_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_56 " );	// More precisely, he is alone... this question.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_57 " );	// There is no place for thieves in our camp!
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_58 " );	// And the only option to stop your antics with impunity is to kill you...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_08_59 " );	// Die, infidel!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " My relationship with the Brotherhood has been damaged due to my constant outrages. Now they consider me a bandit there! " );
		Info_ClearChoices(dia_running_pmsshould);
		Info_ClearChoices(dia_baalorun_petzmaster);
		Info_AddChoice(dia_baalorun_petzmaster, " Wait... (Time to get out) " ,dia_baalorun_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_02 " );	// Murder is the last thing we want to see here!
			BAALORUN_DEBT = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_PSICAMP_THEFT + PETZCOUNTER_PSICAMP_ATTACK) > 0)
			{
				AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_04 " );	// I don't even remember the rest of the things you did.
			};
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_06 " );	// You will pay for our brothers' funerals.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_07 " );	// This won't fix what you've done, and you'll have to answer to the gods for your crime.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_08 " );	// But this will at least reconcile everyone with the fact that you're still hanging around here.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_09 " );	// I heard you're into stealing?
			if(PETZCOUNTER_PSICAMP_ATTACK > 0)
			{
				AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_10 " );	// In addition to other unpleasant things.
			};
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_11 " );	// Shouldn't have done this.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_12 " );	// You will pay the fine for your crimes!
			BAALORUN_DEBT = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_13 " );	// Nobody likes fights - you know that? If you want to wave your fists, go to Khorinis.
			AI_Output(self,other, " DIA_BaalOrun_PetzMaster_10_15 " );	// You will have to pay for your crimes! Maybe then everyone will forget about them.
			BAALORUN_DEBT = B_GetTotalPetzCounter(self) *  750 ;
		};
		AI_Output(other,self,"DIA_BaalOrun_PetzMaster_15_18");	//Сколько?
		if ( BAALORUN_DEBTS  <=  1000 )
		{
			B_Say_Gold(self,other,BAALORUN_SCHULDEN);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(dia_running_pmsshould);
		Info_ClearChoices(dia_baalorun_petzmaster);
		Info_AddChoice(dia_baalorun_petzmaster, " I'm low on gold. " ,dia_baalorun_petzmaster_paylater);
		if (Npc_HasItems(other,ItMi_Gold) >=  BAALORUN_SCHULDEN )
		{
			Info_AddChoice(the_petzmaster, " No matter. " ,the_petzmaster_paynow);
		};
	};
};

func void dia_baalorun_petzmaster_paynow()
{
	AI_Output(other,self, " DIA_BaalOrun_PetzMaster_PayNow_15_00 " );	// I'll pay!
	B_GiveInvItems(other,self,ItMi_Gold, BAALORUN_DEBT );
	AI_Output(self,other, " DIA_BaalOrun_PetzMaster_PayNow_10_01 " );	// Okay, then I'll calm the brothers down. But don't do that again!
	B_GrantAbsolution(LOC_PSICAMP);
	BAALORUN_DEBTS = 0 ;
	BAALORUN_LASTPETZCOUNTER = 0;
	BAALORUN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_baalorun_petzmaster);
	Info_ClearChoices(dia_running_pmsshould);
};

func void dia_baalorun_petzmaster_paylater()
{
	AI_Output(other,self, " DIA_BaalOrun_PetzMaster_PayLater_15_00 " );	// I don't have much gold.
	AI_Output(self,other, " DIA_BaalOrun_PetzMaster_PayLater_10_01 " );	// Then find him as soon as possible.
	AI_Output(self,other, " DIA_BaalOrun_PetzMaster_PayLater_10_02 " );	// And don't create more trouble - we're not here to find them.
	BAALORUN_LASTPETZCOUNTER = B_GetTotalPetzCounter(self);
	BAALORUN_LASTPETZCRIME = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_NOTALK_HI ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_notalk_hi_condition;
	information = dia_content_notalk_hi_info;
	permanent = FALSE;
	important = FALSE;
	description = " Hi! I'm new here. " ;
};


func int dia_baalorun_notalk_hi_condition()
{
	if (( IDOLORAN_YES  ==  FALSE ) && ( MY_ORUNPACKET  !=  LOG_FAILED ) && ( other.guild ==  GIL_NONE ) && ( IDOLORAN_NO  ==  FALSE ))
	{
		return TRUE;
	};
};

func void load_info()
{
	AI_Output(other,self, " DIA_BaalOrun_NoTalk_Hi_15_00 " );	// Hello! I'm new here!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_02_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_NOTALK_SLEEPER ( C_Info ) .
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_notalk_sleeper_condition;
	information = dia_control_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = " May the Sleeper be with you! " ;
};


func int dia_baalorun_notalk_sleeper_condition()
{
	if (( IDOLORAN_YES  ==  FALSE ) && ( MY_ORUNPACKET  !=  LOG_FAILED ) && ( other.guild ==  GIL_NONE ) && ( IDOLORAN_NO  ==  FALSE ))
	{
		return TRUE;
	};
};

func void sleeper_info()
{
	AI_Output(other,self, " DIA_BaalOrun_NoTalk_Sleeper_15_00 " );	// May the Sleeper be with you!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_02_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_NOTALK_IMP(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_notalk_imp_condition;
	information = dia_control_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = " Is everything all right, buddy? " ;
};


func int dia_baalorun_notalk_imp_condition()
{
	if (( IDOLORAN_YES  ==  FALSE ) && ( MY_ORUNPACKET  !=  LOG_FAILED ) && ( other.guild ==  GIL_NONE ) && ( IDOLORAN_NO  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_baalorun_notalk_imp_info()
{
	AI_Output(other,self, " DIA_BaalOrun_NoTalk_Imp_15_00 " );	// Are you all right, mate?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_02_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_FIRST(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_first_condition;
	information = dia_running_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_first_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORUNHELPSHIP != LOG_Running) && ((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalorun_first_info()
{
	AI_Output(self,other, " DIA_BaalOrun_FIRST_01_00 " );	// What do you need?
};


instance DIA_BAALORUN_TASK (C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_task_condition;
	information = dia_baalorun_task_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_task_condition()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if(Npc_IsInState(self,ZS_Talk) && (hero.guild == GIL_NONE) && ((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalorun_task_info()
{
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_00 " );	// Wait... Where did you get the loincloth of an acolyte of our Brotherhood?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_01 " );	// You look like a seeker - a seeker of the true faith. Don't you feel the raging fire inside - that which keeps you awake at night?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_02 " );	// I see you are tormented by doubts - is there any truth in what the minions of false gods are trying to impose on you?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_03 " );	// And you know where these doubts come from. They all lie!
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_04 " );	// Don't you feel the longing for freedom? How does it grow stronger day by day, how does it guide your spirit? Release him!
	AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_05 " );	// You spoke to me. As I remember, this means that now I can also turn to you?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_06 " );	// You know our rules. It is commendable!
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_07 " );	// The rest of our brothers won't talk to you until you prove you can be trusted.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_08 " );	// And I spoke to you to give you a chance to prove yourself.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_09 " );	// If you prove yourself well in our eyes, then you can later join our Brotherhood. If you want, of course!
	AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_10 " );	// How can I prove my loyalty?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_11 " );	// I have a very delicate task for you.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_12 " );	// If you complete it, I think it will be enough for us to start trusting you.
	Info_ClearChoices(dia_baalorun_task);
	Info_AddChoice(dia_baalorun_aufgabe, " Okay. What should I do? " ,dia_baalorun_aufgabe_yes);
	Info_AddChoice(dia_baalorun_aufgabe, " Unfortunately, I don't have time for this. " ,dia_baalorun_aufgabe_no);
};

func void dia_baalorun_task_no()
{
	AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_13 " );	// Unfortunately, I don't have time for that.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_14 " );	// (sigh) Ah!
	IDOLORAN_NO = TRUE ;
	Info_ClearChoices(dia_baalorun_task);
	AI_StopProcessInfos(self);
};

func void dia_baalorun_task_yes()
{
	AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_15 " );	// Good. What I should do?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_16 " );	// I'll give you one thing. Here is the parcel. And you have to deliver it to one person.
	AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_17 " );	// Who is this person?
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_18_01 " );	// His name is Larius, he is the mayor of Khorinis. Although, while the paladins are in the city, it is not.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_19 " );	// Just give him this package - he knows everything else. You will find it in the city hall.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_22 " );	// After you give him the package, he will have to give you something for me too.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_23 " );	// Bring this thing to me. If you do everything right, you will earn our trust in you.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_24 " );	// And most importantly. Larius is a very suspicious person, and probably won't even listen to you if you arouse his suspicions.
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_25 " );	// Therefore, try to convince him that you are exactly the person I sent.
	if(PALGUARD == TRUE)
	{
		AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_26 " );	// How do I get past the guards at the town hall? Paladins won't let me see him.
		AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_27 " );	// Well, try to come up with something. Perhaps there is some way to bypass the guards or meet with Larius outside the walls of the town hall.
		AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_28 " );	// Here, take the package. And don't lose it.
	}
	else
	{
		AI_Output(other,self, " DIA_BaalOrun_Aufgabe_01_29 " );	// I got it.
		AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_30 " );	// That's good. Hold the package and be careful not to lose it.
	};
	B_GiveInvItems(self,other,itmi_drogenpocket,1);
	AI_Output(self,other, " DIA_BaalOrun_Aufgabe_01_31 " );	// Now go.
	Info_ClearChoices(dia_baalorun_task);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_400_Larius,"Start");
	Log_CreateTopic(TOPIC_ORUNPACKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORUNPACKET,LOG_Running);
	MIS_ORUNPACKET = LOG_Running;
	IDOLORAN_YES = TRUE ;
	B_LogEntry( TOPIC_ORUNPACKET , " I've agreed to help the Idol of Oran do a delicate job for him. I need to deliver a package to City Councilor Larius. And pick up what Larius will give me in return for the Idol of Oran. " );
};


instance DIA_BAALORUN_CONSENT (C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_approval_condition;
	information = dia_baalorun_approval_info;
	permanent = FALSE;
	description = " I delivered the package to Larius. " ;
};


func int dia_baalorun_approval_condition()
{
	if ((Npc_HasItems(other,itmi_lariusgoldpocket) >=  1 ) && ( MIS_ORUNPACKET  == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_baalorun_approval_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalOrun_Zustimmung_01_00 " );	// I gave the package to Larius. In return, he asked me to give you this amount.
	B_GiveInvItems(other,self,itmi_lariusgoldpocket, 1 );
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_BaalOrun_Zustimmung_01_01 " );	// I knew you wouldn't let me down. I had some problems?
		AI_Output(other,self, " DIA_BaalOrun_Zustimmung_01_02 " );	// Yes, nothing significant.
		AI_Output(self,other, " DIA_BaalOrun_Zustimmung_01_03 " );	// Good! You showed yourself from the very best side and proved that you can be trusted.
		AI_Output(self,other, " DIA_BaalOrun_Zustimmung_01_04 " );	// I'll tell our other brothers about you!
		AI_Output(self,other, " DIA_BaalOrun_Zustimmung_01_05 " );	// And if you have an intention to join us, then many of them will not refuse to help you with this!
	}
	else
	{
		AI_Output(self,other, " DIA_BaalOrun_Zustimmung_01_01 " );	// I knew you wouldn't let me down. I had some problems?
	};
	Log_SetTopicStatus(TOPIC_ORUNPACKET,LOG_SUCCESS);
	Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	B_LogEntry( TOPIC_ORUNPACKET , " I gave the bag to the Idol of Oran and thus earned his gratitude and the trust of the entire Brotherhood. " );
	MIS_ORUNPACKET = LOG_SUCCESS;
};


instance DIA_BACKGROUND (C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_nozustimmung_condition;
	information = dia_baalorun_noapproval_info;
	permanent = FALSE;
	description = " I was unable to deliver the package to Larius. " ;
};


func int dia_condition_reset()
{
	if(MIS_ORUNPACKET == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_builder_info()
{
	AI_Output(other,self, " DIA_BaalOrun_NoZustimmung_01_00 " );	// I couldn't deliver the package to Larius.
	AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_01 " );	// Why?
	if(LARIUSCANCELPACKET > 1)
	{
		AI_Output(other,self, " DIA_BaalOrun_NoZustimmung_01_02 " );	// He refused to take it, and then his guards almost made a chop out of me!
	}
	else
	{
		AI_Output(other,self, " DIA_BaalOrun_NoZustimmung_01_02A " );	// Uh... it so happened that...
	};

	AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_03 " );	// Where's my package?

	if(Npc_HasItems(other,itmi_drogenpocket) >= 1)
	{
		AI_Output(other,self, " DIA_BaalOrun_NoZustimmung_01_04 " );	// Oh, yes. Here, take it back.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_05 " );	// At least you managed not to lose it. How wrong I was that I entrusted YOU with this business!
		AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_06 " );	// You disappoint me greatly. Get out of my sight!
		IDOLOGY_YES = FALSE ;
		IDOLORAN_NOFOREVER = TRUE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	}
	else
	{
		AI_Output(other,self, " DIA_BaalOrun_NoZustimmung_01_07 " );	// I don't have one. I... uh... lost it.
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_08");	//ЧТО?
		AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_09 " );	// Are you taking me for an idiot?
		AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_10 " );	// You won't get away with this! Now you will die for your meanness!
		AI_Output(self,other, " DIA_BaalOrun_NoZustimmung_01_11 " );	// Die, infidel!
		IDOLOGY_YES = FALSE ;
		IDOLORAN_NOFOREVER = TRUE ;
		IDOLORAN_NOFOREVERKILL = TRUE ;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
		B_Attack(self,other,AR_GuardCalledToKill,1);
	};
};

instance DIA_BAALORUN_NOFOREVER(C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_noforever_condition;
	information = dia_baalorun_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IDOLORAN_NOFOREVER == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_noforever_info()
{
	if ( IDOLORAN_NOFOREVERKILL  ==  FALSE )
	{
		AI_Output(self,other, " DIA_BaalOrun_NoForever_01_00 " );	// Get out of my sight!
		IDOLORAN_NOFOREVER = TRUE ;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_BaalOrun_NoForever_01_01 " );	// Die, infidel!
		IDOLORAN_NOFOREVER = TRUE ;
		IDOLORAN_NOFOREVERKILL = TRUE ;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardCalledToKill,1);
	};
};


instance DIA_BAALORUN_JOINSECTS (C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_joinsekta_condition;
	information = dia_balorun_join_sector_info;
	permanent = FALSE;
	description = " You said I could join you. " ;
};


func int dia_build_join_sector_condition()
{
	if((hero.guild == GIL_NONE) && (MIS_ORUNPACKET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_builder_join_sector_info()
{
	AI_Output(other,self, " DIA_BaalOrun_JoinSekta_01_00 " );	// You said I could join you.
	AI_Output(self,other, " DIA_BaalOrun_JoinSekta_01_01 " );	// Now that you've helped us and proven your loyalty, you can rightfully ask for it.
	AI_Output(other,self, " DIA_BaalOrun_JoinSekta_01_02 " );	// Then accept me as a disciple of the Brotherhood!
	AI_Output(self,other, " DIA_BaalOrun_JoinSekta_01_03 " );	// I believe you are worthy of this honor.
	AI_Output(self,other, " DIA_BaalOrun_JoinSekta_01_04 " );	// Now you can join us at any time.
	AI_Output(self,other, " DIA_BaalOrun_JoinSekta_01_05 " );	// But remember: having put on the robe of our Brotherhood, you can no longer just take it off and renounce our faith.
	AI_Output(self,other, " DIA_BaalOrun_JoinSekta_01_06 " );	// So think carefully before making such a decision!
	Log_CreateTopic(TOPIC_PSICAMPJOIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_Running);
	CANJOINPSI = TRUE;
	B_LogEntry( TOPIC_PSICAMPJOIN , "The Idol of Oran has agreed to accept me into the Fellowship. " );
};


instance DIA_BAALORUN_SEKTAADVANTAGE (C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_sektaadvantage_condition;
	information = dia_baalorun_sektaadvantage_info;
	permanent = FALSE;
	description = " How will I benefit by joining you? " ;
};


func int dia_build_sectoradvantage_condition()
{
	if (( hero . guild ==  GIL_NONE ) && Npc_KnowsInfo ( other , dia_balorun_joins ) )
	{
		return TRUE;
	};
};

func void dia_builder_sectoradvantage_info()
{
	AI_Output(other,self, " DIA_BaalOrun_SektaAdvantage_01_00 " );	// What benefit will I get by joining you?
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_01 " );	// Do you doubt whether you are making the right choice? Let me explain something to you.
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_02 " );	// Although our Brotherhood does not already have the power and influence that it had during the existence of the Barrier...
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_03 " );	// ...however, we have not only preserved the wisdom and knowledge that the Sleeping One gave us, but also increased it!
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_04 " );	// Perhaps you will become one of the chosen ones - the Guru, and you will get the opportunity to learn the ancient magic, once revealed to us by the Sleepers.
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_05 " );	// Or you can be honored with the highest honor - to become a Guardian. Only the best of warriors can bear this title!
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_06 " );	// If fate wills, you can even combine both of these activities: the best of the Guardians also have magical knowledge.
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_07 " );	// As you can see, our Brotherhood will provide you with a lot of opportunities.
	AI_Output(self,other, " DIA_BaalOrun_SektaAdvantage_01_08 " );	// Think about what I told you before you decide to make your choice.
};


instance DIA_BAALORUN_TELLABOUT (C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellabout_condition;
	information = dia_baalorun_tellabout_info;
	permanent = FALSE;
	description = " Tell me about the Brotherhood. " ;
};


func int dia_baalorun_tellabout_condition()
{
	if ( ( other . guild ==  GIL_SEK ) && Npc_KnowsInfo ( other , dia_balorun_joinsect ) )
	{
		return TRUE;
	};
};

func void dia_baalorun_tellabout_info()
{
	AI_Output(other,self, " DIA_BaalOrun_TellAbout_01_01 " );	// Tell me about the Brotherhood.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_02 " );	// After the Sleeper, the demon we all mistakenly worship as our savior, was cast out of this world...
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_03 " );	// ...The Brotherhood is on the verge of total annihilation!
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_04 " );	// Most of our brothers have either died or gone insane. They literally went crazy, and almost did not look like people!
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_05 " );	// Those who still managed to save their lives and save their minds from madness went here to Khorinis...
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_06 " );	// ...in the hope of finding peace here and the opportunity to comprehend everything experienced.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_07 " );	// We established our small camp here, and began to spend time in search of true knowledge that can restore our peace of mind...
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_08 " );	// ...and help find a new way of knowing this world. And soon we succeeded.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_09 " );	// We have learned the right lessons from our knowledge in this area. Now we are trying to know the essence of what is happening in a different way.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_10 " );	// The essence of our new teaching is the disclosure of the hidden possibilities of your consciousness with the help of prolonged meditation.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_11 " );	// Naturally, the incense of marsh grass also helps us in this.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_12 " );	// Swamp relaxes the body and calms the mind, helps to focus on the main thing and contributes to the knowledge of the truth.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_13 " );	// Unfortunately, in these places it is much more difficult to find him than in those swamps where our Brotherhood used to be.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_14 " );	// But we also solved this problem. It turned out that he takes root well in these conditions.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_15 " );	// Of course, before smoking, it must be processed properly. This is exactly what our new novices are doing.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_16 " );	// We represent the Supreme Guild - Guru. The spirit of this camp lives in us. We are more experienced in controlling our subconscious and have a great knowledge of the truth.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_17 " );	// Guardians follow. Their strength is used in battles. Guardians are famous for their indomitable fortitude. DON'T get in their way!
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_18 " );	// They are led by Gor Na Kosh, the best of the Guardians of our Brotherhood.
	AI_Output(other,self, " DIA_BaalOrun_TellAbout_01_19 " );	// What about Kor Angar?
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_20 " );	// Unfortunately, we don't know where he is or what became of him. When that madness began during the fall of the Barrier, he was not in the camp.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_21 " );	// Maybe he's still alive. Probably no. If you suddenly meet him, then tell him that the Brotherhood is still alive and needs his help.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_22 " );	// The rest of our brothers are novices. Many of them are the ones you may have met in our swamp camp.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_23 " );	// But there are those who have already joined us here. Naturally, there are not many of them.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_24 " );	// They are usually sent here by Idol Parvez - he is constantly in the city in search of new recruits.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_25 " );	// It is not an easy job to see among the crowd a person capable of self-knowledge and ready to share our faith with us.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_26 " );	// If you meet him, talk to him.
	AI_Output(other,self, " DIA_BaalOrun_TellAbout_01_27 " );	// And if he doesn't want to talk to me?
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_28 " );	// Of course, he won't talk to you just like that - he doesn't know anything about you or the path you might choose.
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_29 " );	// Just give him this gift from me - I think he'll make an exception for you.
	B_GiveInvItems(self,other,itmi_specialjoint,1);
	AI_Output(self,other, " DIA_BaalOrun_TellAbout_01_30 " );	// Here, take this. I think that's all I could tell about our Brotherhood.
	AI_Output(other,self, " DIA_BaalOrun_TellAbout_01_31 " );	// Thank you sir.
	Log_CreateTopic(TOPIC_KORANGARMEET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KORANGARMEET,LOG_Running);
	MIS_KORANGAR = LOG_Running;
	; _ _ _ _ _ _
};


instance DIA_DIA_INFO (C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellkorangar_condition;
	information = dia_content_info;
	permanent = FALSE;
	description = " I found Kor Angar. " ;
};


func int dia_condition_condition()
{
	if(MIS_KORANGAR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void load_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_00 " );	// I found Kor Angar.
	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL) || (other.guild == GIL_SEK))
	{
		AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_01 " );	// What's wrong with him?
		if(ANGARISDEAD == TRUE)
		{
			AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_02 " );	// He's dead.
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_03 " );	// (horrified) Oh no! It can't be!
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_04 " );	// This is a huge loss for the Brotherhood and for all of us...
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_05 " );	// We'll have a hard time getting used to this idea.
		}
		else
		{
			AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_06 " );	// It's okay - he's alive. I met him in the Valley of Mines.
			AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_07 " );	// I told him about our Brotherhood, and I think he will join us again soon.
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_08 " );	// That's great news!
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_09 " );	// All brothers will rejoice at his return!
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_10 " );	// Here, take this as a reward for your labors.
			B_GiveInvItems(self,other,ItMi_Gold,200);
			ANGARCANBACK = TRUE;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_11 " );	// (questioning breath)
		if(ANGARISDEAD == TRUE)
		{
			AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_12 " );	// He's dead!
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_13 " );	// (sad sigh)
		}
		else
		{
			AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_14 " );	// And he's alive. I met him in the Valley of Mines.
			AI_Output(other,self, " DIA_BaalOrun_TellKorAngar_01_15 " );	// I told him about your Brotherhood, and I think he will join you again soon.
			AI_Output(self,other, " DIA_BaalOrun_TellKorAngar_01_16 " );	// (sigh of relief)
			ANGARCANBACK = TRUE;
		};
	};
};


instance DIA_BAALORUN_TELLPALADIN (C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellpaladin_condition;
	information = dia_baalorun_tellpaladin_info;
	permanent = FALSE;
	description = " I have one problem. " ;
};


func int dia_baalorun_tellpaladin_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_SEK)) && Npc_KnowsInfo(other,dia_baalorun_tellabout))
	{
		return TRUE;
	};
};

func void dia_baalorun_tellpaladin_info()
{
	AI_Output(other,self, " DIA_BaalOrun_TellPaladin_01_00 " );	// I have one problem.
	AI_Output(self,other, " DIA_BaalOrun_TellPaladin_01_01 " );	// What's the problem?
	AI_Output(other,self, " DIA_BaalOrun_TellPaladin_01_02 " );	// I need to speak to the paladin chief in town urgently. But the guards are unlikely to let me through to Lord Hagen.
	AI_Output(other,self, " DIA_BaalOrun_TellPaladin_01_03 " );	// Can you help me with this?
	AI_Output(self,other, " DIA_BaalOrun_TellPaladin_01_04 " );	// Why do you need it?
	AI_Output(other,self, " DIA_BaalOrun_TellPaladin_01_05 " );	// I have one very important message for him.
	AI_Output(self,other, " DIA_BaalOrun_TellPaladin_01_06 " );	// Hmm... Well, if it's that important to you...
	AI_Output(self,other, " DIA_BaalOrun_TellPaladin_01_07 " );	// As you have already understood, the Brotherhood has some influence and connections in the highest circles of the city's nobility.
	AI_Output(self,other, " DIA_BaalOrun_TellPaladin_01_08 " );	// And I think we will solve this problem if you become one of us - Guru or Guardian of the Brotherhood.
};


instance DIA_CANJOINPSI ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_canjoinpsi_condition;
	information = dia_user_canjoinpsi_info;
	permanent = TRUE;
	description = " I want to join the Brotherhood. " ;
};


func int dia_baalorun_canjoinpsi_condition()
{
	if((hero.guild == GIL_NONE) && (CANJOINPSI == TRUE) && (MIS_PSICAMPJOIN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void psi_info()
{
	AI_Output(other,self, " DIA_BaalOrun_CanJoinPsi_01_01 " );	// I want to join the Brotherhood.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_01_02 " );	// Is this your final decision? Are you sure you're ready to accept our faith?
	Info_ClearChoices(dia_baalorun_canjoinpsi);
	Info_AddChoice(dia_baalorun_canjoinpsi, " I changed my mind. " ,dia_baalorun_canjoinpsi_no);
	Info_AddChoice(dia_baalorun_canjoinpsi, " Yes, if you. " ,dia_baalorun_canjoinpsi_yes);
};

func void dia_baalorun_canjoinpsi_yes()
{
	AI_Output(other,self, " DIA_BaalOrun_CanJoinPsi_Yes_01_00 " );	// Yes, I'm ready.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_Yes_01_01 " );	// Good. I knew you would make the right choice and you did.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_Yes_01_02 " );	// Welcome to our Brotherhood!
	other.guild = GIL_SEK;
	Snd_Play("LEVELUP");
	CheckHeroGuild[0] = TRUE;

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_Yes_01_04 " );	// You're one of us now, brother.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_Yes_01_05 " );	// As an acolyte of the Brotherhood, you will have to perform certain duties in the camp.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_Yes_01_07 " );	// You can also come to me if you need my help.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_Yes_01_08 " );	// And now go and try to be useful in the name of our common faith!
	SLD_recording = LOG_OBSOLETE ;
	KDF_Recording = LOG_OBSOLETE ;
	MIL_recording = LOG_OBSOLETE ;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_SUCCESS;
	PSI_TALK = TRUE;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	B_LogEntry( TOPIC_PSICAMPJOIN , " I joined the Brotherhood. " );
	B_GivePlayerXP(500);
	Info_ClearChoices(dia_baalorun_canjoinpsi);
};

func void dia_baalorun_canjoinpsi_no()
{
	AI_Output(other,self, " DIA_BaalOrun_CanJoinPsi_No_01_00 " );	// I changed my mind.
	AI_Output(self,other, " DIA_BaalOrun_CanJoinPsi_No_01_01 " );	// I'm not rushing you with an answer. You can think about it for as long as you need.
	Info_ClearChoices(dia_baalorun_canjoinpsi);
};


instance DIA_BAALORUN_MAGICSYMBOLS(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_magicsymbols_condition;
	information = dia_baalorun_magicsymbols_info;
	permanent = FALSE;
	description = " What are these drawings on the bodies of all members of the Brotherhood? " ;
};


func int dia_baalorun_magicsymbols_condition()
{
	if(other.guild == GIL_SEK)
	{
		return TRUE;
	};
};

func void dia_baalorun_magicsymbols_info()
{
	AI_Output(other,self, " DIA_BaalOrun_MagicSymbols_01_00 " );	// What are these drawings on the body of all members of the Brotherhood?
	AI_Output(self,other, " DIA_BaalOrun_MagicSymbols_01_01 " );	// These are not drawings, but magical symbols that can protect their owner from magic.
	AI_Output(self,other, " DIA_BaalOrun_MagicSymbols_01_03 " );	// And since you're one of us now, you can wear them, just like the rest of our brothers.
	AI_Output(self,other, " DIA_BaalOrun_MagicSymbols_01_04 " );	// Talk to Acolyte Viran. He will help you with this.
	CANMAKESYMBOLS = TRUE;
};


instance DIA_THE_THE_THE_THE_THE_THE_THE_THE_THE_THE_THE_THE_THE_THE (C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellpaladinok_condition;
	information = dia_company_tellpaladinok_info;
	permanent = FALSE;
	description = " Help me get to Lord Hagen. " ;
};


func int dia_condition_condition()
{
	if(((other.guild == GIL_GUR) || (other.guild == GIL_TPL)) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void _info_info()
{
	if ( Npc_KnowsInfo ( other , this_builder_info ))
	{
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_00 " );	// Help me get to Lord Hagen.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_01 " );	// Well, since you're one of the brothers now, we'll try to solve your problem.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_02 " );	// You've already met with the mayor of Khorinis. I think he remembers you too.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_03 " );	// I'll arrange with him that supposedly you have an appointment with him at the town hall.
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_04 " );	// Do you think the guards will let me in?
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_05 " );	// I think so. To question the words of such a respected and high-ranking person as Larius is simply stupid.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_06 " );	// And for complete certainty, I will tell Larius some, so to speak, password...
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_07 " );	// ...which will give you access to the town hall itself. So the guards will understand that you are exactly the person that the mayor is waiting for.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_08 " );	// I think the word 'Uberion' is fine for this. Remember it!
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_09 " );	// I remember Master Uberion - the name of such a man is hard to forget.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_10 " );	// Good. Now go - I have a lot of other things to do.
	}
	else
	{
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_11 " );	// Help me get to Lord Hagen.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_12 " );	// (surprised) Why do you need this?
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_13 " );	// I have one very important message for him, but the guards are unlikely to let me through to him.
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_14 " );	// Can you help me with this?
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_15 " );	// Well, if it's that important to you...
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_16 " );	// As you have already understood, the Brotherhood has some influence and connections in the highest circles of the city's nobility.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_17 " );	// I think we'll find a way to help you with this issue.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_18 " );	// You've already met with the mayor of Khorinis. I think he remembers you too.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_19 " );	// I'll arrange with him that supposedly you have an appointment with him at the town hall.
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_20 " );	// Do you think the guards will let me in?
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_21 " );	// I think so. To question the words of such a respected and high-ranking person as Larius is simply stupid.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_22 " );	// And for complete certainty, I will tell Larius some, so to speak, password...
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_23 " );	// ...which will give you access to the town hall itself. So the guards will understand that you are exactly the person that the mayor is waiting for.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_24 " );	// I think the word 'Uberion' is fine for this. Remember it!
		AI_Output(other,self, " DIA_BaalOrun_TellPaladinOk_01_25 " );	// I remember Master Uberion - the name of such a man is hard to forget.
		AI_Output(self,other, " DIA_BaalOrun_TellPaladinOk_01_26 " );	// Good. Now go - I have a lot of other things to do.
	};
	LARIUSAWAITS = TRUE;
};


instance DIA_LORD_WATCH (C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_paladinwatch_condition;
	information = dia_battery_palacewatch_info;
	permanent = FALSE;
	description = " Do you have tasks for me? " ;
};


func int dia_battery_palacewatch_condition()
{
	if((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		return TRUE;
	};
};

func void dia_paladywatch_info()
{
	AI_Output(other,self, " DIA_BaalOrun_PaladinWatch_01_0A " );	// Do you have errands for me?
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_00 " );	// Good thing you asked.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_01 " );	// I have one extremely important task for you.
	AI_Output(other,self, " DIA_BaalOrun_PaladinWatch_01_02 " );	// What should I do?
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_04 " );	// You already know that a large band of paladins recently arrived in Khorinis.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_05 " );	// They are led by Lord Hagen, one of the highest ranking generals of their order.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_06 " );	// As you can imagine, the appearance of such a significant figure as Lord Hagen here is quite an unusual thing.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_07 " );	// According to the paladins themselves, the reason for their appearance on the island is due to the possible threat of an attack by Khorinis from the orcs.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_08 " );	// However, it is clear that the forces that Lord Hagen has here will not be enough to ensure proper defense of the city in the event of an attack.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_09 " );	// Also, Orcs are rumored to have overrun the mining colony. And I don't think that little band can get them out of there. Most likely the opposite will happen.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_10 " );	// Lord Hagen should have understood this, but if so...
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_11 " );	// ...then the paladins pursue completely different goals on the island than those they themselves tell everyone about.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_12 " );	// In connection with this incomprehensible situation, our Brotherhood cannot remain aloof from the events taking place here.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_13 " );	// After all, if the orc invasion of Khorinis is really not a myth, but a reality...
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_14 " );	// ...then our fate also depends on the development of further events.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_15 " );	// Therefore, it would be extremely useful and necessary for the Brotherhood to know the exact reason for the appearance of paladins on the island and to have information about a possible invasion of orcs in this part of the island.
	AI_Output(other,self, " DIA_BaalOrun_PaladinWatch_01_16 " );	// And you want me to know more about all this?
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_17 " );	// Yes, that's exactly what I want you to do.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_18 " );	// I need answers...
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_19 " );	// ...answers to questions on which our future fate depends.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_20 " );	// I understand that establishing the true causes of everything that is happening will not be an easy task at all. But we have no other choice.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_21 " );	// You yourself understand who is warned - he is armed.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_22 " );	// So, I'm interested in three questions...
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_23 " );	// First, why did the paladins come to Khorinis.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_34 " );	// Second - what is the situation in the Valley of the Mines and what is heard about the orc invasion.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_25 " );	// And finally, what will the paladins try to do in case of an attack on Khorinis.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_26 " );	// I'm counting on you and your success in this endeavor.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_27 " );	// If I were you, I'd try to get answers to these questions from Lord Hagen himself.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_28 " );	// Of course, he probably won't even talk to you, but it's still worth a try.
	AI_Output(other,self, " DIA_BaalOrun_PaladinWatch_01_29 " );	// Good. I'll try to find out everything I can.
	AI_Output(self,other, " DIA_BaalOrun_PaladinWatch_01_30 " );	// As soon as you know anything, let me know immediately.
	Log_CreateTopic(TOPIC_PALADINWATCH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PALADINWATCH,LOG_Running);
	MIS_PALADINWATCH = LOG_Running;
	B_LogEntry( TOPIC_PALADINWATCH , " Idol Oran wants to know why the paladins have come to Khorinis. He is worried that they hide the true reasons for their presence here. Idol Oran is also interested in the situation in the Valley of Mines, where the orc army is rumored to be located. " );
};


instance DIA_SPI_BERICHT ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_spybericht_condition;
	information = dia_baalorun_spymessage_info;
	permanent = TRUE;
	description = " I thought I should report back... " ;
};


func int dia_baalorun_spybericht_condition()
{
	if(MIS_PALADINWATCH == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_baalorun_spybericht_info()
{
	var int countnews;
	countnews = 0;
	AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_00 " );	// I thought I should announce my arrival...
	AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_01 " );	// Good! I want to be aware of everything that is happening.
	AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_02 " );	// What did you learn?
	if (( IDOLORANQUESTIONFULL  ==  TRUE ) && ( TELLORANQUESTIONONE  ==  FALSE ) && ( TELLORANQUESTIONTWO  ==  FALSE ) && ( TELLORANQUESTIONTHREE  ==  FALSE ) && ( TELLORANQUESTIONFOUR  ==  FALSE ) && ( TELLORANQUESTIONFIVE  ==  FALSE ))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_03 " );	// I managed to learn something about the reason for the appearance of paladins in Khorinis.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_04 " );	// Apparently, the order for their arrival on the island came from King Rhobar himself...
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_05 " );	// ...and, according to Lord Hagen himself, their mission is very important for the fate of the entire kingdom.
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_06 " );	// Continue...
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_07 " );	// The main reason the paladins came to this island is the magic ore.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_08 " );	// Without enough magic ore weapons, the king's army won't stand a chance against the orcs.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_09 " );	// The detachment that Lord Hagen sent to the Valley of Mines was to investigate the situation with the possibility of mining on the island.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_10 " );	// And after that, the paladins planned to go back to the mainland.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_11 " );	// The detachment that went to clarify the situation with the ore settled in the old castle of the barons.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_12 " );	// And they seem to be doing really badly.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_15 " );	// In addition, the orcs took the castle in the ring, surrounding the paladins from all sides.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_16 " );	// And recently the castle was attacked by dragons.
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_17 " );	// Dragons?
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_18 " );	// Yes. Garond sent me with a report to Lord Hagen to tell him everything that was going on there.
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_19 " );	// Did you hand it over to Lord Hagen?
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_20 " );	// Yes, I delivered the letter. He was very upset by all this.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_21 " );	// Now he has one headache - how to get his people out of the environment.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_22 " );	// Until he does, the paladins won't leave the island.
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_23 " );	// So, in case of an orc attack, - and, apparently, this will not be long to wait...
		AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_24 " );	// ...the paladins will stay on the island and protect Khorinis.
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_25 " );	// Good! I think what you have learned is enough to clarify the current situation.
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_26 " );	// (thoughtfully) All the news you brought paints a pretty dark picture. Sooner or later the orcs will show up here, and then...
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_27 " );	// The only good news is that the paladins will not leave Khorinis to be torn apart by the orcs, although by chance.
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_28 " );	// I have to thank you. You have rendered the Brotherhood an invaluable service!
		AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_30 " );	// Here, take this as a reward for your labors.
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		Log_SetTopicStatus(TOPIC_PALADINWATCH,LOG_SUCCESS);
		MIS_PALADINWATCH = LOG_SUCCESS;
		IDOLORANTEST = TRUE ;
	}
	else
	{
		if (( QUESTION IDOLOGY  ==  TRUE ) && ( QUESTION QUESTION  ==  FALSE ))
		{
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_36 " );	// I managed to learn something about the reason for the appearance of paladins in Khorinis.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_37 " );	// Apparently, the order for their arrival on the island came from King Rhobar himself...
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_38 " );	// ...and, according to Lord Hagen himself, their mission is very important for the fate of the entire kingdom.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_39 " );	// Anything else?
			TELLORANQUESTIONONE = TRUE;
			countnews = countnews + 1;
		};
		if (( TWO IDOLORANCE QUESTIONS  ==  TRUE ) && ( TWO TELLORANQUESTIONS  ==  FALSE ))
		{
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_40 " );	// The main reason the paladins came to this island is the magic ore.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_41 " );	// Without enough magic ore weapons, the king's army won't stand a chance against the orcs.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_42 " );	// The detachment that Lord Hagen sent to the Valley of Mines was to investigate the situation with the possibility of mining on the island.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_43 " );	// And after that, the paladins planned to go back to the mainland.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_44 " );	// (alarmed) Any more news?
			TELLORANQUESTIONTWO = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONTHREE == TRUE) && (TELLORANQUESTIONTHREE == FALSE))
		{
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_45 " );	// The detachment that went to clarify the situation with the ore settled in the old castle of the barons.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_46 " );	// And they seem to be doing really badly.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_48 " );	// In addition, the orcs took the castle in the ring, surrounding the paladins from all sides.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_49 " );	// And recently the castle was attacked by dragons.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_50 " );	// Dragons?
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_52 " );	// What else?
			TELLORANQUESTIONTHREE = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONFOUR == TRUE) && (TELLORANQUESTIONFOUR == FALSE))
		{
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_53 " );	// In general, the expedition to the Valley of Mines was a complete failure.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_54 " );	// Those ore deposits that are still available for mining, apparently, will not be able to meet the needs of the entire royal army.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_55 " );	// And the paladins suffered horrendous losses during this expedition.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_56 " );	// Garond sent me with a report to Lord Hagen to tell him about everything going on there.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_57 " );	// This business can't wait! Go to him immediately.
			TELLORANQUESTIONFOUR = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONFIVE == TRUE) && (TELLORANQUESTIONFIVE == FALSE))
		{
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_58 " );	// I delivered a letter to Lord Hagen. He was very upset by everything that happened!
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_59 " );	// Now he has one headache - how to get his people out of the environment.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_60 " );	// Until he does, the paladins won't leave the island.
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_61 " );	// So, in case of an orc attack, - and, apparently, this will not be long to wait...
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_62 " );	// ...the paladins will stay on the island and protect Khorinis.
			TELLORANQUESTIONFIVE = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONFULLCOMPLETE == TRUE) && (TELLORANQUESTIONONE == TRUE) && (TELLORANQUESTIONTWO == TRUE) && (TELLORANQUESTIONTHREE == TRUE) && (TELLORANQUESTIONFOUR == TRUE) && (TELLORANQUESTIONFIVE == TRUE))
		{
			B_GivePlayerXP(1000);
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_63 " );	// Good! I think what you have learned is enough to clarify the current situation.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_64 " );	// (thoughtfully) All the news you brought paints a pretty dark picture. Sooner or later the orcs will show up here, and then...
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_67 " );	// The only good news is that the paladins will not leave Khorinis to be torn apart by the orcs, although by chance.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_68 " );	// I have to thank you. You have rendered the Brotherhood an invaluable service!
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_71 " );	// Here, take this as a reward for your labors.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			Log_SetTopicStatus(TOPIC_PALADINWATCH,LOG_SUCCESS);
			MIS_PALADINWATCH = LOG_SUCCESS;
			IDOLORANTEST = TRUE ;
		}
		else if(countnews >= 1)
		{
			countnews = countnews * 100;
			B_GivePlayerXP(countnews);
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_72 " );	// So far this is all I've been able to find out.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_73 " );	// Good.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_74 " );	// Keep me updated.
		}
		else
		{
			AI_Output(other,self, " DIA_BaalOrun_SpyBericht_01_75 " );	// Nothing new yet.
			AI_Output(self,other, " DIA_BaalOrun_SpyBericht_01_76 " );	// Then why are you interrupting me?
		};
	};
};


instance DIA_CANBEGURU (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_running_canbeguru_condition;
	information = dia_user_canbeguru_info;
	permanent = FALSE;
	description = " Can I become a Guru like you? " ;
};

func int dia_condition_condition()
{
	if(hero.guild == GIL_SEK)
	{
		return TRUE;
	};
};

func void snow_info()
{
	AI_Output(other,self, " DIA_BaalOrun_CanBeGuru_01_00 " );	// Can I become a guru like you?
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_01 " );	// (surprised) Do you want to connect your lifeline with the sacred path of the guru?
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_02 " );	// It's too early for you to think about it.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_03 " );	// To become one of us, it is not enough just to wish for it.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_04 " );	// Wearing the robe of a guru is the greatest honor that only the chosen brothers can be bestowed!
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_05 " );	// And you are not one of them.
	AI_Output(other,self, " DIA_BaalOrun_CanBeGuru_01_06 " );	// What should be done for this?
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_07 " );	// If you really decide to follow this path to the end, then, first of all, you should know a few things.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_08 " );	// First, you must be firm in your faith.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_09 " );	// Anyone who doubts his beliefs is weak in spirit, and this is in no way acceptable in our case.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_10 " );	// The Sacred Circle of the Guru is the source of faith for our entire Brotherhood.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_11 " );	// Idols, with their wisdom, bring divine enlightenment into the minds of our brothers, and the latter should never doubt their rightness and power!
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_12 " );	// In addition, to become a Guru means to be ready for self-sacrifice for the sake of the Brotherhood.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_13 " );	// There are a few more points marked by the sacred path of the Guru, but they are not so significant compared to those that I have just listed.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_14 " );	// If you prove with them the firmness of your convictions and the strength of your spirit, then only then will you be able to enter our sacred Circle.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_15 " );	// Unfortunately, you are not yet ready for this, and your deeds for the glory of the Brotherhood are not so significant.
	AI_Output(self,other, " DIA_BaalOrun_CanBeGuru_01_16 " );	// But I think that time may come, and then, rest assured, we can talk about it.
	AI_Output(other,self, " DIA_BaalOrun_CanBeGuru_01_17 " );	// It's all clear to me, sir.
	CANBEGURU = TRUE;
};


instance DIA_FORTUNOBACK ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_fortunoback_condition;
	information = dia_conversion_fortunoback_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_condition_fortunoback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (FORTUNOBACK == TRUE) && (FORTUNOAWFLAG == TRUE))
	{
		return TRUE;
	};
};

func void load_fortunoback_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_00 " );	// I heard one of our former acolytes has returned to the camp.
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_01 " );	// I think his name is Fortuno.
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_02 " );	// He told what you did for him...
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_03 " );	// It was very right of you to help him.
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_04 " );	// Now the Brotherhood will take care of him.
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_05 " );	// His spirit is weakened and his strength is exhausted, but we will fix this situation. Our faith will help him rediscover himself!
	AI_Output(self,other, " DIA_BaalOrun_FortunoBack_01_06 " );	// For my part, I just want to thank you.
};


instance DIA_BAALORUN_HAMMERBACK(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_hammerback_condition;
	information = dia_baalorun_hammerback_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_hammerback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (GORNAKOSHTEST == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_hammerback_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_BaalOrun_HammerBack_01_00 " );	// Gor Na Kosh told me that you brought him the Hammer of Tarakoth.
	AI_Output(self,other, " DIA_BaalOrun_HammerBack_01_01 " );	// I'm really surprised you managed to do this!
	AI_Output(self,other, " DIA_BaalOrun_HammerBack_01_02 " );	// The Brotherhood has long wanted to get their hands on this ancient artifact.
	AI_Output(self,other, " DIA_BaalOrun_HammerBack_01_03 " );	// And now, thanks to you, we have it!
	AI_Output(self,other, " DIA_BaalOrun_HammerBack_01_04 " );	// Your deeds do you credit.
	AI_Output(self,other, " DIA_BaalOrun_HammerBack_01_05 " );	// On behalf of our entire Brotherhood, accept my thanks!
};


instance DIA_BACKGROUND_SECTION (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sekteheilen_condition;
	information = dia_second_info;
	permanent = FALSE;
	description = " What do you know about people in black cassocks? " ;
};


func int dia_build_sequence_condition()
{
	if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && (Chapter >=  3 ))
	{
		return TRUE;
	};
};

func void dia_baalorun_sekteheilen_info()
{
	AI_Output(other,self, " DIA_BaalOrun_SekteHeilen_01_00 " );	// What do you know about people in black cassocks?
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_01 " );	// Not very many. Apparently, they are all dark magicians.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_02 " );	// But their true origin is unknown to me.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_03 " );	// However, sometimes it seems to me that the Brotherhood has some invisible connection with some of them... (thoughtfully)
	AI_Output(other,self, " DIA_BaalOrun_SekteHeilen_01_04 " );	// What do you mean?
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_05 " );	// Many of our brothers started having severe headaches.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_06 " );	// I can't explain what this is about.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_07 " );	// But, I'm afraid that the pernicious influence of these creatures is somehow reflected in their subconscious.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_08 " );	// And I think it all looks very much like an obsession.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_09 " );	// Is there anything we can do about this?
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_10 " );	// The wisdom and power of the Idols still allows us to slightly mitigate the consequences of these contacts, but it is not known how long we ourselves will last.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_11 " );	// Perhaps there is some other way to get rid of this influence.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_12 " );	// I heard that there is a potion in the Fire Mage Monastery that can cure possession.
	AI_Output(other,self, " DIA_BaalOrun_SekteHeilen_01_13 " );	// I'll try to get it.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_14 " );	// Oh, that would be great!
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_15 " );	// I would take care of this problem myself, but all my free time is spent on alleviating the lot of our Brothers.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilen_01_16 " );	// Please hurry up with your searches.
	Log_CreateTopic(TOPIC_SEKTEHEILEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SEKTEHEILEN,LOG_Running);
	MIS_SKTHEILEN = LOG_Running;
	B_LogEntry( TOPIC_SEKTEHEILEN , " The Idol of Oran is concerned about the appearance of magicians in Khorinis in black cloaks. They are somehow connected with the Brotherhood. With the appearance of these magicians, the novices began to suffer severe headaches. The idol is afraid that these are the first signs of possession. He asked me to go to the monastery to the magicians of Fire, where there is a remedy against this infection. " );
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_SECTION (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sekteheilengot_condition;
	information = dia_balorun_sector_info;
	permanent = FALSE;
	description = " I got this potion. " ;
};


func int dia_build_sector_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && (FIRSTGIVEHEALPOTIONS == TRUE))
	{
		return TRUE;
	};
};

func void dia_sector_info()
{
	AI_Output(other,self, " DIA_BaalOrun_SekteHeilenGot_01_00 " );	// I got this potion.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilenGot_01_01 " );	// Very good! Now it must be distributed to all novices.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilenGot_01_02 " );	// But only them! Gor Na Kosh and his Guardians are very strong in spirit. They are not afraid of this infection, just like us - the Guru.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilenGot_01_03 " );	// And make sure there's enough medicine for everyone.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilenGot_01_04 " );	// When you've done this, come to me.
	B_LogEntry( TOPIC_SEKTEHEILEN , " I got the medicine. Now it needs to be distributed to all the novices. " );
	SECTEHEILENCOUNT = 0 ;
};


instance DIA_BAALORUN_SECTION (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sekteheilenok_condition;
	information = dia_balorun_sector_info;
	permanent = FALSE;
	description = " I distributed the medicine as you requested. " ;
};


func int dia_build_sector_condition()
{
	if((MIS_SEKTEHEILEN == LOG_Running) && (SEKTEHEILENCOUNT >= 15))
	{
		return TRUE;
	};
};

func void dia_builder_sector_info()
{
	B_GivePlayerXP(2150);
	AI_Output(other,self, " DIA_BaalOrun_SekteHeilenOk_01_00 " );	// I distributed the medicine, just like you asked.
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilenOk_01_02 " );	// Yes, very good. His action has truly delivered all of our brethren from those terrible headaches!
	AI_Output(self,other, " DIA_BaalOrun_SekteHeilenOk_01_03 " );	// You did a good job! Please accept my thanks.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	B_LogEntry( TOPIC_SEKTEHEILEN , " I have distributed the medicine to all the acolytes. Now the brothers will no longer suffer from the influence of the dark magicians! " );
	Log_SetTopicStatus(TOPIC_SEKTEHEILEN,LOG_SUCCESS);
	MIS_SEKTEHEILEN = LOG_SUCCESS ;
};


instance DIA_CONTROLLER (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_beguru_condition;
	information = dia_processing_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_condition_uncertainty()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( hero . guild ==  GIL_SEK ) && ( CANBEGURU  ==  TRUE ) && ( CADARAGREED  ==  TRUE ) && ( NAMIBAGREED  ==  TRUE ) && ( PARVEZAGREED  ==  TRUE ) && ( TYONAGREED  ==  TRUE ))
	{
		return TRUE;
	};
};

func void load_info()
{
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_00 " );	// Are you there? Very well - I have to talk to you...
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_02 " );	// By your actions, you have proven your loyalty to the ideas of our Brotherhood, and even more.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_03 " );	// Your deeds speak for themselves: you are firm in spirit, true to your convictions and prudent in your actions!
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_04 " );	// Therefore, I believe that you are worthy of the honor of wearing the Guru's robe and being accepted into our sacred Circle!
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_05 " );	// However, the final choice is yours.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_06 " );	// You must understand that, having chosen this path, you will never be able to just leave it.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_07 " );	// I also had a conversation with Gor Na Kosh, the mentor of the Guardians.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_08 " );	// He also wants to have you in his ranks!
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_09 " );	// I'm not arguing that it's certainly a great honor to be a Guardian, but it's nothing compared to becoming a guru.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_10 " );	// This is the highest honor a follower of our faith can receive!
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_11 " );	// In addition, only for the Guru are the secrets of magic revealed to us by the Sleeper...
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_12 " );	// ...and only we can use this invaluable knowledge.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_13 " );	// Therefore, before giving your final answer, think carefully about all that I have told you.
	AI_Output(self,other, " DIA_BaalOrun_BeGuru_01_14 " );	// And let me know if you're ready to be initiated into our Circle.
	READYBEGURU = TRUE;
};


instance 2010_02_02 (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_beguruok_condition;
	information = dia_configuration_info;
	permanent = TRUE;
	description = " I want to become a Brotherhood Guru. " ;
};

func int dia_baalorun_beguruok_condition()
{
	if((hero.guild == GIL_SEK) && (READYBEGURU == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_beguruok_info()
{
	AI_Output(other,self, " DIA_BaalOrun_BeGuruOk_01_00 " );	// I want to become the Guru of the Brotherhood.

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};
	if(MIS_CanDoTempler == LOG_Running)
	{
		MIS_CanDoTempler = LOG_OBSOLETE;
	};

	Snd_Play("GUILD_INV");
	hero.guild = GIL_GUR ;
	CheckHeroGuild[0] = TRUE;
	SYMBOLSMAKEGURUDONE = TRUE;
	HelmIsUpTemp = FALSE ;
	hero.protection[PROT_MAGIC] += 10;
	REALPROTMAGIC += 10;
	AI_PrintClr( " Spell Defense + 10 " , 83 , 152 , 48 );
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Print(NAME_GUR_MAGIC);
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_01 " );	// So be it!
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_02 " );	// I accept you into our sacred Circle and give you the power of Guru!
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_03 " );	// From now on, you are one of us.
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_04 " );	// Take this robe as a symbol of our Circle.
	CreateInvItems(self,itar_gur_l,1);
	B_GiveInvItems(self,other,itar_gur_l,1);
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_05 " );	// Wear it with pride. Only a few have received such an honor!
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_06 " );	// Also accept this staff from me. Only we, the Guru, have been granted the honor of possessing him and commanding his power!
	CreateInvItems(self,ITMW_2H_G3_STAFFDRUID_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFDRUID_01,1);
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_07 " );	// And don't forget that being a Guru is not just about being initiated into our Circle...
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_08 " );	// ...It's a sign! The sign of your destiny and your choice.
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_09 " );	// Be faithful to your convictions to the end, and try to be wise and prudent in your deeds.
	AI_Output(self,other, " DIA_BaalOrun_BeGuruOk_01_10 " );	// That's all I wanted to tell you before you continue on your way.
	AI_StopProcessInfos(self);
};

instance DIA_BAALORUN_PRETEACH (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_preteach_condition;
	information = dia_baalorun_preteach_info;
	permanent = FALSE;
	description = " Can I now learn the secrets of the Sleeper's magic? " ;
};


func int dia_baalorun_preteach_condition()
{
	if(hero.guild == GIL_GUR)
	{
		return TRUE;
	};
};

func void dia_baalorun_preteach_info()
{
	AI_Output(other,self, " DIA_BaalOrun_PreTeach_01_00 " );	// Can I now learn the secrets of the Sleeper's magic?
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_01 " );	// Yes. Now you are ready to possess true knowledge, which is available only to the Guru of our Brotherhood.
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_02 " );	// And, of course, you'll need some help understanding the latter.
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_03 " );	// I can introduce you to the magic circles needed to use the magic runes.
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_04 " );	// Idol Kadar will help you increase your magic power.
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_05 " );	// The Namib Idol will teach you how to create runes with Sleeper magic.
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_06 " );	// And the Idol of Tion will sell you magic scrolls and the necessary ingredients to create these runes.
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_07 " );	// By gaining all this knowledge, great power will be concentrated in your hands!
	AI_Output(self,other, " DIA_BaalOrun_PreTeach_01_08 " );	// Keep this in mind and try to use it wisely.
	BAALTYON_CANTRADE = TRUE ;
	BAALNAMIB_TEACHRUNES = TRUE ;
	BAALCADAR_TEACHMANA = TRUE;
	BAALORUN_TEACHCIRCLE = TRUE ;
	Log_CreateTopic(TOPIC_ADDON_GURTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ADDON_GURTEACHER , "The Oran Idol will help me learn magic circles. " );
	B_LogEntry( TOPIC_ADDON_GURTEACHER , "The Namib Idol will teach me how to make sleeper runes. " );
	B_LogEntry( TOPIC_ADDON_GURTEACHER , " Idol Kadar will help me increase my magical power. " );
	B_LogEntry( TOPIC_ADDON_GURTEACHER , " Idol Tion sells magic scrolls and rune-making ingredients. " );
};


instance DIA_BAALORUN_EXPLAINCIRCLES(C_Info)
{
	npc = gur_8002_orun;
	condition = dia_baalorun_explaincircles_condition;
	information = dia_baalorun_explaincircles_info;
	permanent = FALSE;
	description = " Explain to me what is the meaning of Magic Circles? " ;
};


func int dia_baalorun_explaincircles_condition()
{
	if (( hero . guild ==  GIL_GUR ) && Npc_KnowsInfo ( other , his_balorun_preteach ))
	{
		return TRUE;
	};
};

func void dia_baalorun_explaincircles_info()
{
	AI_Output(other,self, " DIA_BaalOrun_EXPLAINCIRCLES_Info_15_01 " );	// Explain to me what the meaning of magic circles is?
	AI_Output(self,other, " DIA_BaalOrun_EXPLAINCIRCLES_Info_14_02 " );	// Circles represent your understanding of magic.
	AI_Output(self,other, " DIA_BaalOrun_EXPLAINCIRCLES_Info_14_03 " );	// They indicate the level of your knowledge and skills, the ability to learn new spells.
	AI_Output(self,other, " DIA_BaalOrun_EXPLAINCIRCLES_Info_14_04 " );	// You must complete each Circle before you can enter the next one.
	AI_Output(self,other, " DIA_BaalOrun_EXPLAINCIRCLES_Info_14_05 " );	// It will take long hours of study and a lot more experience to reach the higher Circles.
	AI_Output(self,other, " DIA_BaalOrun_EXPLAINCIRCLES_Info_14_06 " );	// Your efforts will be rewarded with powerful new spells every time. But in any case, magic Circles mean much more.
	AI_Output(self,other, " DIA_BaalOrun_EXPLAINCIRCLES_Info_14_08 " );	// In order to understand their power, you must know yourself.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int dia_baalorun_circle_noperm;

instance DIA_ROUND_CIRCLE ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_circle_condition;
	information = dia_circle_info;
	permanent = TRUE;
	description = " I want to learn the essence of magic. " ;
};

func int dia_baalorun_circle_condition()
{
	if (( NPC_GetTalentSkill ( other , NPC_TALENT_MAGE ) <=  6 ) && ( BAALORUN_TEACHCIRCLE  ==  TRUE ) && ( DIA_BAALORUN_CIRCLE_NOPERM  ==  FALSE ))
	{
		return TRUE;
	};
};

func void circle_info()
{
	AI_Output(other,self, " DIA_BaalOrun_CIRCLE_15_00 " );	// I want to understand the essence of magic.
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
	Info_AddChoice(DIA_Sun_Circle,Dialog_Back,DIA_Sun_Circle_Back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1) && (Kapitel >= 1))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE, " 1 Circle of Magic (Training Points: 20) " ,DIA_BaalOrun_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE, " 2 Circle of Magic (Training Points: 30) " ,DIA_BaalOrun_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE, " 3 Circle of Magic (Training Points: 40) " ,DIA_BaalOrun_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE, " 4 Circle of Magic (Training Points: 60) " ,DIA_BaalOrun_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE, " 5 Circle of Magic (Training Points: 80) " ,DIA_BaalOrun_CIRCLE_5);
	}
	else  if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE ) ==  5 ) && (Chapter >=  5 ) && (MY_DarkOrder == LOG_Success) && (MY_JarCurse == LOG_Success) && ( MY_URNAZULRAGE  ==  LOG_SUCCESS )) ;
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE, " 6 Circle of Magic (Training Points: 100) " ,DIA_BaalOrun_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_42 " );	// It's not time yet. Come back later.
	};
};

func void DIA_BaalOrun_CIRCLE_Back()
{
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_0A " );	// Are you ready to enter the next circle of magic?
		AI_Output(other,self, " DIA_BaalOrun_CIRCLE_15_01 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_01 " );	// By joining the First Circle, you will learn how to use magical runes.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_02 " );	// Each rune contains the structure of a special magic spell.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_03 " );	// By using your own magical power, you can release the rune's magic.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_04 " );	// But unlike scrolls, which are essentially magic formulas, rune magic maintains the structure of the spell at all times.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_05 " );	// Each rune contains a magical power that you can take away at any time.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_06 " );	// Just like with the scroll, the moment you use a rune, your own magic power is consumed.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_07 " );	// With each new Circle you will learn more and more about runes.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_08 " );	// Use their power to know yourself.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_0A " );	// Are you ready to enter the next Circle of Magic?
		AI_Output(other,self, " DIA_BaalOrun_CIRCLE_15_02 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_09 " );	// You've already learned to understand runes. It's time to deepen your knowledge.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_10 " );	// As you enter the Second Circle, you will learn the basics of powerful combat spells.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_11 " );	// But in order to know the true secrets of magic, you have a lot to learn.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_12 " );	// You already know that you can use any rune countless times, but only until you use up your own magic power.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_13 " );	// But before you do anything, think about whether it makes sense. You have the power to sow death and destruction with ease.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_14 " );	// But a true magician uses it only when necessary.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_15 " );	// Learn to assess the situation, and you will know the true power of the runes.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_0A " );	// Are you ready to enter the next Circle of Magic?
		AI_Output(other,self, " DIA_BaalOrun_CIRCLE_15_03 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_16 " );	// The Third Circle is one of the most important stages in the life of every magician. When you reach it, you complete your search.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_17 " );	// You have already crossed a significant stage on the path of magic. You have learned how to use runes.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_18 " );	// This knowledge will serve as the basis for the next step. Use runes carefully.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_19 " );	// You can use them or not. But you must make a choice.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_20 " );	// Once you've made your choice, use your power without hesitation.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_21 " );	// Find your way, and then you will know the power of decision.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_0A " );	// Are you ready to enter the next Circle of Magic?
		AI_Output(other,self, " DIA_BaalOrun_CIRCLE_15_04 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_22 " );	// You have completed the first three Circles. It's time for you to learn the secrets of magic.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_23 " );	// The basis of rune magic is stone. A magical stone mined from magical ore.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_24 " );	// This is the same ore that is mined in the mines. In the temples, she is endowed with magical formulas, and there the runes turn into tools of our power.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_25 " );	// You now have all the knowledge that the temples have accumulated.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_27 " );	// Learn magic and you will discover the secret of power.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_28 " );	// And one more thing. Entering the fourth Circle of magic - you are honored to wear the vestments of the highest Gurus!
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_29 " );	// Few have been able to do this. Now you are one of the chosen ones of the sacred circle!
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_30 " );	// Here, take this robe and magical staff as an acknowledgment of your status.
		CreateInvItems(self,ItMW_Addon_Stab04,1);
		B_GiveInvItems(self,other,ItMW_Addon_Stab04,1);
		CreateInvItems(other,itar_gur_h,1);
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_0A " );	// Are you ready to enter the next Circle of Magic?
		AI_Output(other,self, " DIA_BaalOrun_CIRCLE_15_05 " );	// Yes, master. I'm ready.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_15_5A " );	// So be it. I will reveal to you the true meaning of the Fifth Circle.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_31 " );	// Know your limits, and you will know your true power.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_32 " );	// The spells you can learn can be truly devastating.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_33 " );	// So know the measure of your strength and beware of megalomania.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_34 " );	// I will lift you up to the Sixth Circle of Magic.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_35 " );	// Note that only the most powerful of magicians can enter the Sixth Circle. It is for those whose life is a sign.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_38 " );	// Your sign is the Rock!
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_39 " );	// The Sixth Circle will allow you to use the magic of any rune.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_40 " );	// And don't forget: don't capture power, but be its source.
		AI_Output(self,other, " DIA_BaalOrun_CIRCLE_14_41 " );	// Be wise and prudent in your actions and try to use your knowledge for the good of the Brotherhood!
		DIA_BAALORUN_CIRCLE_NOPERM = TRUE ;
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

instance DIA_CONTROLLER_SEND_CADER (C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sendcadar_condition;
	information = dia_transport_send_cadar_info;
	permanent = FALSE;
	description = " Idol Kadar sent me... " ;
};


func int dia_condition_send_cadar_condition()
{
	if((hero.guild == GIL_GUR) && (BAALORUN_TEACHMANA == TRUE))
	{
		return TRUE;
	};
};

func void send_info()
{
	AI_Output(other,self, " DIA_BaalOrun_SendCadar_15_00 " );	// Idol Kadar sent me. I want to increase my strength.
	AI_Output(self,other, " DIA_BaalOrun_SendCadar_11_01 " );	// I see - you have learned a lot and your strength has increased! Now you will learn from me.
};

instances DIA_BAALORUN_TEACH_MANA (C_Info)
{
	npc = gur_8002_orun;
	nr = 10;
	condition = dia_baalorun_teach_mana_condition;
	information = dia_balorun_teach_home_info;
	permanent = TRUE;
	description = " I want to increase my magical energy. " ;
};

func int dia_baalorun_teach_mana_condition()
{
	if ((other.guild == GIL_GUR  ) && ( BAALORUN_TEACHMANA ==  TRUE  ) && Npc_KnowsInfo ( other , BAALORUN_SEND_DAY ) && (( other.attribute [ ATR_MANA_MAX ] <  T_MEGA ) ||  
	{
		return TRUE;
	};
};

func void dia_baalorun_teach_mana_info()
{
	AI_Output(other,self, " DIA_BaalOrun_TEACH_MANA_15_00 " );	// I want to increase my magical energy.
	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);

	if ((Chapter >=  2 ) && ( BACK_TEACREGEN  ==  FALSE ))
	{
		Info_AddChoice(DIA_BaalOrun_TEACH_MANA, " Mana Regen (Training Points: 5, Cost: 7500 Coins) " ,DIA_BaalOrun_TEACH_MANA_Regen);
	};
};

func void dia_baalorun_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other, " DIA_BaalOrun_TEACH_MANA_05_00 " );	// You're at your limits - I taught you everything I knew!
	};

	Info_ClearChoices(dia_baalorun_teach_mana);
};

func void DIA_BaalOrun_TEACH_MANA_Regen()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_05 " );	// Teach me mana regeneration.

	cost = 5 ;
	money = 7500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Training: Mana Regeneration " );
		VATRAS_TEACHREGENMANA = TRUE ;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);
};

func void dia_baalorun_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_GUR ) && ( BACK_TEACHREGENMANA  ==  FALSE ))
	{
		Info_AddChoice(DIA_BaalOrun_TEACH_MANA, " Mana Regen (Training Points: 10, Cost: 10000 Coins) " ,DIA_BaalOrun_TEACH_MANA_Regen);
	};
};

func void dia_baalorun_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_GUR ) && ( BACK_TEACHREGENMANA  ==  FALSE ))
	{
		Info_AddChoice(DIA_BaalOrun_TEACH_MANA, " Mana Regen (Training Points: 10, Cost: 10000 Coins) " ,DIA_BaalOrun_TEACH_MANA_Regen);
	};
};

instance DIA_BAALORUN_GATHERARMY(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_gatherarmy_condition;
	information = dia_baalorun_gatherarmy_info;
	permanent = FALSE;
	description = " We need to talk urgently! " ;
};


func int dia_baalorun_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_gatherarmy_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_00 " );	// We need to talk urgently!
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_01 " );	// About what, brother?
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_02");	//(вздох)
		AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_03 " );	// Listen, orcs are coming here soon!
		AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_04 " );	// Orcs?! Hmmm... Where did you get that from?
	};
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_05 " );	// I've come with an offer from Lord Hagen, head of the paladin order.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_06 " );	// Yes? And what is it?
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_07 " );	// He asks for your help in the war against these green-skinned creatures.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_08 " );	// So, Lord Hagen wants to openly oppose the orcs?
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_09 " );	// Yes, though, right now he has too few people to give them an open fight.
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_10 " );	// But he believes that with your help he will have a chance to win this battle.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_11 " );	// I need some time to think...
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_12 " );	// But the orcs have already taken over most of the island! A little more - and they will take over it entirely.
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_13 " );	// The orcs there spared no one, arranging a bloody massacre for all its inhabitants. Therefore, they are unlikely to be more favorable to you.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_14 " );	// (decidedly) All right! Consider that you were able to convince me of the need for such an alliance.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_15 " );	// The Fellowship will help the paladins, because apparently now it has become our common cause.
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_16 " );	// All right, I'll pass on your words to Lord Hagen. When do you perform?
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_17 " );	// It's not up to me to decide. I think it's best if you talk to Gor Na Kosh about it.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_18 " );	// It is he who now leads the sacred Circle of Guardians.
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_19 " );	// And what about you - Guru?
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_20 " );	// Everything related to aspects of warfare is the lot of the warriors of the Brotherhood! And in this we completely rely on them.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_21 " );	// Of course, our knowledge of the magic bestowed upon us by the Sleepers could certainly help us in the upcoming battle.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_22 " );	// However, you must understand that the Gurus are primarily the spiritual mentors of the Brotherhood, and not its warriors.
	AI_Output(self,other, " DIA_BaalOrun_GatherArmy_01_23 " );	// So go to Gor Na Kosh and deliver my words. Everything else he decides himself.
	AI_Output(other,self, " DIA_BaalOrun_GatherArmy_01_24 " );	// Okay, I'll do that.
	B_LogEntry( TOPIC_OR with GREATWAR , " I was able to convince the Idol of Oran to fight on the side of the paladins. Now I need to speak with Gor Na Kosh, the guardian's circle master, to find out when his warriors are ready to march. " );
};


instance DIA_BAALORUN_GETSHIP(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_getship_condition;
	information = dia_baalorun_getship_info;
	description = " I need to get on the paladin ship. " ;
};


func int dia_baalorun_getship_condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && ( KAPITELORCATC  ==  FALSE ) && ((hero.guild ==  GIL_SEK ) || (hero.guild ==  GIL_TPL ) || (hero.guild ==  GIL_GUR )))
	{
		return TRUE;
	};
};

func void dia_baalorun_getship_info()
{
	AI_Output(other,self, " DIA_BaalOrun_GetShip_01_00 " );	// I need to get on the paladin ship. Can you help me with this?
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_01 " );	// Hmmm... And why did you even need this?
	AI_Output(other,self, " DIA_BaalOrun_GetShip_01_02 " );	// I found out where our main enemy is hiding. And I need a ship to get there.
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_03 " );	// In that case, I know what's best for us to do.
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_04 " );	// I guess you're well aware that we have pretty good connections with some of the powerful people in town.
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_05 " );	// And surely some of them will be quite able to solve this problem. I think we should go to them!
	AI_Output(other,self, " DIA_BaalOrun_GetShip_01_06 " );	// And what do I need to do for this?
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_07 " );	// Don't worry. I'll take care of everything myself.
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_08 " );	// However, I want to warn you right away that services of this kind will not cost you too cheap!
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_09 " );	// Not to mention the time it will take to settle all the formalities in this matter.
	AI_Output(self,other, " DIA_BaalOrun_GetShip_01_10 " );	// Come see me in a couple of days. Perhaps I will have some news for you on this matter.
	DAYORUNHELP = Wld_GetDay();
	MIS_ORUNHELPSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_ORUNHELPSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORUNHELPSHIP,LOG_Running);
	B_LogEntry( TOPIC_ORUNHELPSHIP , " Idol Oran promised to help me with the ship. However, it will cost me a huge pile of gold! I should visit him in a couple of days. " );
};


instance DIA_BAALORUN_GETSHIPDONE(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_getshipdone_condition;
	information = dia_baalorun_getshipdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_getshipdone_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_ORUNHELPSHIP == LOG_Running) && (DAYORUNHELP <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_baalorun_getshipdone_info()
{
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_01_00 " );	// It's good that you came. I have some news regarding your recent request.
	AI_Output(other,self, " DIA_BaalOrun_GetShipDone_01_01 " );	// Which ones exactly?
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_01_02 " );	// I managed to get you a written permission to access the paladin ship.
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_01_03 " );	// However, as I said earlier, you will have to pay for it.
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_01_05 " );	// Only two thousand gold coins. So what do you say?
	Info_ClearChoices(dia_baalorun_getshipdone);
	Info_AddChoice(dia_baalorun_getshipdone, " I don't have enough gold with me right now. " ,dia_baalorun_getshipdone_paylater);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_baalorun_getshipdone, " Okay, here's your money. " ,dia_baalorun_getshipdone_money);
	};
};

func void dia_baalorun_getshipdone_paylater()
{
	AI_Output(other,self, " DIA_BaalOrun_GetShipDone_PayLater_01_00 " );	// I don't have enough gold with me right now.
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_PayLater_01_01 " );	// Then we'll talk about it when you have it.
	AI_Output(other,self,"DIA_BaalOrun_GetShipDone_PayLater_01_02");	//Само собой.
	ORUNCANGIVEMEPASS = TRUE;
	B_LogEntry( TOPIC_ORUNHELPSHIP , " I need to pay two thousand gold pieces, after which the Idol of Oran will agree to give me written permission to access the ship. " );
	Info_ClearChoices(dia_baalorun_getshipdone);
};

func void dia_baalorun_getshipdone_money()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalOrun_GetShipDone_Money_01_00 " );	// Okay, here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_Money_01_01 " );	// Great! In that case, you can take it from me.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	AI_Output(self,other, " DIA_BaalOrun_GetShipDone_Money_01_02 " );	// And I hope it helps you.
	AI_Output(other,self, " DIA_BaalOrun_GetShipDone_Money_01_03 " );	// You can be sure of that.
	MIS_ORUNHELPSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORUNHELPSHIP,LOG_SUCCESS);
	B_LogEntry( TOPIC_ORUNHELPSHIP , "The Idol of Oran has given me written permission to board the Esmeralda now. " );
	Info_ClearChoices(dia_baalorun_getshipdone);
};


instance DIA_BAALORUN_GETSHIPDONEAGAIN(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_getshipdoneagain_condition;
	information = dia_baalorun_getshipdoneagain_info;
	permanent = TRUE;
	description = " Give me this written permission. " ;
};


func int dia_baalorun_getshipdoneagain_condition()
{
	if((MIS_ORUNHELPSHIP == LOG_Running) && (ORUNCANGIVEMEPASS == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_getshipdoneagain_info()
{
	AI_Output(other,self, " DIA_BaalOrun_GetShipDoneAgain_01_00 " );	// Give me this written permission.
	AI_Output(self,other,"DIA_BaalOrun_GetShipDoneAgain_01_01");	//А деньги?
	Info_ClearChoices(dia_baalorun_getshipdoneagain);
	Info_AddChoice(dia_baalorun_getshipdoneagain, " I don't have enough gold with me right now. " ,dia_baalorun_getshipdoneagain_paylater);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_baalorun_getshipdoneagain, " Okay, here's your gold. " ,dia_baalorun_getshipdoneagain_money);
	};
};

func void dia_baalorun_getshipdoneagain_paylater()
{
	AI_Output(other,self, " DIA_BaalOrun_GetShipDoneAgain_PayLater_01_00 " );	// I don't have enough gold.
	AI_Output(self,other, " DIA_BaalOrun_GetShipDoneAgain_PayLater_01_01 " );	// Then we'll talk about it when you have it.
	Info_ClearChoices(dia_baalorun_getshipdoneagain);
};

func void dia_baalorun_getshipdoneagain_money()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_BaalOrun_GetShipDoneAgain_Money_01_00 " );	// Okay, here's your gold.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_BaalOrun_GetShipDoneAgain_Money_01_01 " );	// Great! In that case, you can take it from me.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	AI_Output(self,other, " DIA_BaalOrun_GetShipDoneAgain_Money_01_02 " );	// And I hope it helps you.
	AI_Output(other,self, " DIA_BaalOrun_GetShipDoneAgain_Money_01_03 " );	// You can be sure of that.
	MIS_ORUNHELPSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORUNHELPSHIP,LOG_SUCCESS);
	B_LogEntry( TOPIC_ORUNHELPSHIP , "The Idol of Oran has given me written permission to board the Esmeralda now. " );
	Info_ClearChoices(dia_baalorun_getshipdoneagain);
};


instance DIA_BAALORUN_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_runemagicnotwork_condition;
	information = dia_baalorun_runemagicnotwork_info;
	permanent = FALSE;
	description = " How is your magic doing? " ;
};


func int dia_baalorun_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_BaalOrun_RuneMagicNotWork_01_00 " );	// How's your magic doing?
	AI_Output(self,other, " DIA_BaalOrun_RuneMagicNotWork_01_01 " );	// Our magic runes have weakened and are no longer able to cast spells!
	AI_Output(self,other, " DIA_BaalOrun_RuneMagicNotWork_01_02 " );	// We are all extremely surprised by this circumstance, but there is nothing we can do.
	AI_Output(self,other, " DIA_BaalOrun_RuneMagicNotWork_01_03 " );	// This is all pretty weird.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , "The Gurus of the Brotherhood have also lost their power over rune magic! " );
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_Day_Sun_MAXROBE ( C_Info ) ;
{
	npc = gur_8002_orun;
	nr = 2;
	condition = DIA_BaalOrun_MAXROBE_condition;
	information = DIA_Sunny_Sun_info;
	permanent = FALSE;
	description = " How about a better robe? " ;
};

func int DIA_MAXROBE_condition()
{
	if ((hero.guild ==  GIL_GUR ) && (Chapter >=  5 ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  6 ) && (LastRobeGUR ==  FALSE ) && (MAXROBEGUR_Permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_INFO_INFO()
{
	AI_Output(other,self, " DIA_BaalOrun_MAXROBE_01_00 " );	// How about a better robe?
	AI_Output(self,other, " DIA_BaalOrun_MAXROBE_01_01 " );	// Since you are proficient in all six circles of magic, you are worthy to wear the robe of the supreme Guru!
	AI_Output(self,other, " DIA_BaalOrun_MAXROBE_01_02 " );	// However, you will have to pay for it. Its production costs us dearly, so we cannot give it away for free.
	LastRobeGUR = TRUE ;
};

instance DIA_BaalOrun_MAXROBE_Buy(C_Info)
{
	npc = gur_8002_orun;
	nr = 2;
	condition = DIA_BaalOrun_MAXROBE_Buy_condition;
	information = DIA_BaalOrun_MAXROBE_Buy_info;
	permanent = TRUE;
	description = " Sell me the Robe of the Supreme Guru. (Price: 25000 coins) " ;
};

func int DIA_BaalOrun_MAXROBE_Buy_condition()
{
	if (( hero . guild ==  GIL_GUR ) && ( LastRobeGUR ==  TRUE ) && ( MAXROBEGUR_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_BaalOrun_MAXROBE_Buy_info()
{
	AI_Output(other,self, " DIA_BaalOrun_MAXROBE_Buy_01_00 " );	// Sell me the robe of the supreme Guru.

	if(Npc_HasItems(hero,ItMi_Gold) >= 25000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,25000);
		Npc_RemoveInvItems(self,ItMi_Gold,25000);
		AI_Output(self,other, " DIA_BaalOrun_MAXROBE_Buy_01 " );	// Good! Here, hold her.
		AI_Output(self,other, " DIA_BaalOrun_MAXROBE_Buy_02 " );	// It's a great honor to wear such an attire. Remember this!
		CreateInvItems(self,ITAR_GUR_TOP,1);
		B_GiveInvItems(self,other,ITAR_GUR_TOP,1);
		MAXROBEGUR_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_BaalOrun_MAXROBE_Buy_01_03 " );	// You don't have enough gold.
	};
};
