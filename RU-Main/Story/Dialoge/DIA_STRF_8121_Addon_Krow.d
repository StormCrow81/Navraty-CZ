

instance DIA_STRF_8121_Addon_Krow_EXIT(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 999;
	condition = DIA_STRF_8121_Addon_Krow_exit_condition;
	information = DIA_STRF_8121_Addon_Krow_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8121_Addon_Krow_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_8121_Crow_Addon_PreHello (C_Info);
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_PreHello_condition;
	information = DIA_STRF_8121_Addon_Krow_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8121_Addon_Krow_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_PreHello_info()
{
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_PreHello_01_00 " );	// (calmly) Ah, a new face in the mine.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_PreHello_01_01 " );	// We don't often have guests here. Are you here on your own or as a stranger?
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_PreHello_01_02 " );	// Yes, in my own way.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_PreHello_01_03 " );	// Then it's strange that the orcs let you in here.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_PreHello_01_04 " );	// Normally, the only way to get into the mine is in chains with slave collars.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_PreHello_01_05 " );	// Apparently, you are doing some business with them, not otherwise.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_PreHello_01_06 " );	// Let's just say I have some common interests with them.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_PreHello_01_07 " );	// Well, it's none of my business after all. I'm just an ordinary slave here.
};

instance DIA_STRF_8121_Addon_Krow_HELLO(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_hello_condition;
	information = DIA_STRF_8121_Addon_Krow_hello_info;
	permanent = FALSE;
	description = " How did you get here? " ;
};

func int DIA_STRF_8121_Addon_Krow_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_hello_info()
{
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Hello_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Hello_01_01 " );	// Apparently, I somehow angered Innos, since I ended up here.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Hello_01_02 " );	// Who were you before?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Hello_01_03 " );	// I was a mage and served under the ore barons.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Hello_01_04 " );	// Are you good at magic?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Hello_01_05 " );	// Not much. Of course, I'm not as good at the art of magic as, say... Firebenders.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Hello_01_06 " );	// But I still know how to do something. More precisely, he knew how, until he fell into the clutches of the orcs.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Hello_01_07 " );	// Unfortunately, over the long years spent in the mine, I have already managed to forget a lot.
};

instance DIA_STRF_8121_Addon_Krow_Help(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Help_condition;
	information = DIA_STRF_8121_Addon_Krow_Help_info;
	permanent = FALSE;
	description = " Are you all right? " ;
};

func int DIA_STRF_8121_Addon_Krow_Help_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_Help_info()
{
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Help_01_00 " );	// Are you okay?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_01 " );	// More or less. But I would feel better if I had my diary with me.
	AI_Output(other,self, " DIA_STRF_8121_Krow_Addon_Help_01_02 " );	// Дневник?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_03 " );	// There I wrote down my observations, thoughts and so on.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_04 " );	// But when the orcs caught me, they took him along with all the things.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_05 " );	// This thing was very dear to me. We can say that it was the work of my life!
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Help_01_06 " );	// And you have no idea where he is now?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_07 " );	// Most likely, the orcs still have it. But I don't think they'll just give it away.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Help_01_08 " );	// Where did you last see your diary?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_09 " );	// From the orc that searched me. I think his name was Kor Shak.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Help_01_10 " );	// Already something. Okay, if the opportunity presents itself, I'll return your diary.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Help_01_11 " );	// Thank you, wanderer.
	MIS_KrowBook = LOG_Running;
	Log_CreateTopic(TOPIC_KrowBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Running);
	B_LogEntry(TOPIC_KrowBook, " The orcs took away his treasured diary from Krow. The last time Krow saw it was in the hands of an orc named Kor Shak. " );
};

instance DIA_STRF_8121_Addon_Krow_Book(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Book_condition;
	information = DIA_STRF_8121_Addon_Krow_Book_info;
	permanent = FALSE;
	description = " Is this your diary? " ;
};

func int DIA_STRF_8121_Addon_Krow_Book_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_HasItems(other,ItWr_KrowBook) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Book_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Book_01_00 " );	// Is this your diary?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Book_01_01 " );	// Yes, it's him! How did you manage to get it?
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Book_01_02 " );	// It's not that important.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Book_01_03 " );	// Just take it and hide it away so the orcs don't take it from you again.
	B_GiveInvItems(other,self,ItWr_KrowBook,1);
	Npc_RemoveInvItems(self,ItWr_KrowBook,1);
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Book_01_04 " );	// I'll do that. Thank you!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_05");	//Не стоит.
	RT_Respect = RT_Respect + 1;
	MIS_KrowBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Success);
	B_LogEntry(TOPIC_KrowBook, " I returned Krow's diary. He was in seventh heaven. " );
};

instance DIA_STRF_8121_Addon_Krow_Paladin(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Paladin_condition;
	information = DIA_STRF_8121_Addon_Krow_Paladin_info;
	permanent = FALSE;
	description = " I have one question for you. " ;
};

func int DIA_STRF_8121_Addon_Krow_Paladin_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (AskKrow == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Paladin_info()
{
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Paladin_01_00 " );	// I have one question for you.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_01 " );	// Good! I will answer it if I can.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Paladin_01_02 " );	// The thing is, I'm looking for a paladin here.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_03 " );	// (whispers) Hush, hush, my friend. Not so loud. We can be heard.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_04 " );	// It is extremely dangerous to discuss such topics here. Orcs don't forgive mistakes.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Paladin_01_05 " );	// And yet. Do you know anything about it?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_06 " );	// Hmmm...(looks closely) You're being too direct in my opinion.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_07 " );	// Do you expect me to discuss such matters with someone I don't really trust yet?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_08 " );	// You're hanging out with orcs! And this, my friend, is extremely bad for your reputation among the slaves.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_09 " );	// And we can't risk it, because it might be our last hope of getting out of here alive.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Paladin_01_10 " );	// So let's get back to this conversation when things change a bit.
	MIS_TrustMe = LOG_Running;
	Log_CreateTopic(TOPIC_TrustMe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrustMe,LOG_Running);
	B_LogEntry(TOPIC_TrustMe, " I need to gain the miners' trust if I want to know more about the missing paladin. I need to try to help these people with their problems somehow... " );
};

instance DIA_STRF_8121_Addon_Krow_Respect(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Respect_condition;
	information = DIA_STRF_8121_Addon_Krow_Respect_info;
	permanent = TRUE;
	description = " What do they say about me here? " ;
};

func int DIA_STRF_8121_Addon_Krow_Respect_condition()
{
	if ((MY_LostPaladins == LOG_Running) && (MY_TrustMe != LOG_Success) && (Npc_KnowsInfo(hero, DIA_STRF_8121_Addon_Krow_Paladin) ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Respect_info()
{
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Respect_01_00 " );	// What do they say about me here?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_01");	//Хммм...(задумчиво)

	if(RT_Respect >= 8)
	{
		B_GivePlayerXP(250);
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_02 " );	// Looks like you've won everyone's trust here, wanderer.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_03 " );	// So, it's time for you to meet the one you've been looking for.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_04 " );	// However, we have one small problem.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Respect_01_05 " );	// What's the problem?
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_06 " );	// There are a lot of guards around here. Therefore, we need to find a place where the orcs will definitely not hear us.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Respect_01_07 " );	// Any thoughts on this?
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_08 " );	// Hmmm... (thoughtfully) In the cave where Nuts works, there is usually only one guard.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_09 " );	// Now, if you could somehow distract him, it would give us time to talk to the paladin.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Respect_01_10 " );	// Okay, I'll try to get him out of there.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_11 " );	// Good! Then I'll wait for your signal.
		MIS_TrustMe = LOG_Success;
		Log_SetTopicStatus(TOPIC_TrustMe,LOG_Success);
		B_LogEntry(TOPIC_TrustMe, " I won the trust of the miners. " );
		MIS_RemoveOrc = LOG_Running;
		Log_CreateTopic(TOPIC_RemoveOrc,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Running);
		B_LogEntry_Quiet(TOPIC_RemoveOrc, " I need to distract the orc guard in the cave where miner Nuts works. Then I can meet the paladin face to face. " );
	}
	else if(RT_Respect >= 6)
	{
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_12 " );	// You are already close to your goal!
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_13 " );	// Many of us have already gained confidence in you.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_14 " );	// It remains only to take a couple of steps.
	}
	else if(RT_Respect >= 3)
	{
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_15 " );	// People are slowly starting to trust you.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_16 " );	// However, you still have more to do.
	}
	else if(RT_Respect >= 0)
	{
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_17 " );	// You've already helped some of us.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_18 " );	// But that's not enough. You need to show yourself more.
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Respect_01_19 " );	// I'm afraid, my friend, nothing yet.
	};
};


instance DIA_STRF_8121_Addon_Krow_RemoveOrc(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_RemoveOrc_condition;
	information = DIA_STRF_8121_Addon_Krow_RemoveOrc_info;
	permanent = FALSE;
	description = " I got rid of the guard. " ;
};

func int DIA_STRF_8121_Addon_Krow_RemoveOrc_condition()
{
	if((MIS_RemoveOrc == LOG_Running) && (RemoveOrcDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_RemoveOrc_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_RemoveOrc_01_00 " );	// I got rid of the guard.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_RemoveOrc_01_01 " );	// (whispers) Good. I'll take care of the rest myself.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_RemoveOrc_01_02 " );	// And you go back to the cave and wait.
	MIS_RemoveOrc = LOG_Success;
	Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Success);
	B_LogEntry(TOPIC_RemoveOrc, " I informed Crowe that the cave is now empty. Now he will make sure that our meeting takes place. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(STRF_8120_Addon_Gars,"Meet");
	AI_Teleport(STRF_8120_Addon_Gars,"OM_LEVEL_02_BELIAR_04");
};

instance DIA_STRF_8121_Addon_Krow_Teleport(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_info;
	permanent = FALSE;
	description = " I heard you were interested in the old Nuts sign. " ;
};

func int DIA_STRF_8121_Addon_Krow_Teleport_condition()
{
	if((Npc_HasItems(other,ItWr_OldTextMine) >= 1) && (MIS_MineTeleport == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_00 " );	// I heard you were interested in Nuts' old sign.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_01 " );	// Yes, it is. But, unfortunately, he does not give it to anyone.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_02 " );	// But he gave it to me. There she is!
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_03 " );	// It doesn't look like him. I hope this happened in good faith?
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_04 " );	// Of course. It is better to answer what you are so interested in it?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_05 " );	// Well, how... (scratching the back of his head) It's pretty rare to see stuff like this around here.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_06 " );	// Besides, I was just wondering what it says.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_07 " );	// Here, you can take a look at it if you want. Nuts never read it.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_08 " );	// Well, let's see...
	B_GiveInvItems(other,self,ItWr_OldTextMine,1);
	Npc_RemoveInvItems(self,ItWr_OldTextMine,1);
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_09 " );	// Hmmm, apparently it's written in Old Myrtan.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_10 " );	// In these parts, no one speaks it for a long time.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_11 " );	// Do you know him?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_12 " );	// A little... (thoughtfully) I'll need my old diary, though.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_13 " );	// In it, I had entries explaining some of the phrases and copulas of this language.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_14 " );	// Then look into it.

	if(MIS_KrowBook == LOG_Success)
	{
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_15 " );	// Of course. Wait a minute... (reading) Well, we'll see.
		B_UseFakeScroll();
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_16 " );	// Hmmm... (thoughtfully) Very interesting!
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_17 " );	// Well, lay it out, don't delay.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_18 " );	// According to these notes, there was once a magical portal in this mine!
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_19 " );	// It is not very clear who exactly used it, but with its help it was possible to move from one part of the island to another.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_20 " );	// Really interesting. And where could he be?
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_21 " );	// This is not written here. But as far as I can tell, there are definitely no such places in the upper levels of the mine.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_22 " );	// Are you sure about this?
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_23 " );	// Absolutely. There is nothing that remotely resembles a portal.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_24 " );	// And the orcs would certainly be interested in them if they found them.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_25 " );	// Then where is he?
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_26 " );	// Maybe deep down. And there, who knows!
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_27 " );	// Okay, I understand you. Is there nothing else written there?
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_28 " );	// No, nothing else.
		AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_29 " );	// Then you can keep this sign for yourself. Suddenly, something else will come up.
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_30 " );	// Thank you.
		MIS_MineTeleport = LOG_Running;
		Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport, " Crow translated Nuts' tablet. It turned out that somewhere in the mine there used to be a magical portal that allowed you to move from one part of the island to another. Crow believes that it should be found on the lower level of the mine. " );
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_31 " );	// Unfortunately, the orcs took it from me! The day I got here.

		if(MIS_KrowBook == LOG_Running)
		{
			AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_32 " );	// But, I remember that I already told you about this.
			AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_01_33 " );	// Yes, I did. It just kind of slipped out of my head.
		};

		AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_01_34 " );	// But anyway, I can't do anything without it.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_35");	//Понимаю.
	};
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Again(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Again_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Again_info;
	permanent = FALSE;
	description = " You now have a diary. " ;
};

func int DIA_STRF_8121_Addon_Krow_Teleport_Again_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_STRF_8121_Krow_Teleport_Addon) ==  TRUE ) && (MY_MineTeleport ==  FALSE ) && (MY_KrowBook ​​== LOG_Success));
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_Again_info()
{
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_00 " );	// Now you have a diary. Can you try reading that sign?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_01 " );	// Of course! Wait a minute... (reading) Well, we'll see.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_02 " );	// Hmmm... (thoughtfully) Very interesting!
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_03 " );	// Well, lay it out, don't delay.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_04 " );	// According to these notes, there was once a magical portal in this mine!
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_05 " );	// It is not very clear who exactly used it, but with its help it was possible to move from one part of the island to another.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_06 " );	// Really interesting. And where could he be?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_07 " );	// This is not written here. But as far as I can tell, there are definitely no such places in the upper levels of the mine.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_08 " );	// Are you sure about this?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_09 " );	// Absolutely. There is nothing that remotely resembles a portal.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_10 " );	// And the orcs would certainly be interested in them if they found them!
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_11 " );	// Then where is he?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_12 " );	// Maybe deep down. And there, who knows!
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_13 " );	// Okay, I understand you. Is there nothing else written there?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_14 " );	// No, nothing else.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_15 " );	// Then you can keep this sign for yourself. Suddenly, something else will come up.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Again_01_16 " );	// Thank you.
	MIS_MineTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport, " Crow translated Nuts' tablet. It turned out that somewhere in the mine there used to be a magical portal that allowed you to move from one part of the island to another. Crow believes that it should be found on the lower level of the mine. " );
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Focus(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Focus_info;
	permanent = FALSE;
	description = " Can you take a look at this stone? " ;
};

func int DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition()
{
	if((MIS_MineTeleport == LOG_Running) && (SendPortalKrow == TRUE) && (Npc_HasItems(other,ItMi_PortalCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_Focus_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_00 " );	// Can you take a look at this stone?
	B_GiveInvItems(other,self,ItMi_PortalCrystal,1);
	Npc_RemoveInvItems(self,ItMi_PortalCrystal,1);
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_01 " );	// Hmmm... (with interest) Yes, I haven't held such things in my hands for a long time.
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_02 " );	// Wenzel said it looks a bit like a magic unit.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_03 " );	// So this is it! Only a rather unusual kind... I wonder where you got it?
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_04 " );	// Let's just say I found it in the lower level of the mine.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_05 " );	// Looks like you've found the portal as well. Is not it?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_06");	//Все верно.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_07 " );	// This was not difficult to guess, since only with the help of such units can the portal be made to work.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_08 " );	// However, this unit appears to have been made on the mainland. Most likely in Vengard...
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_09 " );	// Where did you get this from?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_10 " );	// See? It bears the mark of the royal order of the Fire Mages. Such things are difficult to confuse with anything!
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_11 " );	// Are you saying that the portal leads to the mainland?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_12 " );	// Quite possible. Only one thing confuses me - how did he get into the orc mine?
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_13 " );	// I'm afraid even the orcs themselves won't answer this question.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_14 " );	// Well, we won't ask them that... (chuckling) Isn't it?
	AI_Output(other,self, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_15 " );	// Of course. Can you use it to activate that portal?
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_16 " );	// Of course! I'm still a magician ... (proudly) But now it's better not to do this.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_17 " );	// If the orcs get wind of what the thing is, they'll either break it or start heavily guarding it.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_18 " );	// In any case, it will no longer be possible to approach it.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_19 " );	// So for now it's best to keep it all a secret.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_20 " );	// For us, that portal is now a real chance to finally get out of here.
	AI_Output(self,other, " DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_21 " );	// Go talk to Wenzel! He will tell you how we should proceed.
	MIS_MineTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Success);
	B_LogEntry_Quiet(TOPIC_MineTeleport, " The stone I found in the lower level of the mine turned out to be a magic unit. It is with it that you can activate the magic portal. According to Crow, the unit itself was made by the masters of Vengard - the capital of Myrtana, and it is likely that the portal leads to mainland. " );
};
