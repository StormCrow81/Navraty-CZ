
instance DIA_Addon_Myxir_EXIT(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 999;
	condition = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_Hallo (C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Hallo_Condition;
	information = DIA_Addon_Myxir_Hallo_Info;
	description = " Is everything okay? " ;
};


func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_Hallo_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Addon_Myxir_Hallo_12_01 " );	// Showing up here was a very brave act of you.
};


instance DIA_Addon_Myxir_WasMachstDu (C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_WasMachstDu_Condition;
	information = DIA_Addon_Myxir_WasMachstDu_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_WasMachstDu_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Myxir_WasMachstDu_12_01 " );	// I study the language of architects.
	AI_Output(self,other, " DIA_Addon_Myxir_WasMachstDu_12_02 " );	// Language is the key to understanding these people.
	AI_Output(self,other, " DIA_Addon_Myxir_WasMachstDu_12_03 " );	// Each of us must learn this language, otherwise the expedition will end before it even starts.
	AI_Output(self,other, " DIA_Addon_Myxir_WasMachstDu_12_04 " );	// Architects carved their texts on stone tablets. Unfortunately, many of them have long been broken or stolen.
};


instance DIA_Addon_Myxir_Steintafeln (C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Steintafeln_Condition;
	information = DIA_Addon_Myxir_Steintafeln_Info;
	description = " What can you learn from these tablets? " ;
};


func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_Steintafeln_15_00 " );	// What can you learn from these tablets?
	AI_Output(self,other, " DIA_Addon_Myxir_Steintafeln_12_01 " );	// They contain the knowledge of the ancient people.
	AI_Output(self,other, " DIA_Addon_Myxir_Steintafeln_12_02 " );	// Some of them magically increase magical or combat abilities.
	AI_Output(self,other, " DIA_Addon_Myxir_Steintafeln_12_03 " );	// For those who can read them, they are a real treasure.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates, " The stone tablets contain the ancient knowledge of the architects. Some of them can magically increase the knowledge of combat or magic. However, they still need to be able to read. " );
};


instance DIA_Addon_Myxir_WillYouTeachMe(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 10;
	condition = DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information = DIA_Addon_Myxir_WillYouTeachMe_Info;
	description = " Can you teach me the language of the Architects? " ;
};


func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_WillYouTeachMe_15_00 " );	// Can you teach me the language of the Builders?
	AI_Output(self,other, " DIA_Addon_Myxir_WillYouTeachMe_12_01 " );	// Of course, why not? I will gladly share my knowledge with you.
	Myxir_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Stoneplates,LogText_Addon_MyxirTeach);
};

var int DIA_Addon_Myxir_Teach_NoPerm;
var int DIA_Addon_Myxir_Teach_OneTime;

instance DIA_Addon_Myxir_Teach(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 90;
	condition = DIA_Addon_Myxir_Teach_Condition;
	information = DIA_Addon_Myxir_Teach_Info;
	permanent = TRUE;
	description = " Teach me this language. " ;
};

func int DIA_Addon_Myxir_Teach_Condition()
{
	if (( Myxir_Addon_Teach_Player ==  TRUE ) && ( DIA_Myxir_Addon_Teach_NoPerm ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_TeachRequest_15_00 " );	// Teach me this language.

	if(DIA_Addon_Myxir_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_Teach);
		Info_AddChoice(DIA_Addon_Myxir_Teach,Dialog_Back,DIA_Addon_Myxir_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachNoMore_12_00 " );	// I have nothing more to show you. You have learned the language of architects.
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_00 " );	// Well, let's start with something simple. Let us first deal with the language of the peasants.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_01 " );	// As a rule, texts written in the language of peasants are connected with our world, with such concepts as work, love, food production.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL1_12_02 " );	// This is the main language of the city. You can read most of the texts you find here if you master it.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_00 " );	// You are already familiar with the language of the peasants. The language of the warriors is a bit more complex.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL2_12_01 " );	// Texts written in the language of warriors mainly deal with wars and weapons. You will learn something useful.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_00 " );	// The high calm of the priests is hard to understand. But I'll gladly teach it to you.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_01 " );	// Among other things, the sacred books that describe the history and magic of the creators are written in the language of the priests.
		AI_Output(self,other, " DIA_Addon_Myxir_TeachL3_12_02 " );	// Each of these texts is a real treasure, if, of course, you can understand it.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};


instance DIA_ADDON_MYXIR_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 1;
	condition = dia_addon_myxir_prayforgomez_condition;
	information = dia_addon_myxir_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_myxir_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_prayforgomez_info()
{
	AI_Output(other,self, " DIA_Addon_Myxir_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Myxir_PrayForGomez_01_02 " );	// Talk to Saturas about this.
	AI_Output(self,other, " DIA_Addon_Myxir_PrayForGomez_01_03 " );	// I think he can help you.
	SENTTOSATURASGOMEZ = TRUE ;
};

