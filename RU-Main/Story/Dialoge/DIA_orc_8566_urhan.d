

instance DIA_ORC_8566_URHAN_EXIT(C_Info)
{
	npc = orc_8566_urhan;
	nr = 999;
	condition = dia_orc_8566_urhan_exit_condition;
	information = dia_orc_8566_urhan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orc_8566_urhan_exit_condition()
{
	return TRUE;
};

func void dia_orc_8566_urhan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_HELLO(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_hello_condition;
	information = dia_orc_8566_urhan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_hello_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_hello_info()
{
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Hello_01_01 " );	// HATAG BAT NAR! Human?! Who let you go?!
	AI_Output(other,self, " DIA_Orc_8566_UrHan_Hello_01_02 " );	// Nobody! I came myself.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Hello_01_04 " );	//Arghh...(belligerently ) However, a person is either too brave or too stupid to come here!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Hello_01_05 " );	// Although you wear the badge of orc power, it may not save you. Just say the word - and my warriors will now tear you to pieces!
	AI_Output(other,self, " DIA_Orc_8566_UrHan_Hello_01_06 " );	// Maybe so, orc. But I'll probably take the risk.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Hello_01_07 " );	// Hmmm... (a little respectfully) All right! And what does a person want from me?
	if(DGJMOVEPALADIN == TRUE)
	{
		b_readydgjmove();
	};
};


instance DIA_ORC_8566_URHAN_WHOYOU(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_whoyou_condition;
	information = dia_orc_8566_urhan_whoyou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_orc_8566_urhan_whoyou_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_whoyou_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_WhoYou_01_01");	//Кто ты?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_WhoYou_01_02 " );	// My name is Hag-Tar, human.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_WhoYou_01_03 " );	// (belligerently) What else would a man want to ask?!
};


instance DIA_ORC_8566_URHAN_WHOLEADER(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_wholeader_condition;
	information = dia_orc_8566_urhan_wholeader_info;
	permanent = FALSE;
	description = " Who leads this squad in the stronghold? " ;
};


func int dia_orc_8566_urhan_wholeader_condition()
{
	if (( MIS_OR с GREATWAR  == LOG_Running ) && ( MIS_STURMCASTLE  ==  FALSE ) && Npc_KnowsInfo( hero , dia_orc_8566_urhan_whoyou )) .
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_wholeader_info()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_WhoLeader_01_01 " );	// Who leads this squad in the fortress?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_WhoLeader_01_02 " );	// Hag-Tar be the boss here! All warriors listen to him and do what he say.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_WhoLeader_01_03 " );	// A person can be very stupid if he does not understand this himself.
};


instance DIA_ORC_8566_URHAN_PALADINSAFE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_paladinsafe_condition;
	information = dia_orc_8566_urhan_paladinsafe_info;
	permanent = FALSE;
	description = " Why did you keep the paladins alive? " ;
};


func int dia_orc_8566_urhan_paladinsafe_condition()
{
	if (( MIS_OR с GREATWAR  == LOG_Running ) && ( KNOWABOUTGAROND  ==  TRUE ) && ( URSHAKTELLPALADIN  ==  FALSE ) && Npc_KnowsInfo(hero ,dia_orc_8566_urhan_whoyou ));
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_paladinsafe_info()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinSafe_01_01 " );	// Why did you keep the paladins alive?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinSafe_01_02 " );	// Man asking too many questions. Hag-Tar is starting to get angry!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinSafe_01_04 " );	// (belligerently) Arghh!
};


instance DIA_ORC_8566_URHAN_PALADINCOST(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_paladincost_condition;
	information = dia_orc_8566_urhan_paladincost_info;
	permanent = FALSE;
	description = " What do you want in exchange for prisoners? " ;
};


func int dia_orc_8566_urhan_paladincost_condition()
{
	if (( MIS_OR с GREATWAR  == LOG_Running ) && ( KNOWABOUTGAROND  ==  TRUE ) && ( MIS_STURMCASTLE  ==  FALSE ) && Npc_KnowsInfo(hero ,dia_orc_8566_urhan_whoyou ));
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_paladincost_info()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_01_01 " );	// What can make you release the prisoners?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_01_04 " );	// Hag-Tar is not to be as stupid as a man thinks.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_01_05 " );	// He always only kill people or just eat! Never let go - always make them dead.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_01_06 " );	// Then why didn't you kill them right away? Why do you need them?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_01_07 " );	// (thoughtfully) Hag-Tar should think so! To Hag-Taru, the shaman speaks like this, the spirits speak.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_01_08 " );	// You can't kill people now! Must wait.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_01_11 " );	// And what can a person offer to Hag-Tar so that he agrees to free people?
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I do n't think it will be easy to figure out a way to free Garond and his people. The orc general who leads the party in the stronghold is a tough nut to crack. " );
	};
	BOGNARTALK = TRUE;
	Info_ClearChoices(dia_orc_8566_urhan_paladincost);
	Info_AddChoice(dia_orc_8566_urhan_paladincost, " Я не знаю. " ,dia_orc_8566_urhan_paladincost_dontknow);
	Info_AddChoice(dia_orc_8566_urhan_paladincost, " Release the paladins and I'll spare your life! " ,dia_orc_8566_urhan_paladincost_live);
	if(FreDragnIsDead == TRUE)
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost, " How about gold, orc? " ,dia_orc_8566_urhan_paladincost_gold);
	};
	if((DGJMOVEPALADIN == FALSE) && (KILLGLOBALCOUNTDJG > 0))
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost, " What do you want? " ,dia_orc_8566_urhan_paladincost_quest);
	};
	if((URSHAKTELLSSECRET == TRUE) && (ORCLEADERISDEAD == FALSE))
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost, " I heard you want to be leader. " ,dia_orc_8566_urhan_paladincost_leader);
	};
};

func void dia_orc_8566_urhan_paladincost_dontknow()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_01 " );	// I don't know.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_02 " );	// Then man go away! Hag-Tar will no longer speak to him.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_03 " );	// If a man again tell Hag-Tar about it - the orc will get angry and tell his warriors to kill the man!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_04 " );	// Now man go!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I'm afraid now I can hardly negotiate with Hag-Thar to let Garond and his people go. " );
	};
	BOGNARREFUSETALK = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_gold()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_01 " );	// How about gold, orc?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_02 " );	// Hag-Tar is not interested in gold! Gold is nothing more than dust to the orcs.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_03 " );	// Orcs respect only strength, only a great warrior!
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_04 " );	// So you want to face me?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_05 " );	// What?! A man wants to fight Hag-Thar?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_07 " );	// (laughs) What a stupid person! Hag-Tar think he wants to die - to put it that way.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_09 " );	// Humans have no chance of defeating me! Hag-Tar be the most powerful orc warrior.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_11 " );	// Then let's check it out! But on the condition that if I win - you will release all the paladins.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_13 " );	// Release the paladin?! Hmmm... Hag-Tar needs to think about it.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_14 " );	// Think faster! Or are you just afraid?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_15 " );	// What?! HROTOK YABART!!! (angrily) Human doubting the power of Hag-Tar?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_19 " );	// Man go where the big mountain be! Where the fire dragon used to live.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_20 " );	// There I tear the man to pieces...(belligerently) Arghhh!
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Gold_01_21 " );	// Good! See you then.
	MIS_CHALLANGEORC = LOG_Running;
	Log_CreateTopic(TOPIC_CHALLANGEORC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_Running);
	B_LogEntry( TOPIC_CHALLANGEORC , " I managed to convince Hag-Thar to fight me in a duel to the death. If I can defeat him, he promised to release the captive paladins. " );
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_live()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Live_01_01 " );	// Release the paladins now!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Live_01_02 " );	// Human threaten Hag-Tar?! (angrily) Then he's going to die now, Ulu-Mulu can't save him. Arghhh!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I'm afraid now I can hardly negotiate with Hag-Thar to let Garond and his people go. " );
	};
	URHANFUCKOFF = TRUE;
	BOGNARREFUSETALK = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_quest()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_01 " );	// What do you need?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_02 " );	// Man himself to ask about this Hag-Tar? Hmmm...
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_06 " );	// Hag-Tar to think that there must be people somewhere here in the valley.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_07 " );	// To believe that they come here to fight dragons. So, be strong warriors!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_08 " );	// Orcs have been looking for them for a long time, but so far they have not been found anywhere.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_09 " );	// What are you talking about?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_10 " );	// A person must go to look for them himself. And when you find - then kill these people! (bloodthirsty) HROTOK YABART!!!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_11 " );	// Hag-Tar wants to make them dead! Their lives in exchange for other people to be here.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Quest_01_12 " );	// Man agree?!
	Info_ClearChoices(dia_orc_8566_urhan_paladincost);
	Info_AddChoice(dia_orc_8566_urhan_paladincost, " Okay! I agree. " ,dia_orc_8566_urhan_paladincost_questagreeed);
	Info_AddChoice(dia_orc_8566_urhan_paladincost, " And you think I'll agree to this?! " ,dia_orc_8566_urhan_paladincost_questnotagreed);
};

func void dia_orc_8566_urhan_paladincost_questagreed()
{
	var C_Npc outter;
	outter = Hlp_GetNpc(DJG_708_Kurgan);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_01 " );	// Good! I agree.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_05 " );	// Then the man do whatever he is told by Hag-Tar.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_06 " );	// Now man go. Come when kill all the people!
	MIS_KILLDRAGONHUNTER = LOG_Running;
	Log_CreateTopic(TOPIC_KILLDRAGONHUNTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_Running);
	B_LogEntry( TOPIC_KILLDRAGONHUNTER , " The orc warlord Hag-Thar offered me to complete his errand in exchange for the lives of captive paladins. He wants me to find a squad of dragon hunters in the Valley of Mines and kill them all. As they say - one life in exchange for another. I agreed to these conditions! May Innos forgive me... " );
	outer.aivar[ 93 ] = FALSE ;
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 50;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_questnotagreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_01 " );	// And you think I'll agree to this?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_04 " );	// If so, then Hag-Tar has nothing more to talk about with humans.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_05 " );	// Now he go and don't come back! (angrily) Otherwise, Hag-Tar will get angry and tell his warriors to kill the people.
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I'm afraid now I can hardly negotiate with Hag-Thar to let Garond and his people go. " );
	};
	AI_StopProcessInfos(self);
	BOGNARREFUSETALK = TRUE;
};

func void dia_orc_8566_urhan_paladincost_leader()
{
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_01 " );	// I heard that you want to become a leader...
	AI_Standup(self);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_03 " );	// Perhaps you could use my help in this matter.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_04 " );	// Well, you, in turn, would release the paladins you captured to freedom.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_06 " );	// (looking carefully) Hag-Tar does not know yet, he needs to think. He is not too trust people!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_07 " );	// Besides, Hag-Tar can't be sure a human can do it.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_13 " );	// Hmmm... (thinking) Hag-Tar agree!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_14 " );	// If a human help Hag-Thar become chieftain and kill Ur-Thrall, then he will free the people.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_15 " );	// However, Hag-Thar needs proof of Ur-Thrall's death! Just because he is a man not to believe.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_16 " );	// I'll see what can be done.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_PaladinCost_Leader_01_17 " );	// Arghh...(belligerently) Hag-Tar wish man luck!
	MIS_KILLURTRALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLURTRALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_Running);
	B_LogEntry( TOPIC_KILLURTRAL , " I asked Hag-Thar about his desire to become an orc-chief. Ur-Shak was right - Hag-Thar really would like to take this place! After some thought, Hag-Thar agreed to my offer to help him in this in exchange on the life of paladins. It remains to go to the city of orcs and deal with this problem. " );
	Log_AddEntry( TOPIC_KILLURTRAL , " Hag-Thar won't believe me. I should bring him some proof of Ur-Thrall's death. " );
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_BOGNARREFUSETALK(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_bognarrefusetalk_condition;
	information = dia_orc_8566_urhan_bognarrefusetalk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8566_urhan_bognarrefusetalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BOGNARREFUSETALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_bognarrefusetalk_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_01");	//Эй, ты!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_02 " );	// Didn't Hag-Tar warn the man not to talk to me anymore?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_03 " );	// Man does not listen to Hag-Tar, so now die... (angrily) Ulu-Mulu cannot save him!
	URHANFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLDRGHUNTERS(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_killdrghunters_condition;
	information = dia_orc_8566_urhan_killdrghunters_info;
	permanent = FALSE;
	description = " I killed those people. " ;
};


func int dia_orc_8566_urhan_killdrghunters_condition()
{
	if((MIS_KILLDRAGONHUNTER == LOG_Running) && (ALLDRGHUNTERSISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killdrghunters_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillDrgHunters_01_01 " );	// I killed those people.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillDrgHunters_01_02 " );	// Good...(bloodthirsty) Hag-Tar now be content! Always be happy when people become dead.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillDrgHunters_01_03 " );	// What about paladins now? Will you let them go?!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillDrgHunters_01_04 " );	// (laughs) To think that a person is very stupid, if then to believe Hag-Tar!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillDrgHunters_01_05 " );	// Hag-Tar fool the people! He does not release other people how to speak.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillDrgHunters_01_06 " );	// But you promised!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillDrgHunters_01_07 " );	// Hag-Tar has nothing more to talk about with humans... He hate humans! Never let them go alive.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillDrgHunters_01_08 " );	// Now man go and never come back...(angrily) Otherwise Hag-Tar will get angry and tell his warriors to kill the man.
	MIS_KILLDRAGONHUNTER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLDRAGONHUNTER , " Hag-Thar tricked me! He won't free the paladins. Now the only thing left for me is to storm the fortress! " );
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I'm afraid now I can hardly negotiate with Hag-Thar to let Garond and his people go. " );
	};
	AI_StopProcessInfos(self);
	BOGNARREFUSETALK = TRUE;
};


instances DIA_ORC_8566_URHAN_CHALLANGE (C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_challange_condition;
	information = dia_orc_8566_urhan_challange_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_challange_condition()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (HAGTARISINSERTED == TRUE) && (URHANBEATEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_challange_info()
{
	Snd_Play("ORC_Angry");
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Challange_01_01 " );	// So, man be here! Come fight Hag-Thar.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Challange_01_03 " );	// (belligerently) Start the battle!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_Challange_01_05 " );	// Arghhhh!!!!
	URHANSPEAKBEFOREBATTLE = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_ORC_8566_URHAN_CHALLANGEORCDONE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_challangeorcdone_condition;
	information = dia_orc_8566_urhan_challangeorcdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_challangeorcdone_condition()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (URHANBEATEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_challangeorcdone_info()
{
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_01 " );	// Stop, man... Well, you defeat Hag-Tar! You don't have to fight him anymore.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_02 " );	// Now Hag-Tar will think that a man be a great warrior - very strong, very brave. He respect the man!
	AI_RemoveWeapon(other);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_03 " );	// Okay, thanks for that. What about captive paladins? Will you let them go?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_04 " );	// (angrily) Good! Hag-Tar let people go as promised. They now be free and go!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_08 " );	// But a man must promise Hag-Tar that he will not tell anyone about his victory over Hag-Tar!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_09 " );	// To say the opposite, that Chag-Tar overcome people. That Hag-Tar be the greatest warrior!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_10");	//Почему?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_11 " );	// If the brothers find out that Hag-Tar lose the battle - they stop respecting him and laugh at him.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_12 " );	// Then Hag-Tar will no longer be a great warrior, as the brothers think. Everyone tells Hag-Tar that he is weak!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_14 " );	// Hag-Tar think that if a person promise him to do it, then he will be able to give the person one very valuable thing.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_15 " );	// And what is this thing?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_16 " );	// Hag-Tar promise to be useful to humans! Do it very strong, very dexterous.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_01_17 " );	// What does a person answer to Hag-Tar?
	CANFREEPALADIN = TRUE;
	; _ _ _ _ _ _
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , "The paladins are free now! We need to let them know. " );
	};
	Info_ClearChoices(dia_orc_8566_urhan_challangeorcdone);
	Info_AddChoice(dia_orc_8566_urhan_challangeorcdone, " Ok, I agree. " ,dia_orc_8566_urhan_challangeorcdone_ok);
	Info_AddChoice(dia_orc_8566_urhan_challangeorcdone, " I'm not interested. " ,dia_orc_8566_urhan_challangeorcdone_no);
};

func void dia_orc_8566_urhan_challangeorcdone_ok()
{
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_01 " );	// Okay, I agree.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_02 " );	// Here, take the man. Then drink and become strong and dexterous!
	B_GiveInvItems(self,other,itpo_xorcpotion,1);
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_03 " );	// And remember that man promise Hag-Tar...(terribly) Don't say he lose man! Say that Hag-Tar will win the battle.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	};
	MIS_CHALLANGEORC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_SUCCESS);
	B_LogEntry( TOPIC_CHALLANGEORC , " I agreed to accept its terms. " );
	self.aivar[AIV_EnemyOverride] = TRUE ;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_challangeorcdone_no()
{
	B_GivePlayerXP(300);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_01 " );	// I'm not interested.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_02 " );	// (angrily) Arghhh! A person to do badly is to refuse the offer of Hag-Tar.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_03 " );	// Now Hag-Tar will have to kill a man, otherwise he will tell everyone that Hag-Tar will lose the battle to him.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_05 " );	// Kill people, tear them apart... (belligerently) HROTOK YABART!!!
	REFUSEURHAN = TRUE;
	MIS_CHALLANGEORC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_SUCCESS);
	B_LogEntry( TOPIC_CHALLANGEORC , " I refused to accept his terms, and Hag-Thar decided to kill me. Well, I already beat him once. I'll have to teach him another lesson. " );
	self.aivar[AIV_EnemyOverride] = FALSE ;
	URHANFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLURTRALLDONE(C_Info)
{
	npc = orc_8566_urhan;
	nr = 1;
	condition = dia_orc_8566_urhan_killurtralldone_condition;
	information = dia_orc_8566_urhan_killurtralldone_info;
	permanent = FALSE;
	description = " Now you can become a leader. " ;
};


func int dia_orc_8566_urhan_killurtralldone_condition()
{
	if (( MIS_KILLURTRALL  == LOG_Running ) && ( ORCLEADERISDEAD  ==  TRUE ) && ( Npc_HasItems ( hero , itmi_orcmaintotem ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killurtralldone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_01 " );	// Now you can become a leader.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_02 " );	// Hmmm, what do you mean man?! (surprised) Was he able to defeat High Chieftain Ur-Thrall?
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_03 " );	// Yes, I did it! Here, take this little thing as proof of my words.
	B_GiveInvItems(other,self,itmi_orcmaintotem,1);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_04 " );	// I think you should be familiar with it.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_05 " );	// GAR TAGAN SAH! (very surprised) It must be the Totem of Power - the sign of the leader of the orcs! Hag-Tar can't believe his eyes...
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_07 " );	// Arghhh! Hag-Tar think it's all good...(pretty) He believe the man and his word.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_08 " );	// Now Hag-Tar becomes a leader - all brothers respect and listen to him! Hag-Tar be very pleased.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_09 " );	// What about our deal? Will you release the captive paladins?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillUrTrallDone_01_10 " );	// (thoughtfully) Good! Hag-Tar let people go as promised. They are now free and can leave!
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	};
	CANFREEPALADIN = TRUE;
	MIS_KILLURTRALL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLURTRAL , " I've informed Hag-Thar of Ur-Thrall's death. I think he'll let the paladins go now. " );
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , "The paladins are free now! We need to let them know. " );
	};
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLHAGTARDO (C_Info)
{
	npc = orc_8566_urhan;
	nr = 1;
	condition = dia_orc_8566_urhan_killhagtardo_condition;
	information = dia_orc_8566_urhan_killhagtardo_info;
	permanent = FALSE;
	description = " Chief Ur-Thrall wants you dead! " ;
};


func int dia_orc_8566_urhan_killhagtardo_condition()
{
	if (( MIS_KILLURTRALL  == LOG_Running) && ( ORCLEADERISDEAD  ==  FALSE ) && (Npc_HasItems(hero,itmi_orcmaintotem) >=  1 ) && ( URNAZULGIVETASK  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killhagtardo_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillHagTarDo_01_01 " );	// Warchief Ur-Thrall wants you dead!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillHagTarDo_01_02 " );	// What?! Hag-Tar does not understand... What is the person talking about?
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillHagTarDo_01_03 " );	// I told him everything! And he sent me to get even with you.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillHagTarDo_01_04 " );	// HATAG BAT NAR! So that means the person betray me?! Give away my secret to Ur-Thrall?
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillHagTarDo_01_06 " );	// Arghhh!!! (infuriated) Then the man will pay dearly for this! My warriors are now tearing the man apart.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillHagTarDo_01_07 " );	// Better not rush! Here, look what I have.
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillHagTarDo_01_08 " );	// What is this? (frightened) Power Totem?!
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillHagTarDo_01_09 " );	// Yes, it's him! The talisman of Ur-Thrall is a sign of his authority as supreme leader of the orcs.
	AI_Output(other,self, " DIA_Orc_8566_UrHan_KillHagTarDo_01_10 " );	// So your warriors won't help you anymore. You will have to fight me yourself!
	AI_Output(self,other, " DIA_Orc_8566_UrHan_KillHagTarDo_01_11 " );	// Arghhh!!! (fiercely) Man still die! Hag-tar kill him right now!
	B_LogEntry( TOPIC_KILLURTRAL , " Hag-Thar was furious that I had betrayed him and attacked me without hesitation. I hope Ur-Thrall didn't deceive me about the talisman and the rest of the orcs don't get involved in this fight. " );
	self.guild = GIL_WOLF;
	TELLHAGTARKILLYOU = TRUE;
	URHANFUCKOFF = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	AI_StopProcessInfos(self);
};

