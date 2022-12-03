

instance DIA_PAL_9122_RITTER_EXIT(C_Info)
{
	npc = pal_9122_ritter;
	nr = 999;
	condition = dia_pal_9122_ritter_exit_condition;
	information = dia_pal_9122_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9122_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_9122_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9122_RITTER_WHO(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_who_condition;
	information = dia_pal_9122_ritter_who_info;
	permanent = FALSE;
	description = " Hi, who are you? " ;
};


func int dia_pal_9122_ritter_who_condition()
{
	return TRUE;
};

func void dia_pal_9122_ritter_who_info()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_Who_01_00 " );	// Hello, who are you?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_Who_01_01 " );	// My name is Ferdinand, stranger... (sighs sadly)
};


instance DIA_PAL_9122_RITTER_SILVERCUP(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_silvercup_condition;
	information = dia_pal_9122_ritter_silvercup_info;
	permanent = FALSE;
	description = " Any problems? " ;
};


func int dia_pal_9122_ritter_silvercup_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_who))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_silvercup_info()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_01_00 " );	// What's wrong with you? This is the first time I've seen a paladin suffering from blues.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_01_01 " );	// Alas, I have my reasons.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_01_02 " );	// You see, I haven't been able to drink my favorite wine for a long time.
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_01_03 " );	// What, lost all the money in dice, and now there is nothing to pay for a drink in a tavern? (chuckles)
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_01_04 " );	// Unfortunately, my problem is more fatal!
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_01_05 " );	// You see, in my family it is so customary that a man can only drink wine from silver dishes.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_01_06 " );	// I forgot my cup on the ship. There are several in the warehouse, but his caretaker Rain won't sell any to me.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_01_07 " );	// Lord Varus won't let us leave the fort, so I can't buy the goblet anywhere else.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	Info_AddChoice(dia_pal_9122_ritter_silvercup, " Can I help you? " ,dia_pal_9122_ritter_silvercup_help);
	Info_AddChoice(dia_pal_9122_ritter_silvercup, " I think you're worrying about nothing! " ,dia_pal_9122_ritter_silvercup_crazy);
	if(Npc_HasItems(other,ItMi_SilverCup) >= 1)
	{
		Info_AddChoice(dia_pal_9122_ritter_silvercup, " I have one silver cup with me. " ,dia_pal_9122_ritter_silvercup_have);
	};
};

func void dia_pal_9122_ritter_silvercup_help()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Help_01_00 " );	// Do you want me to help you? I will find such a cup!
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Help_01_01 " );	// Are you really going to do this? I will be eternally grateful to you.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	MIS_FERDSILVERCUP = LOG_Running;
	Log_CreateTopic(TOPIC_FERDSILVERCUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_Running);
	B_LogEntry( TOPIC_FERDSILVERCUP , " I promised to get Paladin Ferdinand a silver cup so he could drink his wine. " );
};

func void dia_pal_9122_ritter_silvercup_crazy()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Crazy_01_00 " );	// Are you laughing? This is not the time to think about such trifles! Spit on your custom.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Crazy_01_01 " );	// What? You obviously do not know such things as honor and loyalty. Leave me alone, stranger.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Crazy_01_02 " );	// And how did you even achieve such a position in society?
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Crazy_01_03 " );	// (with contempt) And who only lets such people come here?
	};
	FERDINPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercup_have()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Have_01_00 " );	// I have a silver goblet with me.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Have_01_01 " );	// Really? Are you kidding?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Have_01_02 " );	// You can ask me anything you want.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	Info_AddChoice(dia_pal_9122_ritter_silvercup, " I think a thousand gold is enough. " ,dia_pal_9122_ritter_silvercup_gold);
	Info_AddChoice(dia_pal_9122_ritter_silvercup, " Nothing! I'm giving it to you. " ,dia_pal_9122_ritter_silvercup_give);
};

func void dia_pal_9122_ritter_silvercup_gold()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_00 " );	// I think a thousand gold will be enough.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_01 " );	// Are you laughing at me? Yes, if it were made of solid gold, it would cost less.
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_02 " );	// Well, if you don't need it, then I...
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_03 " );	// (interrupting) Wait - keep your money, you nasty speculator.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_04 " );	// Fine, hold the goblet.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_05 " );	// It's a pleasure doing business with you. If you need anything, get back to me! (with mockery)
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_06 " );	// Get out of my sight, you bastard!
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_07 " );	// I don't want to have anything to do with you anymore.

	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_08 " );	// And how did you even achieve such a position in society?
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Gold_01_09 " );	// (with contempt) And who only lets such people come here?
	};
	FERDINPISSOFF = TRUE;

	if(MIS_FERDSPECWINE == LOG_Running)
	{
		MIS_FERDSPECWINE = LOG_Failed;
		B_LogEntry_Failed(TOPIC_FERDSPECWINE);
	};

	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercup_give()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCup_Give_01_00 " );	// Take it like this, otherwise I see that you are going completely crazy now!
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Give_01_01 " );	// Your generosity knows no bounds, my friend, but I can't just accept it.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCup_Give_01_02 " );	// Take a piece of black ore, it's very rare.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon, 1 );
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
};


instance DIA_PAL_9122_RITTER_SILVERCUPDONE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_silvercupdone_condition;
	information = dia_pal_9122_ritter_silvercupdone_info;
	permanent = FALSE;
	description = " I got you a goblet. " ;
};

func int dia_pal_9122_ritter_silvercupdone_condition()
{
	if((MIS_FERDSILVERCUP == LOG_Running) && (Npc_HasItems(hero,ItMi_SilverCup) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_silvercupdone_info()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCupDone_01_00 " );	// I got a goblet for you.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_01_01 " );	// Really? Are you kidding?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_01_02 " );	// You can ask me anything you want.
	Info_ClearChoices(dia_pal_9122_ritter_silvercupdone);
	Info_AddChoice(dia_pal_9122_ritter_silvercupdone, " I think a thousand gold is enough. " ,dia_pal_9122_ritter_silvercupdone_gold);
	Info_AddChoice(dia_pal_9122_ritter_silvercupdone, " I'm giving it to you. " ,dia_pal_9122_ritter_silvercupdone_give);
};

func void dia_pal_9122_ritter_silvercupdone_gold()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_00 " );	// I think a thousand gold will be enough.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_01 " );	// Are you laughing at me? Yes, if it were made of solid gold, it would cost less.
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_02 " );	// Well, if you don't need it, then I...
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_03 " );	// (interrupting) Wait - keep your money, you nasty speculator.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_04 " );	// Fine, hold the goblet.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_05 " );	// It's a pleasure doing business with you. If you need anything, get back to me! (with mockery)
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_06 " );	// Get out of my sight, you bastard!
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_07 " );	// I don't want to have anything to do with you anymore.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_08 " );	// And how did you even achieve such a position in society?
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_09 " );	// (with contempt) And who only lets such people come here?
	};
	MIS_FERDSILVERCUP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_SUCCESS);
	B_LogEntry( TOPIC_FERDSILVERCUP , " I sold a silver cup to Ferdinand for a thousand gold coins. I think this will badly affect our relationship with him in the future. " );
	FERDINPISSOFF = TRUE;

	if(MIS_FERDSPECWINE == LOG_Running)
	{
		MIS_FERDSPECWINE = LOG_Failed;
		Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_OBSOLETE);
	};

	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercupdone_give()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SilverCupDone_Give_01_00 " );	// Take it like this, I give it to you.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Give_01_01 " );	// Your generosity knows no bounds, my friend, but I can't just accept him.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SilverCupDone_Give_01_02 " );	// Take a piece of black ore, it's very rare. A very rare item!
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon, 1 );
	MIS_FERDSILVERCUP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_SUCCESS);
	B_LogEntry( TOPIC_FERDSILVERCUP , " I gave Ferdinand a silver cup. " );
	Info_ClearChoices(dia_pal_9122_ritter_silvercupdone);
};

instance DIA_PAL_9122_RITTER_FUCKOFF(C_Info)
{
	npc = pal_9122_ritter;
	nr = 10;
	condition = dia_pal_9122_ritter_fuckoff_condition;
	information = dia_pal_9122_ritter_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_9122_ritter_fuckoff_condition()
{
	if((FERDINPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_PAL_9122_RITTER_THINGS(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_things_condition;
	information = dia_pal_9122_ritter_things_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_pal_9122_ritter_things_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_who))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_things_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_Things_01_00");	//Как жизнь?
	if(MIS_FERDSILVERCUP == LOG_Running)
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_Things_01_01 " );	// Still, do you have any search news?
		AI_Output(other,self, " DIA_Pal_9122_Ritter_Things_01_02 " );	// This is exactly what I'm doing now.
		AI_Output(self,other, " DIA_Pal_9122_Ritter_Things_01_03 " );	// Sorry, really sorry... (sadly)
		AI_StopProcessInfos(self);
	}
	else if(MIS_FERDSILVERCUP == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_Things_01_04 " );	// Good to see you, my friend!
		AI_Output(self,other, " DIA_Pal_9122_Ritter_Things_01_05 " );	// Works just great!
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_9122_Ritter_Things_01_06 " );	// Leave me alone!
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9122_RITTER_SPECWINE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_specwine_condition;
	information = dia_pal_9122_ritter_specwine_info;
	permanent = FALSE;
	description = " What kind of wine are you drinking? " ;
};


func int dia_pal_9122_ritter_specwine_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_pal_9122_ritter_silvercup ) && ( Chapter <  6 )) .
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_specwine_info()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWine_01_00 " );	// What kind of wine do you drink?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_01 " );	// (laughs) interested?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_02 " );	// This wine is called 'Tears of Happiness'.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_03 " );	// It is made from the best grapes, so it is very rare and expensive.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_04 " );	// Can't be found on the island.
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWine_01_05 " );	// Where did you get it then?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_06 " );	// Well, firstly, we sailed from the mainland, and there it is just for sale.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_07 " );	// And secondly... In general, I found out that one of the merchants in the city had a small stock of this wine.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_09 " );	// I think his name is Matteo. But he won't help you.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_10");	//Почему?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_11 " );	// I sent a man to him to buy all his wine - there were only a few bottles.
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWine_01_12 " );	// Did you send a courier to the city? Why the hell didn't you order HE to buy your goblet?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_13 " );	// Understand, a person who buys wine is not interesting.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_14 " );	// And for a silver goblet, any port drunkard will slit his throat.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_15 " );	// Hmm... Although my man, something is very delayed, nothing would happen.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_16 " );	// Look, could you check where he is now?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_01_17 " );	// And when he returns, I will treat you to this wonderful wine!
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
	Info_AddChoice(dia_pal_9122_ritter_specwine, " I don't have time for this. " ,dia_pal_9122_ritter_specwine_no);
	Info_AddChoice(dia_pal_9122_ritter_specwine, " I can go to town and find out everything. " ,dia_pal_9122_ritter_specwine_yes);
};

func void dia_pal_9122_ritter_specwine_no()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWine_No_01_00 " );	// I'm afraid I don't have time for this either.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_No_01_01 " );	// I understand... (sadly) You're a busy man.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_No_01_02 " );	// Don't worry, I'm sure he's fine and will be back soon.
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
};

func void dia_pal_9122_ritter_specwine_yes()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWine_Yes_01_00 " );	// I can go to town and find out everything.
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWine_Yes_01_01 " );	// How much wine should the courier deliver to you?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWine_Yes_01_02 " );	// That would be great! Exactly two bottles of wine.	
	MIS_FERDSPECWINE = LOG_Running;
	Log_CreateTopic(TOPIC_FERDSPECWINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_Running);
	B_LogEntry( TOPIC_FERDSPECWINE , " Ferdinand is concerned that the courier he sent to Matteo to get wine has gone missing. I volunteered to help him find him. I think it's best to go into town and talk to Matteo himself first. " );
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
};

instance DIA_PAL_9122_RITTER_SPECWINEDONE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_specwinedone_condition;
	information = dia_pal_9122_ritter_specwinedone_info;
	permanent = FALSE;
	description = " I found your courier. " ;
};

func int dia_pal_9122_ritter_specwinedone_condition()
{
	if((MIS_FERDSPECWINE == LOG_Running) && (Npc_HasItems(hero,itfo_specwine) >= 2))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_specwinedone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWineDone_01_00 " );	// I found your courier.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWineDone_01_01 " );	// And where is this dolt?
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWineDone_01_02 " );	// He's dead - ran into a pack of wolves not far from the city.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWineDone_01_03 " );	// (regretfully) Hmm, the fate is not pleasant.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWineDone_01_04 " );	// What about wine?
	AI_Output(other,self, " DIA_Pal_9122_Ritter_SpecWineDone_01_05 " );	// I have wine - hold it. Two bottles, just like you said.
	B_GiveInvItems(other,self,itfo_specwine,2);
	Npc_RemoveInvItems(self,itfo_specwine,2);
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWineDone_01_06 " );	// Well, at least there's some good news here.	
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWineDone_01_07 " );	// And as I promised, I will treat you to this wine.
	AI_Output(self,other, " DIA_Pal_9122_Ritter_SpecWineDone_01_08 " );	// Hold - one bottle is yours. Eat for health.
	B_GiveInvItems(self,other,itfo_specwine_hp,1);
	MIS_FERDSPECWINE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_SUCCESS);
	B_LogEntry( TOPIC_FERDSPECWINE , " I brought Ferdinand two bottles of 'Tears of Happiness' wine. He shared one with me. " );
};

instance DIA_PAL_9122_RITTER_RAYNEHELP(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_raynehelp_condition;
	information = dia_pal_9122_ritter_raynehelp_info;
	permanent = FALSE;
	description = " Could you help Rain at the warehouse? " ;
};


func int dia_pal_9122_ritter_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_raynehelp_info()
{
	AI_Output(other,self, " DIA_Pal_9122_Ritter_RayneHelp_01_00 " );	// Could you help Rain at the warehouse?
	AI_Output(self,other, " DIA_Pal_9122_Ritter_RayneHelp_01_01 " );	// Here's something else - I won't even think about doing it!
	AI_Output(other,self, " DIA_Pal_9122_Ritter_RayneHelp_01_02 " );	// Okay, forget it.
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if (( HELPCOUNTRAYNE  >  10 ) && ( MAYTALKVARUSRAYNE  ==  FALSE ) && ( MY_RAYHELP  == LOG_Running ))
	{
		MAYTALKVARUSRAYNE = TRUE ;
		B_LogEntry( TOPIC_RAYNEHELP , " I feel like I'm wasting my time - none of the paladins want to help Rayne. Maybe I should take more drastic action? " );
	};
};


instance DIA_PAL_9122_RITTER_PICKPOCKET(C_Info)
{
	npc = pal_9122_ritter;
	nr = 900;
	condition = dia_pal_9122_ritter_pickpocket_condition;
	information = dia_pal_9122_ritter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9122_ritter_pickpocket_condition()
{
	return  C_Robbery ( 100 , 150 );
};

func void dia_pal_9122_ritter_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
	Info_AddChoice(dia_pal_9122_ritter_pickpocket,Dialog_Back,dia_pal_9122_ritter_pickpocket_back);
	Info_AddChoice(dia_pal_9122_ritter_pickpocket,DIALOG_PICKPOCKET,dia_pal_9122_ritter_pickpocket_doit);
};

func void dia_pal_9122_ritter_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
};

func void dia_pal_9122_ritter_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
};

