
instance DIA_Grom_EXIT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 999;
	condition = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grom_HELLO (C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = DIA_Grom_HALLO_Condition;
	information = DIA_Grom_HELLO_Info;
	description = " Is everything okay? " ;
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HELLO_Info()
{
	AI_Output(other,self, " DIA_Grom_HALLO_15_00 " );	// Is everything okay?
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(self,other, " DIA_Grom_HALLO_08_02 " );	// Fine, just fine!
	}
	else
	{
		AI_Output(self,other, " DIA_Grom_HALLO_08_01 " );	// Ah, stranger, stranger... I'm very busy. What do you want?
	};
};


instance DIA_Grom_HELLO_what to watch (C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_hello_whattosee_condition;
	information = dia_grom_hello_whattosee_info;
	description = " What interesting things can be seen here? " ;
};


func int dia_grom_hello_whattoview_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void dia_grom_hello_whattosee_info()
{
	AI_Output(other,self, " DIA_Grom_HALLO_Waszusehen_15_00 " );	// What interesting things can be seen around here?
	AI_Output(self,other, " DIA_Grom_HALLO_Waszusehen_08_01 " );	// Interesting is the right word. If you go deep enough into the local forest, you will stumble upon some very grumpy guys.
	AI_Output(self,other, " DIA_Grom_HALLO_Waszusehen_08_02 " );	// They're about ten feet tall, hairy, and in a bad mood. So don't go there if you don't think you're strong enough.
};


instance DIA_Grom_HELLO_was (C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_hallo_was_condition;
	information = dia_grom_hello_was_info;
	description = " What are you doing here? " ;
};


func int dia_grom_hallo_was_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Grom_HELLO ) && ( HEROISHUNTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_grom_hello_was_info()
{
	AI_Output(other,self, " DIA_Grom_HALLO_Was_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Grom_HALLO_Was_08_01 " );	// What do you think a hunter might be doing here? Knitting?
	AI_Output(self,other, " DIA_Grom_HALLO_Was_08_02 " );	// Falk ordered a couple of mountain troll skins.
	AI_Output(self,other, " DIA_Grom_HALLO_Was_08_03 " );	// So I'm hanging around here - waiting for the right moment to end these smelly beasts!
	AI_Output(self,other, " DIA_Grom_HALLO_Was_08_04 " );	// If not for this special order, I would have been sitting in the camp by now - eating delicious meat and drinking cold beer.
	MIS_GROMTROLLS = LOG_Running;
	Log_CreateTopic(TOPIC_GROMTROLLS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMTROLLS,LOG_Running);
	B_LogEntry( TOPIC_GROMTROLLS , " Grom the Hunter needs two troll skins. I could help him get them. " );
};


instance DIA_GROM_TROLLFUR(C_Info)
{
	npc = BAU_981_Grom;
	nr = 2;
	condition = dia_grom_trollfur_condition;
	information = dia_grom_trollfur_info;
	permanent = FALSE;
	description = " I have some troll skins for you. " ;
};


func int dia_grom_trollfur_condition()
{
	if((MIS_GROMTROLLS == LOG_Running) && (Npc_HasItems(other,ItAt_TrollFur) >= 2))
	{
		return TRUE;
	};
};

func void dia_grom_trollfur_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Grom_TrollFur_01_00 " );	// I have some troll skins for you.
	AI_Output(self,other, " DIA_Grom_TrollFur_01_01 " );	// What? where did you get them from? You went troll hunting? It's damn dangerous!
	AI_Output(self,other, " DIA_Grom_TrollFur_01_03 " );	// Now I can get my ass out of here! Hand them over!
	AI_Output(other,self, " DIA_Grom_TrollFur_01_04 " );	// Here you go.
	B_GiveInvItems(other,self,ItAt_TrollFur,2);
	AI_Output(self,other, " DIA_Grom_TrollFur_01_05 " );	// Great! I'll give you five hundred coins for them. That's much more than what the merchants in the city will offer you.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other, " DIA_Grom_TrollFur_01_06 " );	// Well, it's time for me to get back to the camp. See you!
	MIS_GROMTROLLS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GROMTROLLS,LOG_SUCCESS);
	B_LogEntry( TOPIC_GROMTROLLS , " I brought a couple of mountain troll skins to Grom. " );
	Npc_ExchangeRoutine(self,"GotoHunters");
	Info_ClearChoices(dia_grom_trollfur);
	AI_StopProcessInfos(self);
};


instance DIA_Grom_AskTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 10;
	condition = DIA_Grom_AskTeacher_Condition;
	information = DIA_Grom_AskTeacher_Info;
	description = " Can you teach me how to hunt? " ;
};


func int DIA_Grom_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self, " DIA_Grom_AskTeacher_15_00 " );	// Can you teach me how to hunt?
	AI_Output(self,other, " DIA_Grom_AskTeacher_08_01 " );	// Of course. But first bring me some decent food. I'm starving.
	AI_Output(self,other, " DIA_Grom_AskTeacher_08_02 " );	// I want a bottle of milk, a loaf of bread, and a fatty ham. Then I'll teach you everything I know.
	MIS_GROMASKTEACHER = LOG_Running;
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher, " Grom Hunter will teach me everything he knows if I bring him a bottle of milk, a loaf of bread and a ham. " );
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = " Here's the food you asked for. " ;
};


func int DIA_Grom_PayTeacher_Condition()
{
	if((MIS_GROMASKTEACHER == LOG_Running) && Npc_HasItems(other,ItFo_Milk) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Bacon))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Grom_PayTeacher_15_00 " );	// Here's the food, just like you asked.
	if(B_GiveInvItems(other,self,ItFo_Milk,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_01");	//Milk.
	};
	if(B_GiveInvItems(other,self,ItFo_Bread,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_02");	//Bread.
	};
	if(B_GiveInvItems(other,self,ItFo_Bacon,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_03");	//Ham.
	};
	AI_Output(self,other, " DIA_Grom_PayTeacher_08_01 " );	// Great, now what?
	Grom_TeachAnimalTrophy = TRUE;
	MIS_GROMASKTEACHER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_SUCCESS);
	B_LogEntry(TOPIC_GromAskTeacher, " I brought Grom some food. " );
};

var int GromTeachFinish;

instance DIA_Grom_TEACHHUNTING(C_Info)
{
	npc = BAU_981_Grom;
	nr = 12;
	condition = DIA_Grom_TEACHHUNTING_Condition;
	information = DIA_Grom_TEACHHUNTING_Info;
	permanent = TRUE;
	description = " Teach me how to hunt. " ;
};

func int DIA_Grom_TEACHHUNTING_Condition()
{
	if((Grom_TeachAnimalTrophy == TRUE) && (GromTeachFinish == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other,self, " DIA_Grom_TEACHHUNTING_15_00 " );	// Teach me how to hunt.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_08_01 " );	// What do you want to know?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Skinning",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Pulling teeth",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Removing hearts",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Removing mandibles",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Harvesting shadowbeast horns",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt( " Harvesting Fire lizard tongues " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_FireTongue)),dia_grom_teachhunting_firetongue);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_08_02 " );	// I have nothing to teach you. You already know everything.
		GromTeachFinish = TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_Fur_08_00 " );	// Make an incision along the legs of the animal so you can skin it. Cut it from back to front, not the other way around.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_Teeth_08_00 " );	// The jaw of the animal must be taken out carefully so as not to break it when it separates from the skull.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_Heart_08_00 " );	// You can cut out an animal's heart by making a deep incision in its chest. But usually this only makes sense in the case of special animals or magical creatures.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_Mandibles_08_00 " );	// The mandibles of a creeper or field predator must be separated with a very strong metal lever. They sit very deep in the skulls of these animals.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_ShadowHorn_08_00 " );	// To separate the horn of the shadowbeast, press down on it with all your weight, while cutting the base with a sharp knife.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void dia_grom_teachhunting_firetongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other, " DIA_Grom_TEACHHUNTING_FireTongue_08_00 " );	// The fire lizard's tongue must be cut off with a well-sharpened knife, holding the creature's mouth firmly with the other hand.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};


instance DIA_Grom_PICKPOCKET(C_Info)
{
	npc = BAU_981_Grom;
	nr = 900;
	condition = DIA_Grom_PICKPOCKET_Condition;
	information = DIA_Grom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grom_PICKPOCKET_Condition()
{
	return  C_Robbery ( 75 , 40 );
};

func void DIA_Grom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
	Info_AddChoice(DIA_Grom_PICKPOCKET,Dialog_Back,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};


instance DIA_GROM_RESPECT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 1;
	condition = dia_grom_respect_condition;
	information = dia_grom_respect_info;
	permanent = FALSE;
	description = " I need your help. " ;
};


func int dia_grom_respect_condition()
{
	if (( CANHUNTERCHALLANGE  ==  TRUE ) && ( MIS_HUNTERCHALLANGE  ==  FALSE ) && ( GROM_RESPECT  ==  FALSE ) && Npc_KnowsInfo(other,DIA_Grom_HALLO));
	{
		return TRUE;
	};
};

func void dia_grom_respect_info()
{
	AI_Output(other,self, " DIA_Grom_Respect_01_01 " );	// I need your help.
	AI_Output(self,other, " DIA_Grom_Respect_01_02 " );	// With what?
	AI_Output(other,self, " DIA_Grom_Respect_01_03 " );	// I want to challenge Falk and I need to enlist the support of the other hunters.
	AI_Output(self,other, " DIA_Grom_Respect_01_04 " );	// You wish to go agter Falk himself? You are either very brave or very stupid.
	AI_Output(self,other, " DIA_Grom_Respect_01_05 " );	// He's the best hunter in this camp, and I don't think you have any chance of overthrowing him.
	AI_Output(other,self, " DIA_Grom_Respect_01_06 " );	// So I've heard, but my mind is set on this.
	AI_Output(self,other, " DIA_Grom_Respect_01_07 " );	// Hmmm... Well, if you're so confident in your abilities, then of course I could help you.
	AI_Output(self,other, " DIA_Grom_Respect_01_08 " );	// But everything in this life must be earned - and my support is no different.
	AI_Output(other,self, " DIA_Grom_Respect_01_09 " );	// What should I do?
	AI_Output(self,other, " DIA_Grom_Respect_01_10 " );	// Just bring me a rare hunting trophy.
	AI_Output(self,other, " DIA_Grom_Respect_01_11 " );	// If you're a skilled hunter, this should be easy for you.
	AI_Output(other,self, " DIA_Grom_Respect_01_12 " );	// What kind of trophy do you want?
	AI_Output(self,other, " DIA_Grom_Respect_01_13 " );	// I told you - rare! For example, a large crawler egg.
	AI_Output(self,other, " DIA_Grom_Respect_01_14 " );	// Finding one will take balls and cunning, as crawlers are extremely protective of their spawn. 
	AI_Output(other,self, " DIA_Grom_Respect_01_15 " );	// Okay, I agree.
	B_LogEntry( TOPIC_HUNTERSWORK , " I will earn Thunder's assistance if I bring him a crawler egg. " );
};


instance DIA_GROM_RESPECTDONE(C_Info)
{
	npc = BAU_981_Grom;
	nr = 1;
	condition = dia_grom_respectdone_condition;
	information = dia_grom_respectdone_info;
	permanent = FALSE;
	description = " I brought you a crawler egg. " ;
};


func int dia_grom_respectdone_condition()
{
	if ( Npc_KnowsInfo ( other , dia_grom_respect ) && ( CANHUNTERCHALLANGE  ==  TRUE ) && ( MY_HUNTERCHALLANGE  ==  FALSE ) && ( GROM_RESPECT  ==  FALSE ) && ( Npc_HasItems ( other , itat_crawlerqueen ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_grom_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Grom_RespectDone_01_00 " );	// I brought you a creeper's egg.
	AI_Output(self,other, " DIA_Grom_RespectDone_01_01 " );	// And where is it?
	AI_Output(other,self, " DIA_Grom_RespectDone_01_02 " );	// Here.
	B_GiveInvItems(other,self,itat_crawlerqueen,1);
	AI_Output(self,other, " DIA_Grom_RespectDone_01_03 " );	// Hmmm... This is a beauty all right.
	AI_Output(self,other, " DIA_Grom_RespectDone_01_04 " );	// I honestly didn't think you'd be able to do that. I underestimated you!
	AI_Output(other,self, " DIA_Grom_RespectDone_01_05 " );	// So now can I count on your support?
	AI_Output(self,other, " DIA_Grom_RespectDone_01_06 " );	// As agreed, mate. If Falk asks me about you, he will only hear good things.
	GROM_RESPECT = TRUE;
	B_LogEntry( TOPIC_HUNTERSWORK , " I brought Grom a crawler egg. Now Grom will support me in dealing with Falk. " );
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};
