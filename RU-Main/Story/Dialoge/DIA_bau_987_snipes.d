

instance DIA_SNIPES_EXIT(C_Info)
{
	npc = bau_987_snipes;
	nr = 999;
	condition = dia_snipes_exit_condition;
	information = dia_snipes_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_snipes_exit_condition()
{
	return TRUE;
};

func void dia_snipes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HALLO(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_hallo_condition;
	information = dia_snipes_hallo_info;
	permanent = FALSE;
	description = " Hey Snipes! How are you? " ;
};


func int dia_snipes_hallo_condition()
{
	return TRUE;
};

func void dia_snipes_hallo_info()
{
	AI_Output(other,self, " DIA_Snipes_HALLO_01_00 " );	// Hey Snipes! How are you?
	AI_Output(self,other, " DIA_Snipes_HALLO_01_01 " );	// (surprised) What? Who are you? What do you want from me?
	AI_Output(other,self, " DIA_Snipes_HALLO_01_02 " );	// Hello from Viper.
	AI_Output(self,other, " DIA_Snipes_HALLO_01_03 " );	// From whom?!
	AI_Output(other,self, " DIA_Snipes_HALLO_01_04 " );	// From Viper! I think you should have known him.
	AI_Output(self,other, " DIA_Snipes_HALLO_01_05 " );	// I don't really remember being familiar with this guy...
	AI_Output(self,other, " DIA_Snipes_HALLO_01_06 " );	// Can you remind me where I could meet him? BUT?
	Info_AddChoice(dia_snipes_hallo, " How should I know? " ,dia_snipes_hallo_answer1);
	Info_AddChoice(dia_snipes_hallo, " You were together in Mining Valley. " ,dia_snipes_hallo_answer2);
	Info_AddChoice(dia_snipes_hallo, " It's strange that you don't remember him. " ,dia_snipes_hallo_answer3);
	Info_AddChoice(dia_snipes_hallo, " Looks like you have one unfinished business. " ,dia_snipes_hallo_answer4);
};

func void dia_snipes_hallo_answer1()
{
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer1_01_00 " );	// How should I know?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer1_01_01 " );	// And then where do I come from? (laughs) Hmmm... Looks like you made a mistake, man.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer1_01_02 " );	// I don't know and never knew any Viper. And stop distracting me from work.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer1_01_04 " );	// Well, whatever you say.
	Info_ClearChoices(dia_snipes_hallo);
};

func void dia_snipes_hallo_answer2()
{
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer2_01_00 " );	// You were together in the Valley of Mines.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer2_01_01 " );	// WHAT?! Ha! Hear what I tell you...
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer2_01_03 " );	// I have no idea who this Viper is or where he came from! And I have no business with former convicts.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer2_01_04 " );	// So don't pester me with stupid questions.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer2_01_05 " );	// Good. As you say.
	Info_ClearChoices(dia_snipes_hallo);
};

func void dia_snipes_hallo_answer3()
{
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer3_01_00 " );	// Strange that you don't remember him.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer3_01_01 " );	// But Viper remembers you very well from the time when you were together in the Old Mine.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer3_01_02 " );	// Old mine?! What are you talking about boy?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer3_01_03 " );	// Don't know any viper and no mine. Get off me before Lobart sees me talking to you!
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer3_01_05 " );	// You know what, I think you just miscalculated. It happens! I think it's better if you leave me alone.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer3_01_10 " );	// All right, all right... As you say.
	AI_StopProcessInfos(self);
};

func void dia_snipes_hallo_answer4()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_00 " );	// Looks like you have one piece of unfinished business left.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_01 " );	// Yes?! And what is this thing?
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_02 " );	// It's about a small load of ore.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_03 " );	// (with interest) Ores? What ore?
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_04 " );	// Which Viper said you were hauling out of the Old Mine just as it collapsed.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_05 " );	// And, as you understand, he is very interested in the fate of this cargo.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_06 " );	// Well, you are a storyteller! (laughs) If I had this ore, I wouldn't have to work for this Lobart beast!
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_07 " );	// And even if it was, I wouldn't tell a stranger about it.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_08 " );	// But it seems to me that we also met before.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_09 " );	// Have you met? That's hardly.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_10 " );	// Maybe I'm wrong, but it seems that in your time you really liked to mock the guards in the Old Mine. Aaron's chest key, remember?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_13 " );	// Ahh... Hmmm. Yes Yes. Maybe you are your boyfriend. Never would have thought!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_14 " );	// So you're saying Viper showed up and says hello to me? And I thought he was dead.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_15 " );	// No, he's fine. He is now hanging around in the port tavern of Khorinis.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_16 " );	// Well, this is good news.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_17 " );	// So what about ore?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_18 " );	// Hmmm... Did Viper tell you about her?
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_19 " );	// Well, yes, who else. And about how you managed to avoid death when there was a collapse in the mine.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_20 " );	// Hmmm... hmmm... (thoughtfully) To be honest, I myself would like to know where this ore is.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_22 " );	// Thing is, I know almost as much about ore as Viper does.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_24 " );	// When Viper stayed behind to make sure no one followed us, Aleph and I moved on.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_2A " );	// Some time later, we came across one of the caves and decided that it would be just the right place to bury our ore.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_25 " );	// I stayed at the entrance to that cave - to cover the rear, so to speak. (laughs)
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_26 " );	// And Aleph with the ore went to the cave. A few minutes later there was an explosion of such deafening force that I could not even stand on my feet.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_27 " );	// Falling, I hit my head on a stone and lost consciousness...
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_28 " );	// Looks like a magic barrier has collapsed.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_29 " );	// Yes, it is! When I woke up, I saw that the entrance to the cave was littered with stones.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_30 " );	// Aleph wasn't around. Apparently, he remained in that cave, like the ore, which in an unusual way ended up in our hands ...
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_31 " );	// I got up and went looking for Viper. When I returned to that place, Viper was no longer there, but the orcs were. And I decided to leave...
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_34 " );	// Once in Khorinis, I ate in a tavern for a couple of days, and then I got hired by Lobart.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_36 " );	// So you don't know where the ore is either?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_37 " );	// No, man. Who knows, it's Aleph! But I'm afraid he's probably still alive.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_38 " );	// Where is the cave where you decided to bury the ore?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_39 " );	// Have you decided to visit the Valley of Mines? Well, you're crazy ... There are orcs!
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_40 " );	// I'll deal with the orcs somehow. So where is this cave?
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_41 " );	// As I remember, she was on the way to the barons' camp, not far from the old hut of Cavalorn. Try looking there.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_42 " );	// And one more thing. If you find her, remember that a third is mine! And if you deceive me, someone will find out about your hard labor past.
	AI_Output(other,self, " DIA_Snipes_HALLO_Answer4_01_52 " );	// Don't worry! After all, I was also a prisoner. And we, former convicts, it is best to stick together.
	AI_Output(self,other, " DIA_Snipes_HALLO_Answer4_01_53 " );	// Yeah man, you're right. Well, now it's time for me to get to work. (reluctantly) Lobart will kick me out if he notices that I'm thrashing around.
	B_LogEntry( TOPIC_VIPERNUGGETS , " I met Snipes, a worker at the Lobart farm. He turned out to be the same Snipes that once with his comrades, Aleph and Viper, was involved in a cargo of ore. However, Snipes himself does not know where this ore is. The only thing what he was able to help me with was pointing out the cave where he and Aleph decided to bury the ore. It is located on the way from the New Camp to the Old, not far from the old hut of Cavalorn. " );
	MEASURING NIPS = TRUE ;
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HOWWORK(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howwork_condition;
	information = dia_snipes_howwork_info;
	permanent = TRUE;
	description = " How is the work progressing? " ;
};


func int dia_snipes_howwork_condition()
{
	if ( Npc_KnowsInfo ( other , dia_snipes_hello ) && ( MEETSNIPS  ==  FALSE ) && ( SNIPESRECRUITED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_snipes_howwork_info()
{
	AI_Output(other,self, " DIA_Snipes_HowWork_01_00 " );	// How is the work going?
	AI_Output(self,other, " DIA_Snipes_HowWork_01_01 " );	// Back off! Don't stop working!
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HOWWORKGOOD(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howworkgood_condition;
	information = dia_snipes_howworkgood_info;
	permanent = TRUE;
	description = " How are you, Snipes? " ;
};

func int dia_snipes_howworkgood_condition()
{
	if (Npc_KnowsInfo(other,dia_snipes_hallo) && ( MEETSNIPS  ==  TRUE ) && ( SNIPESRECRUITED  ==  FALSE ) && ( MY_VIPERNUGGETS  == LOG_Running) && ( SNIPSGETNUGGETS  ==  FALSE ) && ( SNIPSGETNUGGETS  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_snipes_howworkgood_info()
{
	AI_Output(other,self, " DIA_Snipes_HowWorkGood_01_00 " );	// How are you, Snipes?
	AI_Output(self,other, " DIA_Snipes_HowWorkGood_01_01 " );	// Yes, boy. I work from morning to evening...
	AI_Output(self,other, " DIA_Snipes_HowWorkGood_01_02 " );	// If only you could find our ore. Then it would be - uh! (sighing sadly)
};


instance DIA_SNIPES_GETTREASURE(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_gettreasure_condition;
	information = dia_snipes_gettreasure_info;
	permanent = FALSE;
	description = " Hey Snipes! I have something for you. " ;
};

func int dia_snipes_gettreasure_condition()
{
	if (( MIS_VIPERNUGGETS  == LOG_Running) && (Npc_HasItems(other,ItMy_Nugget) >=  200 ) && ( SNIPSGETNUGGETS  ==  FALSE ) && ( TALKTOALEF  ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_snipes_gettreasure_info()
{
	AI_Output(other,self, " DIA_Snipes_GetTreasure_01_00 " );	// Hey Snipes! I have something for you.
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_01 " );	// The only thing I need, man, is my ore.
	AI_Output(other,self, " DIA_Snipes_GetTreasure_01_02 " );	// Hmmm... And how did you guess?
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_03 " );	// (perplexed) WHAT? Really? But... where is she?
	AI_Output(other,self, " DIA_Snipes_GetTreasure_01_04 " );	// Here, take your share. Exactly two hundred pieces of ore.
	B_GiveInvItems(other,self,ItMi_Nugget,200);
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_05 " );	// Awesome! My darling! I will now live as well as the barons from the Old Camp!
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_08 " );	// Thank you. I will never forget what you did for me! By the way, what happened to Aleph?
	AI_Output(other,self, " DIA_Snipes_GetTreasure_01_11 " );	// I'm afraid to disappoint you, but he's dead. Unfortunately, he never managed to get past the orcs in the Valley.
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_12 " );	// Sorry! He was a good guy...

	if(VIPERGETNUGGETS == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Snipes_GetTreasure_01_13 " );	// Tell me, what about Viper?
		AI_Output(other,self, " DIA_Snipes_GetTreasure_01_14 " );	// I already gave Viper some of the ore. I'll tell you: he was in seventh heaven with happiness.
		AI_Output(self,other, " DIA_Snipes_GetTreasure_01_15 " );	// Hmmm... I'm happy for him!
		MIS_VIPERNUGGETS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
		B_LogEntry( TOPIC_VIPERNUGGETS , " I gave Snipes his cut. He was overjoyed. " );
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(self,other, " DIA_Snipes_GetTreasure_01_16 " );	// What about Viper?
		AI_Output(other,self, " DIA_Snipes_GetTreasure_01_17 " );	// I just wanted to meet him.
		AI_Output(self,other, " DIA_Snipes_GetTreasure_01_18 " );	// Hmmm... Well, that's right!
		B_LogEntry( TOPIC_VIPERNUGGETS , " I gave Snipes his cut. He was overjoyed. " );
	};

	if(SNIPESRECRUITEDDT == FALSE)
	{
		AI_Output(other,self, " DIA_Snipes_GetTreasure_01_19 " );	// What are you going to do next?
		AI_Output(self,other, " DIA_Snipes_GetTreasure_01_20 " );	// I think, for starters, I'll go to Orlan's tavern and drink myself to hell.
		AI_Output(self,other, " DIA_Snipes_GetTreasure_01_21 " );	// And then I don't know - we'll see.
	};

	AI_Output(other,self, " DIA_Snipes_GetTreasure_01_22 " );	// Got it. Well, I have to go.
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_23 " );	// Come on, buddy! I will be glad to meet you again. And thanks again!
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_24 " );	// Oh yeah, I almost forgot. Here, take this as a reward for your efforts.
	AI_Output(self,other, " DIA_Snipes_GetTreasure_01_25 " );	// I'm sure you'll need this swill...
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	SNIPSGETNUGGETS = TRUE;
	AI_StopProcessInfos(self);

	if(SNIPESRECRUITEDDT == FALSE)
	{
		Npc_ExchangeRoutine(self,"GetNuggets");
	};
};


instance DIA_SNIPES_HOWLIFE(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howlife_condition;
	information = dia_snipes_howlife_info;
	permanent = TRUE;
	description = " Is everything all right now? " ;
};


func int dia_snipes_howlife_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_gettreasure))
	{
		return TRUE;
	};
};

func void dia_snipes_howlife_info()
{
	AI_Output(other,self, " DIA_Snipes_HowLife_01_00 " );	// Is everything okay now?
	AI_Output(self,other, " DIA_Snipes_HowLife_01_01 " );	// It doesn't get any better, mate.
};


instance DIA_SNIPES_PICKPOCKET(C_Info)
{
	npc = bau_987_snipes;
	nr = 900;
	condition = dia_snipes_pickpocket_condition;
	information = dia_snipes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_snipes_pickpocket_condition()
{
	return  C_Robbery ( 15 , 25 );
};

func void dia_snipes_pickpocket_info()
{
	Info_ClearChoices(dia_snipes_pickpocket);
	Info_AddChoice(dia_snipes_pickpocket,Dialog_Back,dia_snipes_pickpocket_back);
	Info_AddChoice(dia_snipes_pickpocket,DIALOG_PICKPOCKET,dia_snipes_pickpocket_doit);
};

func void dia_snipes_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_snipes_pickpocket);
};

func void dia_snipes_pickpocket_back()
{
	Info_ClearChoices(dia_snipes_pickpocket);
};


instance DIA_SNIPES_HOWOREHUCK(C_Info)
{
	npc = bau_987_snipes;
	nr = 2;
	condition = dia_snipes_howorehuck_condition;
	information = dia_snipes_howorehuck_info;
	permanent = FALSE;
	description = " You mined ore, didn't you? " ;
};

func int dia_snipes_howorehuck_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (ABOUTSWBL == TRUE))
	{
		return TRUE;
	};
};

func void dia_snipes_howorehuck_info()
{
	AI_Output(other,self, " DIA_Snipes_HOWOREHUCK_01_00 " );	// Snipes! You've mined ore, and you know how it's done?
	AI_Output(self,other, " DIA_Snipes_HOWOREHUCK_01_01 " );	// Of course baby! Do you know how much time I spent in the Old Mine?
	AI_Output(other,self, " DIA_Snipes_HOWOREHUCK_01_02 " );	// Can you teach me how to mine ore?
	AI_Output(self,other, " DIA_Snipes_HOWOREHUCK_01_03 " );	// Yes, I can give you a couple of lessons.
	AI_Output(other,self, " DIA_Snipes_HOWOREHUCK_01_04 " );	// Great. Do you happen to know who can smelt ore?
	AI_Output(self,other, " DIA_Snipes_HOWOREHUCK_01_05 " );	// Viper spent his entire hard labor near the smelter. Maybe he learned something.
	; _ _ _ _ _ _
};

instance DIA_SNIPES_LEARNABOUTERZHUNT(C_Info)
{
	npc = bau_987_snipes;
	nr = 2;
	condition = dia_snipes_learnabouterzhunt_condition;
	information = dia_snipes_learnabouterzhunt_info;
	permanent = TRUE;
	description = " Teach me how to mine. " ;
};

func int dia_snipes_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_howorehuck) && (HERO_HACKCHANCEORE < 50))
	{
		return TRUE;
	};
};

func void dia_snipes_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self, " DIA_SNIPES_LearnAboutErzHunt_01_10 " );	// Tell me more about mining.
	}
	else
	{
		AI_Output(other,self, " DIA_SNIPES_LearnAboutErzHunt_01_00 " );	// Teach me how to mine.
	};

	Info_ClearChoices(dia_snipes_learnabouterzhunt);
	Info_AddChoice(dia_snipes_learnabouterzhunt,Dialog_Back,dia_snipes_learnabouterzhunt_Back);
	Info_AddChoice(dia_snipes_learnabouterzhunt,b_buildlearnstringforerzhunt("Добыча руды",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_snipes_learnabouterzhunt_ERZWORK);
};

func void dia_snipes_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_snipes_learnabouterzhunt);
};

func void dia_snipes_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 50)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_01 " );	// Good! Listen carefully...
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_02 " );	// First you need to get a good pickaxe - that's half the battle.
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_03 " );	// Then start processing the ore nugget you found.
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_04 " );	// It is necessary to hit not along the edge of the rock, but exactly in the center. Deal one powerful blow, after - several weaker ones.
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_05 " );	// Thus, you will break the structure of the nugget a little, and at the next strong blow, some piece will surely break off from it.
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_06 " );	// And then repeat everything again until you get bored. (laughs)
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_07 " );	// This is the main thing you need to know about mining.
				AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_08");	//Спасибо!
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_09 " );	// Okay! Listen carefully ... (tells)
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_SNIPES_LearnAboutErzHunt_01_11 " );	// I taught you everything I could remember. Try looking for another teacher.
	};

	Info_ClearChoices(dia_snipes_learnabouterzhunt);
};

instance DIA_SNIPES_AskforDT(C_Info)
{
	npc = bau_987_snipes;
	nr = 6;
	condition = DIA_SNIPES_AskforDT_condition;
	information = DIA_SNIPES_AskforDT_info;
	permanent = FALSE;
	description = " I need an experienced miner for the mine. " ;
};

func int DIA_SNIPES_askfordt_condition()
{
	if (( HURRAYICANHIRE  ==  TRUE ) && ( SearchOreMine ==  TRUE ) && ( MEETSNIPS  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_SNIPES_AskforDT_info()
{
	AI_Output(other,self, " DIA_SNIPES_AskforDT_15_00 " );	// I need an experienced miner for the mine.
	AI_Output(self,other, " DIA_SNIPES_AskforDT_17_01 " );	// And why did you suddenly think that I want to bend my back in the mine again?
	AI_Output(self,other, " DIA_SNIPES_AskforDT_17_02 " );	// No! I've had enough of all this.

	if(RhetorikSkillValue[1] >= 60)
	{
		Info_AddChoice(DIA_SNIPES_AskforDT, " (try to persuade) " ,DIA_SNIPES_AskforDT_yes);
	};
};

func void DIA_SNIPES_AskforDT_yes()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_00 " );	// Listen! No one is going to make you hang around in the mine for days on end.
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_01 " );	// Just a couple of hours a day with a pick in hand, and for all this - shelter, food and decent pay.
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_02 " );	// I'm sure with your experience as a miner, this shouldn't be too hard for you.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_03 " );	// What? Are you saying you're also going to pay me for this?
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_04 " );	// Well, yes - say, thirty gold coins a day.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_05 " );	// Thirty gold pieces? Hmmm... Sounds good. That's at least double what I got when I worked on Lobart's farm.
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_06 " );	// You see. Not everything is as bad as it might seem at first glance.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_07 " );	// Well, let's say. Where is this mine located?
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_08 " );	// In my camp near Onar's farm, next to the old tower.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_09 " );	// Oh yeah... I think I know this place. I used to work there before they left me to rot in that damned colony.
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_10 " );	// So you've been there before? Maybe then you can tell me what else you know about that mine?
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_11 " );	// What is there to tell. A mine is like a mine. By itself, not very big, but most importantly - quite dry.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_12 " );	// Dampness and landslides almost never happened there. All in all, not the worst place to work.
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_13 " );	// If so, why don't you work there again?
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_14 " );	// Eh... Okay, I agree. In the end, it will definitely not be worse than now, and you still pay decent money for work.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_15 " );	// When should I go there?
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_16 " );	// You can now! If anything, the password to enter there is the phrase 'Dragon Treasures'.
	AI_Output(self,other, " DIA_SNIPES_askfordt_yes_15_17 " );	// Good! See you then.
	AI_Output(other,self, " DIA_SNIPES_askfordt_yes_15_18 " );	// See you.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Snipes agreed to work for me in the mine. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	SNIPESRECRUITEDDT = TRUE;

	if(DT_IRONGATHER_START == FALSE)
	{
		DT_IRONGATHER_START = TRUE;
		EVERYDAYDTIRON = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

func void DIA_SNIPES_AskforDT_no()
{
	AI_Output(other,self, " DIA_SNIPES_AskforDT_no_15_00 " );	// Okay, whatever you say.
	AI_StopProcessInfos(self);
};

instance DIA_SNIPES_INTOWER(C_Info)
{
	npc = bau_987_snipes;
	nr = 22;
	condition = DIA_SNIPES_intower_condition;
	information = DIA_SNIPES_intower_info;
	permanent = TRUE;
	description = " How is the work progressing? " ;
};

func int DIA_SNIPES_intower_condition()
{
	if((SNIPESRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_SNIPES_intower_info()
{
	AI_Output(other,self, " DIA_Snipes_HowWork_01_00 " );	// How is the work going?
	AI_Output(self,other, " DIA_SNIPES_InTower_OrcKap_01_01 " );	// Digging slowly!
};
