

instance DIA_garond_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_EXIT_Condition;
	information = DIA_Garond_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Garond_EXIT_Info()
{
	if ((MY_ScoutMine == LOG_Running) && ( CAPITELORCATC  ==  FALSE ) && (MY_LostPaladins ==  FALSE ))
	{
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_00 " );	// Wait a minute...
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_01 " );	// There is one more thing where your help would be useful.
		AI_Output(other,self, " DIA_Garond_SeekPaladin_01_02 " );	// And what is it?
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_03 " );	// As we made our way to the castle, we split into three groups so as not to draw too much attention from the orcs.
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_04 " );	// I led the first group! The other two were commanded by the paladins Albert and Wenzel.
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_05 " );	// However, nothing has been heard of them until now. I don't even know if they are alive or not!
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_06 " );	// Therefore, you should try to find out what became of my people.
		AI_Output(other,self, " DIA_Garond_SeekPaladin_01_07 " );	// Okay! I will do everything in my power.
		AI_Output(self,other, " DIA_Garond_SeekPaladin_01_08 " );	// I really hope for you.
		MIS_LostPaladins = LOG_Running;
		Log_CreateTopic(TOPIC_LostPaladins,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Running);
		B_LogEntry(TOPIC_LostPaladins, " Garond asked me to find out what happened to Albert and Wenzel's paladin squads. " );
	};

	AI_StopProcessInfos(self);
};

var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;

instance DIA_Garond_PM Debt (C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PMSchulden_Condition()
{
	if (Npc_IsInState(self,ZS_Talk) && (Garond_Shoulder >  0 ) && (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	GARONDTROUBLE = TRUE;
	concatText = " Paladins have outlawed you! " ;
	AI_Print(concatText);
};

func void dia_garond_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	GARONDTROUBLE = TRUE;
	concatText = " Paladins have outlawed you! " ;
	AI_Print(concatText);
};

func void DIA_Garond_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other, " DIA_Garond_PMSchulden_10_00 " );	// Before we discuss anything, pay the fine.
	temp1 = 0 ;
	if(GLOBAL_OLDCAMP_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_OLDCAMP_THEFT > 10)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_OLDCAMP_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_OLDCAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_36 " );	// But in light of your recent deeds, this is no longer necessary...
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_37 " );	// You are a killer, and this is your true nature. And my sacred duty is to rid the earth of people like you!
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_38 " );	// And believe me: I will fulfill this duty to people and Innos, no matter what the cost.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_39 " );	// And now - die!
		}
		else if(GLOBAL_OLDCAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_40 " );	// But in light of your recent deeds, this is no longer necessary...
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_41 " );	// You are a bandit, and this is your true nature. And my sacred duty is to rid the earth of people like you!
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_42 " );	// And believe me: I will fulfill this duty to people and Innos, no matter what the cost.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_43 " );	// And now - die!
		}
		else if(GLOBAL_OLDCAMP_THEFT > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_44 " );	// But in light of your recent deeds, this is no longer necessary...
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_45 " );	// You are a thief, and this is your true nature. And my sacred duty is to rid the earth of people like you!
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_46 " );	// And believe me: I will fulfill this duty to people and Innos, no matter what the cost.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Garond_PMSchulden_08_47 " );	// And now - die!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " My relationship with the paladins is ruined because of the constant outrages in the castle. Now they consider me a bandit there, this also applies to the city! " );
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PMSchulden, " Wait...(it's time to leave) " ,dia_garond_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
		{
			AI_Output(self,other, " DIA_Garond_PMSchulden_10_01 " );	// And it arose because of the latest accusations.
			AI_Output(self,other, " DIA_Garond_PMSchulden_10_02 " );	// Looks like you'll give me even more trouble.
			diff = B_GetTotalPetzCounter(self) - Garond_LastPetzCounter;
			if(diff > 0)
			{
				garond_debt = garond_debt + (diff *  250 );
			};
			if (Garond_Debts <  1000 )
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_03 " );	// But I hope you pay for everything now! In general, this...
				AI_Output(other,self, " DIA_Garond_PMSchulden_10_03A " );	// How much?
				if (Garond_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Debts), " " );
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_04 " );	// I'm disappointed with you. Your fine is...
				AI_Output(other,self, " DIA_Garond_PMSchulden_10_04A " );	// How much?
				if (Garond_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Debts), " " );
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else  if (B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
		{
			AI_Output(self,other, " DIA_Garond_PMSchulden_10_05 " );	// Several new circumstances have come to light.
			if (Garond_LastPetzCrime ==  CRIME_MURDER )
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_06 " );	// No one accuses you of murder anymore.
				GLOBAL_OLDCAMP_MURDER = GLOBAL_OLDCAMP_MURDER - 1;
				if(GLOBAL_OLDCAMP_MURDER < 0)
				{
					GLOBAL_OLDCAMP_MURDER = 0;
				};
			};
			if((Garond_LastPetzCrime == CRIME_THEFT) || ((Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_07 " );	// No one remembers that they caught you stealing.
				GLOBAL_OLDCAMP_THEFT = GLOBAL_OLDCAMP_THEFT - 1;
				if(GLOBAL_OLDCAMP_THEFT < 0)
				{
					GLOBAL_OLDCAMP_THEFT = 0;
				};
			};
			if((Garond_LastPetzCrime == CRIME_ATTACK) || ((Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_08 " );	// There is no other witness to confirm that you were involved in the fight.
				GLOBAL_OLDCAMP_ATTACK = GLOBAL_OLDCAMP_ATTACK - 1;
				if(GLOBAL_OLDCAMP_ATTACK < 0)
				{
					GLOBAL_OLDCAMP_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_09 " );	// Apparently, all charges against you have been dropped.
			};
			AI_Output(self,other, " DIA_Garond_PMSchulden_10_10 " );	// I don't know what happened, but I warn you: don't go too far!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_11 " );	// I have decided to forgive you your debts.
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_12 " );	// And don't make any more trouble in the castle!
				garond_debt = 0 ;
				Garond_LastPetzCounter = 0 ;
				Garond_LastPetzCrime = CRIME_NONE ;
			}
			else
			{
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_13 " );	// To be clear: you must pay your fine in full.
				if (Garond_Debts <=  1000 )
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Debts), " " );
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other, " DIA_Garond_PMSchulden_10_14 " );	// So what did you decide?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Garond_PMSchulden);
			Info_ClearChoices(DIA_Garond_PETZMASTER);
			Info_AddChoice(DIA_Garond_PMSchulden, " I don't have enough gold! " ,DIA_Garond_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Garond_PMSchulden, " How Much Should I Pay? " ,DIA_Garond_PMSchulden_HowMuchAgain);
			if (Npc_HasItems(other,ItMi_Gold) >= Garond_debts)
			{
				Info_AddChoice(DIA_Garond_PMSchulden, " I want to pay a fine. " ,DIA_Garond_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	AI_Output(other,self, " DIA_Garond_PMSchulden_HowMuchAgain_15_00 " );	// How much do I have to pay?
	if (Garond_Debts <=  1000 )
	{
		B_Say_Gold(self,other,Garond_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Garond_Debts), " " );
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Garond_PMSchulden);
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_AddChoice(DIA_Garond_PMSchulden, " I don't have enough gold! " ,DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Garond_PMSchulden, " How Much Should I Pay? " ,DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other,ItMi_Gold) >= Garond_debts)
	{
		Info_AddChoice(DIA_Garond_PMSchulden, " I want to pay a fine. " ,DIA_Garond_PETZMASTER_PayNow);
	};
};


instance DIA_Garond_PETZMASTER (C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PETZMASTER_Condition()
{
	if ((B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Garond_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	garond_debt = 0 ;
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Garond_PETZMASTER_10_00 " );	// You're the guy who caused trouble in the castle.
	};
	temp1 = 0 ;
	if(GLOBAL_OLDCAMP_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_OLDCAMP_THEFT > 10)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_OLDCAMP_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_OLDCAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_48 " );	// But in light of your recent deeds, this is no longer necessary...
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_49 " );	// Bloodthirsty bastards like you have no place in this world - and therefore earthly punishment will overtake you before heavenly.
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_50 " );	// And believe me, I will fulfill this duty to people and Innos, no matter what it costs me.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_51 " );	// And now - die!
		}
		else if(GLOBAL_OLDCAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_52 " );	// But in light of your recent deeds, this is no longer necessary...
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_53 " );	// You are a bandit, and this is your true nature. And my sacred duty is to rid the earth of people like you!
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_54 " );	// And believe me: I will fulfill this duty to people and Innos, no matter what the cost.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_55 " );	// And now - die!
		}
		else if(GLOBAL_OLDCAMP_THEFT > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_56 " );	// But in light of your recent deeds, this is no longer necessary...
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_57 " );	// You are a thief, and this is your true nature. And my sacred duty is to rid the earth of people like you!
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_58 " );	// And believe me: I will fulfill this duty to people and Innos, no matter what it costs me.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Garond_PETZMASTER_08_59 " );	// And now - die!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " My relationship with the paladins is ruined because of the constant outrages in the castle. Now they consider me a bandit there, this also applies to the city! " );
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PETZMASTER, " Wait!!!...(it's time to leave) " ,dia_garond_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_01 " );	// I already asked myself - when will you come to me?
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_02 " );	// Murder is the last thing I want to see!
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_03 " );	// I'm responsible for each of my people - and now I have one less person!
			Garond_debts = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Garond_PETZMASTER_10_04 " );	// And I don't even stutter about the rest of the things you've done.
			};
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_05 " );	// Now I'll explain something to you. We are all sitting here in a trap.
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_06 " );	// And I'm responsible for each of my people. And for you.
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_07 " );	// If you want to kill someone, all you have to do is get out of the castle. There are plenty of orcs out there.
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_08 " );	// I'll give you a fine - even though I don't want to do that kind of shit.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_09 " );	// I heard you're into stealing?
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Garond_PETZMASTER_10_10 " );	// In addition to other cases I've been told about.
			};
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_11 " );	// I won't let you. I think you underestimate the seriousness of the situation.
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_12 " );	// You will pay a fine to make amends for your crime!
			Garond_debts = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_13 " );	// I don't like fighting between my people.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other, " DIA_Garond_PETZMASTER_10_14 " );	// And the incident with the sheep does you no credit.
			};
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_15 " );	// You pay a fine for this!
			Garond_debts = B_GetTotalPetzCounter(self) *  750 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_16 " );	// You go around and kill our sheep? They belong to all of us.
			AI_Output(self,other, " DIA_Garond_PETZMASTER_10_17 " );	// You will pay me for the meat.
			garond_debt = 250 ;
		};
		AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Сколько?
		if (Garond_Debts <=  1000 )
		{
			B_Say_Gold(self,other,Garond_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Garond_Debts), " " );
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PETZMASTER, " I don't have enough gold! " ,DIA_Garond_PETZMASTER_PayLater);
		if (Npc_HasItems(other,ItMi_Gold) >= Garond_debts)
		{
			Info_AddChoice(DIA_Garond_PETZMASTER, " I want to pay a fine. " ,DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output(other,self, " DIA_Garond_PETZMASTER_PayNow_15_00 " );	// I want to pay a fine!
	B_GiveInvItems(other,self,ItMi_Gold,Garond_Duties);
	AI_Output(self,other, " DIA_Garond_PETZMASTER_PayNow_10_01 " );	// Okay, I'll tell our guys about this to calm them down a bit. But don't let this happen again!
	B_GrantAbsolution(LOC_OLDCAMP);
	garond_debt = 0 ;
	Garond_LastPetzCounter = 0 ;
	Garond_LastPetzCrime = CRIME_NONE ;
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_ClearChoices(DIA_Garond_PMSchulden);
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output(other,self, " DIA_Garond_PETZMASTER_PayLater_15_00 " );	// I don't have that much gold!
	AI_Output(self,other, " DIA_Garond_PETZMASTER_PayLater_10_01 " );	// Then try to get this gold as quickly as possible.
	AI_Output(self,other, " DIA_Garond_PETZMASTER_PayLater_10_02 " );	// And I warn you: if you continue to commit such crimes in the future, the price will increase!
	Garond_LastPetzCounter = B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Garond_Hello(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Hello_Condition;
	information = DIA_Garond_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Garond_Hello_Condition()
{
	if((Kapitel == 2) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Garond_Hello_Info()
{
	AI_Output(self,other, " DIA_Garond_Hello_10_00 " );	// Where did you come from? You're not one of the miners, and you're not one of my people. So who are you?
	AI_Output(other,self, " DIA_Garond_Hello_15_01 " );	// I came through the Passage.
	AI_Output(self,other, " DIA_Garond_Hello_10_02 " );	// Through Passage...? Did you really go through there?! Oh, Innos almighty!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_03 " );	// Why did you come this way, mage?
	}
	else  if (hero.guild ==  GIL_MIL )
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_04 " );	// What order are you following, soldier?
	}
	else if(hero.guild == GIL_SLD)
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_05 " );	// I ask myself: why would a mercenary make such a journey? What are you doing here?
	}
	else  if (hero.guild ==  GIL_KDW )
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_06 " );	// What is the venerable Water Mage looking for here?
	}
	else  if (hero.guild ==  GIL_KDM )
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_07 " );	// And what was the reason for the NECROMANCE to appear here?
	}
	else if(hero.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_08 " );	// You look like those guys from the former swamp camp. What do you need here?
	}
	else
	{
		AI_Output(self,other, " DIA_Garond_Hello_10_09 " );	// What are you doing here?
	};
};

instance DIA_Garond_NeedProof(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_NeedProof_Condition;
	information = DIA_Garond_NeedProof_Info;
	description = " I have come from Lord Hagen. " ;
};


func int DIA_Garond_NeedProof_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Garond_Hello ) && ( MY_OLDWORLD  == LOG_Running ) && ( Chapter ==  2 )) ;
	{
		return TRUE;
	};
};

func void DIA_Garond_NeedProof_Info()
{
	AI_Output(other,self, " DIA_Garond_NeedProof_15_00 " );	// I come from Lord Hagen. He wants me to show him evidence of dragons here.
	AI_Output(self,other, " DIA_Garond_NeedProof_10_01 " );	// So you came to get this evidence and disappear again?
	AI_Output(other,self, " DIA_Garond_NeedProof_15_02 " );	// Yes! That's exactly what I was counting on.
	AI_Output(self,other, " DIA_Garond_NeedProof_10_03 " );	// So he needs proof? He can get them. But I can't send you back to Lord Hagen without giving him information about the ore.
	AI_Output(self,other, " DIA_Garond_NeedProof_10_04 " );	// Listen - Lord Hagen needs to know all about the situation here and how much ore we've managed to extract.
	AI_Output(other,self, " DIA_Garond_NeedProof_15_05 " );	// Good. And what do you want me to do?
	AI_Output(self,other, " DIA_Garond_NeedProof_10_06 " );	// We've got three bands of miners here in the valley. But I haven't received a single piece of ore from them yet.
	AI_Output(self,other, " DIA_Garond_NeedProof_10_07 " );	// Visit all three mines and report to me how much ore they have mined.
	AI_Output(self,other, " DIA_Garond_NeedProof_10_08 " );	// After that, I'll give you a letter to take to Lord Hagen.
	AI_Output(other,self, " DIA_Garond_NeedProof_15_09 " );	// Well, okay. It looks like I have no choice.
	if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && ( MY_PALADINWATCH  == LOG_Running) && ( TWO IDOLORANQUESTIONS  ==  FALSE )) ;
	{
		IDOLORANQUESTIONTWO = TRUE;
		B_LogEntry( TOPIC_PALADINWATCH , " It seems that the main reason why the paladins came to this island was magic ore. Without enough weapons from magic ore, the king's army will not have a chance in the war against the orcs. The squad that went to the Valley of Mines , must find out the situation with the possibility of mining on the island.After that, the paladins plan to return back to the mainland. " );
	};
	if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && ( MIS_PALADINWATCH  == LOG_Running) && ( IDOLORANQUESTIONTHREE  ==  FALSE )) ;
	{
		IDOLORANQUESTIONTHREE = TRUE;
		B_LogEntry( TOPIC_PALADINWATCH , " The paladin squad that Lord Hagen sent to clarify the situation with the ore settled in the old Barons' castle. They are in a very bad state. the castle is surrounded by paladins from all sides.In addition, the castle was recently attacked by dragons - which adds even more 'optimism' to the success of the whole operation. " );
	};
	MIS_ScoutMine = LOG_Running;
	B_StartOtherRoutine(Jergan,"FAJETH");
	B_LogEntry(Topic_MISOLDWORLD, " Before Commandant Garond gives me a letter of evidence, he wants me to find THREE groups of miners and tell him how much ore they have already mined. " );
	Log_CreateTopic(TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutMine,LOG_Running);
	B_LogEntry_Quiet(TOPIC_ScoutMine, " Commandant Garond gave me a mission. He sent out THREE groups of miners to scout for magic ore. But so far, I haven't heard from them. " );
	B_LogEntry_Quiet(TOPIC_ScoutMine, " I need to track down the mining teams and find out how much ore they found. " );
};

instance DIA_Garond_WhyNot(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_WhyNot_Condition;
	information = DIA_Garond_WhyNot_Info;
	description = " Why didn't you send people to other mines? " ;
};

func int DIA_Garond_WhyNot_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Garond_NeedProof ) ==  TRUE ) && ( Capital <=  5 )) ;
	{
		return TRUE;
	};
};

func void DIA_Garond_WhyNot_Info()
{
	AI_Output(other,self, " DIA_Garond_WhyNot_01_00 " );	// Why didn't you send people to the Old Mine?
	AI_Output(self,other, " DIA_Garond_WhyNot_01_01 " );	// (seriously) As far as I know, it collapsed.
	AI_Output(self,other, " DIA_Garond_WhyNot_01_02 " );	// It is unlikely that we will be able to mine ore there.
	AI_Output(self,other, " DIA_Garond_WhyNot_01_03 " );	// And besides, that mine is probably full of undead right now.
	AI_Output(self,other, " DIA_Garond_WhyNot_01_04 " );	// And I'm not going to send my people to certain death! I have very few of them.
	AI_Output(other,self, " DIA_Garond_WhyNot_01_05 " );	// There is also a mine in the New Camp.
	AI_Output(self,other, " DIA_Garond_WhyNot_01_06 " );	// The mine in the New Camp? Another one?
	AI_Output(other,self, " DIA_Garond_WhyNot_01_07 " );	// Didn't you know about her?
	AI_Output(self,other, " DIA_Garond_WhyNot_01_08 " );	// One of the prisoners seems to be talking about something similar. But then I did not attach any importance to this.
	AI_Output(other,self, " DIA_Garond_WhyNot_01_09 " );	// But in vain. At one time, the magicians of Water mined ore in it for their experiments.
	AI_Output(self,other, " DIA_Garond_WhyNot_01_10 " );	// If that's the case... (thoughtfully) Then maybe we should check it out.
	AI_Output(self,other, " DIA_Garond_WhyNot_01_11 " );	// Take care of it! We need to find out what is now with this mine and whether it is possible to mine ore there.
	MIS_ScoutNewMine = LOG_Running;
	Log_CreateTopic(TOPIC_ScoutNewMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutNewMine,LOG_Running);
	B_LogEntry(TOPIC_ScoutNewMine, " Garond was surprised to learn that another mine exists in the Valley of Mines - the one in the New Camp. He ordered me to inquire about the situation there! " );
};

var int  SFRM_01 ;
var int  SFRM_02 ;

instance DIA_Garond_ScoutNewMine (C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_ScoutNewMine_Condition;
	information = DIA_Garond_ScoutNewMine_Info;
	permanent = TRUE;
	description = " About the mine in the New Camp. " ;
};

func int DIA_Garond_ScoutNewMine_Condition()
{
	if((MIS_ScoutNewMine == LOG_Running) && ((ScoutFreeMine == TRUE) || (ScoutFreeLager == TRUE) || (FreeMineGeneralIsDead == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Garond_ScoutNewMine_Info()
{
	var int sumqx;

	sumqx = FALSE ;

	AI_Output(other,self, " DIA_Garond_ScoutNewMine_01_00 " );	// About the mine in the New Camp.
	AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_01 " );	// I'm listening to you.

	if(FreeMineGeneralIsDead == FALSE)
	{
		if((ScoutFreeLager == TRUE) && (SFRM_01 == FALSE))
		{
			sumqx = sumqx +  200 ;
			AI_Output(other,self, " DIA_Garond_ScoutNewMine_01_02 " );	// Orcs have full control of all approaches to it.
			AI_Output(other,self, " DIA_Garond_ScoutNewMine_01_03 " );	// And there are quite a few of them.
			AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_04 " );	// I didn't doubt it. These creatures won't let go!
			SFRM_01 = TRUE;
		};
		if((ScoutFreeMine == TRUE) && (SFRM_02 == FALSE))
		{
			sumqx = sumqx +  200 ;
			AI_Output(other,self, " DIA_Garond_ScoutNewMine_01_05 " );	// I managed to get into the mine itself. It's full of orcs too!
			AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_06 " );	// It was logical to assume that they would not leave her unguarded.
			AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_07 " );	// Now, in order to mine ore there, we'll have to knock them out of there!
			SFRM_02 = TRUE;
		};
		if(sumqx > 0)
		{
			B_GivePlayerXP(sumqx);
		};

		AI_Output(other,self, " DIA_Garond_ScoutNewMine_01_08 " );	// Nothing else yet.
		AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_09 " );	// Good! Then let me know if the situation changes.
	}
	else
	{
		if((SFRM_01 == FALSE) && (SFRM_02 == FALSE))
		{
			B_GivePlayerXP(500);
		}
		else
		{
			B_GivePlayerXP(1000);
		};

		AI_Output(other,self, " DIA_Garond_ScoutNewMine_01_10 " );	// I took care of the orcs. The mine is now free.
		AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_11 " );	// Are you serious? To be honest, I didn't expect this from you.
		AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_12 " );	// Good! As soon as we lift the siege from the castle, I will send a small group of people there.
		AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_13 " );	// Let's see if there's a lot of ore there.
		AI_Output(self,other, " DIA_Garond_ScoutNewMine_01_14 " );	// Here, take this gold as a reward.
		B_GiveInvItems(self,other,ItMi_Gold,1500);
		MIS_ScoutNewMine = LOG_Success;
		Log_SetTopicStatus(TOPIC_ScoutNewMine,LOG_Success);
		B_LogEntry(TOPIC_ScoutNewMine, " Garond was pleased that I was able to liberate the mine in the New Camp. " );
		AI_StopProcessInfos(self);
	};
};

var int AlbertGroupDone;
var int VenzelGroupDone;

instance DIA_GAROND_GROUP4 (C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = dia_garond_group4_condition;
	information = dia_garond_group4_info;
	permanent = FALSE;
	description = " I've located Paladin Albert's party. " ;
};

func int dia_garond_group4_condition()
{
	if ((MY_LostPaladins == LOG_Running) && ( CAPITELORCATC  ==  FALSE ) && (AlbertGroup ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_garond_group4_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Garond_Group4_15_01 " );	// I've located Paladin Albert's party.
	AI_Output(self,other, " DIA_Garond_Group4_10_00 " );	// What's up with them?
	AI_Output(other,self, " DIA_Garond_Group4_15_02 " );	// They hid in a cave behind the orc fence.
	AI_Output(other,self, " DIA_Garond_Group4_15_03 " );	// He asks - what should they do?
	AI_Output(self,other, " DIA_Garond_Group4_10_01 " );	// Innos sent us good news today!
	AI_Output(self,other, " DIA_Garond_Group4_10_02 " );	// If you manage to get there again, give my order to stay in cover until Lord Hagen and his men appear in the valley.
	AI_Output(self,other, " DIA_Garond_Group4_10_04 " );	// And then they'll hit the orcs in the rear!
	AI_Output(self,other, " DIA_Garond_Group4_10_05 " );	// If we strike from three sides - from Khorinis, from the castle and from the sea, then we will sow panic in the ranks of the orcs.
	AI_Output(self,other, " DIA_Garond_Group4_10_06 " );	// And then we will have a noticeable chance.
	B_LogEntry(TOPIC_LostPaladins, " I informed Garond of a group of paladins found. " );

	if(MIS_EscapeMine == LOG_Success)
	{
		MIS_LostPaladins = LOG_Success;
		Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	};

	MIS_FINDEDOCGROUP = LOG_Running;
	Log_CreateTopic(TOPIC_FINDEDOCGROUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDEDOCGROUP,LOG_Running);
	B_LogEntry_Quiet( TOPIC_FINDEDOCGROUP , " Garonde asked me to convey orders to Albert to remain where they are until Lord Hagen arrives with reinforcements. " );
};

instance DIA_GAROND_Venzel (C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = dia_garond_Venzel_condition;
	information = dia_garond_Venzel_info;
	permanent = FALSE;
	description = " Regarding Paladin Wenzel's party. " ;
};

func int dia_garond_Venzel_condition()
{
	if ((MIS_LostPaladins == LOG_Running) && ( CAPITELORCATC  ==  FALSE ) && (HintVenzelOrcs_01 ==  TRUE ) && (HintVenzelOrcs_02 ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_garond_Venzel_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Garond_Venzel_01_01 " );	// Regarding Paladin Wenzel's group...
	AI_Output(self,other, " DIA_Garond_Venzel_01_02 " );	// I'm listening to you carefully.
	AI_Output(other,self, " DIA_Garond_Venzel_01_03 " );	// A couple of days ago, one of the hunters saw a wounded paladin on the river bank.
	AI_Output(other,self, " DIA_Garond_Venzel_01_04 " );	// Maybe it was someone from Wenzel's squad.
	AI_Output(self,other, " DIA_Garond_Venzel_01_05 " );	// Interesting... Did you find out anything else?
	AI_Output(other,self, " DIA_Garond_Venzel_01_06 " );	// Scout Yergan also says that he recently observed how the orcs led a group of captured people to their camp.
	AI_Output(other,self, " DIA_Garond_Venzel_01_07 " );	// True, they did not have any identification marks.
	AI_Output(other,self, " DIA_Garond_Venzel_01_08 " );	// So he can't tell for sure.
	AI_Output(self,other, " DIA_Garond_Venzel_01_09 " );	// If they are still alive and captured by the orcs, we must somehow try to get them out of the clutches of these creatures.
	AI_Output(self,other, " DIA_Garond_Venzel_01_10 " );	// (decidedly) Where are they now?
	AI_Output(other,self, " DIA_Garond_Venzel_01_11 " );	// I'm afraid that no one will say this except the orcs.
	AI_Output(self,other, " DIA_Garond_Venzel_01_12 " );	// You know, I don't care how you do it... (seriously) But you should find out what kind of people they were!
	AI_Output(self,other, " DIA_Garond_Venzel_01_13 " );	// And if there are my brothers in arms among them, try to save them.
	AI_Output(self,other, " DIA_Garond_Venzel_01_14 " );	// Complete this task - and you can ask me whatever you want. I swear by Innos!
	AI_Output(other,self, " DIA_Garond_Venzel_01_15 " );	// Well, if it's that important to you...
	B_LogEntry(TOPIC_LostPaladins, " I informed Garond of what I had found out about Wenzel's party. Of course, he was not happy with the news. He insisted that I find out who these people were who were taken to the mountains by the orcs. And if the opportunity presents itself, save them. Apparently, only the orcs themselves can know this. " );
	KnowVenzelOrcs = TRUE;
};

instance DIA_PAL_250_Garond_VenzelDone(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_PAL_250_Garond_VenzelDone_condition;
	information = DIA_PAL_250_Garond_VenzelDone_info;
	permanent = FALSE;
	description = " I found out what happened to Wenzel. " ;
};

func int DIA_PAL_250_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_250_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_01 " );	// I found out what happened to Wenzel.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_02 " );	// Tell me everything you know. Is he alive?
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_03 " );	// Alive, but captured by orcs. They sent him to an iron mine to extract ore.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_04 " );	// Praise Innos... (relieved) So, all is not lost! We must try to get him out of there.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_05 " );	// This is no longer necessary. In the orc mine, I found a magical portal.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_06 " );	// Wenzel, along with the rest of the slaves, will use it to escape from captivity.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_07 " );	// However, there is a suspicion that the portal leads directly to the mainland.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_08 " );	// Therefore, Wenzel asked me to tell you that most likely he will not return back to Khorinis.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_09 " );	// Well, so be it. The main thing is that everything will be fine with him.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_10 " );	// He said he would return to Myrtana and fight the orcs there.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_11 " );	// Apparently, he was right when he said that the king is no better off there than you are.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_12 " );	// Those damn orcs...(angrily) They've swept across the country like locusts!
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_13 " );	// But we will fight to the last! They just won't break us.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_14 " );	// As for the situation on the mainland... (reluctantly) I won't lie to you! Yes it is.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_15 " );	// The king is doing his best to hold back the hordes of orcs that have broken through from Nordmar.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_16 " );	// But he's not good at it. There are too many orcs, and the king does not have enough people or weapons.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_17 " );	// Therefore, all hope lies with us! Perhaps with the help of magic ore, there is still a chance to turn the tide of the war.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_18 " );	// But, as you can see, we ourselves here are hardly fighting off the orcs.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_19 " );	// I'm not used to giving up prematurely...(doomed) But it looks like we've already lost this war.
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_20 " );	// But don't you dare tell anyone about it!
	AI_Output(self,other, " DIA_PAL_250_Garond_VenzelDone_01_21 " );	// I won't let my soldiers lose heart just because of some stupid speculation.
	AI_Output(other,self, " DIA_PAL_250_Garond_VenzelDone_01_22 " );	// Of course.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins, " I told Garond about Wenzel's fate. " );
};

instance DIA_Garond_Why(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Why_Condition;
	information = DIA_Garond_Why_Info;
	permanent = FALSE;
	description = " But why me? " ;
};

func int DIA_Garond_Why_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Why_Info()
{
	AI_Output(other,self, " DIA_Garond_Why_15_00 " );	// But why me?
	AI_Output(self,other, " DIA_Garond_Why_10_01 " );	// Because you know how to get through the orcs. My boys will only give their lives in vain.
	AI_Output(self,other, " DIA_Garond_Why_10_02 " );	// After all, you have already managed to overcome all the obstacles once, which means that you are the best suited for this work.
};

instance DIA_Garond_Equipment(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Equipment_Condition;
	information = DIA_Garond_Equipment_Info;
	permanent = FALSE;
	description = " I need equipment. " ;
};


func int DIA_Garond_Equipment_Condition()
{
	if ((MIS_ScoutMine == LOG_Running) && (Chapter ==  2 ) && ((other.guild ==  GIL_KDF ) || (other.guild ==  GIL_MIL )))
	{
		return TRUE;
	};
};

func void DIA_Garond_Equipment_Info()
{
	AI_Output(other,self, " DIA_Garond_Equipment_15_00 " );	// I need gear.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Garond_Equipment_10_01 " );	// Talk to the mage Milten here in the castle. He understands such things.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Garond_Equipment_10_02 " );	// Talk to Tandor about it. He will give you everything you need.
		Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Trader_OC, " Tandor sells weapons in the castle. " );
	};
};


instance DIA_Garond_zahlen (C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_zahlen_Condition;
	information = DIA_Garond_zahlen_Info;
	permanent = FALSE;
	description = " How much will you pay me for this job? " ;
};


func int DIA_Garond_zahlen_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_zahlen_Info()
{
	AI_Output(other,self, " DIA_Garond_zahlen_15_00 " );	// How much will you pay me for this job?
	AI_Output(self,other, " DIA_Garond_zahlen_10_01 " );	// I don't trade with you mercenaries.
	AI_Output(self,other, " DIA_Garond_zahlen_10_02 " );	// Oh well, looks like I don't have a choice. I will pay you five hundred gold if you complete my task.
};


instance DIA_Garond_Wo(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Wo_Condition;
	information = DIA_Garond_Wo_Info;
	permanent = FALSE;
	description = " Where can I find these mines? " ;
};


func int DIA_Garond_Wo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Wo_Info()
{
	AI_Output(other,self, " DIA_Garond_Wo_15_00 " );	// Where can I find these mines?
	AI_Output(self,other, " DIA_Garond_Wo_10_01 " );	// Here, take this card. It shows two areas where the mines are located.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis_1,1);
	B_GiveInvItems(self,other,itwr_map_oldworld_oremines_mis_1,1);
	AI_Output(self,other, " DIA_Garond_Wo_10_02 " );	// If you have more questions, ask Parsival. He'll tell you everything you need to know about prospectors.
	B_LogEntry(TOPIC_ScoutMine, " Paladin Parzival can give me information about the scouts. " );
};

func void B_Garond_OreCounter3()
{
	AI_Output(self,other, " B_Garond_OreCounter3_10_00 " );	// Damn! What is happening there? Has Beliar himself come to wipe us off the face of the earth?!
	AI_Output(self,other, " B_Garond_OreCounter3_10_01 " );	// My people are almost all dead, and with all the ore we have, we CANNOT STOP EVEN ONE ORC, LET ALL AN ARMY!
	AI_Output(self,other, " B_Garond_OreCounter3_10_02 " );	// This expedition is doomed to failure.
};


instance DIA_Garond_Fajeth(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Fajeth_Condition;
	information = DIA_Garond_Fajeth_Info;
	permanent = FALSE;
	description = " I talked to Fudget. " ;
};


func int DIA_Garond_Fajeth_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Fajeth_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Fajeth_Info()
{
	AI_Output(other,self, " DIA_Garond_Fajeth_15_00 " );	// I talked to Fudget.
	AI_Output(self,other, " DIA_Garond_Fajeth_10_01 " );	// What can he tell me?
	AI_Output(other,self, " DIA_Garond_Fajeth_15_02 " );	// His men mined two crates of ore.
	AI_Output(self,other, " DIA_Garond_Fajeth_10_03 " );	// Hmm... two boxes? I don't need two boxes - I need TWO HUNDREDS.
	AI_Output(other,self, " DIA_Garond_Fajeth_15_04 " );	// He wants me to tell you - he needs more people.
	AI_Output(self,other, " DIA_Garond_Fajeth_10_05 " );	// What? Should I send more people to certain death? He may forget about it.
	Ore_Counter = Ore_Counter + 1;
	B_GivePlayerXP(XP_Fajeth_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Silvestro (C_Info) .
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Silvestro_Condition;
	information = DIA_Garond_Silvestro_Info;
	permanent = FALSE;
	description = " About the Silvestro Mine... " ;
};


func int DIA_Garond_Silvestro_Condition()
{
	if ((MY_ScoutMine == LOG_Running) && (Chapter ==  2 ) && (Wild_Ore ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Garond_Silvestro_Info()
{
	AI_Output(other,self, " DIA_Garond_Silvestro_15_00 " );	// About the Silvestro Mine...
	AI_Output(self,other, " DIA_Garond_Silvestro_10_01 " );	// Did you see him? Have you spoken to him?
	AI_Output(other,self, " DIA_Garond_Silvestro_15_02 " );	// Everyone in the mine is dead. Torn to pieces by crawlers!
	AI_Output(self,other, " DIA_Garond_Silvestro_10_03 " );	// What about ore? Do you know how much they got?
	AI_Output(other,self, " DIA_Garond_Silvestro_15_04 " );	// They managed to hide a few crates. They are in a cave - on the way from the castle to the mine.
	AI_Output(self,other, " DIA_Garond_Silvestro_10_05 " );	// Damn! They were good people - may Innos show mercy to their souls.
	Ore_Counter = Ore_Counter + 1;
	B_GivePlayerXP(XP_Silvestro_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Marcos (C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Marcos_Condition;
	information = DIA_Garond_Marcos_Info;
	permanent = FALSE;
	description = " I met Markos. " ;
};


func int DAY_Garond_Marcos_Condition()
{
	if ((MY_ScoutMine == LOG_Running) && (Chapter ==  2 ) && (Marcos_Ore ==  TRUE ))
	{
		return TRUE;
	};
};

func void DAY_Garond_Marcos_Info()
{
	AI_Output(other,self, " DIA_Garond_Marcos_15_00 " );	// I met Marcos.
	AI_Output(self,other, " DIA_Garond_Marcos_10_01 " );	// And? What can he report? How much ore did he mine for us?
	AI_Output(other,self, " DIA_Garond_Marcos_15_02 " );	// Four drawers. He left the mine to move the ore to safety.
	AI_Output(other,self, " DIA_Garond_Marcos_15_03 " );	// He now guards these crates in a small valley behind the orc positions. He asks for reinforcements.
	AI_Output(self,other, " DIA_Garond_Marcos_10_04 " );	// What? Only four boxes - and he left the mine? Damn, this is all bad.
	AI_Output(self,other, " DIA_Garond_Marcos_10_05 " );	// And he needs more people?.. Well, all right, I'll send two people to him.
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	B_StartOtherRoutine(Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine(Marcos_Guard2,"MARCOS");
	AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
	Ore_Counter = Ore_Counter + 1;
	MIS_Marcos_Jungs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Marcos_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Success(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Success_Condition;
	information = DIA_Garond_Success_Info;
	permanent = FALSE;
	description = " What about a letter for Lord Hagen? " ;
};


func int DIA_Garond_Success_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter >= 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Success_Info()
{
	AI_Output(other,self, " DIA_Garond_Success_15_00 " );	// What about a letter for Lord Hagen?
	AI_Output(self,other, " DIA_Garond_Success_10_01 " );	// We've got ten crates of ore in total - and we've lost twice as many good men.
	AI_Output(self,other, " DIA_Garond_Success_10_02 " );	// You will receive your letter. Lord Hagen needs to hear about this! This valley is cursed...
	CreateInvItems(self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;

	if (((hero.guild ==  GIL_GUR ) || (hero.guild ==  GIL_TPL )) && ( MY_PALADINWATCH  == LOG_Running) && ( IDOLORANQUESTIONFOUR  ==  FALSE )) ;
	{
		IDOLORANQUESTIONFOUR = TRUE;
		B_LogEntry( TOPIC_PALADINWATCH , " In Garond's opinion, the expedition to the Vale of Mines has been a complete fiasco! Those ore deposits that are still available for mining cannot meet the needs of the entire royal army. Garond sent me with a report to Lord Hagen, where he also asks for reinforcements. " );
	};

	B_LogEntry(Topic_MISOLDWORLD, " Garond handed me the letter. This is good evidence! With it I can return to Lord Hagen. " );
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP(XP_ScoutMine);
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
};


instance DIA_Garond_SLD(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_SLD_Condition;
	information = DIA_Garond_SLD_Info;
	permanent = FALSE;
	description = " How about payment? " ;
};


func int DIA_Garond_SLD_Condition()
{
	if((MIS_ScoutMine == LOG_SUCCESS) && (other.guild == GIL_SLD) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_SLD_Info()
{
	AI_Output(other,self, " DIA_Garond_SLD_15_00 " );	// How about payment?
	AI_Output(self,other, " DIA_Garond_SLD_10_01 " );	// Oh, yes, exactly. I owe you some gold. Here is your reward.
	B_GiveInvItems(self,other,ItMi_Gold,500);
};


instance DIA_Garond_Running(C_Info)
{
	npc = PAL_250_Garond;
	nr = 10;
	condition = DIA_Garond_Running_Condition;
	information = DIA_Garond_Running_Info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int DIA_Garond_Running_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter < 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Running_Info()
{
	AI_Output(other,self, " DIA_Garond_Running_15_00 " );	// How are things?
	if(Ore_Counter == 2)
	{
		AI_Output(self,other, " DIA_Garond_Running_10_01 " );	// Now I'm only waiting for news from the last mine - and I hope it will be good news.
	}
	else if(Ore_Counter == 1)
	{
		AI_Output(self,other, " DIA_Garond_Running_10_02 " );	// I need reports on the other two mines. And we'll see.
	}
	else
	{
		AI_Output(self,other, " DIA_Garond_Running_10_03 " );	// You must find our mines. I really need news on how things are going with ore mining.
	};
};


instance DIA_Garond_Gorn(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Gorn_Condition;
	information = DIA_Garond_Gorn_Info;
	permanent = FALSE;
	description = " I want you to free Gorn. " ;
};


func int DIA_Garond_Gorn_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_MiltenOW_Gorn ) && ( Capital ==  2 ) && Npc_Knows Info ( other , DIA_Garond_NeedProof )) .
	{
		return TRUE;
	};
};

func void DIA_Garond_Gorn_Info()
{
	AI_Output(other,self, " DIA_Garond_Gorn_15_00 " );	// I want you to free Gorn.
	AI_Output(self,other, " DIA_Garond_Gorn_10_01 " );	// I can't let him go. He has committed too many crimes and must pay for it.
	AI_Output(other,self, " DIA_Garond_Gorn_15_02 " );	// Can I pay a fine for it?
	AI_Output(self,other, " DIA_Garond_Gorn_10_03 " );	// It's possible - but it will cost you a lot. I want to get a thousand gold for Gorn!
	AI_Output(other,self, " DIA_Garond_Gorn_15_04 " );	// This is a huge amount.
	AI_Output(self,other, " DIA_Garond_Gorn_10_05 " );	// Vina Gorna is also not small! Bring me that gold and I'll set it free.
	MIS_RescueGorn = LOG_Running;
	B_LogEntry(TOPIC_RescueGorn, " Garond demands a thousand gold pieces to free the Gorn. " );
};


instance DIA_Garond_Pay (C_Info) .
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Pay_Condition;
	information = DIA_Garond_Pay_Info;
	permanent = TRUE;
	description = " I want to buy Gorn's freedom. (Pay 1000 coins) " ;
};


func int DIA_Garond_Pay_Condition()
{
	if ((MY_RescueGorn == LOG_Running) && (Chapter ==  2 ) && (Garond_Church ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Garond_Pay_Info()
{
	AI_Output(other,self, " DIA_Garond_Pay_15_00 " );	// I want to buy Gorn freedom.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other, " DIA_Garond_Pay_10_01 " );	// Good. You can go to the Herald and tell him that I am ordering the release of Gorn.
		Garond_Kerkerauf = TRUE ;
		B_LogEntry(TOPIC_RescueGorn, " I have paid Garond. Now I can release the Gorn from the dungeon. Guard Herold will not interfere. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Garond_Pay_10_02 " );	// Then bring me a thousand gold coins.
	};
};


instance DIA_Garond_Perm2(C_Info)
{
	npc = PAL_250_Garond;
	nr = 9;
	condition = DIA_Garond_Perm2_Condition;
	information = DIA_Garond_Perm2_Info;
	permanent = TRUE;
	description = " What are you planning to do next? " ;
};


func int DIA_Garond_Perm2_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Garond_Success ) && ( Capital ==  2 )) ;
	{
		return TRUE;
	};
};

func void DIA_Garond_Perm2_Info()
{
	AI_Output(other,self, " DIA_Garond_Perm2_15_00 " );	// What are you planning to do next?
	AI_Output(self,other, " DIA_Garond_Perm2_10_01 " );	// I've already tried everything. You are my only hope that Lord Hagen will send me reinforcements.
	AI_Output(self,other, " DIA_Garond_Perm2_10_02 " );	// But we will not lose heart and will pray to Innos that he will not leave us without his support in this dark hour.
};


instance DIA_Garond_KAP3_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP3_EXIT_Condition;
	information = DIA_Garond_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_WASGIBTSNEUES (C_Info)
{
	npc = PAL_250_Garond;
	nr = 30;
	condition = DIA_Garond_WASGIBTSNEUES_Condition;
	information = DIA_Garond_WASGIBTSNEW_Info;
	permanent = TRUE;
	description = " What's new? " ;
};


func int DIA_Garond_WASGIBTSNEUES_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEW_Info()
{
	AI_Output(other,self, " DIA_Garond_WASGIBTSNEUES_15_00 " );	// What's new?
	AI_Output(self,other, " DIA_Garond_WASGIBTSNEUES_10_01 " );	// Damn. What are you doing here? I need reinforcements!
	AI_Output(self,other, " DIA_Garond_WASGIBTSNEUES_10_02 " );	// Even Milten left the castle. But I don't need a few people - I need BIG reinforcements!
};


instance DIA_Garond_KAP4_EXIT (C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP4_EXIT_Condition;
	information = DIA_Garond_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_BACKINKAP4(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_BACKINKAP4_Condition;
	information = DIA_Garond_BACKINKAP4_Info;
	permanent = FALSE;
	description = " I'm back. " ;
};


func int DIA_Garond_BACKINKAP4_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Garond_BACKINKAP4_Info()
{
	AI_Output(other,self, " DIA_Garond_BACKINKAP4_15_00 " );	// I'm back.
	AI_Output(self,other, " DIA_Garond_BACKINKAP4_10_01 " );	// I see it myself. What about reinforcements?
	AI_Output(other,self, " DIA_Garond_BACKINKAP4_15_02 " );	// Lord Hagen will arrive as soon as everything is sorted out. So much has happened.
	AI_Output(self,other, " DIA_Garond_BACKINKAP4_10_03 " );	// I don't care. I need troops. Orcs keep coming and coming. We won't last long.
	AI_Output(self,other, " DIA_Garond_BACKINKAP4_10_04 " );	// My people are exhausted and we're running out of provisions.
	AI_Output(other,self, " DIA_Garond_BACKINKAP4_15_05 " );	// The volunteers have arrived.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Garond_BACKINKAP4_10_06 " );	// You mean yourself and your dragon hunter friends, right? Of course, you can help us, but you are too few.
	}
	else
	{
		AI_Output(self,other, " DIA_Garond_BACKINKAP4_10_07 " );	// You mean dragon hunters? Of course, they can help us, but they are too few.
	};
	AI_Output(self,other, " DIA_Garond_BACKINKAP4_10_08 " );	// If Hagen doesn't send his people soon, I can't guarantee anything.
	B_InitNpcGlobals();
	AI_Teleport(DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");
	B_StartOtherRoutine(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;
	B_StartOtherRoutine(Kjorn,"START");
	B_StartOtherRoutine(Godar,"START");
	B_StartOtherRoutine(Hokurn,"START");
	B_StartOtherRoutine(PC_Fighter_DJG,"START");
	B_StartOtherRoutine(Kurgan,"START");
	if(DJG_BiffParty == FALSE)
	{
		B_StartOtherRoutine(Biff,"START");
	};
};


instance DIA_Garond_DragonPlettReport (C_Info)
{
	npc = PAL_250_Garond;
	nr = 11;
	condition = DIA_Garond_DragonPlettBericht_Condition;
	information = DIA_Garond_DragonPlettReport_Info;
	permanent = TRUE;
	description = " About dragons... " ;
};


var int DIA_Garond_DragonPlettReport_NoPerm;

func int DIA_Garond_DragonPlettBericht_Condition()
{
	if ((Capitol >=  4 ) && Npc_KnowsInfo(other,DIA_Garond_BACKINKAP4) && (DIA_Garond_DragonPlettBericht_NoPerm ==  FALSE ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};


var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;

func void DIA_Garond_DragonPlettBericht_Info()
{
	var int CurrentDragonCount;
	var int Drachengeld;
	var int XP_LocalGarond;
	B_LogEntry( TOPIC_DRACHENJAGD , " Garond is obviously interested in how things are going with the dragons, although he pretends not to care. " );
	if(Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_00 " );	// I have news about dragons.
		AI_Output(self,other, " DIA_Garond_DragonPlettBericht_10_01 " );	// Report.
		CurrentDragonCount = 0;
		if ( Npc_IsDead ( SwampDragon ) && ( Garond_SwampDragonKilled_OneTime ==  FALSE ))
		{
			AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_02 " );	// I killed a dragon in the swamp east of here.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
			if((SLD_Rod_is_alive == TRUE) && !Npc_IsDead(DJG_702_Rod))
			{
				Npc_ExchangeRoutine(DJG_702_Rod,"ONDCamp");
				AI_Teleport(DJG_702_Rod,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
			};
			if((SLD_Cipher_is_alive == TRUE) && !Npc_IsDead(DJG_703_Cipher))
			{
				Npc_ExchangeRoutine(DJG_703_Cipher,"ONDCamp");
				AI_Teleport(DJG_703_Cipher,"VORPOSTEN");
			};
		};
		if ( Npc_IsDead ( RockDragon ) && ( Garond_RockDragonKilled_OneTime ==  FALSE ))
		{
			AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_03 " );	// The dragon in the stone fortress south of here is dead.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		if(Npc_IsDead(FireDragon) && (Garond_FireDragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_04 " );	// The fire dragon from the volcano to the south will no longer bother you.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		if ( Npc_IsDead ( IceDragon ) && ( Garond_IcedragonKilled_OneTime ==  FALSE ))
		{
			AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_05 " );	// I was in the western ice region and dealt with the dragon that lived there.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		AI_Output(self,other, " DIA_Garond_DragonPlettBericht_10_06 " );	// This is good news. Here. Take this money. I hope they help you upgrade your gear.
		Dragon Money = CurrentDragonCount * Garond_KilledDragon Money;
		XP_LocalGarond = CurrentDragonCount * XP_Garond_KilledDragon;
		B_GivePlayerXP(XP_LocalGarond);
		CreateInvItems(self,ItMi_Gold,Dragon Money);
		B_GiveInvItems(self,other,ItMi_Gold,Drachengeld);
		Garond_DragonCounter = MIS_KilledDragons;
		if(MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettReport_NoPerm = TRUE ;
		};
	};
	if ((Garond_OricExpert_OneTime ==  FALSE ) && (Npc_IsDead(Oric) ==  FALSE ) && (MY_AllDragonsDead ==  FALSE ))
	{
		AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_07 " );	// Can you tell me more about dragons?
		AI_Output(self,other, " DIA_Garond_DragonPlettBericht_10_08 " );	// I have other things to do. Let my assistant strategist Orik tell you about it.
		B_LogEntry( TOPIC_DRACHENJAGD , " Garond informed me that Officer Orik has more dragon information for me. " );
		Garond_OricExperte_OneTime = TRUE ;
	}
	else if(MIS_AllDragonsDead == FALSE)
	{
		AI_Output(other,self, " DIA_Garond_DragonPlettBericht_15_09 " );	// Have there been any more dragon attacks lately?
		AI_Output(self,other, " DIA_Garond_DragonPlettBericht_10_10 " );	// Fortunately, no. At the moment they are keeping aloof.
	};
};


instance DIA_Garond_AllDragonDead (C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_AllDragonDead_Condition;
	information = DIA_Garond_AllDragonDead_Info;
	permanent = FALSE;
	description = " All dragons are dead. " ;
};


func int DIA_Garond_AllDragonDead_Condition()
{
	if ((MIS_AllDragonsDead ==  TRUE ) && (DIA_Garond_DragonPlettBericht_NoPerm ==  TRUE ) && (Chapter >=  4 ) && ( CHAPTERCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Garond_AllDragonDead_15_00 " );	// All dragons are dead.
	AI_Output(self,other, " DIA_Garond_AllDragonDead_10_01 " );	// Everything?...(incredulously) That is, evil is banished from here forever?
	AI_Output(other,self, " DIA_Garond_AllDragonDead_15_02 " );	// No! Their leader remained.
	AI_Output(self,other, " DIA_Garond_AllDragonDead_10_03 " );	// Weren't dragons the leaders of the orcs?
	AI_Output(other,self, " DIA_Garond_AllDragonDead_15_04 " );	// Yes, they are, but they also have their own owner. We must destroy him too!
	AI_Output(self,other, " DIA_Garond_AllDragonDead_10_05 " );	// Sorry, I can't help you! I'm supposed to guard the ore, and those damned orcs, by the way, are still here too.
	AI_Output(self,other, " DIA_Garond_AllDragonDead_10_06 " );	// You'll have to do it yourself.
	AI_Output(self,other, " DIA_Garond_AllDragonDead_10_07 " );	// May Innos protect you!
	OWDragonsDeadIsDead = TRUE;
};

instance DIA_Garond_JanBecomeSmith(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_JanBecomeSmith_Condition;
	information = DIA_Garond_JanBecomeSmith_Info;
	permanent = TRUE;
	description = " I want to talk about the blacksmith. " ;
};


func int DIA_Garond_JanBecomeSmith_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_Running) && (Chapter >=  4 ) && ( CHAPTERCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info()
{
	AI_Output(other,self, " DIA_Garond_JanBecomeSmith_15_00 " );	// I want to talk about the blacksmith.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_10_01 " );	// Which blacksmith? He dissapeared.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_10_02 " );	// Is he back? Then you can tell him...
	AI_Output(other,self, " DIA_Garond_JanBecomeSmith_15_03 " );	// No, I'm talking about Jan.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self, " DIA_Garond_JanBecomeSmith_15_04 " );	// He's a dragon hunter, like me, and a good blacksmith.
	}
	else
	{
		AI_Output(other,self, " DIA_Garond_JanBecomeSmith_15_05 " );	// One of the dragon hunters. He is a blacksmith.
	};
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_10_06 " );	// This is good. Our previous blacksmith faded, coward.
	AI_Output(other,self, " DIA_Garond_JanBecomeSmith_15_07 " );	// Ian would like to work at the forge.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_10_08 " );	// I understand. So you think I can trust him?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Да.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_10_10 " );	// If you're so sure, then you can vouch for him.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_10_11 " );	// If it causes problems, you will be responsible for it. I agree?
	DobarOut = TRUE;
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	Info_AddChoice(DIA_Garond_JanBecomeSmith, " I'll think about it. " ,DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice(DIA_Garond_JanBecomeSmith, " I vouch for Jan. " ,DIA_Garond_JanBecomeSmith_Yes);
};

func void DIA_Garond_JanBecomeSmith_No()
{
	AI_Output(other,self, " DIA_Garond_JanBecomeSmith_No_15_00 " );	// I'll think about it.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_No_10_01 " );	// How can I trust him when even you doubt him?
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_No_10_02 " );	// If no one can vouch for him, this Yang won't be able to walk to the forge with a cannon shot.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
};

func void DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output(other,self, " DIA_Garond_JanBecomeSmith_Yes_15_00 " );	// I vouch for Jan.
	AI_Output(self,other, " DIA_Garond_JanBecomeSmith_Yes_10_01 " );	// Good. He can work in the forge. But, of course, he must provide my people with swords.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Garond_DobarOut(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_DobarOut_Condition;
	information = DIA_Garond_DobarOut_Info;
	permanent = FALSE;
	description = " You said your blacksmith ran away. " ;
};

func int DIA_Garond_DobarOut_Condition()
{
	if ((DobarOut ==  TRUE ) && (Npc_IsDead(VLK_4107_Conversation) ==  FALSE ) && (ConversationIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Garond_DobarOut_01_00 " );	// You said your blacksmith ran away.
	AI_Output(self,other, " DIA_Garond_DobarOut_01_01 " );	// Yes, and not alone, but together with his assistant Parlaf. However, I don't think they got very far.
	AI_Output(self,other, " DIA_Garond_DobarOut_01_02 " );	// In recent days, there have been more orcs and other creatures in the valley, and these two were not good fighters.
	AI_Output(self,other, " DIA_Garond_DobarOut_01_03 " );	// You know, they may be miserable cowards, but Innos is with them. In any case, the worst - I mean the moment when the orcs take the castle - they will not find.
	AI_Output(other,self, " DIA_Garond_DobarOut_01_04 " );	// Maybe I should look for them?

	if(MIS_JanBecomesSmith == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Garond_DobarOut_01_05 " );	// To be honest, in the current situation, I don't care anymore. We now have a blacksmith.
	}
	else
	{
		AI_Output(self,other, " DIA_Garond_DobarOut_01_06 " );	// To be honest, in the current situation, I don't care anymore.
	};

	AI_Output(self,other, " DIA_Garond_DobarOut_01_07 " );	// But one way or another, you're always running around the valley... well, decide for yourself.
	AI_Output(other,self, " DIA_Garond_DobarOut_01_08 " );	// I understand you.
	DayParlafDead = Wld_GetDay();
	MIS_DobarOut = LOG_Running;
	Log_CreateTopic(TOPIC_DobarOut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DobarOut,LOG_Running);
	B_LogEntry(TOPIC_DobarOut, " A lot of changes have taken place in the castle during my absence, and this applies not only to the dragon hunters who arrived here. Blacksmith Dobar and his assistant Parlaf decided to flee the castle. I could look for them. " );
};

instance DIA_Garond_DobarOut_Done(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_DobarOut_Done_Condition;
	information = DIA_Garond_DobarOut_Done_Info;
	permanent = FALSE;
	description = " I found Parlaf. " ;
};

func int DIA_Garond_DobarOut_Done_Condition()
{
	if((MIS_DobarOut == LOG_Running) && ((ParlafOnPlace == TRUE) || (ParlafOnPlaceDead == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Done_Info()
{
	AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_00 " );	// I found Parlaf.
	AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_01 " );	// Where was this puppy?

	if(ParlafNoExcort == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_02 " );	// Hiding in one of the caves near the castle.
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_03 " );	// He asked me to escort him back to the castle, but unfortunately he died making his way here.
		AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_04 " );	// Well... At least he realized his mistake.
		AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_05 " );	// Can't say I'm going to miss him a lot.
		B_LogEntry(TOPIC_DobarOut, " I told Garond that I couldn't bring Parlaff to the castle alive. " );
		GarondKnowParlaf = TRUE;

		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut, " I think this is the end of my search. " );
		};
	}
	else if(ParlafOnPlaceDead == TRUE)
	{
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_06 " );	// Hiding in one of the caves near the castle. By the time I got to her, he was already dead. Hunger.
		AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_07 " );	// (with sarcasm) What, they didn't feed better there than here? Damn whiners...
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_08 " );	// It is not necessary to reproach the dead already.
		AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_09 " );	// Oh, Innos, we're all half dead here! Are you suggesting that I feel sorry for the cowardly deserter?
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_10 " );	// I'm not suggesting anything.
		B_LogEntry(TOPIC_DobarOut, " I told Garond that I found Parlaf dead. He didn't seem to be very impressed by the news. " );
		GarondKnowParlaf = TRUE;

		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut, " I think this is the end of my search. " );
		};
	}
	else if(ParlafOnPlace == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_11 " );	// Hiding in one of the caves near the castle. It was only thanks to me that he managed to survive.
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_12 " );	// He asked me to escort him back to the castle. I think he realizes his mistake.
		AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_13 " );	// Well... in a different situation, I would throw him in a dungeon. But since he understood the stupidity of his act, I will not do it.
		AI_Output(self,other, " DIA_Garond_DobarOut_Done_01_14 " );	// Moreover, there is something for him to do - let him help Jan in the forge.
		AI_Output(other,self, " DIA_Garond_DobarOut_Done_01_15 " );	// Okay, I'll give it to him.
		B_LogEntry(TOPIC_DobarOut, " I informed Garond that I brought Parlaff back to the castle. He told him to help in the forge again. " );
		GarondKnowParlaf = TRUE;
 
		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut, " I think this is the end of my search. " );
		};
	};
};

instance DIA_Garond_DobarOut_Xone(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_DobarOut_Xone_Condition;
	information = DIA_Garond_DobarOut_Xone_Info;
	permanent = FALSE;
	description = " I found Dobar. " ;
};

func int DIA_Garond_DobarOut_Xone_Condition()
{
	if((MIS_DobarOut == LOG_Running) && (DobarOnPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Xone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Garond_DobarOut_Xone_01_00 " );	// I found Dobar.
	AI_Output(self,other, " DIA_Garond_DobarOut_Xone_01_01 " );	// And what about him?
	AI_Output(other,self, " DIA_Garond_DobarOut_Xone_01_02 " );	// He's dead.
	AI_Output(self,other, " DIA_Garond_DobarOut_Xone_01_03 " );	// I'm not at all surprised by this news. Yes, he was a good blacksmith, but I definitely won’t cry for him.
	GarondKnowDobar = TRUE;
	B_LogEntry(TOPIC_DobarOut, " I told Garond that I found Dobar dead. " );

	if(GarondKnowParlaf == TRUE)
	{
		MIS_DobarOut = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
		B_LogEntry_Quiet(TOPIC_DobarOut, " I think this is the end of my search. " );
	};
};

instance DIA_Garond_CAP5_EXIT (C_Info) .
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP5_EXIT_Condition;
	information = DIA_Garond_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_PERM5(C_Info)
{
	npc = PAL_250_Garond;
	nr = 59;
	condition = DIA_Garond_PERM5_Condition;
	information = DIA_Garond_PERM5_Info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int DIA_Garond_PERM5_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info()
{
	AI_Output(other,self, " DIA_Garond_PERM5_15_00 " );	// How are things?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Garond_PERM5_10_01 " );	// What a mess! Some bastard left the main gate open. Now we are completely defenseless.
		AI_Output(self,other, " DIA_Garond_PERM5_10_02 " );	// Well, I'll get to this traitor...
	}
	else
	{
		AI_Output(self,other, " DIA_Garond_PERM5_10_03 " );	// We're all going to die like flies here if Hagen doesn't arrive soon.
	};
};


instance DIA_Garond_KAP6_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP6_EXIT_Condition;
	information = DIA_Garond_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_MADERZ(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_maderz_condition;
	information = dia_garond_maderz_info;
	permanent = FALSE;
	description = " I have some news for you. " ;
};


func int dia_garond_maderz_condition()
{
	if (( MY_PARENTS  == LOG_Running ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_garond_maderz_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Garond_MadErz_01_00 " );	// I have news for you.
	AI_Output(other,self, " DIA_Garond_MadErz_01_04 " );	// Not far from the ruins of the old city of the orcs, I discovered large reserves of magic ore. At least twenty boxes!
	AI_Output(self,other, " DIA_Garond_MadErz_01_05 " );	// Isn't that true?
	AI_Output(self,other, " DIA_Garond_MadErz_01_07 " );	// If this is true, that's great news!
	AI_Output(self,other, " DIA_Garond_MadErz_01_08 " );	// Twenty boxes is more than what we have now.
	AI_Output(self,other, " DIA_Garond_MadErz_01_10 " );	// However, it's too early to rejoice. Orcs are still here and still besieging our castle.
	AI_Output(self,other, " DIA_Garond_MadErz_01_12 " );	// Now we need to decide what to do next with the ore you found.
	AI_Output(other,self, " DIA_Garond_MadErz_01_13 " );	// I think you should send a couple of your men there first.
	AI_Output(self,other, " DIA_Garond_MadErz_01_14 " );	// You're right - I'll send some soldiers there. After all, this is the only thing I can do for now.
	AI_Output(self,other, " DIA_Garond_MadErz_01_21 " );	// As for you, you deserve a small reward for your labors.
	AI_Output(self,other, " DIA_Garond_MadErz_01_22 " );	// Choose what you need.
	MIS_MADERZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MADERZ,LOG_SUCCESS);
	B_LogEntry( TOPIC_MADERZ , " I have informed Garond of my discovery of a magical ore near the ruins of an old orc city. Garond was delighted to hear the news. He will send some of his men there to transport the ore to the castle. " );
	Info_ClearChoices(dia_garond_maderz);
	Info_AddChoice(dia_garond_maderz, " Take gold. " ,dia_garond_maderz_gold);
	Info_AddChoice(dia_garond_maderz, " Take mana elixir. " ,dia_garond_maderz_mana);
	Info_AddChoice(dia_garond_maderz, " Take elixir of life. " ,dia_garond_maderz_health);
	Info_AddChoice(dia_garond_maderz, " Take Elixir of Agility. " ,dia_garond_maderz_dex);
	Info_AddChoice(dia_garond_maderz, " Take potion of power. " ,dia_garond_maderz_str);
};

func void dia_garond_maderz_gold()
{
	AI_Output(other,self, " DIA_Garond_MadErz_Gold_01_00 " );	// Give me the gold.
	AI_Output(self,other, " DIA_Garond_MadErz_Gold_01_01 " );	// Good! Here, take a thousand gold pieces.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_Garond_MadErz_Gold_01_02 " );	// I hope you spend this money wisely.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_mana()
{
	AI_Output(other,self, " DIA_Garond_MadErz_Mana_01_00 " );	// I'll take a potion of magical energy.
	AI_Output(self,other, " DIA_Garond_MadErz_Mana_01_01 " );	// Good! Here, take it.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(self,other, " DIA_Garond_MadErz_Mana_01_02 " );	// I hope you find it useful.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_str()
{
	AI_Output(other,self, " DIA_Garond_MadErz_Str_01_00 " );	// I want to take a strength potion.
	AI_Output(self,other, " DIA_Garond_MadErz_Str_01_01 " );	// Good! Here, take it.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Garond_MadErz_Str_01_02 " );	// I hope you find it useful.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_dex()
{
	AI_Output(other,self, " DIA_Garond_MadErz_Dex_01_00 " );	// I choose a potion of agility.
	AI_Output(self,other, " DIA_Garond_MadErz_Dex_01_01 " );	// Good! Here, take it.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other, " DIA_Garond_MadErz_Dex_01_02 " );	// I hope you find it useful.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_health()
{
	AI_Output(other,self, " DIA_Garond_MadErz_Health_01_00 " );	// Give me the elixir of life.
	AI_Output(self,other, " DIA_Garond_MadErz_Health_01_01 " );	// Good! Here, take it.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other, " DIA_Garond_MadErz_Health_01_02 " );	// I hope you find it useful.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};


instance DIA_GAROND_CAPTURED(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = dia_garond_captured_condition;
	information = dia_garond_captured_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_garond_captured_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other, " DIA_Garond_Captured_01_00 " );	// Is that you?! How did you manage to get in here?
	AI_Output(other,self, " DIA_Garond_Captured_01_94 " );	// It's a long story! You better tell me - what happened?
	AI_Output(self,other, " DIA_Garond_Captured_01_05 " );	// I don't know! The last thing I remember was a strong blow to the head, after which I lost consciousness.
	AI_Output(self,other, " DIA_Garond_Captured_01_06 " );	// And then I woke up in this cell with the others.
	KNOWABOUTGAROND = TRUE;

	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry( TOPIC_RESCUEGAROND , " I think Lord Hagen would be glad to know that Garond and some of his people are alive. Now I just have to help them get out of this situation. " );
	};
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I infiltrated a fortress captured by orcs. At first, I couldn't believe my eyes when I saw that Garond and some of his men were alive. For some reason, the orcs did not kill them, but simply took them prisoner. I need to think how pull them out. " );
	};
	if(MIS_STURMCASTLE == LOG_Running)
	{
		B_LogEntry( TOPIC_STURMCASTLE , " At first I couldn't believe my eyes when I saw that Garond and some of his people were alive. For some reason, the orcs didn't kill them, but simply took them prisoner. I think that the easiest way to get them out of here is to clear fortress from orcs. " );
	};
	if(DGJMOVEPALADIN == TRUE)
	{
		b_readydgjmove();
	};
};

instance DIA_GAROND_ABOUTSLAVE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_GAROND_ABOUTSLAVE_condition;
	information = DIA_GAROND_ABOUTSLAVE_info;
	permanent = FALSE;
	description = " Where are the other prisoners? " ;
};

func int DIA_GAROND_ABOUTSLAVE_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GAROND_ABOUTSLAVE_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_GAROND_ABOUTSLAVE_01_00 " );	// Where are the rest of the prisoners?
	AI_Output(self,other, " DIA_GAROND_ABOUTSLAVE_01_01 " );	// Orcs took them somewhere. But I don't know exactly where!
	AI_Output(self,other, " DIA_GAROND_ABOUTSLAVE_01_02 " );	// Maybe work hard at some orc mine.
	AI_Output(self,other, " DIA_GAROND_ABOUTSLAVE_01_03 " );	// Or, worse, just to the slaughter.
};

instance DIA_GAROND_FINDAWAY(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = dia_garond_findaway_condition;
	information = dia_garond_findaway_info;
	permanent = FALSE;
	description = " You need to get out of here somehow! " ;
};

func int dia_garond_findaway_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_findaway_info()
{
	AI_Output(other,self, " DIA_Garond_FindAway_01_00 " );	// You need to get out of here!
	AI_Output(self,other, " DIA_Garond_FindAway_01_01 " );	// And how do you suggest we do this?!
	AI_Output(self,other, " DIA_Garond_FindAway_01_02 " );	// The fortress has fallen, and it must be full of orcs now! We won't even make it to the main gate before we're dead.
	AI_Output(other,self, " DIA_Garond_FindAway_01_04 " );	// I'll think of something.
	AI_Output(self,other, " DIA_Garond_FindAway_01_05 " );	// I really hope so. But in my opinion, we have only one way out ...
	AI_Output(self,other, " DIA_Garond_FindAway_01_09 " );	// If you kill all the orcs here and free this fortress!
	AI_Output(self,other, " DIA_Garond_FindAway_01_10 " );	// However, I don't think even you can do that.
};


instance DIA_GAROND_PALADINFREE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_paladinfree_condition;
	information = dia_garond_paladinfree_info;
	permanent = FALSE;
	description = " Let's go! You are all free now. " ;
};


func int dia_garond_paladinfree_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && ((CANFREEPALADIN == TRUE) || (CASTLEISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_garond_paladinfree_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Garond_PaladinFree_01_00 " );	// Let's go! Now you are all free.
	AI_Output(self,other, " DIA_Garond_PaladinFree_01_01 " );	// That is? (uncomprehending) What do you mean?
	if(CASTLEISFREE == TRUE)
	{
		AI_Output(other,self, " DIA_Garond_PaladinFree_01_02 " );	// The castle is in our hands again!
		AI_Output(self,other, " DIA_Garond_PaladinFree_01_03 " );	// Really?! Have you been able to drive the orcs out of this fortress?
		AI_Output(self,other, " DIA_Garond_PaladinFree_01_05 " );	// Incredible! I can't believe!
		AI_Output(self,other, " DIA_Garond_PaladinFree_01_09 " );	// Just let me and my boys out of these damn cages.
		PALADINCASTELFREE = TRUE;
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			MIS_NEWSSURVIVERS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_SUCCESS);
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			MIS_STURMCASTLE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_SUCCESS);
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry( TOPIC_RESCUEGAROND , " I freed Garond and his men from captivity. Now we must get out of this valley as soon as possible. " );
		};
		AI_StopProcessInfos(self);
		if(DGJMOVEPALADIN == TRUE)
		{
			b_readydgjmove();
		};
	}
	else if(CANFREEPALADIN == TRUE)
	{
		AI_Output(other,self, " DIA_Garond_PaladinFree_01_12 " );	// We need to get out of here!
		AI_Output(self,other, " DIA_Garond_PaladinFree_01_13 " );	// Ha! And where do you think we're going? There are only orcs around here!
		AI_Output(other,self, " DIA_Garond_PaladinFree_01_17 " );	// I was able to negotiate with their leader to set you free.
		AI_Output(other,self, " DIA_Garond_PaladinFree_01_18 " );	// So if you don't want to stay here forever, move on. And then the orcs can change their minds!
		AI_Output(self,other, " DIA_Garond_PaladinFree_01_19 " );	// Well, okay - as you say.
		AI_Output(self,other, " DIA_Garond_PaladinFree_01_20 " );	// Just get me and my guys out of these damn cages first.
		PALADINCASTELFREE = TRUE;
		SAFEFLAGPALADIN = TRUE;
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			MIS_NEWSSURVIVERS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_SUCCESS);
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			MIS_STURMCASTLE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_SUCCESS);
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry( TOPIC_RESCUEGAROND , " I freed Garond and his men from captivity. Now we must get out of this valley as soon as possible. " );
		};
		AI_StopProcessInfos(self);
		if(DGJMOVEPALADIN == TRUE)
		{
			b_readydgjmove();
		};
	};
};


instance DIA_GAROND_WHATWAIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_whatwait_condition;
	information = dia_garond_whatwait_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_whatwait_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PALADINCASTELFREE == TRUE) && ((OLDCAMDGATEOPEN_01 == FALSE) || (OLDCAMDGATEOPEN_02 == FALSE) || (OLDCAMDGATEOPEN_03 == FALSE)))
	{
		return TRUE;
	};
};

func void dia_garond_whatwait_info()
{
	AI_Output(self,other, " DIA_Garond_WhatWait_01_00 " );	// Well, how long do we have to sit here? What are you waiting for?!
	AI_Output(self,other, " DIA_Garond_WhatWait_01_01 " );	// Come on, let us out of here!
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PEOPLEFREE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_peoplefree_condition;
	information = dia_garond_peoplefree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_peoplefree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PALADINCASTELFREE == TRUE) && (OLDCAMDGATEOPEN_01 == TRUE) && (OLDCAMDGATEOPEN_02 == TRUE) && (OLDCAMDGATEOPEN_03 == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_peoplefree_info()
{
	AI_Output(self,other, " DIA_Garond_PeopleFree_01_00 " );	// Great! So much better.
	AI_Output(other,self, " DIA_Garond_PeopleFree_01_01 " );	// Now let's go.
	if(CANFREEPALADIN == TRUE)
	{
		AI_Output(other,self, " DIA_Garond_PeopleFree_01_02 " );	// We need to get to the group of paladins that is standing at the exit from this valley as soon as possible.
		AI_Output(self,other, " DIA_Garond_PeopleFree_01_03 " );	// Good. Then let's not waste time - lead us.
		ALLAWAYFROMCASTLE = TRUE;
		Info_ClearChoices(dia_garond_peoplefree);
		Info_AddChoice(dia_garond_peoplefree, " Идем! " ,dia_garond_peoplefree_go);
	}
	else if(CASTLEISFREE == TRUE)
	{
		AI_Output(other,self, " DIA_Garond_PeopleFree_01_05 " );	// We need to get out of this fortress as soon as possible!
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_06");	//Но почему?
		AI_Output(other,self, " DIA_Garond_PeopleFree_01_07 " );	// Soon the orcs will send more reinforcements here again, and then we will all have a very hard time.
		AI_Output(self,other, " DIA_Garond_PeopleFree_01_14 " );	// Hmmm...(thoughtfully) Well, okay.
		AI_Output(self,other, " DIA_Garond_PeopleFree_01_15 " );	// Then let's not waste time - lead us. We're leaving here!
		ALLAWAYFROMCASTLE = TRUE;
		Info_ClearChoices(dia_garond_peoplefree);
		Info_AddChoice(dia_garond_peoplefree, " Идем! " ,dia_garond_peoplefree_go);
	};
};

func void dia_garond_peoplefree_go()
{
	AI_Output(other,self,"DIA_Garond_PeopleFree_Go_01_01");	//Идем!
	AI_StopProcessInfos(self);
	b_paladinawayone();
};


instance DIA_GAROND_PEOPLEAWAY(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_peopleaway_condition;
	information = dia_garond_peopleaway_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_peopleaway_condition()
{
	if((ALLAWAYFROMCASTLE == TRUE) && (GARONDARRIVESEXIT == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_peopleaway_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Garond_PeopleAway_01_00 " );	// Great, we're there! I think we're safe here now.
	AI_Output(other,self, " DIA_Garond_PeopleAway_01_03 " );	// But we still need to move on. Now every minute counts!
	AI_Output(self,other, " DIA_Garond_PeopleAway_01_04 " );	// Agree. Therefore, go through the passage, and we will immediately follow after you.
	AI_Output(other,self, " DIA_Garond_PeopleAway_01_05 " );	// Good. Meet me on the other side.
	ALLAWAYFROMPLACE = TRUE;
	AI_StopProcessInfos(self);
	b_paladinawaytwo();
};


instance DIA_GAROND_WHATWAITAGAIN (C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_whatwaitagain_condition;
	information = dia_garond_whatwaitagain_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_whatwaitagain_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ALLAWAYFROMPLACE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_whatwaitagain_info()
{
	AI_Output(self,other, " DIA_Garond_WhatWaitAgain_01_00 " );	// Come on, go! We will follow you.
	AI_StopProcessInfos(self);
};

instance DIA_Garond_OrcTraitor (C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_OrcTraitor_Condition;
	information = DIA_Garond_OrcTraitor_Info;
	permanent = FALSE;
	description = " I have something here for you. " ;
};

func int DIA_Garond_OrcTraitor_Condition()
{
	if ((MIS_HeroOrcJoin_T2 == LOG_Running) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >=  1 ) && (OrcClanBossLetterDeliver ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Garond_OrcTraitor_Info()
{
	lime int RanGonezPlace;

	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_00 " );	// I have something here for you.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_01 " );	// I hope this is something really important, and not some other nonsense!
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_02 " );	// Here, take a look.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_03 " );	// And what is this?
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_04 " );	// This is a message from an orc warlord to one of their mountain tribe leaders. Well, are you already interested?
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_05 " );	// (with interest) Come on, let me take a look...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_06 " );	// But this message is written in orc language!
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_07 " );	// Of course, the orc wrote it! Can you find an interpreter?
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_08 " );	// Don't, I'll read it myself... (irritated) Over the long years of war with these creatures, I began to understand their language a little.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_09 " );	// (reading) I can't believe my eyes! What you brought is really extremely important information!
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_10 " );	// And what is written there?
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_11 " );	// It looks like the orcs are planning to storm the castle soon, and are gathering additional forces for this.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_12 " );	// They want to take us by surprise by attacking from several directions at once. But now it looks like they won't be able to.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_13 " );	// I'll have the walls doubled and more defensive barriers installed.
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_14 " );	// Do you have enough people for this?
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_15 " );	// Enough for now. Although we are in a difficult situation, we have sufficient manpower to keep the defense on several sides at once.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_16 " );	// Of course, without additional fortifications, this would be much more difficult.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_17 " );	// But we now have enough time to prepare well for the assault.
	AI_Output(other,self, " DIA_Garond_OrcTraitor_01_18 " );	// I'm glad this information was useful to you.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_19 " );	// Your help in this matter cannot be overestimated, and I thank you on behalf of all the paladins that are in this fortress!
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_20 " );	// Here, take this as a reward...
 	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_21 " );	// I think you know that our supplies are extremely scarce.
	AI_Output(self,other, " DIA_Garond_OrcTraitor_01_22 " );	// But I just can't thank you enough for what you've done for us.
	OrcTraitor = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Instead of delivering Ur-Karras's message to the Chieftain of the Highrock clan, I took it to the human stronghold. As it turned out, the orcs are preparing for a new assault and are seeking help from other clans to do this. As expected, this The information proved to be very important to the paladins! However, now that I've been betrayed, I don't think I should return to the orc city. Surely my presence in the fortress has not gone unnoticed by them, and they will send someone to Ur-Karras to report my treachery (Unless I can intercept the messenger before he tells Ur-Karras everything. I must hurry, because I probably have very little time left for this...");

	RanGonezPlace = Hlp_Random( 100 );
	DayGoneZStart = Wld_GetDay();

	if(RanGonezPlace >= 60)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_01");
	}
	else if(RanGonezPlace >= 30)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_02");
	}
	else if(RanGonezPlace >= 0)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_03");
	};
};

instance DIA_Garond_PICKPOCKET(C_Info)
{
	npc = PAL_250_Garond;
	nr = 900;
	condition = DIA_Garond_pickpocket_condition;
	information = DIA_Garond_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Garond_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_pickpocket_info()
{
	Info_ClearChoices(DIA_Garond_pickpocket);
	Info_AddChoice(DIA_Garond_pickpocket,Dialog_Back,DIA_Garond_pickpocket_back);
	Info_AddChoice(DIA_Garond_pickpocket, DIALOG_PICKPOCKET ,DIA_Garond_pickpocket_doit);
};

func void DIA_Garond_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 150)
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
		B_GiveInvItems(self,other,ItKe_Garond,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Garond_pickpocket);
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

func void DIA_Garond_pickpocket_back()
{
	Info_ClearChoices(DIA_Garond_pickpocket);
};
