instance DIA_Maria_EXIT (C_Info)
{
	npc = BAU_910_Maria;
	nr = 999 ;
	condition = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent = TRUE ;
	description = Dialog_Ende;
};


func int DIA_Maria_EXIT_Condition ()
{
	return  TRUE ;
};

func void DIA_Maria_EXIT_Info ()
{
	AI_StopProcessInfos (self);
};


instance DIA_Maria_Hallo (C_Info)
{
	npc = BAU_910_Maria;
	nr = 1 ;
	condition = DIA_Maria_Hallo_Condition;
	information = DIA_Maria_Hallo_Info;
	permanent = FALSE ;
	description = " Who are you? " ;
};


func int DIA_Maria_Hallo_Condition ()
{
	return  TRUE ;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, " DIA_Maria_Hallo_15_00 " );	// Who are you?
	AI_Output (self, other, " DIA_Maria_Hallo_17_01 " );	// I am Onar's wife, Maria.
	AI_Output (self, other, " DIA_Maria_Hallo_17_02 " );	// What do you need here?
};


instance DIA_Maria_Umsehen (C_Info)
{
	npc = BAU_910_Maria;
	nr = 2 ;
	condition = DIA_Maria_Umsehen_Condition;
	information = DIA_Maria_Umsehen_Info;
	permanent = FALSE ;
	description = " I just wanted to see how you live ... " ;
};


func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return  TRUE ;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, " DIA_Maria_Umsehen_15_00 " );	// I just wanted to see how things were here ...
	AI_Output (self, other, " DIA_Maria_Umsehen_17_01 " );	// When so many people live on the farm, you can't even find peace in your own house!
	AI_Output (self, other, " DIA_Maria_Umsehen_17_02 " );	// They keep coming in here.
};


instance DIA_Maria_Soeldner (C_Info)
{
	npc = BAU_910_Maria;
	nr = 3 ;
	condition = DIA_Maria_Soeldner_Condition;
	information = DIA_Maria_Soeldner_Info;
	permanent = FALSE ;
	description = " Are you worried about the mercenaries? " ;
};


func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return  TRUE ;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, " DIA_Maria_Soeldner_15_00 " );	// Are you worried about the mercenaries?
	if ((hero.guild ==  GIL_SLD ) || (hero.guild ==  GIL_DJG ))
	{
		AI_Output (self, other, " DIA_Maria_Soeldner_17_01 " );	// Oh, forget what I just said - since you came, it has become much safer around here.
	}
	else
	{
		AI_Output (self, other, " DIA_Maria_Soeldner_17_02 " );	// Oh. Well, since the mercenaries came, at least the farm has become safer.
	};
	AI_Output (self, other, " DIA_Maria_Soeldner_17_03 " );	// When we were still on our own, guards from the city constantly came here and extorted us.
	AI_Output (self, other, " DIA_Maria_Soeldner_17_04 " );	// They took most of the harvest. And the sheep too. And they gave us nothing in return.
	AI_Output (self, other, " DIA_Maria_Soeldner_17_05 " );	// Some of them even outright stole.
	if (hero.guild ==  GIL_MIL )
	{
		AI_Output (self, other, " DIA_Maria_Soeldner_17_06 " );	// Don't get me wrong, soldier. I know that not all of you are like that.
	};
};


instance DIA_Maria_Mission (C_Info)
{
	npc = BAU_910_Maria;
	nr = 4 ;
	condition = DIA_Maria_Mission_Condition;
	information = DIA_Maria_Mission_Info;
	permanent = FALSE ;
	description = " What did they steal from you? " ;
};


func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner) && (MIS_Maria_BringPlate ! =  LOG_SUCCESS ))
	{
		return  TRUE ;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, " DIA_Maria_Mission_15_00 " );	// What did they steal from you?
	AI_Output (self, other, " DIA_Maria_Mission_17_01 " );	// Mostly gold and silver. They even took my wedding present. A Gold plate.
	if (other.guild ! =  GIL_MIL )
	{
		AI_Output (self, other, " DIA_Maria_Mission_17_02 " );	// I bet it's just gathering dust in some city guard’s chest right now.
	};
	MIS_Maria_BringPlate = LOG_Running;
};


instance DIA_Maria_BringPlate (C_Info)
{
	npc = BAU_910_Maria;
	nr = 5 ;
	condition = DIA_Maria_BringPlate_Condition;
	information = DIA_Maria_BringPlate_Info;
	permanent = FALSE ;
	description = " I brought a gold plate. Is it yours? " ;
};


func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) >  0 )
	{
		return  TRUE ;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1 );
	AI_Output (other, self, " DIA_Maria_BringPlate_15_00 " );	// I brought a golden plate. Is it yours?
	AI_Output (self, other, " DIA_Maria_BringPlate_17_01 " );	// Yes! That's it! Thank you so very much!
	MIS_Maria_BringPlate = LOG_SUCCESS ;
	B_GivePlayerXP (XP_Maria_Teller);
};


var int Maria_Belohnung;

instance DIA_Maria_Belohnung (C_Info)
{
	npc = BAU_910_Maria;
	nr = 6 ;
	condition = DIA_Maria_Belohnung_Condition;
	information = DIA_Maria_Belohnung_Info;
	permanent = TRUE ;
	description = " What about my reward? " ;
};


func int DIA_Maria_Belohnung_Condition ()
{
	if ((MIS_Maria_BringPlate ==  LOG_SUCCESS ) && (Maria_Belohnung ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, " DIA_Maria_Belohnung_15_00 " );	// How about a reward?
	if ((other.guild ==  GIL_SLD ) || Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, " DIA_Maria_Belohnung_17_01 " );	// You work as a mercenary for my husband, right?
		AI_Output (other, self, " DIA_Maria_Belohnung_15_02 " );	// Exactly.
		AI_Output (self, other, " DIA_Maria_Belohnung_17_03 " );	// How much does my husband pay you?
		B_Say_Gold (other, self, SOLD );
		AI_Output (self, other, " DIA_Maria_Belohnung_17_04 " );	// That won't do at all. Go to him and tell him to pay you more.
		AI_Output (other, self, " DIA_Maria_Belohnung_15_05 " );	// Do you think he'll listen?
		AI_Output (self, other, " DIA_Maria_Belohnung_17_06 " );	// He knows what will happen if he doesn't listen. Trust me.
		Maria_MehrGold = TRUE ;
		Maria_Belohnung = TRUE ;
	}
	else  if (other.guild ==  GIL_NONE )
	{
		AI_Output (self, other, " DIA_Maria_Belohnung_17_07 " );	// Do you want to become a mercenary on this farm?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, " Not really. " , DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, " Yes. " , DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, ItMi_Gold, 50 );
		Maria_Belohnung = TRUE ;
		AI_Output (self, other, " DIA_Maria_Belohnung_17_08 " );	// Here, take this. You deserve it.
	};
};

func void DIA_Maria_Belohnung_Gold ()
{
	AI_Output (other, self, " DIA_Maria_Belohnung_Gold_15_00 " );	// Not really.
	B_GiveInvItems (self, other, ItMi_Gold, 50 );
	Maria_Belohnung = TRUE ;
	AI_Output (self, other, " DIA_Maria_Belohnung_Gold_17_01 " );	// Then take this gold as a reward. You deserve it.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD ()
{
	AI_Output (other, self, " DIA_Maria_Belohnung_SOLD_15_00 " );	// Yes.
	AI_Output (self, other, " DIA_Maria_Belohnung_SOLD_17_01 " );	// Okay, if you work here, I'll make sure you get a good salary.
	AI_Output (self, other, " DIA_Maria_Belohnung_SOLD_17_02 " );	// Come to me when you discuss the size of your salary with my husband.
	Info_ClearChoices (DIA_Maria_Belohnung);
};


instance DIA_Maria_AboutOnar (C_Info)
{
	npc = BAU_910_Maria;
	nr = 7 ;
	condition = DIA_Maria_AboutOnar_Condition;
	information = DIA_Maria_AboutOnar_Info;
	permanent = FALSE ;
	description = " Tell me about Onar. " ;
};


func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return  TRUE ;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, " DIA_Maria_AboutOnar_15_00 " );	// Tell me about Onar.
	AI_Output (self, other, " DIA_Maria_AboutOnar_17_01 " );	// He's a good person. A bit grumpy and very quick to anger, but we all have our faults.
	AI_Output (self, other, " DIA_Maria_AboutOnar_17_02 " );	// I asked my husband - 'Why are you letting the soldiers from the city treat you like that?'
	AI_Output (self, other, " DIA_Maria_AboutOnar_17_03 " );	// 'Do something,' I said.
	AI_Output (self, other, " DIA_Maria_AboutOnar_17_04 " );	// And he hired mercenaries. And now it seems to me that we are at war.
	AI_Output (self, other, " DIA_Maria_AboutOnar_17_05 " );	// But if you think about it, we're really fighting back, aren't we?
};


instance DIA_Maria_PERM (C_Info)
{
	npc = BAU_910_Maria;
	nr = 8 ;
	condition = DIA_Maria_PERM_Condition;
	information = DIA_Maria_PERM_Info;
	permanent = TRUE ;
	description = " What's interesting lately? " ;
};


func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return  TRUE ;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, " DIA_Maria_PERM_15_00 " );	// What's interesting lately?
	if (Kapitel <=  2 )
	{
		AI_Output (self, other, " DIA_Maria_PERM_17_01 " );	// Paladins passed by.
		AI_Output (self, other, " DIA_Maria_PERM_17_02 " );	// At first we thought they were going to attack our farm, but they kept marching, into the Valley of Mines.
	};
	if (Kapitel ==  3 )
	{
		AI_Output (self, other, " DIA_Maria_PERM_17_03 " );	// Two nights ago, Vasily caught a thief. I feel much safer now!
	};
	if ((Kapitel ==  4 ) || (Kapitel ==  5 ))
	{
		AI_Output (self, other, " DIA_Maria_PERM_17_04 " );	// Since some of the mercenaries left, it has become much quieter here.
	};
	if (Kapitel ==  6 )
	{
		if ( BIGBATTLEBACKPOSITION  ==  TRUE )
		{
			AI_Output (self, other, " DIA_Maria_PERM_17_05 " );	// After that battle for our farm, everything seems to have calmed down.
		}
		else
		{
			AI_Output (self, other, " DIA_Maria_PERM_17_06 " );	// Now everyone is only interested in one thing - when the orcs decide to head our way!
			AI_Output (self, other, " DIA_Maria_PERM_17_07 " );	// I am afraid to imagine what will become of us if that happens.
		};
	};
};


instance DIA_Maria_PICKPOCKET (C_Info)
{
	npc = BAU_910_Maria;
	nr = 900 ;
	condition = DIA_Maria_PICKPOCKET_Condition;
	information = DIA_Maria_PICKPOCKET_Info;
	permanent = TRUE ;
	description = PICKPOCKET_COMM ;
};


func int DIA_Maria_PICKPOCKET_Condition ()
{
	return  C_Beklauen ( 60 , 110 );
};

func void DIA_Maria_PICKPOCKET_Info ()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
	Info_AddChoice (DIA_Maria_PICKPOCKET, Dialog_Back, DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};

func void DIA_Maria_PICKPOCKET_BACK ()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


instance DIA_MARIA_LEENURSE (C_Info)
{
	npc = BAU_910_Maria;
	nr = 8 ;
	condition = dia_maria_leenurse_condition;
	information = dia_maria_leenurse_info;
	permanent = FALSE ;
	description = " What are you doing here? " ;
};


func int dia_maria_leenurse_condition ()
{
	if (Npc_KnowsInfo (other, dia_lord_hagen_neworders) && ( LEERECOVERED  ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void dia_maria_leenurse_info ()
{
	AI_Output (other, self, " DIA_Maria_LeeNurse_01_00 " );	// What are you doing here?
	AI_Output (self, other, " DIA_Maria_LeeNurse_01_01 " );	// Can't you see? Taking care of the wounded.
	AI_Output (self, other, " DIA_Maria_LeeNurse_01_02 " );	// Who else will?
	AI_Output (other, self, " DIA_Maria_LeeNurse_01_03 " );	// You're a good woman Maria. How is Lee?
	AI_Output (self, other, " DIA_Maria_LeeNurse_01_04 " );	// His wounds were bad, but not DYING bad.
	AI_Output (self, other, " DIA_Maria_LeeNurse_01_05 " );	// He should recover in time.
};

instance DIA_MARIA_ONARPASS (C_Info)
{
	npc = BAU_910_Maria;
	nr = 7 ;
	condition = dia_maria_onarpass_condition;
	information = dia_maria_onarpass_info;
	permanent = FALSE ;
	important = TRUE ;
};

func int dia_maria_onarpass_condition ()
{
	if (Hlp_StrCmp (Npc_GetNearestWP (self), " NW_CRYPT_05 " ) && ( ONARTOMM1  ==  5 ) &&  ! Npc_IsDead (BAU_910_Maria) &&  ! Npc_IsDead (BAU_911_Elena))
	{
		return  TRUE ;
	};
	return  FALSE ;
};

func void dia_maria_onarpass_info ()
{
	AI_Output (self, other, " DIA_Maria_Onarpass_17_01 " );	// Here we are! Keep some gold for your trouble.
	B_GiveInvItems (self, other, ItMi_Gold, 200 );
	AI_Output (self, other, " DIA_Maria_Onarpass_17_02 " );	// You can go back to Onar. I think you have something to talk about.
	ONARTOMM1 = 6 ;
};

instance DIA_MARIA_TOWER (C_Info)
{
	npc = BAU_910_Maria;
	nr = 3 ;
	condition = dia_maria_tower_condition;
	information = dia_maria_tower_info;
	permanent = FALSE ;
	description = " How is the farm doing? " ;
};

func int dia_maria_tower_condition ()
{
	if ((MIS_Maria_BringPlate ==  LOG_SUCCESS ) && ( MIS_MYNEWMANSION  == LOG_Running) && ( DECISION_TOWER_MADE  ==  FALSE ))
	{
		return  TRUE ;
	};
};

func void dia_maria_tower_info ()
{
	AI_Output (other, self, " DIA_Maria_Tower_15_00 " );	// Hello! We haven't seen each other for a long time. How are things on the farm?
	AI_Output (self, other, " DIA_Maria_Tower_17_01 " );	// Oh, it's you! I'm very glad to see you.
	AI_Output (self, other, " DIA_Maria_Tower_17_02 " );	// Overall, we're doing pretty well. The only problem is the strange characters in black capes, skulking around all the time.
	AI_Output (self, other, " DIA_Maria_Tower_17_03 " );	// Until recently, a whole squad of them lived in a tower next to our farm, until someone killed a bunch of them.
	AI_Output (self, other, " DIA_Maria_Tower_17_04 " );	// May Innos forgive me, but to be honest, I felt better for hearing that.
	AI_Output (self, other, " DIA_Maria_Tower_17_05 " );	// Something about them just feels... wrong, you know?
	AI_Output (other, self, " DIA_Maria_Tower_15_06 " );	// Did Onar do anything about this?
	AI_Output (self, other, " DIA_Maria_Tower_17_07 " );	// My husband? No. He only grumbled that such things tend to frighten the peasants, and they work worse.
	AI_Output (self, other, " DIA_Maria_Tower_17_08 " );	// In general, we have only had problems with that tower. First, the bandits lived there, then these... people.
	AI_Output (other, self, " DIA_Maria_Tower_15_09 " );	// Have you thought about putting things in order there? Occupy it again, equip it, set up security?
	AI_Output (self, other, " DIA_Maria_Tower_17_10 " );	// Of course I have! (Chuckles) That would be great, but my husband would never do that!
	AI_Output (self, other, " DIA_Maria_Tower_17_11 " );	// There would be no money to be made, only costs and upkeep.
	AI_Output (self, other, " DIA_Maria_Tower_17_12 " );	// Now, if someone else did it ...
	AI_Output (other, self, " DIA_Maria_Tower_15_13 " );	// How would you feel if I took this matter into my own hands?
	AI_Output (self, other, " DIA_Maria_Tower_17_14 " );	// You? (Surprised) But where would you get the time and money for that? Why would you even go to all that trouble?
	Info_ClearChoices (dia_maria_tower);
	Info_AddChoice (dia_maria_tower, " I want to live there. " , Dia_maria_tower_win);
	Info_AddChoice (dia_maria_tower, " I want to equip a camp there. " , Dia_maria_tower_fail_a);
	Info_AddChoice (dia_maria_tower, " I have my own interests. " , Dia_maria_tower_fail_b);
};

func void dia_maria_tower_win ()
{
	B_GivePlayerXP ( 500 );
	AI_Output (other, self, " DIA_Maria_Tower_win_15_00 " );	// Well, during my travels I managed to scrape together some money.
	AI_Output (other, self, " DIA_Maria_Tower_win_15_01 " );	// Also, I don't have a home, and this tower sounds like a worthy base of operations, regardless of the risk.
	AI_Output (other, self, " DIA_Maria_Tower_win_15_02 " );	// I could take control of it, but I'd need Onar's say so.
	AI_Output (self, other, " DIA_Maria_Tower_win_17_03 " );	// Ooh, if that's the case, I'll definitely talk to him.
	AI_Output (self, other, " DIA_Maria_Tower_win_17_04 " );	// You are a good man, and I am sure that in your hands everything will finally be put to rights. it's still quite risky though.
	AI_Output (other, self, " DIA_Maria_Tower_win_15_05 " );	// Thanks for the vote of confidence.
	AI_Output (self, other, " DIA_Maria_Tower_win_17_06 " );	// Not at all. If you succeed, we will all benefit from this.	
	MARIA_APPROVES_TOWER = TRUE ;
	B_LogEntry ( TOPIC_MYNEWMANSION , " I managed to persuade Maria to put in a word for me in front of Onar. " );
	AI_StopProcessInfos (self);
};

func void dia_maria_tower_fail_a ()
{
	AI_Output (other, self, " DIA_Maria_Tower_fail_a_15_00 " );	// Paladins want to restore order in the tower.
	AI_Output (other, self, " DIA_Maria_Tower_fail_a_15_01 " );	// Lord Hagen handed it over to me so that I could restore it, equip it, find people to guard it, so that bandits can't settle there anymore. 	
	AI_Output (self, other, " DIA_Maria_Tower_fail_a_17_02 " );	// In what sense did 'Lord Hagen gave it to you'? After all, this is our tower.
	AI_Output (self, other, " DIA_Maria_Tower_fail_a_17_03 " );	// You are a good man, but Lord Hagen cannot simply dispose of our domain.
	AI_Output (self, other, " DIA_Maria_Tower_fail_a_17_04 " );	// This upsets me. I don't like all this. Please leave me now.
	AI_StopProcessInfos (self);
};

func void dia_maria_tower_fail_b ()
{
	AI_Output (other, self, " DIA_Maria_Tower_fail_b_15_00 " );	// I'm afraid I can't tell you everything. I will only say that I want to put things in order using that tower.
	AI_Output (self, other, " DIA_Maria_Tower_fail_b_17_01 " );	// But why can't you explain the details? You're hiding something?
	AI_Output (self, other, " DIA_Maria_Tower_fail_b_17_02 " );	// Sorry, but I will not support you if you do not want to tell me the whole truth.
	AI_StopProcessInfos (self);
};
