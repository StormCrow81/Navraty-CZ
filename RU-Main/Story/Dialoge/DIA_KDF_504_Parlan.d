var int DAY_Parlan_WORK_perm;

instance DIA_Parlan_Kap1_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if (chapter <=  1 )
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Parlan_Hammer;

func void B_Parlan_HAMMER()
{
	AI_Output(self,other, " DIA_Parlan_HAMMER_05_00 " );	// Wait a minute, my son!
	AI_Output(self,other, " DIA_Parlan_HAMMER_05_01 " );	// Rumor has it that a valuable artifact has 'disappeared' from our shrine.
	AI_Output(self,other, " DIA_Parlan_HAMMER_05_02 " );	// I don't want to hear anything about this - I'm waiting for him to return to his rightful place.
	Parlan_Hammer = TRUE;
};


var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;

instance DIA_Parlan_PM Debt (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Parlan_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	concatText = "The Fire Mages outlawed you! " ;
	AI_Print(concatText);
};

func void dia_parlan_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	concatText = "The Fire Mages outlawed you! " ;
	AI_Print(concatText);
};

func void DIA_Parlan_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	if ((Talking_Hammer ==  FALSE ) && (Hammer_Taken ==  TRUE ) && (other.guild ==  GIL_NOV ) && (Npc_IsDead(Garwig) ==  FALSE ))
	{
		B_Parlan_HAMMER();
	};
	AI_Output(self,other, " DIA_Parlan_PMSchulden_05_00 " );	// You broke the laws of our community.
	temp1 = 0 ;
	if(GLOBAL_MONASTERY_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_MONASTERY_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_MONASTERY_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_MONASTERY_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_36 " );	// You shouldn't have done this after all. I warned you.
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_37 " );	// Innos does not tolerate murderers! Killing on our brothers, you can no longer count on his mercy!
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_38 " );	// His wrath will punish you faster than you realize it...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_39 " );	// Die, this is the will of Innos!
		}
		else if(GLOBAL_MONASTERY_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_40 " );	// You shouldn't have done this after all. I warned you.
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_41 " );	// By constantly attacking our brothers, you can no longer count on his mercy!
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_42 " );	// His wrath will punish you faster than you realize it...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_43 " );	// Die, this is the will of Innos!
		}
		else if(GLOBAL_MONASTERY_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_44 " );	// You shouldn't have done this after all. I warned you.
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_45 " );	// Constantly stealing from our brothers, you can no longer count on his mercy!
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_46 " );	// His wrath will punish you faster than you realize it...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other, " DIA_Parlan_PMSchulden_08_47 " );	// Die, this is the will of Innos!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the Fire Mages because of my constant outrages in the monastery. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Постой!!!...",dia_parlan_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
		{
			AI_Output(self,other, " DIA_Parlan_PMSchulden_05_01 " );	// And although you've already been blamed, you're only adding to your guilt.
			if (parlan_debts <  1000 )
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_02 " );	// Your sin can only be forgiven by donating a large amount to the monastery.
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
				if(diff > 0)
				{
					parlan_debt = parlan_debt + (diff *  250 );
				};
				if (parlan_debt <=  1000 )
				{
					B_Say_Gold(self,other,Parlan_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_03 " );	// Who do you think you are? Pray to Innos to grant forgiveness of your sins!
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00A");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
				if(diff > 0)
				{
					parlan_debt = parlan_debt + (diff *  250 );
				};
				if (parlan_debt <=  1000 )
				{
					B_Say_Gold(self,other,Parlan_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
		{
			AI_Output(self,other, " DIA_Parlan_PMSchulden_05_04 " );	// Your situation has changed.
			if (Parlan_LastPetzCrime ==  CRIME_MURDER )
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_05 " );	// There are no more witnesses to your murder!
				GLOBAL_MONASTERY_MURDER = GLOBAL_MONASTERY_MURDER - 1;
				if(GLOBAL_MONASTERY_MURDER < 0)
				{
					GLOBAL_MONASTERY_MURDER = 0;
				};
			};
			if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_06 " );	// No one can testify that you stole!
				GLOBAL_MONASTERY_THEFT = GLOBAL_MONASTERY_THEFT - 1;
				if(GLOBAL_MONASTERY_THEFT < 0)
				{
					GLOBAL_MONASTERY_THEFT = 0;
				};
			};
			if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_07 " );	// No one else can testify that you took part in the fight!
				GLOBAL_MONASTERY_ATTACK = GLOBAL_MONASTERY_ATTACK - 1;
				if(GLOBAL_MONASTERY_ATTACK < 0)
				{
					GLOBAL_MONASTERY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_08 " );	// All accusations against you are not confirmed.
			};
			AI_Output(self,other, " DIA_Parlan_PMSchulden_05_09 " );	// You may be able to trick me, but Innos sees everything!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_10 " );	// Your sins are forgotten.
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_11 " );	// And make sure we don't come back to this conversation again!
				parlan_debt = 0 ;
				Parlan_LastPetzCounter = 0;
				Parlan_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_12 " );	// You must pay a fine. Such is the will of Innos!
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00B");	//Сколько?
				if (parlan_debt <=  1000 )
				{
					B_Say_Gold(self,other,Parlan_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other, " DIA_Parlan_PMSchulden_05_13 " );	// Get rid of your guilt!
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Parlan_PMSchulden);
			Info_ClearChoices(DIA_Parlan_PETZMASTER);
			Info_AddChoice(DIA_Parlan_PMSchulden, " I don't have enough gold! " ,DIA_Parlan_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Parlan_PMSchulden, " How Much Should I Pay? " ,DIA_Parlan_PMSchulden_HowMuchAgain);
			if (Npc_HasItems(other,ItMi_Gold) >= Parlan_Debts)
			{
				Info_AddChoice(DIA_Parlan_PMSchulden, " I want to pay a fine. " ,DIA_Parlan_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	AI_Output(other,self, " DIA_Parlan_PMSchulden_HowMuchAgain_15_00 " );	// How much do I have to pay?
	if (parlan_debt <=  1000 )
	{
		B_Say_Gold(self,other,Parlan_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden, " I don't have enough gold! " ,DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden, " How Much Should I Pay? " ,DIA_Parlan_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other,ItMi_Gold) >= Parlan_Debts)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden, " I want to pay a fine. " ,DIA_Parlan_PETZMASTER_PayNow);
	};
};


instances of DIA_Parlan_PETZMASTER (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string contexttextdebts;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	if ((Talking_Hammer ==  FALSE ) && (Hammer_Taken ==  TRUE ) && (other.guild ==  GIL_NOV ) && (Npc_IsDead(Garwig) ==  FALSE ))
	{
		B_Parlan_HAMMER();
	};
	parlan_debt = 0 ;
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_00 " );	// We haven't even had time to talk yet, and you've already shouldered the burden of guilt!
	};
	temp1 = 0 ;
	if(GLOBAL_MONASTERY_MURDER > 2)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_MONASTERY_THEFT > 5)
	{
		temp1 = 1 ;
	};
	if(GLOBAL_MONASTERY_ATTACK > 5)
	{
		temp1 = 1 ;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_MONASTERY_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_48 " );	// You shouldn't have done this after all. I warned you.
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_49 " );	// Innos does not tolerate murderers! Killing on our brothers, you can no longer count on his mercy!
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_50 " );	// His wrath will punish you faster than you realize it...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_51 " );	// Die, this is the will of Innos!
		}
		else if(GLOBAL_MONASTERY_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_52 " );	// You shouldn't have done this after all. I warned you.
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_53 " );	// By constantly attacking our brothers, you are draining Innos' cup of mercy!
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_54 " );	// His wrath will punish you faster than you realize it...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_55 " );	// Die, this is the will of our lord!
		}
		else if(GLOBAL_MONASTERY_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_56 " );	// You shouldn't have done this after all. I warned you.
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_57 " );	// Constantly stealing from our brothers, you leave Innos no choice!
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_58 " );	// His wrath will punish you faster than you realize it...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_59 " );	// Die, this is the will of Innos!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the Firebenders with my constant outrages in the monastery. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PETZMASTER, " Wait!...(it's time to leave) " ,dia_parlan_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_01 " );	// You're being charged with the worst of all crimes - murder!
			Parlan_Debts = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_02 " );	// And you took on the burden of new guilt!
			};
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_03 " );	// If it were up to me to decide, you would be cursed on the spot! You are a killer!
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_04 " );	// But if you pay the fine for your crime. However ... (thinking) We will forgive you your sins!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_05 " );	// Theft is a violation of the laws of the monastery!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_06 " );	// In addition, you broke other laws.
			};
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_07 " );	// These transgressions must be punished. Such is the law of Innos!
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_08 " );	// You must pay a fine to the monastery!
			Parlan_Debts = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_09 " );	// We don't tolerate fights in the monastery. Such behavior violates our rules!
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_10 " );	// And why did you kill our sheep?
			};
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_11 " );	// We live here in accordance with the laws. They apply to you too!
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_12 " );	// For your crime, you must make a donation to the monastery.
			Parlan_Debts = B_GetTotalPetzCounter(self) *  750 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other, " DIA_Parlan_PETZMASTER_05_13 " );	// You killed our sheep. You must pay compensation for her!
			parlan_debt = 250 ;
		};
		AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Сколько?
		if (parlan_debt <=  1000 )
		{
			B_Say_Gold(self,other,Parlan_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PETZMASTER, " I don't have enough gold! " ,DIA_Parlan_PETZMASTER_PayLater);
		if (Npc_HasItems(other,ItMi_Gold) >= Parlan_Debts)
		{
			Info_AddChoice(DIA_Parlan_PETZMASTER, " I want to pay a fine. " ,DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self, " DIA_Parlan_PETZMASTER_PayNow_15_00 " );	// I want to pay a fine!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Debts);
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_PayNow_05_01 " );	// I accept your donation. Your sins are forgotten. I hope Innos gives you the wisdom not to make the same mistakes again.
	B_GrantAbsolution(LOC_MONASTERY);
	parlan_debt = 0 ;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self, " DIA_Parlan_PETZMASTER_PayLater_15_00 " );	// I don't have enough gold!
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_PayLater_05_01 " );	// You should have thought about this before sinning.
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_PayLater_05_02 " );	// Maybe this will teach you something. Don't make trouble and you won't have to pay.
	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	AI_StopProcessInfos(self);
};

var int ParlanPissOff;

instances of DIA_Parlan_NoEnter (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_NoEnter_Condition;
	information = DIA_Parlan_NoEnter_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_NoEnter_Condition()
{
	if (CanEnterKloster ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Parlan_NoEnter_Info()
{
	AI_GotoNpc(self,other);
	AI_Output(self,other, " DIA_Parlan_NoEnter_01_00 " );	// (terribly) STOP! I haven't seen you here before.
	AI_Output(self,other, " DIA_Parlan_NoEnter_01_01 " );	// How did you even manage to get here?
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter, " I just climbed over the wall. " ,DIA_Parlan_NoEnter_UpWall);
	Info_AddChoice(DIA_Parlan_NoEnter, " I went down the mountain " ,DIA_Parlan_NoEnter_Mount);
	Info_AddChoice(DIA_Parlan_NoEnter, " Acolyte Pedro let me in. " ,DIA_Parlan_NoEnter_Pedro);

	if(RhetorikSkillValue[1] >= 10)
	{
		Info_AddChoice(DIA_Parlan_NoEnter, " What is this place? " ,DIA_Parlan_NoEnter_NoKill);
	};
};

func void DIA_Parlan_NoEnter_UpWall()
{
	AI_Output(other,self, " DIA_Parlan_NoEnter_UpWall_01_00 " );	// I just climbed over the wall.
	AI_Output(self,other, " DIA_Parlan_NoEnter_UpWall_01_01 " );	// (angrily) Yes, you climbed over! And this is very bad for you.
	AI_Output(self,other, " DIA_Parlan_NoEnter_UpWall_01_02 " );	// Do you even know what this place is?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_UpWall_01_03");	//И что?
	AI_Output(self,other, " DIA_Parlan_NoEnter_UpWall_01_04 " );	// (furious) It's a Fire Mage Monastery! The sacred abode of Innos himself!
	AI_Output(self,other, " DIA_Parlan_NoEnter_UpWall_01_05 " );	// Only mages and acolytes of this monastery can be here.
	AI_Output(self,other, " DIA_Parlan_NoEnter_UpWall_01_06 " );	// Sorry, but you leave me no choice.
	AI_Output(self,other, " DIA_Parlan_NoEnter_UpWall_01_07 " );	// You will pay for your sacrilege with your own life!
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_50 " );		// Innos' wrath will punish you faster than you realize it...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter, " Hey, I'm posting!.. " ,DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_Mount()
{
	AI_Output(other,self, " DIA_Parlan_NoEnter_Mount_01_00 " );	// I came down from the mountains.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Mount_01_01 " );	// (angrily) What?! What the hell are you talking about!
	AI_Output(self,other, " DIA_Parlan_NoEnter_Mount_01_02 " );	// Do you even know what this place is?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_Mount_01_03");	//И что?
	AI_Output(self,other, " DIA_Parlan_NoEnter_Mount_01_04 " );	// (furious) It's a Fire Mage Monastery! The sacred abode of Innos himself!
	AI_Output(self,other, " DIA_Parlan_NoEnter_Mount_01_05 " );	// Only mages and acolytes of this monastery can be here.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Mount_01_06 " );	// Sorry, but you leave me no choice.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Mount_01_07 " );	// You will pay for your sacrilege with your own life!
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_50 " );		// Innos' wrath will punish you faster than you realize it...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter, " Hey, I'm posting!.. " ,DIA_Parlan_NoEnter_Attack);
};

func void DAY_Parlan_NoEnter_Pedro()
{
	AI_Output(other,self, " DIA_Parlan_NoEnter_Pedro_01_00 " );	// Acolyte Pedro let me in.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Pedro_01_01 " );	// What?! (angrily) You're lying to me! He couldn't do it.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Pedro_01_02 " );	// Besides, I didn't see you enter through the main gate of the monastery.
	AI_Output(other,self, " DIA_Parlan_NoEnter_Pedro_01_03 " );	// So what?
	AI_Output(self,other, " DIA_Parlan_NoEnter_Pedro_01_04 " );	// (furious) And the fact that this is a monastery of fire magicians! The sacred abode of Innos himself!
	AI_Output(self,other, " DIA_Parlan_NoEnter_Pedro_01_05 " );	// Only mages and acolytes of this monastery can be here.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Pedro_01_06 " );	// Sorry, but you leave me no choice.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Pedro_01_07 " );	// You will pay for your sacrilege with your own life!
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_50 " );		// Innos' wrath will punish you faster than you realize it...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter, " Hey, I'm posting!.. " ,DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_NoKill()
{
	AI_Output(other,self, " DIA_Parlan_NoEnter_NoKill_01_00 " );	// What is this place?
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_01 " );	// (angrily) What?! Are you kidding me?
	AI_Output(other,self, " DIA_Parlan_NoEnter_NoKill_01_02 " );	// But I really have no idea where I'm at.
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_03 " );	// (furious) It's a Fire Mage Monastery! The sacred abode of Innos himself!
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_04 " );	// Only mages and acolytes of this monastery can be here.
	AI_Output(other,self, " DIA_Parlan_NoEnter_NoKill_01_05 " );	// Monastery of Innos?
	AI_Output(other,self, " DIA_Parlan_NoEnter_NoKill_01_06 " );	// Then I deserve only death, master!
	AI_Output(other,self, " DIA_Parlan_NoEnter_NoKill_01_07 " );	// Kill me - for, without realizing it, I have sinned by breaking his law.
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_08 " );	// You yourself confessed your guilt and ask to punish you?
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_09 " );	// Amazing!
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_10 " );	// Okay, I'll spare your life and let you be here.
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_11 " );	// But for this you will have to work for the good of our monastery.
	AI_Output(self,other, " DIA_Parlan_NoEnter_NoKill_01_12 " );	// And don't even think about getting off lightly.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	CanEnterKloster = TRUE;
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter, " Of course master. " ,DIA_Parlan_NoEnter_Quest);
};

func void DIA_Parlan_NoEnter_Quest()
{
	AI_Output(other,self, " DIA_Parlan_NoEnter_Quest_01_00 " );	// Sure, master.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_01 " );	// Then listen carefully. The matter is rather difficult.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_02 " );	// Do you know Lemar, the usurer?


	if (Npc_KnowsInfo(hero,DIA_Lehmar_SORRY) ==  TRUE )
	{
		AI_Output(other,self, " DIA_Parlan_NoEnter_Quest_01_03 " );	// Of course. What's the matter?
	}
	else
	{
		AI_Output(other,self, " DIA_Parlan_NoEnter_Quest_01_04 " );	// No. I do not know him.
	};


	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_05 " );	// One of our magicians, in his naivety or stupidity, pawned one very valuable thing from him.
	AI_Output(other,self, " DIA_Parlan_NoEnter_Quest_01_06 " );	// What's the thing?
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_07 " );	// It doesn't matter. But by all means, she must be returned to the monastery, and as soon as possible!
	AI_Output(other,self, " DIA_Parlan_NoEnter_Quest_01_08 " );	// What's the problem?
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_09 " );	// Lemar decided to keep her and flatly refused to do business with us.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_10 " );	// And you're not from a monastery. You have a chance to find out where Lemar is hiding her.
	AI_Output(other,self, " DIA_Parlan_NoEnter_Quest_01_11 " );	// Do you want me to steal it for you?
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_12 " );	// I don't care how you do it - the main thing is that you return it to the monastery!
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_13 " );	// Is everything clear?
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_14");	//Вполне.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_15 " );	// Then go ahead and try not to drag it out.
	AI_Output(self,other, " DIA_Parlan_NoEnter_Quest_01_16 " );	// Here, take this key. You don't have to climb walls anymore to get here.
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	MIS_LemarTheft = LOG_Running;
	Log_CreateTopic(Topic_LemarTheft,LOG_MISSION);
	Log_SetTopicStatus(Topic_LemarTheft,LOG_Running);
	) ; _ _ _
	AI_StopProcessInfos(self);
};

func void DIA_Parlan_NoEnter_Attack()
{
	if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
	{
		CreateInvItems(self,ItRu_Pyrokinesis,1);
	};
	AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_59 " );	// Die, this is the will of Innos!
	ParlanPissOff = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instances DIA_Parlan_NoEnter_PissOff (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_NoEnter_PissOff_Condition;
	information = DIA_Parlan_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Parlan_NoEnter_PissOff_Condition()
{
	if ((CanEnterMonastery ==  FALSE ) && (TalkPissOff ==  TRUE ) && (MY_LemarTheft ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Parlan_NoEnter_PissOff_Info()
{
	if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
	{
		CreateInvItems(self,ItRu_Pyrokinesis,1);
	};

	AI_Output(self,other, " DIA_Parlan_PETZMASTER_08_59 " );	// Die, this is the will of Innos!
	ParlanPissOff = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Parlan_LemarTheft(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_LemarTheft_Condition;
	information = DIA_Parlan_LemarTheft_Info;
	permanent = FALSE;
	description = " I brought back the lost relic. " ;
};


func int DIA_Parlan_LemarTheft_Condition()
{
	if((Npc_HasItems(hero,ItMi_ParlanRelic_MIS) >= 1) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LemarTheft_Info()
{	
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Parlan_LemarTheft_01_00 " );	// I brought back the lost relic.
	AI_Output(self,other, " DIA_Parlan_LemarTheft_01_01 " );	// True? Then give it to me immediately!
	AI_Output(other,self, " DIA_Parlan_LemarTheft_01_02 " );	// Sure, master.
	B_GiveInvItems(other,self,ItMi_ParlanRelic_MIS,1);
	Npc_RemoveInvItems(self,ItMi_ParlanRelic_MIS,1);
	AI_Output(self,other, " DIA_Parlan_LemarTheft_01_03 " );	// Good. Now I will see to it that she never again leaves the walls of the monastery.

	if ((hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ) && (hero.guild !=  GIL_NOV ) && (hero.guild !=  GIL_PAL ))
	{
		AI_Output(self,other, " DIA_Parlan_LemarTheft_01_04 " );	// As for you, please accept my sincere thanks.
		AI_Output(self,other, " DIA_Parlan_LemarTheft_01_05 " );	// I see that I did not make a mistake in my choice.
		AI_Output(self,other, " DIA_Parlan_LemarTheft_01_06 " );	// Now you can stay here if you want.
		AI_Output(self,other, " DIA_Parlan_LemarTheft_01_07 " );	// However, remember that access to some parts of the monastery is still closed to you.
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_LemarTheft_01_09 " );	// As for you, please accept my sincere gratitude.
		AI_Output(self,other, " DIA_Parlan_LemarTheft_01_10 " );	// May Innos bless you!
	};

	MIS_LemarTheft = LOG_Success;
	Log_SetTopicStatus(Topic_LemarTheft,LOG_Success);
	B_LogEntry(Topic_LemarTheft, " Parlan was pleased that I managed to snatch the relic of the monastery from Lemar's hands. " );
	AI_StopProcessInfos(self);
};

instance DIA_Parlan_WELCOME(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_WELCOME_Condition;
	information = DIA_Parlan_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_WELCOME_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self,other, " DIA_Parlan_WELCOME_05_09 " );	// When this is over, we'll talk about your work here at the monastery.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other, " DIA_Addon_Parlan_WELCOME_05_00 " );	// Take your offering to Gorax. He will manage them.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other, " DIA_Parlan_WELCOME_05_00 " );	// Welcome, new acolyte. I am Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//А я...
	AI_Output(self,other, " DIA_Parlan_WELCOME_05_02 " );	// ABOVE!...(interrupts) It doesn't matter who you used to be. You are now a servant of Innos. Only this matters.
	AI_Output(self,other, " DIA_Parlan_WELCOME_05_03 " );	// And with acceptance into the Brotherhood of Fire, all your previous transgressions will be forgotten.
	AI_Output(self,other, " DIA_Parlan_WELCOME_05_04 " );	// May Innos bless this man who gave his life to serve Him, and wash away all his sins.
	AI_Output(other,self, " DIA_Parlan_WELCOME_15_05 " );	// And now what?
	AI_Output(self,other, " DIA_Parlan_WELCOME_05_06 " );	// First of all, you must fulfill your duties as an acolyte. You will work and serve the Brotherhood.
	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Community, LOG_MISSION );
	Log_SetTopicStatus(Topic_Community,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft, " As a novice, I am required to do work in the monastery. " );
	INNOSCRIMECOUNT = 0;

	if(INNOSPRAYCOUNT < 0)
	{
		INNOSPRAYCOUNT = 0;
	}
	else
	{
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	};

	BELIARPRAYCOUNT = BELIARPRAYCOUNT - 5;

	if (Pedro_NOV_Recording_LostInnosStatue_Daron ==  FALSE )
	{
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other, " DIA_Parlan_WELCOME_05_07 " );	// But first take your sheep to Opolos, he will take care of it.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other, " DIA_Parlan_WELCOME_05_08 " );	// You can give all your gold to Gorax, our steward. You will find it in the winery.
			B_DIA_Speech_WELCOME_GoForTribute();
		};
	}
	else if(DIA_Gorax_GOLD_perm == FALSE)
	{
		B_DIA_Parlan_WELCOME_BringTribute2Gorax();
		B_DIA_Speech_WELCOME_GoForTribute();
	};
};


instance DIA_Parlan_Auge (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Auge_Condition;
	information = DIA_Parlan_Auge_Info;
	permanent = FALSE;
	description = " I'm looking for the Eye of Innos. " ;
};


func int DIA_Parlan_Auge_Condition()
{
	if (chapter <=  2 )
	{
		return TRUE;
	};
};

func void DIA_Parlan_Eye_Info()
{
	AI_Output(other,self, " DIA_Parlan_Auge_15_00 " );	// I'm looking for the Eye of Innos.
	AI_Output(self,other, " DIA_Parlan_Auge_05_01 " );	// I don't know who told you about it, but no one dares to touch this divine artifact.
	AI_Output(other,self, " DIA_Parlan_Auge_15_02 " );	// Where is the Eye of Innos stored?
	AI_Output(self,other, " DIA_Parlan_Auge_05_03 " );	// Very few people know this secret. Try to find it and you won't succeed.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = " Tell me about the Eye of Innos. " ;
};


func int DIA_Parlan_Amulett_Condition()
{
	if ((Capital <=  2 ) && Npc_KnowsInfo(other,DIA_Language_Age)) .
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other,self, " DIA_Parlan_Amulett_15_00 " );	// Tell me about the Eye of Innos.
	AI_Output(self,other, " DIA_Parlan_Amulett_05_01 " );	// Good. The Eye of Innos contains a particle of the divine power of Innos. Only ONE chosen servant of Innos may wear this amulet.
	AI_Output(self,other, " DIA_Parlan_Amulett_05_02 " );	// It was created to protect us from the forces of Evil when the time comes.
};


instance DIA_Parlan_Hagen (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = " I need to speak to the paladin commander! " ;
};


func int DAY_Parlan_Hagen_Condition()
{
	if ((Chapter <=  2 ) && (hero.guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DAY_Parlan_Hagen_Info()
{
	AI_Output(other,self, " DIA_Parlan_Hagen_15_00 " );	// I need to talk to the paladin commander!
	AI_Output(self,other, " DIA_Parlan_Hagen_05_01 " );	// Lord Hagen doesn't accept novices - only mages are allowed to see him.
};

instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = " How can I serve the community? " ;
};

func int DIA_Parlan_WORK_Condition()
{
	if ((Capital ==  1 ) && (Npc_KnowsInfo(other,DIA_Speech_KNOWSJUDGE) ==  FALSE ) && Npc_KnowsInfo(other,DIA_Speech_WELCOME) && (DIA_Speech_WORK_perm ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other,self, " DIA_Parlan_WORK_15_00 " );	// How can I serve the community?
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other, " DIA_Parlan_WELCOME_05_06 " );	// First of all, you must fulfill your duties as an acolyte. You will work and serve the Brotherhood.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other, " DIA_Parlan_WELCOME_05_07 " );	// But first take your sheep to Opolos, he will take care of it.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			if (Pedro_NOV_Recording_LostInnosStatue_Daron ==  TRUE )
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Speech_WELCOME_GoForTribute();
			}
			else
			{
				AI_Output(self,other, " DIA_Parlan_WELCOME_05_08 " );	// You can give all your gold to Gorax, our steward. You will find it in the winery.
				AI_Output(self,other, " DIA_Parlan_WELCOME_05_09 " );	// When this is over, we'll talk about your work here at the monastery.
			};
		};
		AI_StopProcessInfos(self);
	}
	else  if (Wld_IsTime( 22 , 0 , 7 , 30 ))
	{
		AI_Output(self,other, " DIA_Parlan_WORK_NIGHT_05_01 " );	// Now is the time of peace. The work of novices begins early in the morning and continues until dark.
		AI_Output(self,other, " DIA_Parlan_WORK_NIGHT_05_02 " );	// You should sleep too. Come back to me when it's time to work.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_WORK_05_03 " );	// Talk to other mages. They will give you orders.
		AI_Output(self,other, " DIA_Parlan_WORK_05_04 " );	// I will oversee your work, and if you do well, you will be allowed to enter the library to study the teachings of Innos.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterWork = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft, " If I complete all the mage tasks, I will be granted the right to visit the library. " );
		AI_Output(self,other, " DIA_Parlan_WORK_01_01 " );	// Yes, and I almost forgot... (grouchily) You need a novice robe.
		AI_Output(other,self, " DIA_Parlan_WORK_01_02 " );	// Is there any problem with this?
		AI_Output(self,other, " DIA_Parlan_WORK_01_03 " );	// The thing is, we've run out of the fabric your brothers always used to make newbie clothes.
		AI_Output(self,other, " DIA_Parlan_WORK_01_04 " );	// For many years we purchased this fabric from the guild of merchants of Khorinis.
		AI_Output(self,other, " DIA_Parlan_WORK_01_05 " );	// But due to the war with the orcs, supplies from the continent have not been available for a very long time, and our supplies have come to an end.
		AI_Output(other,self, " DIA_Parlan_WORK_01_06 " );	// And what do we do now?
		AI_Output(self,other, " DIA_Parlan_WORK_01_07 " );	// Good question. That's what! Find Merchant Erol and ask him if he has any leftover goods.
		AI_Output(other,self, " DIA_Parlan_WORK_01_08 " );	// Why him?
		AI_Output(self,other, " DIA_Parlan_WORK_01_09 " );	// Erol himself was once a member of the merchants' guild. He was one of the largest cloth merchants in all of Khorinis.
		AI_Output(self,other, " DIA_Parlan_WORK_01_10 " );	// We have already contacted other merchants, but all to no avail.
		AI_Output(self,other, " DIA_Parlan_WORK_01_11 " );	// So talk to him.
		Log_CreateTopic(TOPIC_ROBAMATERIAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ROBAMATERIAL,LOG_Running);
		MIS_ROBAMATERIAL = LOG_Running;
		B_LogEntry( TOPIC_ROBAMATERIAL , " Master Parlan didn't give me a novice robe because he doesn't have the right material to make it. I should see if Erol has the right fabric. " );
	};
};

instances DIA_PARLAN_ROBAMATERIAL (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_PARLAN_ROBAMATERIAL_condition;
	information = DIA_PARLAN_ROBAMATERIAL_info;
	permanent = TRUE;
	description = " I brought fabric for the robe. " ;
};

func int DIA_PARLAN_ROBAMATERIAL_condition()
{
	if((MIS_ROBAMATERIAL == LOG_Running) && (Npc_HasItems(other,itmi_novmaterial) >= 1))
	{
		return TRUE;
	};
};

func void DIA_PARLAN_ROBAMATERIAL_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_PARLAN_ROBAMATERIAL_01_01 " );	// I brought fabric for the robe.
	AI_Output(self,other, " DIA_PARLAN_ROBAMATERIAL_01_02 " );	// Show her.
	B_GiveInvItems(other,self,itmi_novmaterial,1);
	AI_Output(self,other, " DIA_PARLAN_ROBAMATERIAL_01_03 " );	// Yes, that's her. Perhaps this amount will be enough for us for a couple of years.
	AI_Output(self,other, " DIA_PARLAN_ROBAMATERIAL_01_04 " );	// By the way, Master Gorax rummaged around in the closet and found this novice robe there.
	AI_Output(self,other, " DIA_PARLAN_ROBAMATERIAL_01_05 " );	// She, of course, is not new, but it suits you. Don't wait a month for your brothers to sew a new one.
	B_GiveInvItems(self,other,ItAr_NOV_L,1);
	MIS_ROBAMATERIAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ROBAMATERIAL,LOG_SUCCESS);
	B_LogEntry( TOPIC_ROBAMATERIAL , " I brought Parlan a cloth for a robe. And he gave out a robe, which he accidentally found in the storeroom of the monastery. " );
};

instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = " Can I enter the library? " ;
};


func int DIA_Parlan_Stand_Condition()
{
	if ((MIS_MonasteryWorks == LOG_Running) && (other.guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	monastery_points = 0 ;
	AI_Output(other, self, " DIA_Parlan_Stand_15_00 " );	// Can I enter the library?

	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_01 " );	// You brought the fire nettle to Brother Neoras.
		monastery_points = monastery_points +  2 ;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_02 " );	// You found Brother Neoras' recipe.
		monastery_points = monastery_points +  2 ;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_03 " );	// You killed the black wolf that terrorized the chapel.
		monastery_points = monastery_points +  1 ;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_04 " );	// You were able to find four novices and sweep the cells.
		monastery_points = monastery_points +  3 ;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_05 " );	// You honestly distributed food to the novices, as brother Horax asked you to.
		monastery_points = monastery_points +  1 ;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_06 " );	// Gorax is dissatisfied with you because he didn't distribute the food fairly.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_07 " );	// You sold the wine, just like Gorax wanted.
		monastery_points = monastery_points +  1 ;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_08 " );	// The less we talk about wine, the better...
	};
	if ((Monastery_Points >=  8 ) && ( MIS_STOLENMATERIAL  ==  LOG_SUCCESS )) ;
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_09 " );	// Yes, you did a good job. Now it's time to begin to comprehend the teachings of Innos. Talk to Master Higlas in the library.
		AI_Output(self,other, " DIA_Parlan_Stand_05_10 " );	// I give you this key.
		parlan_permission = TRUE ;
		MIS_KlosterArbeit = LOG_SUCCESS ;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		MonasteryKeyGive = TRUE ;

		if(MIS_NeorasPflanzen == LOG_Running)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if(MIS_NeorasRezept == LOG_Running)
		{
			MIS_NeorasRezept = LOG_OBSOLETE;
		};
		if(MIS_IsgarothWolf == LOG_Running)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if(MIS_ParlanFegen == LOG_Running)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if(MIS_GoraxEssen == LOG_Running)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if(MIS_GoraxWein == LOG_Running)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if(MIS_MardukBeten == LOG_Running)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
	}
	else  if (cloister_points >=  1 )
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_11 " );	// You worked, of course, but for now, you must continue to serve the community.
	}
	else  if (( MIS_STOLENMATERIAL  !=  LOG_SUCCESS ) && (Monastery_Points >=  8 )) ;
	{
		AI_Output(self,other, " DIA_Parlan_WORK_99_13 " );	// Yes, you did a good job. Now it's time to begin to comprehend the teachings of Innos. But first you must get the robe of the novice, so says the law of Innos!
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_Stand_05_12 " );	// Do your errands for the benefit of the community first. And when you finish your work, we will return to this conversation.
	};
};


instance DIA_Parlan_Task (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Task_Condition;
	information = DIA_Parlan_Task_Info;
	permanent = FALSE;
	description = " Do you have any task for me? " ;
};

func int DIA_Parlan_Task_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Task_Info()
{
	AI_Output(other,self, " DIA_Parlan_Aufgabe_15_00 " );	// Do you have errands for me?
	AI_Output(self,other, " DIA_Parlan_Aufgabe_05_01 " );	// Hmm... Yes, you can really do something for the community.
	AI_Output(self,other, " DIA_Parlan_Aufgabe_05_02 " );	// The cells of novices need a good cleaning. Take care of it.
	AI_Output(other,self, " DIA_Parlan_Aufgabe_15_03 " );	// But it will take forever...
	AI_Output(self,other, " DIA_Parlan_Aufgabe_05_04 " );	// Then you'd better not waste your time, would you?
	AI_Output(self,other, " DIA_Parlan_Aufgabe_05_05 " );	// And by the way, the magician's room near the altar of Innos also needs to be cleaned.
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen, " Master Parlan wants me to sweep the cells of four acolytes. Not far from the altar of Innos, there is a magician's room that also needs to be cleaned. This will take forever. " );
};


instance DIA_Parlan_Fegen (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = " As for the cells of novices... " ;
};


var int DAY_Speak_Do_permanent;

func int DIA_Parlan_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other,self, " DIA_Parlan_Fegen_15_00 " );	// As for the cells of novices...
	if (NOV_Helper >=  5 )
	{
		AI_Output(self,other, " DIA_Parlan_Fegen_05_01 " );	// You managed to find four acolytes to help you. I think now they can get back to their work.
		AI_Output(self,other, " DIA_Parlan_Fegen_05_02 " );	// Excellent, novice. You have completed my task.
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DAY_Parlan_Fegen_permanent = TRUE ;
		B_StartOtherRoutine(Feger1,"START");
		B_StartOtherRoutine(Feger2,"START");
		B_StartOtherRoutine(Feger3,"START");
		B_StartOtherRoutine(Babo,"START");
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_Fegen_05_03 " );	// Undeniably, this is not an easy task. But with the help of Innos, you can do it.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = " How do I learn the basics of magic? " ;
};


func int DIA_Parlan_LEARN_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Speak_Hagen ) && ( other . guild ==  GIL_NOV ))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other,self, " DIA_Parlan_LEARN_15_00 " );	// How do I learn the basics of magic?
	AI_Output(self,other, " DIA_Parlan_LEARN_05_01 " );	// You're not here to receive the gift of magic. You are here to serve Innos.
	AI_Output(self,other, " DIA_Parlan_LEARN_05_02 " );	// But I can show you how to increase your magical abilities.
	B_LogEntry(Topic_KlosterTeacher, " Master Parlan can help me increase my magic energy. " );
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = " I want to take the Trial by Fire. " ;
};


func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other,self, " DIA_Parlan_KNOWSJUDGE_15_00 " );	// I want to take the Trial by Fire.
	AI_Output(self,other, " DIA_Parlan_KNOWSJUDGE_05_01 " );	// What?.. Hmm... (making sure) Are you really serious?
	AI_Output(other,self, " DIA_Parlan_KNOWSJUDGE_15_02 " );	// I insist.
	AI_Output(self,other, " DIA_Parlan_KNOWSJUDGE_05_03 " );	// You are an unusual acolyte. Well, if you insist, talk to Master Pyrocar.
	B_LogEntry(TOPIC_FireContest, " If I want to claim a Trial of Fire, I must speak to Master Pyrocar. " );
};

instances DIA_Parlan_TEACH_MANA (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = " I want to increase my magical abilities. " ;
};

func int DIA_Parlan_TEACH_MANA_Condition()
{
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV))
	{
		if (( Npc_KnowsInfo (hero, DAY_Speech_LEARN ) ==  TRUE ) && ( ( Speech_Sends ==  FALSE ) ||  
		{
			return TRUE;
		};
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self, " DIA_Parlan_TEACH_MANA_15_00 " );	// I want to increase my magical abilities
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if ((Chapter >=  2 ) && (other.guild ==  GIL_KDF ) && ( BACK_TEACREGENMAN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA, " Mana Regen (Training Points: 10, Cost: 10000 Coins) " ,DIA_Parlan_TEACH_MANA_Regen);
	};
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other, " DIA_Parlan_TEACH_MANA_05_00 " );	// Your magical energy has grown. I can't help you raise it even more.
		AI_Output(self,other, " DIA_Parlan_TEACH_MANA_05_01 " );	// If you want to learn more, talk to Pyrocar.
		Parlan_Sends = TRUE;
	};

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_Regen()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_Vatras_Teach_regen_15_05 " );	// Teach me mana regeneration.

	cost = 10 ;
	money = 10000;

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

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_KDF ) && ( BACK_TEACHREGENMAN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA, " Mana Regen (Training Points: 15, Cost: 5000 Coins) " ,DIA_Parlan_TEACH_MANA_Regen);
	};
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if ((Chapter >=  2 ) && (hero.guild ==  GIL_KDF ) && ( BACK_TEACHREGENMAN  ==  FALSE ))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA, " Mana Regen (Training Points: 15, Cost: 5000 Coins) " ,DIA_Parlan_TEACH_MANA_Regen);
	};
};

instance DIA_Parlan_MAGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_MAGE_Condition;
	information = DIA_Parlan_MAGE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_MAGE_Condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self,other, " DIA_Parlan_MAGE_05_00 " );	// You swore an oath, brother. Welcome to our ranks.
	AI_Output(self,other, " DIA_Parlan_MAGE_05_01 " );	// I'll teach you the first Circle of Magic when you have enough experience.
	AI_Output(self,other, " DIA_Parlan_MAGE_05_02 " );	// Take this runestone as a symbol of the power you now hold.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	AI_Output(self,other, " DIA_Parlan_MAGE_05_03 " );	// And, my brother... the roof of the monastery has not been changed for a long time, and therefore I ask you to understand with understanding that training for you will be... ahem... not entirely free...
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
	description = " Teach me the first Circle of Magic. (Learning Points: 20) " ;
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Speech_MAGE ) && ( other . guild ==  GIL_KDF ) && ( Npc_GetTalentSkill ( other , NPC_TALENT_ MAGE ) ==  0 ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self, " DIA_Parlan_TECH_CIRCLE1_15_00 " );	// Teach me the first Circle of Magic.

	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE1_05_01 " );	// The first circle of magic will allow you to use the runes you created.
		AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE1_05_02 " );	// Now you are worthy to know the spell formulas to create your own runes.
	};
};


instance DIA_Parlan_CIRCLE2 (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
	description = " Teach me the second Circle of Magic. (Training Points: 30) " ;
};


func int DIA_Parlan_CIRCLE2_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Speech_MAGE ) && ( other . guild ==  GIL_KDF ) && ( Npc_GetTalentSkill ( other , NPC_TALENT_ MAGE ) ==  1 ) ) ;
	{
		return TRUE;
	};
};

func void DAY_Parlan_CIRCLE2_Info()
{
	AI_Output(other,self, " DIA_Parlan_TECH_CIRCLE2_15_00 " );	// Teach me the second Circle of Magic.

	if (Chapter >=  2 )
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE2_05_01 " );	// Enter the second Circle and learn how to use more powerful magic.
			AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE2_05_02 " );	// But also remember that you carry a heavy burden of responsibility. Not in front of me and Pirocar - in front of Innos.
			AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE2_05_03 " );	// He will show you the direction - but the path is shaped by your deeds.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE2_05_04 " );	// The time has not yet come.
	};
};


instance DIA_Parlan_CIRCLE3 (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
	description = " Teach me the third Circle of Magic. (Learning points: 40) " ;
};


func int DIA_Parlan_CIRCLE3_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Speech_MAGE ) && ( other . guild ==  GIL_KDF ) && ( Npc_GetTalentSkill ( other , NPC_TALENT_ MAGE ) ==  2 ) ) ;
	{
		return TRUE;
	};
};

func void DAY_Parlan_CIRCLE3_Info()
{
	AI_Output(other,self, " DIA_Parlan_TECH_CIRCLE3_15_00 " );	// Teach me the third Circle of Magic.
	if (Chapter >=  3 )
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE3_05_01 " );	// Yes, the time has come. Enter the third circle of magic. New spells are waiting for you.
			AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE3_05_02 " );	// You'll need them - Evil wants to plunge the earth into chaos, and the only way to stop it is with the power of Innos.
			AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE3_05_03 " );	// I taught you all the Circles that I own. Karras will lead you into other Circles.
			B_LogEntry(Topic_KlosterTeacher, " Brother Parlan taught me the first three Circles. Brother Karras will help me learn the next Circles. " );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_TECH_CIRCLE3_05_04 " );	// It's not time to study the third Circle yet.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = " Teach me how to make runes. " ;
};


func int DIA_Parlan_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self, " DIA_Parlan_TEACH_15_00 " );	// Train me!
	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH,Dialog_Back,DIA_Parlan_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),dia_parlan_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),dia_parlan_teach_RapidFirebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),dia_parlan_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[80] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_SUMMONFIREGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONFIREGOLEM)),dia_parlan_teach_summonfiregolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MagicCage] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_MagicCage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MagicCage)),dia_parlan_teach_MagicCage);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_parlan_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[93] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_parlan_teach_firelight);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_parlan_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_parlan_teach_Explosion);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other, " DIA_Parlan_TEACH_05_01 " );	// I can't teach you anything yet.
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void dia_parlan_teach_instantfireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void dia_parlan_teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

func void dia_parlan_teach_MagicCage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MagicCage);
};

func void dia_parlan_teach_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void dia_parlan_teach_chargefireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_parlan_teach_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void dia_parlan_teach_pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void dia_parlan_teach_firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void dia_parlan_teach_summonfiregolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONFIREGOLEM);
};


instance DIA_Parlan_Kap2_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Parlan_Exit()
{
	AI_Output(self,other, " DIA_Parlan_EXIT_05_00 " );	// May Innos protect you.
};


instance DIA_Parlan_Kap3_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};

instance DIA_Parlan_IAmParlan (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_IAmParlan_Condition()
{
	if ((Capital >=  3 ) && Npc_IsInState(self,ZS_Talk) && ((other.guild !=  GIL_NOV ) && (other.guild !=  GIL_KDF ))) .
	{
		return TRUE;
	};
};

func void DAY_Parlan_IAmParlan_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Parlan_IAmParlan_05_00 " );	// I see you've decided to fight on our side. I am pleased to.
		AI_Output(self,other, " DIA_Parlan_IAmParlan_05_01 " );	// We need every strong hand. You must speak to Marduk, he is in charge of you paladins.
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_IAmParlan_05_02 " );	// I don't know why they let you into the monastery. I am Parlan, and I am in charge of our novices.
		AI_Output(self,other, " DIA_Parlan_IAmParlan_05_03 " );	// I don't want you to interrupt them with your stupid questions. I hope this is clear.
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan, " I will do what I see fit. " ,DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan, " Конечно . " ,DIA_Parlan_IAmParlan_OK);
	};
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self, " DIA_Parlan_IAmParlan_MyChoice_15_00 " );	// I'll do what I see fit.
	AI_Output(self,other, " DIA_Parlan_IAmParlan_MyChoice_05_01 " );	// There may be reasons for being tolerated here, but there is a limit to everything.
	AI_Output(self,other, " DIA_Parlan_IAmParlan_MyChoice_05_02 " );	// If you create problems, you will be responsible for it. So you better stay away from novices.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DAY_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Конечно.
	AI_Output(self,other, " DIA_Parlan_IAmParlan_OK_05_01 " );	// I really hope so.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Library (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Library_Info;
	permanent = FALSE;
	description = " Do you have anything for me? " ;
};


func int DIA_Parlan_Bibliothek_Condition()
{
	if ((other.guild !=  GIL_KDF ) && (Chapter >=  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Parlan_Library_Info()
{
	AI_Output(other,self, " DIA_Parlan_Bibliothek_15_00 " );	// Do you have anything for me?
	AI_Output(self,other, " DIA_Parlan_Bibliothek_05_01 " );	// Yes! As a reader of the library, you are given a key to it. There you will find brothers Karras and Higlas.
	AI_Output(self,other, " DIA_Parlan_Bibliothek_05_02 " );	// If you want, you can talk to them.

	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other, " DIA_Parlan_DontDisturb_05_03 " );	// But leave the novices alone!
	};

	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
	MonasteryKeyGive = TRUE ;
};


instance DIA_Parlan_DontDisturb(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_DontDisturb_Condition()
{
	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self,other, " DIA_Parlan_DontDisturb_05_00 " );	// (threateningly) I don't like repeating myself. Leave the followers alone!
	AI_Output(self,other, " DIA_Parlan_DontDisturb_05_01 " );	// They must purify their spirit by physical labor and prepare themselves for life in the monastery.
	AI_Output(self,other, " DIA_Parlan_DontDisturb_05_02 " );	// I will not tolerate interference in their work!
	Parlan_DontTalkToNovice = LOG_Running;
};

instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = " Where can I find... " ;
};

func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if ((CanEnterMonastery ==  TRUE ) && (other.guild !=  GIL_KDF ))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other,self, " DIA_Parlan_Kap3_PERM_15_00 " );	// Where can I find...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...церковь?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Speech_Cap3U4U5_PERM, " ...библиотеку? " ,DIA_Speech_Cap3U4U5_PERM_Library);
	Info_AddChoice(DAY_Speech_Chap3U4U5_PERM, " ...what? " ,DAY_Speech_Chap3U4U5_PERM_Chapel);
	Info_AddChoice(DAY_Speech_Cap3U4U5_PERM, " ...what? " ,DAY_Speech_Cap3U4U5_PERM_Cellar);
};


instances DIA_PARLAN_SOULRIVER (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = dia_parlan_soulriver_condition;
	information = dia_parlan_soulriver_info;
	permanent = TRUE;
	description = " I'm interested in one book. " ;
};


func int dia_parlan_soulriver_condition()
{
	if (( READ_SOULRIVER  ==  FALSE ) && ( MORIUS_MEET  ==  TRUE ) && ( TALK_TO_SOULRIVER  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_parlan_soulriver_info()
{
	AI_Output(other,self, " DIA_Parlan_SoulRiver_00 " );	// I heard that in the monastery you can find a book that talks about the release of captive souls.
	AI_Output(other,self, " DIA_Parlan_SoulRiver_01 " );	// Do you know where I can find it?

	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Parlan_SoulRiver_02 " );	// Yes. I remember we had something. Yes, exactly - 'Sacrificial Souls', that's what it was called.
		AI_Output(self,other, " DIA_Parlan_SoulRiver_03 " );	// It's in the basement library. But Talamon won't let you in there.
		AI_Output(self,other, " DIA_Parlan_SoulRiver_04 " );	// Only members of the High Council of the monastery have access there. You don't belong to them.
		AI_Output(other,self, " DIA_Parlan_SoulRiver_05 " );	// Can I get permission from one of the magicians to give me access to this library?
		AI_Output(self,other, " DIA_Parlan_SoulRiver_06 " );	// My advice is don't even try. And let's finish this.
	}
	else
	{
		AI_Output(self,other, " DIA_Parlan_SoulRiver_07 " );	// You're not a fire mage, and not even a novice of our monastery!
		AI_Output(self,other, " DIA_Parlan_SoulRiver_08 " );	// And you have the audacity to ask me about it!
		AI_Output(self,other, " DIA_Parlan_SoulRiver_09 " );	// What we have is none of your business. Do you understand?
	};
	PARLAN_SOULRIVER = TRUE;
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...церковь?
	AI_Output(self,other, " DIA_Parlan_Add_05_00 " );	// Oh my God! Has Innos blinded you?!
	AI_Output(self,other, " DIA_Parlan_Add_05_01 " );	// (cynically) Where's the church? Oh my god, where did she go?!
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...библиотеку?
	AI_Output(self,other, " DIA_Parlan_Add_05_02 " );	// The library is at the end of the colonnade on the left, directly opposite the church.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...часовню?
	AI_Output(self,other, " DIA_Parlan_Add_05_03 " );	// The chapel is in the room in the middle of the left colonnade. There, the paladins pray to Innos.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...подвал?
	AI_Output(self,other, " DIA_Parlan_Add_05_04 " );	// The entrance to the basement is in the middle of the colonnade on the right.
};


instance DIA_Parlan_Kap4_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap5_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instances DIA_PARLAN_PICKPOCKET (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 900;
	condition = dia_parlan_pickpocket_condition;
	information = dia_parlan_pickpocket_info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};


func int dia_parlan_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_XARDASNDMTASKSONE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_parlan_pickpocket_info()
{
	Info_ClearChoices(dia_parlan_pickpocket);
	Info_AddChoice(dia_parlan_pickpocket, Dialog_Back, dia_parlan_pickpocket_back);
	Info_AddChoice(dia_parlan_pickpocket, DIALOG_PICKPOCKET , dia_parlan_pickpocket_doit);
};

func void dia_parlan_pickpocket_doit()
{
	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 40)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};

		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		MonasteryKeyGive = TRUE ;
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_parlan_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
	};
};

func void dia_parlan_pickpocket_back()
{
	Info_ClearChoices(dia_parlan_pickpocket);
};


instance DIA_PARLAN_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = dia_parlan_runemagicnotwork_condition;
	information = dia_parlan_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_parlan_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Parlan_RuneMagicNotWork_01_00 " );	// Your magic runes - do they still work?
	AI_Output(self,other,"DIA_Parlan_RuneMagicNotWork_01_01");	//Нет!
	AI_Output(other,self, " DIA_Parlan_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Parlan_RuneMagicNotWork_01_03 " );	// And they don't work.
	AI_Output(other,self, " DIA_Parlan_RuneMagicNotWork_01_04 " );	// Got it.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_PARLAN_TREVIUS (C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = dia_parlan_trevius_condition;
	information = day_speak_trevius_info;
	permanent = FALSE;
	description = " I'm looking for the old manuscripts of Xardas. " ;
};

func int day_speak_trevius_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (RUK3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_parlan_trevius_info()
{
	AI_Output(other,self, " DIA_Parlan_TREVIUS_01_00 " );	// I'm looking for old manuscripts of Xardas.
	AI_Output(other,self, " DIA_Parlan_TREVIUS_01_01 " );	// Do you know anything about them?
	AI_Output(self,other, " DIA_Parlan_TREVIUS_01_02 " );	// I don't know what business you have with this traitor.
	AI_Output(self,other, " DIA_Parlan_TREVIUS_01_03 " );	// But one thing I know for sure - I won't tell you anything.
	COUNT_TREVIUS_DIALOG = TRUE;
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};
Footer
