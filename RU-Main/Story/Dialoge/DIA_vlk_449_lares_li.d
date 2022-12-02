

instance DIA_LARES_LI_EXIT(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 999;
	condition = dia_lares_li_exit_condition;
	information = dia_lares_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lares_li_exit_condition()
{
	return TRUE;
};

func void day_lares_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_LI_TRAINING(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 10;
	condition = dia_lares_li_training_condition;
	information = dia_lares_li_training_info;
	permanent = TRUE;
	description = " Teach me your powers. " ;
};


func int dia_lares_li_training_condition()
{
	return TRUE;
};

func void dia_lares_li_training_info()
{
	AI_Output(other,self, " DIA_Lares_DI_Training_15_00 " );	// Teach me your abilities.
	AI_Output(self,other, " DIA_Lares_DI_Training_09_01 " );	// No problem.
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_back()
{
	Info_ClearChoices(dia_lares_li_training);
};

func void dia_lares_li_training_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_1H_1_09_00 " );	// You need to bend your front leg a little and straighten your back. That way you'll be in the right position.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_1H_5_09_00 " );	// Don't tense your hips, this will allow you to dodge a counterattack in time.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_dex_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_DEX_1_09_00 " );	// Your upper torso must act in concert with your lower torso.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_dex_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other, " DIA_Lares_DI_Training_DEX_5_09_00 " );	// Always watch your feet.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};


instance DIA_LARES_LI_MISSMYGOLD (C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_missmygold_condition;
	information = dia_lares_li_missmygold_info;
	permanent = FALSE;
	description = " Do you happen to know where my gold is? " ;
};


func int dia_lares_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void day_lares_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Lares_LI_MissMyGold_01_01 " );	// Do you happen to know where my gold is?
	AI_Output(self,other, " DIA_Lares_LI_MissMyGold_01_02 " );	// No, buddy... (smiles) I haven't even seen him!
	B_LogEntry( TOPIC_MISSMYGOLD , " Lares does not know about the missing gold from the ship's hold. " );
};


instance DIA_LARES_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_findmagicorecave_condition;
	information = dia_lares_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_lares_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Lares_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Lares_LI_FindMagicOreCave_01_02 " );	// True? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Lares_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_LARES_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_changecourse_condition;
	information = dia_lares_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lares_li_changecourse_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_00 " );	// I heard that you want to return to Khorinis?
	AI_Output(other,self, " DIA_Lares_LI_ChangeCourse_01_01 " );	// Yes, that's true. I just wanted to talk to you about this.
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_02 " );	// Well, if you want to know my opinion, then I will follow your decisions.
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_05 " );	// In my life, I've rarely met people like you.
	AI_Output(other,self, " DIA_Lares_LI_ChangeCourse_01_06 " );	// True? Am I somehow different from the rest?
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_09 " );	// (laughs) Sometimes your actions are completely unpredictable and carry a hidden meaning that is inaccessible to my understanding.
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_10 " );	// Sometimes it seems to me that the gods themselves determine your path and lead you along it!
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_12 " );	// Do you remember when we first met?
	AI_Output(other,self, " DIA_Lares_LI_ChangeCourse_01_13 " );	// Yes, I remember. It happened in the New Camp...
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_14 " );	// Yes. So... Even then I subconsciously felt that there is something in you that distinguished you from other people. And I turned out to be right!
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_15 " );	// First you overthrew the Sleeper and destroyed the magical barrier! Then you somehow managed to destroy the Raven, preventing him from bringing dark evil into this world.
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_16 " );	// And, finally, you almost single-handedly accomplished what even the entire army of paladins could not do - kill the creature in which all the power of the Dark God was concentrated!
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_17 " );	// Doesn't this all say a lot?
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_18 " );	// And now you decide to return to Khorinis. To be honest, I can't even imagine how this could all end.
	AI_Output(other,self, " DIA_Lares_LI_ChangeCourse_01_21 " );	// I think we'll find out when we arrive in Khorinis.
	AI_Output(self,other, " DIA_Lares_LI_ChangeCourse_01_22 " );	// You're right. It's all a matter of time...
	B_LogEntry( TOPIC_CHANGECOURSE , " Lares doesn't care if we go back to Khorinis or sail to the mainland. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
};

