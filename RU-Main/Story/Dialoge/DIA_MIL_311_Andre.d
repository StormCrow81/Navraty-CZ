

instance DIA_Andre_EXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Andre_EXIT_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Andre_FIRSTEXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Andre_FIRSTEXIT_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Wulfgar,"START");
};


var int Andre_Profile;

func void B_Andre_Profile()
{
	AI_Output(self,other, " DIA_Andre_Add_08_00 " );	// One of my people told me that the bandits are distributing a wanted poster with your picture on it.
	AI_Output(self,other, " DIA_Andre_Add_08_01 " );	// He also said that you denied it at first.
	AI_Output(self,other, " DIA_Andre_Add_08_02 " );	// So what does it all mean?
	if(DEXTERSAYABOUTKILL == TRUE)
	{
		AI_Output(other,self, " DIA_Andre_Add_15_04 " );	// These guys just want to kill me.
		AI_Output(self,other, " DIA_Andre_Add_08_13 " );	// Almost all bandits are former convicts from the mines.
		AI_Output(self,other, " DIA_Andre_Add_08_14 " );	// So how do they know you?
		AI_Output(other,self, " DIA_Andre_Add_15_05 " );	// I think Vatras the Waterbender can vouch for me.
		AI_Output(self,other, " DIA_Andre_Add_08_15 " );	// Well, if so.
	}
	else
	{
		AI_Output(other,self, " DIA_Andre_Add_15_03 " );	// I don't know why these guys are after me...
		AI_Output(self,other, " DIA_Andre_Add_08_04 " );	// I hope for your own good that you're telling me the truth.

		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other, " DIA_Andre_Add_08_05 " );	// I don't need people with a tarnished reputation in the militia.
		}
		else
		{
			AI_Output(self,other, " DIA_Andre_Add_08_12 " );	// I don't trust townspeople with a tarnished reputation.
		};

		AI_Output(self,other, " DIA_Andre_Add_08_06 " );	// Most of these bandits are former convicts from the colony.
	};
	AI_Output(self,other, " DIA_Andre_Add_08_07 " );	// I hope you have nothing to do with these thugs.
	Andre_Profile = TRUE ;
};


var int Andre_CantharFalle;

func void B_Andre_CantharFalle()
{
	AI_Output(self,other, " B_Andre_CantharFalle_08_00 " );	// Merchant Kantar came to me! He said that you are a runaway convict from the colony.
	AI_Output(self,other, " B_Andre_CantharFalle_08_01 " );	// I don't know if this is true, and I prefer not to ask you about it. But you must settle this matter.
	if(SARAKNOWSABOUTCANTHAR == TRUE)
	{
		B_StartOtherRoutine(Sarah,"InTavern");
		AI_Teleport(Sarah,"NW_TAVERNE_IN_10");
		SARAFLEE = TRUE;
	}
	else
	{
		b_clearjunktradeinvsarah(VLK_470_Sarah);
		B_StartOtherRoutine(Sarah,"Killed");
		AI_Teleport(Sarah,"NW_SARA_KILLED");
		b_killnpc_now(VLK_470_Sarah);
		SARAISDEAD = TRUE;
	};
	B_StartOtherRoutine(Canthar, " MARKET STAND " );
	AI_Teleport(Canthar,"NW_CITY_SARAH");
	if((Canthar_Sperre == FALSE) && (Canthar_Pay == FALSE))
	{
		Canthar_Sperre = TRUE;
	};
	MIS_Canthars_KomproBrief = LOG_OBSOLETE ;
	Andre_CantharFalle = TRUE ;
};


instance DIA_Andre_CantharFalle (C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_CantharFalle_Condition()
{
	if ((MIS_Canthars_ComproBrief == LOG_Running) && (MIS_Canthars_ComproBrief_Day <= (Wld_GetDay() -  2 )) && (Other_CantharFall ==  FALSE ) && ( MIS_OR с GREATWAR  ==  FALSE )) ;
	{
		return TRUE;
	};
	if ((Paul_OtherMessage ==  TRUE ) &&  ! Npc_IsDead(Paul) && (Other_Steckbrief ==  FALSE ) && ( MY_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func int DIA_Other_CantharFall_Info()
{
	if (Andre_Profile ==  FALSE )
	{
		B_Andre_Profile();
		return TRUE;
	};
	if ((Other_CantharFail ==  FALSE ) && (MY_Canthars_CompareBrief_Day <= (Wld_GetDay() -  2 )))
	{
		B_Andre_CantharFall();
		return TRUE;
	};
	return  FALSE ;
};


var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;

instance DIA_Andre_PMSchulden (C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Andre_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = " The city has outlawed you! " ;
	AI_Print(concatText);
};

func void dia_andre_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = " Khorinis outlawed you! " ;
	AI_Print(concatText);
};

func void DIA_Andre_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//Ты пришел заплатить штраф?
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
	};
	temp1 = 0;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_36");	//Твои убийства переполнили чашу терпения людей на этой земле и Инноса на небе.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_37");	//Таким кровожадным ублюдкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_38");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_39");	//Умри с миром!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_40");	//Твои постоянные нападения на людей не могут больше оставаться безнаказанными.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_41");	//Таким подонкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_42");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_43");	//Умри с миром!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_44");	//Воровство - не самое страшное преступление, но все имеет границы, и ты свою уже перешел.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_45");	//Таким грязным ворам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_46");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_47");	//Умри с миром!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с городской стражей и паладинами, из-за постоянных моих бесчинств в городе. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PMSchulden,"Постой!...(пора сматываться)",dia_andre_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//Я даже задавался вопросом, осмелишьлся ли ты появиться здесь!
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Обвинения против тебя только множатся.
			if(Andre_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//Я предупреждал тебя! Теперь штраф, который тебе придется заплатить, только увеличился.
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
				if(diff > 0)
				{
					Andre_Schulden = Andre_Schulden + (diff * 250);
				};
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//Ты глубоко разочаровал меня.
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
				if(diff > 0)
				{
					Andre_Schulden = Andre_Schulden + (diff * 250);
				};
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Выяснились новые подробности.
			if(Andre_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//Неожиданно не осталось никого, кто бы мог обвинить тебя в убийстве.
				GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER - 1;
				if(GLOBAL_CITY_MURDER < 0)
				{
					GLOBAL_CITY_MURDER = 0;
				};
			};
			if((Andre_LastPetzCrime == CRIME_THEFT) || ((Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//Никто больше не помнит, чтобы ты что-то крал.
				GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT - 1;
				if(GLOBAL_CITY_THEFT < 0)
				{
					GLOBAL_CITY_THEFT = 0;
				};
			};
			if((Andre_LastPetzCrime == CRIME_ATTACK) || ((Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//Больше нет свидетелей того, как ты принимал участие в драке.
				GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK - 1;
				if(GLOBAL_CITY_ATTACK < 0)
				{
					GLOBAL_CITY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Похоже, все обвинения против тебя оказались несостоятельными.
			};
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//Я не знаю, что произошло, но я предупреждаю тебя - не пытайся провести меня!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//Как бы то ни было, я решил снять с тебя все обвинения.
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//Смотри, чтобы больше не было никаких проблем!
				Andre_Schulden = 0;
				Andre_LastPetzCounter = 0;
				Andre_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//Я хочу, чтобы тебе было понятно - тебе все равно придется заплатить полную сумму штрафа!
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00B");	//Сколько?
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//Что скажешь?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Andre_PMSchulden);
			Info_ClearChoices(DIA_Andre_PETZMASTER);
			Info_AddChoice(DIA_Andre_PMSchulden,"У меня недостаточно золота!",DIA_Andre_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Andre_PMSchulden,"Сколько я должен заплатить?",DIA_Andre_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
			{
				Info_AddChoice(DIA_Andre_PMSchulden,"Я хочу заплатить штраф.",DIA_Andre_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//Сколько там еще?
	if(Andre_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Andre_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Andre_PMSchulden);
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_AddChoice(DIA_Andre_PMSchulden,"У меня недостаточно золота!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Andre_PMSchulden,"Сколько я должен заплатить?",DIA_Andre_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PMSchulden,"Я хочу заплатить штраф.",DIA_Andre_PETZMASTER_PayNow);
	};
};


instance DIA_Andre_PETZMASTER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Andre_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//Ты тот новичок, что баламутит город.
	};
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
	};
	temp1 = 0;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_21");	//Ты осмелился прийти сюда - очень глупо с твоей стороны.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_22");	//Твои убийства переполнили чашу терпения людей на этой земле и Инноса на небе.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_23");	//Таким кровожадным ублюдкам, как ты, не место в этом мире - и посему земная кара настигнет тебя раньше, чем небесная.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_24");	//И я лично, во Славу Инноса, прослежу за тем, чтобы ты больше не смог причинить людям зла!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_25");	//Умри с миром!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_26");	//Ты осмелился прийти сюда - очень глупо с твоей стороны.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_27");	//Твои постоянные нападения на людей не могут больше оставаться безнаказанными.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_28 " );	// Such bastards as you have no place in this world - and therefore the earthly punishment will overtake you before the heavenly one.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_29 " );	// And I personally, for the Glory of Innos, will see to it that you can no longer harm people!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_30 " );	// Die in peace!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_31 " );	// You dared to come here - very stupid of you.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_32 " );	// Theft is not the worst crime, but everything has its limits, and you have already crossed yours.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_33 " );	// Such dirty thieves as you have no place in this world - and therefore the earthly punishment will overtake you before the heavenly one.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_34 " );	// And I personally, for the Glory of Innos, will see to it that you can no longer harm people!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_35 " );	// Die in peace!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry( TOPIC_DIPLOM , " I ruined my relationship with the city guards and paladins because of my constant outrages in the city. Now they consider me a bandit there! " );
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PETZMASTER, " Wait!...(it's time to leave) " ,dia_andre_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_01 " );	// It's good that you came to me while things can still be settled!
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_02 " );	// Murder is a serious crime!
			Other_debts = B_GetTotalPetzCounter(self) *  1500 ;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Andre_PETZMASTER_08_03 " );	// Not to mention the other things you've done.
			};
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_04 " );	// Guards are ordered to execute the assassins on the spot.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_05 " );	// And most townsfolk won't tolerate murderers in town!
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_06 " );	// But I'm not interested in hanging you. There is a war going on and we need every soldier!
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_07 " );	// But it won't be so easy to calm people down.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_08 " );	// You could prove your remorse by paying a fine! Naturally, it must be quite significant.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_09 " );	// It's good that you came. You are accused of stealing! There are witnesses!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other, " DIA_Andre_PETZMASTER_08_10 " );	// Not to mention your other transgressions that I've heard about.
			};
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_11 " );	// I won't tolerate this kind of behavior in my city!
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_12 " );	// You must pay a fine to atone for your guilt.
			Other_debts = B_GetTotalPetzCounter(self) *  500 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_13 " );	// If you're fighting rabble in the harbor, that's one thing...
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_14 " );	// But when you attack citizens or royal soldiers, I must take action.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other, " DIA_Andre_PETZMASTER_08_15 " );	// Was it necessary to kill this sheep?
			};
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_16 " );	// If I just let you go, soon everyone will do what they want.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_17 " );	// So you'll have to pay the appropriate fine. And your sins will be forgotten.
			Other_debts = B_GetTotalPetzCounter(self) *  750 ;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_18 " );	// I heard you slaughtered a sheep.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_19 " );	// You understand that I can't just leave this case.
			AI_Output(self,other, " DIA_Andre_PETZMASTER_08_20 " );	// You'll have to pay compensation!
			other_debts = 250 ;
		};
		AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//Сколько?
		if (Andre_debts <=  1000 )
		{
			B_Say_Gold(self,other,Andre_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PETZMASTER, " I don't have enough gold! " ,DIA_Andre_PETZMASTER_PayLater);
		if (Npc_HasItems(other,ItMi_Gold) >= Other_debts)
		{
			Info_AddChoice(DIA_Andre_PETZMASTER, " I want to pay a fine. " ,DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output(other,self, " DIA_Andre_PETZMASTER_PayNow_15_00 " );	// I want to pay a fine!
	B_GiveInvItems(other,self,ItMi_Gold,Other_Debts);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Хорошо! Я позабочусь, чтобы все в городе узнали об этом - это хоть как-то восстановит твою репутацию.
	B_GrantAbsolution(LOC_CITY);
	Andre_Schulden = 0;
	Andre_LastPetzCounter = 0;
	Andre_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_ClearChoices(DIA_Andre_PMSchulden);
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Тогда постарайся собрать необходимую сумму как можно быстрее.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//Но должен предупредить тебя: если ты при этом усугубишь свою вину, то твой штраф только возрастет.
	Andre_LastPetzCounter = B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Andre_Hallo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Hallo_Condition;
	information = DIA_Andre_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Hallo_Info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Да пребудет с тобой Иннос, чужеземец! Что привело тебя ко мне?
	AndreTakkFT = TRUE;
};


instance DIA_ANDRE_KDFCANTHAR(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_kdfcanthar_condition;
	information = dia_andre_kdfcanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_kdfcanthar_condition()
{
	if((Canthar_WiederRaus == TRUE) && (Npc_IsDead(Canthar) == FALSE) && Npc_KnowsInfo(other,dia_daron_canthar) && (other.guild == GIL_KDF) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_kdfcanthar_info()
{
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_00");	//Почтенный маг, мастер Дарон сообщил мне о возмутительных слухах, распускаемых торговцем Кантаром.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_01");	//Я разобрался в этом и вынужден признать, что он был выпущен из тюрьмы незаконно.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_02");	//Однако в твоей воле решить его судьбу.
	Canthar_Sperre = FALSE;
	Info_ClearChoices(dia_andre_kdfcanthar);
	Info_AddChoice(dia_andre_kdfcanthar,"Думаю, что ему самое место за решеткой.",dia_andre_kdfcanthar_free);
	Info_AddChoice(dia_andre_kdfcanthar,"Пусть останется на свободе.",dia_andre_kdfcanthar_prison);
};

func void dia_andre_kdfcanthar_prison()
{
	Info_ClearChoices(dia_andre_kdfcanthar);
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_03");	//Думаю, что ему самое место за решеткой.
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_04");	//Там он сможет поразмыслить, что важнее - человеческая жизнь или место на рынке.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_05");	//Я выполню твое решение.
	B_StartOtherRoutine(Canthar,"KNAST");
	CANTHAR_AUSGELIEFERT2 = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_andre_kdfcanthar_free()
{
	Info_ClearChoices(dia_andre_kdfcanthar);
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_06");	//Пусть останется на свободе.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_07");	//Хорошо, будет по-твоему, хоть я и не одобряю это решение.
	AI_StopProcessInfos(self);
};


instance DIA_Andre_Message(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_Message_Condition;
	information = DIA_Andre_Message_Info;
	permanent = FALSE;
	description = "У меня есть важное сообщение для лорда Хагена.";
};


func int DIA_Andre_Message_Condition()
{
	if((Kapitel < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		return TRUE;
	};
};

func void DIA_Andre_Message_Info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//У меня есть важное сообщение для лорда Хагена.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//Ну, ты стоишь перед его представителем. Так что там такое?
	Info_ClearChoices(DIA_Andre_Message);
	Info_AddChoice(DIA_Andre_Message,"Это я могу сказать только лорду Хагену.",DIA_Andre_Message_Personal);
	Info_AddChoice(DIA_Andre_Message,"Армию орков, возглавляют ДРАКОНЫ!",DIA_Andre_Message_Dragons);
	Info_AddChoice(DIA_Andre_Message,"Это насчет священного артефакта - Глаза Инноса.",DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Лорд Хаген принимает только паладинов и тех, кто служит паладинам.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//Он считает ниже своего достоинства тратить время на простых людей.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//Это насчет священного артефакта - Глаза Инноса.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//Глаз Инноса - никогда не слышал о таком. Но это еще ничего не значит.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//Если действительно существует артефакт, носящий Его имя, только самые высокопоставленные члены нашего ордена могут знать о нем.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//Вот почему мне нужно поговорить именно с лордом Хагеном.
	Andre_EyeInnos = TRUE;
	B_Andre_LordHagenNichtZuSprechen();
	Info_ClearChoices(DIA_Andre_Message);
};

func void DIA_Andre_Message_Dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//Армия орков, возглавляемая ДРА...
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(прерывает) Я знаю, что армия орков становится все сильнее!
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//Ты же не хочешь мне сказать, что ты только ЭТО хочешь доложить лорду Хагену.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//Он оторвет тебе голову, если ты будешь попусту тратить его время, отвлекая его такими историями.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//Я уверен, что ты достаточно умен и понимаешь это сам.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//Так все-таки, зачем тебе нужно увидеть его?
};

func void DIA_Andre_Message_Personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//Это я могу сказать только лорду Хагену.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Как знаешь. Но ты должен понять одно:
	B_Andre_LordHagenNichtZuSprechen();
	Info_ClearChoices(DIA_Andre_Message);
};

instance DIA_Andre_Paladine(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_Paladine_Condition;
	information = DIA_Andre_Paladine_Info;
	permanent = FALSE;
	description = "Почему паладины прибыли в город?";
};


func int DIA_Andre_Paladine_Condition()
{
	if((other.guild != GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladine_Info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Почему паладины прибыли в город?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//Цели нашей операции являются тайной.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//Я могу сказать тебе только, что гражданам города не грозит никакая опасность.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//Тебе не о чем волноваться.
};


instance DIA_Andre_PaladineAgain(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_PaladineAgain_Condition;
	information = DIA_Andre_PaladineAgain_Info;
	permanent = FALSE;
	description = "Что паладины делают в городе?";
};


func int DIA_Andre_PaladineAgain_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_PaladineAgain_Info()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//Так ты скажешь мне, зачем паладины прибыли в Хоринис?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Что паладины делают в городе?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Теперь, когда ты вступил в городскую стражу, ты подчиняешься паладинам.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//И теперь я могу доверять тебе.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//Мы прибыли по поручению короля Робара. С разрушением Барьера поставки руды прекратились.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Поэтому теперь мы добываем руду и доставляем ее на материк. При помощи этой руды мы выкуем новое оружие и победим орков.
	KnowsPaladins_Ore = TRUE;
};


instance DIA_Andre_AskToJoin(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_AskToJoin_Condition;
	information = DIA_Andre_AskToJoin_Info;
	permanent = FALSE;
	description = "Я хочу поступить на службу к паладинам!";
};


func int DIA_Andre_AskToJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_AskToJoin_Info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//Я хочу поступить на службу к паладинам!
	if(Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Хорошо. Нам нужны люди. И меня не интересует, почему ты решил присоединиться к нам.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//Если ты поступишь на службы к паладинам, я помогу тебе добиться аудиенции у лорда Хагена.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//Достойное решение.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//Однако у меня есть приказ принимать в ополчение только граждан этого города.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//Мой командующий опасается, что в наши ряды могут проникнуть шпионы или диверсанты.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//Он хочет таким образом свести риск к минимуму.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Поэтому, ты сначала должен стать гражданином города. Не знаю, имеет это правило смысл или нет, но приказ есть приказ.
	Log_CreateTopic(TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_Running);
	B_LogEntry(TOPIC_BecomeMIL,"Прежде чем я смогу вступить в ряды городской стражи, я должен стать гражданином города.");
};


instance DIA_Andre_AboutMiliz(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Andre_AboutMiliz_Condition;
	information = DIA_Andre_AboutMiliz_Info;
	permanent = FALSE;
	description = "Что я получу от вступления в ополчение?";
};


func int DIA_Andre_AboutMiliz_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//Что я получу от вступления в ополчение?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Позволь мне прояснить один момент. Обязанности солдата ополчения не ограничиваются расхаживанием по городу в униформе.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//Это грязная и даже кровавая работа. Когда ты станешь одним из нас, тебя будет ждать целая гора работы.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//Но это того стоит. Помимо жалования, у тебя появляется шанс однажды стать священным воином Инноса.
};


instance DIA_Addon_Andre_MartinEmpfehlung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information = DIA_Addon_Andre_MartinEmpfehlung_Info;
	description = "Я принес рекомендательное письмо от вашего интенданта.";
};


func int DIA_Addon_Andre_MartinEmpfehlung_Condition()
{
	if(Npc_HasItems(other,ItWr_Martin_MilizEmpfehlung_Addon) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//Я принес рекомендательное письмо от вашего интенданта.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(недоверчиво) Что? А ну-ка, покажи.
	B_GiveInvItems(other,self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(удивленно) Ну надо же!.. Тебе, должно быть, пришлось потрудиться! Не так-то просто получить нечто подобное от Мартина.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//Ладно, я убежден. Если Мартин за тебя ручается, я согласен тебя принять. Скажи мне, когда ты будешь готов.
	Andre_Knows_MartinEmpfehlung = TRUE;
};


instance DIA_Andre_Alternative(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Alternative_Condition;
	information = DIA_Andre_Alternative_Info;
	permanent = FALSE;
	description = "А нет более быстрого способа присоединиться к вам?";
};


func int DIA_Andre_Alternative_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_AskToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Alternative_Info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//А нет более быстрого способа присоединиться к вам?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//Хммм...(задумчиво) У тебя действительно серьезные намерения, да?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Хорошо, cлушай! У меня есть проблема. Если ты решишь ее для меня, я обещаю, что ты будешь зачислен в ополчение.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//И самое главное: никому ни слова!
};


instance DIA_Andre_GuildOfThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_GuildOfThieves_Condition;
	information = DIA_Andre_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Что у тебя за проблемы?";
};

func int DIA_Andre_GuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};

func void DIA_Andre_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//Что у тебя за проблемы?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Последнее время в городе развелось слишком много воров. И мы никак не можем поймать ни одного из них. Воры действуют очень осторожно.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//Эти мерзавцы знают свое дело. Я уверен, что в городе действует организованная банда.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//Я не удивлюсь, если в Хоринисе появилась гильдия воров. Найди главарей этой банды и ликвидируй их.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//Тогда я смогу гарантировать, что ты будешь принят в ополчение - неважно, гражданин ты или нет.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//Но ты никому не должен говорить о нашем соглашении!
	};
	MIS_Andre_GuildOfThieves = LOG_Running;
	B_LogEntry(TOPIC_BecomeMIL,"Есть также другой способ вступить в ряды городской стражи - найти и уничтожить гильдию воров Хориниса.");
};


instance DIA_Andre_WhereThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_WhereThieves_Condition;
	information = DIA_Andre_WhereThieves_Info;
	permanent = FALSE;
	description = "Где мне лучше начать искать этих воров?";
};


func int DIA_Andre_WhereThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves) && (MIS_Andre_GuildOfThieves == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhereThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Где мне лучше начать искать этих воров?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//Если бы я знал это, я бы сделал это сам!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//Могу сказать одно: мы недавно перевернули вверх дном весь портовый квартал и ничего не нашли. Абсолютно ничего.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//Люди, живущие там, не склонны к сотрудничеству, особенно, если на тебе доспехи паладина.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//Но ты нездешний. Возможно, тебе они будут больше доверять.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//Ты можешь поспрашивать в портовом квартале. Но будь осторожен. Если люди поймут, что ты работаешь на паладинов, ты не узнаешь НИЧЕГО!
	B_LogEntry(TOPIC_BecomeMIL,"Если я хочу найти гильдию воров, мне лучше начать прислушиваться к тому, что говорят в портовом квартале.");
};


instance DIA_Andre_WhatToDo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_WhatToDo_Condition;
	information = DIA_Andre_WhatToDo_Info;
	permanent = FALSE;
	description = "Что мне делать, когда я найду этих воров?";
};


func int DIA_Andre_WhatToDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves) && (MIS_Andre_GuildOfThieves == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhatToDo_Info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//Что мне делать, когда я найду этих воров?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//Если дело касается мелкой рыбешки - рядового вора или наводчика, лучше всего избежать схватки.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Просто приди ко мне и доложи. А я позабочусь, чтобы эта мразь оказалась за решеткой.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//Городская стража может вмешаться в драку и у тебя не будет возможности объяснить им, что происходит.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Кроме того, за каждого преступника, который с твоей помощью будет засажен за решетку, тебе полагается награда.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//Однако, если ты найдешь логово главарей - ну, тогда тебе, вероятно, не удастся избежать боя.
	B_LogEntry(TOPIC_BecomeMIL,"Если я поймаю какую-нибудь мелкую рыбешку гильдии воров, я должен привести его прямо к лорду Андрэ. А чтобы ликвидировать гильдию воров, я должен найти их логово.");
};


instance DIA_Andre_Auslieferung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 200;
	condition = DIA_Andre_Auslieferung_Condition;
	information = DIA_Andre_Auslieferung_Info;
	permanent = TRUE;
	description = "Я пришел получить награду за преступника.";
};

func int DIA_Andre_Auslieferung_Condition()
{
	if((Rengaru_Ausgeliefert == FALSE) || (Halvor_Ausgeliefert == FALSE) || (Nagur_Ausgeliefert == FALSE) || (MIS_Canthars_KomproBrief == LOG_Running) || (Npc_HasItems(hero,ItMi_DexterHead) >= 1) || (Npc_HasItems(hero,ItMi_NestorHead) >= 1) || (Npc_HasItems(hero,ItMi_KriksHead) >= 1) || (Npc_HasItems(hero,ItMi_BartHead) >= 1) || (Npc_HasItems(hero,ItMi_SkironHead) >= 1) || (Npc_HasItems(hero,ItMi_RocksHead) >= 1))
	{
		if(KAPITELORCATC == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Andre_Auslieferung_Info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//Я пришел получить награду за преступника.
	Info_ClearChoices(DIA_Andre_Auslieferung);
	Info_AddChoice(DIA_Andre_Auslieferung,"Я зайду позже.",DIA_Andre_Auslieferung_Back);

	if((Rengaru_InKnast == TRUE) && (Rengaru_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Ренгару обокрал торговца Джору.",DIA_Andre_Auslieferung_Rengaru);
	};
	if((Betrayal_Halvor == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Халвор продает краденые вещи.",DIA_Andre_Auslieferung_Halvor);
	};
	if((MIS_Nagur_Bote == LOG_Running) && (Nagur_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Нагур убил посыльного Бальтрама.",DIA_Andre_Auslieferung_Nagur);
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Торговец Кантар пытается избавиться от Сары!",DIA_Andre_Auslieferung_Canthar);
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (Npc_HasItems(Sarah,ItWr_Canthars_KomproBrief_MIS) >= 1) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Сара продает оружие Онару.",DIA_Andre_Auslieferung_Sarah);
	};
	if((Npc_HasItems(hero,ItMi_DexterHead) >= 1) && (DexterIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Декстер мертв.",DIA_Andre_Auslieferung_Dexter);
	};
	if((Npc_HasItems(hero,ItMi_NestorHead) >= 1) && (NestorIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Нестор 'Ганибал' мертв.",DIA_Andre_Auslieferung_Nestor);
	};
	if((Npc_HasItems(hero,ItMi_KriksHead) >= 1) && (KriksIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Крикс 'Бритва' мертв.",DIA_Andre_Auslieferung_Kriks);
	};
	if((Npc_HasItems(hero,ItMi_BartHead) >= 1) && (BartIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Барт 'Коротышка' мертв.",DIA_Andre_Auslieferung_Bart);
	};
	if((Npc_HasItems(hero,ItMi_SkironHead) >= 1) && (SkironIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Скирон 'Мясник' мертв.",DIA_Andre_Auslieferung_Skiron);
	};
	if((Npc_HasItems(hero,ItMi_RocksHead) >= 1) && (RocksIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Разбойник по имени Рокс 'Шустрый' мертв.",DIA_Andre_Auslieferung_Rocks);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices(DIA_Andre_Auslieferung);
};


func void DIA_Andre_Auslieferung_Dexter()
{
	B_GivePlayerXP(750);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Dexter_01_00");	//Разбойник по имени Декстер мертв.
	B_GiveInvItems(other,self,ItMi_DexterHead,1);
	Npc_RemoveInvItems(self,ItMi_DexterHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Dexter_01_01");	//Наконец-то! Этот бывший каторжник со своей шайкой держал в страхе весь Хоринис. Теперь люди смогут вздохнуть более свободно.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Ты заслужил это золото и мое уважение.
	B_GiveInvItems(self,other,ItMi_Gold,2500);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nestor()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nestor_01_00");	//Нестор, более известный, как 'Ганнибал', отправился вслед за своими невинными жертвами. Надеюсь, они отомстят ему на том свете.
	B_GiveInvItems(other,self,ItMi_NestorHead,1);
	Npc_RemoveInvItems(self,ItMi_NestorHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nestor_01_01");	//О вопиющей жестокости и кровожадности 'Ганнибала' ходили легенды. Я рад, что этого чудовища больше нет среди живых.
	AI_Output(self,other,"DIA_Andre_Auslieferung_NestorGold_01_02");	//Не думаю, что столь благородный воин, как ты, шел на такую рискованную охоту только ради денег. Прежде всего, ты наверняка жаждал избавить жителей острова от опасности. Тем не менее, прими это скромное вознаграждение.
	B_GiveInvItems(self,other,ItMi_Gold,2000);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Kriks()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Kriks_01_00");	//Крикс 'Бритва' больше никому не причинит зла.
	B_GiveInvItems(other,self,ItMi_KriksHead,1);
	Npc_RemoveInvItems(self,ItMi_KriksHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Kriks_01_01");	//Этот негодяй не заслужил никакой иной смерти, кроме самой мучительной. Уверен, ты проводил его достойно.
	AI_Output(self,other,"DIA_Andre_Auslieferung_KriksGold_01_02");	//Моя же обязанность - достойно тебя за это наградить!
	B_GiveInvItems(self,other,ItMi_Gold,1500);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Dragon's Edge, 1 );
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Ausliefer);
};

func void DIA_Andre_Ausliefer_Bart()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Andre_Auslieferung_Bart_01_00 " );	// The wish of many in Khorinis came true: Bart, nicknamed 'Shorty', is dead. I am also glad that not so much wood will go to the coffin.
	B_GiveInvItems(other,self,ItMi_BartHead,1);
	Npc_RemoveInvItems(self,ItMi_BartHead,1);
	AI_Output(self,other, " DIA_Andre_Auslieferung_Bart_01_01 " );	// A lavish funeral for the late shorthand still can't wait! Wolves will share it with scavengers!
	AI_Output(self,other, " DIA_Andre_Auslieferung_BartGold_01_02 " );	// You don't have to share. All the gold on Bart's head is now yours.
	B_GiveInvItems(self,other,ItMi_Gold,1250);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Dragon's Edge, 1 );
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Ausliefer);
};

func void DIA_Andre_Ausliefer_Skiron()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_Andre_Auslieferung_Skiron_01_00 " );	// I butchered the Butcher.
	B_GiveInvItems(other,self,ItMi_SkironHead,1);
	Npc_RemoveInvItems(self,ItMi_SkironHead,1);
	AI_Output(self,other, " DIA_Andre_Auslieferung_Skiron_01_01 " );	// Once it was called Skiron. And he was once human. But after all the atrocities committed, he lost this status.
	AI_Output(self,other, " DIA_Andre_Auslieferung_SkironGold_01_01 " );	// Gold is just a nice addition to your sense of accomplishment.
	AI_Output(self,other, " DIA_Andre_Auslieferung_SkironGold_01_02 " );	// And your status seems to be forged from actions and does not depend on the state. It is commendable. But you are entitled to gold for work anyway.
	B_GiveInvItems(self,other,ItMi_Gold,1000);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Dragon's Edge, 1 );
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Ausliefer);
};

func void DIA_Andre_Ausliefer_Rocks()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Andre_Auslieferung_Rocks_01_00 " );	// Rox didn't get away from me. I can't even imagine who took it into his head to call him 'Nimble'.
	B_GiveInvItems(other,self,ItMi_RocksHead,1);
	Npc_RemoveInvItems(self,ItMi_RocksHead,1);
	AI_Output(self,other, " DIA_Andre_Auslieferung_Rocks_01_01 " );	// Heh, my guys. But, you see, he is fast and elusive only for them.
	AI_Output(self,other, " DIA_Andre_Auslieferung_RocksGold_01_02 " );	// Perhaps I'll deduct this gold from the salaries of my slow mediocrity. Well done!
	B_GiveInvItems(self,other,ItMi_Gold,750);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{
	AI_Teleport(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Ренгару украл у торговцы Джоры! Он пытался скрыться, но я поймал его.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Хорошо, мои люди уже схватили его. Больше он не сможет воровать у добропорядочных граждан.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Вот твои деньги.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
	B_StartOtherRoutine(Rengaru,"PRISON");
};

func void DIA_Andre_Auslieferung_Halvor()
{
	AI_Teleport(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Халвор торгует краденым! Он продает товары, украденные бандитами у торговцев.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//Так вот, кто этим занимается. Мои люди немедленно схватят его.
	AI_Output(self,other, " DIA_Andre_Auslieferung_Halvor_08_02 " );	// I don't think this will be difficult. I'm ready to give you your award right now.
	B_GiveInvItems(self,other,ItMi_Gold,Bounty);
	B_StartOtherRoutine(Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE ;
	B_GivePlayerXP(XP_Andre_Ausliefer);
	Info_ClearChoices(DIA_Andre_Ausliefer);
};

func void DIA_Andre_Ausliefer_Nagur()
{
	AI_Teleport(Nagur, " NW_CITY_HABOR_KASERN_NAGUR " );
	AI_Output(other,self, " DIA_Andre_Auslieferung_Nagur_15_00 " );	// Nagur killed messenger Baltram. He tried to use me as a new messenger to intercept the goods from the Akila farm.
	AI_Output(self,other, " DIA_Andre_Auslieferung_Nagur_08_01 " );	// He will receive his well-deserved punishment. I will immediately order him put behind bars.
	AI_Output(self,other, " DIA_Andre_Auslieferung_Nagur_08_02 " );	// Here, get your reward. You deserve it.
	B_GiveInvItems(self,other,ItMi_Gold,Bounty);
	B_StartOtherRoutine(Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	MIS_Nagur_Bote = LOG_SUCCESS ;
	Nagur_Ausgeliefert = TRUE ;
	B_GivePlayerXP(XP_Andre_Ausliefer);
	Info_ClearChoices(DIA_Andre_Ausliefer);
};

func void DIA_Andre_Ausliefer_Canthar()
{
	AI_Teleport(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self, " DIA_Andre_Auslieferung_Canthar_15_00 " );	// Merchant Kantar is trying to get rid of Sarah!
	AI_Output(self,other, " DIA_Andre_Auslieferung_Canthar_08_01 " );	// Sarah? Arms dealers from the marketplace?
	AI_Output(other,self, " DIA_Andre_Auslieferung_Canthar_15_02 " );	// I had to slip Sarah a letter that would confirm that she was supplying weapons to Onar.
	AI_Output(self,other, " DIA_Andre_Auslieferung_Canthar_08_03 " );	// I understand. I'll gladly pay a bounty on this bastard. You can assume that he is already behind bars.
	B_GiveInvItems(self,other,ItMi_Gold,Bounty);
	B_StartOtherRoutine(Canthar,"KNAST");
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	Canthar_Ausgeliefert = TRUE ;
	B_GivePlayerXP(XP_Andre_Ausliefer);
	Info_ClearChoices(DIA_Andre_Ausliefer);
};

func void DIA_Andre_Ausliefer_Sarah()
{
	AI_Teleport(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(Canthar,"NW_CITY_SARAH");
	AI_Output(other,self, " DIA_Andre_Auslieferung_Sarah_15_00 " );	// Sara sells weapons to Onar.
	AI_Output(self,other, " DIA_Andre_Auslieferung_Sarah_08_01 " );	// Sara? An arms dealer from the marketplace? Do you have proof?
	AI_Output(other,self, " DIA_Andre_Auslieferung_Sarah_15_02 " );	// There is a letter in her pocket, with the details of delivering weapons to him.
	AI_Output(self,other, " DIA_Andre_Auslieferung_Sarah_08_03 " );	// She will pay for this. I will have her arrested.
	B_GiveInvItems(self,other,ItMi_Gold,Bounty);
	B_StartOtherRoutine(Sarah,"KNAST");
	B_StartOtherRoutine(Canthar, " MARKET STAND " );
	Sarah_Ausgeliefert = TRUE ;
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Andre_Ausliefer);
	Info_ClearChoices(DIA_Andre_Ausliefer);
};


instance DIA_Andre_DGRunning(C_Info)
{
	npc = MIL_311_Andre;
	nr = 4;
	condition = DIA_Andre_DGRunning_Condition;
	information = DIA_Andre_DGRunning_Info;
	permanent = TRUE;
	description = " About the Thieves Guild... " ;
};


func int DIA_Andre_DGRunning_Condition()
{
	if((MIS_Andre_GuildOfThieves == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info()
{
	AI_Output(other,self, " DIA_Andre_DGRunning_15_00 " );	// About the Thieves Guild...
	if (Andre_Diebesgilde_aufgeraeumt ==  TRUE )
	{
		AI_Output(self,other, " DIA_Andre_DGRunning_08_01 " );	// You can forget about this case. I sent my people down the drain.
		AI_Output(self,other, " DIA_Andre_DGRunning_08_02 " );	// The Thieves Guild is now nothing more than a page turned in the history of this city.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		if(MIS_CassiaKelche == LOG_Running)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if(MIS_CASSIAGOLDCUP == LOG_Running)
		{
			MIS_CASSIAGOLDCUP = LOG_OBSOLETE;
		};
		if(MIS_RamirezSextant == LOG_Running)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Да?
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, " I'm working on it... " ,DIA_Andre_DGRunning_BACK);
	if (Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, " I killed them all! " ,DIA_Andre_DGRunning_Success);
	};
	if (((Cassia.aivar[AIV_TalkedToPlayer] ==  TRUE ) || (Jesper.aivar[AIV_TalkedToPlayer] ==  TRUE ) || (Ramirez.aivar[AIV_TalkedToPlayer] ==  TRUE )) && (Diebesgilde_Verraten ==  FALSE ))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"Я нашел логово гильдии воров!",DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//Я работаю над этим...
	if(Diebesgilde_Verraten == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//Хорошо. Я дам тебе еще немного времени на выполнение этого задания.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Хорошо! Держи меня в курсе.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//Я нашел логово гильдии воров!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Где?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//В канализации под городом.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//Что? Мы запечатали канализацию...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//Похоже, это не помешало им проникнуть туда.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Ты ликвидировал этих преступников?
	Diebesgilde_Verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//Я всех их ликвидировал!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//Ты оказал городу большую услугу.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP(XP_GuildOfThievesPlatt);
	if(MIS_CassiaKelche == LOG_Running)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	if(MIS_CASSIAGOLDCUP == LOG_Running)
	{
		MIS_CASSIAGOLDCUP = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//Если ты все еще хочешь вступить в ополчение, дай мне знать.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//Ты выполнил нашу работу, как настоящий слуга Инноса и солдат короля.
	};
	AI_Output(self,other, " DIA_Andre_DGRunning_Success_08_04 " );	// You should be rewarded for these bandits. Here, take it.
	B_GiveInvItems(self,other,ItMi_Gold,Bounty *  3 );
	Info_ClearChoices(DIA_Andre_DGRunning);
};


instance DIA_Andre_JOIN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_JOIN_Condition;
	information = DIA_Andre_JOIN_Info;
	permanent = TRUE;
	description = " I'm ready to join the militia! " ;
};


func int DIA_Andre_JOIN_Condition()
{
	if ((hero.guild ==  GIL_NONE ) && Npc_KnowsInfo(other,DIA_Others_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info()
{
	AI_Output(other,self, " DIA_Andre_JOIN_15_00 " );	// I'm ready to join the militia!
	if(Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Andre_JOIN_08_00 " );	// Quartermaster Martin vouches for you and even recommends you to me. This is enough for me.
	}
	else if((MIS_Andre_GuildOfThieves == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		AI_Output(self,other, " DIA_Andre_JOIN_08_01 " );	// I'll keep my word and accept you into the militia, even though you're not a citizen of this city.
		AI_Output(self,other, " DIA_Andre_JOIN_08_02 " );	// But don't tell anyone about this! The less people know about this exception, the less I will have to make excuses.
	}
	else if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other, " DIA_Andre_JOIN_08_03 " );	// Are you a citizen of Khorinis?
		if(Player_IsApprentice == APP_Harad)
		{
			AI_Output(other,self, " DIA_Andre_JOIN_15_04 " );	// The blacksmith took me as an apprentice.
			AI_Output(self,other, " DIA_Andre_JOIN_08_05 " );	// Harad? I know him. He works for us. He is a worthy person.
		};
		if(Player_IsApprentice == APP_Constantino)
		{
			AI_Output(other,self, " DIA_Andre_JOIN_15_06 " );	// I'm an apprentice alchemist!
			AI_Output(self,other, " DIA_Andre_JOIN_08_07 " );	// We don't have many pundits in the militia. Perhaps your skills will be very useful to us.
			AI_Output(self,other, " DIA_Andre_JOIN_08_08 " );	// I don't know much about alchemy. But people say that he is a respected person.
		};
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output(other,self, " DIA_Andre_JOIN_15_09 " );	// Bosper, master archer, took me on as an apprentice.
			AI_Output(self,other, " DIA_Andre_JOIN_08_10 " );	// Then you probably know something about how to survive in the forest? This is good, because the militia has to perform tasks not only in the city.
			AI_Output(self,other, " DIA_Andre_JOIN_08_11 " );	// We definitely need people who can navigate the wilderness.
			AI_Output(self,other, " DIA_Andre_JOIN_08_12 " );	// And Bosper is a respected man in this city.
		};
		AI_Output(self,other, " DIA_Andre_JOIN_08_13 " );	// If he's vouched for you, there's nothing stopping you from joining the militia.
		if(MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Andre_JOIN_08_14 " );	// In addition, you managed to rid the city of the thieves' guild. I would accept you only for this feat.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Andre_JOIN_08_15 " );	// Maybe - but you're still not a citizen of this city, and I have orders.
		return;
	};
	AI_Output(self,other, " DIA_Andre_JOIN_08_16 " );	// You can join our ranks if you want. But your decision must be final.
	AI_Output(self,other, " DIA_Andre_JOIN_08_17 " );	// Once you put on the militia armor, you can no longer just take it off and leave our ranks.
	AI_Output(self,other, " DIA_Andre_JOIN_08_18 " );	// Are you ready to fight with us for Innos and the king?
	Info_ClearChoices(DIA_Andre_JOIN);
	Info_AddChoice(DIA_Andre_JOIN, " I'm not sure yet... " ,DIA_Andre_JOIN_No);
	Info_AddChoice(DIA_Andre_JOIN,"Я готов!",DIA_Andre_JOIN_Yes);
};

func void DIA_Andre_JOIN_Yes()
{	
	B_GivePlayerXP(XP_BecomeMiliz);
	AI_Output(other,self, " DIA_Andre_JOIN_Yes_15_00 " );	// I'm ready!
	AI_Output(self,other, " DIA_Andre_JOIN_Yes_08_01 " );	// So be it. Welcome to the city militia!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_MIL;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	CheckHeroGuild[0] = TRUE;
	Snd_Play("GUILD_INV");
	AI_Output(self,other, " DIA_Andre_JOIN_Yes_08_02 " );	// Here's your armor.
	B_GiveInvItems(self,other,ITAR_TOWNGUARD,1);
	AI_Output(self,other, " DIA_Andre_JOIN_Yes_08_03 " );	// Wear them with pride and dignity.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Lothar,"START");
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;

	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);


	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Wld_InsertNpc(Mil_362_Miliz,"NW_CITY_HABOUR_KASERN_JOHN_01");
	Wld_InsertNpc(Mil_363_Miliz,"NW_CITY_HABOUR_KASERN_JONNI_01");
	InsertJohnJonni = TRUE;
};

func void DIA_Andre_JOIN_No()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//Я пока не уверен...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//Если ты еще сомневаешься в своем решении, я не могу принять тебя в ополчение.
	Info_ClearChoices(DIA_Andre_JOIN);
};

instance DIA_Andre_PERMJOBPAY(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_permjobpay_condition;
	information = DIA_Andre_permjobpay_info;
	permanent = TRUE;
	description = "Как насчет моего жалования?";
};

func int DIA_Andre_permjobpay_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_permjobpay_info()
{
	var int daynow;
	var int sumpay;

	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Andre_PermJobPay_01_00");	//Как насчет моего жалования?

	if(AndrePAYDAY < daynow)
	{
		AI_Output(self,other,"DIA_Andre_PermJobPay_01_01");	//Конечно. Вот, возьми его.
	
		if(AndrePAYDAY > 0)
		{
			sumpay = 50 * (daynow - AndrePAYDAY);
			B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Gold,50);
		};

		AndrePAYDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_PermJobPay_01_03");	//Ты его уже сегодня получал. Еще вопросы?
	};
};

instance DIA_Andre_LORDHAGEN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_LORDHAGEN_Condition;
	information = DIA_Andre_LORDHAGEN_Info;
	permanent = FALSE;
	description = "Могу я теперь увидеть лорда Хагена?";
};

func int DIA_Andre_LORDHAGEN_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3) && (HagenFTMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_LORDHAGEN_Info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Могу я теперь увидеть лорда Хагена?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//Теперь ты состоишь нас службе у паладинов. Они пропустят тебя. Но твое сообщение должно быть действительно важным.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//Не волнуйся, это так и есть...
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//Помни, что ты встречаешься с главой паладинов. Веди себя соответствующе. Теперь ты представляешь не только себя, но все ополчение.
};


instance DIA_Andre_Waffe(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Waffe_Condition;
	information = DIA_Andre_Waffe_Info;
	permanent = FALSE;
	description = "А я получу оружие?";
};


func int DIA_Andre_Waffe_Condition()
{
	if ((other.guild ==  GIL_MIL ) && (Chapter <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Andre_Weapon_Info()
{
	AI_Output(other,self, " DIA_Andre_Waffe_15_00 " );	// Will I get a weapon?
	AI_Output(self,other, " DIA_Andre_Waffe_08_01 " );	// Of course. This is usually done by Peck. But I haven't seen him for a long time.
	AI_Output(self,other, " DIA_Andre_Waffe_08_02 " );	// Find out where he's hiding and bring him here. Then he will give you a weapon.
	AI_Output(self,other, " DIA_Andre_Waffe_08_03 " );	// And if you want to sleep, you can choose any bed in our barracks.
	MIS_Andre_Peck = LOG_Running;
	Log_CreateTopic(TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Peck,LOG_Running);
	B_LogEntry(TOPIC_Peck, " Peck is somewhere in the city. If I bring him back to the barracks, I can get a weapon from him. " );
	AI_StopProcessInfos(self);
};

instance DIA_Andre_FOUND_PECK(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_PECK_Condition;
	information = DIA_Andre_FOUND_PECK_Info;
	permanent = FALSE;
	description = " I managed to find Peck. " ;
};


func int DIA_Andre_FOUND_PECK_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Peck_FOUND_PECK) && (MY_Other_Peck == LOG_Running) && (Npc_IsDead(Peck) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_PECK_Info()
{
	AI_Output(other,self, " DIA_Andre_FOUND_PECK_15_00 " );	// I managed to find Peck.
	AI_Output(self,other, " DIA_Andre_FOUND_PECK_08_01 " );	// Yes, he has already returned to his post and started to fulfill his duties. Where did you find it?
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
	Info_AddChoice(DIA_Andre_FOUND_PECK, " Stumbled upon him in town... " ,DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice(DIA_Andre_FOUND_PECK, " I found him in a brothel... " ,DIA_Andre_FOUND_PECK_REDLIGHT);
};

func void DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output(other,self, " DIA_Andre_FOUND_PECK_SOMEWHERE_15_00 " );	// I stumbled upon it by chance in the city.
	AI_Output(self,other, " DIA_Andre_FOUND_PECK_SOMEWHERE_08_01 " );	// Okay, now go to him and get a weapon.
	MIS_Andre_Peck = LOG_SUCCESS;
	B_GivePlayerXP(XP_FoundPeck);
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output(other,self, " DIA_Andre_FOUND_PECK_REDLIGHT_15_00 " );	// He was in the Red Lantern.
	AI_Output(self,other, " DIA_Andre_FOUND_PECK_REDLIGHT_08_01 " );	// That is, he was having fun with the girls instead of doing his duties.
	AI_Output(self,other, " DIA_Andre_FOUND_PECK_REDLIGHT_08_02 " );	// I think I need to have a serious talk with him.
	B_GivePlayerXP(XP_FoundPeck * 2);
	MIS_Andre_Peck = LOG_SUCCESS;
	PeckCatch = TRUE;
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void B_AndreSold()
{
	AI_Output(self,other, " DIA_Andre_Sold_08_00 " );	// Here's your salary.
	B_GiveInvItems(self,other,ItMi_Gold,Andre_Sold);
};


instance DIA_Andre_FIRSTMISSION(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIRSTMISSION_Condition;
	information = DIA_Andre_FIRSTMISSION_Info;
	permanent = FALSE;
	description = " Do you have a task for me? " ;
};


func int DIA_Andre_FIRSTMISSION_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTMISSION_Info()
{
	AI_Output(other,self, " DIA_Andre_FIRSTMISSION_15_00 " );	// Do you have a task for me?
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_01 " );	// Recently, a lot of marsh grass has appeared in the city.
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_02 " );	// We can't let this plague spread throughout the city.
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_03 " );	// Otherwise, everyone will only smoke weed and won't be able to work, let alone hold a weapon.
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_04 " );	// This is invalid. Especially now, when the danger of an attack by orcs or mercenaries is so great.
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_05 " );	// I suspect mercenaries are involved. I bet they brought the herb to town.
	AI_Output(other,self, " DIA_Andre_FIRSTMISSION_15_06 " );	// What can I do?
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_07 " );	// Mortis, one of our men, heard in the port tavern that somewhere in the port there is a whole bale of this herb.
	AI_Output(self,other, " DIA_Andre_FIRSTMISSION_08_08 " );	// Look there and bring this bale to me.
	MIS_Andre_WAREHOUSE = LOG_Running;
	Log_CreateTopic(TOPIC_Warehouse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Warehouse,LOG_Running);
	B_LogEntry(TOPIC_Warehouse, " A bale of marsh grass has arrived at the harbor. Mortis heard about it at the local pub. I must find this bale and bring it to Lord Andre. " );

	if (Nadja_GaveLuciaInfo ==  FALSE )
	{
		Bromor_Pay = FALSE;
		NadjaIsUp = FALSE;
		Nadja_Night = FALSE ;
	};
};


instance DIA_Andre_FOUND_STUFF(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_STUFF_Condition;
	information = DIA_Andre_FOUND_STUFF_Info;
	permanent = TRUE;
	description = " About the bale... " ;
};


func int DIA_Andre_FOUND_STUFF_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_STUFF_Info()
{
	AI_Output(other,self, " DIA_Andre_FOUND_STUFF_15_00 " );	// About the bale...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Ты нашел его?
	if((Npc_HasItems(other,ItMi_HerbPaket) > 0) || (MIS_Cipher_Paket == LOG_SUCCESS))
	{
		Info_ClearChoices(DIA_Andre_FOUND_STUFF);
		if(Npc_HasItems(other,ItMi_HerbPaket) > 0)
		{
			Info_AddChoice(DIA_Andre_FOUND_STUFF,"Да, вот он.",DIA_Andre_FOUND_STUFF_Ja);
		};
		Info_AddChoice(DIA_Andre_FOUND_STUFF, " I threw it in the sea. " ,DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Пока нет.
	};
};

func void DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output(other,self, " DIA_Andre_FOUND_STUFF_Ja_15_00 " );	// Yes, here it is.
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other, " DIA_Andre_FOUND_STUFF_Ja_08_01 " );	// Great! We will protect this grass.
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP(XP_Warehouse_Super * 2);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};

func void DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output(other,self, " DIA_Andre_FOUND_STUFF_Becken_15_00 " );	// I threw it into the sea.
	AI_Output(self,other, " DIA_Andre_FOUND_STUFF_Becken_08_01 " );	// Yes? Well, the main thing is that now she will not be able to fall into bad hands.
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP(XP_Warehouse_Super);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};


instance DIA_Andre_FIND_DEALER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIND_DEALER_Condition;
	information = DIA_Andre_FIND_DEALER_Info;
	permanent = FALSE;
	description = " Do you have another job for me? " ;
};


func int DIA_Andre_FIND_DEALER_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(Borka) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FIND_DEALER_Info()
{
	AI_Output(other,self, " DIA_Andre_FIND_DEALER_15_00 " );	// Do you have another job for me?
	AI_Output(self,other, " DIA_Andre_FIND_DEALER_08_01 " );	// You've taken swamp grass out of circulation - that's good.
	AI_Output(self,other, " DIA_Andre_FIND_DEALER_08_02 " );	// But I want to know who is distributing it to the townspeople.
	AI_Output(self,other, " DIA_Andre_FIND_DEALER_08_03 " );	// It must be someone in the waterfront.
	AI_Output(self,other, " DIA_Andre_FIND_DEALER_08_04 " );	// If this person came to town often, he would have been caught long ago.
	AI_Output(other,self, " DIA_Andre_FIND_DEALER_15_05 " );	// What exactly do I need to do?
	AI_Output(self,other, " DIA_Andre_FIND_DEALER_08_06 " );	// Find a merchant and make him sell you this herb. It won't be easy, but otherwise we won't be able to arrest him.
	AI_Output(self,other, " DIA_Andre_FIND_DEALER_08_07 " );	// Talk to Mortis. He knows the port area well. Perhaps he can help you.
	MIS_Andre_REDLIGHT = LOG_Running;
	B_StartOtherRoutine(Nadja,"SMOKE");
	Log_CreateTopic(TOPIC_Redlight,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Redlight,LOG_Running);
	B_LogEntry(TOPIC_Redlight, " I have to find a man selling swamp grass in the waterfront. I have to get him to sell me some grass. Mortis can help me with that. " );
};


instance DIA_Andre_REDLIGHT_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_REDLIGHT_SUCCESS_Condition;
	info = DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent = TRUE;
	description = " About grass... " ;
};


func int DIA_Andre_REDLIGHT_SUCCESS_Condition()
{
	if ((MIS_Andre_REDLIGHT == LOG_Running) && ( MIS_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Andre_REDLIGHT_SUCCESS_Info()
{
	AI_Output(other,self, " DIA_Andre_REDLIGHT_SUCCESS_15_00 " );	// About grass...
	if((Npc_IsDead(Borka) == TRUE) || (Undercover_Failed == TRUE))
	{
		AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_01 " );	// I don't think we'll be able to find anything in the waterfront now.
		if (Npc_IsDead(Borka) ==  TRUE )
		{
			AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_02 " );	// Not now that this bouncer is dead.
		};
		if (Nadja_Victim ==  TRUE )
		{
			AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_03 " );	// That Red Lantern girl, Nadia, is dead. Perhaps this is just a coincidence.
			B_RemoveNpc(Nadja);
		};
		if(Undercover_Failed == TRUE)
		{
			AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_04 " );	// You weren't careful enough.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED ;
	}
	else if(Borka_Deal == 2)
	{
		AI_Output(other,self, " DIA_Andre_REDLIGHT_SUCCESS_15_05 " );	// I know who's spreading the weed in the city. This is Borka, the Red Lantern bouncer.
		AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_06 " );	// Right? Do you have proof?
		AI_Output(other,self, " DIA_Andre_REDLIGHT_SUCCESS_15_07 " );	// He sold me swamp grass.
		AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_08 " );	// Great, that's enough for us. I will have him arrested immediately.
		B_StartOtherRoutine(Borka,"PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP(XP_Redlight);
		B_AndreSold();
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_04");	//Тебя же, я от имени всего ополчения благодарю за помощь!
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_05");	//И в доказательство моих слов, вот - прими от меня эти доспехи.
		B_GiveInvItems(self,other,ItAr_MIL_L,1);
		AI_Output(self,other, " DIA_Wulfgar_Bandits_Done_01_06 " );	// You rightfully deserve them, soldier!
	}
	else
	{
		AI_Output(other,self, " DIA_Andre_REDLIGHT_SUCCESS_15_09 " );	// ...I'm still working on it.
		AI_Output(self,other, " DIA_Andre_REDLIGHT_SUCCESS_08_10 " );	// Good. Remember that you have to get this person to make a deal with you.
	};
};


instance DIA_Andre_HILFBAUERLOBART (C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_HILFBAUERLOBART_Condition;
	information = DIA_Andre_HILFBAUERLOBART_Info;
	description = " Do you have any more tasks for me? " ;
};


func int DIA_Andre_HILFBAUERLOBART_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_HILFBAUERLOBART_Info()
{
	AI_Output(other,self, " DIA_Andre_HILFBAUERLOBART_15_00 " );	// Do you have any more tasks for me?
	AI_Output(self,other, " DIA_Andre_HILFBAUERLOBART_08_01 " );	// Farmer Lobart has some problems in his fields.
	AI_Output(self,other, " DIA_Andre_HILFBAUERLOBART_08_02 " );	// If we help him, it will strengthen his relationship with the city. So go there and see what's wrong there.
	Log_CreateTopic(TOPIC_Feldraeuber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber,LOG_Running);
	B_LogEntry(TOPIC_Feldraeuber, " Andre sent me to Lobart's farm. I have to help Lobart restore order on the farm again. " );
	MIS_AndreHelpLobart = LOG_Running;
	Wld_InsertNpc(Lobarts_Giant_Bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug7,"NW_FARM1_FIELD_03");
	B_StartOtherRoutine(Vino,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer2,"BUGSTHERE");
	if(SNIPSGETNUGGETS == FALSE)
	{
		B_StartOtherRoutine(snipes,"BUGSTHERE");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Andre_LOBART_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_LOBART_SUCCESS_Condition;
	information = DIA_Andre_LOBART_SUCCESS_Info;
	description = " I helped Lobart. " ;
};


func int DIA_Andre_LOBART_SUCCESS_Condition()
{
	if(MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_LOBART_SUCCESS_Info()
{
	AI_Output(other,self, " DIA_Andre_LOBART_SUCCESS_15_00 " );	// I helped Lobart.
	AI_Output(self,other, " DIA_Andre_LOBART_SUCCESS_08_01 " );	// Excellent. If Lobart is happy, he will continue to sell turnips to the city.
	B_GivePlayerXP(XP_LobartBugs);
	B_AndreSold();
};


instance DIA_Addon_Andre_MissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople_Condition;
	information = DIA_Addon_Andre_MissingPeople_Info;
	description = " What about missing people? " ;
};


func int DIA_Addon_Andre_MissingPeople_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Andre_MissingPeople_15_00 " );	// What about missing people?
	AI_Output(self,other, " DIA_Addon_Andre_MissingPeople_08_01 " );	// What about them?
	AI_Output(other,self, " DIA_Addon_Andre_MissingPeople_15_02 " );	// Shouldn't we try to find them?
	AI_Output(self,other, " DIA_Addon_Andre_MissingPeople_08_03 " );	// Lord Hagen has entrusted me with the defense of the city and the surrounding farms.
	AI_Output(self,other, " DIA_Addon_Andre_MissingPeople_08_04 " );	// It means we care about the people who are still HERE.
	AI_Output(self,other, " DIA_Addon_Andre_MissingPeople_08_05 " );	// Militia soldiers patrol the streets at night. That's all I can do.
	AI_Output(self,other, " DIA_Addon_Andre_MissingPeople_08_06 " );	// And YOU will do what I order you. Do you understand me?
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_MissingPeople2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople2_Condition;
	information = DIA_Addon_Andre_MissingPeople2_Info;
	description = " Regarding missing people... " ;
};


func int DIA_Addon_Andre_MissingPeople2_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (other.guild != GIL_MIL) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople2_Info()
{
	AI_Output(other,self, " DIA_Addon_Andre_MissingPeople2_15_00 " );	// About missing people...
	AI_Output(self,other, " DIA_Addon_Andre_MissingPeople2_08_01 " );	// Leave me alone! I have a lot of other worries.
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_ReturnedMissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information = DIA_Addon_Andre_ReturnedMissingPeople_Info;
	description = " I managed to save some of the missing people. " ;
};


func int DIA_Addon_Andre_ReturnedMissingPeople_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (MIS_Addon_Andre_MissingPeople == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Andre_ReturnedMissingPeople_15_00 " );	// I managed to save some of the missing people.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Addon_Andre_ReturnedMissingPeople_08_01 " );	// And I was wondering where you were all this time!
		AI_Output(self,other, " DIA_Addon_Andre_ReturnedMissingPeople_08_02 " );	// You are a militia soldier! And you didn't get orders to search for the missing!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//Но...
	};
	AI_Output(self,other, " DIA_Addon_Andre_ReturnedMissingPeople_08_04 " );	// How many people did you save?
	AI_Output(other,self, " DIA_Addon_Andre_ReturnedMissingPeople_15_05 " );	// All those who were still alive...
	AI_Output(self,other, " DIA_Addon_Andre_ReturnedMissingPeople_08_06 " );	// Everyone?! I... Uh-uh...
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Addon_Andre_ReturnedMissingPeople_08_07 " );	// I'm proud of you! And I'm glad I accepted you into our ranks.
		B_AndreSold();
	};
	AI_Output(self,other, " DIA_Addon_Andre_ReturnedMissingPeople_08_08 " );	// You did a great job!
	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Andre_MissingPeople);
};

func void B_Andre_GotoLordHagen()
{
	AI_Output(self,other, " DIA_Andre_Add_08_11 " );	// You'd better go straight to him.
};


instance DIA_Andre_ReportDrachen (C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachen_Condition;
	information = DIA_Andre_ReportDrachen_Info;
	permanent = FALSE;
	description = " I was in the Valley of Mines and saw dragons! " ;
};


func int DIA_Andre_BerichtDrachen_Condition()
{
	if ((EnterOW_Chapter2 ==  TRUE ) && ( MY_OLDWORLD  !=  LOG_SUCCESS ) && ( MY_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachen_Info()
{
	AI_Output(other,self, " DIA_Andre_Add_15_13 " );	// I was in the Valley of Mines and saw dragons!
	if(Npc_HasItems(hero,ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output(other,self, " DIA_Andre_Add_15_14 " );	// I have a letter from Commander Garond confirming what I said.
	};
	AI_Output(self,other, " DIA_Andre_Add_08_10 " );	// This will interest Lord Hagen!
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_BennetInPrison(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_BennetInPrison_Condition;
	information = DIA_Andre_BennetInPrison_Info;
	permanent = TRUE;
	description = " What about Bennet the blacksmith? " ;
};


func int DIA_Andre_BennetInPrison_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BennetInPrison_Info()
{
	AI_Output(other,self, " DIA_Andre_BennetInPrison_15_00 " );	// What about Bennet, the blacksmith?
	AI_Output(self,other, " DIA_Andre_BennetInPrison_08_01 " );	// You mean this mercenary? He sits behind bars, where he belongs.
	AI_Output(other,self, " DIA_Andre_BennetInPrison_Talk_15_00 " );	// Can I talk to him?
	AI_Output(self,other, " DIA_Andre_BennetInPrison_Talk_08_01 " );	// Of course. But if you try to help him escape, you will end up behind bars next to him.
};

var int AndreCatchCorn;

instance DIA_Andre_Cornelius_Liar(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Cornelius_Liar_Condition;
	information = DIA_Andre_Cornelius_Liar_Info;
	permanent = TRUE;
	description = " I think Cornelius is lying. " ;
};

func int DIA_Andre_Cornelius_Liar_Condition()
{
	if((Cornelius_ThreatenByMilSC == TRUE) && (CorneliusFlee != TRUE) && (AndreCatchCorn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Cornelius_Liar_Info()
{
	AI_Output(other,self, " DIA_Andre_Cornelius_Liar_15_00 " );	// I think Cornelius is lying.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Ты уверен?
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
	Info_AddChoice(DIA_Andre_Cornelius_Liar, " Net. " ,DIA_Andre_Cornelius_Liar_No);
	Info_AddChoice(DIA_Andre_Cornelius_Liar, " Yes . " ,DIA_Andre_Cornelius_Liar_Yes);
};

func void DAY_Andre_Cornelius_Liar_No()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//Нет.
	AI_Output(self,other, " DIA_Andre_Cornelius_Liar_No_08_01 " );	// Then don't voice your suspicions out loud.
	AI_Output(self,other, " DIA_Andre_Cornelius_Liar_No_08_02 " );	// Cornelius is an influential person. He can make your life hell if he wants to.
	AI_Output(self,other, " DIA_Andre_Cornelius_Liar_No_08_03 " );	// Until you have proof, there's nothing I can do to help you.
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};

func void DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Да.
	AI_Output(self,other, " DIA_Andre_Cornelius_Liar_Yes_08_01 " );	// What evidence do you have?

	if(Cornelius_IsLiar == TRUE)
	{
		AI_Output(other,self, " DIA_Andre_Cornelius_Liar_Yes_15_02 " );	// I read his diary! He was bribed. Everything he said was a lie.
		AI_Output(self,other, " DIA_Andre_Cornelius_Liar_Yes_08_03 " );	// If this is true, you must inform Lord Hagen immediately.
		AI_Output(self,other, " DIA_Andre_Cornelius_Liar_Yes_08_04 " );	// Show him this diary. He will figure this out.
		AndreCatchCorn = TRUE ;
	}
	else
	{
		AI_Output(other,self, " DIA_Andre_Cornelius_Liar_Yes_15_05 " );	// Uh-uh, well, I guess...
		AI_Output(self,other, " DIA_Andre_Cornelius_Liar_Yes_08_06 " );	// I need proof, not speculation. Bring proof and then I can do something.
		AI_Output(self,other, " DIA_Andre_Cornelius_Liar_Yes_08_07 " );	// Until then, you should be careful with your choice of words.
	};

	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};


instance DIA_Andre_Paladin(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Paladin_Condition;
	information = DIA_Andre_Paladin_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Paladin_Condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladin_Info()
{
	AI_Output(self,other, " DIA_Andre_Paladin_08_00 " );	// Now you're a paladin! Congratulations!
	AI_Output(self,other, " DIA_Andre_Paladin_08_01 " );	// I knew from the start that you wouldn't last long in the militia.
};


instance DIA_Andre_PERM(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_PERM_Condition;
	information = DIA_Andre_PERM_Info;
	permanent = TRUE;
	description = " How is the city? " ;
};


func int DIA_Andre_PERM_Condition()
{
	if((other.guild != GIL_NONE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_PERM_Info()
{
	AI_Output(other,self, " DIA_Andre_PERM_15_00 " );	// How is the situation in the city?
	AI_Output(self,other, " DIA_Andre_PERM_08_01 " );	// Everything is under control.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Andre_PERM_08_02 " );	// Do your jobs.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Andre_PERM_08_03 " );	// From now on, you must report directly to Lord Hagen. Go talk to him.
	};
};


instance DIA_Andre_ReportDrachenTot (C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachenTot_Condition;
	information = DIA_Andre_ReportDrachenTot_Info;
	permanent = FALSE;
	description = " I've killed all the dragons in the Valley of Mines! " ;
};


func int DIA_Andre_BerichtDrachenTot_Condition()
{
	if ((Capital ==  5 ) && ( MIS_OR с GREATWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachenTot_Info()
{
	AI_Output(other,self, " DIA_Andre_Add_15_15 " );	// I've killed all the dragons in the Valley of Mines!
	AI_Output(self,other, " DIA_Andre_Add_08_08 " );	// If this is true, you should tell Lord Hagen about it.
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_ReportTorAuf (C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_ReportGoalOpen_Condition;
	information = DIA_Andre_ReportTorAuf_Info;
	permanent = FALSE;
	description = " Orcs attacked the castle in the Valley of Mine! " ;
};


func int DIA_Other_Add_TorAf_Condition()
{
	if ((Chapter ==  5 ) && (MY_OCGateOpen ==  TRUE ) && Npc_KnowsInfo(other,DIA_Other_EnrichtDrachenTot))
	{
		return TRUE;
	};
};

func void DIA_Andre_ReportGoalOpen_Info()
{
	AI_Output(other, self, " DIA_Andre_Add_15_16 " );	// The castle in the Vale of Mines has been stormed by orcs!
	AI_Output(self,other, " DIA_Andre_Add_08_09 " );	// Lord Hagen needs to hear about this.
	B_Andre_GotoLordHagen();
};

instance DIA_ANDRE_GUILDKILL (C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_guildkill_condition;
	information = dia_other_guildkill_info;
	permanent = FALSE;
	description = " Is there anything else I can do? " ;
};

func int dia_andre_guildkill_condition()
{
	if ((other.guild ==  GIL_MIL ) && (MY_OTHER_WAREHOUSE ==  LOG_SUCCESS ) && ( STARTKILLERWAY  ==  FALSE ) && ( CHIEFKILLERISDEAD  ==  FALSE ) && (CassiaIsDead ==  FALSE ) && (RamirezIsDead ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_andre_guildkill_info()
{
	AI_Output(other,self, " DIA_Andre_GuildKill_01_00 " );	// Is there anything else I can do?
	AI_Output(self,other, " DIA_Andre_GuildKill_01_01 " );	// Yes, there is another problem. And quite serious.
	AI_Output(self,other, " DIA_Andre_GuildKill_01_03 " );	// Lately, I've been very worried about rumors of an assassin's guild in town.
	AI_Output(self,other, " DIA_Andre_GuildKill_01_06 " );	// We need to solve this problem somehow. And the sooner we get this sorted out, the better.
	AI_Output(other,self, " DIA_Andre_GuildKill_01_07 " );	// What can we do?
	AI_Output(self,other, " DIA_Andre_GuildKill_01_09 " );	// We don't know much about these guys. Well, except for the fact that we know the name of the one who leads it.
	AI_Output(self,other, " DIA_Andre_GuildKill_01_11 " );	// His name is Asmal. He is said to be a very dangerous and bloodthirsty type.
	AI_Output(self,other, " DIA_Andre_GuildKill_01_12 " );	// So if you manage to get on his trail, be careful!
	AI_Output(other,self, " DIA_Andre_GuildKill_01_13 " );	// What should I do if I find this assassin's guild?
	AI_Output(self,other, " DIA_Andre_GuildKill_01_14 " );	// Try to gain their trust to learn more about them. Or you can just deal with these guys.
	AI_Output(self,other, " DIA_Andre_GuildKill_01_15 " );	// If you don't think you can handle it, just tell me their names and where they're hiding.
	STARTKILLERWAY_OTHER = TRUE ;
	MIS_GUILDKILL = LOG_Running;
	Log_CreateTopic(TOPIC_GUILDKILL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_Running);
	B_LogEntry( TOPIC_GUILDKILL , " Lord Andre is concerned about rumors of an assassin's guild in Khorinis. To avoid unnecessary complications and reassure the townspeople, he asked me to investigate the case as quickly as possible. Lord Andre could not tell me much about the guild, but mentioned that it is led by a certain Asmal - a dangerous and treacherous type. In any case, if I get on the trail of these guys, Lord Adnre explicitly ordered me to try to gain their trust in order to learn more about this guild, or just deal with them. " );
};


instance DIA_ANDRE_GUILDKILLNEWS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_guildkillnews_condition;
	information = dia_andre_guildkillnews_info;
	permanent = TRUE;
	description = " Regarding the Assassin's Guild... " ;
};


func int dia_andre_guildkillnews_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_guildkillnews_info()
{
	AI_Output(other,self, " DIA_Andre_GuildKillNews_01_00 " );	// About the Assassin's Guild...
	AI_Output(self,other, " DIA_Andre_GuildKillNews_01_01 " );	// Yes? Do you have something to report?

	if((CHIEFKILLERISDEAD == TRUE) && (GUILDKILLISDEAD == FALSE))
	{
		AI_Output(other,self, " DIA_Andre_GuildKillNews_01_02 " );	// Asmal is dead!
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_03 " );	// So you finally managed to get on his trail and finish off this bastard. This is great news!
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_04 " );	// I think this is enough to calm the inhabitants of the city.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_05 " );	// Without their leader, these guys won't be as dangerous as they used to be.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_06 " );	// You did a good job. Here, take this gold - you deserve it!
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_GUILDKILL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
		B_LogEntry( TOPIC_GUILDKILL , " Lord André was delighted to hear that I had killed Asmal's assassin guild master. He thinks that will be enough to calm the town's inhabitants. " );
	}
	else if(GUILDKILLISDEAD == TRUE)
	{
		AI_Output(other,self, " DIA_Andre_GuildKillNews_01_07 " );	// I've dealt with these guys. You can forget about this problem.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_08 " );	// (surprised) So you managed to do it after all? This is great news!
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_10 " );	// You did a good job. Here, take this gold - you deserve it!
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		MIS_GUILDKILL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
		B_LogEntry( TOPIC_GUILDKILL , " Lord Andre was pleased to hear that I've done away with the Assassin's Guild. " );
	}
	else if(GUILDKILLKNOWNLOC == TRUE)
	{
		if(KILLFINISH == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_11 " );	// I found out who these people really are!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_12");	//И?
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_13 " );	// Traveling musicians who arrived in town a couple of weeks ago. They give performances on the marketplace of Khorinis.
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_14 " );	// And the man named Gillian is none other than Asmal himself!
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_15 " );	// Hmmm...(puzzled) I never would have thought.
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_17 " );	// Well, if so... Good! I will immediately order the guards to capture these people.
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_18 " );	// This can be problematic.
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_19 " );	// What do you mean?
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_20 " );	// Asmal and his men have left the city, and I don't think they'll ever come back. Too dangerous!
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_22 " );	// Now they hang out near Onar's farm.
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_26 " );	// Okay. The main thing is that the assassins guild will no longer disturb the citizens of Khorinis.
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_27 " );	// As for you, you did a good job. Here, take this gold - you deserve it!
			B_GiveInvItems(self,other,ItMi_Gold,150);
			MIS_GUILDKILL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
			B_LogEntry( TOPIC_GUILDKILL , " I gave Lord Andre the names of the people who were in the assassin's guild, and he in turn thanked me for my help. However, he was a little upset that Asmal and his people were able to slip out of the city. Now the option is to deal with them practically impossible. " );
		}
		else
		{
			B_GivePlayerXP(150);
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_28 " );	// I found out who these people really are!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_29");	//И?
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_30 " );	// Traveling musicians who arrived in town a couple of weeks ago. They give performances on the marketplace of Khorinis.
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_31 " );	// And the man named Gillian is none other than Asmal himself!
			AI_Output(other,self, " DIA_Andre_GuildKillNews_01_34 " );	// Now they are all hiding in an abandoned house on the pier.
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_35 " );	// Well, if so... Good! I will immediately order the guards to capture these people.
			AI_Output(self,other, " DIA_Andre_GuildKillNews_01_36 " );	// As for you, you did a good job. Here, take this gold - you deserve it!
			B_GiveInvItems(self,other,ItMi_Gold,150);
			MIS_GUILDKILL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
			B_LogEntry( TOPIC_GUILDKILL , " I gave Lord Andre the names of those people who were in the assassin's guild, and he in turn thanked me for my help and added that the city militia would take care of everything else. " );
			B_KillNpc(PIR_1390_Addon_InExtremo_DrPymonte);
			B_KillNpc(PIR_1391_Addon_InExtremo_TheFlail);
			B_KillNpc(PIR_1395_Addon_InExtremo_Lutter);
			B_KillNpc(PIR_1396_Addon_InExtremo_Flex);
			B_KillNpc(pir_1397_addon_inextremo_charlotte);
			B_KillNpc(pir_1398_addon_inextremo_announcer);
		};
	}
	else if((MEETKILLLATE == TRUE) && (MEETKILLLATELOG == TRUE))
	{
		AI_Output(other,self, " DIA_Andre_GuildKillNews_01_37 " );	// I think I failed.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_38 " );	// What? Why do you say that?
		AI_Output(other,self, " DIA_Andre_GuildKillNews_01_39 " );	// I had an appointment that I was late for. On it, I could find out something about the guild of assassins.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_41 " );	// How did you let this happen?! You're unlikely to find out anything else.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_42 " );	// Okay. What can you do now. Maybe we'll find a way to track down these bastards. Although I doubt it.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_43 " );	// (annoyed) Damn!
		MIS_GUILDKILL = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_GUILDKILL);
	}
	else
	{
		AI_Output(other,self, " DIA_Andre_GuildKillNews_01_44 " );	// Not yet.
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_45 " );	// Then don't interrupt me!
		AI_Output(self,other, " DIA_Andre_GuildKillNews_01_46 " );	// Come only when you know something about it.	
	};
};


instance DAY_ANDRE_SARAHTOGUILD (C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_sarahtoguild_condition;
	information = dia_andre_sarahtoguild_info;
	permanent = FALSE;
	description = " I want to pay a fine for a prisoner. " ;
};


func int dia_andre_sarahtoguild_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (Sarah_Ausgeliefert == TRUE) && (MIS_SARAHTOGUILD == LOG_Running) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void day_andre_sarahtoguild_info()
{
	AI_Output(other,self, " DIA_Andre_SarahToGuild_01_00 " );	// I want to pay a fine for a prisoner.
	AI_Output(self,other, " DIA_Andre_SarahToGuild_01_01 " );	// Good. Who do you want to pay the fine for?
	AI_Output(other,self, " DIA_Andre_SarahToGuild_01_02 " );	// For a merchant named Sarah.
	AI_Output(self,other, " DIA_Andre_SarahToGuild_01_03 " );	// Sara? Hmmm... (thoughtfully) She is accused of selling weapons to Onar's mercenaries.
	AI_Output(self,other, " DIA_Andre_SarahToGuild_01_04 " );	// This is a serious crime!
	AI_Output(other,self, " DIA_Andre_SarahToGuild_01_05 " );	// I know. And what is the price of her freedom?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_06 " );	// Let me think... (thoughtfully) Well, given the gravity of her guilt...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_07 " );	// ...and the fact that one of the venerable Firebenders is asking for her...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_08 " );	// I think three hundred gold coins should be enough to clear all charges against her.
		B_LogEntry( TOPIC_SARAHTOGUILD , " Lord Andre imposed a fine of three hundred gold coins on Sarah the trader. " );
		SARASHULDEN = 300 ;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_09 " );	// Let me think... (thoughtfully) Well, given the gravity of her guilt...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_10 " );	// ...and the fact that one of the venerable Waterbenders is asking for it...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_11 " );	// I think four hundred gold coins should be enough to clear all charges against her.
		B_LogEntry( TOPIC_SARAHTOGUILD , " Lord Andre fined trader Sarah four hundred gold pieces. " );
		SARASHULDEN = 400 ;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_12 " );	// Let me think... (thoughtfully) Well, given the gravity of her guilt...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_13 " );	// ...and the fact that one of my paladin brothers is asking for it...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_14 " );	// I think three hundred gold coins should be enough to clear all charges against her.
		B_LogEntry( TOPIC_SARAHTOGUILD , " Lord Andre imposed a fine of three hundred gold coins on Sarah the trader. " );
		SARASHULDEN = 300 ;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_15 " );	// Let me think... (thoughtfully) Well, given the gravity of her guilt...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_16 " );	// ...and the fact that one of the people in the city militia is asking for her...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_17 " );	// I think five hundred gold coins should be enough to clear all charges against her.
		B_LogEntry( TOPIC_SARAHTOGUILD , " Lord Andre has imposed a fine of five hundred gold pieces on Trader Sarah. " );
		SARASHULDEN = 500 ;
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_18 " );	// Let me think... (thoughtfully) Well, given the gravity of her guilt...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_19 " );	// ...and the fact that one of the mercenaries is asking for her... (grins)
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_20 " );	// I think a thousand and a half gold coins should be enough to clear all charges against her.
		AI_Output(other,self,"DIA_Andre_SarahToGuild_01_21");	//Ого!
		B_LogEntry( TOPIC_SARAHTOGUILD , " Lord Andre imposed a fine of 1,500 gold coins on trader Sarah. " );
		SARASHULDEN = 1500 ;
	}
	else
	{
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_22 " );	// Let me think... (thoughtfully) Well, given the gravity of her guilt...
		AI_Output(self,other, " DIA_Andre_SarahToGuild_01_23 " );	// I think a thousand gold coins should be enough to clear all charges against her.
		AI_Output(other,self,"DIA_Andre_SarahToGuild_01_24");	//Ого!
		B_LogEntry( TOPIC_SARAHTOGUILD , " Lord Andre imposed a fine of one thousand gold coins on Sarah the trader. " );
		SARASHULDEN = 1000 ;
	};
	AI_Output(self,other, " DIA_Andre_SarahToGuild_01_25 " );	// This is my decision.
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_26");	//Ясно.
};


DIA_ANDRE_SARAHTOGUILDPAY (C_Info) instance
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_sarahtoguildpay_condition;
	information = dia_andre_sarahtoguildpay_info;
	permanent = TRUE;
	description = " Free trader Sarah. " ;
};


func int dia_andre_sarahtoguildpay_condition()
{
	if (( SARAHELPYOUANDFREE  ==  TRUE ) && (Sarah_Ausgeliefert ==  TRUE ) && ( SARASHOULD  >  0 ) && ( SARAISFREE  ==  FALSE ) && ( MIS_SARAHTOGUILD  == LOG_Running ) && ( MIS_OR TO GREATWAR  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void day_andre_sarahtoguildpay_info()
{
	AI_Output(other,self, " DIA_Andre_SarahToGuildPay_01_00 " );	// Free trader Sarah.
	AI_Output(self,other, " DIA_Andre_SarahToGuildPay_01_01 " );	// Where's the money you owe in compensation for her crime?
	if (Npc_HasItems(other,ItMi_Gold) >=  SARASHULDEN )
	{
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(other,ItMi_Gold,SARASHULDEN);
		AI_Output(other,self, " DIA_Andre_SarahToGuildPay_01_02 " );	// Here's your gold.
		AI_Output(self,other, " DIA_Andre_SarahToGuildPay_01_03 " );	// Great! Now I'll make sure Sarah's saleswoman is cleared of all charges.
		AI_Output(self,other, " DIA_Andre_SarahToGuildPay_01_04 " );	// She's free.
		B_LogEntry( TOPIC_SARAHTOGUILD , " I freed Sarah from jail. Now I need to talk to her. " );
		SARAISFREE = TRUE;
		Npc_ExchangeRoutine(VLK_470_Sarah,"InTavern");
		AI_Teleport(Sarah,"NW_TAVERNE_IN_10");
	}
	else
	{
		AI_Output(other,self, " DIA_Andre_SarahToGuildPay_01_06 " );	// I don't have them yet.
		AI_Output(self,other, " DIA_Andre_SarahToGuildPay_01_07 " );	// Then come back when you have them.
	};
};


instance DIA_ANDRE_HANNAPRESS (C_Info) .
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_hannainprision_condition;
	information = dia_andre_hannaprison_info;
	permanent = FALSE;
	description = " Why was Hanna arrested? " ;
};


func int dia_andre_hannainprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISION == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hannaimprisonment_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_00 " );	// Why was Hanna arrested?
	AI_Output(self,other, " DIA_Andre_HannaInPrision_01_01 " );	// She is accused of stealing.
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_02 " );	// I think this is some kind of error!
	AI_Output(self,other, " DIA_Andre_HannaInPrision_01_03 " );	// (thoughtfully) I wouldn't want to believe it myself, but unfortunately the evidence for her crime is overwhelming.
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_04 " );	// What other evidence?
	AI_Output(self,other, " DIA_Andre_HannaInPrision_01_07 " );	// In her chest, the belongings of the trader Hakon were found, and a trader named Gaspard saw her digging through his chest.
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_08 " );	// Gaspar?! Is this the witness?
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_10 " );	// He's the one who runs Hannah's inn now.
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_11 " );	// This is very suspicious!
	AI_Output(self,other, " DIA_Andre_HannaInPrision_01_13 " );	// Justice is only interested in evidence and facts, but for now they are against Hannah.
	AI_Output(other,self, " DIA_Andre_HannaInPrision_01_14 " );	// What if I get proof of her innocence?
	AI_Output(self,other, " DIA_Andre_HannaInPrision_01_16 " );	// But you don't have them yet.
	KNOWSHANNAINPRISIONHAKON = TRUE;
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Lord André told me that the name of the merchant who was robbed is Hakon. And the main witness in this case is none other than Gaspard, the new owner of the inn. I think we should first ask both of them in detail about this. " ) ;
	Log_AddEntry( TOPIC_ABIGEILHELPHANNA , " If I want to get Hannah out of jail, I need to provide Lord Andre with proof of her innocence. " );
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HANNAIMPRISONED (C_Info);
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_hannainprisiondone_condition;
	information = dia_andre_hannainprisondone_info;
	permanent = FALSE;
	description = " I have evidence against Gasper! " ;
};


func int dia_andre_hannainprisiondone_condition()
{
	if (( MIS_ABIGEILHELP  == LOG_Running) && (Npc_HasItems(other,itri_missing) >=  1 ) && ( JOTELLSAVINGS  ==  TRUE ) && ( MIS_OR с GREATWAR  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_andre_hanna_imprisoned_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_00 " );	// I have evidence against Gasper!
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_02 " );	// Here's the ring that was stolen from merchant Hakon.
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_04 " );	// Gaspar paid with this ring to a man named Joe.
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_05 " );	// That bastard hired him to distract Hannah.
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_07 " );	// Gaspar himself, meanwhile, quietly entered the hotel and robbed the merchant Hakon.
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_08 " );	// And after that, he planted the stolen things on Hannah, and gave the ring to Joe as payment.
	AI_Output(self,other, " DIA_Andre_HannaInPrisionDone_01_09 " );	// Is this true?
	AI_Output(other,self, " DIA_Andre_HannaInPrisionDone_01_10 " );	// Joe can confirm my words.
	AI_Output(self,other, " DIA_Andre_HannaInPrisionDone_01_11 " );	// (seriously) Good. You persuaded me.
	AI_Output(self,other, " DIA_Andre_HannaInPrisionDone_01_12 " );	// Gaspard will be taken into custody immediately, and Hannah will be cleared of all charges of theft and released.
	AI_Output(self,other, " DIA_Andre_HannaInPrisionDone_01_15 " );	// Now you can go - I'll take care of everything.
	AI_StopProcessInfos(self);
	B_LogEntry( TOPIC_ABIGEILHELPHANNA , " Lord André has taken my evidence against Gaspar into consideration and concluded that he is the one responsible for stealing Trader Hakon's belongings. Hannah is now free. " );
	GASPARPISSOFF = TRUE;
	HANNAISFREE = TRUE;
	Npc_ExchangeRoutine(VLK_414_Hanna,"Start");
	Npc_ExchangeRoutine(vlk_6137_gaspar,"InPrision");
	AI_Teleport(gaspar,"NW_CITY_HANNA_INPRISION");
	AI_Teleport(hanna,"NW_CITY_HANNA");
};


instance DIA_ANDRE_IGNAZDEAD(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazdead_condition;
	information = dia_andre_ignazdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_ignazdead_condition()
{
	if(KILLHAPPENSMADE == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_ignazdead_info()
{
	AI_Output(self,other, " DIA_Andre_IgnazDead_01_00 " );	// Wait. I need to speak to you urgently.
	AI_Output(self,other, " DIA_Andre_IgnazDead_01_02 " );	// Under circumstances that are still incomprehensible to me, one dirty murder happened!
	AI_Output(self,other, " DIA_Andre_IgnazDead_01_03 " );	// Killed by Ignaz - an alchemist who lived in the waterfront.
	AI_Output(self,other, " DIA_Andre_IgnazDead_01_05 " );	// Looks like the poor guy was poisoned. And my sacred duty is to understand this crime.
	AI_Output(other,self, " DIA_Andre_IgnazDead_01_06 " );	// What do you want from me?
	AI_Output(self,other, " DIA_Andre_IgnazDead_01_10 " );	// Walk around the city, ask people around - maybe someone saw something, but is just afraid to talk about it.
	AI_Output(other,self, " DIA_Andre_IgnazDead_01_14 " );	// Good! If I manage to find out anything, I'll let you know.
	AI_Output(self,other, " DIA_Andre_IgnazDead_01_15 " );	// That's fine. You can go.
	MIS_KILLIGNAZ = LOG_Running;
	Log_CreateTopic(TOPIC_KILLIGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_IGNAZFOUNDKILL_V1(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazfoundkill_v1_condition;
	info = dia_andre_ignazfoundkill_v1_info;
	permanent = FALSE;
	description = " I found the killer. " ;
};


func int dia_andre_ignazfoundkill_v1_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running ) && ( CONSTANTINOFUCKOFF  ==  TRUE ) && Npc_HasItems(hero,itmi_poisonbottle))
	{
		return TRUE;
	};
};

func void dia_andre_ignazfoundkill_v1_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V1_01_00 " );	// I found the killer.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V1_01_01 " );	// And who is he?
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V1_01_02 " );	// Urban alchemist Constantino.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V1_01_03 " );	// (surprised) Constantino?! Are you sure?
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V1_01_04 " );	// Here, I found this vial of poison in Ignaz's house, which once belonged to him.
	B_GiveInvItems(other,self,itmi_poisonbottle,1);
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V1_01_07 " );	// Since you really have evidence of his guilt, I will immediately order him to be taken into custody.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V1_01_08 " );	// For my part, I want to thank you for your help in this matter.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V1_01_09 " );	// Please accept this gold as a token of my gratitude.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLIGNAZ , " I informed Lord André of my suspicions about Constantino and gave him the vial so that he had no doubt who poisoned Ignatz. " );
	Npc_ExchangeRoutine(VLK_417_Constantino,"InPrision");
	AI_Teleport(VLK_417_Constantino,"NW_CITY_ALHIMIK_INPRISION");
};


instance DIA_ANDRE_IGNAZFOUNDKILL_V2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazfoundkill_v2_condition;
	information = dia_andre_ignazfoundkill_v2_info;
	permanent = FALSE;
	description = " I found the killer. " ;
};


func int dia_andre_ignazfoundkill_v2_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running) && ( KARRASTELLABOUTIGNAZ  ==  TRUE ) && Npc_HasItems(hero,itwr_spellchecker) && ( READORTEGO  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_andre_ignazfoundkill_v2_info()
{
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_01_00 " );	// I found the killer.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_01_01 " );	// If so, that's good. And who is he?
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_01_02 " );	// One guy named Ortego.
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_01_06 " );	// Here, I found this letter from him. Everything is written in it.
	B_GiveInvItems(other,self,itwr_ortegoletter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_01_07 " );	// Apparently you're right.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_01_08 " );	// However, as I understand from this letter, he did not act of his own free will.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_01_09 " );	// Did you by any chance find out who was behind him?
	ConstForgiven = TRUE;
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
	Info_AddChoice(dia_andre_ignazfoundkill_v2, " It was one of the Firebenders. " ,dia_andre_ignazfoundkill_v2_yes);
	Info_AddChoice(dia_andre_ignazfoundkill_v2, " I don't know that. " ,dia_andre_ignazfoundkill_v2_no);
};

func void dia_andre_ignazfoundkill_v2_yes()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_Yes_01_01 " );	// It was one of the Firebenders.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_02 " );	// (confused) Fire Mage?! What are you carrying! How is this possible?
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_Yes_01_03 " );	// I'm only saying what I've learned.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_04 " );	// Hmmm... (unpleased) Well, okay. Let's say you're right.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_05 " );	// However, you must understand that such speeches can lead to dire consequences.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_06 " );	// Upon learning of this, people may simply lose faith in the Fire Mages and even Innos himself!
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_12 " );	// But still, tell me, which of the Fire Mages is guilty of killing Ignaz?
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_Yes_01_13 " );	// I spoke with Karras. However, according to him, this decision was supported by many of his brothers.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_15 " );	// Okay. I'll deal with this myself.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_16 " );	// I just want to thank you for your help in this matter.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_Yes_01_17 " );	// Please accept this gold as a token of my gratitude.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	TELLANDRETRUTH = TRUE;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLIGNAZ , " I told Lord Andre about Ortego and presented the letter I found from him. In addition, I also mentioned the involvement of the Firebenders in this murder, thereby upsetting him very much. Now Lord Andre found himself in a very delicate situation, but said he would sort it out somehow. " );
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
};

func void dia_andre_ignazfoundkill_v2_no()
{
	AI_Output(other,self, " DIA_Andre_IgnazFoundKill_V2_No_01_01 " );	// I don't know this.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_No_01_02 " );	// Hmmm... (disappointed) Too bad.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_No_01_03 " );	// Although, on the other hand, the main thing is that you managed to find the killer.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_No_01_04 " );	// In any case, I want to thank you for your help in this matter.
	AI_Output(self,other, " DIA_Andre_IgnazFoundKill_V2_No_01_05 " );	// Here, take this gold as a token of my gratitude.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLIGNAZ , " I told Lord Andre about Ortego and produced the letter I found on him. That was enough for him to close the case. I guess everyone was happy - myself included. " );
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
};


instance DIA_ANDRE_TOCONVICTS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_toconvicts_condition;
	information = dia_andre_toconvicts_info;
	permanent = FALSE;
	description = " I need to go to the prisoners. " ;
};


func int dia_andre_toconvicts_condition()
{
	if (( CAPITELORCATC  ==  FALSE ) && ( PERMTOPRISON  ==  FALSE ) && ((hero.guild !=  GIL_PAL ) || (hero.guild !=  GIL_MIL ) || (hero.guild !=  GIL_KDW ) || (hero. guild !=  GIL_KDF )))
	{
		return TRUE;
	};
};

func void dia_andre_toconvicts_info()
{
	AI_Output(other,self, " DIA_Andre_ToConvicts_01_00 " );	// I need to get to the prisoners.
	AI_Output(self,other, " DIA_Andre_ToConvicts_01_01 " );	// Good! You can do it.
	AI_Output(self,other, " DIA_Andre_ToConvicts_01_02 " );	// But remember... (terribly) If you try to open the grate, I'll raise the alarm!
	PERMTOPRISON = TRUE;
};
