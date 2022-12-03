

instance DIA_GORNAVID_EXIT(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 999;
	condition = dia_gornavid_exit_condition;
	information = dia_gornavid_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornavid_exit_condition()
{
	return TRUE;
};

func void dia_gornavid_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_gornavid_PICKPOCKET(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 900;
	condition = dia_gornavid_PICKPOCKET_Condition;
	information = dia_gornavid_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_gornavid_PICKPOCKET_Condition()
{
	return  C_Robbery ( 15 , 35 );
};

func void dia_gornavid_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
	Info_AddChoice(dia_gornavid_PICKPOCKET,Dialog_Back,dia_gornavid_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornavid_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornavid_PICKPOCKET_DoIt);
};

func void dia_gornavid_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
};

func void dia_gornavid_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
};

instance DIA_GORNAVID_WHOYOU(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 1;
	condition = dia_gornavid_whoyou_condition;
	information = dia_gornavid_whoyou_info;
	permanent = FALSE;
	description = " I'm new here. Who are you? " ;
};


func int dia_gornavid_whoyou_condition()
{
	if(PSI_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornavid_whoyou_info()
{
	AI_Output(other,self, " DIA_GorNaVid_WhoYou_01_00 " );	// I'm new here. Who are you?
	AI_Output(self,other, " DIA_GorNaVid_WhoYou_01_01 " );	// My name is Gor Na Vid.
	AI_Output(other,self, " DIA_GorNaVid_WhoYou_01_02 " );	// Tell me, do you need faithful people?
	AI_Output(self,other, " DIA_GorNaVid_WhoYou_01_03 " );	// Faithful people are always needed. But you have to seriously work on yourself.
	AI_Output(self,other, " DIA_GorNaVid_WhoYou_01_04 " );	// Only the best of the best can become Guardians.
	AI_Output(self,other, " DIA_GorNaVid_WhoYou_01_05 " );	// This is the highest honor for any follower of our Brotherhood.
};


instance DIA_GORNAVID_BECOMETPL(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 1;
	condition = dia_gornavid_becometpl_condition;
	information = dia_gornavid_becometpl_info;
	permanent = TRUE;
	description = " I want to be a Guardian too, just like you. " ;
};


func int dia_gornavid_becometpl_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornavid_whoyou) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_gornavid_becometpl_info()
{
	AI_Output(other,self, " DIA_GorNaVid_BecomeTPL_01_00 " );	// I also want to become a Guardian, just like you.
	AI_Output(self,other, " DIA_GorNaVid_BecomeTPL_01_01 " );	// Do you know what I had to give up before I could stand guard over the peace of the elect?
	AI_Output(self,other, " DIA_GorNaVid_BecomeTPL_01_02 " );	// Don't think that you can easily get to this place and get proper honor and respect.
	AI_Output(self,other, " DIA_GorNaVid_BecomeTPL_01_03 " );	// Before talking about this, you should know a little about our teachings.
	AI_Output(self,other, " DIA_GorNaVid_BecomeTPL_01_04 " );	// This will take some time and may bring you back to your senses.
};


instance DIA_GORNAVID_ABWEISEND (C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 2;
	condition = dia_gornavid_repellent_condition;
	information = dia_gornavid_repellent_info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int dia_gornavid_forbidding_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornavid_whoyou) && (GORNAVIDTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornavid_repellent_info()
{
	AI_Output(other,self, " DIA_GorNaVid_Abweisend_01_00 " );	// Can you teach me something?
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_01 " );	// I only train Guardians!
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_02 " );	// Guru training is not my area of ​​expertise. You'd better talk to the Idols about this.
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_03 " );	// I only train Guardians!
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_04 " );	// If you want to join us, you should talk to Gor Na Kosh about it. He is the leader among us.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_05 " );	// You did the right thing by contacting me.
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_06 " );	// You really have a lot to learn from me.
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_07 " );	// Traditionally, the main weapon of the Guardians is a two-handed sword. However, at the same time, one should not forget about the technique of long-range combat.
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_08 " );	// I won't say I'm good at archery. But here's what I really know a lot about - it's the technique of shooting from a crossbow.
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_09 " );	// If you have enough experience and a desire to practice this skill, then I am at your service.
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_10 " );	// Just let me know and we'll start training you.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry( TOPIC_ADDON_TPLTEACHER , " Gor Na Vid can teach me some lessons with ranged weapons. " );
		GORNAVIDTEACH = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_11 " );	// I only train Guardians, and you don't even belong to our camp!
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_12 " );	// Sorry, but I can't help you.
	}
	else
	{
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_13 " );	// Get lost!
		AI_Output(self,other, " DIA_GorNaVid_Abweisend_01_14 " );	// Strangers don't belong here!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNAVID_TEACH(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 3;
	condition = dia_gornavid_teach_condition;
	information = dia_gornavid_teach_info;
	permanent = TRUE;
	description = " I want to learn from you. " ;
};


func int dia_gornavid_teach_condition()
{
	if((GORNAVIDTEACH == TRUE) && ((other.HitChance[NPC_TALENT_CROSSBOW] < 100) || (other.HitChance[NPC_TALENT_BOW] < 60)))
	{
		return TRUE;
	};
};

func void dia_gornavid_teach_info()
{
	AI_Output(other,self, " DIA_GorNaVid_Teach_15_00 " );	// I want to learn from you.
	AI_Output(self,other, " DIA_GorNaVid_Teach_09_01 " );	// Good! Let's start training.
	Info_ClearChoices(dia_gornavid_teach);
	Info_AddChoice(dia_gornavid_teach,Dialog_Back,dia_gornavid_teach_back);
	Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gornavid_teach_crossbow_1);
	Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_gornavid_teach_crossbow_5);
};

func void dia_gornavid_teach_back()
{
	Info_ClearChoices(dia_gornavid_teach);
};

func void b_gornavid_teachnomore1()
{
	AI_Output(self,other, " B_GorNaVid_TeachNoMore1_09_00 " );	// You already know everything there is to know.
};

func void b_gornavid_teachnomore2()
{
	AI_Output(self,other, " B_GorNaVid_TeachNoMore2_09_00 " );	// I have nothing more to teach you.
};

func void b_gornavid_teachnomore3()
{
	AI_Output(self,other, " B_GorNaVid_TeachNoMore3_09_00 " );	// You already know the basics, there's no time for more.
};

func void b_gornavid_teachnomore4()
{
	AI_Output(self,other, " B_GorNaVid_TeachNoMore4_09_00 " );	// To perfect bow handling, you must find a real teacher.
};

func void dia_gornavid_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);

	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		b_gornavid_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_gornavid_teachnomore2();
		};
	}
	else
	{
		Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gornavid_teach_crossbow_1);
	};
};

func void dia_gornavid_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);

	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		b_gornavid_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_gornavid_teachnomore2();
		};
	}
	else
	{
		Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_gornavid_teach_crossbow_5);
	};
};
