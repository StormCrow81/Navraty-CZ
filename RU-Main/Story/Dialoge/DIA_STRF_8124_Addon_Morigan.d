

instance DIA_STRF_8124_Addon_Morigan_EXIT(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 999;
	condition = DIA_STRF_8124_Addon_Morigan_exit_condition;
	information = DIA_STRF_8124_Addon_Morigan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8124_Addon_Morigan_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8124_Addon_Morigan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8124_Addon_Morigan_HELLO(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_hello_condition;
	information = DIA_STRF_8124_Addon_Morigan_hello_info;
	permanent = FALSE;
	description = " Is there something I can help you with? " ;
};

func int DIA_STRF_8124_Addon_Morigan_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8124_Addon_Morigan_hello_info()
{
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Hello_15_00 " );	// Is there anything I can do to help?
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Hello_08_00 " );	// Yes...(grouchily) For example, leave me alone.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Hello_08_01 " );	// If the orcs notice that I'm talking to you here, I'm going to have a hard time, buddy.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8124_Addon_Morigan_Help(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Help_condition;
	information = DIA_STRF_8124_Addon_Morigan_Help_info;
	permanent = FALSE;
	description = " Seriously? " ;
};

func int DIA_STRF_8124_Addon_Morigan_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Help_info()
{
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Help_01_00 " );	// But seriously?
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Help_01_01 " );	// Look...(nervously) I don't need your help!
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Help_01_02 " );	// But if you really want to do a good deed, bring me something to drink.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Help_01_03 " );	// Otherwise, everything in my mouth is so dry that it hurts even to swallow.
};

instance DIA_STRF_8124_Addon_Morigan_Water(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Water_condition;
	information = DIA_STRF_8124_Addon_Morigan_Water_info;
	permanent = FALSE;
	description = " Here, take a sip of water. " ;
};

func int DIA_STRF_8124_Addon_Morigan_Water_condition()
{
	if (( Npc_KnowsInfo ( hero , DIA_STRF_8124_Addon_Morigan_Help ) ==  TRUE ) && ( Npc_HasItems ( other , ItFo_Water ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Water_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Water_01_00 " );	// Here, take a sip of water.
	B_GiveInvItems(other,self,ItFo_Water,1);
	B_UseItem(self,ItFo_Water);
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Water_01_01 " );	// Much better this way.
};

instance DIA_STRF_8124_Addon_Morigan_Father(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Father_condition;
	information = DIA_STRF_8124_Addon_Morigan_Father_info;
	permanent = FALSE;
	description = " Maybe something else? " ;
};

func int DIA_STRF_8124_Addon_Morigan_Father_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_Water) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Father_info()
{
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_00 " );	// Maybe something else?
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_01 " );	// Hmmm...(thoughtfully) I don't even know if I should ask you this.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_02 " );	// And you try.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_03 " );	// Okay. In the end, except for you, it is unlikely that anyone else will help me here.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_04 " );	// Tell me, do you often go to the surface?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_05");	//Конечно.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_06 " );	// And what's the situation there?
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_07 " );	// Not much better than here! Orcs almost completely control the island.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_08 " );	// The only thing they haven't dared to poke their nose into is Khorinis himself.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_09 " );	// But it's unlikely to happen anytime soon, as there's a large band of paladins stationed there.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_10 " );	// Well, this is good news...
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_11 " );	// And why are you actually interested?
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_12 " );	// The fact is that my father lives in Khorinis.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_13 " );	// If only you could get word to him that I'm alive.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_14 " );	// And who is your father?
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_15 " );	// His name is Karl, he is a blacksmith. If you've been to the city, you must know it for sure.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_16 " );	// Yes, I know him. But would he want to hear such news?
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_17 " );	// I understand that my current situation is not the best.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_18 " );	// But I'm still alive, and he should know about it!
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_Father_01_19 " );	// Okay, I'll pass this on to him.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_Father_01_20 " );	// Thank you, mate! I don't need more.
	MIS_FatherNews = LOG_Running;
	Log_CreateTopic(TOPIC_FatherNews,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FatherNews,LOG_Running);
	B_LogEntry(TOPIC_FatherNews, " I promised Morigan to visit his father in Khorinis and tell him that his son is still alive. His father's name is Carl. " );
};

instance DIA_STRF_8124_Addon_Morigan_FatherDone(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_FatherDone_condition;
	information = DIA_STRF_8124_Addon_Morigan_FatherDone_info;
	permanent = FALSE;
	description = " I talked to your father. " ;
};

func int DIA_STRF_8124_Addon_Morigan_FatherDone_condition()
{
	if(MIS_FatherNews == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_FatherDone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_00 " );	// I talked to your father.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_01 " );	// (excitedly) Are you kidding me?
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_02 " );	// No, of course not! It makes no sense for me to do this.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_03 " );	// And what did he say?
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_04 " );	// Your father was glad to hear that you are still alive.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_05 " );	// And he will pray for you to Innos.
	AI_Output(other,self, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_06 " );	// In the hope that someday you can still return home.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_07 " );	// Eh...(sadly) I'd be happy to believe it myself. Yes, you can't run away from here.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_08 " );	// But anyway, I'm grateful for your help.
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_09 " );	// Here, take this piece of ore as a token of my appreciation.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon, 1 );
	AI_Output(self,other, " DIA_STRF_8124_Addon_Morigan_FatherDone_01_10 " );	// Unfortunately, I have nothing more to give you.
	RT_Respect = RT_Respect + 1;
};
