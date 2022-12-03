

instance DIA_Lee_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_EXIT_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;

instance DIA_Lee_PMSchulden(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lee_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime))
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORFARM = 1;
	concatText = "The mercenaries outlawed you! " ;
	AI_Print(concatText);
};

func void dia_lee_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORFARM = 1;
	concatText = "The mercenaries outlawed you! " ;
	AI_Print(concatText);
};

func void DIA_Lee_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	AI_Output(self,other, " DIA_Lee_PMSchulden_04_00 " );	// Have you come to give money to Onar?
	temp1 = 0 ;
	if(GLOBAL_FARM_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_FARM_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_FARM_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_FARM_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_FARM,tsettext2);
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_36 " );	// Is it too late?
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_37 " );	// You should have thought before committing those senseless murders.
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_38 " );	// All my boys and Onar want you dead, and that's why...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_39 " );	// I'll kill you, right here and now!
		}
		else if(GLOBAL_FARM_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_FARM,tsettext2);
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_40 " );	// Isn't it too late...
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_41 " );	// You should think ahead before making these senseless attacks on the peasants.
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_42 " );	// All my boys and Onar want you dead, and that's why...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_43 " );	// I'll kill you, right here and now!
		}
		else if(GLOBAL_FARM_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_FARM,tsettext2);
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_44 " );	// Isn't it too late...
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_45 " );	// You should think ahead before you steal here.
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_46 " );	// All my boys and Onar want you dead, and that's why...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Lee_PMSchulden_08_47 " );	// I'll kill you, right here and now!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " By my constant outrages at Onar's farm, I ruined my relationship with the mercenaries. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PMSchulden, " Wait!!!...(it's time to leave) " ,dia_lee_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
		{
			AI_Output(self,other, " DIA_Lee_PMSchulden_04_01 " );	// I already told you not to do stupid things here.
			AI_Output(self,other, " DIA_Lee_PMSchulden_04_02 " );	// Onar learned that you managed to earn a bad reputation for yourself here.
			if (Lee_Debt <  1000 )
			{
				diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
				if(diff > 0)
				{
					Lee_Debt = Lee_Debt + (diff *  250 );
				};
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_03 " );	// And, of course, he now wants more money.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Сколько?
				if (Lee_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
				if(diff > 0)
				{
					Lee_Debt = Lee_Debt + (diff *  250 );
				};
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_04 " );	// I thought you were smarter.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00A");	//Сколько?
				if (Lee_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
		{
			AI_Output(self,other, " DIA_Lee_PMSchulden_04_05 " );	// Now some good news for you.
			if(Lee_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_06 " );	// Suddenly, there is no one left who saw you commit the murder.
				GLOBAL_FARM_MURDER = GLOBAL_FARM_MURDER - 1;
				if(GLOBAL_FARM_MURDER < 0)
				{
					GLOBAL_FARM_MURDER = 0;
				};
			};
			if((Lee_LastPetzCrime == CRIME_THEFT) || ((Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_07 " );	// No one can now confirm that they saw you steal.
				GLOBAL_FARM_THEFT = GLOBAL_FARM_THEFT - 1;
				if(GLOBAL_FARM_THEFT < 0)
				{
					GLOBAL_FARM_THEFT = 0;
				};
			};
			if((Lee_LastPetzCrime == CRIME_ATTACK) || ((Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_08 " );	// There was no one left to see you beat up one of the farmers.
				GLOBAL_FARM_ATTACK = GLOBAL_FARM_ATTACK - 1;
				if(GLOBAL_FARM_ATTACK < 0)
				{
					GLOBAL_FARM_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_09 " );	// It looks like all the accusations against you have vanished into thin air.
			};
			AI_Output(self,other, " DIA_Lee_PMSchulden_04_10 " );	// Yeah, I'll tell you, this is a way to get rid of such problems.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_11 " );	// Anyway, you don't have to pay anymore.
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_12 " );	// But be careful in the future.
				Lee_Debt = 0 ;
				Lee_LastPetzCounter = 0;
				Lee_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_13 " );	// One thing is clear: you must still pay the fine in full.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00B");	//Сколько?
				if (Lee_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other, " DIA_Lee_PMSchulden_04_14 " );	// So what?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Lee_PMSchulden);
			Info_ClearChoices(DIA_Lee_PETZMASTER);
			Info_AddChoice(DIA_Lee_PMSchulden, " I don't have enough gold! " ,DIA_Lee_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Lee_PMSchulden, " How Much Should I Pay? " ,DIA_Lee_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
			{
				Info_AddChoice(DIA_Lee_PMSchulden, " I want to pay a fine. " ,DIA_Lee_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	AI_Output(other,self, " DIA_Lee_PMSchulden_HowMuchAgain_15_00 " );	// How much do I have to pay?
	if (Lee_Debts <=  1000 )
	{
		B_Say_Gold(self,other,Lee_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PMSchulden, " I don't have that much gold! " ,DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Lee_PMSchulden, " How Much Do You Need? " ,DIA_Lee_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PMSchulden, " I want to pay the fine! " ,DIA_Lee_PETZMASTER_PayNow);
	};
};


instance DIA_Lee_PETZMASTER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Lee_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	Lee_Debt = 0 ;
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lee_PETZMASTER_04_00 " );	// Who let YOU in here? (surprised) Are you the newbie who's causing problems?
		AI_Output(self,other, " DIA_Lee_PETZMASTER_04_01 " );	// I heard from Gorn that you're still alive, but that you'll come here... Oh, okay.
	};
	temp1 = 0 ;
	if(GLOBAL_FARM_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_FARM_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_FARM_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_FARM_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_FARM,tsettext2);
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_48 " );	// Isn't it too late...
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_49 " );	// You should think ahead before committing these senseless murders.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_50 " );	// All my boys and Onar want you dead, and that's why...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_51 " );	// I'll kill you, right here and now!
		}
		else if(GLOBAL_FARM_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_FARM,tsettext2);
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_52 " );	// Isn't it too late...
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_53 " );	// You should think ahead before making these senseless attacks on the peasants.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_54 " );	// All my boys and Onar want you dead, and that's why...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_55 " );	// I'll kill you, right here and now!
		}
		else if(GLOBAL_FARM_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_FARM,tsettext2);
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_56 " );	// Isn't it too late...
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_57 " );	// You should think ahead before you steal here.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_58 " );	// All my boys and Onar want you dead, and that's why...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Lee_PETZMASTER_08_59 " );	// I'll kill you, right here and now!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " By my constant outrages at Onar's farm, I ruined my relationship with the mercenaries. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PETZMASTER, " Wait!!!...(it's time to leave) " ,dia_lee_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_02 " );	// It's good that you came to me before things got really bad.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_03 " );	// Mercenaries are tough guys, and the farmers around here can stand up for themselves too, but you can't just kill people like that.
			Lee_Debt = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Lee_PETZMASTER_04_04 " );	// Not to mention your other crimes here.
			};
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_05 " );	// I can help you get out of this shit.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_06 " );	// It will cost you a pretty penny, though. Onar is a greedy person, and only if he closes his eyes to all this, the issue can be considered settled.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_07 " );	// It's good that you came! I heard that you stole something.
			if(PETZCOUNTER_Farm_Attack > 0)
			{
				AI_Output(self,other, " DIA_Lee_PETZMASTER_04_08 " );	// And got into a fight with the peasants.
			};
			if(PETZCOUNTER_Farm_Sheepkiller > 0)
			{
				AI_Output(self,other, " DIA_Lee_PETZMASTER_04_09 " );	// And killed some sheep.
			};
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_10 " );	// You can't just do something like this here. In such cases, Onar insists that I punish the criminals with money.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_11 " );	// This means: you pay, he hides the money - and that's it.
			Lee_Debt = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_12 " );	// If you duel with mercenaries, it's one thing...
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_13 " );	// But if you beat the peasants, they immediately run to Onar. And he's waiting for me to do something.
			if(PETZCOUNTER_Farm_Sheepkiller > 0)
			{
				AI_Output(self,other, " DIA_Lee_PETZMASTER_04_14 " );	// Not to mention he doesn't rejoice that his sheep are being slaughtered.
			};
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_15 " );	// You will need to pay a fine. As a rule, Onar takes the money himself - but this is the only way to settle the matter.
			Lee_Debt = B_GetTotalPetzCounter(self) *  750 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_16 " );	// Onar expects me to protect his estate. This also applies to sheep.
			AI_Output(self,other, " DIA_Lee_PETZMASTER_04_17 " );	// You should pay him compensation!
			Lee_Debts = 250 ;
		};
		AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Сколько?
		if (Lee_Debts <=  1000 )
		{
			B_Say_Gold(self,other,Lee_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PETZMASTER, " I don't have enough gold! " ,DIA_Lee_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
		{
			Info_AddChoice(DIA_Lee_PETZMASTER, " I want to pay. " ,DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output(other,self, " DIA_Lee_PETZMASTER_PayNow_15_00 " );	// I want to pay a fine!
	B_GiveInvItems(other,self,ItMi_Gold,Lee_Schulden);
	AI_Output(self,other, " DIA_Lee_PETZMASTER_PayNow_04_01 " );	// Good! I will see to it that this money reaches Onar. You can consider this problem forgotten.
	B_GrantAbsolution(LOC_FARM);
	Lee_Debt = 0 ;
	Lee_LastPetzCounter = 0;
	Lee_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_ClearChoices(DIA_Lee_PMSchulden);
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output(other,self, " DIA_Lee_PETZMASTER_PayLater_15_00 " );	// I don't have that much gold!
	AI_Output(self,other, " DIA_Lee_PETZMASTER_PayLater_04_01 " );	// Then get him and quickly.
	AI_Output(self,other, " DIA_Lee_PETZMASTER_PayLater_04_02 " );	// But I don't think you can steal it here at the farm. If you get caught, you won't get out so easily.
	Lee_LastPetzCounter = B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lee_Hello (C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lee_Hallo_Condition()
{
	if ((self.aivar[AIV_TalkedToPlayer] ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_Hallo_Info()
{
	AI_Output(self,other, " DIA_Lee_Hallo_04_00 " );	// Why the hell did they let you in here?...(surprised) What are you doing here? I thought you were dead!
	AI_Output(other,self, " DIA_Lee_Hallo_15_01 " );	// Why did you think so?
	AI_Output(self,other, " DIA_Lee_Hallo_04_02 " );	// Gorn told me that it was you who broke the Barrier.
	AI_Output(other,self, " DIA_Lee_Hallo_15_03 " );	// Yes, it really was me.
	AI_Output(self,other, " DIA_Lee_Hallo_04_04 " );	// I never would have thought that a person could survive after all this. What brought you here? You're not just here...
	LeeMeet = TRUE;
};

instance DIA_Lee_BreakBarrier(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BreakBarrier_Condition;
	information = DIA_Lee_BreakBarrier_Info;
	permanent = FALSE;
	description = " What happened to you after the Barrier fell? " ;
};

func int DIA_Lee_BreakBarrier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_BreakBarrier_Info()
{
	AI_Output(other,self, " DIA_Lee_BreakBarrier_01_00 " );	// And what happened to you after the Barrier fell?
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_01 " );	// Most of the thieves and mercenaries stayed with me because I was able to offer them a path to freedom.
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_02 " );	// The rest scattered around the neighborhood and took up robbery!
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_03 " );	// Mages of Water, having finished their business, went straight to Khorinis. Where they are now, I don't know.
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_04 " );	// But Lares needs to be aware of what's going on.
	AI_Output(other,self, " DIA_Lee_BreakBarrier_01_05 " );	// And then?
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_06 " );	// Then we came across this farm.
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_07 " );	// Shortly before us, the city militia just came here and turned the whole estate upside down in search of gold.
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_08 " );	// Actually, this was the reason why Onar rebelled against the king! Then we made a deal with him.
	AI_Output(self,other, " DIA_Lee_BreakBarrier_01_09 " );	// My people protect his lands from the royal bailiffs, and we get food and some gold from him.
};

instance DIA_Lee_Paladine(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent = FALSE;
	description = " I really need to talk to the paladins in town. " ;
};

func int DIA_Lee_Paladine_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Paladine_Info()
{
	AI_Output(other,self, " DIA_Lee_Paladine_15_00 " );	// I really need to talk to the paladins in town. Could you help me get to them?
	AI_Output(self,other, " DIA_Lee_Paladine_04_01 " );	// What business can you have with paladins?...(incredulously)
	AI_Output(other,self, " DIA_Lee_Paladine_15_02 " );	// It's a long story!
	AI_Output(self,other, " DIA_Lee_Paladine_04_03 " );	// I have time.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//Ксардас дал мне задание...(вздыхая) Он хочет, чтобы я заполучил мощный амулет, Глаз Инноса!
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Значит, ты все еще в союзе с этим некромантом. Понятно! А этот амулет находится у паладинов, да?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Насколько я знаю, да.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Я могу помочь тебе добраться до паладинов! Но сначала ты должен стать одним из нас.
};

instance DIA_Lee_PaladineHOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent = FALSE;
	description = "Как ты можешь помочь мне добраться до паладинов?";
};


func int DIA_Lee_PaladineHOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Lee_PaladineHOW_Info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Как ты можешь помочь мне добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Доверяй мне. У меня есть план. Я думаю, ты как раз подходишь для него...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Я сведу тебя с паладинами, а ты окажешь мне услугу. Но сначала присоединись к нам!
};


instance DIA_Lee_LeesPlan(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Lee_LeesPlan_Condition()
{
	if(Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeesPlan_Info()
{
	AI_Output(other,self, " DIA_Lee_LeesPlan_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Lee_LeesPlan_04_01 " );	// It's simple: I'm doing everything I can to make sure we can all get off this island.
	AI_Output(self,other, " DIA_Lee_LeesPlan_04_02 " );	// Onar hired us to protect his farm, and that's exactly what we're going to do.
	AI_Output(self,other, " DIA_Lee_LeesPlan_04_03 " );	// But our reward is more than just pay for work. Helping farmers, we cut off the city from provisions.
	AI_Output(self,other, " DIA_Lee_LeesPlan_04_04 " );	// And the less paladins eat, the sooner they'll listen when I finally make them an offer of peace.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Lee_LeesPlan_04_05 " );	// The only bad thing is that you had to join them.
	};

	AI_Output(other,self, " DIA_Lee_LeesPlan_15_06 " );	// What kind of offer do you want to make?
	AI_Output(self,other, " DIA_Lee_LeesPlan_04_07 " );	// Naturally, the condition will be our pardon and a free way to the mainland. You will know everything when the time comes.
};


instance DIA_Lee_WannaJoin(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent = FALSE;
	description = " I want to join you! " ;
};

func int DIA_Lee_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_WannaJoin_Info()
{
	AI_Output(other,self, " DIA_Lee_WannaJoin_15_00 " );	// I want to join you!
	AI_Output(self,other, " DIA_Lee_WannaJoin_04_01 " );	// I was hoping you'd say that! We need every reliable hand here.
	AI_Output(self,other, " DIA_Lee_WannaJoin_04_02 " );	// The last mercenaries I hired were of no use, only problems!
	AI_Output(self,other, " DIA_Lee_WannaJoin_04_03 " );	// In principle, you can start right now. Well, it's true that there are a couple of issues that need to be settled, but I think it won't be a problem...
};


instance DIA_Lee_ClearWhat(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent = FALSE;
	description = " What do I need to 'settle' before I can join you? " ;
};

func int DIA_Lee_ClearWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ClearWhat_Info()
{
	AI_Output(other,self, " DIA_Lee_ClearWhat_15_00 " );	// What do I need to 'settle' before I can join you?
	AI_Output(self,other, " DIA_Lee_ClearWhat_04_01 " );	// Onar is hiring us! You can only be on the farm with his approval.
	AI_Output(self,other, " DIA_Lee_ClearWhat_04_02 " );	// Also, it's about our guys. I can only accept you if the majority of the mercenaries agree that you can join us.
	AI_Output(self,other, " DIA_Lee_ClearWhat_04_03 " );	// But don't go to Onar until everything is settled. He's a very annoying guy...
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD, " In order to be accepted into the ranks of the mercenaries, I must get Onar's approval after I get the approval of the mercenaries. " );
};


instance DIA_Lee_OtherSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 7;
	condition = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent = FALSE;
	description = " How do I convince mercenaries to vote for me? " ;
};


func int DIA_Lee_OtherSld_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_OtherSld_Info()
{
	AI_Output(other,self, " DIA_Lee_OtherSld_15_00 " );	// How do I convince mercenaries to vote for me?
	AI_Output(self,other, " DIA_Lee_OtherSld_04_01 " );	// Doing what is expected of you when you're a mercenary, I would say.
	AI_Output(self,other, " DIA_Lee_OtherSld_04_02 " );	// Talk to Torlof. It is usually located in front of the house. He will give you a test.
	AI_Output(self,other, " DIA_Lee_OtherSld_04_03 " );	// If you can pass it, you'll earn most of the respect you need.
	AI_Output(self,other, " DIA_Lee_OtherSld_04_04 " );	// He'll tell you everything you need to know.
	B_LogEntry(TOPIC_BecomeSLD, " To be accepted as a mercenary, I must pass Torlof's test and earn the respect of the other mercenaries. " );
};


instance DIA_Addon_Lee_Ranger(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Addon_Lee_Ranger_Condition;
	information = DIA_Addon_Lee_Ranger_Info;
	description = " What do you know about the Water Ring? " ;
};


func int DIA_Addon_Lee_Ranger_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lee_OtherSld ) && ( SC_KnowsRanger ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lee_Ranger_Info()
{
	AI_Output(other,self, " DIA_Addon_Lee_Ranger_15_00 " );	// What do you know about the Ring of Water?
	AI_Output(self,other, " DIA_Addon_Lee_Ranger_04_01 " );	// I knew it! You just need to stick your nose everywhere.
	AI_Output(other,self, " DIA_Addon_Lee_Ranger_15_02 " );	// Come on, talk.
	AI_Output(self,other, " DIA_Addon_Lee_Ranger_04_03 " );	// I can't say much. I know that this secret society exists and that it is run by waterbenders.
	AI_Output(self,other, " DIA_Addon_Lee_Ranger_04_04 " );	// I am no longer bound by the agreement we made with the waterbenders back when the Barrier was still standing.
	AI_Output(self,other, " DIA_Addon_Lee_Ranger_04_05 " );	// Of course, if there's anything I can do to help them, I'll do it. But most of the time I'm busy with my own business. There is no time left for anything else.
	AI_Output(self,other, " DIA_Addon_Lee_Ranger_04_06 " );	// If you want to learn more about this society, talk to Kord. As far as I know, he is one of them.
	RangerHelp_gildeSLD = TRUE ;
	SC_KnowsCordAsRangerFromLee = TRUE;
};


var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

instance DIA_Lee_JoinNOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 8;
	condition = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent = TRUE;
	description = " I'm ready to join you! " ;
};


func int DIA_Lee_JoinNOW_Condition()
{
	if (( other . guild ==  GIL_NONE ) && Npc_KnowsInfo ( other , DIA_Lee_OtherSld ) && ( Lee_OnarOK ==  FALSE ) && ( SLD_Authorization !=  LOG_FAILED ))
	{
		return TRUE;
	};
};

func void DIA_Lee_JoinNOW_Info()
{
	AI_Output(other,self, " DIA_Lee_JoinNOW_15_00 " );	// I'm ready to join you!

	if(Lee_ProbeOK == FALSE)
	{
		if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
		{
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_01 " );	// You must first pass Torlof's test.
		}
		else
		{
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_02 " );	// So you passed Torlof's test?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Да.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_04 " );	// This is good.
			Lee_ProbeOK = TRUE;
		};
	};
	if (( Lee_ProbeOK ==  TRUE ) && ( Lee_StimmenOK ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Lee_JoinNOW_04_05 " );	// What do the other mercenaries say?

		if(Torlof_GenugStimmen == FALSE)
		{
			AI_Output(other,self, " DIA_Lee_JoinNOW_15_06 " );	// I'm not sure if there are enough mercenaries on my side.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_07 " );	// Then talk to Torlof, he knows everything they talk about on this farm.
		}
		else
		{
			AI_Output(other,self, " DIA_Lee_JoinNOW_15_08 " );	// Most of them are on my side.
			Lee_StimmenOK = TRUE;
		};
	};
	if (( Lee_StimmenOK ==  TRUE ) && ( Lee_OnarOK ==  FALSE ))
	{
		if(Onar_Approved == FALSE)
		{
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_09 " );	// Okay, then go straight to Onar. I have already spoken to him.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_10 " );	// But you have to negotiate your own salary.
			Lee_SendToOnar = TRUE;
			B_LogEntry(TOPIC_BecomeSLD, " All I need now is Onar's approval. " );
		}
		else
		{
			Lee_OnarOK = TRUE;
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_11 " );	// Did you talk to Onar?
			AI_Output(other,self, " DIA_Lee_JoinNOW_15_12 " );	// He agreed.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_13 " );	// Welcome aboard, mate!
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_14 " );	// Here, take yourself, for starters, normal armor.
			CreateInvItems(other,ItAr_Sld_L,1);

			if(CanTeachTownMaster == FALSE)
			{
				MIS_PathFromDown = LOG_SUCCESS;
				Log_SetTopicStatus(Topic_PathFromDown,LOG_SUCCESS);
				CanTeachTownMaster = TRUE;
			};

			hero.guild = GIL_SLD;
			CheckHeroGuild[0] = TRUE;
			Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
			Npc_ExchangeRoutine(Lothar,"START");
			Snd_Play("GUILD_INV");
			KDF_Recording = LOG_OBSOLETE ;
			SLD_recording = LOG_SUCCESS ;
			MIL_recording = LOG_OBSOLETE ;
			MIS_BECOMEKDW = LOG_OBSOLETE;
			MIS_BECOMEKDM = LOG_OBSOLETE;
			MIS_PSICAMPJOIN = LOG_OBSOLETE;
			B_GivePlayerXP(XP_BecomeMercenary);

			Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

			AI_Output(self,other, " DIA_Lee_JoinNOW_04_15 " );	// I'm glad you're with us.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_16 " );	// I already have my first assignment for you.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_17 " );	// It has to do with paladins. It's time for you to see them.
			AI_Output(self,other, " DIA_Lee_JoinNOW_04_18 " );	// You wanted to go there anyway.
		};
	};
};


instance DIA_Lee_KeinSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_KeinSld_Condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_NDW) || (other.guild == GIL_KDW) || (other.guild == GIL_NDM) || (other.guild == GIL_KDM) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)) && (Lee_IsOnBoard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lee_KeinSld_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Lee_KeinSld_04_00 " );	// I see you've entered the service of the paladins.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other, " DIA_Lee_KeinSld_04_01 " );	// Have you gone to a monastery? (laughs) I expected everything, but not this.
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Lee_KeinSld_04_0A " );	// I see you have chosen the path of the Water Mage. Well, congratulations - quite a good choice!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Lee_KeinSld_04_0B " );	// (surprised) Have you decided to serve Beliar?
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Lee_KeinSld_04_0C " );	// As I see it, you have rejoined the Brotherhood! Yes, boy - you can't fix it.
	};

	AI_Output(self,other, " DIA_Lee_KeinSld_04_02 " );	// Well, you can't become a mercenary now.
	AI_Output(self,other, " DIA_Lee_KeinSld_04_03 " );	// But who knows, maybe you can do something for me or I can do something for you.
	AI_Output(self,other, " DIA_Lee_KeinSld_04_04 " );	// Let's see. But be that as it may, I wish you all the best.
};


instance DIA_Lee_ToHagen(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent = FALSE;
	description = " So how do I get to the paladins now? " ;
};


func int DIA_Lee_ToHagen_Condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void DIA_Lee_ToHagen_Info()
{
	AI_Output(other,self, " DIA_Lee_ToHagen_15_00 " );	// And how do I get to the paladins now?
	AI_Output(self,other, " DIA_Lee_ToHagen_04_01 " );	// Very simple. You will take our offer of peace to them.
	AI_Output(self,other, " DIA_Lee_ToHagen_04_02 " );	// I've known Lord Hagen, commander of the paladins, since my time in the royal army.
	AI_Output(self,other, " DIA_Lee_ToHagen_04_03 " );	// I know what he's thinking - he doesn't have enough men. He will accept this offer. At least he will listen to you.
	AI_Output(self,other, " DIA_Lee_ToHagen_04_04 " );	// I wrote him a letter - hold on.
	B_GiveInvItems(self,other,ItWr_Passage_MIS,1);
	AI_Output(self,other, " DIA_Lee_ToHagen_04_05 " );	// Either way, this should allow you to get an audience with the paladin commander.
	MIS_Lee_Friedensangebot = LOG_Running;
	Log_CreateTopic(TOPIC_Frieden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Frieden,LOG_Running);
	B_LogEntry(TOPIC_Frieden, " Lee sends me to Lord Hagen with an offer of peace. That way I can get an audience with the paladins. " );
};

instance DIA_Lee_Fort(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Fort_Condition;
	information = DIA_Lee_Fort_Info;
	permanent = FALSE;
	description = " What do you know about the paladin fort? " ;
};

func int DIA_Lee_Fort_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ToHagen) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Fort_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lee_Fort_01_00 " );	// What do you know about the paladin fort?
	AI_Output(self,other, " DIA_Lee_Fort_01_01 " );	// It is located near Khorinis, and, from a military point of view, occupies a very important strategic position.
	AI_Output(self,other, " DIA_Lee_Fort_01_02 " );	// As far as I know, the main forces of the paladins are right there!
	AI_Output(other,self, " DIA_Lee_Fort_01_03 " );	// Is there a way to get there without going through the guards?
	AI_Output(self,other, " DIA_Lee_Fort_01_04 " );	// I don't know. Previously, a road from Khorinis itself led there.
	AI_Output(self,other, " DIA_Lee_Fort_01_05 " );	// But it has long been abandoned, since almost all transportation is carried out by sea.
};

instance DIA_Lee_OfferSuccess (C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_OfferSuccess_Condition;
	information = DIA_Lee_OfferSuccess_Info;
	permanent = FALSE;
	description = " I have taken your offer of peace to Lord Hagen. " ;
};

func int DIA_Lee_OfferSuccess_Condition()
{
	if (Hagen_FriedenRejected ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Lee_OfferSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self, " DIA_Lee_AngebotSuccess_15_00 " );	// I took Lord Hagen your offer of peace.
	AI_Output(self,other, " DIA_Lee_AngebotSuccess_04_01 " );	// What did he say?
	AI_Output(other,self, " DIA_Lee_AngebotSuccess_15_02 " );	// He said he was ready to grant pardon to you, but not to your people.
	AI_Output(self,other, " DIA_Lee_AngebotSuccess_04_03 " );	// Here's a stubborn fool! Most of the people in the royal army are bigger thugs than my guys.
	AI_Output(other,self, " DIA_Lee_AngebotSuccess_15_04 " );	// What are you going to do now?
	AI_Output(self,other, " DIA_Lee_AngebotSuccess_04_05 " );	// I have to find another way to get us out of here. If necessary, we will take over the ship. I need to think about it.
	AI_Output(self,other, " DIA_Lee_AngebotSuccess_04_06 " );	// Pulling your head out of the noose and leaving my people is out of the question.
	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};


instance DIA_Lee_Background(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent = FALSE;
	description = " Why are you so eager to go to the mainland? " ;
};


func int DIA_Lee_Background_Condition()
{
	if((MIS_Lee_Friedensangebot == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Background_Info()
{
	AI_Output(other,self, " DIA_Lee_Add_15_10 " );	// Why are you so eager to go to the mainland?
	AI_Output(self,other, " DIA_Lee_Add_04_11 " );	// As you know, I was a general in the king's army.
	AI_Output(self,other, " DIA_Lee_Add_04_12 " );	// But his sycophants betrayed me because I knew something I shouldn't have known.
	AI_Output(self,other, " DIA_Lee_Add_04_13 " );	// They put me in this colony, and the king allowed it.
	AI_Output(self,other, " DIA_Lee_Add_04_14 " );	// I had a lot of free time to think things through.
	AI_Output(self,other, " DIA_Lee_Add_04_15 " );	// I must take revenge.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//Королю?!
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//Королю...(решительно) И его прихвостням! Они все горько пожалеют о том, что сделали со мной.
};


instance DIA_Lee_RescueGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent = FALSE;
	description = "Я собираюсь отправиться в Долину Рудников.";
};


func int DIA_Lee_RescueGorn_Condition()
{
	if((Hagen_BringProof == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Я собираюсь отправиться в Долину Рудников.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Я и не надеялся, что ты долго задержишься на этой ферме.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Если ты возвращаешься в колонию, поищи там Горна. Паладины держат его там за решеткой.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Горн хороший человек, и он бы очень пригодился мне здесь, так что если у тебя появится шанс освободить парня, не упускай его.
	KnowsAboutGorn = TRUE;
};

instance DIA_Lee_RescueDarius(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueDarius_Condition;
	information = DIA_Lee_RescueDarius_Info;
	permanent = FALSE;
	description = " Any more requests? " ;
};

func int DIA_Lee_RescueDarius_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Lee_RescueGorn ) ==  TRUE ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueDarius_Info()
{
	AI_Output(other,self, " DIA_Lee_RescueDarius_01_00 " );	// Any other requests?
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_01 " );	// (thoughtfully) Yes, there is one. But I don't even know if I should ask you about it.
	AI_Output(other,self, " DIA_Lee_RescueDarius_01_02 " );	// Come on, post it already. What's the matter?
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_03 " );	// Remember, just before the fall of the Barrier, Gomez's men took over the ore mine in the New Camp?
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_04");	//Конечно.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_05 " );	// At the time, I knew what the bastard was going to do and took all the necessary precautions ahead of time.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_06 " );	// That's why I sent a small detachment of mercenaries there, led by my old friend - Darius!
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_07 " );	// He and his people had to strengthen the security of the mine and prepare it for a possible defense.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_08 " );	// However, as you can see, even these forces and preparations were not enough to hold back Gomez's attack.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_09 " );	// Most likely, we were betrayed then. And because of this betrayal, many good people died that day!
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_12 " );	// But I'm still tormented by one incomprehensible question.
	AI_Output(other,self, " DIA_Lee_RescueDarius_01_13 " );	// Which one?
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_14 " );	// After we managed to win the mine back, we searched it thoroughly.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_15 " );	// We went and collected the bodies of our fallen comrades along it, but no one found Darius's body!
	AI_Output(other,self, " DIA_Lee_RescueDarius_01_16 " );	// Maybe he just ran away?
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_17 " );	// Don't say that! I have known this man since the time when I personally commanded the royal troops.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_18 " );	// Darius wasn't a coward and you could always rely on him.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_19 " );	// In addition, the survivors of that day claimed to have seen him fight Gomez's guards.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_20 " );	// So, he fought to the end! Just like a real warrior should.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_21 " );	// Perhaps we missed something then, but there was no time to figure it out.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_22 " );	// The magical barrier fell, and we had to somehow get out of this cursed valley.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_23 " );	// Naturally, everyone forgot about this a long time ago. But not me!
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_24 " );	// I feel like I need to get to the bottom of that situation and find my old friend.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_25 " );	// Well, or at least what's left of it.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_26 " );	// That's why I want to ask you a favor. If you suddenly manage to get into the New Mine, look there for the answer to my question.
	AI_Output(self,other, " DIA_Lee_RescueDarius_01_28 " );	// Maybe you'll have better luck than us. Good?
	AI_Output(other,self, " DIA_Lee_RescueDarius_01_29 " );	// I'll try.
	MIS_MissOldFriend = LOG_Running;
	Log_CreateTopic(TOPIC_MissOldFriend,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MissOldFriend,LOG_Running);
	B_LogEntry(TOPIC_MissOldFriend, " Lee told me that he once sent a squad of mercenaries led by his friend Darius to protect the New Mine. Everyone knows that the attack was repulsed, but no one knows what happened to Darius. Lee asked me to look into the New Mine and try to find answers to his question in it. " );
};

instance DIA_Lee_RescueDarius_Done(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueDarius_Done_Condition;
	information = DIA_Lee_RescueDarius_Done_Info;
	permanent = FALSE;
	description = " Your old friend Darius will be joining you soon. " ;
};

func int DIA_Lee_RescueDarius_Done_Condition()
{
	if((MIS_MissOldFriend == LOG_Running) && (DariusNWIns == TRUE) && (DariusIsFree == TRUE) && (DariusNWIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueDarius_Done_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Lee_RescueDarius_Done_01_00 " );	// Your old friend Darius will be joining you soon.
	AI_Output(self,other, " DIA_Lee_RescueDarius_Done_01_01 " );	// I know, mate. He showed up here a couple of days ago.
	AI_Output(other,self, " DIA_Lee_RescueDarius_Done_01_02 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Lee_RescueDarius_Done_01_03 " );	// He's fine! True, he needs time to recover his strength after a grueling transition through the mountains.
	AI_Output(self,other, " DIA_Lee_RescueDarius_Done_01_04 " );	// By the way, he already managed to tell me about what he had to endure during all this time. And how did you help him get out of this difficult situation.
	AI_Output(self,other, " DIA_Lee_RescueDarius_Done_01_06 " );	// So on behalf of all the guys and myself, I thank you!
	AI_Output(self,other, " DIA_Lee_RescueDarius_Done_01_07 " );	// And as a token of my gratitude, I want to give you one thing.
	B_GiveInvItems(self,other,ItBe_NordmarBelt,1);
	AI_Output(self,other, " DIA_Lee_RescueDarius_Done_01_08 " );	// Here is the belt! It is made from the tough hide of a Nordmar snow lion. Trust me, you won't find this anywhere else.
	MIS_MissOldFriend = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MissOldFriend,LOG_SUCCESS);
	B_LogEntry(TOPIC_MissOldFriend, " Darius rejoined Lee's party, which made him very happy. He in turn gave me a real Nordmar snow lion skin belt. " );
};

instance DIA_Lee_Success(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent = FALSE;
	description = " I freed the Gorn. " ;
};


func int DIA_Lee_Success_Condition()
{
	if ((MY_RescueGorn ==  LOG_SUCCESS ) && (Chapter >=  3 ) && (other.guild ==  GIL_SLD ))
	{
		return TRUE;
	};
};

func void DIA_Lee_Success_Info()
{
	AI_Output(other, self, " DIA_Lee_Success_15_00 " );	// I freed Gorn.
	AI_Output(self,other, " DIA_Lee_Success_04_01 " );	// Yes, he already told me about it. Well done!
	AI_Output(self,other, " DIA_Lee_Success_04_02 " );	// He's worth more than Silvio and all his guys put together.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lee_AboutGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent = FALSE;
	description = "The Gorn told you about me? What happened to him? " ;
};


func int DIA_Lee_AboutGorn_Condition()
{
	if (( Capital <  3 ) && ( Npc_KnowsInfo ( other , DIA_Lee_RescueGorn ) ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lee_AboutGorn_Info()
{
	AI_Output(other,self, " DIA_Lee_AboutGorn_15_00 " );	// Gorn told you about me? What happened to him?
	AI_Output(self,other, " DIA_Lee_AboutGorn_04_01 " );	// You remember him, don't you?
	Info_ClearChoices(DIA_Lee_AboutGorn);
	Info_AddChoice(DIA_Lee_AboutGorn, " Let me try to remember... " ,DIA_Lee_AboutGorn_Who);
	Info_AddChoice(DIA_Lee_AboutGorn,"Конечно.",DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Lee_AboutGorn_Yes_15_00 " );	// It's clear.
	AI_Output(self,other, " DIA_Lee_AboutGorn_Yes_04_01 " );	// He allowed himself to be captured by the Paladins, and was sent back with an escort to the Valley of Mines.
	AI_Output(self,other, " DIA_Lee_AboutGorn_Yes_04_02 " );	// If the road to the Valley of Mines wasn't paved with Paladins and Orcs, I'd go with a couple of guys to free him.
	AI_Output(self,other, " DIA_Lee_AboutGorn_Yes_04_03 " );	// But that doesn't make sense. Poor fellow.
	Info_ClearChoices(DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output(other,self, " DIA_Lee_AboutGorn_Who_15_00 " );	// Let me try to remember...
	AI_Output(self,other, " DIA_Lee_AboutGorn_Who_04_01 " );	// A big, black-haired, bad guy with a big axe, he recaptured our mine with your help. It was in the colony.
};


instance DIA_Lee_WegenBullco (C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent = FALSE;
	description = " Onar now has a few fewer sheep thanks to Bulko... " ;
};


func int DIA_Lee_WegenBullco_Condition()
{
	if ((Chapter <  4 ) && (MY_Pepe_KillWolves ==  LOG_SUCCESS ) && (Onar_WegenPepe ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_WegenBullco_Info()
{
	AI_Output(other,self, " DIA_Lee_Add_15_00 " );	// Onar now has a few fewer sheep thanks to Bulko...
	AI_Output(self,other, " DIA_Lee_Add_04_01 " );	// Oh, don't pester me with such nonsense! I have enough problems without it.
	if (( Bullco_scharf ==  TRUE ) &&  ! Npc_IsDead ( Bullco ) )
	{
		AI_Output(other,self, " DIA_Lee_Add_15_02 " );	// Me too. Bulko seems to see the problem in me. He wants me to leave the farm...
		AI_Output(self,other, " DIA_Lee_Add_04_03 " );	// Yes, so what? Stand up for yourself.
		AI_Output(self,other, " DIA_Lee_Add_04_04 " );	// You can tell him to keep a low profile, or I'll deduct the missing sheep from his pay...
	};
};


instance DIA_Lee_Report(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Report_Condition;
	information = DIA_Lee_Report_Info;
	permanent = FALSE;
	description = " I come from the Valley of Mines. " ;
};


func int DIA_Lee_Report_Condition()
{
	if ((EnterOW_Chapter2 ==  TRUE ) && (Chapter <=  3 ))
	{
		return TRUE;
	};
};

func void DIA_Lee_Report_Info()
{
	AI_Output(other,self, " DIA_Lee_Add_15_18 " );	// I come from the Valley of Mines. The castle located there was attacked by dragons!
	AI_Output(self,other, " DIA_Lee_Add_04_19 " );	// So it's true! Lares said that rumors about dragons were circulating in the city... I didn't believe it...
	AI_Output(self,other, " DIA_Lee_Add_04_20 " );	// What about paladins?
	AI_Output(other, self, " DIA_Lee_Add_15_21 " );	// They suffered heavy losses.

	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other, " DIA_Lee_Add_04_22 " );	// Good! Maybe now Lord Hagen will think more carefully about my proposal...
		AI_Output(self,other, " DIA_Lee_Add_04_23 " );	// And if not... (hard) Then we'll find another way to get out of here...
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_Add_04_24 " );	// Good! Maybe this will force Lord Hagen to go with his people to the Valley of Mines...
		AI_Output(self,other, " DIA_Lee_Add_04_25 " );	// The fewer paladins left here, the better.
	};
};

instance DIA_Lee_ArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorM_Condition;
	information = DIA_Lee_ArmorM_Info;
	permanent = TRUE;
	description = " How about better armor? " ;
};

func int DIA_Lee_ArmorM_Condition()
{
	if((Kapitel < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorM_Info()
{
	AI_Output(other,self, " DIA_Lee_ArmorM_15_00 " );	// What about better armor?
	AI_Output(self,other, " DIA_Lee_ArmorM_04_02 " );	// I have some decent armor for you! Of course, if you have gold.
	Info_ClearChoices(DIA_Lee_ArmorM);
	Info_AddChoice(DIA_Lee_ArmorM,Dialog_Back,DIA_Lee_ArmorM_back);

	if ((Lee_SldMGiven ==  FALSE ) && (Chapter >=  1 ))
	{
		Info_AddChoice(DIA_Lee_ArmorM, " Mercenary Armor (Price: 2000 coins) " ,DIA_Lee_BuyArmorM_Ok);
	};
	if((Lee_SldHGiven == FALSE) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Lee_ArmorM, " Heavy Mercenary Armor (Price: 8000 coins) " ,DIA_Lee_BuyArmorH_Ok);
	};
};

func void DIA_Lee_ArmorM_back()
{
	Info_ClearChoices(DIA_Lee_ArmorM);
};

func void DIA_Lee_BuyArmorM_Ok()
{
	AI_Output(other,self, " DIA_Lee_BuyArmorM_15_00 " );	// Give me the armor.

	if(B_GiveInvItems(other,self,ItMi_Gold,2000))
	{
		AI_Output(self,other, " DIA_Lee_BuyArmorM_04_01 " );	// Hold on! This is very good armor.
		CreateInvItems(other,itar_sld_M,1);
		AI_EquipArmor(other,itar_sld_M);
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_BuyArmorM_04_02 " );	// But it's not a gift! First I want to see gold!
	};
};

func void DIA_Lee_BuyArmorH_Ok()
{
	AI_Output(other,self, " DIA_Lee_BuyArmorH_15_00 " );	// Give me the heavy armor.

	if(B_GiveInvItems(other,self,ItMi_Gold,8000))
	{
		AI_Output(self,other, " DIA_Lee_BuyArmorH_04_01 " );	// Hold on! This is very good armor! I wear these myself.
		CreateInvItems(other,ItAr_Sld_H,1);
		AI_EquipArmor(other,ItAr_Sld_H);
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_BuyArmorH_04_02 " );	// You know the rules. Gold first!
	};
};


instance DIA_Lee_Richter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Richter_Condition;
	information = DIA_Lee_Richter_Info;
	permanent = FALSE;
	description = " Don't you have a job for me yet? " ;
};


func int DIA_Lee_Richter_Condition()
{
	if ((Chapter >=  3 ) && ((hero.guild ==  GIL_SLD ) || (hero.guild ==  GIL_DJG )) && (Npc_IsDead(Richter) ==  FALSE ) && ( CAPTAINNORDERDIAWAY  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lee_Richter_Info()
{
	AI_Output(other,self, " DIA_Lee_Richter_15_00 " );	// Don't you have a job for me yet?
	AI_Output(self,other, " DIA_Lee_Richter_04_01 " );	// It's not enough for you, is it? I think you already have enough problems. What else do you need?
	AI_Output(other,self, " DIA_Lee_Richter_15_02 " );	// Another task. I'm a mercenary, remember?
	AI_Output(self,other, " DIA_Lee_Richter_04_03 " );	// Good. I have something. Just right for you.
	AI_Output(self,other, " DIA_Lee_Richter_04_04 " );	// I have to get even with the judge in the city. I would certainly prefer to do it myself.
	AI_Output(self,other, " DIA_Lee_Richter_04_05 " );	// But the paladins won't let me near his house even with a cannon shot.
	AI_Output(self,other, " DIA_Lee_Richter_04_06 " );	// This is a very delicate matter. So listen carefully. You will go to the judge and offer him your services.
	AI_Output(self,other, " DIA_Lee_Richter_04_07 " );	// You should try to gain his trust and do all the dirty work until you find something that discredits him.
	AI_Output(self,other, " DIA_Lee_Richter_04_08 " );	// This pig has done so many dirty tricks that it stinks from a mile away.
	AI_Output(self,other, " DIA_Lee_Richter_04_09 " );	// Give me something I can use to tarnish his name in the face of the militia. I want him to spend the rest of his days behind bars.
	AI_Output(self,other, " DIA_Lee_Richter_04_10 " );	// But I don't want you to kill him. This is too little for him. I want him to suffer, you understand?
	AI_Output(self,other, " DIA_Lee_Richter_04_11 " );	// Do you think you can handle it?
	Log_CreateTopic(TOPIC_RichterLakai,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai,LOG_Running);
	B_LogEntry(TOPIC_RichterLakai, " Lee wants me to find evidence incriminating Judge Khorinis. To do this, I must offer my services to the judge and keep my ears open. " );
	MIS_Lee_JudgeRichter = LOG_Running;
	Info_ClearChoices(DIA_Lee_Richter);
	Info_AddChoice(DIA_Lee_Richter, " I won't do this. " ,DIA_Lee_Richter_nein);
	Info_AddChoice(DIA_Lee_Richter, " No problem. How much? " ,DIA_Lee_Richter_wieviel);
};

func void DIA_Lee_Richter_how much()
{
	AI_Output(other,self, " DIA_Lee_Richter_wieviel_15_00 " );	// No problem. How?
	AI_Output(self,other, " DIA_Lee_Richter_wieviel_04_01 " );	// Your reward depends on what you tell me. So try.
	Info_ClearChoices(DIA_Lee_Richter);
};

func void DIA_Lee_Richter_no()
{
	AI_Output(other,self, " DIA_Lee_Richter_nein_15_00 " );	// I won't do this. I don't want to serve this pig.
	AI_Output(self,other, " DIA_Lee_Richter_nein_04_01 " );	// Don't be so nervous. Remember that it was he who put you behind bars and put you behind the Barrier. Or have you forgotten it?
	AI_Output(self,other, " DIA_Lee_Richter_nein_04_02 " );	// Do as you please, but I hope you make the right decision.
	Info_ClearChoices(DIA_Lee_Richter);
};


instance DIA_Lee_RichterBeweis (C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_RichterBeweis_Condition;
	information = DIA_Lee_RichterBeweis_Info;
	description = " I found something discrediting the judge. " ;
};


func int DIA_Lee_RichterBeweis_Condition()
{
	if ((Chapter >=  3 ) && ( CAPTAINNORTHERDIAWAY  ==  FALSE ) && (MY_Lee_JudgeRichter == LOG_Running) && Npc_HasItems(other,ItWr_RichterComproBrief_MY) && ((hero.guild ==  GIL_SLD ) || (hero.guild ==  GIL_DJG )) ; )
	{
		return TRUE;
	};
};

func void DIA_Lee_RichterBeweis_Info()
{
	AI_Output(other,self, " DIA_Lee_RichterBeweise_15_00 " );	// I found something to discredit the judge.
	AI_Output(self,other, " DIA_Lee_RichterBeweise_04_01 " );	// Really? And what?
	AI_Output(other,self, " DIA_Lee_RichterBeweise_15_02 " );	// He hired thugs to rob Governor Khorinis.
	AI_Output(other,self, " DIA_Lee_RichterBeweise_15_03 " );	// Soon after, he arrested them and took all the gold for himself.
	AI_Output(other,self, " DIA_Lee_RichterBeweise_15_04 " );	// I brought you a written order from the judge to these thugs as proof.
	AI_Output(self,other, " DIA_Lee_RichterBeweise_04_05 " );	// Show.
	B_GiveInvItems(other,self,ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();
	if (Npc_IsDead(Richter) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lee_RichterBeweise_04_06 " );	// Finally. That should be enough to make him suffer. I am impressed.
		AI_Output(self,other, " DIA_Lee_RichterBeweise_04_07 " );	// I'm willing to pay well for this. Keep your reward.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_Lee_JudgeRichter = LOG_SUCCESS;
		B_GivePlayerXP(XP_JudgeRichter);
		AI_Output(self,other, " DIA_Lee_RichterBeweise_04_08 " );	// And don't tell anyone about this, okay?
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_RichterBeweise_04_09 " );	// Class. But the incident is already over. The judge is dead.
		AI_Output(self,other, " DIA_Lee_RichterBeweise_04_10 " );	// Some idiot took him out of this world. Well, okay. Also good.
		AI_Output(self,other, " DIA_Lee_RichterBeweise_04_11 " );	// Hold your money. More papers don't matter to me.
		CreateInvItems(self,ItMi_Gold,250);
		B_GiveInvItems(self,other,ItMi_Gold,250);
		MIS_Lee_JudgeRichter = LOG_FAILED;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Lee_TalkAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_TalkAboutBennet_Condition;
	information = DIA_Lee_TalkAboutBennet_Info;
	permanent = FALSE;
	description = " What about Bennett? " ;
};


func int DIA_Lee_TalkAboutBennet_Condition();
{
	if ((MIS_RescueBannet == LOG_Running) && (Chapter ==  3 ))
	{
		return TRUE;
	};
};

func void DIA_Lee_TalkAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Что насчет Беннета?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Так ты уже знаешь. Эти ублюдки посадили его за решетку. Вот и все.

	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Как будто мне не хватает проблем с моими людьми - теперь я должен заботиться еще и о паладинах.
	};
};


instance DIA_Lee_DoAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_DoAboutBennet_Condition;
	information = DIA_Lee_DoAboutBennet_Info;
	permanent = FALSE;
	description = "Что ты собираешься сделать для Беннета?";
};


func int DIA_Lee_DoAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_TalkAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_DoAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Что ты собираешься сделать для Беннета?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Я пока не знаю. Часть парней готовы хоть сейчас ворваться в город и вбить зубы лорду Хагену по самые гланды.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//К счастью, у нас недостаточно людей для такой операции, и, кроме того, это не в моем стиле.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//То есть ты собираешься сидеть сложа руки?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//Конечно нет.
	B_LogEntry(TOPIC_RescueBennet,"Если я не смогу доказать невиновность Беннета достаточно быстро, Ли ничего не может гарантировать. Его люди могут не выдержать и напасть на город в любой момент, чтобы освободить Беннета.");

	if(!Npc_IsDead(Lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Ларес все еще в городе и пытается выяснить, как можно вытащить Беннета.
		AI_Output(self,other, " DIA_Lee_DoAboutBennet_04_06 " );	// In the meantime, I'll try to calm my guys down. It is hoped that Lares will not need too much time for this.
	};
	if(!Npc_IsDead(Buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other, " DIA_Lee_DoAboutBennet_04_07 " );	// Oh, yes. I almost forgot... Buster wants to chat with you. He doesn't tell me what. Maybe you should find it?
	};
};


instance DIA_Lee_CanHelpYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_CanHelpYou_Condition;
	information = DIA_Lee_CanHelpYou_Info;
	permanent = FALSE;
	description = " Can I help with Bennett in some way? " ;
};


func int DIA_Lee_CanHelpYou_Condition()
{
	if (( MIS_RescueBennet == LOG_Running ) && Npc_KnowsInfo ( other , DIA_Lee_DoAboutBennet ) )
	{
		return TRUE;
	};
};

func void DIA_Lee_CanHelpYou_Info()
{
	AI_Output(other,self, " DIA_Lee_CanHelpYou_15_00 " );	// Can I help with Bennet in some way?
	AI_Output(self,other, " DIA_Lee_CanHelpYou_04_01 " );	// Of course, but remember that in such a case you need a sober mind and cold calculation.
	AI_Output(self,other, " DIA_Lee_CanHelpYou_04_02 " );	// Innos is a witness, there are enough hot idiots here already.
	AI_Output(self,other, " DIA_Lee_CanHelpYou_04_03 " );	// Go to town, maybe you can find a way to get Bennet out of there.
	AI_Output(self,other, " DIA_Lee_CanHelpYou_04_04 " );	// But don't take this too long, I don't know how long I can keep the guys under control.
};


var int DIA_Lee_AnyNews_OneTime;

instance DIA_Lee_AnyNews(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_AnyNews_Condition;
	information = DIA_Lee_AnyNews_Info;
	permanent = TRUE;
	description = " Any news on Bennett? " ;
};


func int DIA_Lee_AnyNews_Condition()
{
	if ((MIS_RescueBennet !=  FALSE ) && Npc_KnowsInfo(other, DIA_Lee_DoAboutBennet) && (DIA_Lee_AnyNews_OneTime ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_AnyNews_Info()
{
	AI_Output(other,self, " DIA_Lee_AnyNews_15_00 " );	// Any news on Bennett?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lee_AnyNews_04_01 " );	// Well, at least prison didn't seem to take a toll on his health.
		AI_Output(self,other, " DIA_Lee_AnyNews_04_02 " );	// Great job.
		if(DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_AnyNews_04_03 " );	// No, we still don't know enough.
	};
};


instance DIA_Lee_SYLVIO(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_SYLVIO_Condition;
	information = DIA_Lee_SYLVIO_Info;
	description = " What's happened lately? " ;
};


func int DIA_Lee_SYLVIO_Condition()
{
	if((MIS_ReadyforChapter4 == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_SYLVIO_Info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Что произошло за последнее время?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Сильвио, ублюдок, прослышал о драконах в Долине Рудников и свел с ума всех здесь на ферме баснями о них.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Он пытался уговорить парней пойти с ним в Долину Рудников. Он обещал им славу, почет, золото и еще кучу всяческих благ.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Большинство не особенно воодушевилось идеей быть убитым ради Сильвио, но все же нашлось несколько идиотов, которые клюнули на его наживку.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Все закончилось тем, что они вооружились у Беннета, а затем свалили.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(облегченно) Ах. Откровенно говоря, я даже рад, что Сильвио наконец ушел с фермы.
};


instance DIA_Lee_KAP4_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP4_EXIT_Condition;
	information = DIA_Lee_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_CanTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_CanTeach_Condition;
	information = DIA_Lee_CanTeach_Info;
	permanent = TRUE;
	description = " Can you teach me? " ;
};


func int DIA_Lee_CanTeach_Condition()
{
	if ((Chapter >=  4 ) && (Lee_TeachPlayer ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Lee_CanTeach_15_00 " );	// Can you teach me?
	AI_Output(self,other, " DIA_Lee_CanTeach_04_01 " );	// I can show you how to fight with two-handed weapons.
	if(other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other, " DIA_Lee_CanTeach_04_02 " );	// But I don't have time to teach you the basics.
		AI_Output(self,other, " DIA_Lee_CanTeach_04_03 " );	// Once you reach a certain level, I'm at your disposal. In the meantime, find another teacher.
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_CanTeach_04_04 " );	// I heard you're very good. But I bet I can still teach you a trick or two.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry(Topic_SoldierTeacher, " Lee can teach me how to use two-handed weapons. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Lee_CanTeach_04_05 " );	// So if you want, I can train you. However, not free.
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Сколько?
			AI_Output(self,other, " DIA_Lee_CanTeach_04_07 " );	// 1000 coins - and consider that we have agreed.
			Info_ClearChoices(DIA_Lee_CanTeach);
			Info_AddChoice(DIA_Lee_CanTeach, " It's too expensive. " ,DIA_Lee_CanTeach_No);
			if(Npc_HasItems(other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice(DIA_Lee_CanTeach, " Agree. Gold here. " ,DIA_Lee_CanTeach_Yes);
			};
		};
	};
};

func void DIA_Lee_CanTeach_No()
{
	AI_Output(other,self, " DIA_Lee_CanTeach_No_15_00 " );	// This is too expensive for me.
	AI_Output(self,other, " DIA_Lee_CanTeach_No_04_01 " );	// Think at your leisure. Teachers of my caliber are rare.
	Info_ClearChoices(DIA_Lee_CanTeach);
};

func void DIA_Lee_CanTeach_Yes()
{
	AI_Output(other,self, " DIA_Lee_CanTeach_Yes_15_00 " );	// Agreed. Here is gold.
	AI_Output(self,other, " DIA_Lee_CanTeach_Yes_04_01 " );	// Okay, trust me, I'm worth the money.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Lee_CanTeach);
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher, " Lee can teach me how to use two-handed weapons. " );
};


instance DIA_Lee_Teach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_Teach_Condition;
	information = DIA_Lee_Teach_Info;
	permanent = TRUE;
	description = " Let's start learning. " ;
};


func int DIA_Lee_Teach_Condition()
{
	if(Lee_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Teach_Info()
{
	AI_Output(other,self, " DIA_Lee_Teach_15_00 " );	// Let's start training.
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_Teach);
};

func void DIA_Lee_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other, " DIA_DIA_Lee_Teach_2H_1_04_00 " );	// Now you are a true master of two-handed combat.
		AI_Output(self,other, " DIA_DIA_Lee_Teach_2H_1_04_01 " );	// You don't need teachers anymore.
	};
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other, " DIA_Lee_Teach_2H_5_04_00 " );	// Now you are a true master of two-handed combat.
		AI_Output(self,other, " DIA_Lee_Teach_2H_5_04_01 " );	// You don't need teachers anymore.
	};
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};


instance DIA_Lee_DRACHENEI(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_DRACHENEI_Condition;
	information = DIA_Lee_DRACHENEI_Info;
	description = " The lizard people are laying dragon eggs all over the island. " ;
};


func int DIA_Lee_DRACHENEI_Condition()
{
	if ( Npc_HasItems ( other , ItAt_MY_DragonEgg ) && ( CAPTAINNORTHWEST  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info()
{
	AI_Output(other,self, " DIA_Lee_DRACENEI_15_00 " );	// Lizard people lay dragon eggs all over the island.
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other, " DIA_Lee_DRACENEI_04_01 " );	// I could understand this before. It's time to get out of here.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self, " DIA_Lee_DRACENEI_15_02 " );	// What should I do with them?
		AI_Output(self,other, " DIA_Lee_DRACENEI_04_03 " );	// Break them. What else?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Может быть, из скорлупы можно будет сделать доспехи или еще что-нибудь.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Похоже, они очень крепкие. Поговори об этом с Беннетом.
		B_LogEntry(TOPIC_DRACHENEIER,"Ли не знает, что делать с драконьим яйцом. Он отправил меня к кузнецу Беннету.");
	};
};


instance DIA_Lee_KAP4_Perm(C_Info)
{
	npc = SLD_800_Lee;
	nr = 49;
	condition = DIA_Lee_KAP4_Perm_Condition;
	information = DIA_Lee_KAP4_Perm_Info;
	permanent = TRUE;
	description = "Как идут дела на ферме?";
};


func int DIA_Lee_KAP4_Perm_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_Perm_Info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Как идут дела на ферме?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Ну, с тех пор как Сильвио свалил, здесь стало довольно спокойно.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//По-моему, это тоже неплохо.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Но, к сожалению, у нас не стало меньше работы. Парни все чаще и чаще выражают недовольство, им теперь приходится работать еще и за людей Сильвио.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Но это мои проблемы. Я справлюсь.
};


instance DIA_Lee_KAP5_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP5_EXIT_Condition;
	information = DIA_Lee_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_GetShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GetShip_Condition;
	information = DIA_Lee_GetShip_Info;
	description = " Do you know how I can capture a paladin ship? " ;
};


func int DIA_Lee_GetShip_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath ==  TRUE ) && ( CAPITALCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_GetShip_Info()
{
	AI_Output(other, self, " DIA_Lee_GetShip_15_00 " );	// Do you know how I can capture a paladin ship?
	AI_Output(self,other, " DIA_Lee_GetShip_04_01 " );	// Do you think I'd still be sitting here if I knew? This ship is more heavily guarded than the ore transports in the old colony.
	AI_Output(other,self, " DIA_Lee_GetShip_15_02 " );	// There must be a way to get on the ship.
	AI_Output(self,other, " DIA_Lee_GetShip_04_03 " );	// Of course. Getting on board is easy.
	Log_CreateTopic(Topic_Ship,LOG_MISSION);
	Log_SetTopicStatus(Topic_Ship,LOG_Running);
	if((MIS_Lee_JudgeRichter == LOG_SUCCESS) && (Npc_IsDead(Richter) == FALSE))
	{
		AI_Output(self,other, " DIA_Lee_GetShip_04_04 " );	// You know, we have a judge under his heel. You must go to him and extract from him an official letter that will allow us to enter the ship.
		MIS_RichtersPermissionForShip = LOG_Running;
		B_LogEntry(Topic_Ship, " Lee thinks the best way to get on a paladin ship is to get a letter of authority from a judge. But is he willing to give such a letter of his own free will. " );
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Lee_GetShip_04_05 " );	// I have a fake authorization letter. Seeing him, the ship's guards will let you pass.
		B_LogEntry(Topic_Ship, " Oh, old Lee! He got a fake letter that will let me get on the paladin ship. " );
	};
	AI_Output(self,other, " DIA_Lee_GetShip_04_06 " );	// But that's not all. To control the ship, you will need a captain, a crew and much more.
	AI_Output(self,other, " DIA_Lee_GetShip_04_07 " );	// There is a lot of work to be done.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	Info_ClearChoices(DIA_Lee_GetShip);
	Info_AddChoice(DIA_Lee_GetShip,Dialog_Back,DIA_Lee_GetShip_back);
	Info_AddChoice(DIA_Lee_GetShip, " Who should I take on my team? " ,DIA_Lee_GetShip_crew);
	if (Npc_IsDead(Torlof) ==  FALSE )
	{
		Info_AddChoice(DIA_Lee_GetShip, " Do you know anyone who could pilot a ship? " ,DIA_Lee_GetShip_torlof);
	};
};

func void DIA_Lee_GetShip_torlof()
{
	AI_Output(other,self, " DIA_Lee_GetShip_torlof_15_00 " );	// Do you know anyone who can steer the ship?
	AI_Output(self,other, " DIA_Lee_GetShip_torlof_04_01 " );	// As far as I know, Torlof went to sea. He understands the maritime business.
	TORLOFCANBECAPITAN = TRUE;
	B_LogEntry(Topic_Captain, " Torlof used to be a good sailor. Maybe he could be my captain. " );
};

func void DIA_Lee_GetShip_crew()
{
	AI_Output(other,self, " DIA_Lee_GetShip_crew_15_00 " );	// And who should I take on the team?
	AI_Output(self,other, " DIA_Lee_GetShip_crew_04_01 " );	// This is up to you to decide. But I would only take people I trust. Do you know many people you can trust?
	AI_Output(self,other, " DIA_Lee_GetShip_crew_04_02 " );	// If you need a blacksmith on your team, try talking Bennett over. You won't find better than him.
	B_LogEntry(Topic_Crew, " As far as my team is concerned, Lee can't help me much here. But he did give me advice to only recruit people I can trust. I'll probably ask Bennett, maybe he'll be interested. " );
};

func void DIA_Lee_GetShip_back()
{
	Info_ClearChoices(DIA_Lee_GetShip);
};


instance DIA_Lee_GotRichtersPermissionForShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GotRichtersPermissionForShip_Condition;
	information = DIA_Lee_GotRichtersPermissionForShip_Info;
	description = " Email worked. " ;
};


func int DIA_Lee_GotRichtersPermissionForShip_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GotRichtersPermissionForShip_Info()
{
	AI_Output(other,self, " DIA_Lee_GotRichtersPermissionForShip_15_00 " );	// Letter worked. The ship is mine now. The judge was very helpful.
	AI_Output(self,other, " DIA_Lee_GotRichtersPermissionForShip_04_01 " );	// Good. So, all your humiliation in front of this bastard was not in vain.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lee_StealShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StealShip_Condition;
	information = DIA_Lee_StealShip_Info;
	permanent = FALSE;
	description = " I want to steal a ship. " ;
};


func int DIA_Lee_StealShip_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lee_GetShip ) && ( hero . guild ==  GIL_DJG ) && ( MIS_RichtersPermissionForShip ==  0 ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lee_StealShip_Info()
{
	AI_Output(other,self, " DIA_Lee_StealShip_15_00 " );	// I want to steal a ship.
	AI_Output(self,other, " DIA_Lee_StealShip_04_01 " );	// And how should this happen?
	AI_Output(other,self, " DIA_Lee_StealShip_15_02 " );	// Very simple! I go there, show your papers and take the ship.
	AI_Output(self,other, " DIA_Lee_StealShip_04_03 " );	// Okay, whatever you say! Here, take them. Hope you know what you're doing.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
};


instance DIA_Lee_KnowWhereEnemy(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KnowWhereEnemy_Condition;
	information = DIA_Lee_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = " Will you come with me on the ship? " ;
};


func int DIA_Lee_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lee_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Ты пойдешь со мной на корабле?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Ты шутишь? Конечно. Мне не терпится поквитаться кое с кем на материке.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Кроме того, я могу обучить тебя искусству владения одноручным и двуручным оружием. Это может оказаться очень полезным.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew, " Li can't wait to see the mainland again. He offered me his support. I'd be hard-pressed to find such a martial arts teacher anywhere else. " );
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self, " DIA_Lee_KnowWhereEnemy_15_03 " );	// All seats on the ship are currently filled, but I'll be back if there's any vacancy.
	}
	else
	{
		Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy, " I'll let you know if I need you. " ,DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Пакуй свои вещи!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lee_KnowWhereEnemy_Yes()
{
	AI_Output(other,self, " DIA_Lee_KnowWhereEnemy_Yes_15_00 " );	// Pack your things!
	AI_Output(self,other, " DIA_Lee_KnowWhereEnemy_Yes_04_01 " );	// What? Right now?
	AI_Output(other,self, " DIA_Lee_KnowWhereEnemy_Yes_15_02 " );	// Yes, I'm leaving soon, and if you're sailing with me, come to the harbor. Meet me on the ship.
	AI_Output(self,other, " DIA_Lee_KnowWhereEnemy_Yes_04_03 " );	// I've been waiting for this moment for so long. I will be there.
	B_GivePlayerXP(XP_Crewmember_Success);
	Lee_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};

func void DIA_Lee_KnowWhereEnemy_No()
{
	AI_Output(other,self, " DIA_Lee_KnowWhereEnemy_No_15_00 " );	// I'll let you know if I need you.
	AI_Output(self,other, " DIA_Lee_KnowWhereEnemy_No_04_01 " );	// Hope you know what you're doing. But remember that there are never too many good fighters.
	AI_Output(self,other, " DIA_Lee_KnowWhereEnemy_No_04_02 " );	// (grins) Unless it's complete idiots like Silvio.
	Lee_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};


instance DIA_Lee_LeaveMyShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeaveMyShip_Condition;
	information = DIA_Lee_LeaveMyShip_Info;
	permanent = TRUE;
	description = " I still can't take you with me! " ;
};


func int DIA_Lee_LeaveMyShip_Condition()
{
	if((Lee_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info()
{
	AI_Output(other,self, " DIA_Lee_LeaveMyShip_15_00 " );	// I still can't take you with me!
	AI_Output(self,other, " DIA_Lee_LeaveMyShip_04_01 " );	// As you say. You know where to find me, if anything!
	Lee_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lee_StillNeedYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StillNeedYou_Condition;
	information = DIA_Lee_StillNeedYou_Info;
	permanent = TRUE;
	description = " I still need you! " ;
};


func int DIA_Lee_StillNeedYou_Condition()
{
	if(((Lee_IsOnBoard == LOG_OBSOLETE) || (Lee_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_StillNeedYou_Info()
{
	AI_Output(other,self, " DIA_Lee_StillNeedYou_15_00 " );	// I still need you!
	if(Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other, " DIA_Lee_StillNeedYou_04_01 " );	// I knew you'd need me! See you on the ship.
		Lee_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_StillNeedYou_04_02 " );	// You know, you wouldn't go! First you told me to come, then you sent me back!
		AI_Output(self,other, " DIA_Lee_StillNeedYou_04_03 " );	// Find yourself another idiot!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lee_KAP6_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP6_EXIT_Condition;
	information = DIA_Lee_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_kapitelorcattack_condition;
	information = dia_lee_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = " We seem to have a little problem. " ;
};


func int dia_lee_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (LEEBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lee_NW_KapitelOrcAttack_01_00 " );	// Looks like we have a little problem.
	AI_Output(self,other, " DIA_Lee_NW_KapitelOrcAttack_01_01 " );	// If you're talking about the orcs... Pyrokar already told me what happened.
	AI_Output(self,other, " DIA_Lee_NW_KapitelOrcAttack_01_03 " );	// And there can be only one solution - to fight your way through the captured city.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_04");	//И не вздумай предлагать мне руну телепортации. (серьезно) Мне она ни к чему!
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_05");	//Не для того я долгие годы был генералом армии короля, чтобы сейчас бежать с поля боя, как последний трус.
	if(LARESBACKNW == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_09");	//Да, и еще. Не предлагай руну Ларесу - он все равно не бросит меня одного.
		LEEBATTLETHROUGTH = TRUE;
		LARESBATTLETHROUGTH = TRUE;
		PERMCOUNTBACKNW = PERMCOUNTBACKNW + 2;
		B_LogEntry( TOPIC_HELPCREW , " Lee has decided that he will fight his way out of the captured city. The same goes for Lares. I think the orcs will be in trouble soon! " );
	}
	else
	{
		LEEBATTLETHROUGTH = TRUE;
		PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
		B_LogEntry( TOPIC_HELPCREW , " Lee has decided that he will fight his way out of the captured city. I think the orcs will be in trouble soon! " );
	};
	AI_Output(other,self, " DIA_Lee_NW_KapitelOrcAttack_01_12 " );	// Good. Then see you soon! Hope we see you again.
	AI_Output(self,other, " DIA_Lee_NW_KapitelOrcAttack_01_13 " );	// That's the way it will be, mate. You don't have to worry.
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_LEE_NW_ESCAPE(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_escape_condition;
	information = dia_lee_nw_escape_info;
	permanent = FALSE;
	description = " It's good to see you alive and well! " ;
};


func int dia_lee_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Lee_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lee_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self, " DIA_Lee_NW_Escape_01_01 " );	// Glad to see you alive and well!
	AI_Output(self,other, " DIA_Lee_NW_Escape_01_02 " );	// To be honest... (smiling) I love you too!
	AI_Output(other,self, " DIA_Lee_NW_Escape_01_03 " );	// So you managed to break through the city?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other, " DIA_Lee_NW_Escape_01_04 " );	// I, as you can see, succeeded. However, not everyone is so lucky.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other, " DIA_Lee_NW_Escape_01_05 " );	// Many of us have been taken prisoner by the orcs.
			B_LogEntry( TOPIC_HELPCREW , " I met Lee again at Onar's farm, alive and well. Good news! " );
			Log_AddEntry( TOPIC_HELPCREW , " There were some bad ones though! He told me that a lot of the guys were captured by the orcs during the break through the city. I hope they are still alive! " );
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other, " DIA_Lee_NW_Escape_01_06 " );	// Many of us have been taken prisoner by the orcs. There are those who died fighting them!
			B_LogEntry( TOPIC_HELPCREW , " I met Lee again at Onar's farm, alive and well. Good news! " );
			Log_AddEntry( TOPIC_HELPCREW , "The truth was not without bad ones! He told me that many guys were captured by the orcs during the breakthrough through the city. There are those who died. " );
		};
		AI_Output(other,self, " DIA_Lee_NW_Escape_01_07 " );	// Yes, that's not good news.
		AI_Output(self,other, " DIA_Lee_NW_Escape_01_08 " );	// There's nothing you can do about it.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Lee_NW_Escape_01_10 " );	// As you can see! And it was possible for everyone who was then on the ship.
		AI_Output(other,self, " DIA_Lee_NW_Escape_01_11 " );	// Yes, that's just great news!
		AI_Output(self,other, " DIA_Lee_NW_Escape_01_12 " );	// (smiling) I agree with you.
		B_LogEntry( TOPIC_HELPCREW , " At Onar's farm, I met Lee again, alive and well. That's good news! As well as the fact that all the other guys managed to get out of the city as well. " );
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_LEE_NW_WHEREWOLF(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_wherewolf_condition;
	information = dia_lee_nw_wherewolf_info;
	permanent = FALSE;
	description = " Where's the mercenary named Wolf? " ;
};


func int dia_lee_nw_wherewolf_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFMEETINPRISON == FALSE) && (WOLFCAPTURED == TRUE) && !Npc_IsDead(SLD_811_Wolf))
	{
		return TRUE;
	};
};

func void dia_lee_nw_wherewolf_info()
{
	AI_Output(other,self, " DIA_Lee_NW_WhereWolf_01_01 " );	// Where is the mercenary named Wolf?
	AI_Output(self,other, " DIA_Lee_NW_WhereWolf_01_02 " );	// I don't know this.
	AI_Output(other,self,"DIA_Lee_NW_WhereWolf_01_03");	//Но он ведь тоже прорывался с вами через город. Не так ли?
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_04");	//Да. Но когда завязался бой, я потерял его из виду.
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_05");	//Так что больше о нем мне ничего неизвестно.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Однако на ферме Вольфа не оказалось. Ли тоже не знает, где он.");
};


instance DIA_LEE_NW_WHYORKNOT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whyorknot_condition;
	information = dia_lee_nw_whyorknot_info;
	permanent = FALSE;
	description = " Why haven't the orcs attacked the farm yet?! " ;
};


func int dia_lee_nw_whyorknot_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whyorknot_info()
{
	AI_Output(other,self, " DIA_Lee_NW_WhyOrkNot_01_01 " );	// Why haven't the orcs attacked the farm yet?
	AI_Output(self,other, " DIA_Lee_NW_WhyOrkNot_01_02 " );	// I don't know this myself yet. (thoughtfully) Perhaps they are waiting for something or plotting something.
	AI_Output(self,other, " DIA_Lee_NW_WhyOrkNot_01_05 " );	// Surely they will soon storm, and I'm afraid that we will not be able to oppose this.
};


instance DIA_LEE_NW_WHATABOUTPAL(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whataboutpal_condition;
	information = dia_lee_nw_whataboutpal_info;
	permanent = FALSE;
	description = " I've come to you with an offer from Lord Hagen himself! " ;
};


func int dia_lee_nw_whataboutpal_condition()
{
	if(Npc_KnowsInfo(hero,dia_lee_nw_whyorknot))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whataboutpal_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lee_NW_WhatAboutPal_01_05 " );	// I've come to you with an offer from Lord Hagen himself!
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_06 " );	// (surprised) And what does the head of the paladins want from me?
	AI_Output(other,self, " DIA_Lee_NW_WhatAboutPal_01_07 " );	// He invites you to combine all our forces to give the orcs an open fight.
	AI_Output(other,self, " DIA_Lee_NW_WhatAboutPal_01_08 " );	// He doesn't have enough people for that right now, but together I think we'll have a chance of success!
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_11 " );	// This is all rather unexpected.
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_13 " );	// Well, in common sense, you really can hardly refuse him now.
	AI_Output(other,self, " DIA_Lee_NW_WhatAboutPal_01_15 " );	// So do you agree?
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_16 " );	// I think so. (decisively) I believe that in this situation this is the only correct solution!
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_19 " );	// But the thing is, most of my people aren't well armed. And in the battle with the orcs, this will be the most important factor.
	AI_Output(other,self, " DIA_Lee_NW_WhatAboutPal_01_20 " );	// What are you getting at?
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_21 " );	// If Lord Hagen had armed my boys with ore blades, they would have been much more useful.
	AI_Output(other,self, " DIA_Lee_NW_WhatAboutPal_01_25 " );	// Good! I will inform him of your decision and convey this request.
	AI_Output(self,other, " DIA_Lee_NW_WhatAboutPal_01_26 " );	// Then I'll wait for his answer! And the faster the better.
	SLD_JOINHAGEN = TRUE;
	MIS_OREWEAPONSLD = LOG_Running;
	Log_CreateTopic(TOPIC_OREWEAPONSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_Running);
	B_LogEntry( TOPIC_OREWEAPONSLD , " Lee wants Lord Hagen to equip his men with ore blades! He thinks this will make the mercenaries more combat-ready. I've agreed to convey his request to the chief paladin. " );
	Log_AddEntry( TOPIC_OR with GREATWAR , " I informed Lee of the paladins' proposal to unite in the face of the orc threat and he agreed. I'm sure it was the right decision on his part! " );
};


instance DIA_LEE_NW_HOWMUCHORESWORD(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_howmuchoresword_condition;
	information = dia_lee_nw_howmuchoresword_info;
	permanent = FALSE;
	description = " How many ore blades do you need? " ;
};


func int dia_lee_nw_howmuchoresword_condition()
{
	if((MIS_OREWEAPONSLD == LOG_Running) && (KNOWNORESWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_howmuchoresword_info()
{
	AI_Output(other,self, " DIA_Lee_NW_HowMuchOreSword_01_01 " );	// How many ore blades do you need?
	AI_Output(self,other, " DIA_Lee_NW_HowMuchOreSword_01_02 " );	// (thoughtfully) To arm all my people, I need at least thirty of them.
	AI_Output(self,other, " DIA_Lee_NW_HowMuchOreSword_01_05 " );	// Hurry up, orcs won't be waiting for us, mate!
	B_LogEntry( TOPIC_OREWEAPONSLD , " Lee needs at least thirty or so ore blades to arm all of his men. " );
};


instance DIA_LEE_NW_GETORESWORD(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_getoresword_condition;
	information = dia_lee_nw_getoresword_info;
	permanent = FALSE;
	description = " I have the weapon you need. " ;
};


func int dia_lee_nw_getoresword_condition()
{
	if((MIS_OREWEAPONSLD == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Lee_NW_HowMuchOreSword) == TRUE) && (Npc_HasItems(hero,ItMw_1H_Blessed_01) >= 30))
	{
		return TRUE;
	};
};

func void dia_lee_nw_getoresword_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lee_NW_GetOreSword_01_01 " );	// I have the weapon you need.
	AI_Output(self,other, " DIA_Lee_NW_GetOreSword_01_02 " );	// Good! Then come over here so I can distribute it to my people.
	AI_Output(other,self, " DIA_Lee_NW_GetOreSword_01_03 " );	// Here, take this.
	B_GiveInvItems(other,self,ItMw_1H_Blessed_01,30);
	Npc_RemoveInvItems(self,ItMw_1H_Blessed_01,30);
	AI_Output(self,other, " DIA_Lee_NW_GetOreSword_01_04 " );	// Well, great. Now we are ready to fight the orcs!
	MIS_OREWEAPONSLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_SUCCESS);
	B_LogEntry( TOPIC_OREWEAPONSLD , " I brought Li the ore weapon. Now his people are ready to fight the orcs! " );
};


instance DIA_LEE_NW_GREATGATHER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_greatgather_condition;
	information = dia_lee_nw_greatgather_info;
	permanent = FALSE;
	description = " How is the environment around the farm? " ;
};


func int dia_lee_nw_greatgather_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_greatgather_info()
{
	AI_Output(other,self, " DIA_Lee_NW_GreatGather_01_01 " );	// How is the environment around the farm?
	AI_Output(self,other, " DIA_Lee_NW_GreatGather_01_02 " );	// So far everything is quiet.
	AI_Output(self,other, " DIA_Lee_NW_GreatGather_01_03 " );	// But I think it's just the calm before the storm. The orcs are clearly up to something.
	AI_Output(self,other, " DIA_Lee_NW_GreatGather_01_04 " );	// Every day, more and more reinforcements from the city arrive at their camp.
	AI_Output(self,other, " DIA_Lee_NW_GreatGather_01_07 " );	// I'm sure it won't be more than a few days before they storm this farm.
};


instance DIA_LEE_NW_YOURLEADER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_yourleader_condition;
	information = dia_lee_nw_yourleader_info;
	permanent = FALSE;
	description = " Are you in charge here now? " ;
};


func int dia_lee_nw_yourleader_condition()
{
	if (( COMPLETE MOVEFORCES_01  ==  TRUE ) && ( COMPLETE MOVEFORCES_02  ==  FALSE ) && Npc_KnowsInfo(hero,dia_lord_hagen_whocommand))
	{
		return TRUE;
	};
};

func void dia_lee_nw_yourleader_info()
{
	AI_Output(other,self, " DIA_Lee_NW_YourLeader_01_01 " );	// Are you in charge here now?
	AI_Output(self,other, " DIA_Lee_NW_YourLeader_01_02 " );	// I lead the defense of our farm and all those people who have expressed a desire to fight against the orcs.
	AI_Output(self,other, " DIA_Lee_NW_YourLeader_01_05 " );	// Though I thought Lord Hagen would lead our army.
	AI_Output(self,other, " DIA_Lee_NW_YourLeader_01_06 " );	// But the guys trusted me.
	AI_Output(self,other, " DIA_Lee_NW_YourLeader_01_09 " );	// When I was still a general in the king's army, I really had to go to many wars.
	AI_Output(self,other, " DIA_Lee_NW_YourLeader_01_10 " );	// I fought orcs in almost every corner of Myrtana - from the cold mountains of Nordmar to the hot deserts of Varant!
	AI_Output(self,other, " DIA_Lee_NW_YourLeader_01_13 " );	// I'll try not to let my people down this time!
};

instance DIA_LEE_NW_HOWDEFEND(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_howdefend_condition;
	information = dia_lee_nw_howdefend_info;
	permanent = FALSE;
	description = " What is your defense plan? " ;
};

func int dia_lee_nw_howdefend_condition()
{
	if (( COMPLETE MOVEFORCES_01  ==  TRUE ) && ( COMPLETE MOVEFORCES_02  ==  FALSE ) && Npc_KnowsInfo(hero,dia_lord_hagen_whocommand) && Npc_KnowsInfo(hero,dia_lee_nw_yourleader));
	{
		return TRUE;
	};
};

func void dia_lee_nw_howdefend_info()
{
	AI_Output(other,self, " DIA_Lee_NW_HowDefend_01_01 " );	// What is your defense plan?
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_04 " );	// We'll wait until the orcs themselves decide to attack us.
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_05 " );	// I know their tactics well! Surely they will immediately throw all their forces into battle, hoping to crush our defenses under their insane pressure.
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_06 " );	// But I'll build my people in such a way that they don't get a chance to do that!
	AI_Output(other,self, " DIA_Lee_NW_HowDefend_01_07 " );	// And what is the alignment of your units?
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_08 " );	// Lord Hagen's paladins will take the front ranks, as they are the most experienced warriors in our army. They will take the first blow of the orcs on themselves!
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_10 " );	// Next behind the paladins, I want to place my mercenaries. Their task will be simple - not to let the orcs break through the center of our defense at any cost!
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_11 " );	// If this happens, the orcs will simply clamp us in a vise on both sides, and then we will all be finished.
	if((TPL_JOINHAGEN == TRUE) && (HUN_JOINHAGEN == TRUE))
	{
		AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_13 " );	// On the flanks, I will post guards and forest hunters.
	};
	if(PIR_JOINHAGEN == TRUE)
	{
		AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_26 " );	// Our next line of defense will consist of the commanding staff of the paladins, led by Lord Varus, and the pirates, Captain Greg.
		AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_27 " );	// The final outcome of the upcoming battle will depend on them!
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_33 " );	// Our next line of defense will consist of a commanding staff of paladins led by Lord Varus.
		AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_34 " );	// The final outcome of the upcoming battle will depend on them!
	};
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_40 " );	// As for the rest, they will take their place in the last row of our defenses.
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_41 " );	// There will be a lot of newbies among them, so this will give them at least some chance to survive this massacre.
	AI_Output(other,self, " DIA_Lee_NW_HowDefend_01_42 " );	// What about mages?
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_43 " );	// All magicians will be in the rear of our defense.
	AI_Output(self,other, " DIA_Lee_NW_HowDefend_01_44 " );	// We all rely heavily on their magical support. Because it will give us a huge advantage in the battle against the orcs!
};

instance DIA_LEE_NW_JOINBATTLE(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_LEE_NW_JOINBATTLE_condition;
	information = DIA_LEE_NW_JOINBATTLE_info;
	permanent = FALSE;
	description = " Can I participate in this battle? " ;
};

func int DIA_LEE_NW_JOINBATTLE_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Lee_NW_HowDefend) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_LEE_NW_JOINBATTLE_info()
{
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_01_01 " );	// Can I participate in this battle?
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_01_02 " );	// Of course. Although I had slightly different plans for you.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_01_03 " );	// But of course you can take part in the battle if you want to.
	Info_ClearChoices(DIA_LEE_NW_JOINBATTLE);
	Info_AddChoice( DIA_LEE_NW_JOINBATTLE , " No, we'd better talk about your plans. " ,DIA_LEE_NW_JOINBATTLE_No);
	Info_AddChoice( DIA_LEE_NW_JOINBATTLE , " Yes, I will join the battle. " ,DIA_LEE_NW_JOINBATTLE_Yes);
};

func void DIA_LEE_NW_JOINBATTLE_Yes()
{
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_Yes_01_01 " );	// Of course, I will take part in the battle with the orcs.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_02 " );	// Okay, this is your decision. Then I need to think about which unit you will fight in.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_03 " );	// But first we need to discuss one small problem with you.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_05 " );	// Don't think I'm crazy, but in my opinion, some unknown force helps the orcs.
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_Yes_01_06 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_07 " );	// I don't know how or how to explain this, but we already had a couple of skirmishes with these creatures.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_08 " );	// And most of them were almost impossible to kill!
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_09 " );	// As if they all suddenly became immortal.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_10 " );	// In light of the upcoming battle, this fact worries me a lot.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_11 " );	// That's why I want you to deal with this problem. And as soon as possible.
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_Yes_01_12 " );	// Good. And where should I start?
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_Yes_01_13 " );	// Talk to Pyrocar. Perhaps he will tell you where to start looking.
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_Yes_01_14 " );	// Okay, I'm going to him immediately.
	MIS_ORCSECRET = LOG_Running;
	Log_CreateTopic(TOPIC_ORCSECRET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Running);
	B_LogEntry( TOPIC_ORCSECRET , " I have decided to fight the orcs. However, there is a small problem. According to Lee, the orcs have some kind of powerful ally. It makes them practically immortal on the battlefield, and this worries the general a lot. I need to deal with this problem and the first thing Lee advised me to do was talk to Pyrocar. " );
	AI_StopProcessInfos(self);
};

func void DIA_LEE_NW_JOINBATTLE_No()
{
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_No_01_01 " );	// No, we'd better talk about your plans.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_02 " );	// Okay... (thoughtfully) Then forget about the upcoming battle. We'll figure this out without your help.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_03 " );	// Right now, we need to discuss a little problem with you.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_05 " );	// Don't think I'm crazy, but in my opinion, some unknown force helps the orcs.
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_No_01_06 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_07 " );	// I don't know how or how to explain this, but we already had a couple of skirmishes with these creatures.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_08 " );	// And most of them were almost impossible to kill
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_09 " );	// As if they all suddenly became immortal.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_10 " );	// In light of the upcoming battle, this fact worries me a lot.
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_11 " );	// That's why I want you to deal with this problem. And as soon as possible!
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_No_01_12 " );	// Good. And where should I start?
	AI_Output(self,other, " DIA_LEE_NW_JOINBATTLE_No_01_13 " );	// Talk to Pyrocar. Perhaps he will tell you where to start looking.
	AI_Output(other,self, " DIA_LEE_NW_JOINBATTLE_No_01_14 " );	// Okay, I'm going to him immediately.
	HERONOTJOINBIGBATTLE = TRUE;
	MIS_ORCSECRET = LOG_Running;
	Log_CreateTopic(TOPIC_ORCSECRET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Running);
	B_LogEntry( TOPIC_ORCSECRET , " I refused to take part in the upcoming battle with the orcs. However, there is another small problem! According to Lee, the orcs have some kind of powerful ally. It makes them practically immortal on the battlefield, and this worries the general a lot. I need deal with this problem and the first thing Lee advised to talk to Pyrocar. " );
	AI_StopProcessInfos(self);
};

instance DIA_Lee_NW_OrcSecret_Done(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_OrcSecret_Done_condition;
	information = DIA_Lee_NW_OrcSecret_Done_info;
	permanent = FALSE;
	description = " I've fixed the problem with the orcs. " ;
};

func int DIA_Lee_NW_OrcSecret_Done_condition()
{
	if (( MY_ORCSECRET  == LOG_Running ) && ( ALLGUARDMINIONSDEAD  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_OrcSecret_Done_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Lee_NW_OrcSecret_Done_01_00 " );	// I fixed the problem with the orcs.
	AI_Output(self,other, " DIA_Lee_NW_OrcSecret_Done_01_01 " );	// In what sense did you settle it? (surprised) Did you kill them all?!
	AI_Output(other,self, " DIA_Lee_NW_OrcSecret_Done_01_02 " );	// No! It's just that they are no longer immortal, as they used to be.
	AI_Output(self,other, " DIA_Lee_NW_OrcSecret_Done_01_03 " );	// Well, good news. (enough) Although the situation is still difficult.
	AI_Output(self,other, " DIA_Lee_NW_OrcSecret_Done_01_04 " );	// We don't have enough people, and more and more forces are constantly approaching the orcs.
	AI_Output(self,other, " DIA_Lee_NW_OrcSecret_Done_01_05 " );	// I think they will storm soon.

	if(HERONOTJOINBIGBATTLE == TRUE)
	{
		AI_Output(other,self, " DIA_Lee_NW_OrcSecret_Done_01_06 " );	// Then tell us how it went.
		AI_Output(self,other, " DIA_Lee_NW_OrcSecret_Done_01_07 " );	// If I stay alive. (chuckles)
	}
	else
	{
		AI_Output(other,self, " DIA_Lee_NW_OrcSecret_Done_01_08 " );	// Well, let's see what they can do!
		AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_09");	//Само собой.
	};

	MIS_ORCSECRET = LOG_Success;
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Success);
	B_LogEntry( TOPIC_ORCSECRET , " Lee was glad to hear the news that the orcs had lost the magic that protected them. " );
};

instance DIA_LEE_NW_BIGFIGHTBEGIN(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_bigfightbegin_condition;
	information = dia_lee_nw_bigfightbegin_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_bigfightbegin_condition()
{
	if (( KAPITELORCATC  ==  TRUE ) && ( HERONOTJOINBIGBATTLE  ==  FALSE ) && ( COMPLETE MOVEFORCES_01  ==  TRUE ) && ( ALLGUARDIANSKILL  ==  TRUE ) && ( COMPLETE MOVEFORCES_02  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_lee_nw_bigfightbegin_info()
{
	AI_Output(self,other, " DIA_Lee_NW_BigFightBegin_01_01 " );	// Good to have you here. (seriously) Looks like the orcs are ready to attack us.
	AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_02");	//Сколько там этих тварей?
	AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_03");	//Судя по всему, целая армия. Хватит на всех! (смеется)

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_04");	//Кстати, поскольку ты маг, то тебе будет лучше держаться подальше от основного фронта атаки орков.
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_05");	//Так что вставай слева от меня. Полагаю, сейчас уже все начнется!
		HEROPLACEISMAGE = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_08");	//Я готов к битве.
		AI_Output(self,other, " DIA_Lee_NW_BigFightBegin_01_09 " );	// Great! Then go and take your place in the ranks. I guess it's about to start!
		AI_Output(other,self, " DIA_Lee_NW_BigFightBegin_01_10 " );	// Where is my place?
		AI_Output(self,other, " DIA_Lee_NW_BigFightBegin_01_11 " );	// In the second row in the center, next to the Horn.
		HEROPLACEISWAR = TRUE;
		b_changename(pal_91220_ritter," ");
		b_changename(pal_91230_ritter," ");
		b_changename(pal_91210_ritter," ");
	};
	B_LogEntry( TOPIC_OR with GREATWAR , " The hour of decisive battle with the orcs has come! Now only our courage, courage and luck will decide everything... " );
	LEESENTTOTROOPS = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_LEE_NW_BIGFIGHTRESULT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_bigfightresult_condition;
	information = dia_lee_nw_bigfightresult_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_bigfightresult_condition()
{
	if (( STOPBIGBATTLE  ==  TRUE ) && ( ALLGREATVICTORY  ==  FALSE ) && ( HERONOTJOINBIGBATTLE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_lee_nw_bigfightresult_info()
{
	if(ORCSWINSBB == TRUE)
	{
		AI_Output(self,other, " DIA_Lee_NW_BigFightResult_01_01 " );	// Damn! (doomed) We've lost this battle! This was our last chance.
		AI_Output(self,other, " DIA_Lee_NW_BigFightResult_01_02 " );	// Now soon the orcs will become the masters of this island, and there will be no place for us on it.
		AI_Output(self,other, " DIA_Lee_NW_BigFightResult_01_03 " );	// It's over!
		LEEFUCKOFF = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(5000);
		AI_Output(self,other, " DIA_Lee_NW_BigFightResult_01_04 " );	// Great! We won this battle... (through gritted teeth) We did it!
		AI_PlayAni(self,"T_STAND_2_SIT");
		AI_Output(other,self, " DIA_Lee_NW_BigFightResult_01_05 " );	// What's wrong with you?! Are you hurt?!
		AI_Output(self,other, " DIA_Lee_NW_BigFightResult_01_06 " );	// Damn! It seems that these creatures still got me ... (overcoming pain) Damned orcs!
		AI_Output(other,self, " DIA_Lee_NW_BigFightResult_01_07 " );	// You need to urgently go to the farm! Otherwise, you're about to bleed to death.
		AI_PlayAni(self,"T_SIT_2_STAND");
		AI_Output(self,other, " DIA_Lee_NW_BigFightResult_01_08 " );	// I'm fine! I just need to get some rest... (passing out)
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_09");	//Ли?!
		BIGBATTLEBACKPOSITION = TRUE;
		Npc_ExchangeRoutine(self,"DRAINED");
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_NW_FUCKOFF(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = dia_lee_nw_fuckoff_condition;
	information = dia_lee_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_nw_fuckoff_condition()
{
	if((LEEFUCKOFF == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lee_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_LEE_NW_LEERECOVERED(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_leerecovered_condition;
	information = dia_lee_nw_leerecovered_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_leerecovered_condition()
{
	if((LEERECOVERED == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lee_nw_leerecovered_info()
{
	AI_Output(other,self, " DIA_Lee_NW_LeeRecovered_01_01 " );	// I see you're getting better?
	AI_Output(self,other, " DIA_Lee_NW_LeeRecovered_01_02 " );	// Yes, everything is fine with me now!
};

instance DIA_LEE_NW_ALLGREATVICTORY(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_allgreatvictory_condition;
	information = dia_lee_nw_allgreatvictory_info;
	permanent = FALSE;
	description = " The orcs have retreated to the Valley of Mines. " ;
};

func int dia_lee_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_nw_allgreatvictory_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Lee_NW_AllGreatVictory_01_00 " );	// The Orcs have retreated to the Valley of Mines!
	AI_Output(other,self, " DIA_Lee_NW_AllGreatVictory_01_01 " );	// So now this part of the island is completely free.
	AI_Output(self,other, " DIA_Lee_NW_AllGreatVictory_01_02 " );	// Are you serious? It can't be!
	AI_Output(other,self, " DIA_Lee_NW_AllGreatVictory_01_03 " );	// I've slaughtered all of their units in this valley.
	AI_Output(self,other, " DIA_Lee_NW_AllGreatVictory_01_08 " );	// Finally it's over. I can't believe!
};


instance DIA_LEE_NW_WHATDONOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whatdonow_condition;
	information = dia_lee_nw_whatdonow_info;
	permanent = FALSE;
	description = " What are you thinking of doing now? " ;
};

func int dia_lee_nw_whatdonow_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_lee_nw_leerecovered ) && ( ( ALLGREATVICTORY  ==  TRUE ) || ( HORINISISFREE  ==  TRUE )))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whatdonow_info()
{
	AI_Output(other,self, " DIA_Lee_NW_WhatDoNow_01_00 " );	// And now what do you think to do?
	AI_Output(self,other, " DIA_Lee_NW_WhatDoNow_01_01 " );	// (thoughtfully) Now there is something to do here.
	AI_Output(self,other, " DIA_Lee_NW_WhatDoNow_01_02 " );	// However, I still haven't given up on my intentions to return to the mainland.
	AI_Output(self,other, " DIA_Lee_NW_WhatDoNow_01_03 " );	// After all, as you know, I still have one unfinished business there.
	AI_Output(self,other, " DIA_Lee_NW_WhatDoNow_01_04 " );	// So if you suddenly decide to sail there, then don't forget about old Lee!
};


instance DIA_LEE_NW_TRAVELONBIGLAND(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_travelonbigland_condition;
	information = dia_lee_nw_travelonbigland_info;
	permanent = FALSE;
	description = " I didn't forget about your request. " ;
};


func int dia_lee_nw_travelonbigland_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && Npc_KnowsInfo(hero,dia_lee_nw_whatdonow))
	{
		return TRUE;
	};
};

func void dia_lee_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lee_NW_TravelOnBigLand_01_00 " );	// I haven't forgotten about your request.
	AI_Output(self,other, " DIA_Lee_NW_TravelOnBigLand_01_01 " );	// (serious) Are you saying you're going to the mainland?
	AI_Output(other,self, " DIA_Lee_NW_TravelOnBigLand_01_02 " );	// Yes, that's right. Pack up, we're leaving soon.
	AI_Output(self,other, " DIA_Lee_NW_TravelOnBigLand_01_03 " );	// Good. It does not take a lot of time.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LEETOBIGLAND = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Of course Lee is sailing with me! I haven't forgotten about his request. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_LEE_NW_DarkOrder(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_DarkOrder_condition;
	information = dia_lee_nw_DarkOrder_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_DarkOrder_condition()
{
	if ((Chapter ==  5 ) && (MY_DarkOrder != LOG_Success))
	{
		return TRUE;
	};
};

func void dia_lee_nw_DarkOrder_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_00");	//Белиар бы тебя побрал! Где тебя вечно носит?
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_01");	//А чем ты собственно недоволен?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_02");	//Проклятье! Ты наверно уже заметил, что на ферму Онара напала нежить.
	AI_Output(other,self, " DIA_Lee_NW_DarkOrder_01_03 " );	// Yes, I noticed. Do you have any thoughts on this?
	AI_Output(self,other, " DIA_Lee_NW_DarkOrder_01_04 " );	// Where from? I don't even know where she came from.
	AI_Output(other,self, " DIA_Lee_NW_DarkOrder_01_05 " );	// Did the undead only attack Onar's farm?
	AI_Output(self,other, " DIA_Lee_NW_DarkOrder_01_06 " );	// As far as I know, all Khorinis is teeming with it!

	if(MIS_DarkOrden == LOG_Running)
	{
		AI_Output(self,other, " DIA_Lee_NW_DarkOrder_01_07 " );	// Gotta do something! I've already lost a few people.
		AI_Output(self,other, " DIA_Lee_NW_DarkOrder_01_08 " );	// If it goes on like this, we're unlikely to hold out.
	}
	else  if (MIS_DarkOrden ==  FALSE )
	{
		AI_Output(other,self, " DIA_Lee_NW_DarkOrder_01_09 " );	// What's going on in the city?
		AI_Output(self,other, " DIA_Lee_NW_DarkOrder_01_10 " );	// I don't know. But you should speak to Lord Hagen as soon as possible.
		AI_Output(self,other, " DIA_Lee_NW_DarkOrder_01_11 " );	// The paladins may have some plan to stop this invasion.
	};
};

instance DIA_Lee_NW_LeeLetter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_LeeLetter_condition;
	information = DIA_Lee_NW_LeeLetter_info;
	permanent = FALSE;
	description = " I have a letter for you from Vatras. " ;
};

func int DIA_Lee_NW_LeeLetter_condition()
{
	if (( MIS_LeeLetter == LOG_Running ) && ( Npc_HasItems ( hero , ItWr_BacksLee ) >=  1 )) .
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_LeeLetter_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Lee_NW_LeeLetter_01_00 " );	// I have a letter for you from Vatras.
	B_GiveInvItems(other,self,ItWr_VatrasLee,1);
	Npc_RemoveInvItems(self,ItWr_VatrasLee,1);
	AI_Output(self,other, " DIA_Lee_NW_LeeLetter_01_01 " );	// Good. Let's see what he writes.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lee_NW_LeeLetter_01_02 " );	// (seriously) His request is extremely unexpected for me.
	AI_Output(self,other, " DIA_Lee_NW_LeeLetter_01_03 " );	// But okay, so be it, I'll think about it.
	MIS_LeeLetter = LOG_Success;
	Log_SetTopicStatus(TOPIC_LeeLetter,LOG_Success);
	B_LogEntry(TOPIC_LeeLetter, " I delivered the letter to Lee. " );	
};

instance DIA_Lee_NW_VatrasBusines(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_VatrasBusines_condition;
	information = DIA_Lee_NW_VatrasBusines_info;
	permanent = FALSE;
	description = " What's your deal with Vatras? " ;
};

func int DIA_Lee_NW_VatrasBusines_condition()
{
	if(MIS_LeeLetter == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_VatrasBusines_info()
{
	AI_Output(other,self, " DIA_Lee_NW_VatrasBusines_01_00 " );	// What's your business with Vatras?
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_01 " );	// Nothing special. I just asked him to ask the paladins about the situation in Myrtana.
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_02 " );	// But his news didn't make me too happy. It seems that the king is on the verge of defeat in the war against the orcs.
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_03 " );	// True, I am reassured by the fact that they did not succeed in conquering Nordmar.
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_04");	//Почему?
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_05 " );	// I grew up there... My homeland is there!
	AI_Output(other,self, " DIA_Lee_NW_VatrasBusines_01_06 " );	// So you're from Nordmar, then? Maybe then you can tell me about it?
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_07 " );	// Eh, buddy. It's just beyond words to describe.
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_08 " );	// If only you could see those majestic mountains covered in snow and ice.
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_09 " );	// You would definitely want to stay there forever. The views there are truly breathtaking!
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_10 " );	// True, to be honest, those edges are pretty harsh.
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_11 " );	// Dangerous creatures abound, and it's freezing cold all the time.
	AI_Output(self,other, " DIA_Lee_NW_VatrasBusines_01_12 " );	// But we're not used to it. Every Nordmarian is born immune to the cold.
};

instance DIA_Lee_NW_TeachMeCold(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_TeachMeCold_condition;
	information = DIA_Lee_NW_TeachMeCold_info;
	permanent = FALSE;
	description = " Maybe you can teach me this too? " ;
};

func int DIA_Lee_NW_TeachMeCold_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasBusines) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_TeachMeCold_info()
{
	AI_Output(other,self, " DIA_Lee_NW_TeachMeCold_01_00 " );	// Maybe you can teach me this too?
	AI_Output(self,other, " DIA_Lee_NW_TeachMeCold_01_01 " );	// You can't learn that, mate. You have to be born with this.
	AI_Output(self,other, " DIA_Lee_NW_TeachMeCold_01_02 " );	// But for that matter, I know a few ways to avoid frostbite, or how to keep yourself from just getting cold.
	AI_Output(self,other, " DIA_Lee_NW_TeachMeCold_01_03 " );	// However, you will need to have some experience to master these tricks.
	AI_Output(self,other, " DIA_Lee_NW_TeachMeCold_01_04 " );	// I won't take any money from you. This would not be entirely correct.
	AI_Output(other,self, " DIA_Lee_NW_TeachMeCold_01_05 " );	// Okay, agreed.
};

instance DIA_Lee_NW_ColdReduceTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 800;
	condition = DIA_Lee_NW_ColdReduceTeach_Condition;
	information = DIA_Lee_NW_ColdReduceTeach_Info;
	permanent = TRUE;
	description = " Teach me how to endure the cold (Training Points: 10) " ;
};

func int DIA_Lee_NW_ColdReduceTeach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lee_NW_TeachMeCold) == TRUE) && (ColdReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_ColdReduceTeach_Info()
{
	var int cost;

	AI_Output(other,self, " DIA_Lee_NW_ColdReduceTeach_01_00 " );	// Teach me how to endure the cold.

	cost = 10 ;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_Lee_NW_ColdReduceTeach_01_01 " );	// Sorry, but you don't have enough experience for this yet!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Lee_NW_ColdReduceTeach_01_02 " );	// Move more. It warms up the body.
		AI_Output(self,other, " DIA_Lee_NW_ColdReduceTeach_01_03 " );	// Any movement must come from the whole body.
		AI_Output(self,other, " DIA_Lee_NW_ColdReduceTeach_01_04 " );	// And always keep your feet warm!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		hero.protection[PROT_MAGIC] += 5;
		REALPROTMAGIC += 5;
		AI_Print(PRINT_LEARNPROTCOLD);
		ColdReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_Lee_NW_VatrasDeal(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_VatrasDeal_condition;
	information = DIA_Lee_NW_VatrasDeal_info;
	permanent = FALSE;
	description = " What did Vatras want from you? " ;
};

func int DIA_Lee_NW_VatrasDeal_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasBusines) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_VatrasDeal_info()
{
	AI_Output(other,self, " DIA_Lee_NW_VatrasDeal_01_00 " );	// And what did Vatras want from you?
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_01 " );	// (seriously) He wrote about the need to send a small force to the Valley of Mines.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_02 " );	// According to him, this is the request of Saturas himself.
	AI_Output(other,self, " DIA_Lee_NW_VatrasDeal_01_03 " );	// But why? Orcs are there!
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_04 " );	// The Waterbenders in the New Camp have some important documents that need to be returned.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_05 " );	// Saturas requested that this be done as soon as possible, for the value of these things is very great.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_06 " );	// And besides, I can't deny him this, given that we all had to endure beyond the Barrier at one time or another.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_07 " );	// However, there is a small problem - the passage to the Valley of Mines is guarded by paladins.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_08 " );	// It's unlikely Lord Hagen's men will let us through, given the current situation in Khorinis.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_09 " );	// In addition, a large group of people will surely attract the attention of the orcs.
	AI_Output(self,other, " DIA_Lee_NW_VatrasDeal_01_10 " );	// Yes, and we still need to look for those who will agree to this!
};

instance DIA_Lee_NW_WaterMageDocuments(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_WaterMageDocuments_condition;
	information = DIA_Lee_NW_WaterMageDocuments_info;
	permanent = FALSE;
	description = " I can visit the Valley of Mines myself. " ;
};

func int DIA_Lee_NW_WaterMageDocuments_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasDeal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_WaterMageDocuments_info()
{
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocuments_01_00 " );	// I can visit the Valley of Mines myself.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocuments_01_01 " );	// Alone? (surprised) Are you out of your mind?
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocuments_01_03 " );	// Quite! It's just that Lord Hagen wants to know about the situation in the Valley of Mines.
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocuments_01_04 " );	// Whether I like it or not, I'll have to go there.
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocuments_01_05 " );	// In addition, it will be much easier for one person to slip through the crowds of orcs than for a whole squad.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocuments_01_06 " );	// Hmmm. There is indeed logic in your words.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocuments_01_07 " );	// Good. Then I will give you the key that Vatras gave me along with his letter.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocuments_01_08 " );	// It will open a chest containing the documents Saturas needs.
	B_GiveInvItems(self,other,ItKe_WaterMageDocuments,1);
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocuments_01_09 " );	// So, if you get the chance, you might want to check out the New Camp.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocuments_01_10 " );	// But be careful! Rumor has it that one of the dragons settled his lair there.
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocuments_01_11 " );	// I'll figure it out somehow.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_12");	//Надеюсь.
	MIS_WaterMageDocuments = LOG_Running;
	Log_CreateTopic(TOPIC_WaterMageDocuments,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Running);
	B_LogEntry(TOPIC_WaterMageDocuments, " Saturas asked Lee to send a party to the Valley of Mines to collect the valuable documents left there. I volunteered to help him with this, as I myself am going to visit the Valley of Mines. Lee gave me the key to the chest where the records of the Water Mages are stored. " );
};

instance DIA_Lee_NW_NewLager(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_NewLager_condition;
	information = DIA_Lee_NW_NewLager_info;
	permanent = FALSE;
	description = " New camp... " ;
};

func int DIA_Lee_NW_NewLager_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_WaterMageDocuments) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_NewLager_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Lee_NW_NewLager_01_00 " );	// (thoughtfully) New camp...
	AI_Output(other,self, " DIA_Lee_NW_NewLager_01_01 " );	// I've always wondered how he even got there?
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_02 " );	// The camp itself was founded by Waterbenders who decided to separate themselves from all the other mages in the castle in order to carry out their own plan.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_03 " );	// In the north of the valley, they discovered a large cave, which seemed to them quite a safe place to stay.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_04 " );	// Actually, this is where it all started.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_05 " );	// Even after I was thrown into the colony, I met with one of these magicians. His name was Saturas.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_06 " );	// When he found out that I was a former general of King Rhobar's army, he immediately offered me to lead the guards of their mission.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_07 " );	// The whole valley was full of orcs and other dangerous creatures. So my combat experience came in handy for them.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_08 " );	// Then a few more people joined us, who were fed up with the orders of Gomez and his henchmen.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_09 " );	// And then I began to recruit people only from the new arrivals.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_10 " );	// Among them sometimes were those who had previously served in the army under my command.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_11 " );	// They were the backbone of our small army of mercenaries.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_12 " );	// And so, over time, we became a force that everyone else had to reckon with, including Gomez.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_13 " );	// Some time later, we discovered an abandoned mine in an old dell behind the camp.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_14 " );	// The Waterbenders decided they could develop it.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_15 " );	// And, of course, all this caused great anger of the barons - especially from Gomez.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_16 " );	// After all, until that time, magic ore was mined exclusively in his mine.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_17 " );	// In addition, our people were constantly looting caravans of goods from outside, heading to the Old Camp.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_18 " );	// Lares distinguished himself especially in these raids.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_19 " );	// This cunning fellow gathered around him a whole gang of thieves just like himself.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_20 " );	// As a result, there was a situation that suited almost everyone.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_21 " );	// Thieves attacked caravans and shared their loot with us. And we, in turn, protected them from Gomez's guards.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_22 " );	// Naturally, all this did not have the best effect on our relations with the Old Camp.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_23 " );	// We've become sworn enemies. And in any case, they were ready to cut each other's throats.
	AI_Output(self,other, " DIA_Lee_NW_NewLager_01_24 " );	// And who knows how long this would go on. If you didn't show up...
};

instance DIA_Lee_NW_WaterMageDocumentsDone(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_WaterMageDocumentsDone_condition;
	information = DIA_Lee_NW_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = " I have the records of the Waterbenders. " ;
};

func int DIA_Lee_NW_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocumentsDone_01_00 " );	// I have the records of the Waterbenders.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocumentsDone_01_01 " );	// Good! But it would be better if you take them to Saturas yourself.
	AI_Output(self,other, " DIA_Lee_NW_WaterMageDocumentsDone_01_02 " );	// I don't need them.
	AI_Output(other,self, " DIA_Lee_NW_WaterMageDocumentsDone_01_03 " );	// As you say.
	B_LogEntry(TOPIC_WaterMageDocuments, " Lee asked me to deliver the notes I brought to Saturas personally. " );
};

instance DIA_Lee_NW_Seekers(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_Seekers_condition;
	information = DIA_Lee_NW_Seekers_info;
	permanent = FALSE;
	description = " You know Sagitta, right? " ;
};

func int DIA_Lee_NW_Seekers_condition()
{
	if ((MY_SagittaGuard == LOG_Running) && (Chapter ==  3 ))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_Seekers_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Lee_NW_Seekers_01_00 " );	// You know Sagitta, don't you?
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_01 " );	// Of course. She is a local witch and healer. Everyone here knows her.
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_02 " );	// Why do you ask?
	AI_Output(other,self, " DIA_Lee_NW_Seekers_01_03 " );	// Seekers have appeared near her cave. And she is there alone, completely defenseless.
	AI_Output(other,self, " DIA_Lee_NW_Seekers_01_04 " );	// You never know what can happen, don't bring Innos.
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_05 " );	// Then let him come here to the farm. There is no danger for her here.
	AI_Output(other,self, " DIA_Lee_NW_Seekers_01_06 " );	// But she doesn't want to leave her cave. No matter how much I persuaded her.
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_07 " );	// And what do you suggest?
	AI_Output(other,self, " DIA_Lee_NW_Seekers_01_08 " );	// Could you send some of your people to her? Well, they should look after her.
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_09 " );	// Hmmm. (thoughtfully) Actually, all my guys are already in business. But if you ask like that...
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_10");	//Очень прошу!
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_11 " );	// (sighing) Okay, so be it. I'll send a couple of my boys to her.
	AI_Output(self,other, " DIA_Lee_NW_Seekers_01_12 " );	// After all, she's helped so many here! It will be fair.
	B_LogEntry(TOPIC_SagittaGuard, " Lee will send some of his men to look after Sagitta's cave and herself. " );
	LeeSendGuard = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc( SLD_847_SOELDNER , " NW_SAGITTA_CAVE_08 " );
	Wld_InsertNpc( SLD_848_SOELDNER , " NW_SAGITTA_CAVE_05_99 " );
};

// ----------------------------------------- line of mercenaries----- ----------------

instance DIA_SLD_853_Bret_EXIT(C_Info)
{
	npc = SLD_853_Bret;
	nr = 999;
	condition = DIA_SLD_853_Bret_EXIT_Condition;
	information = DIA_SLD_853_Bret_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_853_Bret_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_853_Bret_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_853_Bret_Hallo(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Hallo_Condition;
	information = DIA_SLD_853_Bret_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SLD_853_Bret_Hallo_Condition()
{
	if (BretInsert ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Hallo_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_00 " );		// Hey you! Hands off my meat!
	AI_Output(other,self, " DIA_SLD_853_Bret_Hallo_01_01 " );		// Umm... I thought there was no one here. Where did you come from?
	B_GiveInvItems(other,self,ItMi_BretMeet,1);
	Npc_RemoveInvItems(self,ItMi_BretMeet,1);
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_02 " );		// I want to ask you - where did YOU come from?!
	AI_Output(other,self, " DIA_SLD_853_Bret_Hallo_01_03 " );		// I went through the opening in the Free Mine.
	AI_Output(other,self, " DIA_SLD_853_Bret_Hallo_01_04 " );		// It leads straight to this valley!
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_05 " );		// Hmmm...(with a smirk) And you seem like a tough guy to have traveled such a long and dangerous journey on your own.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_06 " );		// But you tried in vain, there's nothing here! Nothing but a terrible cold and a bunch of ferocious monsters.
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_07 " );		// Now give back what you took! I mean that piece of meat.
	AI_Output(other,self, " DIA_SLD_853_Bret_Hallo_01_08 " );		// Here, take this.
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_09 " );		// Good! I see that everything is in order with your brains too.
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_10 " );		// Therefore, I advise you to get out of this place as soon as possible.
	AI_Output(self,other, " DIA_SLD_853_Bret_Hallo_01_11 " );		// Only death awaits you here.
	AI_StopProcessInfos(self);	
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_SLD_853_Bret_Who(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Who_Condition;
	information = DIA_SLD_853_Bret_Who_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_SLD_853_Bret_Who_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Who_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Who_01_00");		//Кто ты?
	AI_Output(self,other, " DIA_SLD_853_Bret_Who_01_01 " );		// My name is Adelhard! And you don't need to know more.
};

instance DIA_SLD_853_Bret_You(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_You_Condition;
	information = DIA_SLD_853_Bret_You_Info;
	permanent = FALSE;
	description = " Are you a mercenary? " ;
};

func int DIA_SLD_853_Bret_You_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_You_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_You_01_00");		//Ты наемник?
	AI_Output(self,other, " DIA_SLD_853_Bret_You_01_01 " );		// Hmmm...(grimly) Once upon a time there was!
	AI_Output(self,other, " DIA_SLD_853_Bret_You_01_02 " );		// Until fate cast me into this forgotten place by Innos.
	AI_Output(self,other, " DIA_SLD_853_Bret_You_01_03 " );		// But what do you care?
};

instance DIA_SLD_853_Bret_Alone(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Alone_Condition;
	information = DIA_SLD_853_Bret_Alone_Info;
	permanent = FALSE;
	description = " Are you alone here? " ;
};

func int DIA_SLD_853_Bret_Alone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Alone_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Alone_01_00");		//Ты тут один?
	AI_Output(self,other, " DIA_SLD_853_Bret_Alone_01_01 " );		// Do you see anyone else here?
	AI_Output(self,other, " DIA_SLD_853_Bret_Alone_01_02 " );		// Yes, I'm alone here! And I would like to continue to stay here all alone.
	AI_Output(self,other, " DIA_SLD_853_Bret_Alone_01_03 " );		// Excessive noise will only attract orcs here! And then no prayers will help ...
	AI_Output(other,self, " DIA_SLD_853_Bret_Alone_01_04 " );		// I think I'll deal with the orcs somehow.
	AI_Output(self,other, " DIA_SLD_853_Bret_Alone_01_05 " );		// Ah, well, yes... I forgot that you are cool with us!
	AI_Output(self,other, " DIA_SLD_853_Bret_Alone_01_06 " );		// But I just don't want to take that risk.
	AI_Output(self,other, " DIA_SLD_853_Bret_Alone_01_07 " );		// So get out of here and don't come back!
	AI_StopProcessInfos(self);	
};

instance DIA_SLD_853_Bret_NeedInfo(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_NeedInfo_Condition;
	information = DIA_SLD_853_Bret_NeedInfo_Info;
	permanent = FALSE;
	description = " I'm not going anywhere! " ;
};

func int DIA_SLD_853_Bret_NeedInfo_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_853_Bret_Alone) == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_NeedInfo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_SLD_853_Bret_NeedInfo_01_00 " );		// I'm not going anywhere!
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_01 " );		// (threateningly) Really?!
	AI_Output(other,self, " DIA_SLD_853_Bret_NeedInfo_01_02 " );		// Yes! Until I figure something out.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_03");		//И что же?
	AI_Output(other,self, " DIA_SLD_853_Bret_NeedInfo_01_04 " );		// I'm looking for a squad of mercenaries! They were commanded by someone named Darius.
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_05 " );		// Hmmm... (grimly) Well, then consider that you already found it!
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_06 " );		// True, as you can see, I'm all that's left of him.
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_07 " );		// The rest are either killed or captured by the orcs. Or maybe even worse...
	AI_Output(other,self, " DIA_SLD_853_Bret_NeedInfo_01_08 " );		// What about Darius himself?
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_09 " );		// I have no idea what happened to him.
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_10");		//Как так?
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_11 " );		// Man, the last thing I remember is a hefty mountain orc hitting me over the head with something heavy!
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_12 " );		// Looks like it took me one hit to knock me out.
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_13 " );		// When I woke up, all around were pools of blood and the dead bodies of my comrades.
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_14 " );		// Looks like the orcs thought I was dead too!
	AI_Output(self,other, " DIA_SLD_853_Bret_NeedInfo_01_15 " );		// Otherwise, how can I explain that I survived in that hellish meat grinder?
	) ; _ _ _
	CanTrailOrcCamp = TRUE;
};

instance DIA_SLD_853_Bret_HistoryBattle(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_HistoryBattle_Condition;
	information = DIA_SLD_853_Bret_HistoryBattle_Info;
	permanent = FALSE;
	description = " How did you end up in this valley? " ;
};

func int DIA_SLD_853_Bret_HistoryBattle_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_HistoryBattle_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_SLD_853_Bret_HistoryBattle_01_00 " );      // How did you end up in this valley?
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_01 " );      // It's going to be a long story, mate...
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_02 " );      // But if you're not in a hurry, I can tell it to you.
	AI_Output(other,self, " DIA_SLD_853_Bret_HistoryBattle_01_03 " );      // Of course! I will listen with pleasure.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_04");      //Ну, тогда...
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_05 " );      // We've had persistent rumors that after the collapse of the Old Mine, Gomez will try to get his hands on the New Camp Mine.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_06 " );      // Lee decided to secure the prey and sent our squad, led by Darius, to strengthen and protect.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_07 " );      // Upon arrival, Darius' first order was to inspect the mine itself!
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_08 " );      // To account for and cover vulnerabilities if we have to defend it.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_09 " );      // But... Darius was a little late with all the preparations.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_10 " );      // As the party descended into the mine, Gomez's men attacked the camp from outside.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_11 " );      // Naturally, we knew nothing about this and were extremely surprised to see strangers in front of our own noses.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_12 " );      // The momentary confusion passed quickly. A tough fight ensued...
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_13 " );      // It seemed that victory was about to be in our hands...
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_14 " );      // But there were too many crossbowmen with the soldiers of the Old Camp.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_15 " );      // In narrow passages, bows are almost useless, but crossbows are a very serious threat!
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_16 " );      // They began to push us towards the mine and we had no choice but to retreat deeper and deeper.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_17 " );      // In the end, the remnants of our detachment were squeezed into some kind of deaf outpost.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_18 " );      // When the fighters lost hope of salvation, someone saw a narrow passage in the dark!
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_19 " );      // We rushed inside and, after a long wandering, got out into the light.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_20 " );      // Looking around, we realized that we were in an unfamiliar snowy valley, somewhere high in the mountains.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_21 " );      // Later we stumbled upon this camp and decided to settle in it.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_22 " );      // We needed a breather. Gomez's thugs beat us decently, and the hard road did not allow us to rest.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_23 " );      // But the troubles didn't end so quickly. The mountain orcs attacked the camp at night!
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_24 " );      // What happened next, you already know.
	AI_Output(other,self, " DIA_SLD_853_Bret_HistoryBattle_01_25 " );      // M-yes, you had a hard time.
	AI_Output(self,other, " DIA_SLD_853_Bret_HistoryBattle_01_26 " );      // Wrong word, buddy... wrong word!
};

instance DIA_SLD_853_Bret_Away(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Away_Condition;
	information = DIA_SLD_853_Bret_Away_Info;
	permanent = FALSE;
	description = " Why don't you return to the Valley of Mines? " ;
};

func int DIA_SLD_853_Bret_Away_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Away_Info()
{
	AI_Output(other,self, " DIA_SLD_853_Bret_Away_01_00 " );		// Why don't you return to the Valley of Mines?
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_01 " );		// I already had a similar thought...
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_02 " );		// But I'm afraid I won't go far alone!
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_03 " );		// This whole area is just teeming with various evil creatures, not to mention the mountain orcs.
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_04 " );		// And they are much stronger than the ones I dealt with in the Valley of Mines!
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_05 " );		// So this is certain doom for me.
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_06 " );		// So I better sit here.
	AI_Output(other,self, " DIA_SLD_853_Bret_Away_01_07 " );		// Aren't you cold here?
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_08 " );		// I'm already used to the cold and practically don't notice it.
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_09 " );		// Yes, and there is enough food!
	AI_Output(self,other, " DIA_SLD_853_Bret_Away_01_10 " );		// So if you do not attract the attention of the orcs, then it is quite possible to live.
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_11");		//Понимаю.
};

instance DIA_SLD_853_Bret_Adept(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Adept_Condition;
	information = DIA_SLD_853_Bret_Adept_Info;
	permanent = FALSE;
	description = " You're not very picky, are you? " ;
};

func int DIA_SLD_853_Bret_Adept_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Away) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Adept_Info()
{
	AI_Output(other,self, " DIA_SLD_853_Bret_Adept_01_00 " );		// You're not very whimsical, are you?
	AI_Output(self,other, " DIA_SLD_853_Bret_Adept_01_01 " );		// So it is. (smiling) No wonder the guys in the New Camp gave me the nickname Adept!
	AI_Output(self,other, " DIA_SLD_853_Bret_Adept_01_02 " );		// I've been through a lot, seen a lot, and I'm not likely to be intimidated by small difficulties like these.
	AI_Output(other,self, " DIA_SLD_853_Bret_Adept_01_03 " );		// Well, yes, I understand.
};

instance DIA_SLD_853_Bret_OrcCamp(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_OrcCamp_Condition;
	information = DIA_SLD_853_Bret_OrcCamp_Info;
	permanent = FALSE;
	description = " Where is the orc camp? " ;
};

func int DIA_SLD_853_Bret_OrcCamp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_OrcCamp_Info()
{
	AI_Output(other,self, " DIA_SLD_853_Bret_OrcCamp_01_00 " );		// Where is the orc camp?
	AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_01 " );		// Hmmm...(grinning) You ask me like I've been there before.
	AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_02 " );		// I don't know that, mate! Probably somewhere around here in the mountains.
	AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_03 " );		// But I wouldn't advise you to look for it! It is unlikely that the orcs will be friendly with you.
		AI_Output(other,self, " DIA_SLD_853_Bret_OrcCamp_01_04 " );		// Calm down! I have something that will prevent the orcs from attacking me.
		AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_05 " );		// Really? And what is it?
		AI_Output(other,self, " DIA_SLD_853_Bret_OrcCamp_01_06 " );		// Orc totem! Orcs respect its owner.
		AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_07 " );		// Well, maybe so.
		AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_08 " );		// But as far as I can tell, mountain orcs are quite different from their counterparts in the Valley of Mines.
		AI_Output(self,other, " DIA_SLD_853_Bret_OrcCamp_01_09 " );		// They are much more powerful and ferocious! So maybe your thing won't work on them.
	B_LogEntry(TOPIC_MissOldFriend, " Adelhard thinks I need something special to keep the orcs here from touching me. If that's even possible... " );
	Wld_InsertNpc(ORC_7550_GORKAR,"FP_ROAM_OZPRIDE_01_90");
};

instance DIA_SLD_853_Bret_Perm(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Perm_Condition;
	information = DIA_SLD_853_Bret_Perm_Info;
	permanent = TRUE;
	description = " Well, how are you? " ;
};

func int DIA_SLD_853_Bret_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Adept) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Perm_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Perm_01_00");		//Ну, как дела?
	AI_Output(self,other, " DIA_SLD_853_Bret_Perm_01_01 " );		// So far everything is fine.
};

// ---------------------------Darius-------------------- ------------------------

instance DIA_SLD_852_Darius_EXIT(C_Info)
{
	npc = SLD_852_Darius;
	nr = 999;
	condition = DIA_SLD_852_Darius_EXIT_Condition;
	information = DIA_SLD_852_Darius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_852_Darius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_852_Darius_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Wait");
};

instance DIA_SLD_852_Darius_Hallo(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Hallo_Condition;
	information = DIA_SLD_852_Darius_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SLD_852_Darius_Hallo_Condition()
{
	if(DariusInsert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Hallo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_SLD_852_Darius_Hallo_01_00 " );		// Wow! I never would have thought that I would ever see a person here again. Who are you?
	AI_Output(other,self, " DIA_SLD_852_Darius_Hallo_01_01 " );		// It's not that important. Better name yourself.
	AI_Output(self,other, " DIA_SLD_852_Darius_Hallo_01_02 " );		// My name is Darius. Although we are unlikely to have met before, otherwise I would have remembered you.
	AI_Output(other,self, " DIA_SLD_852_Darius_Hallo_01_03 " );		// Darius? It turns out I did manage to find you.
	AI_Output(self,other, " DIA_SLD_852_Darius_Hallo_01_04 " );		// (surprised) And you were looking for me? But why?
	AI_Output(other,self, " DIA_SLD_852_Darius_Hallo_01_05 " );		// Lee sent me. He had not forgotten about his old friend.
	AI_Output(self,other, " DIA_SLD_852_Darius_Hallo_01_06 " );		// Lee?! Damn... How nice to hear that!
	AI_Output(other,self, " DIA_SLD_852_Darius_Hallo_01_07 " );		// He asked me to find out what happened to your squad after he sent you to protect the ore mine.
	AI_Output(self,other, " DIA_SLD_852_Darius_Hallo_01_08 " );		// There is no more squad. All my people are dead. And I only miraculously managed to avoid this fate.
	AI_Output(self,other, " DIA_SLD_852_Darius_Hallo_01_09 " );		// Though it remains to be seen which is worse, dying in battle or spending the rest of your days as a prisoner of the orcs.
	B_LogEntry(TOPIC_MissOldFriend, " I found Darius. He turned out to be a prisoner of the Firestone clan. Not the best news, but at least he's alive. " );
};

instance DIA_SLD_852_Darius_Surv(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Surv_Condition;
	information = DIA_SLD_852_Darius_Surv_Info;
	permanent = FALSE;
	description = " Someone is still alive. " ;
};

func int DIA_SLD_852_Darius_Surv_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_852_Darius_Hallo) == TRUE) && (CanTrailOrcCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Surv_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_SLD_852_Darius_Surv_01_00 " );		// Someone is still alive.
	AI_Output(self,other, " DIA_SLD_852_Darius_Surv_01_01 " );		// What do you mean?
	AI_Output(other,self, " DIA_SLD_852_Darius_Surv_01_02 " );		// In an abandoned fort, I met a mercenary named Adelhard.
	AI_Output(self,other, " DIA_SLD_852_Darius_Surv_01_03 " );		// Adelhard? Yes, this is one of my people.
	AI_Output(self,other, " DIA_SLD_852_Darius_Surv_01_04 " );		// But how did he manage to survive in that mess then? There was a real massacre!
	AI_Output(other,self, " DIA_SLD_852_Darius_Surv_01_05 " );		// Orcs thought he was dead and just left him lying there.
	AI_Output(self,other, " DIA_SLD_852_Darius_Surv_01_06 " );		// (smirking) Looks like he just got lucky.
	AI_Output(self,other, " DIA_SLD_852_Darius_Surv_01_07 " );		// Okay, at least something! This is the first good news in the past few months.
	AlexCanBack = TRUE;
};

instance DIA_SLD_852_Darius_WhyKill(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_WhyKill_Condition;
	information = DIA_SLD_852_Darius_WhyKill_Info;
	permanent = FALSE;
	description = " Why didn't the orcs kill you? " ;
};

func int DIA_SLD_852_Darius_WhyKill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_852_Darius_Hallo) == TRUE) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_WhyKill_Info()
{
	AI_Output(other,self, " DIA_SLD_852_Darius_WhyKill_01_00 " );	// Why didn't the orcs kill you?
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_01 " );	// It's a long story... (sigh)
	AI_Output(other,self, " DIA_SLD_852_Darius_WhyKill_01_02 " );	// And I would listen. Moreover, the mountain orcs are much more bloodthirsty than those in the Valley of Mines. I'm surprised they didn't touch you.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_03 " );	// Okay. Since you insist so.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_04 " );	// When the orcs attacked our camp, a heavy fight ensued.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_05 " );	// My people were very exhausted. So we could not put up any serious resistance to them.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_06 " );	// Most of my people were killed in the first minutes of the battle.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_07 " );	// We fought back as best we could, but there were too many orcs! In the end, we gave up.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_08 " );	// Orcs did not kill the survivors, but took them with them to their camp. Including me.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_09 " );	// Upon arrival there, we were branded, put in a corral and kept there like pigs.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_10 " );	// Not a day went by that the orcs didn't beat us up and mock us.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_11 " );	// And this, along with the fact that we had to bend our backs on these creatures from morning to night.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_12 " );	// And sometimes their shaman would come and point at one of us.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_13 " );	// After which they took the poor fellow somewhere in an unknown direction, and he never returned.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_14 " );	// As I later learned, these creatures sacrificed us to their gods.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_15 " );	// Realizing that my fate was already sealed, I decided to escape from the orc captivity at all costs. And one day I succeeded.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_16 " );	// Breaking free, I wandered these mountains for a long time, hungry and almost completely frozen.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_17 " );	// Strength was already leaving me when an orc patrol stumbled upon me.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_18 " );	// But they didn't look like the orcs I've been captive of all this time.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_19 " );	// I already thought I was finished. However, the orcs were in no hurry to finish me off.
 	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_20 " );	// They talked about something for a long time, and then they carried me to their camp. I vaguely remember what happened next ... (sighing)
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_21 " );	// I woke up already in the Firestone camp - that's the name of their clan.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_22 " );	// As it turns out, they're at odds with the orcs I escaped from.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_23 " );	// Then they started asking me about what I saw there, and I told them everything I knew.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_24 " );	// In gratitude for this, they saved my life, and from that moment I live here.
	AI_Output(self,other, " DIA_SLD_852_Darius_WhyKill_01_25 " );	// But anyway, I'm still their prisoner! And, apparently, I will stay here forever.
	B_LogEntry(TOPIC_MissOldFriend, " Darius told me about being a prisoner of the orcs of another tribe. He also told me the reason why the 'Firestone' orcs kept him alive. " );
};

instance DIA_SLD_852_Darius_Escape(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Escape_Condition;
	information = DIA_SLD_852_Darius_Escape_Info;
	permanent = FALSE;
	description = " And you didn't try to escape again? " ;
};

func int DIA_SLD_852_Darius_Escape_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_852_Darius_WhyKill) == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Escape_Info()
{
	AI_Output(other,self, " DIA_SLD_852_Darius_Escape_01_00 " );		// And you didn't try to escape again?
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_01 " );		// What's the point, mate?
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_02 " );		// First of all, I have absolutely no knowledge of these lands.
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_03 " );		// I'd rather starve to death or become the food of some wild animals than get out of these places alive.
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_04 " );		// Secondly, if the orcs catch me, they probably won't spare me.
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_05 " );		// And there's nowhere to run... The new camp, as I heard, no longer exists. And I don't know where else to go.
	AI_Output(other,self, " DIA_SLD_852_Darius_Escape_01_06 " );		// You could rejoin Lee and his people.
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_07 " );		// And where is he now?
	AI_Output(other,self, " DIA_SLD_852_Darius_Escape_01_08 " );		// His mercenaries guard the farm of a wealthy landowner, not far from the city of Khorinis.
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_09 " );		// Guy! Do you even have the slightest idea where we are right now and where you suggest I go?!
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_10 " );		// I won't even take a few steps in the right direction from here. Yes, and you too...
	AI_Output(self,other, " DIA_SLD_852_Darius_Escape_01_11 " );		// So without a good guide, you can forget about it! And the orcs won't just let me go.
	AI_Output(other,self, " DIA_SLD_852_Darius_Escape_01_12 " );		// Okay, I'll think of something.
	B_LogEntry(TOPIC_MissOldFriend, " According to Darius, it makes absolutely no sense to escape from the captivity of the orcs. But if I can still negotiate with the orcs about his release from captivity, then we will need a guide who is well versed in these places. Without him, Darius would not even take a step will do from here. " );
	NeedDariusFree = TRUE;
};

instance DIA_SLD_852_Darius_IsFree(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_IsFree_Condition;
	information = DIA_SLD_852_Darius_IsFree_Info;
	permanent = FALSE;
	description = " You are free! " ;
};

func int DIA_SLD_852_Darius_IsFree_Condition()
{
	if((MIS_FreePrice == LOG_SUCCESS) && (DariusHasPath == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_IsFree_Info()
{
	B_GivePlayerXP(2000);	
	AI_Output(other,self, " DIA_SLD_852_Darius_IsFree_01_00 " );	// You are free!
	AI_Output(self,other, " DIA_SLD_852_Darius_IsFree_01_01 " );	// What?! Are you kidding?
	AI_Output(other,self, " DIA_SLD_852_Darius_IsFree_01_02 " );	// I bought your freedom from the leader with a huge white mountain troll skin.
	AI_Output(other,self, " DIA_SLD_852_Darius_IsFree_01_03 " );	// And he will give you some warriors to escort you back to Khorinis.
	AI_Output(self,other, " DIA_SLD_852_Darius_IsFree_01_04 " );	// Incredible! Thank you friend. I will never forget this!
	AI_Output(other,self, " DIA_SLD_852_Darius_IsFree_01_05 " );	// Well, I guess I'll see you at Lee's.
	DariusIsFree = TRUE;
	B_LogEntry(TOPIC_MissOldFriend, " I've told Darius he's free now. The Grum Lok Orcs will help him get out of these mountains. Time to get back to Lee... " );
};

instance DIA_SLD_852_Darius_Perm(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Perm_Condition;
	information = DIA_SLD_852_Darius_Perm_Info;
	permanent = TRUE;
	description = " When are you leaving? " ;
};

func int DIA_SLD_852_Darius_Perm_Condition()
{
	if((DariusIsFree == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Perm_Info()
{
	AI_Output(other,self, " DIA_SLD_852_Darius_Perm_01_00 " );		// When are you leaving?
	AI_Output(self,other, " DIA_SLD_852_Darius_Perm_01_01 " );		// Soon. But first you need to be well prepared.
	AI_Output(self,other, " DIA_SLD_852_Darius_Perm_01_02 " );		// Crossing the mountains will not be a cakewalk!
};


// ---------------------------------------------------- -------------------------

instance DIA_SLD_858_Bret_EXIT(C_Info)
{
	npc = SLD_858_Bret;
	nr = 999;
	condition = DIA_SLD_858_Bret_EXIT_Condition;
	information = DIA_SLD_858_Bret_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_858_Bret_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_858_Bret_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_858_Bret_Perm(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Perm_Condition;
	information = DIA_SLD_858_Bret_Perm_Info;
	permanent = FALSE;
	description = " How did you end up here? " ;
};

func int DIA_SLD_858_Bret_Perm_Condition()
{
	return TRUE;
};

func void DIA_SLD_858_Bret_Perm_Info()
{
	B_GivePlayerXP(100);	
	AI_Output(other,self, " DIA_SLD_858_Bret_Perm_01_00 " );		// How did you get here?
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_01_01 " );		// How, how... Returned with Darius. How else?
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_01_02 " );		// True, at first I was a little surprised when he appeared in an abandoned fort surrounded by a detachment of orcs.
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_01_03 " );		// But then everything fell into place.
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_01_04 " );		// Darius explained everything to me and told me that these orcs are our guides and will show the way back to the Valley.
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_01_05 " );		// And I'll tell you, boy, it's better than freezing your ass in those mountains abandoned by Innos!
	AI_Output(other,self, " DIA_SLD_858_Bret_Perm_01_06 " );		// No doubt.
	AlehardHere = TRUE;
};

instance DIA_SLD_858_Bret_Farm(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Farm_Condition;
	information = DIA_SLD_858_Bret_Farm_Info;
	permanent = FALSE;
	description = " How are you on the farm? " ;
};

func int DIA_SLD_858_Bret_Farm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_858_Bret_Perm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_858_Bret_Farm_Info()
{
	AI_Output(other,self, " DIA_SLD_858_Bret_Farm_01_00 " );      // And how are you on the farm?
	AI_Output(self,other, " DIA_SLD_858_Bret_Farm_01_01 " );      // Not bad. At least it's not as boring here as in that forgotten land, hehe!
	AI_Output(self,other, " DIA_SLD_858_Bret_Farm_01_02 " );      // Yes, and Tecla cooks very tasty. Although she doesn't seem to be very happy about having a gourmet like me in her kitchen. (laughs)
	AI_Output(self,other, " DIA_SLD_858_Bret_Farm_01_03 " );      // I had a chance to talk with Onar as well. A little nerdy, but, in general, a normal guy.
};

instance DIA_SLD_858_Bret_Perm_Done(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Perm_Done_Condition;
	information = DIA_SLD_858_Bret_Perm_Done_Info;
	permanent = TRUE;
	description = " What are you going to do now? " ;
};

func int DIA_SLD_858_Bret_Perm_Done_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_858_Bret_Farm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_858_Bret_Perm_Done_Info()
{
	AI_Output(other,self, " DIA_SLD_858_Bret_Perm_Done_01_00 " );		// What are you going to do now?
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_Done_01_01 " );		// First, I want to warm up! In these accursed mountains, I froze all my bones.
	AI_Output(self,other, " DIA_SLD_858_Bret_Perm_Done_01_02 " );		// And eat your fill! Well, it will be visible there.
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_Done_01_03");		//Понимаю.
};

// ---------------------Chorinis Darius------------------------- -------------------------


instance DIA_SLD_857_Darius_EXIT(C_Info)
{
	npc = SLD_857_Darius;
	nr = 999;
	condition = DIA_SLD_857_Darius_EXIT_Condition;
	information = DIA_SLD_857_Darius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_857_Darius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_857_Darius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_857_Darius_Perm(C_Info)
{
	npc = SLD_857_Darius;
	nr = 1;
	condition = DIA_SLD_857_Darius_Perm_Condition;
	information = DIA_SLD_857_Darius_Perm_Info;
	permanent = FALSE;
	description = " How was the crossing over the mountains? " ;
};

func int DIA_SLD_857_Darius_Perm_Condition()
{
	return TRUE;
};

func void DIA_SLD_857_Darius_Perm_Info()
{
	B_GivePlayerXP(100);	
	AI_Output(other,self, " DIA_SLD_857_Darius_Perm_01_00 " );		// How was the transition through the mountains?
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_01_01 " );		// Not easy. We descended from the mountains for about two days.
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_01_02 " );		// True, I thought that the orcs would take me somewhere in the Valley of Mines.
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_01_03 " );		// But for some reason they led me straight to the Passage.
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_01_04 " );		// It's very dangerous in the Valley of Mines right now. I think they knew about it, that's why they got you there.
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_01_05 " );		// Okay, it's not that big of a deal. The main thing is that I'm back with the guys and Lee now.
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_01_06 " );		// Thanks again, friend.
};

instance DIA_SLD_857_Darius_Perm_Done(C_Info)
{
	npc = SLD_857_Darius;
	nr = 1;
	condition = DIA_SLD_857_Darius_Perm_Done_Condition;
	information = DIA_SLD_857_Darius_Perm_Done_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_SLD_857_Darius_Perm_Done_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_857_Darius_Perm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_857_Darius_Perm_Done_Info()
{
	AI_Output(other,self,"DIA_SLD_857_Darius_Perm_Done_01_00");		//Как дела?
	AI_Output(self,other, " DIA_SLD_857_Darius_Perm_Done_01_01 " );		// It's all right, mate.
};

instance DIA_LEE_TOWER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = dia_lee_tower_condition;
	information = dia_lee_tower_info;
	permanent = FALSE;
	description = " Listen, I have one question for you. " ;
};

func int dia_lee_tower_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_tower_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lee_Tower_15_00 " );	// Listen, I have one question for you.
	AI_Output(other,self, " DIA_Lee_Tower_15_01 " );	// You have a tower here south of the farm. Does Onar have any plans for her?
	AI_Output(self,other, " DIA_Lee_Tower_05_02 " );	// What do you mean? Onar considers this tower his own, but in fact he does not use it.
	AI_Output(self,other, " DIA_Lee_Tower_05_03 " );	// After the bandits who lived there were killed, I suggested that he take it and repair it.
	AI_Output(self,other, " DIA_Lee_Tower_05_04 " );	// But he was in a bad mood at the time because of Sekob's rent problems, and didn't listen to me.
	AI_Output(self,other, " DIA_Lee_Tower_05_05 " );	// I didn't return to this topic again. Why do you ask?
	AI_Output(other,self, " DIA_Lee_Tower_15_06 " );	// As I think you know, I recently cleared the tower of Beliar's servants who lived there.
	AI_Output(other,self, " DIA_Lee_Tower_15_07 " );	// Lord Hagen, in gratitude for this, decided to give it to me.
	AI_Output(self,other, " DIA_Lee_Tower_05_08 " );	// And what allowed Lord Hagen to think that he can dispose of the local territories?!
	AI_Output(self,other, " DIA_Lee_Tower_05_09 " );	// (Calm down) Okay. It's good that he at least decided to give it to you and not to someone else. What do you want to do with her?
	AI_Output(other,self, " DIA_Lee_Tower_15_10 " );	// Arrange, find people for protection. Maybe I'll try to develop the old mines with ore.
	AI_Output(other,self, " DIA_Lee_Tower_15_11 " );	// In a word, I will try to make it so that it begins to bring benefits instead of harm.
	AI_Output(self,other, " DIA_Lee_Tower_05_12 " );	// Hmmm... good. I like your idea. However, without Onar's approval, you won't be able to see the tower.
	AI_Output(self,other, " DIA_Lee_Tower_05_13 " );	// I take it you want me to put in a few words for you?
	AI_Output(other,self,"DIA_Lee_Tower_15_14");	//Верно.
	AI_Output(self,other, " DIA_Lee_Tower_05_15 " );	// Good. I'll talk to Onar. He still won't lift a finger for the sake of restoring order there.
	AI_Output(self,other, " DIA_Lee_Tower_05_16 " );	// And personally, I'm already tired of listening to the complaints of peasants and mercenaries about this ill-fated territory.
	AI_Output(self,other, " DIA_Lee_Tower_05_17 " );	// Oh yeah, I won't tell him about Lord Hagen's role in all of this, and I don't advise you to either.
	LEE_APPROVES_TOWER = TRUE;
	B_LogEntry( TOPIC_MYNEWMANSION , " Lee will talk to Onar about my case. " );
	AI_StopProcessInfos(self);
};
