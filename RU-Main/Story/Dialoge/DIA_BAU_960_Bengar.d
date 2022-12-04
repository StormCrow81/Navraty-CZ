
instance DIA_Bengar_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Bengar_HALLO (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 3;
	condition = DIA_Bengar_HALLO_Condition;
	information = DIA_Bengar_HALLO_Info;
	description = " Are you a farmer here? " ;
};


func int DIA_Bengar_HALLO_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other,self, " DIA_Bengar_HALLO_15_00 " );	// Are you a farmer here?
	AI_Output(self,other, " DIA_Bengar_HALLO_10_01 " );	// You could say that even though I'm really just a tenant.
	AI_Output(self,other, " DIA_Bengar_HALLO_10_02 " );	// All the land here belongs to one big landowner.
};


instance DIA_Bengar_WOVONLEBTIHR (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Bengar_WOVONLEBTIHR_Condition;
	information = DIA_Bengar_WOVONLEBTIHR_Info;
	description = " How do you make a living? " ;
};


func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_HELLO ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other,self, " DIA_Bengar_WOVONLEBTIHR_15_00 " );	// How do you make a living?
	AI_Output(self,other, " DIA_Bengar_WOVONLEBTIHR_10_01 " );	// Mainly hunting and logging. And, of course, we also raise sheep and work in the field.
	AI_Output(self,other, " DIA_Bengar_WOVONLEBTIHR_10_02 " );	// Onar imposed all these workers on me and I have to keep them busy. Only a few of them are good hunters, you know?
};


instances DIA_Bengar_TAGELOEHNER (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 6;
	condition = DIA_Bengar_TAGELOEHNER_Condition;
	information = DIA_Bengar_TAGELOEHNER_Info;
	description = " Do you hire day laborers? " ;
};


func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_WOVONLEBTIHR ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other,self, " DIA_Bengar_TAGELOEHNER_15_00 " );	// Do you hire day laborers?
	AI_Output(self,other, " DIA_Bengar_TAGELOEHNER_10_01 " );	// Onar lays off workers who are not needed on his farm.
	AI_Output(self,other, " DIA_Bengar_TAGELOEHNER_10_02 " );	// Then he sends them to me. I feed them and they work for me.
};


instance DIA_Addon_Bengar_MissingPeople(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_MissingPeople_Condition;
	information = DIA_Addon_Bengar_MissingPeople_Info;
	description = " Has anything unusual happened here lately? " ;
};


func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Bengar_MissingPeople_15_00 " );	// Has anything unusual happened here lately?
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_10_01 " );	// Many unusual things have been happening in recent days.
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_10_02 " );	// But the most unusual thing was the disappearance of Pardos.
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_10_03 " );	// Pardos is one of my best workers. He's not the type to go missing for no reason.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Farmer Bengar has lost his worker, Pardos. " );
	MIS_Bengar_BringMissPeopleBack = LOG_Running;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,Dialog_Back,DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, " Any thoughts? " ,DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, " Maybe he just got fed up with everything. " ,DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, " What was it about his disappearance that struck you as odd? " ,DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other,self, " DIA_Addon_Bengar_MissingPeople_was_15_00 " );	// What exactly about his disappearance seemed strange to you?
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_was_10_01 " );	// Pardos is rather cowardly. The farthest distance he went from the farm was the edge of the outfield.
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_was_10_02 " );	// He pisses himself at the sight of a meat bug.
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_was_10_03 " );	// I know they look pretty nasty, but to consider them dangerous...
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_was_10_04 " );	// They say you can eat them... Disgusting!
	AI_Output(other,self, " DIA_Addon_Bengar_MissingPeople_was_15_05 " );	// A person can get used to anything.
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other,self, " DIA_Addon_Bengar_MissingPeople_voll_15_00 " );	// Maybe he's just fed up with everything.
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_voll_10_01 " );	// Working in the fields was his whole life. I can't even imagine him leaving to work for another farmer.
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_voll_10_02 " );	// He got everything he wanted from me.
};

var int Bengar_ToldAboutRangerBandits;

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other,self, " DIA_Addon_Bengar_MissingPeople_Hint_15_00 " );	// Any thoughts?
	AI_Output(self,other, " DIA_Addon_Bengar_MissingPeople_Hint_10_01 " );	// I think he was kidnapped by bandits. They've been hanging around here lately.
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};


instance DIA_Addon_Bengar_ReturnPardos(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_ReturnPardos_Condition;
	information = DIA_Addon_Bengar_ReturnPardos_Info;
	description = " Has Pardos returned? " ;
};


func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if((MIS_Bengar_BringMissPeopleBack == LOG_Running) && (Npc_GetDistToWP(Pardos_NW,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other,self, " DIA_Addon_Bengar_ReturnPardos_15_00 " );	// Pardos is back?
	AI_Output(self,other, " DIA_Addon_Bengar_ReturnPardos_10_01 " );	// Yes, he is in the house, resting. Thanks for all...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Don't mention it.
	AI_Output(self,other, " DIA_Addon_Bengar_ReturnPardos_10_03 " );	// I'd like to reward you, but I don't have anything...
	AI_Output(other,self, " DIA_Addon_Bengar_ReturnPardos_15_04 " );	// Forget it.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Bengar_FernandosWeapons(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_FernandosWeapons_Condition;
	information = DIA_Addon_Bengar_FernandosWeapons_Info;
	description = " When the bandits passed through here, did they have weapons? " ;
};


func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if((Bengar_ToldAboutRangerBandits == TRUE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other,self, " DIA_Addon_Bengar_FernandosWeapons_15_00 " );	// When the bandits passed through here, did they have weapons?
	AI_Output(self,other, " DIA_Addon_Bengar_FernandosWeapons_10_01 " );	// What a stupid question. since when do bandits go without weapons?
	AI_Output(other,self, " DIA_Addon_Bengar_FernandosWeapons_15_02 " );	// I mean, A LOT of weapons. An unusual amount.
	AI_Output(self,other, " DIA_Addon_Bengar_FernandosWeapons_10_03 " );	// Ah, I understand. Yes, now that you mention it, they were packing a lot of hardware.
	AI_Output(self,other, " DIA_Addon_Bengar_FernandosWeapons_10_04 " );	// Some were in barrels, some were in sacks, and some they carried on a cart.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_REBELL (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 8;
	condition = DIA_Bengar_REBEL_Condition;
	information = DIA_Bengar_REBEL_Info;
	description = " What do you think of Onar? " ;
};


func int DIA_Bengar_REBEL_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_ HELLO ))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBEL_Info()
{
	AI_Output(other,self, " DIA_Bengar_REBELLIEREN_15_00 " );	// What do you think of Onar?
	AI_Output(self,other, " DIA_Bengar_REBELLIEREN_10_01 " );	// He's a greedy bastard. We'll all be hanged because of him.
	AI_Output(self,other, " DIA_Bengar_REBELLIEREN_10_02 " );	// One day paladins from the city will come and make us small farmers pay for everything he's done.
	AI_Output(self,other, " DIA_Bengar_REBELLIEREN_10_03 " );	// But I don't have a choice. The militia only come here to collect taxes, not to protect my farm.
	AI_Output(self,other, " DIA_Bengar_REBELLIEREN_10_04 " );	// If I show loyalty to the city, I'll be all alone.
	AI_Output(self,other, " DIA_Bengar_REBELLIEREN_10_05 " );	// At least Onar occasionally sends mercenaries to see how we're getting along. 
};


instance DIA_Bengar_PALADINE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 9;
	condition = DIA_Bengar_PALADINE_Condition;
	information = DIA_Bengar_PALADINE_Info;
	description = " What do you have against the royal troops? " ;
};


func int DIA_Bengar_PALADINE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_REBEL ) && ( ( hero . guild !=  GIL_MIL ) && ( hero . guild !=  GIL_PAL )))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other,self, " DIA_Bengar_PALADINE_15_00 " );	// What do you have against the royal troops?
	AI_Output(self,other, " DIA_Bengar_PALADINE_10_01 " );	// Isn't it obvious. Since the paladins arrived in the city, no improvement has been seen. Rather the opposite.
	AI_Output(self,other, " DIA_Bengar_PALADINE_10_02 " );	// Now that damn militia is showing up even more often. They steal everything they can and the paladins do nothing about it.
	AI_Output(self,other, " DIA_Bengar_PALADINE_10_03 " );	// The only paladins I've ever seen are those two guards at the Pass.
	AI_Output(self,other, " DIA_Bengar_PALADINE_10_04 " );	// They won't move even if the militia massacres us all.
};


instance DIA_Bengar_PASS(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 10;
	condition = DIA_Bengar_PASS_Condition;
	information = DIA_Bengar_PASS_Info;
	description = " At the Passage? " ;
};


func int DIA_Bengar_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other, self, " DIA_Bengar_PASS_15_00 " );	// At the Passage?
	AI_Output(self,other, " DIA_Bengar_PASS_10_01 " );	// Yes. The passage to the old Valley of Mines is at the waterfall at the other end of this plateau.
	AI_Output(self,other, " DIA_Bengar_PASS_10_02 " );	// Ask Malak about it. He goes there a couple of times a week.
};


instances of DIA_Bengar_MILIZ (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_MILIZ_Condition;
	information = DIA_Bengar_MILIZ_Info;
	permanent = FALSE;
	description = " I have to solve your militia problem. " ;
};


func int DIA_Bengar_MILIZ_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other,self, " DIA_Bengar_MILIZ_15_00 " );	// I have to solve your militia problem.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Bengar_MILIZ_10_01 " );	// What?! I told Onar to send his mercenaries!
		AI_Output(other,self, " DIA_Bengar_MILIZ_15_02 " );	// This is my chance to prove myself.
		AI_Output(self,other, " DIA_Bengar_MILIZ_10_03 " );	// Are you mad? Do you know what the militia will do to me if you fail?
	}
	else
	{
		AI_Output(self,other, " DIA_Bengar_MILIZ_10_04 " );	// I thought no one would come.
		AI_Output(self,other, " DIA_Bengar_MILIZ_10_05 " );	// I told Onar about this a couple of days ago. What am I paying my rent for?!
	};
	AI_Output(self,other, " DIA_Bengar_MILIZ_10_06 " );	// Those bastards come here every week and collect taxes for the city.
	AI_Output(self,other, " DIA_Bengar_MILIZ_10_07 " );	// You came just in time.
	AI_Output(self,other, " DIA_Bengar_MILIZ_10_08 " );	// They could show up any minute.
};


instances of DIA_Bengar_Selber (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_Selber_Condition;
	information = DIA_Bengar_Selber_Info;
	permanent = FALSE;
	description = " Why can't you deal with the militia yourself? " ;
};


func int DIA_Bengar_Selber_Condition()
{
	if ((MIS_Expected_BengarExperienceClashChain == LOG_Running) && (Bengar_MilSuccess ==  FALSE ) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other,self, " DIA_Bengar_Selber_15_00 " );	// There are so many of you here! Why can't you handle the militia yourself?
	AI_Output(self,other, " DIA_Bengar_Selber_10_01 " );	// Yes, there are many of us. But we will not be able to resist well-trained militia fighters.
};


instances DIA_Bengar_MILIZKLATSCHEN (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZKLATSCHEN_Condition;
	information = DIA_Bengar_MILIZATIONCLAP_Info;
	permanent = FALSE;
	description = " Where are your militia, I'm ready to deal with them! " ;
};


func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_MILIZ ) &&  ! Npc_IsDead ( Rick ) &&  ! Npc_IsDead ( Rumbold ) && ( Rumbold_Bezahlt ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other,self, " DIA_Bengar_MILIZKLATSCHEN_15_00 " );	// Well, where are your militia? I'm ready to deal with them!
	AI_Output(self,other, " DIA_Bengar_MILIZKLATSCHEN_10_01 " );	// Look, they're coming! I told you they would!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Bengar_MILIZKLATSCHEN_10_02 " );	// Don't let me down!
	}
	else
	{
		AI_Output(self,other, " DIA_Bengar_MILIZKLATSCHEN_10_03 " );	// Good luck to you! Send them to the Void!
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"MilComing");
		AI_ContinueRoutine(Rick);
	};
	if (Hlp_IsValidNpc(Rumbold) &&  ! Npc_IsDead(Rumbold))
	{
		Npc_ExchangeRoutine(Rumbold,"MilComing");
		AI_ContinueRoutine(Rumbold);
	};
};

instances DIA_Bengar_MILIZWEG (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZWEG_Condition;
	information = DIA_Bengar_MILIZWEG_Info;
	permanent = TRUE;
	description = " Your problems with the militia are over now. " ;
};


func int DIA_Bengar_MILIZWEG_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_Success ) && ( Bengar_MilSuccess ==  FALSE ))
	{
		if ((Npc_IsDead(Rick) && Npc_IsDead(Rumbold)) || (Rumbold_Bezahlt ==  TRUE ))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other,self, " DIA_Bengar_MILIZWEG_15_00 " );	// Your problems with the militia are over.

	if((Rumbold_Bezahlt == TRUE) && (Npc_IsDead(Rumbold) == FALSE))
	{
		AI_Output(self,other, " DIA_Bengar_MILIZWEG_10_01 " );	// Are you crazy? Do you know what they'll do to me when you leave?
		AI_Output(self,other, " DIA_Bengar_MILIZWEG_10_02 " );	// They're still standing over there! Finish this!
	}
	else
	{
		AI_Output(self,other, " DIA_Bengar_MILIZWEG_10_03 " );	// Not bad! Maybe I will eat a bit better this month. Thank you!

		if (Rumbold_Paid ==  TRUE )
		{
			B_GivePlayerXP(200);
			AI_Output(self,other, " DIA_Bengar_MILIZWEG_10_04 " );	// You were even willing to pay for me? That is very noble of you.
			AI_Output(self,other, " DIA_Bengar_MILIZWEG_77_01 " );	// Here, take this gold! You deserve it.
			B_GiveInvItems(self,other,ItMi_Gold,100);
		}
		else
		{
			B_GivePlayerXP(100);
		};

		Bengar_MilSuccess = TRUE;
	};
};


instances of DIA_Bengar_BALTHASAR (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 13;
	condition = DIA_Bengar_BALTHASAR_Condition;
	information = DIA_Bengar_BALTHASAR_Info;
	description = " Is Balthazar the shepherd forbidden from visiting your pastures? " ;
};


func int DIA_Bengar_BALTHASAR_Condition()
{
	if (( MIS_Balthasar_BengarsWeide == LOG_Running ) && Npc_KnowsInfo ( other , DIA_Bengar_Available ))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other,self, " DIA_Bengar_BALTHASAR_15_00 " );	// Shepherd Balthazar is not allowed to visit your pastures?
	AI_Output(self,other, " DIA_Bengar_BALTHASAR_10_01 " );	// Yes. It's a long story. I told him that Sekob had to pay money if he wanted to feed his sheep in my pastures.
	AI_Output(self,other, " DIA_Bengar_BALTHASAR_10_02 " );	// Truth be told, this is just an excuse. I simply can't stand Balthazar.
	B_LogEntry(TOPIC_BalthasarsSchafe, " To convince Bengar to let Balthazar return to his pastures, I must do him a favor. I'm sure the opportunity will come up. " );
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_BALTHASARDARFAUFWEIDE (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 14;
	condition = DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information = DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description = " The militia is gone, and Balthazar can use your pastures again. " ;
};


func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Bengar_BALTHASAR) && (MIS_Balthasar_BengarSuccess == LOG_Running) && (MIS_Torlof_BengarMilizKlatschen ==  LOG_SUCCESS ) && (Bengar_MilSuccess ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	AI_Output(other,self, " DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00 " );	// The militia is gone, and Balthazar can use your pastures again.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Why should I let him?
	AI_Output(other,self, " DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02 " );	// Because I said so.
	AI_Output(self,other, " DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03 " );	// Mmm. Fine, understood.
	AI_Output(self,other, " DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04 " );	// Just let him graze his sheep somewhere outside the field.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_SUCCESS);
	B_LogEntry(TOPIC_BalthasarsSchafe, " Farmer Bengar allowed the shepherd Balthazar to graze his sheep in his highland pastures. " );
	B_GivePlayerXP(XP_Ambient);
};


instances DIA_Bengar_PERMKAP1 (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 15;
	condition = DIA_Bengar_PERMKAP1_Condition;
	information = DIA_Bengar_PERMKAP1_Info;
	permanent = TRUE;
	description = " Take care of yourself. " ;
};


func int DIA_Bengar_PERMKAP1_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_BALTHASARDARFAUFWEIDE ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other,self, " DIA_Bengar_PERMKAP1_15_00 " );	// Take care of yourself.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//You too.
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP3_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP3_EXIT_Condition;
	information = DIA_Bengar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_ALLEIN (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 30;
	condition = DIA_Bengar_ALLONE_Condition;
	information = DIA_Bengar_ALLONE_Info;
	description = " How are you? " ;
};


func int DIA_Bengar_ALLONE_Condition()
{
	if ((Chapter >=  3 ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLONE_Info()
{
	AI_Output(other,self, " DIA_Bengar_ALLEIN_15_00 " );	// How are you?

	if((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other, " DIA_Bengar_ALLEIN_10_01 " );	// Malak left me and took everyone who worked for me with him. He said he was heading for the mountains.
		AI_Output(self,other, " DIA_Bengar_ALLEIN_10_02 " );	// He isn't here anymore.
		MIS_GetMalakBack = LOG_Running;
	}
	else
	{
		AI_Output(self,other, " DIA_Bengar_ALLEIN_10_03 " );	// Times are tough. I don't know how long I can hold out like this.
	};
	AI_Output(self,other, " DIA_Bengar_ALLEIN_10_04 " );	// New hordes of monsters come through the Pass every day. Soon they will overrun us.
	AI_Output(self,other, " DIA_Bengar_ALLEIN_10_05 " );	// If only I had a few mercenaries to protect me...
	AI_Output(self,other, " DIA_Bengar_ALLEIN_10_06 " );	// One of them was willing to work for me. But he changed his mind, however. I think his name was Wolf.
	MIS_BengarsHelpingSLD = LOG_Running;
	Log_CreateTopic(TOPIC_BengarALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN,LOG_Running);
	B_LogEntry(TOPIC_BengarALLEIN, " Bengar was left alone on his farm. Malak left and took everyone else with him. Bengar thinks they're headed for the mountains. " );
	B_LogEntry_Quiet(TOPIC_BengarALLEIN, " Now his farm is completely defenseless. He needs help. He said something about a mercenary named Wolf. Maybe I know him? " );
};

instance DIA_Bengar_MALAKTOT (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_MALAKTOT_Condition;
	information = DIA_Bengar_MALAKTOT_Info;
	description = " Malak is dead. " ;
};

func int DIA_Bengar_MALAKTOT_Condition()
{
	if ( Npc_IsDead ( Malak ) && ( Malak_isAlive_Cap3 ==  TRUE ) && ( DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other,self, " DIA_Bengar_MALAKTOT_15_00 " );	// Malak is dead.
	AI_Output(self,other, " DIA_Bengar_MALAKTOT_10_01 " );	// By the gods, could things get any worse?
};


instance DIA_Bengar_SLDDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_SLDDA_Condition;
	information = DIA_Bengar_SLDDA_Info;
	description = " I found you a mercenary, just like you wanted. " ;
};


func int DIA_Bengar_SLDDA_Condition()
{
	if((Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Npc_IsDead(SLD_Wolf) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other,self, " DIA_Bengar_SLDDA_15_00 " );	// I found you a mercenary just like you wanted.
	AI_Output(self,other, " DIA_Bengar_SLDDA_10_01 " );	// My farm has never had defenders like this before. I pray he can help us.
	AI_Output(self,other, " DIA_Bengar_SLDDA_10_02 " );	// Here, take this. I think you will need it.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};


instance DIA_Bengar_MALAKWIEDERDA (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = DIA_Bengar_MALAKWIEDERDA_Condition;
	information = DIA_Bengar_INFO_INFO;
	description = " Malak is back. " ;
};


func int DIA_Bengar_CONDITION_CONDITION()
{
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (DarkPathStart == FALSE) && ((MIS_GetMalakBack == LOG_SUCCESS) || (NpcObsessedByDMT_Malak == TRUE)) && (Npc_IsDead(Malak) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_INFO()
{
	AI_Output(other,self, " DIA_Bengar_MALAKWIEDERDA_15_00 " );	// Malak has returned.
	AI_Output(self,other, " DIA_Bengar_MALAKWIEDERDA_10_01 " );	// Wonderful! I was afraid that I would never see him again.
	B_GivePlayerXP(XP_GetMalakBack);

	if(RhetorikSkillValue[1] >= 30)
	{
		AI_Output(other,self, " DIA_Bengar_MALAKWIEDERDA_66_01 " );	// How about a little reward?
		AI_Output(self,other, " DIA_Bengar_MALAKWIEDERDA_66_02 " );	// Why not. Here you are. You earned it.
		B_GiveInvItems(self,hero,ItMi_Gold,150);
	};
};


instance DIA_Bengar_PERM(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 80;
	condition = DIA_Bengar_PERM_Condition;
	information = DIA_Bengar_PERM_Info;
	permanent = TRUE;
	description = " Everything will be fine. " ;
};


func int DIA_Bengar_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_ALLEIN ) && ( Capital >=  3 ) && ( DarkPathStart ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	AI_Output(other,self, " DIA_Bengar_PERM_15_00 " );	// Everything will be fine.

	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (Npc_IsDead(Malak) == FALSE))
	{
		AI_Output(self,other, " DIA_Bengar_PERM_10_01 " );	// Malak is here again, but the situation hasn't changed much.
		AI_Output(self,other, " DIA_Bengar_PERM_10_02 " );	// Unless a miracle happens, we'll all be dead soon.
	}
	else if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) && (Npc_IsDead(SLD_Wolf) == FALSE) && (Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000))
	{
		AI_Output(self,other, " DIA_Bengar_PERM_10_03 " );	// Wolf is a strange guy, but I hope he can help us.
	}
	else
	{
		AI_Output(self,other, " DIA_Bengar_PERM_10_04 " );	// Without Malak, this farm will soon come to an end. If nothing changes soon, I'm afraid I'll have to leave here.
		if((Malak_isAlive_Kap3 == TRUE) && (Npc_IsDead(Malak) == FALSE))
		{
			AI_Output(self,other, " DIA_Bengar_PERM_10_05 " );	// I hope he comes back soon.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SLD_Wolf) && (MIS_BengarsHelpingSLD == LOG_SUCCESS))
	{
		B_StartOtherRoutine(SLD_815_Soeldner,"Start");
		B_StartOtherRoutine(SLD_817_Soeldner,"Start");
	};
};


instance DIA_Bengar_KAP4_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP4_EXIT_Condition;
	information = DIA_Bengar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP5_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP5_EXIT_Condition;
	information = DIA_Bengar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP6_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP6_EXIT_Condition;
	information = DIA_Bengar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_PICKPOCKET(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 900;
	condition = DIA_Bengar_PICKPOCKET_Condition;
	information = DIA_Bengar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bengar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 28 , 50 );
};

func void DIA_Bengar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,Dialog_Back,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};


instances of DIA_BENGAR_LUTEROLETTER (C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = dia_bengar_luteroletter_condition;
	information = dia_bengar_luteroletter_info;
	description = " I brought a letter from Luthero. " ;
};


func int dia_bengar_luteroletter_condition()
{
	if((MIS_BENGARORDER == LOG_Running) && (Npc_HasItems(other,itwr_bengarorderletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_bengar_luteroletter_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Bengar_LuteroLetter_01_00 " );	// I brought a letter from Luthero for a new order.
	AI_Output(self,other, " DIA_Bengar_LuteroLetter_01_01 " );	// It's about time.
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_02");	//Here.
	B_GiveInvItems(other,self,itwr_bengarorderletter,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Bengar_LuteroLetter_01_03 " );	// Hmmm. Well, I think it will not be a problem for me to get this for him.
	AI_Output(self,other, " DIA_Bengar_LuteroLetter_01_04 " );	// Anything else?
	AI_Output(other,self, " DIA_Bengar_LuteroLetter_01_05 " );	// He also asked me to pick up the latest batch of goods.
	AI_Output(self,other, " DIA_Bengar_LuteroLetter_01_06 " );	// Oh yes, of course. I've already prepared everything - here, take this package...
	B_GiveInvItems(self,other,itmi_bengarpacket,1);
	AI_Output(self,other, " DIA_Bengar_LuteroLetter_01_07 " );	// ...and please don't lose it!
	AI_Output(other,self, " DIA_Bengar_LuteroLetter_01_08 " );	// I'll try.
	AI_Output(self,other, " DIA_Bengar_LuteroLetter_01_09 " );	// Let's hope. If you meet Luthero, tell him that a new batch will be ready in two weeks.
	B_LogEntry( TOPIC_BENGARORDER , " I delivered the letter to Bengar, and he gave me a package of goods for Jora. " );
};


instance DIA_BENGAR_PSICAMP(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 1;
	condition = dia_bengar_psicamp_condition;
	information = dia_bengar_psicamp_info;
	description = " What is this camp next to your farm? " ;
};


func int dia_bengar_psicamp_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Bengar_HALLO ) &&  !
	{
		return TRUE;
	};
};

func void day_bengar_psicamp_info()
{
	AI_Output(other,self, " DIA_Bengar_Psicamp_01_00 " );	// What is this camp next to your farm?
	AI_Output(self,other, " DIA_Bengar_Psicamp_01_01 " );	// I don't know for sure, but its inhabitant call their community some kind of Brotherhood!
	AI_Output(other,self, " DIA_Bengar_Psicamp_01_02 " );	// Brotherhood? Interesting. And who are these people?
	AI_Output(self,other, " DIA_Bengar_Psicamp_01_03 " );	// Pretty weird types actually! Almost all go bald-headed and constantly smoke a type of swamp weed.
	AI_Output(self,other, " DIA_Bengar_Psicamp_01_04 " );	// To be honest, they make me very uncomfortable.
	AI_Output(self,other, " DIA_Bengar_Psicamp_01_05 " );	// Although, there are very few problems from them.
	AI_Output(self,other, " DIA_Bengar_Psicamp_01_06 " );	// Their camp is always eerily quiet. And for me this is the most important thing.
	AI_Output(self,other, " DIA_Bengar_Psicamp_01_07 " );	// So I don't really mind their presence here. Let them live - I do not mind. YET.
	AI_Output(other,self, " DIA_Bengar_Psicamp_01_08 " );	// Got it.
};
