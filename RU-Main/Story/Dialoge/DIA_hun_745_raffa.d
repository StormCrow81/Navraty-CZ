

instance DIA_HUN_745_RAFFA_EXIT (C_Info)
{
	npc = hun_745_raffa;
	nr = 999;
	condition = dia_hun_745_raffa_exit_condition;
	information = dia_hun_745_raffa_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_745_raffa_exit_condition()
{
	return TRUE;
};

func void dia_hun_745_raffa_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_745_RAFFA_R (C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_r_condition;
	information = dia_hun_745_raffa_r_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_hun_745_raffa_r_condition()
{
	if(HEROISHUNTER == FALSE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_r_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(other,self,"DIA_HUN_745_R_01_00");	//Кто ты?
		AI_Output(self,other, " DIA_HUN_745_R_01_01 " );	// My name is Raffa.
		AI_Output(other, self, " DIA_HUN_745_R_01_02 " );	// Are you a hunter too?
		AI_Output(self,other,"DIA_HUN_745_R_01_03");	//Да.
		AI_Output(other, self, " DIA_HUN_745_R_01_04 " );	// You're not very talkative, are you?
		AI_Output(self,other, " DIA_HUN_745_R_01_05 " );	// I don't like to just talk around.
		AI_Output(self,other, " DIA_HUN_745_R_01_06 " );	// So you'd better go to Falk. He will say more than me!
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_745_R_01_07");	//Кто ты?
		AI_Output(self,other, " DIA_HUN_745_R_01_08 " );	// What do you care who I am?
		AI_Output(other, self, " DIA_HUN_745_R_01_09 " );	// Are you a hunter too?
		AI_Output(self,other, " DIA_HUN_745_R_01_10 " );	// This doesn't concern you.
		AI_Output(other, self, " DIA_HUN_745_R_01_12 " );	// You're not very talkative, are you?
		AI_Output(self,other,"DIA_HUN_745_R_01_13");	//Да.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_745_RAFFA_GREET (C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_greet_condition;
	information = dia_time_745_sleep_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_745_raffa_greet_condition()
{
	if((HEROISHUNTER == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_greet_info()
{
	AI_Output(self,other, " DIA_HUN_745_Greet_01_00 " );	// Hey! Now you're one of us baby!
};


instance DIA_HUN_745_RAFFA_NEWS (C_Info)
{
	npc = hun_745_raffa;
	nr = 3;
	condition = dia_hun_745_raffa_news_condition;
	information = dia_hun_745_raffa_news_info;
	permanent = TRUE;
	description = " Any interesting news? " ;
};

func int dia_hun_745_raffa_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_news_info()
{
	AI_Output(other, self, " DIA_HUN_745_News_01_00 " );	// Any interesting news?

	if ((Capital >=  1 ) && ( MY_INCLUSION  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_HUN_745_News_01_01 " );	// There are always interesting things... (smiles)
		AI_Output(self,other, " DIA_HUN_745_News_01_02 " );	// Here, for example, I recently hunted one shnyg.
		AI_Output(self,other, " DIA_HUN_745_News_01_07 " );	// You see, I've been trying to get at least one egg of these creatures for a long time. But here is where the problem arises!
		AI_Output(self,other, " DIA_HUN_745_News_01_09 " );	// Usually a sniff is not a very serious opponent for an experienced hunter.
		AI_Output(self,other, " DIA_HUN_745_News_01_10 " );	// However, when it comes to their offspring, shnygs are very reliable guards of their nest and desperately defend themselves from intruders.
		AI_Output(self,other, " DIA_HUN_745_News_01_11 " );	// It turns out that shnyg, during the laying of eggs, becomes an extremely strong and dangerous creature!
		AI_Output(self,other, " DIA_HUN_745_News_01_12 " );	// I once tried to fill up one of these.
		AI_Output(self,other, " DIA_HUN_745_News_01_13 " );	// Imagine, this creature was so strong that I couldn't even deal any serious damage to it!
		MIS_INSULATOR = LOG_Running;
		Log_CreateTopic(TOPIC_INSLUKER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSLUKER,LOG_Running);
		B_LogEntry( TOPIC_INSLUKER , " Raffa told me that shnygs, protecting their offspring, become incredibly dangerous. During a recent hunt, he came across the nest of one of them. The hunter wanted to take a few eggs from the clutch, but ran into a shnyg guarding them, which turned out to be so strong that Raffa nearly died, so I should also be careful if I stumble upon a place like this. " );
		Wld_InsertNpc(egglurker,"FP_ROAM_NW_HUNTEGGLURKER_01");
		Wld_InsertItem(itat_lukeregg,"FP_NW_ITEM_EGGLURKER_01");
	}
	else  if ((Chapter >=  2 ) && ( MY_INSHADOWBEAST  ==  FALSE ) && ( MY_INSLUKER  ==  LOG_SUCCESS ))
	{
		AI_Output(self,other, " DIA_HUN_745_News_01_20 " );	// They say that in the hollow behind Lobart's farm they saw one incredibly large and strange-looking beast.
		AI_Output(self,other, " DIA_HUN_745_News_01_21 " );	// Judging by the description, this creature reminds me very much of one... shall we say, an unusual mrakoris.
		AI_Output(other,self, " DIA_HUN_745_News_01_22 " );	// So something special?
		AI_Output(self,other, " DIA_HUN_745_News_01_23 " );	// Yes. Ghostly mrakoris, hunter of the night! Ever heard of him?
		AI_Output(other,self, " DIA_HUN_745_News_01_24 " );	// No. And what kind of creature is this?
		AI_Output(self,other, " DIA_HUN_745_News_01_25 " );	// Ha! This beast is almost a legend. Strong as a troll and agile as a panther!
		AI_Output(self,other, " DIA_HUN_745_News_01_26 " );	// Meeting him at least once in your life is considered a great success, or vice versa - a great bad luck.
		AI_Output(self,other, " DIA_HUN_745_News_01_27 " );	// After all, no one has yet been able to stand against him.
		AI_Output(self,other, " DIA_HUN_745_News_01_28 " );	// And, to top it off, he has excellent eyesight, since this beast only hunts at night.
		AI_Output(self,other, " DIA_HUN_745_News_01_29 " );	// As a matter of fact, for this reason he got his nickname.
		AI_Output(other,self, " DIA_HUN_745_News_01_30 " );	// So no one was able to kill him?
		AI_Output(self,other, " DIA_HUN_745_News_01_31 " );	// Many tried to do it, but all these poor fellows died in his mouth. Every single one!
		AI_Output(self,other, " DIA_HUN_745_News_01_32 " );	// So I can tell you with confidence - you simply cannot find a stronger opponent!
		AI_Output(other,self, " DIA_HUN_745_News_01_33 " );	// Have you tried to hunt him yourself?
		AI_Output(self,other, " DIA_HUN_745_News_01_34 " );	// What are you - I'm not tired of living yet!
		AI_Output(self,other, " DIA_HUN_745_News_01_35 " );	// Yes, and I do not advise you to do this.
		AI_Output(self,other, " DIA_HUN_745_News_01_36 " );	// You shouldn't pull death by the mustache, otherwise you can run into big trouble.
		MIS_INSSHADOWBEAST = LOG_Running;
		Log_CreateTopic(TOPIC_INSSHADOWBEAST,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSSHADOWBEAST,LOG_Running);
		B_LogEntry( TOPIC_INSSHADOWBEAST , " According to Raffa, an unusual specter was seen in a crevice near Lobart's farm. Raffa believes that it was a ghostly specter, or, in other words, the Nightstalker - an incredibly strong creature that no one has yet been able to defeat. " );
		Wld_InsertNpc(nighthunter,"FP_ROAM_NW_HUNTBLOODBEAST_01");
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_745_News_01_39 " );	// No. Nothing like that, buddy!
	};
};


instance DIA_HUN_745_RAFFA_INSLUKER (C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_insluker_condition;
	information = dia_hun_745_raffa_insluker_info;
	permanent = FALSE;
	description = " I have a schnyg egg. " ;
};


func int dia_hun_745_raffa_insluker_condition()
{
	if((MIS_INSLUKER == LOG_Running) && (Npc_HasItems(other,itat_lukeregg) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_insluker_info()
{
	AI_Output(other,self, " DIA_HUN_745_InsLuker_01_00 " );	// I have a sniff egg.
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_01");	//Правда?
	B_GiveInvItems(other,self,itat_lukeregg,1);
	Npc_RemoveInvItems(self,itat_lukeregg,1);
	AI_Output(self,other, " DIA_HUN_745_InsLuker_01_03 " );	// Wow! And indeed it is. But where did you find it?
	AI_Output(other,self, " DIA_HUN_745_InsLuker_01_04 " );	// It's not that important.
	AI_Output(other,self, " DIA_HUN_745_InsLuker_01_05 " );	// However, you were right - the shnyg guarding him was much stronger than the usual ones.
	AI_Output(self,other, " DIA_HUN_745_InsLuker_01_06 " );	// Did you fight him?
	MIS_INSLUKER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSLUKER,LOG_SUCCESS);

	if (Npc_IsDead(egglurker))
	{
		AI_Output(other,self, " DIA_HUN_745_InsLuker_01_07 " );	// Yes, I killed him.
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_08 " );	// Ha! So you also finished him off - wow!
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_09 " );	// I didn't think you could do it.
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_11 " );	// Take this small reward for your efforts.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_12 " );	// I think you deserve it.
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_13");	//Спасибо!
		B_GivePlayerXP(200);
		B_LogEntry( TOPIC_INSLUKER , " Raffa thanked me for bringing him a schnyg egg. He was very surprised that I managed to kill the beast guarding him. " );
	}
	else
	{
		AI_Output(other,self, " DIA_HUN_745_InsLuker_01_14 " );	// I tried. True, nothing good came of this venture.
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_15 " );	// This is not surprising! You're lucky you're still alive.
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_16 " );	// Oh well - after all, not every fight can be won.
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_17 " );	// Take this small reward for your efforts.
		B_GiveInvItems(self,other,ItPo_Health_03,3);
		AI_Output(self,other, " DIA_HUN_745_InsLuker_01_18 " );	// I think you deserve it.
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_19");	//Спасибо!
		B_GivePlayerXP(100);
		B_LogEntry( TOPIC_INSLUKER , " Raffa thanked me for bringing him the schnyg egg. " );
	};
};


instance DIA_HUN_745_RAFFA_INSSHADOWBEAST(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_insshadowbeast_condition;
	information = dia_hun_745_raffa_insshadowbeast_info;
	permanent = FALSE;
	description = " Ghost Gloomer is dead. " ;
};


func int dia_hun_745_raffa_insshadowbeast_condition()
{
	if (( MIS_INSHADOWBEAST  == LOG_Running) && Npc_IsDead(nighthunter) && (Npc_HasItems(other,itat_nighthunterfur) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_insshadowbeast_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_HUN_745_InsShadowBeast_01_00 " );	// Ghostly darkness is dead.
	AI_Output(self,other, " DIA_HUN_745_InsShadowBeast_01_01 " );	// (in disbelief) What? Come on, stop pouring - this just can not be!
	AI_Output(other,self, " DIA_HUN_745_InsShadowBeast_01_02 " );	// Here's his skin! What do you say now?
	B_GiveInvItems(other,self,itat_nighthunterfur,1);
	Npc_RemoveInvItems(self,itat_nighthunterfur,1);
	AI_Output(self,other, " DIA_HUN_745_InsShadowBeast_01_03 " );	// Incredible! I can't believe my eyes!
	AI_Output(self,other, " DIA_HUN_745_InsShadowBeast_01_04 " );	// Have you really defeated the Nightstalker? But how did you do it?
	AI_Output(other,self, " DIA_HUN_745_InsShadowBeast_01_06 " );	// That Nightstalker of yours really turned out to be a damn strong opponent. But that still didn't save him.
	AI_Output(self,other, " DIA_HUN_745_InsShadowBeast_01_07 " );	// In that case, there is only one thing left for me - to recognize you as the greatest hunter in these parts!
	AI_Output(self,other, " DIA_HUN_745_InsShadowBeast_01_08 " );	// (respectfully) Even Falk himself would not have dared to do this, and you... You even managed to kill him!
	AI_Output(self,other, " DIA_HUN_745_InsShadowBeast_01_09 " );	// Congrats, man! Hold some gold by the skin.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_INSSHADOWBEAST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSSHADOWBEAST,LOG_SUCCESS);
	B_LogEntry( TOPIC_INSSHADOWBEAST , " Raffa was shocked and called me the greatest hunter of Khorinis after learning that I had killed a Nightstalker. " );
};


instance DIA_HUN_745_RAFFA_RESPECT(C_Info)
{
	npc = hun_745_raffa;
	nr = 4;
	condition = dia_hun_745_raffa_respect_condition;
	information = dia_hun_745_raffa_respect_info;
	permanent = FALSE;
	description = " I want to become the best hunter in the camp. " ;
};


func int dia_hun_745_raffa_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( RAFFA_RESPECT  ==  FALSE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_respect_info()
{
	AI_Output(other,self, " DIA_HUN_745_Respect_01_00 " );	// I want to be the best hunter in the camp.
	AI_Output(other,self, " DIA_HUN_745_Respect_01_01 " );	// Could you help me with this?
	AI_Output(self,other, " DIA_HUN_745_Respect_01_02 " );	// (smiles) To become one, you first need to earn the respect of the hunters, including mine.
	AI_Output(self,other, " DIA_HUN_745_Respect_01_03 " );	// And then challenge Falk to a hunting duel, which will show which of you is the best.

	if(MIS_INSSHADOWBEAST == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_745_Respect_01_04 " );	// However, knowing your abilities, I have no doubt that you will easily beat this smart guy.
		AI_Output(self,other, " DIA_HUN_745_Respect_01_05 " );	// The person who was able to kill the ghostly mrakoris can be considered not just the best, but a great hunter!
		AI_Output(self,other, " DIA_HUN_745_Respect_01_06 " );	// So I'm here for you. You can pass it on to Falk.
		B_LogEntry( TOPIC_HUNTERSWORK , " Raff's hunter has agreed to vote for me if I decide to challenge Falk to a hunting duel. " );
		RAFFA_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_745_Respect_01_08 " );	// But in my opinion, it's too early for you to think about it.
		AI_Output(other,self,"DIA_HUN_745_Respect_01_09");	//Почему?
		AI_Output(self,other, " DIA_HUN_745_Respect_01_10 " );	// Because only experience has a value in our trade, and there is too little of it behind your shoulders.
		AI_Output(self,other, " DIA_HUN_745_Respect_01_11 " );	// So I won't help you with that just yet. I'm sorry.
	};
};


instance DIA_HUN_745_RAFFA_RESPECTDONE (C_Info)
{
	npc = hun_745_raffa;
	nr = 4;
	condition = dia_hun_745_raffa_respectdone_condition;
	information = dia_hun_745_raffa_respectdone_info;
	permanent = TRUE;
	description = " What do you say now? " ;
};


func int dia_hun_745_raffa_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_time_745_raffa_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( RAFFA_RESPECT  ==  FALSE ) && ( MIS_HUNTERCHALLANGE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_respectdone_info()
{
	AI_Output(other,self, " DIA_HUN_745_RespectDone_01_00 " );	// What do you say now?

	if(MIS_INSSHADOWBEAST == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_HUN_745_RespectDone_01_02 " );	// Now it's different! The person who was able to kill the ghostly mrakoris can be considered not just the best, but a great hunter!
		AI_Output(self,other, " DIA_HUN_745_RespectDone_01_03 " );	// So I'm here for you. You can pass it on to Falk.
		B_LogEntry( TOPIC_HUNTERSWORK , " Raff's hunter has agreed to vote for me if I decide to challenge Falk to a hunting duel. " );
		RAFFA_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_745_RespectDone_01_05 " );	// Same as last time.
	};
};


instance DIA_HUN_745_RAFFA_F (C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_f_condition;
	information = dia_hun_745_raffa_f_info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int dia_hun_745_raffa_f_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_f_info()
{
	AI_Output(other, self, " DIA_HUN_745_F_01_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_HUN_745_F_01_01 " );	// Well, since you're one of us now, why not.
	AI_Output(self,other, " DIA_HUN_745_F_01_02 " );	// I can show you some archery techniques.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTEACHERS , " Raffa teaches archery. " );
};


instance DIA_HUN_745_RAFFA_BOW (C_Info)
{
	npc = hun_745_raffa;
	nr = 3;
	condition = dia_hun_745_raffa_bow_condition;
	information = dia_hun_745_raffa_bow_info;
	permanent = TRUE;
	description = " I want to learn how to shoot a bow. " ;
};


func int dia_hun_745_raffa_bow_condition()
{
	if ( Npc_KnowsInfo ( other , dia_time_745_sleep_f ))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bow_info()
{
	AI_Output(other,self, " DIA_HUN_745_Bow_01_00 " );	// I want to learn how to shoot a bow.
	AI_Output(self,other, " DIA_HUN_745_Bow_01_01 " );	// I can teach you, but not for free.
	AI_Output(self,other, " DIA_HUN_745_Bow_01_02 " );	// After all, I need to eat too!
	Info_ClearChoices(dia_hun_745_raffa_bow);
	Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
	Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
	Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
};

func void dia_hun_745_raffa_bow_back()
{
	Info_ClearChoices(dia_hun_745_raffa_bow);
};

func void dia_hun_745_raffa_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		if(RAFFATEACHFT == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_01 " );	// Shooting accuracy depends on your dexterity. The higher the dexterity, the more accurately the arrows fly to the target.
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_02 " );	// Well, your skill determines the distance from which you can hit the target.
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_03 " );	// In order to become a good archer, you must develop both.
			RAFFATEACHFT = TRUE;
		};
		if((RAFFATEACHST == FALSE) && (other.HitChance[NPC_TALENT_BOW] >= 60))
		{
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_04 " );	// You can already be called a good hunter. It's time to learn what you don't already know.
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_05 " );	// Dexterity alone is not enough to become a good archer. It is important to understand what makes a good shot.
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_06 " );	// There are many things to consider here: a keen eye and the tension of the bowstring, the flight of an arrow and the distance to the target. And most importantly, always be alert!
			AI_Output(self,other, " DIA_HUN_745_Bow_1_01_07 " );	// You've already mastered the technique very well. It remains to find the application of new knowledge and skills.
			RAFFATEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_745_raffa_bow);
		Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
	};
};

func void dia_hun_745_raffa_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		if(RAFFATEACHFT == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_01 " );	// Shooting accuracy depends on your dexterity. The higher the dexterity, the more accurately the arrows fly to the target.
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_02 " );	// Well, your skill determines the distance from which you can hit the target.
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_03 " );	// In order to become a good archer, you must develop both.
			RAFFATEACHFT = TRUE;
		};
		if((RAFFATEACHST == FALSE) && (other.HitChance[NPC_TALENT_BOW] >= 60))
		{
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_04 " );	// You can already be called a good hunter. It's time to learn what you don't already know.
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_05 " );	// Dexterity alone is not enough to become a good archer. It is important to understand what makes a good shot.
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_06 " );	// There are many things to consider here: a keen eye and the tension of the bowstring, the flight of an arrow and the distance to the target. And most importantly, always be alert!
			AI_Output(self,other, " DIA_HUN_745_Bow_5_01_07 " );	// You've already mastered the technique very well. It remains to find the application of new knowledge and skills.
			RAFFATEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_745_raffa_bow);
		Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
	};
};


instance DIA_HUN_745_RAFFA_BOWNEED (C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_bowneed_condition;
	information = dia_hun_745_raffa_bowneed_info;
	permanent = FALSE;
	description = " Are you upset about something? " ;
};


func int dia_hun_745_raffa_bowneed_condition()
{
	if ((Capital >=  1 ) && ( HEROISHUNTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bowneed_info()
{
	AI_Output(other,self, " DIA_HUN_745_BowNeed_01_00 " );	// Are you upset about something?
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_01 " );	// Eh, buddy... (sadly) It's all about my bow.
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_03 " );	// You see, during the last hunt, he cracked and is now good for nothing.
	AI_Output(other,self, " DIA_HUN_745_BowNeed_01_06 " );	// Why don't you buy yourself a new one?
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_07 " );	// Man, I'd have gone to town a long time ago and bought myself something worthwhile. But without a weapon, I won't take a single step out of this camp!
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_08 " );	// So you can, what good, become food for wolves or other animals that roam around here.
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_12 " );	// (proudly) The bow in my hands is a deadly weapon! He saved my skin more than once when I went hunting.
	AI_Output(other,self, " DIA_HUN_745_BowNeed_01_13 " );	// Maybe I can get you some new bow?
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_16 " );	// Can you really get me a new bow? It would be great!
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_17 " );	// True, just a regular bow won't work for me.
	AI_Output(other,self, " DIA_HUN_745_BowNeed_01_18 " );	// And what kind of bow do you need?
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_19 " );	// (thoughtfully) Well, it's rare to find it for sale.
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_20 " );	// The bow I want is made from different types of wood. Merchants usually call it compound.
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_21 " );	// If you can get it for me, I'll show you some shooting techniques no one else can teach you.
	AI_Output(self,other, " DIA_HUN_745_BowNeed_01_25 " );	// Of course, I'm not rushing you, but if you can, try to find me this bow as soon as possible.
	MIS_RAFFABOW = LOG_Running;
	Log_CreateTopic(TOPIC_RAFFABOW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAFFABOW,LOG_Running);
	B_LogEntry( TOPIC_RAFFABOW , " Raffa needs a compound bow. If I get this weapon for him, he'll show me a couple of archery moves. " );
	AI_StopProcessInfos(self);
};


instance DIA_HUN_745_RAFFA_BOWDONE (C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_bowdone_condition;
	information = dia_hun_745_raffa_bowdone_info;
	permanent = FALSE;
	description = " I got you a new bow. " ;
};


func int dia_hun_745_raffa_bowdone_condition()
{
	if (( HEROISHUNTER  ==  TRUE ) && ( MIS_RAFFABOW  == LOG_Running ) && ( Npc_HasItems ( other , ItRw_Bow_M_01 ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bowdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_745_BowDone_01_00 " );	// I got you a new bow.
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_01 " );	// True? Show me.
	AI_Output(other,self, " DIA_HUN_745_BowDone_01_02 " );	// Here, take this.
	B_GiveInvItems(other,self,ItRw_Bow_M_01,1);
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_03 " );	// Yes, it's the one! Now I can finally go hunting.
	EquipItem(self,ItRw_Bow_M_01);
	AI_Output(other,self, " DIA_HUN_745_BowDone_01_05 " );	// What about some of the shooting techniques you promised to teach me?
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_06 " );	// Of course! Listen carefully.
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_07 " );	// Next time you aim, try to predict the arrow's path relative to your target.
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_08 " );	// If you do it right, you'll be much less likely to miss. Remember?
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_09 " );	// (laughs) Now go train.
	AI_Output(self,other, " DIA_HUN_745_BowDone_01_10 " );	// It's best to practice what you've learned.
	MIS_RAFFABOW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAFFABOW,LOG_SUCCESS);
	B_LogEntry( TOPIC_RAFFABOW , " Raffa received his bow and gave me some shooting advice. " );
	b_teachfighttalentpercentfree(self,other,NPC_TALENT_BOW,5,100);
};


instance DIA_HUN_745_RAFFA_PICKPOCKET (C_Info)
{
	npc = hun_745_raffa;
	nr = 900;
	condition = dia_hun_745_raffa_pickpocket_condition;
	information = dia_hun_745_raffa_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_745_raffa_pickpocket_condition()
{
	return  C_Robbery ( 100 , 350 );
};

func void dia_hun_745_raffa_pickpocket_info()
{
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
	Info_AddChoice(dia_hun_745_raffa_pickpocket,Dialog_Back,dia_hun_745_raffa_pickpocket_back);
	Info_AddChoice(dia_hun_745_raffa_pickpocket, DIALOG_PICKPOCKET , dia_hun_745_raffa_pickpocket_doit);
};

func void dia_hun_745_raffa_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
};

func void dia_hun_745_raffa_pickpocket_back()
{
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
};


instance DIA_HUN_745_RAFFA_TRADEBOW (C_Info);
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_tradebow_condition;
	information = dia_time_745_raffa_tradebow_info;
	permanent = FALSE;
	description = " Where can I get a good bow? " ;
};


func int dia_hun_745_raffa_tradebow_condition();
{
	if (( HEROISHUNTER  ==  TRUE ) && ( MIS_RAFFABOW  ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_tradebow_info()
{
	AI_Output(other,self, " DIA_HUN_745_TradeBow_01_00 " );	// Where can I get a good bow?
	AI_Output(self,other, " DIA_HUN_745_TradeBow_01_01 " );	// You've come to the right place. I'll pick a great bow for you!
	Log_CreateTopic(TOPIC_HUNTERTRADES,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTRADES , " Raffa trades bows and arrows. " );
	RAFFACANTRADE = TRUE;
};


instance DIA_HUN_745_RAFFA_TRADE (C_Info)
{
	npc = hun_745_raffa;
	nr = 775;
	condition = dia_hun_745_raffa_trade_condition;
	information = dia_hun_745_raffa_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me what you've got. " ;
};


func int dia_hun_745_raffa_trade_condition()
{
	if((RAFFACANTRADE == TRUE) && Wld_IsTime(8,0,23,0))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_HUN_745_Trade_01_01 " );	// Show me what you've got.

	if ((HunBelt_01 ==  FALSE ) && ( HEROISHUNTER  ==  TRUE ))
	{
		CreateInvItems(self,ItBe_Addon_Custom_01,1);
		HunBelt_01 = TRUE;
	};
	if ((HunBelt_02 ==  FALSE ) && ( HEROISHUNTER  ==  TRUE ) && ( Know_HuntArmor_01 ==  TRUE ) && ( MY_LETTERFALK  ==  LOG_SUCCESS ))
	{
		CreateInvItems(self,ItBe_Addon_Custom_02,1);
		HunBelt_02 = TRUE;
	};
	if ((HunBelt_03 ==  FALSE ) && ( HEROISHUNTER  ==  TRUE ) && ( Know_HuntArmor_02 ==  TRUE ) && ( MIS_INSSHADOWBEAST  ==  LOG_SUCCESS ))
	{
		CreateInvItems(self,ItBe_Addon_Custom_03,1);
		HunBelt_03 = TRUE;
	};
	if ((HunBelt_04 ==  FALSE ) && ( HEROISHUNTER  ==  TRUE ) && ( Know_HuntArmor_03 ==  TRUE ) && ( MY_HUNTERCHALLANGE  ==  LOG_SUCCESS ))
	{
		CreateInvItems(self,ItBe_Addon_Custom_04,1);
		HunBelt_04 = TRUE;
	};
	if ((HunBelt_05 ==  FALSE ) && ( HEROISHUNTER  ==  TRUE ) && ( Know_HuntArmor_04 ==  TRUE ) && ( Chapter >=  4 )) ;
	{
		CreateInvItems(self,ItBe_Addon_BT_01,1);
		HunBelt_05 = TRUE;
	};

	B_GiveTradeInv(self);
	RAFFATELLSPECIAL = TRUE;
};


instance DIA_HUN_745_RAFFA_RAFFATELLSPECIAL (C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_raffatellspecial_condition;
	information = dia_hun_745_raffa_raffatellspecial_info;
	permanent = FALSE;
	description = " You have a very good selection of bows! " ;
};


func int dia_hun_745_raffa_raffatellspecial_condition()
{
	if(RAFFATELLSPECIAL == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_raffatellspecial_info()
{
	AI_Output(other,self, " DIA_HUN_745_TellSpecial_01_00 " );	// You have a very good selection of bows!
	AI_Output(self,other, " DIA_HUN_745_TellSpecial_01_01 " );	// Thank you, of course. But you can find these at other merchants as well.
	AI_Output(self,other, " DIA_HUN_745_TellSpecial_01_02 " );	// It would be much more interesting to have something completely different than just wooden bows at your disposal.
	AI_Output(other,self, " DIA_HUN_745_TellSpecial_01_03 " );	// What do you mean?
	AI_Output(self,other, " DIA_HUN_745_TellSpecial_01_04 " );	// Well, for example, some special bow or crossbow that is not like the others.
	AI_Output(self,other, " DIA_HUN_745_TellSpecial_01_05 " );	// So, if you suddenly come across such a weapon somewhere, I will gladly buy it from you.
	AI_Output(self,other, " DIA_HUN_745_TellSpecial_01_06 " );	// And at a good price!
	MIS_RAFFATELLSPECIAL = LOG_Running;
	Log_CreateTopic(TOPIC_RAFFATELLSPECIAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAFFATELLSPECIAL,LOG_Running);
	B_LogEntry( TOPIC_RAFFATELLSPECIAL , " Raffa is interested in rare firearms. He promised to pay me well if I brought him something like that. " );
};


instance DIA_HUN_745_RAFFA_RAFFATELLSPECIALDONE (C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_raffatellspecialdone_condition;
	information = dia_hun_745_raffa_raffatellspecialdone_info;
	permanent = TRUE;
	description = " I have a special weapon for you. " ;
};


func int dia_hun_745_raffa_raftatellspecialdone_condition()
{
	if((MIS_RAFFATELLSPECIAL == LOG_Running) && (Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_raffatellspecialdone_info()
{
	AI_Output(other,self, " DIA_HUN_745_TellSpecialDone_01_00 " );	// I have a special weapon for you.
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_01_01 " );	// True? Show me!
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
	Info_AddChoice(dia_hun_745_raffa_raffatellspecialdone,Dialog_Back,dia_hun_745_raffa_raffatellspecialdone_back);
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		Info_AddChoice(dia_hun_745_raffa_raffatellspecialdone, " Give 'Executor'. " ,dia_hun_745_raffa_raffatellspecialdone_magiccrossbowextro);
	};
};

func void dia_hun_745_raffa_raffatellspecialdone_back()
{
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
};

func void dia_hun_745_raffa_raffatellspecialdone_magiccrossbowextro()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_01 " );	// I give my hand to cut off - you've never seen such a thing before.
	B_GiveInvItems(other,self,itrw_addon_magiccrossbow_shv,1);
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_02 " );	// (enchanted) Unbelievable. Here is the weapon!
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_03 " );	// Judging by the appearance, it is very ancient. Look, there are even some inscriptions! True, in a language I do not understand.
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_07 " );	// How about two thousand gold coins?
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_09 " );	// Naturally, it costs a lot more. But I still can't offer more.
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_10 " );	// That's all the gold I have!
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_11");	//Думаю, да.
	AI_Output(self,other, " DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_12 " );	// Here, keep your money.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,itrw_addon_magiccrossbow_shv,1);
	B_LogEntry( TOPIC_RAFFATELLSPECIAL , " I gave Raffa an ancient Executor weapon found in the City of the Dead. " );
	MIS_RAFFATELLSPECIAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAFFATELLSPECIAL,LOG_SUCCESS);
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
};

var int RaffaCanTeachTrueShot;

instances DIA_HUN_745_RAFFA_TrueShot (C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShot_condition;
	information = dia_hun_745_raffa_TrueShot_info;
	permanent = FALSE;
	description = " I need your advice. " ;
};

func int dia_hun_745_raffa_TrueShot_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_SUCCESS) && (RaffaCanTeachTrueShot == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShot_info()
{
	AI_Output(other,self, " DIA_HUN_745_raffa_TrueShot_01_00 " );	// I need your advice.
	AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_01 " );	// Which one?
	AI_Output(other,self, " DIA_HUN_745_raffa_TrueShot_01_02 " );	// You see, sometimes when I shoot a bow, I can't hurt some creatures in the slightest.
	AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_03 " );	// Ah, that's what you're talking about. You can't continue. I already understand what you're getting at.
	AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_04 " );	// Of course, this is a big problem for someone who is used to using a bow exclusively.
	AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_05 " );	// However, there are several shooting techniques that will cause your shots to penetrate any armor and even the toughest hide.
	AI_Output(other,self, " DIA_HUN_745_raffa_TrueShot_01_06 " );	// Can you teach me this?

 	if((hero.attribute[ATR_DEXTERITY] >= 150) && (hero.HitChance[NPC_TALENT_BOW] >= 50))
	{
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_07 " );	// Of course. But for this you need some experience in handling small arms.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_08 " );	// Well, I never refused gold.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_09");	//Понимаю.
		RaffaCanTeachTrueShot = TRUE;
		B_LogEntry( TOPIC_HUNTERTEACHERS , " Raffa can teach me some special archery techniques. " );
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_10 " );	// Why are you doing this?
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_11 " );	// You look more like someone who fights with a sword than a bow.
		AI_Output(other,self, " DIA_HUN_745_raffa_TrueShot_01_12 " );	// So what?
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_13 " );	// You know, I just don't want to waste my time.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_01_14 " );	// First, learn to shoot more or less tolerably from a bow, pick up dexterity. Then we'll talk.
	};
};

instances DIA_HUN_745_RAFFA_TrueShot_Again (C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShot_Again_condition;
	information = dia_hun_745_raffa_TrueShot_Again_info;
	permanent = TRUE;
	description = " Am I good enough with a bow now? " ;
};

func int dia_hun_745_raffa_TrueShot_Again_condition()
{
	if(Npc_KnowsInfo(other,DIA_HUN_745_raffa_TrueShot) && (RaffaCanTeachTrueShot == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShot_Again_info()
{
	AI_Output(other,self, " DIA_HUN_745_raffa_TrueShot_Again_01_00 " );	// Well, how? Am I good enough with a bow now?
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_01");	//Хммм...(оценивающе)

	if((hero.attribute[ATR_DEXTERITY] >= 125) && (hero.HitChance[NPC_TALENT_BOW] >= 50))
	{
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_02 " );	// Now I see that in front of me is a man who is dexterous and knows a lot about handling a bow.
		AI_Output(other,self, " DIA_HUN_745_raffa_TrueShot_Again_01_03 " );	// So now you can teach me your shooting techniques?
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_04 " );	// Of course! I will show them. But for this you will need to have more experience in shooting.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_05 " );	// Oh, and some gold for training.
		RaffaCanTeachTrueShot = TRUE;
		B_LogEntry( TOPIC_HUNTERTEACHERS , " Raffa can teach me some special archery techniques. " );
	}
	else
	{
	 	if(hero.HitChance[NPC_TALENT_BOW] < 50)
		{
			AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_07 " );	// No, you're still new at this.
			AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_08 " );	// Come back when you're better.
			Print ( " Requires a bow proficiency level of at least 50... " );
		}
		else if(hero.attribute[ATR_DEXTERITY] < 125)
		{
			AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_09 " );	// Of course, you know how to handle a bow, but you still lack dexterity.
			AI_Output(self,other, " DIA_HUN_745_raffa_TrueShot_Again_01_10 " );	// Come back when you're smarter.
			Print ( " Required dexterity is at least 125... " );
		};
	};
};

instance DIA_HUN_745_RAFFA_TrueShotTeach(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShotTeach_condition;
	information = dia_hun_745_raffa_TrueShotTeach_info;
	permanent = TRUE;
	description = " Teach me your marksmanship. (Training Points: 25, Cost: 10000 coins) " ;
};

func int dia_hun_745_raffa_TrueShotTeach_condition()
{
	if((RaffaCanTeachTrueShot == TRUE) && (TrueShot == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShotTeach_info()
{
	AI_Output(other,self, " DIA_HUN_745_raffa_TrueShotTeach_01_00 " );	// Teach me your shooting techniques.

	if((hero.lp >= 25) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_01 " );	// Okay, listen carefully.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_02 " );	// Shooting isn't just about hitting the target. The main thing is where you aim!
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_03 " );	// Every creature has a weak and poorly protected place. That's where you shoot.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_04 " );	// You'll have a hard time finding it at first, but it will come with experience.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_05 " );	// Just keep practicing your marksmanship and don't forget to increase your dexterity.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_06 " );	// And then any target will become easy for you!
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_07 " );	// Yes, and you also need to remember that the lethal force of a shot depends on the distance to the target.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_08 " );	// If you fire an arrow while too far away from the target, it won't do enough damage.
		AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_09 " );	// Therefore, the closer you are to your target, the more damage you will deal to it. This is clear?
		AI_Output(other,self, " DIA_HUN_745_raffa_TrueShotTeach_01_10 " );	// Yes, everything is very clear.
		hero.lp = hero.lp - 25;
		RankPoints = RankPoints + 25;
		Npc_RemoveInvItems(hero,ItMi_Gold,10000);
		TrueShot = TRUE;
		AI_Print( " Learned : piercing shot " );
		Snd_Play("LevelUP");
	}
	else
	{
		if(hero.lp < 25)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_08 " );	// Sorry, buddy, but you don't have enough experience for that yet.
		}
		else
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_HUN_745_raffa_TrueShotTeach_01_09 " );	// Sorry, buddy, but I won't teach you for nothing.
		};
	};
};
