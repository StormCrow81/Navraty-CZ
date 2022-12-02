

var int choose_way;

instance DIA_Hagen_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Hagen_EXIT_Condition;
	information = DIA_Hagen_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hagen_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hagen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Hagen_NoEnter_PissOff(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Hagen_NoEnter_PissOff_Condition;
	information = DIA_Hagen_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Hagen_NoEnter_PissOff_Condition()
{
	if((CITYHALLACCESSGRANTED == FALSE) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hagen_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;

instance DIA_Hagen_PMSchulden(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hagen_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Hagen_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = " The city has outlawed you! " ;
	AI_Print(concatText);
};

func void dia_hagen_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = " The city has outlawed you! " ;
	AI_Print(concatText);
};

func void DIA_Hagen_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other, " DIA_Hagen_PMSchulden_04_00 " );	// It's good that you came. You can pay the fine right now.
	temp1 = 0 ;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_36 " );	// But, I'm afraid, in this case, no fine will save you from the gallows.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_37 " );	// Your constant killing of innocent people cannot continue with impunity.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_38 " );	// And therefore, by the power given to me by Innos and the King, I sentence you to death...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_39 " );	// In the name of Innos! Die!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_40 " );	// But, I'm afraid, in this case, no fine will save you from the gallows.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_41 " );	// Your constant attacks on the citizens of this city cannot continue with impunity for you.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_42 " );	// And therefore, by the power given to me by Innos and the King, I sentence you to death...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_43 " );	// In the name of Innos! Die!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_44 " );	// But, I'm afraid, in this case, no fine will save you from the gallows.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_45 " );	// You are a dirty thief! There is a great place for such complete thieves as you!
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_46 " );	// And therefore, by the power given to me by Innos and the King, I sentence you to death...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Hagen_PMSchulden_08_47 " );	// In the name of Innos! Die!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the paladins because of my constant outrages in the city. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PMSchulden, " Wait!...(it's time to leave) " ,dia_hagen_pmschulden_attackmurder);
	}
	else
	{
		if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
		{
			diff = B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter;
			if(diff > 0)
			{
				Hagen_debts = Hagen_debts + (diff *  250 );
			};
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_01 " );	// You don't take the city's laws very seriously, do you?
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_02 " );	// Your list of crimes keeps growing and growing.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_03 " );	// And don't tell me you didn't know this...
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_04 " );	// You will pay the maximum fine!
			AI_Output(other,self,"DIA_Hagen_PMAdd_15_00A");	//Сколько?
			if (Hagen_Debts <=  1000 )
			{
				B_Say_Gold(self,other,Hagen_Schulden);
			}
			else
			{
				concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
				concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
				concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
				AI_Print(concattextschulden);
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
		{
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_05 " );	// Looks like things have changed.
			if(Hagen_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_06 " );	// There are no more witnesses to your murder.
				GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER - 1;
				if(GLOBAL_CITY_MURDER < 0)
				{
					GLOBAL_CITY_MURDER = 0;
				};
			};
			if((Hagen_LastPetzCrime == CRIME_THEFT) || ((Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_07 " );	// No one can now confirm that you stole.
				GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT - 1;
				if(GLOBAL_CITY_THEFT < 0)
				{
					GLOBAL_CITY_THEFT = 0;
				};
			};
			if((Hagen_LastPetzCrime == CRIME_ATTACK) || ((Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_08 " );	// There are no more witnesses to your fight.
				GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK - 1;
				if(GLOBAL_CITY_ATTACK < 0)
				{
					GLOBAL_CITY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_09 " );	// All accusations against you are no longer confirmed.
			};
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_10 " );	// I don't know what happened in the city - and I don't want to know.
			AI_Output(self,other, " DIA_Hagen_PMSchulden_04_11 " );	// Just make sure you don't get in trouble here.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_12 " );	// Anyway, I decided to forgive your transgressions.
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_13 " );	// See that this doesn't happen again.
				Hagen_debts = 0 ;
				Hagen_LastPetzCounter = 0;
				Hagen_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_14 " );	// You will still pay the fine in full.
				AI_Output(other,self,"DIA_Hagen_PMAdd_15_00B");	//Сколько?
				if (Hagen_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Hagen_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other, " DIA_Hagen_PMSchulden_04_15 " );	// So, are you going to pay?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Hagen_PMSchulden);
			Info_ClearChoices(DIA_Hagen_PETZMASTER);
			Info_AddChoice(DIA_Hagen_PMSchulden, " I don't have enough gold! " ,DIA_Hagen_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Hagen_PMSchulden, " How Much Should I Pay? " ,DIA_Hagen_PMSchulden_HowMuchAgain);
			if (Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
			{
				Info_AddChoice(DIA_Hagen_PMSchulden, " I want to pay a fine. " ,DIA_Hagen_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	AI_Output(other,self, " DIA_Hagen_PMSchulden_HowMuchAgain_15_00 " );	// How many are there this time?
	if (Hagen_Debts <=  1000 )
	{
		B_Say_Gold(self,other,Hagen_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Hagen_PMSchulden);
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_AddChoice(DIA_Hagen_PMSchulden, " I don't have that much gold! " ,DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Hagen_PMSchulden, " How Much Do You Need? " ,DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
	{
		Info_AddChoice(DIA_Hagen_PMSchulden, " I want to pay a fine! " ,DIA_Hagen_PETZMASTER_PayNow);
	};
};


instance DIA_Hagen_PETZMASTER(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hagen_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Hagen_debts = 0 ;
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_00 " );	// Your fame precedes you. You broke the laws of the city!
	};
	temp1 = 0 ;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_48 " );	// But, I'm afraid, in this case, no fine will save you from the gallows.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_49 " );	// Your constant killing of innocent people cannot continue with impunity.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_50 " );	// And therefore, by the power given to me by Innos and the King, I sentence you to death...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_51 " );	// In the name of Innos! Die!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_52 " );	// But, I'm afraid, in this case, no fine will save you from the gallows.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_53 " );	// Your constant attacks on the citizens of this city cannot continue with impunity for you.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_54 " );	// And therefore, by the power given to me by Innos and the King, I sentence you to death...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_55 " );	// In the name of Innos! Die!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_56 " );	// But, I'm afraid, in this case, no fine will save you from the gallows.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_57 " );	// You are a dirty thief! There is a great place for such complete thieves as you!
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_58 " );	// And therefore, by the power given to me by Innos and the King, I sentence you to death...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_08_59 " );	// In the name of Innos! Die!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the paladins because of my constant outrages in the city. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PETZMASTER, " Wait!...(it's time to leave) " ,dia_hagen_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_01 " );	// You're in deep shit!
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_02 " );	// Murder is a serious crime!
			Hagen_Schulden = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_03 " );	// Not to mention the other accusations!
			};
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_04 " );	// Guards are ordered to execute the assassins on the spot.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_05 " );	// Murder is unacceptable in this city, but you can prove your remorse by paying a fine!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_06 " );	// You're accused of stealing!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_07 " );	// Not to mention the other crimes I heard about.
			};
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_08 " );	// This is against the laws of the city. You must pay a fine.
			Hagen_Schulden = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_09 " );	// You got into a fight. So you broke the law.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_10 " );	// And what's with the sheep?
			};
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_11 " );	// Violation of the laws of the city is a violation of the laws of Innos.
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_12 " );	// Therefore, you must pay for this.
			Hagen_Schulden = B_GetTotalPetzCounter(self) *  750 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_13 " );	// You killed our sheep - I didn't even believe it at first!
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_14 " );	// Why are you doing all this?
			AI_Output(self,other, " DIA_Hagen_PETZMASTER_04_15 " );	// You must pay compensation!
			Hagen_debts = 250 ;
		};
		AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Сколько?
		if (Hagen_Debts <=  1000 )
		{
			B_Say_Gold(self,other,Hagen_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PETZMASTER, " I don't have enough gold! " ,DIA_Hagen_PETZMASTER_PayLater);
		if (Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
		{
			Info_AddChoice(DIA_Hagen_PETZMASTER, " I want to pay a fine. " ,DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output(other,self, " DIA_Hagen_PETZMASTER_PayNow_15_00 " );	// I want to pay a fine!
	B_GiveInvItems(other,self,ItMi_Gold,Hagen_Schulden);
	AI_Output(self,other, " DIA_Hagen_PETZMASTER_PayNow_04_01 " );	// Good! I'll make sure everyone in town knows about it. This will restore your reputation to some extent.
	B_GrantAbsolution(LOC_CITY);
	Hagen_debts = 0 ;
	Hagen_LastPetzCounter = 0;
	Hagen_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_ClearChoices(DIA_Hagen_PMSchulden);
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output(other,self, " DIA_Hagen_PETZMASTER_PayLater_15_00 " );	// I don't have that much gold!
	AI_Output(self,other, " DIA_Hagen_PETZMASTER_PayLater_04_01 " );	// Then make sure you get that gold as quickly as possible.
	AI_Output(self,other, " DIA_Hagen_PETZMASTER_PayLater_04_02 " );	// And I warn you: if you aggravate your guilt in doing so, don't count on mercy.
	Hagen_LastPetzCounter = B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_Hello (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Hallo_Condition;
	information = DIA_Lord_Hagen_Hallo_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Lord_Hagen_Hallo_Condition()
{
	if ((hero.guild !=  GIL_NONE ) && (self.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (Chapter <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Hello_Info()
{
	AI_Output(self,other, " DIA_Lord_Hagen_Hallo_04_00 " );	// I've already heard about you.

	if(Npc_KnowsInfo(other,DIA_Lothar_EyeInnos) || (Andre_EyeInnos == TRUE))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_03 " );	// Lothar reported that you wanted to talk to me.
		AI_Output(self,other, " DIA_Lord_Hagen_Hallo_04_01 " );	// You are a foreigner who demands the Eye of Innos.
	};
	AI_Output(self,other, " DIA_Lord_Hagen_Hallo_04_02 " );	// I am Lord Hagen.
	AI_Output(self,other, " DIA_Lord_Hagen_Hallo_04_03 " );	// King's paladin, warrior of our lord Innos and commander-in-chief of Khorinis.
	AI_Output(self,other, " DIA_Lord_Hagen_Hallo_04_04 " );	// I'm a very busy person. So don't waste my time. Now tell me why you're here.
	HagenFTMeet = TRUE;
};


instance DIA_Lord_Hagen_Frieden (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Frieden_Condition;
	information = DIA_Lord_Hagen_Frieden_Info;
	permanent = FALSE;
	description = " I brought an offer of peace from the mercenaries! " ;
};


func int DIA_Lord_Hagen_Frieden_Condition()
{
	if ((MY_Lee_FreedomSongbot == LOG_Running) && (Npc_HasItems(other,ItWr_Passage_MY) >  0 ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Frieden_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Frieden_15_00 " );	// I brought an offer of peace from the mercenaries!
	B_GiveInvItems(other,self,ItWr_Passage_MIS,1);
	AI_Output(self,other, " DIA_Lord_Hagen_Frieden_04_01 " );	// (irritably) Hmm... show me!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lord_Hagen_Frieden_04_02 " );	// I know General Lee. I am also aware of the circumstances under which he was sentenced to corrective labor in the colony.
	AI_Output(self,other, " DIA_Lord_Hagen_Frieden_04_03 " );	// I consider him a noble man. I am ready to grant him pardon - but only to him!
	AI_Output(self,other, " DIA_Lord_Hagen_Frieden_04_04 " );	// This does not concern his people, however. Most of them are notorious thugs and deserve to be punished!
	AI_Output(self,other, " DIA_Lord_Hagen_Frieden_04_05 " );	// I will never pardon them. You can pass it on to Lee.
	Hagen_FriedenRejected = TRUE ;
	if ( ! Npc_KnowsInfo(other,DIA_Lord_Hagen_Army))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Frieden_04_06 " );	// Is that all?
	};
	B_LogEntry(TOPIC_Frieden, " Lord Hagen is willing to pardon Lee, but not other mercenaries. " );
};


instance DIA_LORD_HAGEN_WATERLETTER(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_waterletter_condition;
	information = dia_lord_hagen_waterletter_info;
	permanent = FALSE;
	description = " I brought a letter from Saturas. " ;
};


func int dia_lord_hagen_waterletter_condition()
{
	if((MIS_WATERMAGELETTER == LOG_Running) && (Npc_HasItems(other,itwr_watermageletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_waterletter_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_WaterLetter_04_00 " );	// I brought a letter from Saturas.
	B_GiveInvItems(other,self,itwr_watermageletter,1);
	AI_Output(self,other, " DIA_Lord_Hagen_WaterLetter_04_01 " );	// (surprised) Yes? Very interesting...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lord_Hagen_WaterLetter_04_02 " );	// Well, I don't see any reason why I should refuse this noble man.
	AI_Output(self,other, " DIA_Lord_Hagen_WaterLetter_04_03 " );	// I will immediately have a few paladins go to the Waterbenders to guard the portal.
	AI_Output(self,other, " DIA_Lord_Hagen_WaterLetter_04_04 " );	// You can convey it to him verbally.
	AI_Output(other,self, " DIA_Lord_Hagen_WaterLetter_04_05 " );	// Okay, I got it.
	HAGENTAKELETTER = TRUE;
	B_LogEntry( TOPIC_WATERMAGELETTER , " I have delivered Saturas' letter to the chief of the paladins. Lord Hagen has agreed to the mage's request and asked me to tell him that he will send some men to guard the portal. " );
};


instance DIA_Lord_Hagen_Eye (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Auge_Condition;
	information = DIA_Lord_Hagen_Auge_Info;
	permanent = FALSE;
	description = " What do you know about the Eye of Innos? " ;
};


func int DIA_Lord_Hagen_Auge_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Eye_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Auge_15_00 " );	// What do you know about the Eye of Innos?
	AI_Output(self,other, " DIA_Lord_Hagen_Auge_04_01 " );	// It's a divine artifact...(thoughtfully) Ancient prophecies mention it in connection with dragons.
	AI_Output(self,other, " DIA_Lord_Hagen_Auge_04_02 " );	// However, the scriptures also say that only the chosen one of Innos can wear it.

	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Lord_Hagen_Auge_15_03 " );	// I am the chosen one of Innos!
		AI_Output(self,other, " DIA_Lord_Hagen_Auge_04_04 " );	// Then maybe you really deserve this amulet.
	};
};


instance DIA_Lord_Hagen_Armee (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Armee_Condition;
	information = DIA_Lord_Hagen_Armee_Info;
	permanent = FALSE;
	description = " The forces of evil are gathering very close to here! " ;
};


func int DIA_Lord_Hagen_Armee_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		if((Hagen_FriedenAbgelehnt == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			return TRUE;
		};
		if((hero.guild == GIL_NDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
		{
			return TRUE;
		};
	};
};

func void DIA_Lord_Hagen_Armee_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Armee_15_00 " );	// The forces of evil are gathering very close to here. In the Valley of Mines!
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_01 " );	// In the Valley of Mines? We sent an expedition there. We also heard word that the Pass was occupied by orcs.
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_02 " );	// But until now, I have not received any information about the army of Evil.
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_Frieden))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_03 " );	// Is this some kind of ploy to make me believe that I need to form an alliance with the mercenaries?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Нет.
	};
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_05 " );	// And what kind of army is this?...(skeptically)
	AI_Output(other,self, " DIA_Lord_Hagen_Armee_15_06 " );	// An army of dragons that have gathered hordes of minions around them.
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_07 " );	// Dragons?! According to ancient writings, dragons have not been seen for many centuries.
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_08 " );	// Tell me - why should I believe what you say?
	AI_Output(other,self, " DIA_Lord_Hagen_Armee_15_09 " );	// The question is not whether you should believe me. The question is, can you afford NOT to believe me if I'm telling the truth.
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_04_10 " );	// Until I get proof, I can't afford to send more people there.
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_15_00 " );	// So you want me to bring you evidence?
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_04_01 " );	// Absolutely right!
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_01_00 " );	// If your words come true, then I'm ready to help you.
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_15_04 " );	// Does that mean you'll give me the 'Eye of Innos'?
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_04_05 " );	// Eye of Innos... (thoughtfully)
	AI_Output(self,other, " DIA_Lord_Hagen_Armee_01_01 " );	// Bring me evidence and I will have you allowed to wear this amulet.
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_15_06 " );	// So I can assume that you gave the floor?
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_04_07 " );	// You can! Since I really gave it!
};


instance DIA_Lord_Hagen_Pass(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Pass_Condition;
	information = DIA_Lord_Hagen_Pass_Info;
	permanent = TRUE;
	description = " How do I get through the passage? " ;
};


func int DIA_Lord_Hagen_Pass_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lord_Hagen_Army ) && ( Hagen_BringProof ==  FALSE ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Pass_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Pass_15_00 " );	// How do I get through the passage?

	if((hero.guild != GIL_NONE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_01 " );	// I have a key that will open the gate to the valley for you... (seriously)

		if(MIS_ONARBUSINESS != LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_02 " );	// However, before I give it to you, you will have to complete another, no less important task for me.
			AI_Output(other,self,"DIA_Lord_Hagen_Pass_01_03");	//В чем дело?
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_04 " );	// I've heard rumors that Waterbenders have found some strange magical portal. I want to know what's behind it!
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_05 " );	// Find out everything you can. Let's go and see what you're capable of.
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_06 " );	// Well, after that, I'll give you this key.
			AI_Output(other,self, " DIA_Lord_Hagen_Pass_01_07 " );	// I'll see what can be done.
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_08 " );	// Then don't waste your time!
			MIS_RAVENTHREAT = LOG_Running;
			Log_CreateTopic(TOPIC_RAVENTHREAT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RAVENTHREAT,LOG_Running);
			B_LogEntry( TOPIC_RAVENTHREAT , " Before sending me to the Valley of Mines, Lord Hagen wants me to find out everything about the magical portal that the Waterbenders recently found. He wants to know what lies behind it all and if there is any threat in it. " );
		}
		else
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_09 " );	// You helped us a lot with provisions, and I'll give you a choice:
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_10 " );	// Or go directly to the Valley of Mines...
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_11 " );	// ...or find out what lies behind the Waterbenders' portal.
			CHOOSE_WAY = TRUE;
		};

		Hagen_BringProof = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_418_Gritta,"TOT");
		AI_Teleport(Gritta,"TOT");
		B_ChapterChange( 2 , NEWWORLD_ZEN );

		if ( Fernando_ImKnast ==  FALSE )
		{
			B_StartOtherRoutine(Fernando,"WAIT");
		};

		Wld_InsertNpc(BDT_1020_Bandit_L,"NW_TROLLAREA_PATH_47");
	}
	else
	{
		if((MIS_Addon_Vatras_WhereAreMissingPeople != LOG_SUCCESS) || (MIS_Addon_Nefarius_BringMissingOrnaments != LOG_SUCCESS))
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_13 " );	// First, prove that you can stand up for yourself and complete the task.
			AI_Output(self,other, " DIA_Lord_Hagen_Pass_01_14 " );	// Help the Waterbenders solve their problems.
		}
		else if((hero.guild == GIL_NOV) || (hero.guild == GIL_NDM))
		{
			AI_Print(PRINT_Addon_GuildNeeded_NOV);
		}
		else
		{
			AI_Print(PRINT_Addon_GuildNeeded);
		};
	};
};


instance DIA_Lord_Hagen_Proof(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Proof_Condition;
	information = DIA_Lord_Hagen_Proof_Info;
	permanent = FALSE;
	description = " About your assignment... " ;
};


func int DIA_Lord_Hagen_Proof_Condition()
{
	if((MIS_RAVENTHREAT == LOG_Running) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Proof_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_01_01 " );	// About your assignment...
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_01_02 " );	// Yes? Did you manage to get something out?
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_01_05 " );	// The portal found by the Waterbenders leads to an unknown part of the island.
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_01_06 " );	// Apparently, a very ancient people once lived there, to whom Adanos himself showed his patronage!
	AI_Output(other,self, " DIA_Lord_Hagen_Proof_01_07 " );	// However, apparently, a lot of years have passed since those ancient times, and now, except for pirates and bandits, there is no one else there.
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_01_10 " );	// (thoughtfully) All this is somehow suspicious! They must be up to something.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_11");	//Не думаю.
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_01_13 " );	// Well, okay. Look, I rely on your words.
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_01_16 " );	// I think that this will be quite enough for now to control the overall situation.
	MIS_RAVENTHREAT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAVENTHREAT,LOG_SUCCESS);
	B_LogEntry( TOPIC_RAVENTHREAT , " I've told Lord Hagen everything I've found out. I think now I can go to the Valley of Mines to bring him evidence of dragons. " );
};


instance DIA_LORD_HAGEN_PROOFGIVEKEY(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_proofgivekey_condition;
	information = dia_lord_hagen_proofgivekey_info;
	permanent = FALSE;
	description = " Now can I go to the Valley of Mines? " ;
};


func int dia_lord_hagen_proofgivekey_condition()
{
	if((MIS_RAVENTHREAT == LOG_SUCCESS) || (CHOOSE_WAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proofgivekey_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_ProofGiveKey_01_01 " );	// Now I can go to the Valley of Mines?
	AI_Output(self,other, " DIA_Lord_Hagen_ProofGiveKey_01_02 " );	// (seriously) Yes. Now you can.
	AI_Output(self,other, " DIA_Lord_Hagen_Pass_04_01 " );	// I'll give you the key to the passage gate. However, you yourself will have to decide how to get through the crowds of orcs.
	CreateInvItems(self,ItKe_Pass_MIS,1);
	B_GiveInvItems(self,other,ItKe_Pass_MIS,1);
	AI_Output(self,other, " DIA_Lord_Hagen_ProofGiveKey_01_03 " );	// Go through the passage to the Valley of Mines. When you're there, find our expedition, and when you find them, talk to Commander Garond.
	AI_Output(self,other, " DIA_Lord_Hagen_Proof_04_02 " );	// Hardly anyone knows the situation there better than him.
	AI_Output(self,other, " DIA_Lord_Hagen_Pass_04_02 " );	// May Innos protect you!
	MIS_OLDWORLD = LOG_Running;
	Log_CreateTopic(Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(Topic_MISOLDWORLD,LOG_Running);
	B_LogEntry(Topic_MISOLDWORLD, " Lord Hagen wants me to bring him proof of the presence of the Evil army. I need to go to the Valley of Mines and speak with Commander Garond. " );
	AI_StopProcessInfos(self);
};


instances of DIA_Lord_Hagen_Khorinis (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Khorinis_Condition;
	information = DIA_Lord_Hagen_Corrinis_Info;
	permanent = FALSE;
	description = " Why did you come to Khorinis? " ;
};


func int DIA_Lord_Hagen_Khorinis_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lord_Hagen_Army ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Khorinis_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Khorinis_15_00 " );	// Why did you come to Khorinis?
	AI_Output(self,other, " DIA_Lord_Hagen_Khorinis_04_01 " );	// We're on an important mission for the kingdom. Our orders come directly from King Rhobar.
	AI_Output(self,other, " DIA_Lord_Hagen_Khorinis_04_02 " );	// I told you we sent an expedition to the Valley of Mines. This is the main reason for our presence here!

	if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && ( MY_PALADINWATCH  == LOG_Running ) && ( IDOLORANQUESTIONONE  ==  FALSE )) ;
	{
		IDOLORANQUESTIONONE = TRUE ;
		) ; _ _ _ _ _
	};
};


instance DIA_Lord_Hagen_Minental(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Minental_Condition;
	information = DIA_Lord_Hagen_Minental_Info;
	permanent = TRUE;
	description = " What are your people doing in the Valley of Mines? " ;
};


func int DIA_Lord_Hagen_Minental_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lord_Hagen_Khorinis ) && ( KnowsPaladins_Ore ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Minental_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Minental_15_00 " );	// And what are your people doing in the Valley of Mines?
	if(Hagen_BringProof == FALSE)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_01 " );	// I see no reason to tell you about this!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] ==  TRUE )
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_02 " );	// You were there. You must know.
		}
		else
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_03 " );	// Okay, since you're going there anyway, I'll tell you anyway.
		};
		AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_04 " );	// The reason for everything is the magic ore. She can decide the outcome of this war.
		AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_05 " );	// Without enough magic ore weapons, the royal army has no chance against the elite orc warriors.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_06 " );	// And the magical ore mines on the island are the last ones we still have access to.
		};
		AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_07 " );	// Once our ship is loaded with ore, we'll head back to the mainland.
		KnowsPaladins_Ore = TRUE;
		AI_Output(other,self, " DIA_Lord_Hagen_Minental_15_08 " );	// So the war against the orcs is going badly, huh?
		AI_Output(self,other, " DIA_Lord_Hagen_Minental_04_09 " );	// I've already told you too much.
		if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && ( MY_PALADINWATCH  == LOG_Running) && ( TWO IDOLORANQUESTIONS  ==  FALSE )) ;
		{
			IDOLORANQUESTIONTWO = TRUE;
			B_LogEntry( TOPIC_PALADINWATCH , " The main reason the paladins came to this island was magic ore. Without enough magic ore weapons, the king's army will have no chance in the war against the orcs. The party that went to the Valley of Mines must clear up the situation with the possibility of mining on the island.After that, the paladins plan to return back to the mainland. " );
		};
	};
};


instance DIA_Hagen_CanTeach(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Hagen_CanTeach_Condition;
	information = DIA_Hagen_CanTeach_Info;
	permanent = FALSE;
	description = " I'm looking for a master swordsman. " ;
};


func int DIA_Hagen_CanTeach_Condition()
{
	if ((LordHagen_Teach2H ==  FALSE ) && (other.guild ==  GIL_PAL ) && (other.aivar[ REAL_TALENT_2H ] >=  90 ) && (other.aivar[ REAL_TALENT_2H ] <  100 )) ;
	{
		return TRUE;
	};
};

func void DIA_Hagen_CanTeach_Info()
{
	AI_Output(other,self, " DIA_Hagen_CanTeach_15_00 " );	// I'm looking for a master swordsman.
	AI_Output(self,other, " DIA_Hagen_CanTeach_04_01 " );	// Yes? Consider that you have found it.
	LordHagen_Teach2H = TRUE;
	B_LogEntry(TOPIC_CityTeacher, " Lord Hagen can teach me two-handed combat. " );
};


instance DIA_Hagen_Teach(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 100;
	condition = DIA_Hagen_Teach_Condition;
	information = DIA_Hagen_Teach_Info;
	permanent = TRUE;
	description = " Let's start training. " ;
};


func int DIA_Hagen_Teach_Condition()
{
	if((LordHagen_Teach2H == TRUE) && (DIA_Hagen_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hagen_Teach_Info()
{
	AI_Output(other,self, " DIA_Hagen_Teach_15_00 " );	// Let's start learning!
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other, " DIA_Hagen_Teach_04_00 " );	// You've become a great swordsman! I have nothing more to teach you.
		AI_Output(self,other, " DIA_Hagen_Teach_04_01 " );	// May the wisdom of the master swordsman guide your hand in future accomplishments.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Hagen_Teach);
};

func void DIA_Hagen_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};


instance DIA_Lord_Hagen_Knight(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 990;
	condition = DIA_Lord_Hagen_Knight_Condition;
	information = DIA_Lord_Hagen_Knight_Info;
	permanent = TRUE;
	description = " I want to join the order. " ;
};

func int DIA_Lord_Hagen_Knight_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Knight_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Knight_15_00 " );	// I want to join the order.

	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_04_01 " );	// Well, you have proven that you have the courage, experience and knowledge to serve Innos.
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_04_02 " );	// Your deeds show that you have a pure heart.
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_04_03 " );	// If that is your wish, our order will gladly welcome you.
		Info_ClearChoices(DIA_Lord_Hagen_Knight);
		Info_AddChoice(DIA_Lord_Hagen_Knight, " I'm not quite sure yet. " ,DIA_Lord_Hagen_Knight_No);
		Info_AddChoice(DIA_Lord_Hagen_Knight,"Я готов!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_04_04 " );	// Becoming a warrior of Innos means dedicating yourself entirely to the service of Innos.
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_04_05 " );	// Only the most noble and courageous warriors can be accepted into the order.
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_04_06 " );	// If you're determined to become a paladin, you must prove yourself worthy.
	};
	Hagen_GiveInfoKnight = TRUE ;
};

func void DIA_Lord_Hagen_Knight_No()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Knight_No_15_00 " );	// I'm not quite sure yet.
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_No_04_01 " );	// Then go and clear your heart of doubt. Come back when you're ready.
	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

func void DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Knight_Yes_15_00 " );	// I'm ready!
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_01 " );	// (solemnly) Then so be it!
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_02 " );	// Many people took this path and gave their lives in the name of Innos.
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_03 " );	// Do you swear that your deeds will not dishonor their honor and will glorify Innos?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Клянусь!
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_05 " );	// Then from now on you belong to our brotherhood.
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_06 " );	// I make you a warrior of Innos.
	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_07 " );	// I give you the weapons and armor of a knight. Wear them with pride, knight!
	CreateInvItems(self,ItAr_PAL_M,1);
	B_GiveInvItems(self,other,ItAr_PAL_M,1);

	if(other.HitChance[NPC_TALENT_2H] >= other.HitChance[NPC_TALENT_1H])
	{
		CreateInvItems(self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems(self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems(self,other,ItMw_1h_Pal_Sword,1);
	};

	AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_08 " );	// From now on, thanks to your rank, you will have access to the monastery.
	if (Npc_IsDead(Albrecht) ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Knight_Yes_04_09 " );	// Albrecht will teach you magic, go and talk to him.
	};
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_02 " );	// And of course, our barracks uptown are always open for you.

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	hero.guild = GIL_PAL;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("GUILD_INV");
	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

instance DIA_Lord_Hagen_WhatProof(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 991;
	condition = DIA_Lord_Hagen_WhatProof_Condition;
	information = DIA_Lord_Hagen_WhatProof_Info;
	permanent = FALSE;
	description = " How can I prove myself worthy? " ;
};

func int DIA_Lord_Hagen_WhatProof_Condition()
{
	if ((Hagen_GaveInfoKnight ==  TRUE ) && (MIS_RescueBennet !=  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_WhatProof_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_WhatProof_15_00 " );	// How can I prove myself worthy?
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_01 " );	// Your deeds will show whether you are worthy or not.
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_02 " );	// We fight for freedom and justice in the name of Innos.
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_03 " );	// We fight against Beliar and his minions, who are eager to destroy the Order of Innos.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Я понимаю.
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_05 " );	// You don't understand anything! Our honor is our life, and our life is Innos.
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_06 " );	// A paladin goes into battle with the name of Innos on his lips, and many of us put our lives on the altar of the eternal struggle between Good and Evil.
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_07 " );	// All of us, as one, dedicated ourselves to this fight. If we fail, we will desecrate the memory of our fallen comrades.
	AI_Output(self,other, " DIA_Lord_Hagen_WhatProof_04_08 " );	// Only those who understand this in their hearts are worthy of being a paladin.
};


instance DIA_Lord_Hagen_KAP3_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information = DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Hagen_KnowsEyeKaputt;

instance DIA_Lord_Hagen_KAP3U4_PERM(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 998;
	condition = DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information = DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP3U4_PERM_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_KAP3U4_PERM_15_00 " );	// How's the situation?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_04 " );	// I must find a way to save this expedition.
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_05 " );	// We need to do something with the dragons.
		if(Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output(self,other, " DIA_Lord_Hagen_Add_04_06 " );	// (to himself) Perhaps the Eye of Innos can save us all...
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_KAP3U4_PERM_04_01 " );	// I'm going crazy here. I am a soldier, not a bureaucrat.
		AI_Output(self,other, " DIA_Lord_Hagen_KAP3U4_PERM_04_02 " );	// With all the paperwork I have to do, I almost forgot the feel of the blade in my hand.
	};
};


instance DIA_Lord_Hagen_EyeBroken(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_EyeBroken_Condition;
	information = DIA_Lord_Hagen_EyeBroken_Info;
	permanent = FALSE;
	description = " I have an eye, but it's damaged. " ;
};


func int DIA_Lord_Hagen_EyeBroken_Condition()
{
	if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_EyeBroken_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_07 " );	// I have an eye, but it's damaged.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_08 " );	// WHAT? Oh Innos! What have you done? We need that Eye!
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_09 " );	// Talk to Pyrocar! There must be a way to restore it.
	Hagen_KnowsEyeKaputt = TRUE;
};

instance DIA_Lord_Hagen_BACKINTOWN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_BACKINTOWN_Condition;
	information = DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent = FALSE;
	description = " I bring you news from Garond. " ;
};

func int DIA_Lord_Hagen_BACKINTOWN_Condition()
{
	if (( MIS_OLDWORLD  == LOG_Running) && (Npc_HasItems(hero,ItWr_PaladinLetter_MIS) >=  1 ) && (Chapter ==  3 ) && (MeetDarkRavenSpeaker ==  TRUE ) && (DarkPathStart ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_BACKINTOWN_Info()
{
	var int rnd;

	AI_Output(other,self, " DIA_Lord_Hagen_BACKINTOWN_15_00 " );	// I brought you news from Garond. Here, he wrote these lines for you.
	B_GiveInvItems(other,self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lord_Hagen_BACKINTOWN_04_01 " );	// Our situation is worse than I feared. But report back to me about the situation in the Valley of Mines.
	AI_Output(other,self, " DIA_Lord_Hagen_BACKINTOWN_15_02 " );	// The paladins are locked in the castle of the Valley of Mines, surrounded by orcs.
	AI_Output(other,self, " DIA_Lord_Hagen_BACKINTOWN_15_03 " );	// They lost a lot of people in mining operations and got very little ore.
	AI_Output(other,self, " DIA_Lord_Hagen_BACKINTOWN_15_04 " );	// And, I must add, without outside help, they will all soon be finished. That's it.
	AI_Output(self,other, " DIA_Lord_Hagen_BACKINTOWN_04_05 " );	// I must find a way to save this expedition. You have done a lot for us. Innos thanks you...
	AI_Output(other,self, " DIA_Lord_Hagen_BACKINTOWN_15_06 " );	// I'm not interested in his gratitude. I need his eye.
	AI_Output(self,other, " DIA_Lord_Hagen_BACKINTOWN_04_07 " );	// Yes, of course. I keep my word. Take this letter. It will open the monastery gates for you.
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other, " DIA_Lord_Hagen_BACKINTOWN_04_08 " );	// Talk to Pyrocar, High Firebender, and show him this Letter of Authority. He will grant you access to the Eye of Innos.

	if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && ( MY_PALADINWATCH  == LOG_Running ) && ( IDOLORANQUESTIONFIVE  ==  FALSE )) .
	{
		IDOLORANQUESTIONFIVE = TRUE;
		IDOLORANQUESTIONFULLCOMPLETE = TRUE;
		B_LogEntry_Quiet( TOPIC_PALADINWATCH , " Lord Hagen's next steps are clear - he will think about how to get his people out of the encirclement. Until he does, the paladins will not leave the island. " );
	};

	MIS_OLDWORLD = LOG_SUCCESS;
	CanStartMyCamp = TRUE;
	B_LogEntry( TOPIC_INNOSEYE , " Lord Hagen has given me a note. It will force the master Pyrocar at the monastery to give me the Eye of Innos. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PC_Mage_NW,"NW_MONASTERY_ENTRY_01");

	if (DarkPathStart ==  FALSE )
	{
		MIS_InnosEyeStolen = TRUE;
		B_StartOtherRoutine(NOV_600_Pedro,"TOT");
		Wld_InsertNpc(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
		Wld_InsertNpc(BDT_1050_Tramp, " NW_TROLLAREA_NOVCHASE_01 " );
		Wld_InsertNpc(BDT_1051_Wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
		Wld_InsertNpc(BDT_1052_Wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
		Wld_InsertNpc(DMT_1200_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1202_Dementor,"NW_TROLLAREA_RITUAL_01");
		Wld_InsertNpc(DMT_1204_Dementor,"NW_TROLLAREA_RITUAL_03");
		Wld_InsertNpc(DMT_1206_Dementor,"NW_TROLLAREA_RITUAL_05");
		Wld_InsertNpc(DMT_1207_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1209_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1210_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1211_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(BDT_1020_Bandit_L);
		Wld_InsertNpc(NOV_650_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_650_ToterNovize);
		Wld_InsertNpc(NOV_651_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_651_ToterNovize);
		Wld_InsertNpc(NOV_652_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_652_ToterNovize);
		Wld_InsertNpc(NOV_653_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_653_ToterNovize);
		Wld_InsertNpc(NOV_654_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_654_ToterNovize);
		Wld_InsertNpc(NOV_655_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_655_ToterNovize);
		Wld_InsertNpc(NOV_656_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_656_ToterNovize);
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Broken;
		Wld_InsertItem(ItMi_InnosEye_Broken_Mis,"FP_TROLLAREA_RITUAL_ITEM");
		rnd = Hlp_Random( 65 );

		if(rnd <= 10)
		{
			CreateInvItems(DMT_1209_Dementor,itri_ritualplace,1);
		}
		else if(rnd <= 20)
		{
			Wld_InsertItem(itri_ritualplace,"NW_TROLLAREA_RITUALPATH_08");
		}
		else if(rnd <= 30)
		{
			Wld_InsertItem(itri_ritualplace,"NW_TROLLAREA_RITUALPATH_11");
		}
		else if(rnd <= 40)
		{
			CreateInvItems(DMT_1200_Dementor,itri_ritualplace,1);
		}
		else if(rnd <= 50)
		{
			CreateInvItems(DMT_1204_Dementor,itri_ritualplace,1);
		}
		else
		{
			Wld_InsertItem(itri_ritualplace,"NW_TROLLAREA_RITUALPATH_07");
		};

		Wld_InsertNpc(DMT_1270_Dementor,"NW_DARKMASTER_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_01_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_01_02");
		Wld_InsertNpc(DMT_1271_Dementor,"NW_DARKMASTER_02");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_02");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_03");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_04");
		Wld_InsertNpc(DMT_1272_Dementor,"NW_DARKMASTER_03");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_03_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_03_02");
		DarkPathStartEnd = TRUE;
	}
	else
	{
		DarkPathStartPyr = TRUE;
	};
};


var int Hagen_onceBennet;

instance DIA_Lord_Hagen_RescueBennet(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_RescueBennet_Condition;
	information = DIA_Lord_Hagen_RescueBennet_Info;
	permanent = TRUE;
	description = " I need to talk to you about Bennett. " ;
};

func int DIA_Lord_Hagen_RescueBennet_Condition()
{
	if ((MY_RescueBench == LOG_Running) && (Cornelius_IsLiar ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RescueBennet_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_RescueBennet_15_00 " );	// I need to talk to you about Bennett.
	if (Hagen_einmalBennet ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_04_01 " );	// But this mercenary killed one of my men.
		Hagen_einmalBennet = TRUE ;
	};
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice(DIA_Lord_Hagen_RescueBennet,Dialog_Back,DIA_Lord_Hagen_RescueBennet_Back);

	if(RecueBennet_KnowsCornelius == FALSE)
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet, " Why are you so sure Bennet is the killer? " ,DIA_Lord_Hagen_RescueBennet_WhySure);
	};

	Info_AddChoice(DIA_Lord_Hagen_RescueBennet, " I believe Bennet is innocent. " ,DIA_Lord_Hagen_RescueBennet_Innoscent);

	if((MIS_RescueBennet == LOG_Running) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Hagen_KnowsEyeKaputt == TRUE))
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet, " Bennet could help us fix the Eye of Innos. " ,DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_16 " );	// Bennet could help us fix the Eye of Innos.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_17 " );	// Even if he could summon Innos himself to the ground...
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_18 " );	// He killed the paladin. For this he will be executed!
};

func void DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
};

func void DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output(other,self, " DIA_Lord_Hagen_RescueBennet_WhySure_15_00 " );	// Why are you so sure Bennett is the killer?
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_WhySure_04_01 " );	// We have a witness.
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_WhySure_04_02 " );	// As you can see, there is no doubt about the guilt of this mercenary.
	AI_Output(other,self, " DIA_Lord_Hagen_RescueBennet_Witness_15_00 " );	// Who is this witness?
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_Witness_04_01 " );	// Cornelius, secretary to the mayor, saw the murder happen.
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_Witness_04_02 " );	// His description fits Bennett, there's no doubt about it. In my opinion, this is proof enough.
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_Witness_04_03 " );	// This mercenary will be hanged for treason.
	B_LogEntry(TOPIC_RescueBennet, " Cornelius, the mayor's secretary, is a witness. He claims to have witnessed the murder. " );
	RecueBennet_KnowsCornelius = TRUE;
};

func void DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output(other,self, " DIA_Lord_Hagen_RescueBennet_Innoscent_15_00 " );	// I believe Bennett is innocent.
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_Innoscent_04_01 " );	// The evidence is there. He is guilty.
	AI_Output(other,self, " DIA_Lord_Hagen_RescueBennet_Innoscent_15_02 " );	// What if the evidence is wrong?
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_Innoscent_04_03 " );	// Choose words. You are making a serious accusation.
	AI_Output(self,other, " DIA_Lord_Hagen_RescueBennet_Innoscent_04_04 " );	// If you can't provide proof that the witness lied, you'd better hold your tongue.
};


instance DIA_Lord_Hagen_Cornelius(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_Cornelius_Condition;
	information = DIA_Lord_Hagen_Cornelius_Info;
	permanent = TRUE;
	description = " Cornelius lied. " ;
};

func int DIA_Lord_Hagen_Cornelius_Condition()
{
	if ((Npc_HasItems(other,ItWr_My_Cornelius_Daybook) >=  1 ) && (Cornelius_IsLiar ==  TRUE ) && (MY_RescueBenefit == LOG_Running));
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Cornelius_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Cornelius_15_00 " );	// Cornelius lied.
	AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_01 " );	// How do you know this?
	AI_Output(other,self, " DIA_Lord_Hagen_Cornelius_15_02 " );	// Here, I have his diary. Everything is in it.
	B_GiveInvItems(other,self,ItWr_CorneliusTagebuch_Mis,1);
	AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_03 " );	// (furious) Ah, vile scum!
	AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_04 " );	// In the face of new evidence, I have no choice.
	AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_05 " );	// By the authority vested in me by the king and the church, I proclaim...
	AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_06 " );	// ...that prisoner Bennett is cleared of all charges and is to be released.
	AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_07 " );	// Cornelius should be immediately placed under arrest for perjury.
	if(Npc_IsDead(Cornelius) == TRUE)
	{
		AI_Output(other,self, " DIA_Lord_Hagen_Cornelius_15_08 " );	// Don't worry. Cornelius is dead.
		AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_09 " );	// So, he has already suffered a well-deserved punishment. Excellent.
	}
	else if(CorneliusFlee == TRUE)
	{
		AI_Output(other,self, " DIA_Lord_Hagen_Cornelius_15_10 " );	// He escaped.
		AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_11 " );	// Sooner or later, he'll show up. And then we'll arrest him.
		B_StartOtherRoutine(Cornelius,"FLED");
	}
	else
	{
		B_StartOtherRoutine(Cornelius,"PRISON");
	};

	MIS_RescueBennet = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueBennet);

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Cornelius_04_12 " );	// Your deeds have saved us from dishonor.
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(SLD_809_Bennet,"START");
	B_StartOtherRoutine(BAU_908_Hodges,"START");
};

instance DIA_Lord_Hagen_AugeAmStart(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 4;
	condition = DIA_Lord_Hagen_AugeAmStart_Condition;
	information = DIA_Lord_Hagen_AugeAmStart_Info;
	permanent = FALSE;
	description = " I put on the Eye! " ;
};

func int DIA_Lord_Hagen_AugeAmStart_Condition()
{
	if((Kapitel <= 4) && (MIS_ReadyforChapter4 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AugeAmStart_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_10 " );	// I put on the Eye!
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_11 " );	// (reverently) You wear the Eye!
	if(Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_12 " );	// And you restored it!
	};
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_13 " );	// So you are the Chosen One of Innos!
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_14 " );	// I must go and slay all the dragons in the Valley of Mines!
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_15 " );	// Go with Innos and destroy the Evil with it!
};


instance DIA_Lord_Hagen_KAP4_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information = DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_ANTIPALADINE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information = DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent = TRUE;
	description = " Elite orc warriors are attacking our lands. " ;
};


func int DIA_Lord_Hagen_ANTIPALADINE_Condition()
{
	if (((TalkedTo_AntiPaladin ==  TRUE ) || Npc_HasItems(other,ItRi_OrcEliteRing)) && (MIS_ReadyforChapter4 ==  TRUE ) && (Hagen_SawOrcRing ==  FALSE ) && ( MIS_OR с GREATWAR  ==  FALSE )) ;
	{
		return TRUE;
	};
};


var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_ANTIPALADINE_15_00 " );	// Elite orc warriors are attacking our lands.
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite, " I told Lord Hagen about the approaching hordes of orc leaders. " );
	if((TalkedTo_AntiPaladin == TRUE) && (MIS_KillOrkOberst == 0))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_01 " );	// Where did you get this information from?
		AI_Output(other,self, " DIA_Lord_Hagen_ANTIPALADINE_15_02 " );	// I spoke to one of them. Your name was also mentioned.
	};
	AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_03 " );	// Nonsense. My people didn't report a massive ork invasion.
	AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_04 " );	// Perhaps some of their scouts got lost in the nearby woods.
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		AI_Output(other,self, " DIA_Lord_Hagen_ANTIPALADINE_15_05 " );	// These are not scouts. I took this ring from the corpse of one of them.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Покажи.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_07 " );	// (thoughtfully) This is really annoying.
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_08 " );	// It's a sign of their strength! So the orcs have come out from behind their palisades and are fighting in the open field.
		AI_Output(other,self, " DIA_Lord_Hagen_ANTIPALADINE_15_09 " );	// I haven't seen many of them. Basically, these are their leaders and only a few fighters.
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_10 " );	// Yes?! So they are up to something else. It's not like orcs to see their leaders leaving their defensive palisades alone.
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_11 " );	// But, however, this may be a good opportunity to hit them sensitively.
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_12 " );	// If they lose their leaders, their morale will drop drastically.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_13 " );	// You have a new mission, knight. Go and kill all the orc leaders you find in the surrounding lands!
		}
		else
		{
			AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_19 " );	// You have a new task. Go and kill all the orc leaders you find in the surrounding lands!
		};
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_14 " );	// Bring me their rings! This will be a serious blow to the orcs.
		B_LogEntry(TOPIC_OrcElite, " I must bring Lord Hagen the ring of orc warlords as proof of their presence. I must bring him all the rings I can find. " );
		if ((Npc_IsDead(Ingmar) ==  FALSE ) && (MIS_KillOrkColonel ==  0 ))
		{
			AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_15 " );	// Talk to Ingmar. He can give you some tactical advice for fighting the orc leaders.
			AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_16 " );	// Elite orc warriors are his speciality. He often had to deal with them.
			B_LogEntry(TOPIC_OrcElite, " Ingmar knows a lot about Orc elite warriors. " );
		};
		Hagen_SawOrcRing = TRUE;
		B_GivePlayerXP(XP_PAL_OrcRing);
	}
	else
	{
		if(MIS_KillOrkOberst == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_17 " );	// Just saying you killed an orc warlord isn't enough for me.
		};
		AI_Output(self,other, " DIA_Lord_Hagen_ANTIPALADINE_04_18 " );	// I need physical evidence so I can take action.
		B_LogEntry(TOPIC_OrcElite, " Hagen refuses to believe me. He demands proof that Orc elite warriors are attacking civilized lands. Well, I'd be surprised if he behaved differently. " );
	};
};

instance DIA_Lord_Hagen_RINGBRINGEN (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_RINGBRINGEN_Condition;
	information = DIA_Lord_Hagen_RINGBRINGEN_Info;
	permanent = TRUE;
	description = " I have one more thing to say about the orc leaders. " ;
};

func int DIA_Lord_Hagen_RINGBRINGEN_Condition()
{
	if ((Hagen_SawOrcRing ==  TRUE ) && (Npc_HasItems(other,ItRi_OrcEliteRing) >=  1 ) && (TOPIC_END_OrcElite ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RINGBRINGEN_Info()
{
	var int Ringcount;
	var int XP_PAL_OrcRings;

	AI_Output(other,self, " DIA_Lord_Hagen_RINGEBRINGEN_15_00 " );	// I have one more thing to say about the orc leaders.
	AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_01 " );	// Tell me.

	XP_PAL_OrcRings = 50;
	Ringcount = Npc_HasItems(other,ItRi_OrcEliteRing);

	if(Ringcount == 1)
	{
		AI_Output(other,self, " DIA_Lord_Hagen_RINGEBRINGEN_15_02 " );	// I can give you another orc ring.
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		OrkRingCounter = OrkRingCounter +  1 ;
	}
	else
	{
		AI_Output(other,self, " DIA_Lord_Hagen_RINGEBRINGEN_15_03 " );	// I can give you some more orc rings.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,Ringcount);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		XP_PAL_OrcRings = Ringcount * XP_PAL_OrcRing;
		OrkRingCounter = OrkRingCounter + Ringcount;
		B_GivePlayerXP(XP_PAL_OrcRings);
	};
	AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_04 " );	// I'm proud of you. Keep it up!

	if(OrkRingCounter <= 10)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_05 " );	// Perhaps not all orc leaders have been destroyed yet.
	}
	else if(OrkRingCounter <= 20)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_06 " );	// But soon we'll bring them to their knees.
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_07 " );	// I'll be surprised if you meet them again.
		AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_08 " );	// You can bring me their rings, but I think the orcs have already learned a good lesson.
		TOPIC_END_OrcElite = TRUE;
		Log_SetTopicStatus(TOPIC_OrcElite,LOG_SUCCESS);
		B_LogEntry(TOPIC_OrcElite, " The elite Orc units have been defeated! Lord Hagen was satisfied with my work. " );
	};
};

instance DIA_Lord_Hagen_RINGBRINGENMORE (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_RINGBRINGENMORE_Condition;
	information = DIA_Lord_Hagen_RINGBRINGENMORE_Info;
	permanent = TRUE;
	description = " I can give you some more orc rings. " ;
};

func int DIA_Lord_Hagen_RINGBRINGENMORE_Condition()
{
	if ((Npc_HasItems(other,ItRi_OrcEliteRing) >=  1 ) && (TOPIC_END_OrcElite ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RINGBRINGENMORE_Info()
{
	var int Ringcount;
	var int XP_PAL_OrcRings;

	XP_PAL_OrcRings = 50;
	Ringcount = Npc_HasItems(other,ItRi_OrcEliteRing);

	if(Ringcount == 1)
	{
		AI_Output(other,self, " DIA_Lord_Hagen_RINGEBRINGEN_15_02 " );	// I can give you another orc ring.
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
	}
	else
	{
		XP_PAL_OrcRings = Ringcount * XP_PAL_OrcRing;
		B_GivePlayerXP(XP_PAL_OrcRings);
		AI_Output(other,self, " DIA_Lord_Hagen_RINGEBRINGEN_15_03 " );	// I can give you some more orc rings.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,Ringcount);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
	};

	AI_Output(self,other, " DIA_Lord_Hagen_RINGEBRINGEN_04_04 " );	// I'm proud of you. Keep it up!
};

instance DIA_Lord_Hagen_KAP5_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information = DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_AllDragonsDead(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 4;
	condition = DIA_Lord_Hagen_AllDragonsDead_Condition;
	information = DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent = FALSE;
	description = " The dragons are dead. " ;
};


func int DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if ((Capital ==  5 ) && ( MIS_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_AllDragonsDead_15_00 " );	// The dragons are dead.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_19 " );	// I knew Innos would give you the strength to defeat the dragons!
	AI_Output(self,other, " DIA_Lord_Hagen_AllDragonsDead_04_02 " );	// How's the ore?
	AI_Output(other,self, " DIA_Lord_Hagen_AllDragonsDead_15_03 " );	// The orcs are still besieging the castle in the Vale of Mines. Garond will not be able to leave the castle until the siege is lifted.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_20 " );	// (furious) Damn!
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_21 " );	// If Garond is unable to handle the situation, I must take control.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_22 " );	// A bunch of orcs won't stop me! Just not me!
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_23 " );	// I've already given the order to my men. We are getting ready to perform.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_24 " );	// We'll ALL go there. I will leave only minimal security on the ship.
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_25 " );	// That should be enough to finally deal with those orcs!
	MIS_SCvisitShip = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_Lord_Hagen_NeedShip(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 4;
	condition = DIA_Lord_Hagen_NeedShip_Condition;
	information = DIA_Lord_Hagen_NeedShip_Info;
	permanent = FALSE;
	description = " I need a ship. " ;
};


func int DIA_Lord_Hagen_NeedShip_Condition()
{
	if((ItWr_SCReadsHallsofIrdorath == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_NeedShip_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_NeedShip_15_00 " );	// I need a ship.

	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_NeedShip_04_01 " );	// A lot of people need him, soldier.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_NeedShip_04_02 " );	// I hear it almost every day, dear. But...
	};
	AI_Output(self,other, " DIA_Lord_Hagen_NeedShip_04_03 " );	// You don't even have a captain, let alone a team.
	AI_Output(other,self, " DIA_Lord_Hagen_NeedShip_15_04 " );	// How about a ship in the harbor?
	AI_Output(self,other, " DIA_Lord_Hagen_NeedShip_04_05 " );	// It belongs to me, period. We have to transport the ore on this ship.
	AI_Output(self,other, " DIA_Lord_Hagen_NeedShip_04_06 " );	// When we're done with this, you can contact me again.
};


instance DIA_Lord_Hagen_GateOpen(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_GateOpen_Condition;
	information = DIA_Lord_Hagen_GateOpen_Info;
	permanent = FALSE;
	description = " Orcs broke into the castle in the Valley of Mines! " ;
};

func int DIA_Lord_Hagen_GateOpen_Condition()
{
	if ((MIS_OCGateOpen ==  TRUE ) && Npc_KnowsInfo(other,DIA_Lord_Hagen_AllDragonsDead) && ( MIS_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_GateOpen_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_29 " );	// Orcs have broken into the castle in the Vale of Mines!
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_30 " );	// Oh, Innos! What exactly happened there?
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_31 " );	// For some reason, the gate was open...
	AI_Output(self,other, " DIA_Lord_Hagen_Add_04_32 " );	// For some reason?! But how is that possible... There must be a traitor in the castle!
};


instance DIA_Lord_Hagen_Perm5(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_Perm5_Condition;
	information = DIA_Lord_Hagen_Perm5_Info;
	permanent = TRUE;
	description = " What are you waiting for? " ;
};


func int DIA_Lord_Hagen_Perm5_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lord_Hagen_AllDragonsDead ) && ( MIS_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Perm5_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_Add_15_33 " );	// What are you waiting for?
	if(MIS_OCGateOpen == FALSE)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_26 " );	// We're waiting for our equipment and supplies. Then we'll be on our way!
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_27 " );	// Now that the castle is under attack, we need more supplies.
		AI_Output(self,other, " DIA_Lord_Hagen_Add_04_28 " );	// But our departure has long been delayed because of this.
	};
};

instance DIA_LORD_HAGEN_PICKPOCKET(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 900;
	condition = dia_lord_hagen_pickpocket_condition;
	information = dia_lord_hagen_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int dia_lord_hagen_pickpocket_condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (ETLUBEGINS == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pickpocket_info()
{
	Info_ClearChoices(dia_lord_hagen_pickpocket);
	Info_AddChoice(dia_lord_hagen_pickpocket,Dialog_Back,dia_lord_hagen_pickpocket_back);
	Info_AddChoice(dia_lord_hagen_pickpocket,DIALOG_PICKPOCKET,dia_lord_hagen_pickpocket_doit);
};

func void dia_lord_hagen_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
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
		B_GiveInvItems(self,other,itke_hagen_secretkey,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		if(XARDASLINE == TRUE)
		{
			B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I stole the key from Lord Hagen! I think I should now go back to Xardas and tell him everything. " );
		}
		else if(KREOLLINE == TRUE)
		{
			B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I stole the key from Lord Hagen! I think I should now go back to Creole and tell him everything. " );
		};
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
	};
};

func void dia_lord_hagen_pickpocket_back()
{
	Info_ClearChoices(dia_lord_hagen_pickpocket);
};


instance DIA_LORD_HAGEN_MELHIOR(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = dia_lord_hagen_melhior_condition;
	information = dia_lord_hagen_melhior_info;
	permanent = FALSE;
	description = " I want to tell you something... " ;
};


func int dia_lord_hagen_melhior_condition()
{
	if((MELHIORPISSOFF == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_melhior_info()
{
	var C_Npc melhior;
	melhior = Hlp_GetNpc(pal_187_melhior);
	AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_00 " );	// I want to say something...
	if(other.guild == GIL_PAL)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_02 " );	// One of the paladins is behaving inappropriately for his position.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_04 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_05 " );	// He was absent from the post during his duty, and besides that, he was still drunk as a brat.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_08 " );	// WHAT?! It's outrageous...
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_11 " );	// What's his name?
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_12 " );	// His name is Melchior.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_13 " );	// All right - I'll make sure he gets what he deserves. Such a person has no place in our ranks!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(better,ITAR_Bau_L);
	}
	else if(other.guild == GIL_MIL)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_17 " );	// One of the paladins is behaving inappropriately for his position.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_19 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_20 " );	// He was absent from the post during his duty, and besides that, he was still drunk as a brat.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_23 " );	// WHAT?! It's outrageous...
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_27 " );	// What's his name?
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_28 " );	// His name is Melchior.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_29 " );	// All right - I'll make sure he gets what he deserves. Such a person has no place in our ranks!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(better,ITAR_Bau_L);
	}
	else if(other.guild == GIL_KDF)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_33 " );	// One of the paladins is behaving inappropriately for his position.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_35 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_36 " );	// He was absent from his post during his duty, and besides that, he was drunk as hell!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_39 " );	// WHAT?! It's outrageous...
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_42 " );	// What's his name?
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_43 " );	// His name is Melchior.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_44 " );	// All right - I'll make sure he gets what he deserves. Such a person has no place in our ranks!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(better,ITAR_Bau_L);
	}
	else if(other.guild == GIL_KDW)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_48 " );	// One of the paladins is behaving inappropriately for his position.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_50 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_51 " );	// He was absent from his post during his duty, and besides that, he was drunk as hell!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_54 " );	// WHAT?! It's outrageous...
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_57 " );	// What's his name?
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_58 " );	// His name is Melchior.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_59 " );	// All right - I'll make sure he gets what he deserves. Such a person has no place in our ranks!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(better,ITAR_Bau_L);
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_63 " );	// One of the paladins is behaving inappropriately for his position.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_65 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_66 " );	// He was absent from his post during his duty, and besides that, he was drunk as hell!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_70 " );	// And do you really think that I will believe at least one word of yours, necromancer?
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_71 " );	// What you're saying can't be true! This is complete nonsense!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_72 " );	// A paladin can't fall that low!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_75 " );	// Now get out, and don't you dare complain to me like that again!
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_77 " );	// One of the paladins is behaving inappropriately for his position.
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_79 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_80 " );	// He was absent from his post during his duty, and besides that, he was drunk as hell!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_84 " );	// And do you really think that I will believe even one word of yours, dirty mercenary?
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_85 " );	// What you're saying can't be true! This is complete nonsense!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_86 " );	// A paladin can't fall that low!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_89 " );	// Now get out, and don't you dare complain to me like that again!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_91 " );	// One of the paladins is behaving inappropriately for his position!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_93 " );	// (indignantly) How to understand this? Explain!
		AI_Output(other,self, " DIA_Lord_Hagen_Melhior_01_94 " );	// He was absent from his post during his duty, and besides that, he was drunk as hell!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_97 " );	// (maliciously) Oh well?
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_98 " );	// And do you really think that I will believe at least one word of yours?
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_99 " );	// What you're saying can't be true! This is complete nonsense!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_100 " );	// A paladin can't fall that low!
		AI_Output(self,other, " DIA_Lord_Hagen_Melhior_01_103 " );	// Now get out, and don't you dare complain to me like that again!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LORD_HAGEN_PALADINFOOD(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_paladinfood_condition;
	information = dia_lord_hagen_paladinfood_info;
	permanent = FALSE;
	description = " Trader Luthero sent me. " ;
};

func int dia_lord_hagen_paladinfood_condition()
{
	if(MIS_PALADINFOOD == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_paladinfood_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFood_01_00 " );	// Merchant Luthero sent me.
	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFood_01_09 " );	// He's asking you to provide him with the exact amounts of these food supplies.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_14 " );	// Hmm... You see, I can only provide you with information on food for those paladins who are here in Khorinis.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_15 " );	// However, there are other units besides them.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_18 " );	// This expedition was very important for the king, so at least a hundred of the best fighters of the order arrived in Khorinis.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_20 " );	// But there wasn't enough room in the city to accommodate them all.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_21 " );	// For this reason, most of the paladins under the command of Lord Varus and went to the royal fort Azgan.
	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFood_01_22 " );	// Royal fort? Here on the island?
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_23 " );	// No. It is located on one of the small islands next to Khorinis itself.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_24 " );	// It's just that the only path that leads to this fort is on this island.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_25 " );	// An underground passage in the mountains, east of the city itself. Just a day's journey - and you're already there.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_27 " );	// That's why my calculations regarding the volumes of these deliveries may be inaccurate.

	if((MIS_OLDWORLD == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_28 " );	// Also, don't forget about Garond's squad. His people also need food.
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_29 " );	// True, while the orcs are besieging the castle in the Valley of Mines, it is not possible to deliver food to them.
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_30 " );	// But soon we will fix this situation... (terribly)
	};

	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFood_01_32 " );	// And how do I get accurate food information?
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_34 " );	// I think we can do something like this...
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_35 " );	// I'll send a man to Fort Azgan to see Commander Varus.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_36 " );	// He'll prepare a list of all the supplies he and his people need.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_37 " );	// And I, in turn, will prepare the same list of necessary provisions, but only for those paladins under my command.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_38 " );	// I think this will give a fairly accurate picture of the volumes of food that our entire expedition needs.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_41 " );	// However, I can't send any of my people to Varus.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_01_43 " );	// Therefore, it seems to me that the most suitable candidate for the role of such a messenger is you.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_44");	//Согласен?
	Info_ClearChoices(dia_lord_hagen_paladinfood);
	Info_AddChoice(dia_lord_hagen_paladinfood, " No! Send someone else. " ,dia_lord_hagen_paladinfood_no);
	Info_AddChoice(dia_lord_hagen_paladinfood, " Okay, I agree. " ,dia_lord_hagen_paladinfood_ok);
};

func void dia_lord_hagen_paladinfood_no()
{
	HAGENFUCKTOVARUS = TRUE;
	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFood_No_01_00 " );	// No! Send someone else.

	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_No_01_01 " );	// Consider this an order, soldier!
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_No_01_02 " );	// And orders are not discussed... (terribly) They are carried out!
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_No_01_03 " );	// (angrily) But I explained to you that I can't send anyone there!
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_No_01_04 " );	// And besides, the paladins did your guild a great honor for agreeing to these supplies.
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_No_01_06 " );	// And let's leave these unnecessary disputes to anyone!
	};
};

func void dia_lord_hagen_paladinfood_ok()
{
	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFood_Ok_01_00 " );	// Okay, I agree.

	if(HAGENFUCKTOVARUS == TRUE)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_Ok_01_01 " );	// (angrily) That's better.
	}
	else
	{
		B_GivePlayerXP(150);
		AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_Ok_01_02 " );	// I didn't expect another answer from you.
	};

	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_Ok_01_03 " );	// Now go to Varus. And I, during your absence, will prepare my list.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_Ok_01_04 " );	// After you get back from Azgan, come and pick him up.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_Ok_01_09 " );	// Here, take this order - when they see it, the guards will let you into the fort.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFood_Ok_01_10 " );	// Now you can go.
	B_GiveInvItems(self,other,itwr_hagenorderfort, 1 );
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_Ok_01_11");	//Хорошо.
	HAGENSENTOVARUS = TRUE ;
	B_LogEntry(TOPIC_PALADINFOOD,"After talking with Lord Hagen, I learned that the paladins stationed in Khorinis were not the entire corps of the expedition that arrived on the island. Most of them, under the command of Lord Varus, went to Fort Azgan, located on one of the islets nearby Khorinis. They are also supposed to arrange food supplies, and in order to give their exact volumes, Lord Hagen decided to send me to the fort to Varus, so that in turn he would draw up a list of provisions needed for his people. paladins.");
	Log_AddEntry( TOPIC_PALADINFOOD , "The only way to get into the fort is through an underground passage, the entrance to which is located here on the island - to the east of the city itself. Lord Hagen gave me an order that will allow me to pass the guards of the passage. " );
	Info_ClearChoices(dia_lord_hagen_paladinfood);
};


instance DIA_LORD_HAGEN_PALADINFOODDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_paladinfooddone_condition;
	information = dia_lord_hagen_paladinfooddone_info;
	permanent = FALSE;
	description = " I have a list from Varus. " ;
};


func int dia_lord_hagen_paladinfooddone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (VARUSSENTTOHAGEN == TRUE) && (Npc_HasItems(hero,itwr_varuscontent) >= 1))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_paladinfooddone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lord_Hagen_PaladinFoodDone_01_00 " );	// I have a list from Varus.
	B_GiveInvItems(other,self,itwr_varuscontent,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_03 " );	// Hmmm... very interesting...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_04 " );	// Great! Everything is clear to me.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_06 " );	// While you were away, I prepared a list of necessary food for my people.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_07 " );	// Now we'll just concatenate both of these lists.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_08 " );	// I think this will give an accurate idea of ​​the required volumes of food supply.
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_09 " );	// Wait a minute...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_10 " );	// Done! Here, take this updated list and take it to Luthero.
	B_GiveInvItems(self,other,itwr_hagencontent,1);
	AI_Output(self,other, " DIA_Lord_Hagen_PaladinFoodDone_01_11 " );	// It contains everything we need.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFoodDone_01_12");	//Хорошо.
	B_LogEntry( TOPIC_PALADINFOOD , " I brought Lord Hagen a list of provisions compiled by Lord Varus. After reviewing it, the head of the paladins supplemented this list with what is needed directly for the paladins in the city and gave it to me. It's time to go to Luthero. " );
};


instance DIA_LORD_HAGEN_KAP6_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = dia_lord_hagen_kap6_exit_condition;
	information = dia_lord_hagen_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lord_hagen_kap6_exit_condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_BEFOREBATTLE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_beforebattle_condition;
	information = dia_lord_hagen_beforebattle_info;
	permanent = TRUE;
	description = " How are things? " ;
};

func int dia_lord_hagen_beforebattle_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_beforebattle_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_BeforeBattle_01_00 " );	// How are things?

	if((STOPBIGBATTLE == TRUE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		if(ORCSWINSBB == TRUE)
		{
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_01 " );	// Isn't that clear? (doomedly) Worse even in a nightmare you can imagine!
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_02 " );	// We have suffered a crushing defeat in this battle, and now nothing will prevent the orcs from reigning supreme on this island.
			AI_Output(other,self, " DIA_Lord_Hagen_BeforeBattle_01_04 " );	// But all is not lost! We need to keep fighting.
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_05 " );	// Eh, boy, it would be someone... (sadly) There is practically no one left on this island who could challenge these creatures.
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_06 " );	// Maybe that's all you can do.
		}
		else
		{
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_08 " );	// Now that the huge orc army has been destroyed, we can breathe a lot more easily.
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_09 " );	// Of course, in this battle, we suffered simply horrendous losses... (gloomy) But, apparently, it was simply impossible to do otherwise.
			AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_10 " );	// In the end, we still won. And now this is the main thing!
		};
	}
	else if(MOVEFORCESCOMPLETE_02 == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_11");	//Хорошо.
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_14 " );	// No changes yet. However, we are still trying to understand how the orcs are going to proceed in order to develop their own plan of action in this case.
		AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_15 " );	// They might want to flank us or flank us. But I guess they just don't have the brains for that.
		AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_16 " );	// So it's more likely that they'll just decide to hit the center, hoping they'll outnumber them!
		AI_Output(self,other, " DIA_Lord_Hagen_BeforeBattle_01_17 " );	// But it's unlikely to help them.
	};
};

instance DIA_LORD_HAGEN_WHOCOMMAND(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_whocommand_condition;
	information = dia_lord_hagen_whocommand_info;
	permanent = FALSE;
	description = " Are you in command here now? " ;
};


func int dia_lord_hagen_whocommand_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whocommand_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_WhoCommand_01_00 " );	// Are you in command here now?
	AI_Output(self,other, " DIA_Lord_Hagen_WhoCommand_01_01 " );	// No, not me... (seriously) By common decision of the majority, the command of our entire army was transferred to the competence of General Li.
	AI_Output(other,self, " DIA_Lord_Hagen_WhoCommand_01_04 " );	// And what will your people say to this?
	AI_Output(self,other, " DIA_Lord_Hagen_WhoCommand_01_05 " );	// Nothing. Because I have full confidence in Lee. And that's enough for them.
};

instance DIA_LORD_HAGEN_NewsKillDead(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_NewsKillDead_condition;
	information = dia_lord_hagen_NewsKillDead_info;
	permanent = FALSE;
	description = " Any more news? " ;
};

func int dia_lord_hagen_NewsKillDead_condition()
{
	if (( MOVEFORCESCOMPLETE_01  ==  TRUE ) && (Npc_KnowsInfo(other,DIA_Lord_Hagen_WhoCommand) ==  TRUE ) && (NewsKillDead ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_NewsKillDead_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Lord_Hagen_NewsKillDead_01_00 " );	// Any more news?
	AI_Output(self,other, " DIA_Lord_Hagen_NewsKillDead_01_01 " );	// There was some strange gang running around here not far from the farm.
	AI_Output(self,other, " DIA_Lord_Hagen_NewsKillDead_01_02 " );	// We can't afford to be threatened by bandits at such a difficult time.
	AI_Output(self,other, " DIA_Lord_Hagen_NewsKillDead_01_03 " );	// But my people have already dealt with that. Now all those bastards are dead!
};

instance DIA_LORD_HAGEN_LEECARE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_leecare_condition;
	information = dia_lord_hagen_leecare_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lord_hagen_leecare_condition()
{
	if((BIGBATTLEBACKPOSITION == TRUE) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_leecare_info()
{
	AI_Output(self,other, " DIA_Lord_Hagen_LeeCare_01_00 " );	// Damn! What?! What's up with Lee?
	AI_Output(other,self, " DIA_Lord_Hagen_LeeCare_01_01 " );	// It looks like the orcs hurt him badly in the fight. He urgently needs to go to the farm.
	AI_Output(self,other, " DIA_Lord_Hagen_LeeCare_01_02 " );	// Damned creatures! Only this was still not enough for us - after such a victory, to lose our commander.
	AI_Output(self,other, " DIA_Lord_Hagen_LeeCare_01_03 " );	// Okay, I'll personally take care of him! I will do everything in my power.
	AI_Output(self,other, " DIA_Lord_Hagen_LeeCare_01_04 " );	// I want to thank you for your help in this battle. She was simply invaluable.

	if(IAMKILLORCSBB >= 40)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Lord_Hagen_LeeCare_01_06 " );	// You killed more than a third of these creatures yourself!
		AI_Output(self,other, " DIA_Lord_Hagen_LeeCare_01_07 " );	// And I can tell you straight out: none of my paladins can do that!
	};
};

instance DIA_LORD_HAGEN_NEWORDERS(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_neworders_condition;
	information = dia_lord_hagen_neworders_info;
	permanent = FALSE;
	description = " What should we do next? " ;
};

func int dia_lord_hagen_neworders_condition()
{
	if (( BIGBATTLEBACKPOSITION  ==  TRUE ) && Npc_KnowsInfo(hero,dia_lord_hagen_leecare) && ( ALLGREATVICTORY  ==  FALSE ) && ( HERONOTJOINBIGBATTLE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_lord_hagen_neworders_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_NewOrders_01_01 " );	// What do we do next?
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_04 " );	// In this battle, our losses were too great... (grimly)
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_05 " );	// Therefore, I do not think that my remaining people will be enough to lift the siege from the monastery and liberate the city.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_23 " );	// I'll take the rest of my men back to the farm and set up defenses there.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_25 " );	// There is no way to lose it, because then we simply have nowhere to retreat.
	AI_Output(other,self, " DIA_Lord_Hagen_NewOrders_01_26 " );	// Then I'll take care of the remaining orc units.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_31 " );	// Okay, inject a little panic into their ranks.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_35 " );	// Of course, you could try to free the entire Khorinis.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_36 " );	// But I guess even you won't be able to do that.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_01_37 " );	// So just do what I told you earlier.
	b_againgatherallonbigfarm();
	MIS_KILLTHEMALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTHEMALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_Running);
	B_LogEntry( TOPIC_KILLTHEMALL , " Now that the huge orc army has been defeated, we need to decide what to do next. After speaking with Lord Hagen, who has assumed command, I was able to find out his future plans. Apparently, he plans to withdraw the rest of his people to farm and retake the defense there. In his opinion, the orcs are still strong and, therefore, they can attack us at any moment. And if we lose the farm, we will lose our last line of defense. " );
	Log_AddEntry( TOPIC_KILLTHEMALL , " In turn, the head of the paladins asked me to take care of the orcs themselves in some way if possible. Of course, there is no talk of storming Khorinis yet, but we can do a little panic in their ranks. The more orcs I can kill so it will be better for all of us. " );
};


instance DIA_LORD_HAGEN_NEWORDERS_NF(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_neworders_NF_condition;
	information = dia_lord_hagen_neworders_NF_info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int dia_lord_hagen_neworders_NF_condition()
{
	if((BIGBATTLEBACKPOSITION == TRUE) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_neworders_NF_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_KAP3U4_PERM_15_00 " );	// How's the situation?
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_40 " );	// You probably already know that while you were gone, we had a major battle with the orcs.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_41 " );	// If not, you'll be interested to know that we've defeated these creatures!
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_04 " );	// However, in this battle, our losses were too great... (grimly)
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_05 " );	// Therefore, I do not think that my remaining people will be enough to lift the siege from the monastery and liberate the city.
	AI_Output(other,self, " DIA_Lord_Hagen_NewOrders_NF_01_26 " );	// Then I'll take care of the remaining orc units.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_31 " );	// Okay, inject a little panic into their ranks.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_35 " );	// Of course, you could try to free the entire Khorinis.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_36 " );	// But I guess even you won't be able to do that.
	AI_Output(self,other, " DIA_Lord_Hagen_NewOrders_NF_01_37 " );	// So just do what I told you earlier.
	b_againgatherallonbigfarm();
	MIS_KILLTHEMALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTHEMALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_Running);
	B_LogEntry( TOPIC_KILLTHEMALL , " Now that the huge orc army has been defeated, we need to decide what to do next. After talking with Lord Hagen, who has taken command, I was able to find out his future plans. Apparently, he plans to withdraw the rest of his people to farm and retake the defense there. In his opinion, the orcs are still strong and, therefore, they can attack us at any moment. And if we lose the farm, we will lose our last line of defense. " );
	Log_AddEntry( TOPIC_KILLTHEMALL , " In turn, the head of the paladins asked me to take care of the orcs themselves in some way if possible. Of course, there is no talk of storming Khorinis yet, but we can do a little panic in their ranks. The more orcs I can kill so it will be better for all of us. " );
};

instance DIA_LORD_HAGEN_NEEDHELP (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_needhelp_condition;
	information = dia_lord_hagen_needhelp_info;
	permanent = FALSE;
	description = " I need help! " ;
};

func int dia_lord_hagen_needhelp_condition()
{
	if((MIS_KILLTHEMALL == LOG_Running) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needhelp_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_NeedHelp_01_01 " );	// I need help!
	AI_Output(other,self, " DIA_Lord_Hagen_NeedHelp_01_02 " );	// It will be quite difficult to fight with so many orcs alone.
	AI_Output(self,other, " DIA_Lord_Hagen_NeedHelp_01_03 " );	// (seriously) I don't have many people. Every person counts now.
	AI_Output(self,other, " DIA_Lord_Hagen_NeedHelp_01_04 " );	// But you can take a few volunteers to help you, who will not refuse to help you with this.
	HAGENGIVEHELP = TRUE ;
	B_LogEntry( TOPIC_KILLTHEMALL , " I guess it won't be easy to fight alone against so many orcs. I can take a few volunteers with me to help me with this. " );
};


instance DIA_LORD_HAGEN_RUNEMAGICNOTWORK(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_runemagicnotwork_condition;
	information = dia_lord_hagen_runemagicnotwork_info;
	permanent = FALSE;
	description = " What's wrong with your magic? " ;
};


func int dia_lord_hagen_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (PALADINRUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lord_Hagen_RuneMagicNotWork_01_00 " );	// What's up with your magic?
	AI_Output(self,other, " DIA_Lord_Hagen_RuneMagicNotWork_01_01 " );	// It stopped working! Crap...
	AI_Output(self,other, " DIA_Lord_Hagen_RuneMagicNotWork_01_02 " );	// Now all our magic runes have turned into pathetic pieces of worthless stone!
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " Paladins can no longer use their magic runes either. " );
	PALADINRUNESNOT = TRUE;
};


instance DIA_LORD_HAGEN_KILLTHEMALLDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_killthemalldone_condition;
	information = dia_lord_hagen_killthemalldone_info;
	permanent = FALSE;
	description = " About the orcs... " ;
};


func int dia_lord_hagen_killthemalldone_condition()
{
	if((MIS_KILLTHEMALL == LOG_SUCCESS) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_killthemalldone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Lord_Hagen_KillThemAllDone_01_00 " );	// About orcs...
	AI_Output(self,other, " DIA_Lord_Hagen_KillThemAllDone_01_01 " );	// Yes? Do you have something to report?
	AI_Output(other,self, " DIA_Lord_Hagen_KillThemAllDone_01_02 " );	// I think I've killed enough of these creatures to create panic in their ranks.
	AI_Output(self,other, " DIA_Lord_Hagen_KillThemAllDone_01_03 " );	// Excellent! This is just great news.
	AI_Output(self,other, " DIA_Lord_Hagen_KillThemAllDone_01_04 " );	// Now, I guess the orcs won't bother us. At least in the near future.
	AI_Output(self,other, " DIA_Lord_Hagen_KillThemAllDone_01_05 " );	// So please accept my heartfelt thanks for this.
};


instance DIA_LORD_HAGEN_BACKTOHOME (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_backtohome_condition;
	information = dia_lord_hagen_backtohome_info;
	permanent = FALSE;
	description = " Rune magic destroyed! " ;
};


func int dia_lord_hagen_backtohome_condition()
{
	if(MIS_RUNEMAGICNOTWORK == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backtohome_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Lord_Hagen_BackToHome_01_00 " );	// Rune magic destroyed!
	AI_Output(self,other, " DIA_Lord_Hagen_BackToHome_01_01 " );	// WHAT? Are you out of your mind? What does it mean?!
	AI_Output(other,self, " DIA_Lord_Hagen_BackToHome_01_02 " );	// Don't get excited. Pirokar himself asked me to convey this news to you.
	AI_Output(self,other, " DIA_Lord_Hagen_BackToHome_01_04 " );	// But... but how? O merciful Innos! Did he really say so?
	AI_Output(self,other, " DIA_Lord_Hagen_BackToHome_01_06 " );	// Then, in that case, we're all in serious trouble!
	AI_Output(self,other, " DIA_Lord_Hagen_BackToHome_01_10 " );	// As long as we had rune magic and magic ore, the paladins of the king had a chance to hold back the hordes of orcs that flooded all the surroundings of Myrtana.
	AI_Output(self,other, " DIA_Lord_Hagen_BackToHome_01_11 " );	// But now that the ore has completely dried up, and our magic runes have lost their power, nothing will stop these creatures!
	AI_Output(self,other, " DIA_Lord_Hagen_BackToHome_01_12 " );	// The outcome of this war is practically a foregone conclusion, and it is far from in our favor.
};


instance DIA_LORD_HAGEN_WHYORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_whyore_condition;
	information = dia_lord_hagen_whyore_info;
	permanent = FALSE;
	description = " Why is ore so important in this war? " ;
};


func int dia_lord_hagen_whyore_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_backtohome))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whyore_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_WhyOre_01_00 " );	// Why is ore so important in this war?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_01 " );	// (surprised) As a king's paladin, you should know this for yourself!
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_02 " );	// (maliciously) If you were a paladin, you yourself would know about it!
	};
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_06 " );	// Its main advantage lies not in this, but in the very magic that it contains!
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_07 " );	// Weapons from it are capable of penetrating the most durable armor.
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_09 " );	// Well, besides, only an ore blade can be given a consecration ceremony.
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_10 " );	// Innos himself puts a particle of his divine power into it and makes it a truly deadly weapon!
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_11 " );	// Of course, you have to be a paladin first to do this, otherwise you just won't be able to handle the power of this blade.
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_12 " );	// That's why magic ore is so important to us in this war.
	AI_Output(self,other, " DIA_Lord_Hagen_WhyOre_01_13 " );	// And without it, we will never stop the orcs, who have an overwhelming numerical advantage over the army of the king.
};


instance DIA_PAL_200_HAGEN_HIDDENORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_pal_200_hagen_hiddenore_condition;
	information = dia_pal_200_hagen_hiddenore_info;
	permanent = FALSE;
	description = " I have a very important message for you! " ;
};


func int dia_pal_200_hagen_hiddenore_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_lord_hagen_backtohome ) && ( Npc_HasItems ( hero , itmi_seamaplosticland ) >=  1 ) && ( HAGENTAKESMAPSORE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_pal_200_hagen_hiddenore_info()
{
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_00 " );	// I have a very important message for you!
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_01 " );	// Yes? And what is it?
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_03 " );	// When we were at sea, we accidentally stumbled upon an uninhabited island, filled to the brim with deposits of magical ore.
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_04 " );	// So I figured it might be interesting for paladins to know about this.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_05 " );	// What? Are you serious? But this simply cannot be!
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_06 " );	// Trust me, it is. The magic ore we found was one of the reasons why we returned back.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_07 " );	// Incredible! I couldn't even imagine that this was possible.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_08 " );	// If everything you're saying is true, then that's the best news I've ever heard!
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_09 " );	// And lately they have become too rare.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_12 " );	// How far is this island from here?
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_13 " );	// Just a few days' sail from Khorinis! Here, take a look for yourself.
	B_GiveInvItems(other,self,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_14");	//Что это?
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_15 " );	// This is a sea chart. My captain made a couple of marks on it and plotted an accurate course.
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_16 " );	// So finding this island won't be too hard for you now.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_17 " );	// Hmmm... (looking closely) Yes, very interesting.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_18 " );	// Judging by this map, the piece of land you found is located in a part of the ocean that we have not yet explored. How did you get there?
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_01_19 " );	// On the way we got into a very strong storm. He led us to this island.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_20 " );	// Yeah... Indeed, they say that the ways of Innos are inscrutable!
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_21 " );	// I'm sure that it certainly could not have happened without his will.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_23 " );	// Well then... Then, on behalf of our entire order, please accept my sincere thanks!
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_01_24 " );	// Let's hope that the ore you found can still help the king in the war against the orcs.
	HAGENTAKESMAPSORE = TRUE;
	if(LIGOFORGOLD == TRUE)
	{
		Info_ClearChoices(dia_pal_200_hagen_hiddenore);
		Info_AddChoice(dia_pal_200_hagen_hiddenore, " Not so fast, paladin! " ,dia_pal_200_hagen_hiddenore_gold);
	}
	else if(LIGOFORUNKNOWN == TRUE)
	{
		Info_ClearChoices(dia_pal_200_hagen_hiddenore);
		Info_AddChoice(dia_pal_200_hagen_hiddenore, " Not so fast, paladin! " ,dia_pal_200_hagen_hiddenore_gold);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Само собой.",dia_pal_200_hagen_hiddenore_nothing);
	}
	else if(LIGOFORFREE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_25");	//Само собой.
	};
};

func void dia_pal_200_hagen_hiddenore_gold()
{
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_01 " );	// Not so fast, paladin! I'm afraid your gratitude alone won't be enough.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_02 " );	// (surprised) So? What do you mean by this?
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_03 " );	// Each information is always worth something. What's more, it's so valuable.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_06 " );	// Oh, yes... (arrogantly) Of course! It would be strange if you didn't talk to me about it.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_07 " );	// Although, to tell the truth, I did not expect such words from a paladin!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_08 " );	// Although, to be honest, I didn't expect such words from a venerable Fire Mage!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_09 " );	// Although, to tell the truth, I did not expect such words from the venerable Waterbender!
	};
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_10 " );	// Let's leave the details. Better tell me how much will you pay me?
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_11 " );	// Hmmm... (thoughtfully) Well, let's say ten thousand gold coins. Will that suit you?
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_12 " );	// Quite. Hope I didn't go cheap.
	AI_Output(self,other, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_13 " );	// You decide! Here, take your money.
	B_GiveInvItems(self,other,ItMi_Gold,10000);
	AI_Output(other,self, " DIA_PAL_200_Hagen_HiddenOre_Gold_01_14 " );	// It's a pleasure doing business with you.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_15");	//Хммм...(недовольно)
	Info_ClearChoices(dia_pal_200_hagen_hiddenore);
};

func void dia_pal_200_hagen_hiddenore_nothing()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Nothing_01_01");	//Само собой.
	Info_ClearChoices(dia_pal_200_hagen_hiddenore);
};


instance DIA_LORD_HAGEN_OREONMAP(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_oreonmap_condition;
	information = dia_lord_hagen_oreonmap_info;
	permanent = FALSE;
	description = " That card I gave you... " ;
};


func int dia_lord_hagen_oreonmap_condition()
{
	if((HAGENTAKESMAPSORE == TRUE) && Npc_KnowsInfo(hero,dia_lord_hagen_backtohome))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_oreonmap_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMap_01_00 " );	// That card I gave you...
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMap_01_01 " );	// An island with huge deposits of magical ore was marked on it.
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMap_01_02 " );	// Or maybe you forgot about it?
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_03 " );	// Oh yeah, your map... (thoughtfully) No, I remember it.
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMap_01_04 " );	// Then what are you waiting for?
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMap_01_05 " );	// Take advantage of this and the paladins will once again have a chance to resist the orcs.
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_07 " );	// In my situation, it's just a piece of paper and nothing more.
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_08 " );	// (seriously) The king needs this card! So that he sends his new expedition there and arranges supplies with ore.
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMap_01_09 " );	// Then you need to tell him as soon as possible!
	MIS_SALETOBIGLAND = LOG_Running;
	Log_CreateTopic(TOPIC_SALETOBIGLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_Running);
	if ( FREEDOM  ==  TRUE )
	{
		AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_11 " );	// I can't leave this island until I'm completely sure that the threat from the orcs is completely over!
		AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_14 " );	// I'll have to take care of the restoration of the city, not to mention its defense.
		JACKETBIGLAND = TRUE ;
		B_LogEntry( TOPIC_SALETOBIGLAND , " Now that the paladins have no more rune magic left, their only hope in the war against the orcs is magic ore. I suggested that Lord Hagen sail to the mainland to inform the king about the ore we found on a desert island as soon as possible But Lord Hagen does not intend to leave the island and will defend the city until the situation with the orcs is cleared up to the end. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_16 " );	// And how to do it?
		AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_17 " );	// The only ship that can sail there is currently in a city filled to the brim with orcs.
		AI_Output(self,other, " DIA_Lord_Hagen_OreOnMap_01_18 " );	// So first you need to free Khorinis himself, and only then think about what to do next.
		B_LogEntry( TOPIC_SALETOBIGLAND , " Now that the paladins have no more rune magic left, their only hope in the war against the orcs is magic ore. I suggested that Lord Hagen sail to the mainland to inform the king about the ore we found on a desert island as soon as possible .But as long as the orcs control the city, it will be almost impossible to do this. " );
	};
};


instance DIA_LORD_HAGEN_CANSTURMTOWN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansturmtown_condition;
	information = dia_lord_hagen_cansturmtown_info;
	permanent = FALSE;
	description = " I will free the city from the orcs. " ;
};


func int dia_lord_hagen_cansturmtown_condition()
{
	if (( HORINISISFREE  ==  FALSE ) && Npc_KnowsInfo(hero,dia_lord_hagen_oreonmap))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cansturmtown_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_CanSturmTown_01_00 " );	// I will free the city from the orcs.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTown_01_01 " );	// WHAT? And you think you can handle it?
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTown_01_03 " );	// Hmmm...(skeptically) Well, if so, then go for it! However, you can not count on my help in this matter.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTown_01_06 " );	// I'll still need my people to defend this farm from the orcs.
	MIS_HORINISFREE = LOG_Running;
	Log_CreateTopic(TOPIC_HORINISFREE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HORINISFREE,LOG_Running);
	B_LogEntry( TOPIC_HORINISFREE , " I told Lord Hagen that I was going to free Khorinis from the orcs. And, apparently, he took this idea as nothing more than madness on my part. Well, let's see who is right. " );
};


instance DIA_LORD_HAGEN_CANSTURMTOWNDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansturmtowndone_condition;
	information = dia_lord_hagen_cansturmtowndone_info;
	permanent = FALSE;
	description = " The city is freed! " ;
};


func int dia_lord_hagen_cansturmtowndone_condition()
{
	if (( HORINISISFREE  ==  TRUE ) && ( ALLGREATVICTORY  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cansturmtowndone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lord_Hagen_CanSturmTownDone_01_00 " );	// The city is liberated!
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTownDone_01_03 " );	// Incredible! I just can't believe it!
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTownDone_01_05 " );	// (respectfully) Well, in that case, the situation has changed for the better for us.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTownDone_01_06 " );	// As long as the city remained in the clutches of the orcs, we did not have the opportunity to dictate our terms to them in this war.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTownDone_01_07 " );	// But now, thanks to you, the initiative has passed into our hands. A little more - and there will be no trace of the orcs here.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSturmTownDone_01_08 " );	// So please accept my sincere thanks for everything you've done for us!
};


instance DIA_LORD_HAGEN_ALLGREATVICTORY(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_allgreatvictory_condition;
	information = dia_lord_hagen_allgreatvictory_info;
	permanent = FALSE;
	description = " Orcs are no longer a threat! " ;
};


func int dia_lord_hagen_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_allgreatvictory_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lord_Hagen_AllGreatVictory_01_00 " );	// Orcs are no longer a threat!
	AI_Output(other,self, " DIA_Lord_Hagen_AllGreatVictory_01_02 " );	// I managed to destroy all their units in this part of the island.
	AI_Output(other,self, " DIA_Lord_Hagen_AllGreatVictory_01_03 " );	// And those that remain do not pose a significant threat.
	AI_Output(self,other, " DIA_Lord_Hagen_AllGreatVictory_01_04 " );	// Excellent! So, the final victory is still ours. At least here.
	AI_Output(self,other, " DIA_Lord_Hagen_AllGreatVictory_01_06 " );	// Well, in that case, now it only remains to consolidate this success and prevent the orcs from recovering from the blow they received.
	AI_Output(self,other, " DIA_Lord_Hagen_AllGreatVictory_01_09 " );	// Now we need to organize our defensive fortifications at the exit from the Valley of Mines.
	AI_Output(self,other, " DIA_Lord_Hagen_AllGreatVictory_01_10 " );	// Apparently, it will remain under the control of the orcs for the time being. At least for an indefinite time.
	AI_Output(self,other, " DIA_Lord_Hagen_AllGreatVictory_01_11 " );	// And we, in turn, will have to take care of protecting this part of the island.
	AI_Output(other,self, " DIA_Lord_Hagen_AllGreatVictory_01_12 " );	// Got it. I am sure that you will succeed.
	AI_Output(self,other, " DIA_Lord_Hagen_AllGreatVictory_01_13 " );	// You can be sure of that.
	b_allgohome();
};


instance DIA_LORD_HAGEN_OREONMAPDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_oreonmapdone_condition;
	information = dia_lord_hagen_oreonmapdone_info;
	permanent = FALSE;
	description = " Now you have a ship again! " ;
};


func int dia_lord_hagen_oreonmapdone_condition()
{
	if (( HORINISSISFREE  ==  TRUE ) && ( CANSALETOBIGLAND  ==  FALSE ) && ( MIS_SALETOBIGLAND  == LOG_Running ))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_oreonmapdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMapDone_01_00 " );	// Now you have a ship again.
	AI_Output(other,self, " DIA_Lord_Hagen_OreOnMapDone_01_01 " );	// And you can sail to the mainland to tell the king about the ore.
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMapDone_01_02 " );	// Sorry, but I can't leave this island until I'm completely sure that the threat from the orcs is completely over!
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMapDone_01_04 " );	// There are still plenty of these creatures in the Valley of Mines! And only Innos himself knows how this situation will develop in the future.
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMapDone_01_05 " );	// In addition, someone will have to take care of the restoration of the city, not to mention its protection.
	AI_Output(self,other, " DIA_Lord_Hagen_OreOnMapDone_01_06 " );	// So, as you can see, I don't have anyone to send to the king right now.
	; _ _ _ _ _ _
	JACKETBIGLAND = TRUE ;
};


instance DIA_LORD_HAGEN_CANSALETOBIGLAND (C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansaletobigland_condition;
	information = dia_lord_hagen_cansaletobigland_info;
	permanent = FALSE;
	description = " I can deliver a message to the king. " ;
};


func int dia_lord_hagen_cansaletobigland_condition()
{
	if((MIS_SALETOBIGLAND == LOG_Running) && (CANSALETOBIGLAND == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cansaletobigland_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_CanSaleToBigLand_01_00 " );	// I can deliver a message to the king.
	AI_Output(other,self, " DIA_Lord_Hagen_CanSaleToBigLand_01_01 " );	// Unless, of course, you trust me with your ship.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_02 " );	// Hmmm...(snidely) To tell the truth, it's very strange for me to hear such words from you.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_03 " );	// I remember that last time you absolutely did not ask my permission, but simply took it and stole it from me.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_06 " );	// However, in all seriousness, I could actually put the ship at your disposal for this purpose.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_07 " );	// Paladins on the mainland are in dire need of this ore, and it is my sacred duty to simply do my best to help my brothers in this war.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_08 " );	// (uncertainly) True, no one knows what the situation is there now.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_09 " );	// But we need to find out anyway.
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_10 " );	// So take my ship and go to the mainland immediately...(resolutely) And don't waste time, because every minute is precious to us now!
	AI_Output(self,other, " DIA_Lord_Hagen_CanSaleToBigLand_01_11 " );	// Give the king this card and tell him about the magic ore you found. Let's hope all is not lost!
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(other,self, " DIA_Lord_Hagen_CanSaleToBigLand_01_12 " );	// Good! Then I'm off.
	B_StartOtherRoutine(SLD_800_Lee,"Start");
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	LEERECOVERED = TRUE;
	SHIPAGAINACCESS = TRUE;
	B_LogEntry( TOPIC_SALETOBIGLAND , " I volunteered to help Lord Hagen deliver a message to the king. After some thought, he accepted my offer and put his ship at my disposal. Now I need to get back to the mainland as soon as possible! Perhaps our help to the paladins will arrive in time. " );
};


instance DIA_LORD_HAGEN_NEEDCAPITAN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_needcapitan_condition;
	information = dia_lord_hagen_needcapitan_info;
	permanent = FALSE;
	description = " I need a captain to steer this ship. " ;
};


func int dia_lord_hagen_needcapitan_condition()
{
	if((MIS_SALETOBIGLAND == LOG_Running) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needcapitan_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_NeedCapitan_01_00 " );	// I need a captain to steer this ship.
	if (( PIR_JOINHAGEN  ==  TRUE ) && ( Npc_IsDead( pir_13200_addon_greg ) ==  FALSE )) ;
	{
		AI_Output(self,other, " DIA_Lord_Hagen_NeedCapitan_01_01 " );	// Talk to Greg! It is he who is now acting as the captain of our ship.
		GROUP CAPITAL = TRUE ;
		B_LogEntry( TOPIC_SALETOBIGLAND , " When I asked about the captain, Lord Hagen advised me to contact Greg. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Lord_Hagen_NeedCapitan_01_05 " );	// I'm afraid I can't help you, unfortunately...(seriously) My ship doesn't have a captain right now.
		AI_Output(self,other, " DIA_Lord_Hagen_NeedCapitan_01_07 " );	// Until recently, this duty was performed by the paladin Lothar. But, as you probably already know, he was vilely murdered.
		AI_Output(self,other, " DIA_Lord_Hagen_NeedCapitan_01_08 " );	// I don't have another person who could control the ship yet.
		AI_Output(other,self, " DIA_Lord_Hagen_NeedCapitan_01_09 " );	// Hmm... understandable. We'll have to find another captain.
	};
};

instance DIA_Lord_Hagen_Kill_Done_Rings(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Kill_Done_Rings_condition;
	information = DIA_Lord_Hagen_Kill_Done_Rings_info;
	permanent = FALSE;
	description = " I have paladin rings with me. " ;
};

func int DIA_Lord_Hagen_Kill_Done_Rings_condition()
{
	if(Npc_HasItems(hero,itri_quest_pal_ring) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Kill_Done_Rings_info()
{
	var int RingSum;
	var int RingSumXP;
	var int RingSumGold;

	AI_Output(other,self, " DIA_Lord_Hagen_Kill_Done_Rings_01_01 " );	// I have paladin rings with me.
	AI_Output(self,other, " DIA_Lord_Hagen_Kill_Done_Rings_01_03 " );	// (terribly) Where did you get them from? Are you killing my people?!
	AI_Output(other,self, " DIA_Lord_Hagen_Kill_Done_Rings_01_04 " );	// No, what are you! I just found them on the bodies of your fallen comrades.
	AI_Output(other,self, " DIA_Lord_Hagen_Kill_Done_Rings_01_05 " );	// And I decided that it would be better for you to have them than for the orcs.
	AI_Output(self,other, " DIA_Lord_Hagen_Kill_Done_Rings_01_06 " );	// You did the right thing bringing them to me.
	AI_Output(self,other, " DIA_Lord_Hagen_Kill_Done_Rings_01_07 " );	// This is the memory of those who gave their lives in the service of Innos and the king!
	AI_Output(self,other, " DIA_Lord_Hagen_Kill_Done_Rings_01_09 " );	// Give me all of them! And I'll know how much I'll have to stab those green-skinned creatures to avenge my comrades.
	AI_Output(other,self, " DIA_Lord_Hagen_Kill_Done_Rings_01_10 " );	// Here, take this.

	RingSum = Npc_HasItems(hero,itri_quest_pal_ring);
	B_GiveInvItems(other,self,itri_quest_pal_ring,RingSum);
	RingSumXP = RingSum *  250 ;
	B_GivePlayerXP(RingSumXP);

	AI_Output(self,other, " DIA_Lord_Hagen_Kill_Done_Rings_01_11 " );	// Thank you! However, I don't want to see anything like this again.
	AI_Output(other,self, " DIA_Lord_Hagen_Kill_Done_Rings_01_12 " );	// I understand you.
};

var int Hagen_PAL_ARMOR_permanent;

instance DIA_Hagen_PAL_ARMOR(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 8;
	condition = DIA_Hagen_PAL_ARMOR_Condition;
	information = DIA_Hagen_PAL_ARMOR_Info;
	permanent = TRUE;
	description = " Buy a paladin armor. (Price: 15000 coins) " ;
};

func int DIA_Hagen_PAL_ARMOR_Condition()
{
	if ((Hagen_PAL_ARMOR_permanent ==  FALSE ) && (hero.guild ==  GIL_PAL ) && (Chapter >=  4 ))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PAL_ARMOR_Info()
{
	AI_Output(other,self, " DIA_Hagen_PAL_ARMOR_01_00 " );	// Sell me the paladin's armor.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		AI_Output(self,other, " DIA_Hagen_PAL_ARMOR_01_01 " );	// Good! Now they are yours.
		AI_Output(self,other, " DIA_Hagen_PAL_ARMOR_01_02 " );	// Wear them with pride, for not everyone is honored with such an honor.
		CreateInvItems(self,itar_pal_h,1);
		B_GiveInvItems(self,other,itar_pal_h,1);
		Hagen_PAL_ARMOR_permanent = TRUE;
		SHOW_ITAR_PAL_H = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Hagen_PAL_ARMOR_01_03 " );	// You don't have enough gold.
	};
};

var int Hagen_PAL_HELM_permanent;

instance DIA_Hagen_PAL_HELM(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 8;
	condition = DIA_Hagen_PAL_HELM_Condition;
	information = DIA_Hagen_PAL_HELM_Info;
	permanent = TRUE;
	description = " Buy a paladin helmet. (Price: 5000 coins) " ;
};

func int DIA_Hagen_PAL_HELM_Condition()
{
	if ((Hagen_PAL_HELM_permanent ==  FALSE ) && (hero.guild ==  GIL_PAL ) && (Chapter >=  4 ))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PAL_HELM_Info()
{
	AI_Output(other,self, " DIA_Hagen_PAL_HELM_01_00 " );	// Sell me the paladin's helmet.
	Info_ClearChoices(DIA_Hagen_PAL_HELM);
	Info_AddChoice(DIA_Hagen_PAL_HELM, " ...with open visor. " ,DIA_Hagen_PAL_HELM_OPEN);
	Info_AddChoice(DIA_Hagen_PAL_HELM, " ...with closed visor. " ,DIA_Hagen_PAL_HELM_CLOSED);
};

func void DIA_Hagen_PAL_HELM_OPEN()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		Npc_RemoveInvItems(self,ItMi_Gold,5000);
		AI_Output(self,other, " DIA_Hagen_PAL_HELM_01_01 " );	// Good! Here you are.
		AI_Output(self,other, " DIA_Hagen_PAL_HELM_01_02 " );	// It will reliably protect you from battle.
		CreateInvItems(self,itar_pal_helm_open,1);
		B_GiveInvItems(self,other,itar_pal_helm_open,1);
		Hagen_PAL_HELM_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Hagen_PAL_HELM_01_03 " );	// You don't have enough gold.
	};

	Info_ClearChoices(DIA_Hagen_PAL_HELM);
};

func void DIA_Hagen_PAL_HELM_CLOSED()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		Npc_RemoveInvItems(self,ItMi_Gold,5000);
		AI_Output(self,other, " DIA_Hagen_PAL_HELM_01_01 " );	// Good! Here you are.
		AI_Output(self,other, " DIA_Hagen_PAL_HELM_01_02 " );	// It will reliably protect you from battle.
		CreateInvItems(self,itar_pal_helm,1);
		B_GiveInvItems(self,other,itar_pal_helm,1);
		Hagen_PAL_HELM_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Hagen_PAL_HELM_01_03 " );	// You don't have enough gold.
	};

	Info_ClearChoices(DIA_Hagen_PAL_HELM);
};

// ------------------------------------------------ --Dark Warrant------------------------------------------

instance DIA_Lord_Hagen_DarkOrden(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_condition;
	information = DIA_Lord_Hagen_DarkOrden_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lord_Hagen_DarkOrden_condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_info()
{
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_01 " );	// Good to have you here!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_02 " );	// What happened?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_03 " );	// (surprised) Like what? Don't you know anything yet?
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_04 " );	// I have no idea.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_05 " );	// All of Khorinis is teeming with the undead! Not a day goes by that we don't repel her attacks!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_06 " );	// Where did she come from?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_07 " );	// I don't know about this. Otherwise, I would have sent my people to find out long ago.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_08 " );	// But then there will be no one to protect this city!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_09 " );	// Okay. And why am I here?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_10 " );	// It was you who killed all the dragons in the Valley of Mines.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_11 " );	// So maybe all this is the consequences of your actions!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_12 " );	// Are you telling me I shouldn't have killed those creatures?
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_13 " );	// Should I have let them burn this city to the ground, along with the surrounding farms?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_14 " );	// I didn't say that! We are all, of course, grateful to you for what you have done.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_15 " );	// But the threat from the undead is no less dangerous! That is why I am instructing you to deal with this problem.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_01_16 " );	// Since even dragons have proved to be your strength, I think you can handle this one too!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_01_17 " );	// I would like your confidence.
	MIS_DarkOrden = LOG_Running;
	Log_CreateTopic(TOPIC_DarkOrden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DarkOrden,LOG_Running);
	B_LogEntry(TOPIC_DarkOrden, " All of Khorinis is infested with the undead. Lord Hagen has tasked me with investigating the cause of this invasion. " );
};

instance DIA_Lord_Hagen_DarkOrden_WhatDo(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_WhatDo_condition;
	information = DIA_Lord_Hagen_DarkOrden_WhatDo_info;
	permanent = FALSE;
	description = " Where should I start? " ;
};

func int DIA_Lord_Hagen_DarkOrden_WhatDo_condition()
{
	if(MIS_DarkOrden == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_WhatDo_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_01 " );	// Where should I start?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_02 " );	// (thoughtfully) If I were you, I'd talk to Pyrocar first.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_03 " );	// Without a doubt, you are the person chosen by Innos himself!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_04 " );	// He gave you his power to destroy the dragons.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_05 " );	// But our current adversary, whoever he is, I guess is a bit... of a different kind.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_06 " );	// And I think you're going to need some wise advice to figure this all out.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_07 " );	// Then I'm going to the monastery right now.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_08 " );	// Okay, go ahead. Just keep me posted.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_WhatDo_01_09 " );	// And may Innos keep you...
	B_LogEntry(TOPIC_DarkOrden, " Lord Hagen advised me to speak to the Pyrocar about this. " );
	DO_SendToPyro = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkOrden_Ginnok(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_Ginnok_condition;
	information = DIA_Lord_Hagen_DarkOrden_Ginnok_info;
	permanent = FALSE;
	description = " How are things? " ;
};

func int DIA_Lord_Hagen_DarkOrden_Ginnok_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToHagen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_Ginnok_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_01 " );	// How are things?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_02 " );	// The situation got even worse. The undead are crawling in from all the cracks!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_03 " );	// I don't have enough men to defend the city anymore.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_04 " );	// I can't even send a messenger to Fort Azgan to get Lord Varus out with our main force.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_05 " );	// If you want, I can deliver this letter. But first, I would like to ask you something.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_06 " );	// About what exactly?
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_07 " );	// About those paladins that were buried here on the island.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_08 " );	// Ah, that's what you're talking about... (seriously) Pyrokar already wrote to me in a letter that you had to check their tombs.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_09 " );	// Well, I did. I checked all three tombs and took care of all the undead that I could find there.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_10 " );	// However, as you can see, her attacks only increased. This turned out to be not enough!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_11 " );	// What are you getting at?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_12 " );	// I didn't want to tell you about this, but apparently I didn't have a choice.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_13 " );	// What's the point?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_14 " );	// You see... This is a black spot in the history of the order. Therefore, we usually prefer not to remember this story.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_15 " );	// It turns out that I don't know everything?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_16 " );	// Yes, not all. It just so happened that there is another tomb on the island.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_17 " );	// And who is buried there?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_18 " );	// During his lifetime, this man's name was Konrad Ginnock. But many knew him by the nickname 'Mad Crusader'.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_19 " );	// He was once a mighty warrior and head of our order.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_20 " );	// It was he who led the campaign to one of the four temples of Beliar and completely destroyed it.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_21 " );	// However, after that incident, he changed a lot.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_22 " );	// I don't know what exactly happened there. And no one else is likely to know about it.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_23 " );	// But after he returned to Myrtana, his very name already terrified many people.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_24");	//Почему?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_25 " );	// The fact is that everyone whom Ginnok considered unworthy to be the servant of Innos, he simply killed!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_26 " );	// For the sake of his blind and fanatical faith, he did not spare anyone - neither women, nor the elderly, nor children.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_27 " );	// After all, he was so mad that he even raised his sword against the king!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_28 " );	// Therefore, Robar had no choice but to give the order for his execution.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_29 " );	// As a result, in secret from everyone, he was buried here, on this island.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_30 " );	// Away from the king and all those people who were so afraid of him!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_31 " );	// Yes, you told me a funny story.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_32 " );	// In my deep conviction, most likely, Ginnok was possessed by some kind of evil... (thoughtfully)
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_33 " );	// An evil we know nothing about, of course.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_34 " );	// But it's up to us to shed light on the whole story. Unless, of course, we want to save the lives of the people of this city!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_35 " );	// Are you implying that I'll have to go there?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_36 " );	// You got it right...(seriously) I have the key to that tomb now.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_37 " );	// As head of the paladin order, I am the only one entrusted with guarding it. But I give it to you.
	B_GiveInvItems(self,other,ItKe_Hagen_DarkOrder_Ginnok,1);
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_38 " );	// I only conjure you with Innos - do not hesitate! For perhaps every second is precious now.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_39 " );	// I understand you. Where is the tomb located?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_40 " );	// If you leave the western gate of the city and head south, you will soon see a small hollow among the rocks.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Ginnok_01_41 " );	// There must be a cave in which his tomb is located.
	B_LogEntry(TOPIC_DarkOrden, " That's the news! Lord Hagen concealed from everyone that there is another tomb of paladins on the island. A certain Konrad Ginnok is buried in it, who during his lifetime bore the nickname 'Mad Crusader'. Ginnok was an extremely cruel person, especially towards to those whom he considered unworthy of being a servant of Innos. As a result, he even tried to trample on the power of King Rhobar, for which he would be executed and buried here on the island. Hagen gave me the key to his tomb. I should visit there and check it for the presence of the undead and other evil. " );
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkOrden_Done(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_Done_condition;
	information = DIA_Lord_Hagen_DarkOrden_Done_info;
	permanent = FALSE;
	description = " I visited Ginnok's tomb. " ;
};

func int DIA_Lord_Hagen_DarkOrden_Done_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Ginnok == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Done_01_01 " );	// I visited Ginnok's tomb.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_02 " );	// And what did you find there?
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Done_01_03 " );	// You better not know! But there is no doubt: it was Ginnock who was behind all this.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_04 " );	// Good. At least now the city and its inhabitants are safe. And this is the most important thing.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_05 " );	// So accept gratitude from all of us and from me personally!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_06");	//Кммм...
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_07 " );	// (uncomprehending) Are you still waiting for something?
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Done_01_08 " );	// Well... didn't I even deserve some sort of award?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_09 " );	// (surprised) Didn't you just do it for the benefit of people? Your selfish thoughts make me doubt you!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkOrden_Done_01_10 " );	// Okay, forget about what I said...
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_11 " );	// And one more thing... (seriously) Vatras wanted to see you.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkOrden_Done_01_12 " );	// Looks like he had urgent business for you.
	HagenSendVat = TRUE ;
	MIS_DarkOrden = LOG_Success;
	Log_SetTopicStatus(TOPIC_DarkOrden,LOG_Success);
	) ; _ _ _
};

instance DIA_Lord_Hagen_NeedWorldMap(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_NeedWorldMap_condition;
	information = DIA_Lord_Hagen_NeedWorldMap_info;
	permanent = FALSE;
	description = " Who is the captain of the Esmeralda? " ;
};

func int DIA_Lord_Hagen_NeedWorldMap_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Brahim_NeedWorldMap) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_NeedWorldMap_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Lord_Hagen_NeedWorldMap_01_01 " );	// Who is the captain of the Esmeralda?
	AI_Output(self,other, " DIA_Lord_Hagen_NeedWorldMap_01_02 " );	// Strange question... Me, of course!
	AI_Output(other,self, " DIA_Lord_Hagen_NeedWorldMap_01_03 " );	// And you yourself are at the helm?
	AI_Output(self,other, " DIA_Lord_Hagen_NeedWorldMap_01_04 " );	// No. For this we have our own navigator.
	AI_Output(other,self, " DIA_Lord_Hagen_NeedWorldMap_01_05 " );	// And who is he?
	AI_Output(self,other, " DIA_Lord_Hagen_NeedWorldMap_01_06 " );	// His name is Ortho. But now he is with the rest of the paladins in Fort Azgan.
	AI_Output(self,other, " DIA_Lord_Hagen_NeedWorldMap_01_07 " );	// What exactly do you need from him?
	AI_Output(other,self, " DIA_Lord_Hagen_NeedWorldMap_01_08 " );	// Nothing. It just got interesting.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_09");	//Хммм...

	if(GRANTTOFORT == FALSE)
	{
		B_LogEntry(Topic_SylvioCrew, " The paladin navigator's name is Ortho. He might have the same card. However, he's in Fort Azgan, which I don't have access to. I'll have to come up with something else... " );
		Wld_InsertItem(ItWr_Seamap_Mirtana,"FP_ITEM_SHIP_SEAMAP");
	}
	else
	{
		B_LogEntry(Topic_SylvioCrew, " The name of the paladin navigator is Ortho. He may have the same card. He is currently with the rest of the paladins in Fort Azgan. " );
		GotoFortMap = TRUE;
	};

	AI_StopProcessInfos(self);
};


// -------------beginning of the story about the sign----------------- -------------------------------

instance DIA_LORD_HAGEN_KILLDMT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_killdmt_condition;
	information = dia_lord_hagen_killdmt_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lord_hagen_killdmt_condition()
{
	if((CanStartMyCamp == TRUE) && (MeetDarkRavenSpeaker == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_killdmt_info()
{
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_00 " );	// Stop! There is something else...
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_01 " );	// You couldn't help noticing that suspicious individuals in black robes appeared on the roads.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_02 " );	// People call them dark wanderers, and they probably worship Beliar.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_03 " );	// I've learned that the tower next to Onar's farm is their main camp.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_04 " );	// I don't think they have any dealings with the mercenaries, but still, this choice of location raises serious concerns.

	if(Npc_KnowsInfo(hero,DIA_Torlof_DEMENTOREN))
	{
		AI_Output(other,self, " DIA_Lord_Hagen_KILLDMT_15_01 " );	// Trust me, the mercenaries don't like it any more than you do.
		AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_05 " );	// This pleases. However, the problem remains.
	};

	AI_Output(other,self, " DIA_Lord_Hagen_KILLDMT_15_02 " );	// How does this all affect me?
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_06 " );	// I want you to deal with the squad in the tower before they can hurt us.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_07 " );	// This vile beliar spawn must not be allowed to roam quietly around Khorinis.
	AI_Output(other,self, " DIA_Lord_Hagen_KILLDMT_15_03 " );	// What? And how am I supposed to deal with all this alone?
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_08 " );	// Wait, don't boil. Yes, their squad is strong. Too strong for a frontal attack.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_09 " );	// Even if I send my best men there, which will certainly cause discontent among the mercenaries, they will simply die.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_04_10 " );	// Our only chance is to act covertly, and with your trip to the Valley of Mines, you proved that you have no equal in this matter.
	Info_ClearChoices(dia_lord_hagen_killdmt);
	Info_AddChoice(dia_lord_hagen_killdmt, " Okay, I'll see what I can do. " ,dia_lord_hagen_killdmt_yes);
	Info_AddChoice(dia_lord_hagen_killdmt, " No, it's too dangerous. I won't do it. " ,dia_lord_hagen_killdmt_no);
};

func void dia_lord_hagen_killdmt_yes()
{
	AI_Output(other,self, " DIA_Lord_Hagen_KILLDMT_Yes_15_00 " );	// Okay, I'll see what I can do.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_Yes_04_01 " );	// Thank you. You are our only hope in this matter.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_Yes_04_02 " );	// Now go and destroy this hotbed of evil! And may Innos be with you.
	MIS_HAGENKILLDMT = LOG_Running;
	Log_CreateTopic(TOPIC_HAGENKILLDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAGENKILLDMT,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_killdmt_no()
{
	AI_Output(other,self, " DIA_Lord_Hagen_KILLDMT_No_15_00 " );	// No, it's too dangerous. I won't take it on.
	AI_Output(self,other, " DIA_Lord_Hagen_KILLDMT_No_04_01 " );	// Too bad, but I was counting on you. In any case, I understand everything and do not hold grudges.
	AI_StopProcessInfos(self);
};

instance DIA_LORD_HAGEN_DMTAREDEAD(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_dmtaredead_condition;
	information = dia_lord_hagen_dmtaredead_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lord_hagen_dmtaredead_condition()
{
	if((MIS_HAGENKILLDMT == LOG_Running) && (CastlemineDMTIsDead == TRUE) && (CastlemineDMTMasterIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_dmtaredead_info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_00 " );	// You're back! What about my assignment? Did you manage to deal with the enemy?
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_15_01 " );	// I won't say it was easy, but all the dark wanderers in the tower are dead.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_02 " );	// Praise Innos! I knew that I could rely on you.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_03 " );	// Here, accept a small reward from me for your labors. You more than deserve it.
	B_LogEntry( TOPIC_HAGENKILLDMT , " I have dealt with the dark wanderers and reported back to Lord Hagen. " );
	MIS_HAGENKILLDMT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HAGENKILLDMT,LOG_SUCCESS);
	B_GiveInvItems(self,other,ItMi_Gold,1500);

	if((other.guild == GIL_KDM) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_GUR))
	{
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		if(other.attribute[ATR_STRENGTH] >= other.attribute[ATR_DEXTERITY])
		{
			B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		};
	};

	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_15_04 " );	// Thank you. Do you have any other tasks for me?
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_05 " );	// Hmmm, depending on what you mean by task. Tell me, how are things with housing?
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_15_07 " );	// With housing? I can't say it's wonderful.
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_15_08 " );	// However, I have somewhere to sleep at night. But why this question?
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_09 " );	// While you were gone, I realized that we need to do something with this tower.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_10 " );	// Bandits first, then minions of the dark god. Who is next - orcs? Or dragons?
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_11 " );	// Looks like she just attracts bad guests and the trouble that goes with them.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_12 " );	// I could send paladins there, but Onar...
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_15_13 " );	// Everything is clear. Let me guess: do you think it necessary to put these troubles on my shoulders?
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_14 " );	// You can say that. I want to give you this tower and the area around it. I want this damn piece of land to be controlled by a reliable person.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_15 " );	// Yes, it's not very safe there, but look at it from the other side: you will have a whole small estate at your own disposal.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_16 " );	// I'll take care of the documents. You find people, restore the tower, organize security.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_17 " );	// In addition, there are abandoned mines nearby, which have long attracted my attention.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_18 " );	// They might still have a bit of ore in them, and every bit is important to us right now.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_19 " );	// Onar won't let me near the mines for a cannon shot, you're not in such a cold relationship with the mercenaries.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_20 " );	// So what do you say?
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_15_21 " );	// Hmm... your offer is interesting, but how will Onar react to it?
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_22 " );	// But this is the main snag.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_23 " );	// It's much easier for an old miser to look at an empty, crumbling tower under the influence of time than at its inhabitants who are objectionable to him.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_24 " );	// In addition, he used to think that the whole area around his farm is his property, which no one can encroach on.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_04_25 " );	// You'll have to somehow convince him not to interfere with your efforts to restore the tower.
	Info_ClearChoices(dia_lord_hagen_dmtaredead);
	Info_AddChoice(dia_lord_hagen_dmtaredead, " Okay, I'll take it. " ,dia_lord_hagen_dmtaredead_yes);
	Info_AddChoice(dia_lord_hagen_dmtaredead, " Too much hassle. I guess I'll decline. " ,dia_lord_hagen_dmtaredead_no);
};

func void dia_lord_hagen_dmtaredead_yes()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_Yes_15_00 " );	// Okay, I'll take care of it.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_Yes_04_01 " );	// Great. Paper formalities, as I said, are behind me. Besides, here's some money for you for the first time.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_Yes_04_02 " );	// So to speak, primary investments, in the language of traders. I think you will need them.
	MIS_MYNEWMANSION = LOG_Running;
	Log_CreateTopic(TOPIC_MYNEWMANSION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MYNEWMANSION,LOG_Running);
	B_LogEntry( TOPIC_MYNEWMANSION , " Lord Hagen has decided to thank me for eliminating the dark wanderers by giving me ownership of Dexter's former tower. However, Onar will probably not like this, so I'll have to settle this matter with him first. I need to find something that will will allow him to convince. " );
	MIS_DTOLDNEWMINE = LOG_Running;
	Log_CreateTopic(TOPIC_DTOLDNEWMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_Running);
	B_LogEntry_Quiet( TOPIC_DTOLDNEWMINE , " Lord Hagen seems to be very interested in the ore mine near the old tower. He wants to know if there is still magic ore left there or not. He needs to find someone who can assess its quantity and quality. " );
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_dmtaredead_no()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DMTAREDEAD_No_15_00 " );	// Too much hassle. I won't take it on.
	AI_Output(self,other, " DIA_Lord_Hagen_DMTAREDEAD_No_04_01 " );	// You're a warrior, not a master, it's absolutely obvious. But, according to the laws of ordinary justice, who, if not you, should possess the earth freed by you from evil? Okay, I'm not going to force you to do anything. I consider it my duty to thank you once again for the destruction of the dark wanderers.
	AI_StopProcessInfos(self);
};

instance DIA_LORD_HAGEN_ONARSUCCS (C_Info) .
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_onarsuccs_condition;
	information = dia_lord_hagen_onarsuccs_info;
	permanent = FALSE;
	description = " I managed to settle the issue with Onar. " ;
};

func int dia_lord_hagen_onarsuccs_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_onarsuccs_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lord_Hagen_OnarSuccs_15_00 " );	// I managed to settle the issue with Onar. He won't interfere with my business in the tower.
	AI_Output(self,other, " DIA_Lord_Hagen_OnarSuccs_04_01 " );	// You seem to be as good a diplomat as a warrior or scout.
	AI_Output(self,other, " DIA_Lord_Hagen_OnarSuccs_04_02 " );	// In the meantime, I took care of the documents. Now the tower, the nearby mines and the forest below it are officially yours. Congratulations!
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	AI_Output(self,other, " DIA_Lord_Hagen_OnarSuccs_04_03 " );	// How you dispose of them is up to you. I can only advise you to find a good manager who will manage the household there during your absence.
	AI_Output(self,other, " DIA_Lord_Hagen_OnarSuccs_04_04 " );	// Also try to recruit people whose hands grow from where it is necessary, and whom you trust.
	AI_Output(other,self, " DIA_Lord_Hagen_OnarSuccs_15_05 " );	// Thanks for the tip. I can go?
	AI_Output(self,other, " DIA_Lord_Hagen_OnarSuccs_04_06 " );	// You can. Oh yes, the last one. I'll have Lord André send a couple of militiamen to help you. The rest of the people you have to look for yourself.
	AI_Output(other,self, " DIA_Lord_Hagen_OnarSuccs_15_07 " );	// I do not think that the appearance of the militia in the tower will please Onar.
	AI_Output(self,other, " DIA_Lord_Hagen_OnarSuccs_04_08 " );	// Don't worry about that. I'll order them to change their skins. I assure you, as soon as they remove the state, they will immediately lose all distinctions from vagabonds and idle townsfolk.
	MIS_MYNEWMANSION = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MYNEWMANSION,LOG_SUCCESS);
	MIS_PPL_FOR_TOWER = LOG_Running;
	Log_CreateTopic(TOPIC_PPL_FOR_TOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PPL_FOR_TOWER,LOG_Running);
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Looks like I have a lot of territory now. Obviously I can't control it on my own, which means I need people willing to join my small camp. Maybe I should look around first their new possessions and give instructions to the camp guards. And then start looking for people. Finding a good manager is a matter of paramount importance! " );
	B_LogEntry_Quiet( TOPIC_PPL_FOR_TOWER , " Lord Hagen has promised to send a couple of militiamen to help me. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Mil_360_Miliz,"NW_CASTLEMINE_PATH_HUT_02");
	Wld_InsertNpc(Mil_361_Miliz,"NW_CASTLEMINE_PATH_HUT_02");
};

instance DIA_LORD_HAGEN_OREISMINED(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_oreismined_condition;
	information = dia_lord_hagen_oreismined_info;
	permanent = FALSE;
	description = " I've explored the mine next to the tower. " ;
};

func int dia_lord_hagen_oreismined_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (HURRAYICANHIRE == TRUE) && ((HUNTYGRIMESRECRUITEDDT == TRUE) || (SearchOreMine == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_oreismined_info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_15_00 " );	// I've explored the mine next to the tower.
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_04_01 " );	// And? What do you say?
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_15_02 " );	// There's still magic ore in there. And according to preliminary estimates, there are a lot of them!
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_04_04 " );	// Great! Then I'd like you to take her to the paladin fort next to your tower.
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_04_05 " );	// And they themselves will take care of delivering it to the city.
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_04_06 " );	// For every shipment of magic ore from this mine, I'm willing to pay you one hundred gold coins.
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_04_07 " );	// And by the way, speaking of the party, I expect to get at least a hundred pieces of this valuable breed. It is clear?
	Info_ClearChoices(dia_lord_hagen_oreismined);
	Info_AddChoice(dia_lord_hagen_oreismined,"По рукам!",dia_lord_hagen_oreismined_agree);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(dia_lord_hagen_oreismined,"...(Торговаться)",dia_lord_hagen_oreismined_trade);
	};
};

func void dia_lord_hagen_oreismined_agree()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Agree_15_00");	//По рукам!
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_Agree_04_01 " );	// Then agreed. Congratulations, you've done an amazing job!
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_Agree_04_02 " );	// I'm looking forward to the first deliveries.
	MIS_DTOLDNEWMINE = LOG_SUCCESS;
	SendHagenOre = TRUE ;
	HagenOreBuy = 100;
	B_LogEntry( TOPIC_DTOLDNEWMINE , " For each shipment of magical ore, Lord Hagen will pay me one hundred gold coins. Each shipment must be at least a hundred pieces of ore. " );
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_oreismined_trade()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_Trade_15_00 " );	// A hundred gold pieces? But I can't run a camp with that kind of money!
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_Trade_15_01 " );	// Think about it: I need to pay the workers, pay for their food, pay for their security. 	
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_Trade_15_02 " );	// I have to pay a huge rent to Onar, because it was the only way to persuade him to let me go to the tower.
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_Trade_15_03 " );	// Hundreds of gold are not enough to cover all of these costs.
	AI_Output(other,self, " DIA_Lord_Hagen_OreIsMined_Trade_15_04 " );	// And that's not counting the repairs, which I paid in full out of my wallet. 	
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_Trade_04_02 " );	// Okay, don't talk like that. I got it. For each batch of ore, you will receive two hundred gold coins.
	AI_Output(self,other, " DIA_Lord_Hagen_OreIsMined_Trade_04_03 " );	// And I really hope that deliveries will begin in the coming days.
	MIS_DTOLDNEWMINE = LOG_SUCCESS;
	SendHagenOre = TRUE ;
	HagenOreBuy = 200;
	B_LogEntry( TOPIC_DTOLDNEWMINE , " For each shipment of magical ore, Lord Hagen will pay me two hundred gold coins. Each shipment must be at least a hundred pieces of ore. " );
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkWeb(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_DarkWeb_Condition;
	information = DIA_Lord_Hagen_DarkWeb_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Lord_Hagen_DarkWeb_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkWeb_Info()
{
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_00 " );	// (grimly) Wait... I have one more thing for you.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_01_01 " );	// What is it?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_02 " );	// Hmm... Let's get back to the question of killing the paladin Lothar.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_01_03 " );	// But we seem to have already decided everything.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_04 " );	// Yes, we know that blacksmith didn't kill him! But who was the real killer, we never found out.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_05 " );	// That's why I want to give you another task - to find the bastard who put the knife in Lothar's back!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_01_06 " );	// Could you entrust this task to someone else?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_07 " );	// Why? You have already proven that you are capable of much. And my people will only make too much noise.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_08 " );	// In addition, you must understand that for us paladins this is a matter of honor.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_09 " );	// We can't just close our eyes to this incident.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_10 " );	// We must find this murderer and publicly punish him for the death of our comrade and devoted servant Innos.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_01_11 " );	// This is extremely important to me and to the entire order! And the reward will not keep you waiting.
	Info_ClearChoices(DIA_Lord_Hagen_DarkWeb);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb, " No, I'd rather not interfere with this. " ,DIA_Lord_Hagen_DarkWeb_No);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb, " Okay, I'll help you. " ,DIA_Lord_Hagen_DarkWeb_Yes);
};

func void DAY_Lord_Hagen_DarkWeb_No()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_No_01_00 " );	// No, I'd rather not get involved in all this.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_No_01_01 " );	// Then get out of my sight! And I won't see you here again.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Yes()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_00 " );	// Okay, I'll help you. But I need more information!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_01 " );	// I'll tell you everything I know.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_02 " );	// You can start.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_03 " );	// Hmmm... Not long before the murder, two mercenaries arrived in the city, from Onar's farm.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_04 " );	// According to them, they came to buy tools. But then I did not attach any importance to this.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_05 " );	// What were their names?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_06 " );	// One was this blacksmith, Bennett. The name of the second is unknown to me, as he somehow managed to elude Lord Andre's men.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_07 " );	// Bad. What about the crime scene?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_08 " );	// We found Lothar's body near the south gate of the city.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_09 " );	// What was he doing there?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_10 " );	// Usually, at this time, he made an evening tour of the posts of the city militia. Apparently, at that moment the killer overtook him.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_11 " );	// But something else confuses me. No signs of combat were found at the crime scene!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_12 " );	// Lothar was the best paladin in my party and would certainly put up a decent resistance to the enemy.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_13 " );	// I wonder who could kill a paladin without even engaging in combat?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Yes_01_14 " );	// That's what I'm interested in. You will have to find the answer to this question yourself.
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Yes_01_15 " );	// Okay, let's see what we can do.
	MIS_DarkWeb = LOG_Running;
	Log_CreateTopic(TOPIC_DarkWeb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DarkWeb,LOG_Running);
	B_LogEntry(TOPIC_DarkWeb,"I decided to help Lord Hagen find the real killer of Paladin Lothar. True, there is very little information regarding this case. Firstly, I managed to find out that before Lothar's murder, two mercenaries arrived in the city, one of whom was Bennet himself. Name the second mercenary is unknown to Lord Hagen. We'll have to ask Bennet himself about this. In addition, I think it's worth examining the crime scene itself - the neighborhood, next to the southern gate of Khorinis, where the Lothar case was discovered. Although, according to Lord Hagen himself, no signs of a struggle were found there All this is rather strange, considering the fact that the one killed was the best paladin from Hagen's squad...");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItMi_LotarRing,"FP_ITEM_LOTARRING_01");
};

instance DIA_Lord_Hagen_DarkWeb_Done(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_DarkWeb_Done_Condition;
	information = DIA_Lord_Hagen_DarkWeb_Done_Info;
	permanent = FALSE;
	description = " I caught up with the slayer of the paladin Lothar. " ;
};

func int DIA_Lord_Hagen_DarkWeb_Done_Condition()
{
	if ((MY_DarkWeb == LOG_Running) && (ItuseldIsDead ==  TRUE ) && (Npc_HasItems(hero,ItMy_Ituseld_Kopf) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkWeb_Done_Info()
{
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Done_01_00 " );	// I caught up with the slayer of the paladin Lothar.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_02 " );	// Who was it?
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Done_01_03 " );	// One rather powerful mage who served Beliar. Here is his head.
	B_GiveInvItems(other,self,ItMi_Ituseld_Head, 1 );
	Npc_RemoveInvItems(self,ItMi_Ituseld_Head, 1 );
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_04 " );	// Hmmm... (disgusted) I know what kind of magician this is!
	AI_Output(other,self, " DIA_Lord_Hagen_DarkWeb_Done_01_05 " );	// So you knew him?
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_06 " );	// Personally, no. But I recognize the face of the dark masters even with my eyes closed!
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_07 " );	// These are powerful servants of the god of Darkness, though the most worthy of opponents I once fought against.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_08 " );	// True, it was a very long time ago, during an expedition to Ir'Hirrat - one of the four temples of Beliar, which was destroyed by us to the ground.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_09 " );	// Well, now I understand that Lothar had almost no chance of getting out alive.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_10 " );	// As for you, you did a good job. For this you are entitled to a special reward.
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_01_11 " );	// Choose what you want to get...
	MIS_DarkWeb = LOG_Success;
	Log_SetTopicStatus(TOPIC_DarkWeb,LOG_Success);
	B_LogEntry(TOPIC_DarkWeb, " I informed Lord Hagen that I had caught Lothar's killer. As proof, I brought him the head of the mage I killed. Lord Hagen appreciated my help in this matter. " );
	Info_ClearChoices(DIA_Lord_Hagen_DarkWeb_Done);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done, " Меч 'Вля Робра' " ,DIA_Lord_Hagen_DarkWeb_Done_Gift_00);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done, " Nephew " ,DIA_Lord_Hagen_DarkWeb_Done_Gift_01);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done, " Magic " ,DIA_Lord_Hagen_DarkWeb_Done_Gift_02);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done, " Consecrated Arrows Recipe " ,DIA_Lord_Hagen_DarkWeb_Done_Gift_03);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done, " Holy Arrow Rune " ,DIA_Lord_Hagen_DarkWeb_Done_Gift_04);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done, " Five thousand gold coins " ,DIA_Lord_Hagen_DarkWeb_Done_Gift_05);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_00()
{
	B_GiveInvItems(self,other,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00 " );	// Good choice.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_01()
{
	B_GiveInvItems(self,other,ItAr_Pal_Helm,1);
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00 " );	// Good choice.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_02()
{
	B_GiveInvItems(self,other,ItAr_Shield_07,1);
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00 " );	// Good choice.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_03()
{
	B_GiveInvItems(self,other,ItWr_HolyArrows,1);
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00 " );	// Good choice.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_04()
{
	B_GiveInvItems(self,other,ItRu_PalHolyBolt, 1 );
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00 " );	// Good choice.
	HagenGift = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_05()
{
	B_GiveInvItems(self,other,ItMi_Gold,5000);
	AI_Output(self,other, " DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00 " );	// Good choice.
	AI_StopProcessInfos(self);
};
