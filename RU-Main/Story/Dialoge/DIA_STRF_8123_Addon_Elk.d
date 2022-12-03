

instance DIA_STRF_8123_Addon_Elk_EXIT(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 999;
	condition = DIA_STRF_8123_Addon_Elk_exit_condition;
	information = DIA_STRF_8123_Addon_Elk_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8123_Addon_Elk_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8123_Addon_Elk_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8123_Addon_Elk_HELLO(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_hello_condition;
	information = DIA_STRF_8123_Addon_Elk_hello_info;
	permanent = FALSE;
	description = " How are you? " ;
};

func int DIA_STRF_8123_Addon_Elk_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8123_Addon_Elk_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8123_Addon_Elk_Hello_15_00");	//Как ты?
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Hello_08_00 " );	// Used to be better.
};

instance DIA_STRF_8123_Addon_Elk_Help(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_Help_condition;
	information = DIA_STRF_8123_Addon_Elk_Help_info;
	permanent = FALSE;
	description = " Do you need help? " ;
};

func int DIA_STRF_8123_Addon_Elk_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8123_Addon_Elk_hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_Help_info()
{
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_Help_01_00 " );	// Need help?
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Help_01_01 " );	// Do you want to gouge this vein instead of me? Come on, I don't mind!
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_Help_01_02 " );	// No, I meant something else.
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Help_01_03 " );	// If you really want to help, you'd better get me a decent pickaxe.
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_Help_01_04 " );	// What's wrong with this one?
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Help_01_05 " );	// This one is already so old it's about to break! And the orcs are demanding more and more ore.
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_Help_01_06 " );	// Why don't you ask them yourself?
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Help_01_07 " );	// How... (sadly) Then you open your mouth a little, you immediately get stuck in the ribs from them.
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Help_01_08 " );	// So you have to take good care of your tool yourself.
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_Help_01_09 " );	// But there is a limit to everything!
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_Help_01_10 " );	// Okay, I'll look for a new one for you.
	MIS_ElkKirka = LOG_Running;
	Log_CreateTopic(TOPIC_ElkKirka,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ElkKirka,LOG_Running);
	B_LogEntry(TOPIC_ElkKirka, " Elk needs a new pickaxe. His old one is about to break, and you can't ask the orcs for new tools. " );
};

instance DIA_STRF_8123_Addon_Elk_FakeKirka(C_Info)
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_FakeKirka_condition;
	information = DIA_STRF_8123_Addon_Elk_FakeKirka_info;
	permanent = FALSE;
	description = " I have a pickaxe for you. " ;
};

func int DIA_STRF_8123_Addon_Elk_FakeKirka_condition()
{
	if (( MIS_ElkKirka == LOG_Running ) && ( Npc_HasItems ( hero , ItMw_2H_Axe_L_01 ) >=  1 )) .
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_FakeKirka_info()
{
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_FakeKirka_01_00 " );	// I have a pickaxe for you.
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_FakeKirka_01_01 " );	// And what is this? Same old thing as mine.
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_FakeKirka_01_02 " );	// Boy, get me a real pickaxe!
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_FakeKirka_01_03 " );	// Such that it does not shatter into splinters after the first blow.
	ElkNeedNewKirka = TRUE;
};

instance DIA_STRF_8123_Elk_Addon_NewChurch (C_Info);
{
	npc = STRF_8123_Addon_Elk;
	nr = 2;
	condition = DIA_STRF_8123_Addon_Elk_NewKirka_condition;
	information = DIA_STRF_8123_Addon_Elk_NewKirka_info;
	permanent = FALSE;
	description = " How do you like this one? " ;
};

func int DIA_STRF_8123_Addon_Elk_NewKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (Npc_HasItems(hero,ItMw_Kirka_New) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8123_Addon_Elk_NewKirka_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8123_Addon_Elk_NewKirka_01_00 " );	// How about this one?
	B_GiveInvItems(other,self,ItMw_Kirka_New,1);
	Npc_RemoveInvItems(self,ItMw_Kirka_New,1);
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_NewKirka_01_01 " );	// Hmmm. Here is a completely different matter!
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_NewKirka_01_02 " );	// With this tool, I'll hit my daily allowance in one fell swoop.
	AI_Output(self,other, " DIA_STRF_8123_Addon_Elk_NewKirka_01_03 " );	// Thank you, mate!
	RT_Respect = RT_Respect + 1;
	MIS_ElkKirka = LOG_Success;
	Log_SetTopicStatus(TOPIC_ElkKirka,LOG_Success);
	B_LogEntry(TOPIC_ElkKirka, " I got Elk a new pickaxe. " );
};
