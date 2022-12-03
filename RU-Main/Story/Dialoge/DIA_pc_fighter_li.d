

instance DIA_GORN_LI_KAP5_EXIT(C_Info)
{
	npc = pc_fighter_li;
	nr = 999;
	condition = dia_gorn_li_kap5_exit_condition;
	information = dia_gorn_li_kap5_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gorn_li_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gorn_li_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORN_LI_TEACH(C_Info)
{
	npc = pc_fighter_li;
	nr = 10;
	condition = dia_gorn_li_teach_condition;
	information = dia_gorn_li_teach_info;
	permanent = TRUE;
	description = "Я нуждаюсь в тренировке.";
};


func int dia_gorn_li_teach_condition()
{
	return TRUE;
};

func void dia_gorn_li_teach_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Я хочу потренироваться.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//Это не помешает.
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//Ну. Однако, уже лучше.
	};
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Ты должен держать оружие выше. Твою защиту пробьет слепой с костылем.
	};
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_back()
{
	Info_ClearChoices(dia_gorn_li_teach);
};


instance DIA_FIGHTER_LI_PICKPOCKET(C_Info)
{
	npc = pc_fighter_li;
	nr = 900;
	condition = dia_fighter_li_pickpocket_condition;
	information = dia_fighter_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_fighter_li_pickpocket_condition()
{
	return  C_Robbery ( 10 , 45 );
};

func void dia_fighter_li_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_li_pickpocket);
	Info_AddChoice(dia_fighter_li_pickpocket,Dialog_Back,dia_fighter_li_pickpocket_back);
	Info_AddChoice(dia_fighter_li_pickpocket,DIALOG_PICKPOCKET,dia_fighter_li_pickpocket_doit);
};

func void dia_fighter_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_fighter_li_pickpocket);
};

func void dia_fighter_li_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_li_pickpocket);
};


instance DIA_GORN_LI_STORMFEAR(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_stormfear_condition;
	information = dia_gorn_li_stormfear_info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int dia_gorn_li_stormfear_condition()
{
	return TRUE;
};

func void dia_gorn_li_stormfear_info()
{
	AI_Output(other,self, " DIA_Gorn_LI_StormFear_00_00 " );	// How are you?
	AI_Output(self,other, " DIA_Gorn_LI_StormFear_00_01 " );	// (nervously) It could be better, mate.
	AI_Output(self,other, " DIA_Gorn_LI_StormFear_00_02 " );	// After that storm we got into, I still can't get over it!
};


instance DIA_GORN_LI_BRINGFOOD(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfood_condition;
	information = dia_gorn_li_bringfood_info;
	permanent = FALSE;
	description = " It's time for you to calm down. " ;
};


func int dia_gorn_li_bringfood_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_stormfear))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfood_info()
{
	AI_Output(other,self, " DIA_Gorn_LI_BringFood_00_00 " );	// It's time for you to calm down and bring yourself to your senses.
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_01 " );	// It's easy for you to talk! After all, you spent most of the time unconscious.
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_02 " );	// And at the time of the storm I suffered such horror that...
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_03 " );	// If there's anything that could bring me back to life right now, it's just a lot of tasty food!
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_04");	//Но...
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_06 " );	// According to Torlof, our food supplies are running low.
	};
	if(JorgenIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_07 " );	// Based on Jorgen's words, our food supplies are running low.
	};
	if(JackIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_08 " );	// Based on Jack's words, our food supplies are running low.
	};
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_09 " );	// So all the guys had to moderate their appetites a bit... (sadly) And especially me!
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_13 " );	// Eh... I wouldn't mind a hefty piece of well-done meat right now!
	AI_Output(other,self, " DIA_Gorn_LI_BringFood_00_15 " );	// But I think there are enough animals on this island.
	AI_Output(other,self, " DIA_Gorn_LI_BringFood_00_16 " );	// Hunting would replenish food supplies.
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_17 " );	// Yeah, but a lot of guys don't go far inland for now.
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_18 " );	// No one knows what kind of creatures can be found there.
	AI_Output(self,other, " DIA_Gorn_LI_BringFood_00_19 " );	// And I won't go there alone!
};


instance DIA_GORN_LI_BRINGFOODPROGGRESS(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfoodproggress_condition;
	information = dia_gorn_li_bringfoodproggress_info;
	permanent = FALSE;
	description = " How much food do we need? " ;
};


func int dia_gorn_li_bringfoodproggress_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_bringfood))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodproggress_info()
{
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodProggress_00_00 " );	// How much food do we need?
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggress_00_01 " );	// The more the better!
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggress_00_03 " );	// Well, I think that two dozen pieces of meat and about twenty apples will be enough to start with.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggress_00_05 " );	// What are you doing, you decided to go hunting yourself?
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodProggress_00_06 " );	// Well, why not. After all, someone has to finally find out what this island is.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggress_00_12 " );	// If you really do this, everyone will just say a big thank you.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggress_00_13 " );	// But be careful!
	MIS_BRINGFOOD = LOG_Running;
	Log_CreateTopic(TOPIC_BRINGFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_Running);
	B_LogEntry( TOPIC_BRINGFOOD , " The bugle said the ship was running low on food, and that's why all the guys had to tighten their belts. This situation makes him very sad. I plan to go inland and hunt to replenish our provisions. According to Gorn, for the first time, two dozen pieces of fresh meat and about twenty apples will be enough for us. " );
};


instance DIA_GORN_LI_BRINGFOODPROGGRESSTOEND(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfoodproggresstoend_condition;
	information = dia_gorn_li_bringfoodproggresstoend_info;
	permanent = FALSE;
	description = " I got fresh meat and apples. " ;
};


func int dia_gorn_li_bringfoodproggresstoend_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodproggresstoend_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodProggressToEnd_00_00 " );	// I got fresh meat and apples.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_01 " );	// Great, mate! Now we will definitely not die of hunger.
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_03 " );	// I think you should take it to Torlof.
	};
	if(JorgenIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_04 " );	// I think you should take it to Jorgen.
	};
	if(JackIsCaptain == TRUE)
	{
		AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_05 " );	// I think you should take it to Jack.
	};
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_06 " );	// He probably knows how best to deal with him.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_08 " );	// Wait! (whispers) And one more thing...
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_09");	//Что?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_10 " );	// I'm sure our captain - even though we now have plenty of grub - will not indulge us too much with an abundance of food.
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodProggressToEnd_00_12 " );	// What are you talking about?
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_13 " );	// To the fact that... (hesitantly) ...if you suddenly, by chance, have a few extra pieces of meat lying around somewhere, then...
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_14 " );	// ...give it to me. My stomach is making me hungry!
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_18 " );	// Trust me, I will not remain in your debt.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_19 " );	// Just keep in mind that I don't need raw meat.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_20 " );	// But the well-done, perhaps, I will not refuse.
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodProggressToEnd_00_23 " );	// How much do you need?
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodProggressToEnd_00_24 " );	// I think that ten fat pieces will be enough for me.
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodProggressToEnd_00_25 " );	// I'll see what I can do.
	B_LogEntry( TOPIC_BRINGFOOD , " I got the amount of meat the Gorn was talking about. Now we need to take it to our captain. " );
	Log_AddEntry( TOPIC_BRINGFOOD , " Also, Gorn asked me to give him ten pieces of the meat I got, after cooking it well. The poor fellow is so hungry that he is already ready to chew the soles of his boots, just to satisfy his hunger a little. " );
	GORNTELLABOUTMEAT = TRUE;
};


instance DIA_GORN_LI_BRINGFOODBEGINEND(C_Info)
{
	npc = pc_fighter_li;
	nr = 1;
	condition = dia_gorn_li_bringfoodbeginend_condition;
	information = dia_gorn_li_bringfoodbeginend_info;
	permanent = FALSE;
	description = " Here's some grilled meat for you. " ;
};


func int dia_gorn_li_bringfoodbeginend_condition()
{
	if((GORNTELLABOUTMEAT == TRUE) && (NOTTHANKSTELLALLMEAT == TRUE) && (Npc_HasItems(hero,ItFoMutton) >= 10))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodbeginend_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodBeginEnd_00_01 " );	// Here's some fried meat for you.
	B_GiveInvItems(other,self,ItFoMutton,10);
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_00_02 " );	// Thanks man! Now I'm finally hiring to satiety!
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_00_06 " );	// Now about my thanks... what do you want?
	if(MIS_BRINGFOOD == LOG_Running)
	{
		B_LogEntry( TOPIC_BRINGFOOD , " I brought Gorn the grilled meat he asked for. " );
	};
	Info_ClearChoices(dia_gorn_li_bringfoodbeginend);
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLNONEABOUTGOLD == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		Info_AddChoice(dia_gorn_li_bringfoodbeginend, " Let's get back to my missing gold then... " ,dia_gorn_li_bringfoodbeginend_missgold);
	};
	Info_AddChoice(dia_gorn_li_bringfoodbeginend, " Gold would be just right. " ,dia_gorn_li_bringfoodbeginend_gold);
	Info_AddChoice(dia_gorn_li_bringfoodbeginend, " Do you have anything special? " ,dia_gorn_li_bringfoodbeginend_special);
};

func void dia_gorn_li_bringfoodbeginend_missgold()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_00 " );	// Let's get back to my missing gold...
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_01 " );	// What happened to him anyway?
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_02 " );	// But I already told you that I don't know anything about it... (confused) What else do you want to hear from me?
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_05 " );	// Then tell me, which of the guys might know something about this?
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_06 " );	// I have no idea! But I believe that if anyone knows anything about what happened, it's only our captain.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_07 " );	// Really, I don't think he really cares about that right now.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_09 " );	// During a storm, he lost his compass somewhere on the ship, and now he only thinks about him.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_10 " );	// Judging by how upset he was, this thing was quite dear to him.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_15 " );	// I have nothing more to say to you.
	GORNTELLABOUTCOMPAS = TRUE;
	if(TorlofIsCaptain == TRUE)
	{
		B_LogEntry( TOPIC_MISSMYGOLD , " Gorn thinks that only our captain can know about the missing gold. He also mentioned that Torlof lost his compass somewhere on the ship during a storm. Maybe if I find it, Torlof will be more accommodating to the one I'm interested in topic. " );
	};
	if(JorgenIsCaptain == TRUE)
	{
		B_LogEntry( TOPIC_MISSMYGOLD , " Gorn thinks that only our captain can know about the missing gold. He also mentioned that Jorgen lost his compass somewhere on the ship during a storm. Maybe if I find it, Jorgen will be more accommodating to the one I'm interested in topic. " );
	};
	if(JackIsCaptain == TRUE)
	{
		B_LogEntry( TOPIC_MISSMYGOLD , " Gorn thinks that only our captain can know about the missing gold. He also mentioned that Jack lost his compass somewhere on the ship during a storm. Maybe if I find it, Jack will be more accommodating to the one I'm interested in topic. " );
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};

func void dia_gorn_li_bringfoodbeginend_gold()
{
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_00 " );	// Gold would be just right.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_01 " );	// As you say! Here, take it - there are exactly two thousand gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_04 " );	// And now I'll start stuffing my stomach with this delicious meat!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};

func void dia_gorn_li_bringfoodbeginend_special()
{
	AI_Output(other,self, " DIA_Gorn_LI_BringFoodBeginEnd_Special_00_00 " );	// Maybe you have something special?
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_Special_00_01 " );	// Hmmm... well, if only maybe this elixir.
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_Special_00_02 " );	// I took it with me before leaving for Irdorath, and so far I haven't used it!
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_Special_00_03 " );	// Here, take it.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Gorn_LI_BringFoodBeginEnd_Special_00_05 " );	// And now I'll start stuffing my stomach with this delicious meat!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};


instance DIA_GORN_LI_HALLO(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_hallo_condition;
	information = dia_gorn_li_hallo_info;
	permanent = TRUE;
	description = " Is everything all right now? " ;
};


func int dia_gorn_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_bringfoodbeginend))
	{
		return TRUE;
	};
};

func void dia_gorn_li_hallo_info()
{
	AI_Output(other,self, " DIA_Gorn_DI_Hallo_00_00 " );	// Is everything okay now?
	AI_Output(self,other, " DIA_Gorn_DI_Hallo_00_01 " );	// I guess so... (unhappily) At least I'm full now.
	AI_Output(self,other, " DIA_Gorn_DI_Hallo_00_03 " );	// But it's fucking boring here, mate! My hands are itching from idleness.
};


instance DIA_FIGHTER_LI_MISSMYGOLD(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_missmygold_condition;
	information = dia_fighter_li_missmygold_info;
	permanent = FALSE;
	description = " Where did my gold go? " ;
};


func int dia_fighter_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_fighter_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Fighter_LI_MissMyGold_01_01 " );	// Where did my gold go?
	AI_Output(self,other, " DIA_Fighter_LI_MissMyGold_01_04 " );	// I... have nothing to do with it! Better ask other guys about it.
	GORNTELLNONEABOUTGOLD = TRUE;
	B_LogEntry( TOPIC_MISSMYGOLD , "The Gorn said he didn't know anything about my missing gold. " );
};


instance DIA_FIGHTER_LI_AWAY(C_Info)
{
	npc = pc_fighter_li;
	nr = 3;
	condition = dia_fighter_li_away_condition;
	information = dia_fighter_li_away_info;
	permanent = FALSE;
	description = " Time to get back to the ship. " ;
};


func int dia_fighter_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (GORNLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Fighter_LI_Away_01_01 " );	// Time to get back to the ship.
	AI_Output(self,other, " DIA_Fighter_LI_Away_01_02 " );	// Why else?
	AI_Output(other,self, " DIA_Fighter_LI_Away_01_03 " );	// We have finished repairing the ship and are ready to sail from the island.
	AI_Output(self,other, " DIA_Fighter_LI_Away_01_04 " );	// Finally! I thought we were stuck here forever.
	B_LogEntry( TOPIC_GATHERCREW , " I informed Gorn that we were weighing anchor. He was delighted with the news. " );
	GORNLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if (( MILTENLIONBOARD  ==  TRUE ) && ( MILTENLIHERE  ==  TRUE ))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_findmagicorecave_condition;
	information = dia_fighter_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_fighter_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Fighter_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Fighter_LI_FindMagicOreCave_01_02 " );	// Really? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Fighter_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_FIGHTER_LI_CHANGECOURSE(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_changecourse_condition;
	information = dia_fighter_li_changecourse_info;
	permanent = FALSE;
	description = " We need to get back to Khorinis. " ;
};


func int dia_fighter_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_fighter_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Fighter_LI_ChangeCourse_01_00 " );	// We need to get back to Khorinis.
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_01_01 " );	// Boy, what are you thinking?
	Info_ClearChoices(dia_fighter_li_changecourse);
	Info_AddChoice(dia_fighter_li_changecourse, " I want to inform the paladins about an ore deposit on the island. " ,dia_fighter_li_changecourse_ore);
	Info_AddChoice(dia_fighter_li_changecourse, " It's about gold. " ,dia_fighter_li_changecourse_gold);
};

func void dia_fighter_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Fighter_LI_ChangeCourse_Ore_01_01 " );	// We must help the paladins! We need to inform them about the magical ore that we found on this island.
	AI_Output(other,self, " DIA_Fighter_LI_ChangeCourse_Ore_01_04 " );	// This ore will give them at least some chance in the war against the orcs.
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_05 " );	// Hmmm. To be honest, buddy, nothing good will come of this venture for me!
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_07 " );	// Paladins are unlikely to win the war anyway. Too much power is not equal!
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_08 " );	// Besides, if we decide to go back to Khorinis, then we ourselves will probably have to deal with the same orcs.
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_09 " );	// I don't think the situation there has changed much during our absence.
	AI_Output(other,self, " DIA_Fighter_LI_ChangeCourse_Ore_01_11 " );	// Are you afraid of orcs?
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_12 " );	// (indignantly) What else! Yes, I would love to finish off a couple of dozen of these creatures!
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_13 " );	// And so for a long time already my hands have been itching to grab hold of my ax again.
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Ore_01_15 " );	// Oh, okay... (grouchily) I'm with you!
	; _ _ _ _ _ _
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_fighter_li_changecourse);
};

func void dia_fighter_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Fighter_LI_ChangeCourse_Gold_01_01 " );	// It's about gold.
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Gold_01_02 " );	// Well, if that's the case, then I'm with you anyway. Extra gold never hurts!
	AI_Output(self,other, " DIA_Fighter_LI_ChangeCourse_Gold_01_03 " );	// And I haven't killed orcs for a long time! His hands are already itching to get a firmer grip on his ax again.
	B_LogEntry( TOPIC_CHANGECOURSE , " Gorn agrees to go back to Khorinis. Like all mercenaries, he is very fond of gold. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_fighter_li_changecourse);
};

