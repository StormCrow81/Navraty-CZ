
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hello (C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other, " DIA_Dexter_Hallo_09_00 " );	// Look who's here. The great liberator. Well, hero, what are you doing here?
	AI_Output(other,self, " DIA_Dexter_Hallo_15_01 " );	// I want answers to a few questions.
	if(Ranger_SCKnowsDexter == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Dexter_Hallo_09_00 " );	// I didn't expect you to come here voluntarily.
		AI_Output(other,self, " DIA_Addon_Dexter_Hallo_15_01 " );	// What do you mean?
		AI_Output(self,other, " DIA_Addon_Dexter_Hallo_09_02 " );	// I mean, I was looking for you. Haven't you come across my wanted ads?
		AI_Output(self,other, " DIA_Addon_Dexter_Hallo_09_03 " );	// They show your face. Yes, they are looking for you. Didn't you know?
		B_LogEntry(Topic_Bandits, " I found someone who was handing out wanted posters with my picture to the bandits. It was Dexter, an old friend of mine from the Old Camp in the Mine Valley. " );
		Log_SetTopicStatus(Topic_Bandits,LOG_SUCCESS);
		MIS_profiles = LOG_SUCCESS ;
		B_GivePlayerXP(200);
	}
	else
	{
		AI_Output(other,self, " DIA_Dexter_Hallo_15_02 " );	// Someone is distributing slips of paper with my picture on them. Someone told me it was you.
		AI_Output(self,other, " DIA_Dexter_Hallo_09_03 " );	// Someone talks too much.
		AI_Output(self,other, " DIA_Addon_Dexter_Hallo_09_04 " );	// However, you're right. I distributed wanted notices. I was looking for you - and you appeared.
		B_LogEntry(Topic_Bandits, " I found someone who was handing out wanted posters with my picture to the bandits. It was Dexter, an old friend of mine from the Old Camp in the Mine Valley. " );
		Log_SetTopicStatus(Topic_Bandits,LOG_SUCCESS);
		MIS_profiles = LOG_SUCCESS ;
		B_GivePlayerXP(100);
	};
	AI_Output(other,self, " DIA_Addon_Dexter_Hallo_15_05 " );	// So what do you want from me?
	AI_Output(self,other, " DIA_Addon_Dexter_Hallo_09_06 " );	// Me? Absolutely nothing. But my master is just hell-bent on your death.
	AI_Output(self,other, " DIA_Addon_Dexter_Hallo_09_07 " );	// That's why he ordered me to find you and deliver your head to him.
	DEXTERSAYABOUTKILL = TRUE;
};

instance DIA_Dexter_Glaube (C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Belief_Info;
	permanent = FALSE;
	description = " I don't believe a word you say. " ;
};

func int DIA_Dexter_Belief_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Belief_Info()
{
	AI_Output(other,self, " DIA_Dexter_Glaube_15_00 " );	// I don't believe a single word you say.
	AI_Output(self,other, " DIA_Dexter_Glaube_09_01 " );	// Look, it's all true. I swear on my mother's grave!
};


instance DIA_Addon_Dexter_Patrick(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_Patrick_Condition;
	information = DIA_Addon_Dexter_Patrick_Info;
	description = " Have you been visited by a mercenary named Patrick? " ;
};


func int DIA_Addon_Dexter_Patrick_Condition()
{
	if((MIS_Addon_Cord_Look4Patrick == LOG_Running) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other,self, " DIA_Addon_Dexter_Patrick_15_00 " );	// Did a mercenary named Patrick visit you?
	AI_Output(self,other, " DIA_Addon_Dexter_Patrick_09_01 " );	// Patrick? I don't know what you're talking about.
	AI_Output(self,other, " DIA_Addon_Dexter_Patrick_09_02 " );	// I remember some noisy mercenary who appeared here and chatted with the guys.
	AI_Output(self,other, " DIA_Addon_Dexter_Patrick_09_03 " );	// But I haven't seen him for gods know how long.
	AI_Output(self,other, " DIA_Addon_Dexter_Patrick_09_04 " );	// Maybe he ran into trouble after all. I don't know.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople, " Dexter claims he doesn't know the mercenary Patrick. " );
	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};

instance DIA_Addon_Dexter_Greg(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_Greg_Condition;
	information = DIA_Addon_Dexter_Greg_Info;
	description = "The man with the eyepatch is looking for you! " ;
};

func int DIA_Addon_Dexter_Greg_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other,self, " DIA_Addon_Dexter_Greg_15_00 " );	// The man with the eyepatch is looking for you!
	AI_Output(self,other, " DIA_Addon_Dexter_Greg_09_01 " );	// Everyone is looking for me. But that's their business.
	AI_Output(self,other, " DIA_Addon_Dexter_Greg_09_02 " );	// If this person has something to say to me, then let him come here.
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Addon_Dexter_WulfgarSend(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_WulfgarSend_Condition;
	information = DIA_Addon_Dexter_WulfgarSend_Info;
	permanent = FALSE;
	description = " Do you have your own man in the militia? " ;
};

func int DIA_Addon_Dexter_WulfgarSend_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (WulfgarSendDexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_WulfgarSend_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_Dexter_WulfgarSend_01_00 " );	// Do you have your own man in the militia?
	AI_Output(self,other, " DIA_Addon_Dexter_WulfgarSend_01_01 " );	// Maybe. And what do you care about that?
	AI_Output(other,self, " DIA_Addon_Dexter_WulfgarSend_01_02 " );	// I just need to know his name.
	AI_Output(self,other, " DIA_Addon_Dexter_WulfgarSend_01_03 " );	// Well, aren't you insolent!
	AI_Output(self,other, " DIA_Addon_Dexter_WulfgarSend_01_04 " );	// Just like that, you come to me and ask me to hand over my own hireling?
	AI_Output(self,other, " DIA_Addon_Dexter_WulfgarSend_01_05 " );	// But I will tell you this...
	AI_Output(self,other, " DIA_Addon_Dexter_WulfgarSend_01_06 " );	// If you dare to ask me such a question again, I will cut out your tongue. Understood?!
};

instance DIA_Addon_Dexter_missingPeople(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_missingPeople_Condition;
	information = DIA_Addon_Dexter_missingPeople_Info;
	description = " You're kidnapping the people of Khorinis! " ;
};


func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if((SC_KnowsDexterAsKidnapper == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Dexter_missingPeople_15_00 " );	// You're kidnapping the people of Khorinis!
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_09_01 " );	// So you figured it out. Good job, buddy.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_09_02 " );	// And I thought I'd reliably covered all traces.
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, " Who's giving you orders? " ,DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, " Where do the kidnapped people go? Do they work in the mines around here? " ,DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other,self, " DIA_Addon_Dexter_missingPeople_Wo_15_00 " );	// Where do yhe kidnapped people go? Do they work in the mines around here?
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Wo_09_01 " );	// No, no, they're far to the northeast. You can't get there.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Wo_09_02 " );	// I could show you exactly where, but I really don't want to.
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other,self, " DIA_Addon_Dexter_missingPeople_wer_15_00 " );	// Who gives you orders?
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_wer_09_01 " );	// A very dangerous man. You know him. He is Raven, one of the former ore barons from the Valley of Mines.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_wer_09_02 " );	// He needs these people to carry out his plans. That's all you need to know.
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, " Is the raven dangerous? " ,DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, " Is the Ore Baron here in Khorinis? " ,DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other,self, " DIA_Addon_Dexter_missingPeople_Raven_15_00 " );	// Is the raven dangerous? 
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Raven_09_01 " );	// What do you know? You don't know him like I do.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Raven_09_02 " );	// He really was a pathetic pig back then, but now...
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Raven_09_03 " );	// After the fall of the Barrier, he has changed. A black shadow fell over him.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Raven_09_04 " );	// If you look into his eyes too long, his gaze will pierce you like the claws of a predator.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Raven_09_05 " );	// I'll give you one piece of advice. Escape from Khorinis. Run before it's too late.
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_Raven_09_06 " );	// Only certain death awaits you here.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, " Dexter has an owner, Raven, a former ore baron. It looks like he's behind all these kidnappings. Now I just need to get proof of this. " );
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other,self, " DIA_Addon_Dexter_missingPeople_RavenTot_15_00 " );	// Is this ore baron here in Khorinis?
	AI_Output(self,other, " DIA_Addon_Dexter_missingPeople_RavenTot_09_01 " );	// He is no longer an ore baron. He has his own plans, and soon Khorinis will fall at his feet.
};


instance DIA_Addon_Dexter_Boss(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = DIA_Addon_Dexter_Boss_Condition;
	information = DIA_Addon_Dexter_Boss_Info;
	description = " Your master? Who is this? " ;
};


func int DIA_Addon_Dexter_Boss_Condition()
{
	if((Knows_Dexter == TRUE) && (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other,self, " DIA_Addon_Dexter_Boss_15_00 " );	// Your master? Who is that?
	AI_Output(self,other, " DIA_Addon_Dexter_Boss_09_01 " );	// Are you sure you're itching to find out?
	AI_Output(self,other, " DIA_Addon_Dexter_Boss_09_02 " );	// I don't see any reason why I should tell you anything.
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = " What are you going to do now? Kill me? " ;
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self, " DIA_Dexter_Vor_15_00 " );	// And what are you going to do now? Kill me?
	AI_Output(self,other, " DIA_Dexter_Vor_09_01 " );	// I could. But you freed us all. That's why I'm giving you one more chance. Vanish - disappear, become invisible. Get out and don't get in my way again.
	AI_Output(other,self, " DIA_Addon_Dexter_Vor_15_00 " );	// I need to find out where you sent those people.
	AI_Output(self,other, " DIA_Addon_Dexter_Vor_09_01 " );	// (laughs) You could try to force me to speak...
	AI_Output(self,other, " DIA_Addon_Dexter_Vor_09_02 " );	// This is your last chance.
	AI_Output(self,other, " DIA_Dexter_Vor_09_02 " );	// If I see you again, I won't hesitate to kill you!
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Dexter_NoMoreSmallTalk == TRUE) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Dexter_Add_09_02 " );	// You asked for it...
	}
	else
	{
		AI_Output(self,other, " DIA_Dexter_Kill_09_01 " );	// Oh, you shouldn't have shown yourself here. Wrong time, wrong place my friend.
	};
	MIS_profiles = LOG_OBSOLETE ;
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill,Dialog_End,DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	var C_Item itm;
	AI_StopProcessInfos(self);
	DexterNoLoyalMore = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(item,ITAR_PIR_N_Addon) ==  FALSE )
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_N_Addon);
	};
};


instance DIA_Dexter_Head (C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Head_Info;
	permanent = FALSE;
	description = " Do you want my head? Well, try to take it! " ;
};


func int DIA_Dexter_Kopf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Head_Info()
{
	AI_Output(other,self, " DIA_Addon_Dexter_Add_15_00 " );	// Do you want my head? Well, try to take it!
	AI_Output(self,other, " DIA_Addon_Dexter_Add_09_01 " );	// Well, if that's what you want...
	DIA_Dexter_Kill_END();
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return  C_Robbery ( 96 , 370 );
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};
