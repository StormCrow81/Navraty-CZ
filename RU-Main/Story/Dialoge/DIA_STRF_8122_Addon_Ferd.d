

instance DIA_STRF_8122_Addon_Ferd_EXIT(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 999;
	condition = DIA_STRF_8122_Addon_Ferd_exit_condition;
	information = DIA_STRF_8122_Addon_Ferd_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8122_Addon_Ferd_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8122_Addon_Ferd_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8122_Feed_Addon_PreHello (C_Info);
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_PreHello_condition;
	information = DIA_STRF_8122_Addon_Ferd_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8122_Addon_Ferd_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_PreHello_info()
{
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_PreHello_01_00 " );	// Well, what else is this?
};

instance DIA_STRF_8122_Addon_Ferd_AfterHello(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_AfterHello_condition;
	information = DIA_STRF_8122_Addon_Ferd_AfterHello_info;
	permanent = FALSE;
	description = " Hi. How are you? " ;
};

func int DIA_STRF_8122_Addon_Ferd_AfterHello_condition()
{
	return TRUE;
};

func void DIA_STRF_8122_Addon_Ferd_AfterHello_info()
{
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_00 " );	// Hello. How are you?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_01 " );	// Here you found something to ask.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_02 " );	// Fucking business! And what else could they be?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_03 " );	// Day and night all you do is gouge that damned vein.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_04 " );	// It will take another ten years, and everything will remain exactly the same.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_05 " );	// Well, unless you take into account the fact that you can simply not live up to this time.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_06 " );	// And I see you are an optimist!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_AfterHello_01_07 " );	// If you stay here with mine, you will become the same.
};

instance DIA_STRF_8122_Addon_Ferd_HELLO(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_hello_condition;
	information = DIA_STRF_8122_Addon_Ferd_hello_info;
	permanent = FALSE;
	description = " Have you been here for a long time? " ;
};

func int DIA_STRF_8122_Addon_Ferd_hello_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_STRF_8122_Ferd_Addon_AfterHello ) ==  TRUE ) .
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_hello_info()
{
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Hello_01_00 " );	// Probably, you've been here for a long time?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Hello_01_01 " );	// More than you can imagine.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Hello_01_02 " );	// How much is this?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Hello_01_03 " );	// Listen, buddy...(grouchily) If you don't have anything to do, you better pester the other guys with questions.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Hello_01_04 " );	// And I have to work! Otherwise, the orcs will skin me.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8122_Addon_Ferd_Escape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Escape_condition;
	information = DIA_STRF_8122_Addon_Ferd_Escape_info;
	permanent = FALSE;
	description = " What do you know about the slave escape? " ;
};

func int DIA_STRF_8122_Addon_Ferd_Escape_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_AfterHello) ==  TRUE ) && (MY_EscapeMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Escape_info()
{
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Escape_01_00 " );	// What do you know about slave escape?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_01 " );	// Hush you! Or do you want the orcs to hear us?!
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Escape_01_02 " );	// What are you afraid of?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_03 " );	// Man, they don't joke around with stuff like that! And then in a moment you can say goodbye to your life.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Escape_01_04 " );	// Well, are you going to tell or not?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_05 " );	// Beliar would have taken you... (displeasedly) Here he was imposed on my head!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_06 " );	// Okay, I'll tell you everything I know. But in return, you will do me one small favor.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Escape_01_07 " );	// And what are we talking about?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_08 " );	// First, get me some healing elixirs. I think five is enough.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_09 " );	// And then the last time I was hammering a vein, I pulled my hand very hard.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_10 " );	// This infection is so annoying, and I can't work properly! I can barely manage my daily routine.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_11 " );	// Thank god the orcs haven't noticed this yet. And then with such they have a short conversation.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Escape_01_12 " );	// For starters?! Will there be something else?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_13 " );	// Bring the elixirs first, then we'll talk about everything else.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_14 " );	// Or are you no longer interested in learning about the escape?
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Escape_01_15 " );	// Okay, calm down! I'll try to get you a couple or two.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Escape_01_16 " );	// That's better.
	MIS_FerdPotions = LOG_Running;
	Log_CreateTopic(TOPIC_FerdPotions,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Running);
	B_LogEntry(TOPIC_FerdPotions, " Ferd asked for some healing elixirs for him. He's badly injured his hand and doesn't want the orcs to guess anything. " );
};

instance DIA_STRF_8122_Addon_Ferd_Potions(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Potions_condition;
	information = DIA_STRF_8122_Addon_Ferd_Potions_info;
	permanent = FALSE;
	description = " Here are your elixirs. " ;
};

func int DIA_STRF_8122_Addon_Ferd_Potions_condition()
{
	if((MIS_FerdPotions == LOG_Running) && (Npc_HasItems(other,ItPo_Health_03) >= 5))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Potions_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_00 " );	// Here are your elixirs.
	B_GiveInvItems(other,self,ItPo_Health_03,5);
	Npc_RemoveInvItems(self,ItPo_Health_03,4);
	AI_PlayAni(self,"T_SEARCH");
	B_UseItem(self,ItPo_Health_03);
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_01 " );	// Mmmm... The pain is gone! The rest will come in handy for the future.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_02 " );	// But, as I said, that's not all.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_03 " );	// I'm listening to you.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_04 " );	// I need you to give me back my ring.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_05 " );	// What else is a ring?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_06 " );	// Ordinary silver ring. Nothing special.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_07 " );	// But there is one circumstance - the fact is that my father gave it to me.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_08 " );	// Aha! Family item?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_09 " );	// Something like that. All these years spent in the mine, it was kept by me.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_10 " );	// And when I looked at him, I remembered my family and those times when everything was different.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_11 " );	// But one day that dirty bastard Vakur Shak noticed this ring from me and took it for himself!
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_12 " );	// Who is Vakur Shak?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_13 " );	// One of the senior orc overseers. Greedy for everything he sets his eyes on!
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_14 " );	// Do you want me to try and negotiate with him about your ring?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_15 " );	// I don't know how you would do it. But I see that you are allowed to roam around in peace even with a weapon.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Potions_01_16 " );	// Which means that he will at least listen to you.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Potions_01_17 " );	// I'll see what I can do.
	RT_Respect = RT_Respect + 1;
	MIS_FerdPotions = LOG_Success;
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Success);
	B_LogEntry(TOPIC_FerdPotions, " I brought Ferd some health elixirs. " );
	MIS_FerdRing = LOG_Running;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Running);
	B_LogEntry(TOPIC_FerdRing, " Ferd wants me to give him back the family ring that Vakur Shak, Senior Slave Overseer, took from him. " );
};

instance DIA_STRF_8122_Addon_Ferd_Ring(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Ring_condition;
	information = DIA_STRF_8122_Addon_Ferd_Ring_info;
	permanent = FALSE;
	description = " Is this your ring? " ;
};

func int DIA_STRF_8122_Addon_Ferd_Ring_condition()
{
	if ((MIS_FerdRing == LOG_Running) && (Npc_HasItems(other,ItRi_Ferd) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Ring_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Ring_01_00 " );	// Is this your ring?
	B_GiveInvItems(other,self,ItRi_Ferd,1);
	Npc_RemoveInvItems(self,ItRi_Ferd,1);
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Ring_01_01 " );	// (joyfully) Yes, that's it! How did you manage to wrest it from the hands of Vakur Shak?
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Ring_01_02 " );	// You better not know. This orc turned out to be that huckster!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Ring_01_03 " );	// Oh well. The main thing is that now I have it again.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Ring_01_04 " );	// Thank you, old man.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Ring_01_05 " );	// Just make sure it's not taken from you again.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Ring_01_06 " );	// Otherwise, next time you will return it yourself.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Ring_01_07 " );	// Of course.
	RT_Respect = RT_Respect + 1;
	MIS_FerdRing = LOG_Success;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Success);
	B_LogEntry(TOPIC_FerdRing, " I gave Ferd his family ring back. " );
};

instance DIA_STRF_8122_Addon_Ferd_EscapeTell(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_EscapeTell_condition;
	information = DIA_STRF_8122_Addon_Ferd_EscapeTell_info;
	permanent = FALSE;
	description = " How about our deal? " ;
};

func int DIA_STRF_8122_Addon_Ferd_EscapeTell_condition()
{
	if (MIS_FerdRing == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_EscapeTell_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_00 " );	// How about our deal?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_01 " );	// Of course, I'll keep my word and tell you everything I know about the slave escape.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_02 " );	// It happened a couple of years ago... (thoughtfully) One slave named Bargo decided to run away from here.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_03 " );	// He got most of the miners to start a riot in the mine.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_04 " );	// And in the meantime, taking advantage of the general turmoil, he wanted to slip past the guards unnoticed.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_05 " );	// On the appointed day, the slaves revolted. They killed a couple of guards and the whole crowd moved to the exit.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_06 " );	// But the orcs were smarter! They blocked all the exits from the mine except for one.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_07 " );	// Therefore, the rebels had no choice but to go there.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_08 " );	// But at the end of this path, a dead end awaited them. And from above, a punitive detachment of orc crossbowmen was already waiting.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_09 " );	// What happened next, I won't tell...
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_10 " );	// I can only say one thing - no one survived that massacre!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_11 " );	// Many then paid with their lives, trusting the tales of Bargo.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_12 " );	// And what happened to Bargo himself?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_13 " );	// Ha! Realizing that his plan had failed, this rat hid in the farthest and darkest corner that it could find.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_14 " );	// But the orcs found him. And then they cut off his head as a warning to the rest!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_15 " );	// This is how it ended. Since then, no one has thought of escaping here.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_16 " );	// This word alone terrifies them...
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_EscapeTell_01_17 " );	// Yes, quite a sad story.
	B_LogEntry(TOPIC_EscapeMine, " Ferd told me what happened on the day of the escape. From that moment on, no one thinks about escaping anymore. " );
};

instance DIA_STRF_8122_Addon_Ferd_NoEscape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_NoEscape_condition;
	information = DIA_STRF_8122_Addon_Ferd_NoEscape_info;
	permanent = FALSE;
	description = " You will never get out of this mine. " ;
};

func int DIA_STRF_8122_Addon_Ferd_NoEscape_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_EscapeTell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_NoEscape_info()
{
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_00 " );	// You will never get out of this shaft.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_01 " );	// (sarcastically) You don't believe in that yourself, do you?
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_02 " );	// No. It's just that the main passage from the mine leads straight to the orc city.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_03 " );	// And there you will be waiting not for ordinary guards, but for elite warriors!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_05 " );	// Damn! I couldn't even imagine it.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_06 " );	// Now you know about it.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_07 " );	// Well, then I guess we should all accept our fate.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_NoEscape_01_08 " );	// Looks like we'll be left to rot in this hole forever!
};

instance DIA_STRF_8122_Addon_Ferd_Bunt (C_Info) .
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Bunt_condition;
	information = DIA_STRF_8122_Addon_Ferd_Bunt_info;
	permanent = FALSE;
	description = " What will make you rebel again? " ;
};

func int DIA_STRF_8122_Addon_Ferd_Bunt_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_EscapeTell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Bunt_info()
{
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_00 " );	// What will make you rebel again?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_01 " );	// I don't think that's even possible...(doomed) People are too scared!
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_02 " );	// They have no faith, no strength to fight, no trust in anyone.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_03 " );	// You just need a strong leader.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_04 " );	// Hmmm...(thoughtfully) Yes, you might be right! Just take a look around. Who do you see?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_05 " );	// There are only simple miners here. And the long years spent in this mine break people very quickly.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_06 " );	// I heard that there is a paladin among you.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_07 " );	// (surprised) Paladin?! Here? Are you joking?
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_08 " );	// Not even in my mind! That is why I am here now.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_09 " );	// Here's the news...
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_10 " );	// But you know, even if it's true, he's unlikely to show himself here somehow.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_11 " );	// Orcs will skin him alive if they find out who he really is!
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_12 " );	// Do you have any idea who it could be?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_13 " );	// Where, mate? I just found out about this myself.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_14 " );	// And who can know?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_15 " );	// The second question is more difficult than the first.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_16 " );	// But if I were to start my search, the first thing I'd do would be talk to Crow.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_17 " );	// Is he special?
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_18 " );	// No. He's just the smartest of us. Previously, he was either a magician or an alchemist.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_19 " );	// I already forgot, to be honest. So, for starters, talk to him.
	AI_Output(self,other, " DIA_STRF_8122_Addon_Ferd_Bunt_01_20 " );	// Maybe he'll tell you something.
	AI_Output(other,self, " DIA_STRF_8122_Addon_Ferd_Bunt_01_21 " );	// I'll do that.
	AskKrow = TRUE;
	B_LogEntry(TOPIC_LostPaladins, " Ferd was surprised to learn that there was a paladin among the slaves. When asked who it could be, Ferd suggested talking to a certain Crow. " );
};
