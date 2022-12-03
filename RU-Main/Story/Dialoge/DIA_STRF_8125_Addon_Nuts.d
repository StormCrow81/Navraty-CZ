

instance DIA_STRF_8125_Addon_Nuts_EXIT(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 999;
	condition = DIA_STRF_8125_Addon_Nuts_EXIT_Condition;
	information = DIA_STRF_8125_Addon_Nuts_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8125_Addon_Nuts_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8125_Addon_Nuts_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8125_Addon_Nuts_PreHello(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 2;
	condition = DIA_STRF_8125_Addon_Nuts_PreHello_condition;
	information = DIA_STRF_8125_Addon_Nuts_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8125_Addon_Nuts_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NutsRest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_PreHello_info()
{
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_PreHello_01_00 " );	// Hey, don't disturb my work! Let's talk later.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8125_Addon_Nuts_NotWork(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_NotWork_Condition;
	information = DIA_STRF_8125_Addon_Nuts_NotWork_Info;
	permanent = FALSE;
	description = " Yes, I see, you don't really work here. " ;
};

func int DIA_STRF_8125_Addon_Nuts_NotWork_Condition()
{
	if(NutsRest == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_NotWork_Info()
{
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_NotWork_01_00 " );	// Yes, I see, you don't really work here.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_NotWork_01_01 " );	// Well...(slyly) Only when that orc guard is asleep.
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_NotWork_01_02 " );	// And he sleeps, apparently, for a very long time.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_NotWork_01_03 " );	// Even so...(bewildered) Who will know about this?
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_NotWork_01_04 " );	// I could tell the orcs about you.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_NotWork_01_05 " );	// But you won't do that, will you? Truth?
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_NotWork_01_06 " );	// I won't. If only you could help me with one thing.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_NotWork_01_07 " );	// What do you want from me?
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_NotWork_01_08 " );	// Come on, relax! I was just joking.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_NotWork_01_09 " );	// What a joke, buddy... (nervously) You can lose your last nerves like that!
};

instance DIA_STRF_8125_Addon_Nuts_YouHereLongTime(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Condition;
	information = DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Info;
	permanent = FALSE;
	description = " Have you been here long? " ;
};

func int DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_NotWork) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_YouHereLongTime_Info()
{
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_00 " );	// How long have you been here?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_01 " );	// In truth, I've already lost track of time.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_YouHereLongTime_01_02 " );	// But if the orcs keep making me work so hard, I won't last long.
};

instance DIA_STRF_8125_Addon_Nuts_Teleport(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_Teleport_Condition;
	information = DIA_STRF_8125_Addon_Nuts_Teleport_Info;
	permanent = FALSE;
	description = " What do you do here when... you work? " ;
};

func int DIA_STRF_8125_Addon_Nuts_Teleport_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_NotWork) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_Teleport_Info()
{
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_Teleport_01_00 " );	// What do you do here when... you work?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Teleport_01_01 " );	// You'll be surprised, but I'm reading.
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_Teleport_01_02 " );	// Are you reading? What can be read here?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Teleport_01_03 " );	// In this cave, I found one old stone tablet.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Teleport_01_04 " );	// The language in it is a bit like a human. Although I'm not exactly sure.
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_Teleport_01_05 " );	// Can you take a look?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Teleport_01_06 " );	// Hey, hands off! Consider it the only thing that fills my whole life with at least some meaning.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Teleport_01_07");	//Даже так?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Teleport_01_08 " );	// Of course! After all, apart from the orcs and this accursed vein, I will not see anything here anymore.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Teleport_01_09 " );	// And so at least some variety!
};

instance DIA_STRF_8125_Addon_Nuts_Want(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_Want_Condition;
	information = DIA_STRF_8125_Addon_Nuts_Want_Info;
	permanent = FALSE;
	description = " What do you want for your sign? " ;
};

func int DIA_STRF_8125_Addon_Nuts_Want_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8125_Addon_Nuts_Teleport) == TRUE) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_Want_Info()
{
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_Want_01_00 " );	// What do you want for your sign?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Want_01_01 " );	// Hmmm...(slyly) She's actually priceless to me!
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Want_01_02 " );	// But since you asked... I guess a good book would be a worthy replacement for her.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Want_01_03 " );	// And preferably about the stars.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_04");	//Про звезды?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Want_01_05 " );	// I've always loved watching the stars. Even when I was a kid!
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Want_01_06 " );	// But fate decreed otherwise... (doomed) And now I'm unlikely to ever see them.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_Want_01_07 " );	// But at least I'll read about them.
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_Want_01_08");	//Понимаю.
	MIS_Astronomy = LOG_Running;
	Log_CreateTopic(TOPIC_Astronomy,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Astronomy,LOG_Running);
	B_LogEntry(TOPIC_Astronomy, " In exchange for his tablet, Nuts wants to get some book - and preferably about the stars. " );
};

instance DIA_STRF_8125_Addon_Nuts_WantDone(C_Info)
{
	npc = STRF_8125_Addon_Nuts;
	nr = 1;
	condition = DIA_STRF_8125_Addon_Nuts_WantDone_Condition;
	information = DIA_STRF_8125_Addon_Nuts_WantDone_Info;
	permanent = FALSE;
	description = " Here's the book you need. " ;
};

func int DIA_STRF_8125_Addon_Nuts_WantDone_Condition()
{
	if((MIS_Astronomy == LOG_Running) && (Npc_HasItems(other,ASTRONOMIE) >= 1) && (NutsRest == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8125_Addon_Nuts_WantDone_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_WantDone_01_00 " );	// Here's the book you need.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_01 " );	// Hmmm...(incredulously) Is she even interesting?
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_WantDone_01_02 " );	// Well, everything is as you asked. About the stars...
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_03 " );	// Better let me take a look.
	B_GiveInvItems(other,self,ASTRONOMIE,1);
	Npc_RemoveInvItems(self,ASTRONOMIE,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_04 " );	// Great, mate! It looks like this is exactly what I need!
	AI_Output(other,self, " DIA_STRF_8125_Addon_Nuts_WantDone_01_05 " );	// What about our deal?
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_06 " );	// All is good! Here, hold that sign.
	B_GiveInvItems(self,other,ItWr_OldTextMine,1);
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_07 " );	// And the book, then, I'll keep myself, right?
	AI_Output(other,self,"DIA_STRF_8125_Addon_Nuts_WantDone_01_08");	//Конечно.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_09 " );	// By the way, Crowe was interested in this tablet at one time.
	AI_Output(self,other, " DIA_STRF_8125_Addon_Nuts_WantDone_01_10 " );	// Well, that's me, by the way...
	RT_Respect = RT_Respect + 1;
	MIS_Astronomy = LOG_Success;
	Log_SetTopicStatus(TOPIC_Astronomy,LOG_Success);
	B_LogEntry(TOPIC_Astronomy, " I brought the book to Nuts. " );
};
