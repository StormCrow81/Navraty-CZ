

instance DIA_Brutus_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_AFTER_FIGHT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 1;
	condition = DIA_Brutus_AFTER_FIGHT_Condition;
	information = DIA_Brutus_AFTER_FIGHT_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Brutus_AFTER_FIGHT_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && Npc_IsInState(self,ZS_Talk) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_AFTER_FIGHT_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self, " DIA_Brutus_AFTER_FIGHT_15_00 " );	// Do you still have all your teeth?
		AI_Output(self,other, " DIA_Brutus_AFTER_FIGHT_06_01 " );	// Yes, I know you're cool! I wouldn't want to fight you in a fight.
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(other,self, " DIA_Brutus_AFTER_FIGHT_15_02 " );	// I think you broke all my ribs.
		AI_Output(self,other, " DIA_Brutus_AFTER_FIGHT_06_03 " );	// And I didn't even hit you with full force. Okay, forget it, I like guys who can take multiple hits in a row.
		if (Brutus_unique ==  FALSE )
		{
			AI_Output(self,other, " DIA_Brutus_AFTER_FIGHT_06_04 " );	// Here's a potion to help you get back on your feet. It will also do wonders for your insides!
			CreateInvItems(self,ItPo_Health_01,1);
			B_GiveInvItems(self,hero,ItPo_Health_01,1);
			Brutus_unique = TRUE ;
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Brutus_AFTER_FIGHT_06_05 " );	// I don't mind a good fight. But when I start a fight, I end it.
	};
	self.aivar[AIV_LastFightComment] = TRUE ;
};


instances DIA_Brutus_PRISONER (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_PRISONER_Condition;
	information = DIA_Brutus_PRISONER_Info;
	description = " What are you doing here? " ;
};


func int DIA_Brutus_PRISONER_Condition()
{
	if ((Chapter <  3 ) && (NpcObsessedByDMT_Brutus ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PRISONER_Info()
{
	AI_Output(other,self, " DIA_Brutus_PRISONER_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Brutus_PRISONER_06_01 " );	// What am I doing? I train guys. I teach them how to build muscle of steel.
	AI_Output(self,other, " DIA_Brutus_PRISONER_06_02 " );	// I also look after the prisoners. I'm like a father to them, damn me.
	AI_Output(self,other, " DIA_Brutus_PRISONER_06_03 " );	// But my real job is to make them talk. And trust me, I know ways to get anyone talking.
	AI_Output(other,self, " DIA_Brutus_PRISONER_15_04 " );	// Sounds terribly nice...
	AI_Output(self,other, " DIA_Brutus_PRISONER_06_05 " );	// But those flea-faced morons currently behind bars don't have much to say anyway.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Brutus_PRISONER_06_06 " );	// And they don't let me near this Gorn.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Brutus_PERM(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 90;
	condition = DIA_Brutus_PERM_Condition;
	information = DIA_Brutus_PERM_Info;
	permanent = TRUE;
	description = " Anything new? " ;
};


func int DIA_Brutus_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Brutus_PRISONERS) && (Chapter <  3 ) && (NpcObsessedByDMT_Brutus ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM_Info()
{
	AI_Output(other,self, " DIA_Brutus_PERM_15_00 " );	// Anything new?
	AI_Output(self,other, " DIA_Brutus_PERM_06_01 " );	// Everything is calm. There are no new prisoners - no one to help find the right words. It's a pity.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_Kasse (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Kasse_Condition;
	information = DIA_Brutus_Kasse_Info;
	permanent = FALSE;
	description = " Could you train me? " ;
};


func int DIA_Brutus_Kasse_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Brutus_PRISONERS) && (Chapter <  3 ) && (NpcObsessedByDMT_Brutus ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Brutus_Kasse_Info()
{
	AI_Output(other,self, " DIA_Brutus_Kasse_15_00 " );	// Could you train me?
	AI_Output(self,other, " DIA_Brutus_Kasse_06_01 " );	// Of course. I can help you get stronger, but it won't be free.
	AI_Output(other,self, " DIA_Brutus_Kasse_15_02 " );	// How much do you want?
	AI_Output(self,other, " DIA_Brutus_Kasse_06_03 " );	// Hmmm... you're running around the castle, right? Here's what I suggest.
	AI_Output(self,other, " DIA_Brutus_Kasse_06_04 " );	// My assistant, Den, slipped away during the last ork attack. Here's the scoundrel!
	AI_Output(self,other, " DIA_Brutus_Kasse_06_05 " );	// But he did not sneak away empty-handed. He took the contents of our cash register with him.
	AI_Output(other,self, " DIA_Brutus_Kasse_15_06 " );	// What are cash registers?
	AI_Output(self,other, " DIA_Brutus_Kasse_06_07 " );	// Well, we had a chest where we kept things that we... uh... collected all this time.
	AI_Output(self,other, " DIA_Brutus_Kasse_06_08 " );	// That was a decent amount! The chest contained two hundred gold coins, as well as valuable jewelry.
	AI_Output(self,other, " DIA_Brutus_Kasse_06_09 " );	// If you return this gold to me, you can keep the jewels. And then I'll be ready to teach you.
	Log_CreateTopic(TopicBrutusKasse,LOG_MISSION);
	Log_SetTopicStatus(TopicBrutusKasse,LOG_Running);
	B_LogEntry(TopicBrutusKasse, "Brutus ' partner Den escaped with 200 gold coins and some jewels. If I give him 200 gold coins back, he will help me become stronger. " );
};


instances DIA_Brutus_Den (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Den_Condition;
	information = DIA_Brutus_Den_Info;
	permanent = FALSE;
	description = " Do you know where this Den went? " ;
};


func int DIA_Brutus_Den_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Brutus_Box ) && ( Capital <  3 ) && ( NpcObsessedByDMT_Brutus ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Brutus_Den_Info()
{
	AI_Output(other,self, " DIA_Brutus_Den_15_00 " );	// Do you know where this Den went?
	AI_Output(self,other, " DIA_Brutus_Den_06_01 " );	// As far as possible from here, I understand. I think he might have tried to get through the Gap.
	AI_Output(other,self, " DIA_Brutus_Den_15_02 " );	// Thank you. Comprehensive information.
	AI_Output(self,other, " DIA_Brutus_Den_06_03 " );	// What else can I say? I have no idea where he went.
	B_LogEntry(TopicBrutusKasse, " Brutus doesn't know where Den went. " );
};


instances DIA_Brutus_Gold (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Gold_Condition;
	information = DIA_Brutus_Gold_Info;
	permanent = TRUE;
	description = " I have something for you. " ;
};


func int DIA_Brutus_Gold_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brutus_Kasse) && (NpcObsessedByDMT_Brutus == FALSE) && (Brutus_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Gold_Info()
{
	AI_Output(other,self, " DIA_Brutus_Gold_15_00 " );	// I have something for you.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other, " DIA_Brutus_Gold_06_01 " );	// Excellent. Now I can train you if you want.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC, " Brutus can help me get stronger. " );
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other, " DIA_Brutus_Gold_06_02 " );	// Look, just bring me two hundred coins. I don't care where you get them, as long as it's gold.
	};
};

instance DIA_Brutus_Baby(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Baby_Condition;
	information = DIA_Brutus_Baby_Info;
	important = TRUE;
};

func int DIA_Brutus_Baby_Condition()
{
	if((Kapitel < 3) && (Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Baby_Info()
{
	AI_Output(self,other,"DIA_Brutus_Baby_01_00");	//Постой!
	AI_Output(other,self, " DIA_Brutus_Baby_01_01 " );	// What else?
	AI_Output(self,other, " DIA_Brutus_Baby_01_02 " );	// Listen, I hesitated for a long time whether to ask you about it or not... (hesitantly) But, perhaps, I will ask.
	AI_Output(other,self,"DIA_Brutus_Baby_01_03");	//Слушаю.
	AI_Output(self,other, " DIA_Brutus_Baby_01_04 " );	// Looks like we're stuck here for a long time. You must have noticed that the castle is under siege by those damned orcs.
	AI_Output(other,self, " DIA_Brutus_Baby_01_05 " );	// No, I didn't notice something.
	AI_Output(self,other, " DIA_Brutus_Baby_01_06 " );	// Oh, stop it. Let me finish. So, we will have to hang around in this castle for a long time ...
	AI_Output(self,other, " DIA_Brutus_Baby_01_07 " );	// ...if we can get out of here at all - which I sometimes highly doubt.
	AI_Output(other,self, " DIA_Brutus_Baby_01_08 " );	// Can you talk to the point?
	AI_Output(self,other, " DIA_Brutus_Baby_01_09 " );	// Good, good! Calm down. Where did I stop there? ... Oh yes. I haven't been with a woman in a long time.
	AI_Output(self,other, " DIA_Brutus_Baby_01_10 " );	// And so I have a request. Well, not just me, to be exact - I'm asking on behalf of a lot of the guys here.
	AI_Output(other,self, " DIA_Brutus_Baby_01_11 " );	// And you want me to bring you a woman to the castle? Are you out of your mind?
	AI_Output(self,other, " DIA_Brutus_Baby_01_12 " );	// No, of course not! But Milten can certainly help us out.
	AI_Output(other,self, " DIA_Brutus_Baby_01_13 " );	// And what does Milten have to do with it?
	AI_Output(self,other, " DIA_Brutus_Baby_01_14 " );	// Well, he's a mage after all... and your friend. Maybe if you ask him to conjure a woman for us, he will listen to you.
	AI_Output(other,self, " DIA_Brutus_Baby_01_15 " );	// Think it's possible?
	AI_Output(self,other, " DIA_Brutus_Baby_01_16 " );	// I don't know. What's stopping you from checking it out? If everything works out, then believe me: you will not regret it. Well, what can you say?
	Info_ClearChoices(DIA_Brutus_Baby);
	Info_AddChoice(DIA_Brutus_Baby, " You're right. I'll ask him. " ,DIA_Brutus_Baby_Yes);
	Info_AddChoice(DIA_Brutus_Baby,"Нет.",DIA_Brutus_Baby_No);
};

func void DIA_Brutus_Baby_Yes()
{
	AI_Output(other,self, " DIA_Brutus_Baby_Yes_01_01 " );	// You're right. I'll ask him.
	AI_Output(self,other, " DIA_Brutus_Baby_Yes_01_02 " );	// Thanks mate. We believe in you!
	MIS_BrutusBaby = LOG_Running;
	Log_CreateTopic(TOPIC_BrutusBaby,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Running);
	B_LogEntry(TOPIC_BrutusBaby, " Brutus has asked me for an unusual favor. He and the other guys in the castle have spent quite a bit of time in it and would like to relax a little. Brutus wants me to ask Milten to conjure a woman here in the castle, or better two. I decided to help guys. " );
	AI_StopProcessInfos(self);
};

func void DIA_Brutus_Baby_No()
{
	AI_Output(other,self, " DIA_Brutus_Baby_No_01_01 " );	// No. What you are asking is just crazy nonsense. Milten makes me laugh.
	AI_Output(self,other, " DIA_Brutus_Baby_No_01_02 " );	// (angrily) If you don't want it, whatever you want. We'll have to manage somehow.
	AI_StopProcessInfos(self);
};

instance DIA_Brutus_Baby_Wait(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 101;
	condition = DIA_Brutus_Baby_Wait_Condition;
	information = DIA_Brutus_Baby_Wait_Info;
	permanent = FALSE;
	description = " About your request... " ;
};

func int DIA_Brutus_Baby_Wait_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Baby_Wait_Info()
{
	AI_Output(other,self, " DIA_Brutus_Baby_Wait_01_00 " );	// About your request...
	AI_Output(self,other, " DIA_Brutus_Baby_Wait_01_01 " );	// What? Has Milten conjured a woman for us yet? So fast?!
	AI_Output(other,self, " DIA_Brutus_Baby_Wait_01_02 " );	// Not yet. He needs some time for this. Look into his cell tomorrow evening.
	AI_Output(self,other, " DIA_Brutus_Baby_Wait_01_05 " );	// Great, mate! You have made us the happiest people in this castle.
	AI_Output(self,other, " DIA_Brutus_Baby_Wait_01_06 " );	// We will definitely come.
	BrutusBabyDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Brutus_Teach(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 7;
	condition = DIA_Brutus_Teach_Condition;
	information = DIA_Brutus_Teach_Info;
	permanent = TRUE;
	description = " I want to get stronger. " ;
};


func int DIA_Brutus_Teach_Condition()
{
	if((Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Teach_Info()
{
	AI_Output(other,self, " DIA_Brutus_Teach_15_00 " );	// I want to get stronger.
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_Back()
{
	Info_ClearChoices(DIA_Brutus_Teach);
};

func void DIA_Brutus_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Brutus_Teach_STR_5);
};


instance DIA_Brutus_KAP3_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP3_EXIT_Condition;
	information = DIA_Brutus_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_DUSCHONWIEDER (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 30;
	condition = DIA_Brutus_DUSCHONWIEDER_Condition;
	information = DIA_Brutus_DUSCHONWIEDER_Info;
	permanent = TRUE;
	description = " Tortured anyone today? " ;
};


func int DIA_Brutus_DUSCHONWIEDER_Condition()
{
	if ((Chapter ==  3 ) && (NpcObsessedByDMT_Brutus ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info()
{
	AI_Output(other,self, " DIA_Brutus_DUSCHONWIEDER_15_00 " );	// Tortured anyone today?
	AI_Output(self,other, " DIA_Brutus_DUSCHONWIEDER_06_01 " );	// Can't you see I'm busy?! Come in later.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_KAP4_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP4_EXIT_Condition;
	information = DIA_Brutus_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_WHYNOTWORK (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 40;
	condition = DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information = DIA_Brutus_WHYNOTWORK_Info;
	description = " Why aren't you working? " ;
};


func int DIA_Brutus_WARUMNICHTARBBEIT_Condition()
{
	if ((Chapter >=  4 ) && (NpcObsessedByDMT_Brutus ==  FALSE ) && (MY_OCGateOpen ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Brutus_WHYNOTWORK_Info()
{
	AI_Output(other,self, " DIA_Brutus_WARUMNICHTARBBEIT_15_00 " );	// Why aren't you working?
	AI_Output(self,other, " DIA_Brutus_WARUMNICHTARBBEIT_06_01 " );	// (sorry) This is terrible!
	AI_Output(self,other, " DIA_Brutus_WARUMNICHTARBBEIT_06_02 " );	// Have you looked into my room? Those dirty meat bugs are everywhere.
	AI_Output(self,other, " DIA_Brutus_WARUMNICHTARBBEIT_06_03 " );	// I don't know who lived there before, but my foot will not be in this dirty barn.
	AI_Output(self,other, " DIA_Brutus_WARUMNICHTARBBEIT_06_04 " );	// I hate these creatures. And stop laughing like an idiot.
	Log_CreateTopic(TOPIC_BrutusMeatbugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs,LOG_Running);
	B_LogEntry(TOPIC_BrutusMeatbugs, " Brutus, the castle's executioner, says the harmless meat bugs in his room give him goosebumps. He seemed such a tough guy to me. " );
};


instance DIA_Brutus_MEATBUGSWEG(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 31;
	condition = DIA_Brutus_MEATBUGSWEG_Condition;
	information = DIA_Brutus_MEATBUGSWEG_Info;
	description = " Bug bugs are done with. " ;
};


func int DIA_Brutus_MEATBUGSWEG_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Brutus_WARUMNICHTARBBEIT) && Npc_IsDead(Meatbug_Brutus1) && Npc_IsDead(Meatbug_Brutus2) && Npc_IsDead(Meatbug_Brutus3) && Npc_IsDead(Meatbug_Brutus4) && (Kapitel >=  4 ) && (NpcObsessedByDMT_Brutus ==  FALSE ) && ( MIS_OpenGate ==  FALSE
	{
		return TRUE;
	};
};

func void DIA_Brutus_MEATBUGSWEG_Info()
{
	B_GivePlayerXP(XP_BrutusMeatbugs);
	AI_Output(other,self, " DIA_Brutus_MEATBUGSWEG_15_00 " );	// No more meat bugs. You can keep polishing your torture instruments or whatever you were doing.
	AI_Output(self,other, " DIA_Brutus_MEATBUGSWEG_06_01 " );	// Are you really sure none of those monsters are left?
	AI_Output(other,self, " DIA_Brutus_MEATBUGSWEG_15_02 " );	// Absolutely.
	AI_Output(self,other, " DIA_Brutus_MEATBUGSWEG_06_03 " );	// Good. Here, take this gold as a token of my gratitude.
	B_GiveInvItems(self,other,ItMi_Gold,150);
	AI_Output(other,self, " DIA_Brutus_MEATBUGSWEG_15_04 " );	// Ah, don't make me cry.
	TOPIC_END_BrutusMeatbugs = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_NpcClearObsessionByDMT(self);
};


instances DIA_Brutus_PERM4 (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 32;
	condition = DIA_Brutus_PERM4_Condition;
	information = DIA_Brutus_PERM4_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Brutus_PERM4_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Brutus_MEATBUGSWEG) || (MIS_OCGateOpen == TRUE)) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM4_Info()
{
	if ((MIS_OCGateOpen ==  TRUE ) || ((hero.guild ==  GIL_KDF ) && (Chapter >=  5 )))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Brutus_PERM4_15_00 " );	// Is everything okay?
		AI_Output(self,other, " DIA_Brutus_PERM4_06_01 " );	// (hesitantly) Are you sure you're done with all the meat bugs?
		AI_Output(other,self, " DIA_Brutus_PERM4_15_02 " );	// Ah... look, there's one behind you.
		AI_Output(self,other, " DIA_Brutus_PERM4_06_03 " );	// (roar) What?
		self.aivar[ AIV_INVINCIBLE ] = FALSE ;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Flee,0,"");
	};
};


instance DIA_Brutus_BESSEN (C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 55;
	condition = DIA_Brutus_BESSEN_Condition;
	information = DIA_Brutus_BESSEN_Info;
	permanent = TRUE;
	description = " You're obsessed! " ;
};


func int DIA_Brutus_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Brutus == TRUE) && (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_BESSEN_Info()
{
	AI_Output(other,self, " DIA_Brutus_BESSEN_15_00 " );	// Yes, you are obsessed!

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDW))
	{
		AI_Output(other,self, " DIA_Brutus_BESSEN_15_01 " );	// Go to the monastery, have them heal you.
		AI_Output(self,other, " DIA_Brutus_BESSEN_06_02 " );	// No one can help me. Get out!
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Brutus_BESSEN_15_03 " );	// Someone needs to knock the demons out of your head.
		AI_Output(self,other, " DIA_Brutus_BESSEN_06_04 " );	// (yells) NO!
		self.aivar[ AIV_INVINCIBLE ] = FALSE ;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StopProcessInfos(self);
		B_NpcClearObsessionByDMT(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_xardasritual_xardas,0,"");
	};
};


instance DIA_Brutus_KAP5_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_KAP5_EXIT_Condition;
	information = DIA_Brutus_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_KAP5_EXIT_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_PICKPOCKET(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 900;
	condition = DIA_Brutus_PICKPOCKET_Condition;
	information = DIA_Brutus_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Brutus_PICKPOCKET_Condition()
{
	return  C_Robbery ( 14 , 35 );
};

func void DIA_Brutus_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
	Info_AddChoice(DIA_Brutus_PICKPOCKET,Dialog_Back,DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brutus_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};

func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};
