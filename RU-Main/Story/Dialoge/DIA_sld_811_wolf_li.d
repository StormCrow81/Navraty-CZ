

instance DIA_WOLF_LI_EXIT(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 999;
	condition = dia_wolf_li_exit_condition;
	information = dia_wolf_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_wolf_li_exit_condition()
{
	return TRUE;
};

func void dia_wolf_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_LI_TRAINING(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 10;
	condition = dia_wolf_li_training_condition;
	information = dia_wolf_li_training_info;
	permanent = TRUE;
	description = " Train me at shooting. " ;
};


func int dia_wolf_li_training_condition()
{
	return TRUE;
};

func void dia_wolf_li_training_info()
{
	AI_Output(other,self, " DIA_Wolf_DI_Training_15_00 " );	// Teach me how to shoot.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//Из чего?
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_back()
{
	Info_ClearChoices(dia_wolf_li_training);
};

func void dia_wolf_li_training_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_BOW_1_08_00 " );	// Unlike a crossbow, a bow is bulky and takes up a lot of space. Look what you had enough of during the battle.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_BOW_5_08_00 " );	// String with ease when you shoot an arrow. A clumsy finger gives the arrow the wrong trajectory.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_crossbow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_CROSSBOW_1_08_00 " );	// Try not to loosen the crossbow when shooting. To do this, carefully pull the trigger.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_crossbow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other, " DIA_Wolf_DI_Training_CROSSBOW_5_08_00 " );	// A smart shooter always pays attention to the wind and doesn't shoot against it.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};


instance DIA_WOLF_LI_PICKPOCKET(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 900;
	condition = dia_wolf_li_pickpocket_condition;
	information = dia_wolf_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_wolf_li_pickpocket_condition()
{
	return  C_Robbery ( 32 , 45 );
};

func void dia_wolf_li_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_li_pickpocket);
	Info_AddChoice(dia_wolf_li_pickpocket,Dialog_Back,dia_wolf_li_pickpocket_back);
	Info_AddChoice(dia_wolf_li_pickpocket,DIALOG_PICKPOCKET,dia_wolf_li_pickpocket_doit);
};

func void dia_wolf_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_wolf_li_pickpocket);
};

func void dia_wolf_li_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_li_pickpocket);
};


instance DIA_WOLF_LI_MISSMYGOLD(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_missmygold_condition;
	information = dia_wolf_li_missmygold_info;
	permanent = FALSE;
	description = " I have a question. " ;
};


func int dia_wolf_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_wolf_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Wolf_LI_MissMyGold_01_01 " );	// I have a question.
	AI_Output(other,self, " DIA_Wolf_LI_MissMyGold_01_03 " );	// Where did my gold go?
	AI_Output(self,other, " DIA_Wolf_LI_MissMyGold_01_04 " );	// I have no idea. Ask other guys about it.
	B_LogEntry( TOPIC_MISSMYGOLD , " Mercenary Wolf knows nothing about missing gold. " );
};


instance DIA_WOLF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_findmagicorecave_condition;
	information = dia_wolf_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_wolf_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Wolf_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Wolf_LI_FindMagicOreCave_01_02 " );	// Really? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Wolf_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_WOLF_LI_CHANGECOURSE(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_changecourse_condition;
	information = dia_wolf_li_changecourse_info;
	permanent = FALSE;
	description = " Would you mind heading back to Khorinis? " ;
};


func int dia_wolf_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_wolf_li_changecourse_info()
{
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_01_00 " );	// Would you like to go back to Khorinis?
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_01_01 " );	// Hmmm...(thoughtfully) Why do you ask?
	Info_ClearChoices(dia_wolf_li_changecourse);
	Info_AddChoice(dia_wolf_li_changecourse, " Go back to the island and help the paladins. " ,dia_wolf_li_changecourse_ore);
	Info_AddChoice(dia_wolf_li_changecourse, " There is a good opportunity to earn good money. " ,dia_wolf_li_changecourse_gold);
};

func void dia_wolf_li_changecourse_ore()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_Ore_01_01 " );	// We need to get back to the island and help the paladins!
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Ore_01_02 " );	// (surprised) Paladins? And you think we should go back for that?
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_Ore_01_03 " );	// We need to tell them about the ore we found on this island.
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_Ore_01_04 " );	// This will give them a slight advantage in the war against the orcs.
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Ore_01_05 " );	// Sorry mate, but I'm against the idea!
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Ore_01_06 " );	// I have no desire to risk my own skin for what interests me the least.
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Ore_01_07 " );	// Plus, I've had enough of the years I've spent in the Valley of Mines mining ore for these idiots.
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Ore_01_08 " );	// Let the paladins take care of their own fate. And don't count on my help.
	B_LogEntry( TOPIC_CHANGECOURSE , " Mercenary Wolf has categorically abandoned the idea of ​​sailing back to Khorinis to help the paladins. " );
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_wolf_li_changecourse);
};

func void dia_wolf_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_Gold_01_01 " );	// There is an opportunity to make good money.
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Gold_01_02 " );	// Really? And how?
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_Gold_01_03 " );	// We need to return to the island and inform the paladins about the ore we found on this island.
	AI_Output(other,self, " DIA_Wolf_LI_ChangeCourse_Gold_01_04 " );	// I think they'll have to shell out a lot to find out where this island is.
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Gold_01_05 " );	// (snickeringly) Great idea, mate! I really like her.
	AI_Output(self,other, " DIA_Wolf_LI_ChangeCourse_Gold_01_08 " );	// Since this is the case, let's sail back to Khorinis!
	B_LogEntry( TOPIC_CHANGECOURSE , " Mercenary Wolf supported the idea of ​​sailing back to Khorinis to demand gold from the paladins for the magic ore we found. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
	Info_ClearChoices(dia_wolf_li_changecourse);
};

