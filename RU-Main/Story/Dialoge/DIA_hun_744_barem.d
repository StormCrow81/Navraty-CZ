

instance DIA_HUN_744_BAREM_EXIT(C_Info)
{
	npc = hun_744_barem;
	nr = 999;
	condition = dia_hun_744_barem_exit_condition;
	information = dia_hun_744_barem_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_744_barem_exit_condition()
{
	return TRUE;
};

func void dia_hun_744_barem_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_744_BAREM_WELCOME (C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_welcome_condition;
	information = dia_hun_744_barem_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_744_barem_welcome_condition()
{
	if (( HEROISHUNTER  ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_welcome_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Welcome_01_01 " );	// Hey man! Looks like you're a hunter too.
		AI_Output(self,other, " DIA_HUN_744_Barem_Welcome_01_04 " );	// This is where the hunter's camp is located.
		AI_Output(self,other, " DIA_HUN_744_Barem_Welcome_01_06 " );	// I'll give you a piece of advice: first, talk to Falk, he's the head hunter here!
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Welcome_01_09 " );	// Stop! Stop.
		AI_Output(self,other, " DIA_HUN_744_Barem_Welcome_01_13 " );	// This is where the hunter's camp is located. Do you understand?
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_744_BAREM_WELCOMEDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_welcomedone_condition;
	information = dia_hun_744_barem_welcomedone_info;
	permanent = FALSE;
	description = " Now I'm with you. " ;
};


func int dia_hun_744_barem_welcomedone_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_welcomedone_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_WelcomeDone_01_00 " );	// Now I'm with you.
	AI_Output(self,other, " DIA_HUN_744_Barem_WelcomeDone_01_01 " );	// Great, man! I knew you'd like it at our camp.
};


instance DIA_HUN_744_BAREM_HELLO (C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_hello_condition;
	information = dia_hun_744_barem_hello_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_hun_744_barem_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_hello_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_Hello_01_00 " );	// How are you?
	if ((Capital >=  2 ) && ( MY_INSVEPR  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_01 " );	// Everything is fine. By the way, have you heard the news?
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_03 " );	// Not far from the circle of stones in the western forest, a real boar has appeared! Have you ever seen such a monster?
		AI_Output(other,self, " DIA_HUN_744_Barem_Hello_01_04 " );	// No, I didn't.
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_06 " );	// The boar is one hell of a dangerous animal. And you can't even imagine how much!
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_07 " );	// He'll easily tear you to shreds if you try to get in his way.
		MIS_INSVEPR = LOG_Running;
		Log_CreateTopic(TOPIC_INSVEPR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSVEPR,LOG_Running);
		B_LogEntry( TOPIC_INSVEPR , " Barem says that a real boar has appeared near the stone circle in the western forest. According to him, these animals are extremely dangerous. I wonder what Barem will say if I can kill this creature? " );
		Wld_InsertNpc(keiler_vepr, " FP_ROAM_NW_HUNTVEPR_01 " );
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_11 " );	// These guys in black cassocks give me goosebumps.
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_12 " );	// They walk around here all the time, sniffing out something... (nervously) I don't like all this!
	}
	else  if (chapter ==  6 )
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_13 " );	// How, how. Don't you see yourself? There are a lot of orcs around!
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_14 " );	// And why so many of them?
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_15 " );	// As usual. Peace and quiet.
		AI_Output(self,other, " DIA_HUN_744_Barem_Hello_01_16 " );	// And what else does a tired hunter need to relax after a long journey?
	};
};


instance DIA_HUN_744_BAREM_INSVEPR (C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_insvepr_condition;
	info = dia_hun_744_barem_insvepr_info;
	permanent = FALSE;
	description = " I killed that boar! " ;
};


func int dia_hun_744_barem_insvepr_condition()
{
	if (( MIS_INSVEPR  == LOG_Running) && Npc_IsDead(keiler_vepr) && (Npc_HasItems(other,itat_veprfur) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_insvepr_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_HUN_744_Barem_InsVepr_01_00 " );	// I killed that boar!
	AI_Output(self,other, " DIA_HUN_744_Barem_InsVepr_01_01 " );	// Are you serious? Did you really succeed?
	AI_Output(other,self, " DIA_HUN_744_Barem_InsVepr_01_02 " );	// Here is his skin, look.
	B_GiveInvItems(other,self,itat_veprfur,1);
	Npc_RemoveInvItems(self,itat_veprfur,1);
	AI_Output(self,other, " DIA_HUN_744_Barem_InsVepr_01_03 " );	// And you know how to surprise!
	AI_Output(self,other, " DIA_HUN_744_Barem_InsVepr_01_04 " );	// After all, in our camp no one has ever killed this creature.
	AI_Output(self,other, " DIA_HUN_744_Barem_InsVepr_01_05 " );	// Yeah, I'll remember this moment for the rest of my life!
	AI_Output(self,other, " DIA_HUN_744_Barem_InsVepr_01_06 " );	// And so that you don't forget about it too - here, take this ring as a keepsake. And the skin will remain with me!
	B_GiveInvItems(self,other,itri_vepr,1);
	MIS_INSVEPR = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_INSVEPR,LOG_SUCCESS);
	B_LogEntry( TOPIC_INSVEPR , " My story made a lasting impression on Barem. He simply could not believe that I was done with a terrible boar. In exchange for a boar skin, he gave me a ring that will remind me of this incident. " );
};


instance DIA_HUN_744_BAREM_RESPECT (C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_respect_condition;
	information = dia_hun_744_barem_respect_info;
	permanent = FALSE;
	description = " I need your vote. " ;
};


func int dia_hun_744_barem_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( BAREM_RESPECT  ==  FALSE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_respect_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_Respect_01_00 " );	// I need your vote.
	AI_Output(self,other, " DIA_HUN_744_Barem_Respect_01_01 " );	// Why else?
	AI_Output(other,self, " DIA_HUN_744_Barem_Respect_01_02 " );	// I want to compete with Falk for the title of the best hunter in the camp.
	if(MIS_INSVEPR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_744_Barem_Respect_01_03 " );	// No problem, boy!
		AI_Output(self,other, " DIA_HUN_744_Barem_Respect_01_04 " );	// The hunter who was able to deal with a wild boar alone is worthy of respect.
		AI_Output(self,other, " DIA_HUN_744_Barem_Respect_01_05 " );	// So you can rely on me. I will cast my vote for you.
		B_LogEntry( TOPIC_HUNTERSWORK , " Barem doesn't mind my idea of ​​challenging Falk. " );
		BAREM_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_Respect_01_07 " );	// Man, you haven't done anything yet to earn that right!
		AI_Output(self,other, " DIA_HUN_744_Barem_Respect_01_09 " );	// First, show yourself to be a good hunter, and then I will cast my vote for you.
	};
};


instance DIA_HUN_744_BAREM_RESPECTDONE (C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_respectdone_condition;
	information = dia_hun_744_barem_respectdone_info;
	permanent = TRUE;
	description = " Will you cast your vote for me? " ;
};


func int dia_hun_744_barem_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_time_744_bare_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( BAREM_RESPECT  ==  FALSE ) && ( MIS_HUNTERCHALLANGE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_respectdone_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_RespectDone_01_00 " );	// Will you cast your vote for me?
	if(MIS_INSVEPR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_744_Barem_RespectDone_01_01 " );	// No problem, man!
		AI_Output(self,other, " DIA_HUN_744_Barem_RespectDone_01_02 " );	// The hunter who was able to deal with a wild boar alone is worthy of respect.
		AI_Output(self,other, " DIA_HUN_744_Barem_RespectDone_01_03 " );	// So you can completely rely on me. I will cast my vote for you.
		B_LogEntry( TOPIC_HUNTERSWORK , " Barem doesn't mind my idea of ​​challenging Falk. " );
		BAREM_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_744_Barem_RespectDone_01_05 " );	// Have you already proved that you are a good hunter?
		AI_Output(other,self, " DIA_HUN_744_Barem_RespectDone_01_06 " );	// Not yet.
		AI_Output(self,other, " DIA_HUN_744_Barem_RespectDone_01_07 " );	// Then you know my answer.
	};
};


instance DIA_HUN_744_BAREM_LURKERCLAW (C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_lurkerclaw_condition;
	information = dia_hun_744_barem_lurkerclaw_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_744_barem_lurkerclaw_condition()
{
	if ((Capital >=  1 ) && ( HEROISHUNTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_lurkerclaw_info()
{
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_00 " );	// Hey buddy! Wait a minute.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_01 " );	// I have a very interesting offer for you.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_03 " );	// You see, one merchant made me an order for five sting claws.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_04 " );	// But I don't have time to go out and hunt these beasts.
	AI_Output(other,self, " DIA_HUN_744_Barem_LurkerClaw_01_05 " );	// And you want me to bring you those claws?
	AI_Output(other,self, " DIA_HUN_744_Barem_LurkerClaw_01_07 " );	// What do I get out of this?
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_08 " );	// Well... unfortunately, I can't pay you for this job. I just desperately need gold myself.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_09 " );	// But I can give you some crawler shells for those claws.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_10 " );	// By the way, I heard that one of the mercenaries at Onar's farm can make armor out of them.
	AI_Output(other,self, " DIA_HUN_744_Barem_LurkerClaw_01_13 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClaw_01_14 " );	// That's great! Then, if anything, you know where to find me.
	MIS_LURKERCLAW = LOG_Running;
	Log_CreateTopic(TOPIC_LURKERCLAW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LURKERCLAW,LOG_Running);
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
};


instance DIA_HUN_744_BAREM_LURKERCLAWDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_lurkerclawdone_condition;
	information = dia_hun_744_barem_lurkerclawdone_info;
	permanent = FALSE;
	description = " I brought you the claws of the schnygs. " ;
};


func int dia_hun_744_barem_lurkerclawdone_condition()
{
	if((MIS_LURKERCLAW == LOG_Running) && (Npc_HasItems(other,ItAt_LurkerClaw) >= 5))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_lurkerclawdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_744_Barem_LurkerClawDone_01_00 " );	// I brought you the claws of the sniffs.
	B_GiveInvItems(other,self,ItAt_LurkerClaw,5);
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClawDone_01_03 " );	// Great job, kid!
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClawDone_01_04 " );	// And here are your crawler shells - as agreed.
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,3);
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClawDone_01_05 " );	// And by the way, I remembered the name of that mercenary who makes armor out of them.
	AI_Output(self,other, " DIA_HUN_744_Barem_LurkerClawDone_01_07 " );	// His name is Wolf. Talk to him - maybe he'll make one for you too.
	MIS_LURKERCLAW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LURKERCLAW,LOG_SUCCESS);
	B_LogEntry( TOPIC_LURKERCLAW , " I brought Barem sling claws. He also told me that Wolf the mercenary could make armor from slither shells. " );
	Wolf_ProduceCrawlerArmor = TRUE;
	HOKURN_ARMOR = TRUE;
};


instance DIA_HUN_744_BAREM_CRAWLERARMOR (C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_crawlerarmor_condition;
	information = dia_hun_744_barem_crawlerarmor_info;
	permanent = FALSE;
	description = " Why don't you make your own armor like this? " ;
};


func int dia_hun_744_barem_crawlerarmor_condition()
{
	if(MIS_LURKERCLAW == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_crawlerarmor_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_CrawlerArmor_01_00 " );	// Why don't you make this armor for yourself?
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_01 " );	// I don't have enough of these creatures' shells.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_03 " );	// And I can't leave camp to hunt them now!
	AI_Output(other,self, " DIA_HUN_744_Barem_CrawlerArmor_01_06 " );	// Maybe I can help you?
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_07 " );	// Man, that would be great!
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_08 " );	// If you can really get this armor for me, I won't be indebted!
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_10 " );	// Here, take this - here are all the crawler shells that I have left.
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,4);
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_13 " );	// By the way, I also heard that if such armor is made from those shells that you got yourself, then they are much better than ordinary ones.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmor_01_14 " );	// I don't know if this is true or not. But anything is possible.
	MIS_BAREMCRAWLERARMOR = LOG_Running;
	Log_CreateTopic(TOPIC_BAREMCRAWLERARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BAREMCRAWLERARMOR,LOG_Running);
	B_LogEntry( TOPIC_BAREMCRAWLERARMOR , " I decided to help Barem get him armor from crawler plates. I also heard an unusual rumor from him: if you make such armor from shells that you got yourself, then they will turn out stronger than usual. You should ask the mercenary Wolf or anyone else. " );
};


instance DIA_HUN_744_BAREM_CRAWLERARMORDONE (C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_crawlerarmordone_condition;
	information = dia_hun_744_barem_crawlerarmordone_info;
	permanent = FALSE;
	description = " I have crawler shell armor for you. " ;
};

func int dia_hun_744_barem_crawlerarmordone_condition()
{
	if((MIS_BAREMCRAWLERARMOR == LOG_Running) && (Npc_HasItems(other,ITAR_DJG_Crawler) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_crawlerarmordone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_744_Barem_CrawlerArmorDone_01_00 " );	// I have crawler shell armor for you.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_01 " );	// (enthusiastic) Really?
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_03 " );	// Wow! Yeah, that's just great armor, mate. Thank you!
	AI_EquipBestArmor(self);
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_04 " );	// Here, take this warm sheepskin as my thanks for your help.
	B_GiveInvItems(self,other,itmi_sleepsack,1);
	AI_Output(other,self, " DIA_HUN_744_Barem_CrawlerArmorDone_01_05 " );	// M-yes. And what should I do with her?
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_06 " );	// I know what you're thinking...(sarcastically) But this thing is not as simple as it seems at first glance.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_07 " );	// And for a hunter, this is generally an irreplaceable thing!
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_09 " );	// You may have already noticed that she has an unusual dressing.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_10 " );	// This skin is sewn into a sleeping bag, and with it you can spend the night wherever you want.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_11 " );	// Trust me, it will keep you warm at night like a warm bed.
	AI_Output(self,other, " DIA_HUN_744_Barem_CrawlerArmorDone_01_13 " );	// She's very rare! You won't get one like this anywhere else.
	MIS_BAREMCRAWLERARMOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BAREMCRAWLERARMOR,LOG_SUCCESS);
	B_LogEntry( TOPIC_BAREMCRAWLERARMOR , " I brought Barem a piece of crawler shell armor. For my help, he gave me a warm sheepskin sewn into a sleeping bag. " );
};

instances DIA_HUN_744_BAREM_PICKPOCKET (C_Info)
{
	npc = hun_744_barem;
	nr = 900;
	condition = dia_hun_744_barem_pickpocket_condition;
	information = dia_hun_744_barem_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_hun_744_barem_pickpocket_condition()
{
	return  C_Robbery ( 70 , 120 );
};

func void dia_hun_744_barem_pickpocket_info()
{
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
	Info_AddChoice(dia_hun_744_barem_pickpocket,Dialog_Back,dia_hun_744_barem_pickpocket_back);
	Info_AddChoice(dia_hun_744_barem_pickpocket, DIALOG_PICKPOCKET ,dia_hun_744_barem_pickpocket_doit);
};

func void dia_hun_744_barem_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
};

func void dia_hun_744_barem_pickpocket_back()
{
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
};


instance DIA_HUN_744_BAREM_F (C_Info)
{
	npc = hun_744_barem;
	nr = 2;
	condition = dia_hun_744_barem_f_condition;
	information = dia_hun_744_barem_f_info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int dia_hun_744_barem_f_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_f_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_F_01_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_HUN_744_Barem_F_01_01 " );	// Yes, but not for fun!
	AI_Output(self,other, " DIA_HUN_744_Barem_F_01_02 " );	// If you want me to teach you, you'll have to pay.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTEACHERS , " Hunter Barem can teach me how to use one-handed weapons. " );
};


instance DIA_HUN_744_BAREM_1H (C_Info)
{
	npc = hun_744_barem;
	nr = 3;
	condition = dia_hun_744_barem_1h_condition;
	information = dia_hun_744_barem_1h_info;
	permanent = TRUE;
	description = " I'd like to practice with one-handed weapons. " ;
};


func int dia_hun_744_barem_1h_condition()
{
	if ( Npc_KnowsInfo ( other , their_time_744_enough_f ))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_1h_info()
{
	AI_Output(other,self, " DIA_HUN_744_Barem_1H_01_00 " );	// I'd like to practice with one-handed weapons.
	Info_ClearChoices(dia_hun_744_barem_1h);
	Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
	Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
	Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
};

func void dia_hun_744_barem_1h_back()
{
	Info_ClearChoices(dia_hun_744_barem_1h);
};

func void dia_hun_744_barem_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
	{
		if(BAREMTEACHFT == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_01 " );	// Good idea! But before you get into technique, you need to learn how to properly hold a weapon.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_02 " );	// Beginners often hold the handle with both hands. It's wrong, it's better not to get used to it.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_03 " );	// Grasp the handle with one hand. Blade up, and don't keep it still.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_04 " );	// The weapon should become an extension of your hand, fit into your movements. This will help speed up the attack.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_05 " );	// If you remember everything I told you about, your punches will become more graceful and faster.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_06 " );	// Yes, and one more thing: some attacks are more effective than others. There are not many chances for a beginner to complete them.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_07 " );	// But the more you practice, the better you'll get at them.
			BAREMTEACHFT = TRUE;
		};
		if((BAREMTEACHST == FALSE) && (other.HitChance[NPC_TALENT_1H] >= 60))
		{
			AI_Output(other,self, " DIA_HUN_744_Barem_1H_1_01_08 " );	// Tell me more about one-handed weapons.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_09 " );	// Okay, you already know the main thing. If you hold the blade a little lower, the first blow will be more powerful.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_10 " );	// Slash, remember? Okay, now about how to move. Land two hits and turn around - the enemy will surely be confused, and you will find yourself in an advantageous position.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_11 " );	// Another swing of the blade from right to left...
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_1_01_12 " );	// ...and return to the original stance. Most importantly, don't forget to exercise. Go get your technique.
			BAREMTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_744_barem_1h);
		Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
	};
};

func void dia_hun_744_barem_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
	{
		if(BAREMTEACHFT == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_01 " );	// Good idea! But before you get into technique, you need to learn how to properly hold a weapon.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_02 " );	// Beginners often hold the handle with both hands. It's wrong, it's better not to get used to it.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_03 " );	// Grasp the handle with one hand. Blade up, and don't keep it still.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_04 " );	// The weapon should become an extension of your hand, fit into your movements. This will help speed up the attack.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_05 " );	// If you remember everything I told you about, your punches will become more graceful and faster.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_06 " );	// Yes, and one more thing: some attacks are more effective than others. There are not many chances for a beginner to complete them.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_07 " );	// But the more you practice, the better you'll get at them.
			BAREMTEACHFT = TRUE;
		};
		if((BAREMTEACHST == FALSE) && (other.HitChance[NPC_TALENT_1H] >= 60))
		{
			AI_Output(other,self, " DIA_HUN_744_Barem_1H_5_01_08 " );	// Tell me more about one-handed weapons.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_09 " );	// Okay, you already know the main thing. If you hold the blade a little lower, the first blow will be more powerful.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_10 " );	// Slash, remember? Okay, now about how to move. Land two hits and turn around - the enemy will surely be confused, and you will find yourself in an advantageous position.
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_11 " );	// Another swing of the blade from right to left...
			AI_Output(self,other, " DIA_HUN_744_Barem_1H_5_01_12 " );	// ...and return to the original stance. Most importantly, don't forget to exercise. Go get your technique.
			BAREMTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_744_barem_1h);
		Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
	};
};

